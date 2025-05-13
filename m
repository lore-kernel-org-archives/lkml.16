Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C548A19F111
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 14:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747148302; cv=none; b=JCG+rrjnCWFf/qGpki8FIZDuPoHKoxlVe4FX0UDSfL9tQ5dQ66f0cPN8+/xBHH/H/NftB5QSoBLI9m9gnwmTnsZtg838y8xn5j+dkYDC9XUs11BDwhwypEEgr1m9FC2PqzS17+rZsUoduihyZjEDaNyiqLi2o1XRliUD78S3EvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747148302; c=relaxed/simple;
	bh=JqTC3BGbb0nbOrUQHIxvCQgLWLSvuEf+V7Yydzvcvkg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BsHWU0kD890a+QEjGLxwWtxeOERQqCecie1qhHtxw9hqMonV3+un9wTe2w63YsSFGIv7gK2mOHuxu3ybyVhIxvxCG4+2eigmPth2zjmpBDV9RvYQljJAvMOX7C6mc0O22IT/AdGzIqzZefpL3qFRemgf0vTSKk4NnOYIJEkScUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lmXuQx6u; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lmXuQx6u"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3d96836c1c2so252795ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 07:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747148300; x=1747753100; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXV6rGOzhOjbH4KSoBxHHLvbhUqIaW6r+dtFnVgKyF0=;
        b=lmXuQx6u793jg2iePvmPllvsaLggPgxLMnBe83AVeII1okXoOZX0/8D6grJWBpPwim
         6hmEoqEVLF6MZS9zmgZNtGxiMPeqlF6m5ead0L4O7nwKHNPyZUsWImEALR11i0ng0Lf0
         RmFTcSy6n3sCtnilKOpVcAvBXToB5CD/MBgDF65FpgKfY+9Zf1paN4zoU9A2sgsn/7+Z
         91sNw3+tUrTg5wG2Rtket31+zDM8ce8y6V5kRrIJpGEzIbl2AlWdd+dukldbG1teOB/m
         1v9kwsIqzbbvEMXl67hxDg75nx3mrfydFKM7n0sNQ4n4r39SlxwIe14d6T51Kq0h0v1w
         dw5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747148300; x=1747753100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DXV6rGOzhOjbH4KSoBxHHLvbhUqIaW6r+dtFnVgKyF0=;
        b=CEeDl809gnRQaeyr4OcGdvIxLMCxnmtsHIdX2el/HBFdoiL4IK0/Io1vIloFEA5CHs
         jtS6n3lTtZLTTcqGXouaIxbZz5SmTO9daob/msGxB/JT7KjrEf4BdUnyz6F1XsqeXi8A
         V5N0dXh6FhzJ4GLlMsQBUbL/ewumzy/VrMyNAjXJGDgzgFprska6JTCG1TvL30CUhyJO
         1YzRIdMBMdvow3kc7BS+ZdTEfF+ekjUH2YA77QLpznUkyDFw7GFyRCSDIf4hJvrK2Utd
         V+ZFeMW61N0BC5rnVJe18kr9GHo5NB98A+OJl86QLizN1jL1p8MOkWAcNm7p2n0+PBq6
         Sc9w==
X-Forwarded-Encrypted: i=1; AJvYcCX059BkYR6FvOVo+O9cF/XJcPQcVHMuQ0UtT5qVm/HHotxEUwUH2dJbZQMLppsprHockW9huq+x/3T1Im8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHLhVNhCH476IKNXdUrp7Dg2Utuo6+2g9WrSuNOCIWckIDUhyO
	fB4Tq56e/7nfDPzYImIiEaq2W0Nl6KT2rXFaKhxsdbiVOMYsh7X/BkVGS6mmwjjesatFRlZv4Ld
	wOOIoGC5/UjDtxoTifcRtkozhIwzrqVMEKQMJ/9/w
X-Gm-Gg: ASbGncsd0UwEEhcCKOV5i9ei2HBY49/6hpDCuzoRQBAdC2ieOctq3d9N9XPI5cw2xn8
	n1zmDPqGdW6Vk5IU83EMQ+dvSoPIgOzeTlfdGgot2ELuwUkYAzjelEBWuQCk0Ux74DVtvyb3kub
	H0JM9Wcq+CNudUYQbbDSymxWYv61WqdUbB+7F5SoY3EM4DbLmZSWKmRwcIqnMczw==
X-Google-Smtp-Source: AGHT+IFK74YAzPK/2XQ58hBmCKvFGAxf89UlU/azlRsUxsItXZMngvRP7/Mn3+wBzfBWnTKfL2QzaCSlEKyG1ULROg0=
X-Received: by 2002:a05:6e02:2506:b0:3d9:6e55:2aae with SMTP id
 e9e14a558f8ab-3db667d80b5mr4253945ab.0.1747148299502; Tue, 13 May 2025
 07:58:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250509213017.204343-1-namhyung@kernel.org>
In-Reply-To: <20250509213017.204343-1-namhyung@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Tue, 13 May 2025 07:58:07 -0700
X-Gm-Features: AX0GCFuXnBdde5IZ_y_HUko44m0fp0BzcYQwhwUpRfcS87hhnBK778lZDYutM-o
Message-ID: <CAP-5=fVQ1L2yD3F+XLg4-U57wVVDFhkfb3QRD34ie01JjmijJQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] perf test: Fix LBR test by ignoring idle task
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Kan Liang <kan.liang@linux.intel.com>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 2:30=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> w=
rote:
>
> I found 'perf record LBR tests' failing due to empty branch stacks.
>
>   $ perf test -v LBR
>   ...
>   LBR system wide any branch test
>   Lowering default frequency rate from 4000 to 1000.
>   Please consider tweaking /proc/sys/kernel/perf_event_max_sample_rate.
>   [ perf record: Woken up 8 times to write data ]
>   [ perf record: Captured and wrote 3.142 MB /tmp/__perf_test.perf.data.d=
gSBl (3572 samples) ]
>   LBR system wide any branch test: 3572 samples
>   LBR system wide any branch test [Failed empty br stack ratio exceed 2%:=
 3%]
>   LBR system wide any call test
>   Lowering default frequency rate from 4000 to 1000.
>   Please consider tweaking /proc/sys/kernel/perf_event_max_sample_rate.
>   [ perf record: Woken up 8 times to write data ]
>   [ perf record: Captured and wrote 3.337 MB /tmp/__perf_test.perf.data.d=
gSBl (3967 samples) ]
>   LBR system wide any call test: 3967 samples
>   LBR system wide any call test [Failed empty br stack ratio exceed 2%: 9=
%]
>   ...
>
> The failing cases were in system-wide mode and I realized that the
> samples were from the idle tasks (swapper).  I suspect going to/from
> idle state may affect the LBR contents.
>
> If we can skip empty branch stacks from the idle tasks, the failure
> should go away.  I can see the following output in perf report -D.
>
>   $ perf report -D | grep -m5 -A3 'branch stack: nr:0'
>   ...
>   --
>   ... branch stack: nr:0
>    ... thread: swapper:0
>    ...... dso: /proc/kcore
>
>   --
>   ... branch stack: nr:0
>    ... thread: swapper:0
>    ...... dso: /proc/kcore
>
>   --
>   ... branch stack: nr:0
>    ... thread: DefaultEventMan:10282
>    ...... dso: /proc/kcore
>
>   --
>   ... branch stack: nr:0
>    ... thread: swapper:0
>    ...... dso: /proc/kcore
>
>   --
>   ... branch stack: nr:0
>    ... thread: swapper:0
>    ...... dso: /proc/kcore
>
>   $ perf report -D | grep -c 'branch stack: nr:0'
>   145
>
>   $ perf report -D | grep -A3 'branch stack: nr:0' | grep thread | grep -=
c swapper
>   i36
>
>   $ perf report -D | grep -A3 'branch stack: nr:0' | grep thread | grep -=
cv swapper
>   9
>
> Signed-off-by: Namhyung Kim <namhyung@kernel.org>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/tests/shell/record_lbr.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/tests/shell/record_lbr.sh b/tools/perf/tests/shel=
l/record_lbr.sh
> index 8d750ee631f877fd..afad02d0180e023c 100755
> --- a/tools/perf/tests/shell/record_lbr.sh
> +++ b/tools/perf/tests/shell/record_lbr.sh
> @@ -93,7 +93,7 @@ lbr_test() {
>      return
>    fi
>
> -  zero_nr=3D$(echo "$out" | grep -c 'branch stack: nr:0' || true)
> +  zero_nr=3D$(echo "$out" | grep -A3 'branch stack: nr:0' | grep thread =
| grep -cv swapper || true)
>    r=3D$(($zero_nr * 100 / $bs_nr))
>    if [ $r -gt $threshold ]; then
>      echo "$test [Failed empty br stack ratio exceed $threshold%: $r%]"
> --
> 2.49.0.1015.ga840276032-goog
>
