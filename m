Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CB621147F
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 22:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747606703; cv=none; b=h3t2IpDjLNiJsheZNnbRzUEjtFghp+IVreiJGTGPm6bKswBlhKxWPsiTDTkGxVHf0yPppWFTmPV6Np06Egp+VqlFOEgS0WYd/j6GAeUN+hJkCG2BrC+A+peTNt4WqUJ5+2vemIbYUx3BhwT+5s1aXrA6b1Izp9jMwvYsdma6hno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747606703; c=relaxed/simple;
	bh=I8+4BoFseTpUC5p5dREwDoZE1M55RFCZPPjUHOqxWJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=je93D88ZAc578ZqSPNxyKKp353jsp7gqPi3GONa1jf+pZB2xQb+RIfu5c1NZ8oO/GoLEDqhE8wWYFqrmz++c+8EM6FOBAGyWs4aK5VQgfI1VhaOpQzqUnRuO0ZdOuNLfTOQjt8XT4mU/XmNyeiXF59t9r6L0JNBI+YT7PXHze0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EI9hsT3R; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EI9hsT3R"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3d96836c1c2so356375ab.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 15:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747606701; x=1748211501; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQgUPjhfbykhRFqJ+rojDwjKnCwN3XruuZ2QAR/D3Ms=;
        b=EI9hsT3RveNwVpzjGejmzUwjVk0Mxjj/Ip5gFuuLrNqjNN+FLTDIYBJIbpArGPXHOK
         YFlA5zRXqry1RDaaof+mZJGsgFd4Od1/YZ3xb9YVrkzVRf7gqdK7vG5+1yRjkcY9gSxn
         oXUHKVK0GM6DEwJ2YNMyrak2LSXZSmCRit3hzGgxwM1msg6C14ctSigwXlR0ZQsE/9kf
         09JFFpsrMo22RTne62BFSfZGBFHFRGqJrs2PDvhll4yKp9mUZ802TbWrhAZ0Ho9bN2GU
         8OyusXz4h2ByQ3+FIj5Crqo77A1MtQ4JRF/MdOE37l9tDkpc1iow8ydXy4Dx+jWnxF9Q
         0V6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747606701; x=1748211501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VQgUPjhfbykhRFqJ+rojDwjKnCwN3XruuZ2QAR/D3Ms=;
        b=DL/uy5GqKUnCI45qm12/MgE8B9HEhknLQvIMfycZDooyoYD9vsOtfyPF/+8QH30css
         hxT9yPxusYHJ1qKhN/taLoTmulWA2d56qs290XzSLGzW4BoUufsZvjoz87V//8b6WlcH
         l+bPiX6uzwnXvFVaNYNSLc3+Zrf1A9vD6HrFf4eegRQR70H+q2C3+QMZ9ngtsfwzai/B
         QJLxFC9mjZRlDn/772QQQ8wsOHg0D/KBX+GANtmZ4KhNdKYNPWHG+Ehl5of06XmkkdIe
         K3bq/ayMwLXKvVyJ6akWEHZ9o869mw98MED7ZL7hdQOFM1WM601EGRyUWK/3uYCKfyLz
         /3ng==
X-Forwarded-Encrypted: i=1; AJvYcCX9uYtc7Q+ZfH3XYRSbps1d7bTysQclUoM7pXYFMp07ABCiCyNfn5raytDBbQ8eUOMqCJb5MRMgQeUogQA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0fe/iJ5NRpoO3QaluhLPlnsrg8FbgZ4omTIbpVLgQusTwMcMy
	wDZGMENUIvXUB4tvGFaVd8W5gFgXPaFQADKnZx86WdMn1fmHqQJdEoidJXvZpw1mrRhvjPe3v7Z
	edfZS/MfSjRBgrEXGZUoihagKUjSzPASkTqAw7OO4
X-Gm-Gg: ASbGnctTOyW40p50pRW+xMAdLiYRgCPv8zbna5tyl7SnuhVQBorlJY2Uj+DMRSSk9W2
	g68C/hhdmCl/Mc7+0VGWeC3T6cCotPl69rLXtVSnvy+1kTno8oXYs0+fbXDulWvJxQZUOSZWcEn
	chyDUa+1IRqjUTJD9QSJmF8iZEvoKxyc7RgQ==
X-Google-Smtp-Source: AGHT+IGwu2Fx7PP8eSlcCey0Ju8HK/8zK8WzHwfKvTcQ1qf5yBjQ8fr7BB/Rcbj7QWnzrPs7rGUjYAD6GPfrH+kyWJ0=
X-Received: by 2002:a05:6e02:2184:b0:3db:8537:e450 with SMTP id
 e9e14a558f8ab-3dc5d6164acmr3742895ab.20.1747606700751; Sun, 18 May 2025
 15:18:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250518190957.58932-1-howardchu95@gmail.com>
In-Reply-To: <20250518190957.58932-1-howardchu95@gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Sun, 18 May 2025 15:18:09 -0700
X-Gm-Features: AX0GCFsPfGvCnVlcuNqoTuWtq-ixbng5DINM1ck4tJwl9EvemnlTbUW21Nhga_E
Message-ID: <CAP-5=fUs9ZVa3z54w1GyKrR=D0YF5GmSZEQ4dh=cKehTPD_w1g@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] perf test trace: Reduce test failures and make
 error messages verbose
To: Howard Chu <howardchu95@gmail.com>
Cc: acme@kernel.org, mingo@redhat.com, namhyung@kernel.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	adrian.hunter@intel.com, peterz@infradead.org, kan.liang@linux.intel.com, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 18, 2025 at 12:10=E2=80=AFPM Howard Chu <howardchu95@gmail.com>=
 wrote:
>
> Currently, BTF tests fail constantly, this series fixes two major reasons
> why they fail, and makes the error messages acquired when using '-vv'
> more verbose, so when they fail, one can easily diagnose the problem.
>
> Before:
>     $ sudo /tmp/perf test enum -vv
>     107: perf trace enum augmentation tests:
>     107: perf trace enum augmentation tests                              =
: Running
>     --- start ---
>     test child forked, pid 783533
>     Checking if vmlinux exists
>     Tracing syscall landlock_add_rule
>     Tracing non-syscall tracepoint syscall
>     ---- end(-1) ----
>     107: perf trace enum augmentation tests                              =
: FAILED!
>
> After:
>     $ sudo /tmp/perf test enum -vv
>     107: perf trace enum augmentation tests:
>     107: perf trace enum augmentation tests                              =
: Running
>     --- start ---
>     test child forked, pid 851658
>     Checking if vmlinux exists
>     Tracing syscall landlock_add_rule
>     Tracing non-syscall tracepoint timer:hrtimer_setup,timer:hrtimer_star=
t
>     [tracepoint failure] Failed to trace tracepoint timer:hrtimer_setup,t=
imer:hrtimer_start, output:
>     event syntax error: 'timer:hrtimer_setup,timer:hrtimer_start'
>                          \___ unknown tracepoint
>
>     Error:  File /sys/kernel/tracing//events/timer/hrtimer_setup not foun=
d.
>     Hint:   Perhaps this kernel misses some CONFIG_ setting to enable thi=
s feature?.
>
>     Run 'perf list' for a list of valid events
>
>      Usage: perf trace [<options>] [<command>]
>         or: perf trace [<options>] -- <command> [<options>]
>         or: perf trace record [<options>] [<command>]
>         or: perf trace record [<options>] -- <command> [<options>]
>
>         -e, --event <event>   event/syscall selector. use 'perf list' to =
list available events---- end(-1) ----
>     107: perf trace enum augmentation tests                              =
: FAILED!
>
> Changes in v2:
> - Add an extra newline after error messages
> - Rename the title of patch 3 to 'Stop tracing hrtimer_setup...'
> - Take the debug diff for explanation out of patch 5 to make it apply
>   normally
> - Add base-commit in this cover letter

Thanks Howard! I did some testing but see failures that may be
pre-existing issues:

```
--- start ---
test child forked, pid 264236
Checking if vmlinux exists
Tracing syscall landlock_add_rule
[syscall failure] Failed to trace syscall landlock_add_rule, output:

---- end(-1) ----
107: perf trace enum augmentation tests                              : FAIL=
ED!
--- start ---
test child forked, pid 264248
Checking if vmlinux BTF exists
Testing perf trace's string augmentation
String augmentation test failed, output:

---- end(-1) ----
--- start ---
test child forked, pid 278774
Checking if vmlinux exists
Tracing syscall landlock_add_rule
[syscall failure] Failed to trace syscall landlock_add_rule, output:
     0.000 (         ): perf/278843 landlock_add_rule(ruleset_fd: 11,
rule_type: LANDLOCK_RULE_PATH_BENEATH, rule_attr: 0x7ffdcf1dad90,
flags: 45) ...
---- end(-1) ----
107: perf trace enum augmentation tests                              : FAIL=
ED!
--- start ---
test child forked, pid 279196
Checking if vmlinux exists
Tracing syscall landlock_add_rule
[syscall failure] Failed to trace syscall landlock_add_rule, output:
     0.000 (         ): perf/279262 landlock_add_rule(ruleset_fd: 11,
rule_type: LANDLOCK_RULE_PATH_BENEATH, rule_attr: 0x7fff37a70fd0,
flags: 45) ...
---- end(-1) ----
107: perf trace enum augmentation tests                              : FAIL=
ED!
108: perf trace BTF general tests                                    : FAIL=
ED!
--- start ---
test child forked, pid 278187
Checking if vmlinux BTF exists
Testing perf trace's string augmentation
Testing perf trace's buffer augmentation
Testing perf trace's struct augmentation
BTF struct augmentation test failed, output:
sleep/278352 clock_nanosleep(0, 0, {1,1,}, 0x7ffd31550f50) =3D 0
---- end(-1) ----
108: perf trace BTF general tests                                    : FAIL=
ED!
--- start ---
test child forked, pid 278775
Checking if vmlinux BTF exists
Testing perf trace's string augmentation
Testing perf trace's buffer augmentation
Buffer augmentation test failed, output:
buffer content
---- end(-1) ----
108: perf trace BTF general tests                                    : FAIL=
ED!
--- start ---
test child forked, pid 279547
Checking if vmlinux BTF exists
Testing perf trace's string augmentation
Testing perf trace's buffer augmentation
Testing perf trace's struct augmentation
BTF struct augmentation test failed, output:
sleep/279619 clock_nanosleep(0, 0, {1,1,}, 0x7ffcd47b6450) =3D 0
---- end(-1) ----
108: perf trace BTF general tests                                    : FAIL=
ED!
--- start ---
test child forked, pid 264252
[ perf record: Woken up 1 times to write data ]
[ perf record: Captured and wrote 0.333 MB /tmp/temporary_file.pl459 ]
Failed: cannot find *nanosleep syscall
---- end(-1) ----
110: perf trace record and replay                                    : FAIL=
ED!
--- start ---
test child forked, pid 278193
testing: perf trace -s -- true
Error: cannot find enough pattern ^\s*(open|read|close).*[0-9]+%$ in the ou=
tput

 Summary of events:

 true (278235), 5 events, 45.5%

   syscall            calls  errors  total       min       avg
max       stddev
                                     (msec)    (msec)    (msec)
(msec)        (%)
   --------------- --------  ------ -------- --------- ---------
---------     ------


---- end(-1) ----
111: perf trace summary                                              : FAIL=
ED!
```

Thanks,
Ian

> Howard Chu (5):
>   perf test trace: Use shell's -f flag to check if vmlinux exists
>   perf test trace: Remove set -e and print trace test's error messages
>   perf test trace: Stop tracing hrtimer_setup event in trace enum test
>   perf test trace: Remove set -e for BTF general tests
>   perf test trace BTF: Use --sort-events in BTF general tests
>
>  tools/perf/tests/shell/trace_btf_enum.sh    | 17 +++++++++--------
>  tools/perf/tests/shell/trace_btf_general.sh | 19 +++++++++----------
>  2 files changed, 18 insertions(+), 18 deletions(-)
>
>
> base-commit: f3061d526714ac6cc936c48e76a6eb0512c69b1a
> --
> 2.45.2
>
