Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDEE1EE00F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 19:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743537125; cv=none; b=gy4YBbkwvqMGTTnXc06hR8uAX+tIBdAK9Lq1uwZYOMeAxhS64W5wyyE4V5emlgSpojLoxnBnwOxatois+o9pJPLIlGU3uVLTG6oXxtZRsc1mr9wVNkvyW64BqaVq/61Ue0nVWfazzydPak83zaO8W1CcqrB1lNg630XE37AnU48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743537125; c=relaxed/simple;
	bh=HBVCsMjwhagVF9bHprIKvy3EcALit1txGQEuXfYmHJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n2wQ5sEZYgzVq9ZLuEvm92hie0017UNNkj4TwtFXow6OXGiqoGM+Skvp/3S+CQRwx3652WaBtkbSNb6f5f741EJvAtJEWAfBGxPT9bc62YtoLyo6yk+J/BQD5WMp9DZpiKS2wtIP+4MJXZVasx8IoEGS0eIQRRraFvBsds9jq0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=whVtvD9b; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="whVtvD9b"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2264c9d0295so44075ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 12:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743537123; x=1744141923; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wvg7AtAX1KW+3uuTaJxVJWtdk1rMU/xzREvyAUI5nAk=;
        b=whVtvD9bfGPC3aOoQUXc8c4fd8FaneFBwth+ITz7R8DOwFKYRo4GYZGcRBYI7vlT3o
         slJ8Gb6MdfiIDVCq9YeyHTe3nBMu5BYh98+IkwGT1WDdfElRmHUbkL4kGA3ZDPaEvvyd
         brQr9ziTl3ud41X5l37rrOyPaYNk2yX+om9rT4f34AHk3tu0/kx1+4mJikZhDfBvRCAz
         8+Or+JYCEQTmUcRZ64Xa60+IV4CL8oT7UTAFVnCa9BqqHap8HHX6qdqrnu+ar8M2ti9S
         YXSsabYVvzTG/xHXSkawZxaNcglzRmTokFOsSRvXZ1T37yb+On+zvubRQcftpfOvshRe
         Lq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743537123; x=1744141923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wvg7AtAX1KW+3uuTaJxVJWtdk1rMU/xzREvyAUI5nAk=;
        b=UqneNQy9ZmLUbChNIZh0dub1rj00W47W+2V34/Ff1FZfWUejoJOzQgrmydNGHN5zl/
         KbUXw3bErlDx6TYH3pTrLHe+iHtfj4zOfzqbKvXA9igmSCm6kDX4kuZpGnvJvuQKEjj8
         KcouImUv2+piPW8zYRwtJkXfiEzWUGP0AdGBExmSVOV+tFGFtepKBRI5Cmx8N4cHgSLc
         HmGjQhiusm5qbqHcHY6jDa1oyatxmlY+IMBq5sJ2/Pr+43PG0PI8wjLz9q+vSgmZsuoZ
         66MrifZCtLnqHg+LX5705t/XTtWNoeNA/eP6eWZPhzTVopYj0I/PMCkrXAL9jXfNoDDG
         5zxA==
X-Gm-Message-State: AOJu0Yxad5qkzszOo1dTTk99d441tmy7gq5jaV0Szs4eYYcYcZRJ3Ryu
	vU6m9ysv0pjXa343LH4zbetsPNpsNL3/CkvN4wVQKMHXJ9MZoilWy6pvYa2cOL0vmZXK8BMKnwV
	+VW4sAxka7Dw5BCGYglAhdu4Y5vOMk0vxest2
X-Gm-Gg: ASbGncsI3VhrPE22PvQnbIDXqU25ICIT69O/EhW1hF+mYBttnywpR85wGGnByrgHec6
	w+e4zuFT3eMNp+rzSZCbGlsz2p3nAaeJUcn+HaREFCcnoyilXpQdyC+c0DdgDNkVXnB/BBgghJq
	yHfBJ2PjXulkbSFQgFy0UdPZzYtHxenSo6pmmvyhgtH9JJ7PCnkvdZpCg=
X-Google-Smtp-Source: AGHT+IGJwpO5MFkGmODN4+fl3eKclN0wl04AX7pwf3uDmTFIP7WHazairBkwm0ouKuZDFtC1BPI7YXp/fWA0dcFcFPs=
X-Received: by 2002:a17:902:e5ca:b0:223:37ec:63be with SMTP id
 d9443c01a7336-22969dce57cmr591885ad.4.1743537122821; Tue, 01 Apr 2025
 12:52:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401172302.1442092-1-ctshao@google.com>
In-Reply-To: <20250401172302.1442092-1-ctshao@google.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 1 Apr 2025 12:51:50 -0700
X-Gm-Features: AQ5f1JpuuG3D6JpgPsqnmjovFyCHoGPB3Yi-_Icuq4yhjlMw7AEJLyPkno8ZWfY
Message-ID: <CAP-5=fUXV0f9n2T-V14ZWeqX9POY5VJOdMdJwYpD+GhO60CcYw@mail.gmail.com>
Subject: Re: [PATCH v1] perf test: Allow tolerance for leader sampling test
To: Chun-Tse Shao <ctshao@google.com>
Cc: linux-kernel@vger.kernel.org, Thomas Richter <tmricht@linux.ibm.com>, 
	peterz@infradead.org, mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	adrian.hunter@intel.com, kan.liang@linux.intel.com, james.clark@linaro.org, 
	dapeng1.mi@linux.intel.com, vmolnaro@redhat.com, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 1, 2025 at 10:23=E2=80=AFAM Chun-Tse Shao <ctshao@google.com> w=
rote:
>
> There is a known issue that the leader sampling is inconsistent, since
> throttle only affect leader, not the slave. The detail is in [1]. To
> maintain test coverage, this patch sets a tolerance rate of 80% to
> accommodate the throttled samples and prevent test failures due to
> throttling.
>
> [1] lore.kernel.org/20250328182752.769662-1-ctshao@google.com
>
> Signed-off-by: Chun-Tse Shao <ctshao@google.com>
> Suggested-by: Ian Rogers <irogers@google.com>
> Suggested-by: Thomas Richter <tmricht@linux.ibm.com>
> Tested-by: Thomas Richter <tmricht@linux.ibm.com>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/tests/shell/record.sh | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
>
> diff --git a/tools/perf/tests/shell/record.sh b/tools/perf/tests/shell/re=
cord.sh
> index ba8d873d3ca7..1bbe16fb3420 100755
> --- a/tools/perf/tests/shell/record.sh
> +++ b/tools/perf/tests/shell/record.sh
> @@ -238,22 +238,35 @@ test_leader_sampling() {
>      err=3D1
>      return
>    fi
> +  perf script -i "${perfdata}" | grep brstack > $script_output
> +  # Check if the two instruction counts are equal in each record.
> +  # However, the throttling code doesn't consider event grouping. During=
 throttling, only the
> +  # leader is stopped, causing the slave's counts significantly higher. =
To temporarily solve this,
> +  # let's set the tolerance rate to 80%.
> +  # TODO: Revert the code for tolerance once the throttling mechanism is=
 fixed.
>    index=3D0
> -  perf script -i "${perfdata}" > $script_output
> +  valid_counts=3D0
> +  invalid_counts=3D0
> +  tolerance_rate=3D0.8
>    while IFS=3D read -r line
>    do
> -    # Check if the two instruction counts are equal in each record
>      cycles=3D$(echo $line | awk '{for(i=3D1;i<=3DNF;i++) if($i=3D=3D"cyc=
les:") print $(i-1)}')
>      if [ $(($index%2)) -ne 0 ] && [ ${cycles}x !=3D ${prev_cycles}x ]
>      then
> -      echo "Leader sampling [Failed inconsistent cycles count]"
> -      err=3D1
> -      return
> +      invalid_counts=3D$(($invalid_counts+1))
> +    else
> +      valid_counts=3D$(($valid_counts+1))
>      fi
>      index=3D$(($index+1))
>      prev_cycles=3D$cycles
>    done < $script_output
> -  echo "Basic leader sampling test [Success]"
> +  if [[ "$(echo "scale=3D2; $invalid_counts/($invalid_counts+$valid_coun=
ts)" | bc)" > 1-$tolerance_rate ]]
> +  then
> +      echo "Leader sampling [Failed inconsistent cycles count]"
> +      err=3D1
> +  else
> +    echo "Basic leader sampling test [Success]"
> +  fi
>  }
>
>  test_topdown_leader_sampling() {
> --
> 2.49.0.472.ge94155a9ec-goog
>
