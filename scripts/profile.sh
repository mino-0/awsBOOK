#!/usr/bin/env bash

#쉬고있는 profile 찾기 : real1이 사용중이면 real2가 쉬고있고, 반대면 real1이 쉬고있는중

function find_idle_profile()
{
  RESPONSE_CODE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost/profile)

  if[ ${RESPONSE_CODE} - ge 400]   #400보다 크면(에러코드 400이상)
  then
    CURRENT_PROFILE = real2
  else
    CURRENT_PROFILE = $(curl -s http://localhost/profile)
  fi

  if[ ${CURRENT_PROFILE} == real ]
  then
    IDEL_PROFILE = real2
  else
    IDEL_PROFILE = real1
  fi

  echo "${IDEL_PROFILE}"
}

#쉬고 있는 profile의 포트찾기
function find_idle_port() {
  IDEL_PROFILE=$(find_idle_profile)

  if[${IDEL_PROFILE} == real]
  then
    echo "8081"
  else
    echo "8082"
  fi
}