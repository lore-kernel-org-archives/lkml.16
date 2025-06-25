Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B1923C4EB
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750863571; cv=none; b=MhbdmI5XlebTkxBvynFgb8yD+5z3L5UwEIW/pVSStYWyvmRE4Sd1GqgJDvUmuE93SDbCmsmLfFKyqWAxrLfmqVWv8DKvp31sGo9bDmRHwzj62h5C2YlrQqnVQO1btsePGxZK3y32L/XZZ2SnXn351v+K1kTnaHLQU4pR9hLpGUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750863571; c=relaxed/simple;
	bh=CoHQ+3pE0BaR40sPkkySRTRvOejlJ0PIfGy/gZW5z0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lO6VaGjRJgbYi7U6NPq6ODzrC3HSmKlXYf0Ektpu8z/E7YuIlQ4mgIQqAqkYhXe3Mf6UdEOlC1q+fiBoaWnz2RAKMbpYDymTiV2LLE92CI9ynMZOLY6KUDk+x/URqYnDUJiUKY51vM0c9esD+XmyzOPbbY1ABe1j8Oscz1W5dN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0BUVolM0; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0BUVolM0"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3ddc99e0b77so221615ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750863568; x=1751468368; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CsCMZQqmkVUqqMH5tInvaFnJAvvkUkKU0tRaWra23tY=;
        b=0BUVolM0Gxm4K5kB+Ouu95gLbkux2b2PociHVjr4v6/5j/oGh6qRreV75H3eYBfTxa
         cYgdbKQowANahswT85kcpb0k4fPjkoDZKXAYwYvEzKF7iOtqAeLni/PTlTbHaoLMn+I2
         rnH8BKzkgXm3IBQTtPNKoO2LlBCHEKzsNIvFoA72Lfd/LknFMG1MGmb2Oi135jt+D9z3
         HgBZdIOOzG90ib985M7EmyCoCVe6yGX58xKBe7QDxtzbHoo+EZd4uZ0ZA2GSKgyOnN2W
         dTftuAew8MayZHlUE0wcYN4D13sse6BH3Jwz1Ca5KXOf31bNyMgOXEqTmdwNCdXGJdpl
         4RIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750863568; x=1751468368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CsCMZQqmkVUqqMH5tInvaFnJAvvkUkKU0tRaWra23tY=;
        b=CKTmm26DgUAbgdKnBaAY6JSJcWs1DfpwvbuPDPTcvOgSopP5p7wnTO8ZSsE4+ndP89
         lYDripnVjUCHNwfAXPjXO6/s5f7aM24nEQDAeB3zkFB7zXLD/2I3Qrp4fW5KfRSWcpZ4
         J+bu1qcnp54qG+QgskxnG7RIY4gB48L2mCadjChPNbPWHFCDxXCKhRZ+BKHLREa7flWB
         V7ygsGDv1bkWMMIpK6XpEHIJjfIAeTTJ0w0+rmUoZy1SeTZIXCjS8sxe7ygcIUMoSAcx
         wXNGsuTFmLKPvJS8oqL2lXNoEEolLszZwJJaSmbuUClyjvz27n0baVP0bnTH98YKfhUL
         fmTw==
X-Forwarded-Encrypted: i=1; AJvYcCUCZl+0xh35Eldk/5Abj3l1QdW3QIwHMFcrTdVxHzNd/GEFCoeJJ58pPrmzuO961Xcbzl3y2LpAkC1yYbM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm+GFmvhVm+zSx4EYOEDz5mGvwmK9Yd6QCS71Ux6I9Qj7PfO8B
	bWWfBUOMVdBBefBxtB7XV/OgCrQDBn0NUCrSpmhoBrvuJiTx9eP1uezHsHPY4oFtBpQ3VnZxGC5
	0Rf6uosG6fq6w8h2Jm3QrZgWSfvSwJbpZxzz7DRTB
X-Gm-Gg: ASbGncvyPbiO1YroDBUd8aQj86Hx85KZhE2EdtshodS04LDXW4KQpaAYH5IPpMA460c
	oI3dy/x5h+i7qVdKzR8wCHtScTrfVPy8OXC4XLXHSjO19trYP+PrGXFRVxF15dLuJgF8JqZe+C+
	tcoB2Bw8Pix/dPFAmGGRJuklWETtPD1jnpx/4CCvw7+bGN+vYeV6b5vkwxRD2rP0u2dZn6We4I
X-Google-Smtp-Source: AGHT+IFI1YA2zH+zwvyR1rJy+aBfBTCdNd7dhjmmd4EIqlXPDQxc4ZqqXXA6xdosT56rixSXJZOqOwhRJkl+rdl/sss=
X-Received: by 2002:a05:6e02:1c2d:b0:3de:20ec:5c71 with SMTP id
 e9e14a558f8ab-3df3433f362mr2634565ab.6.1750863568011; Wed, 25 Jun 2025
 07:59:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202506251422.589f230a-lkp@intel.com>
In-Reply-To: <202506251422.589f230a-lkp@intel.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 25 Jun 2025 07:59:16 -0700
X-Gm-Features: Ac12FXwVkD2jR7gdqWgouTrWU3Qi_fnDI_mR6AWnf5ozIzz7mqmYgU8s5q6WaJs
Message-ID: <CAP-5=fU6hxJp7NhnQ4zDv6xdSfue9xyRhznp62=OxKLjok8UAA@mail.gmail.com>
Subject: Re: [linux-next:master] [perf target] 5ddf4c3a17: perf-sanity-tests.perf_record_tests.fail
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, Namhyung Kim <namhyung@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 12:10=E2=80=AFAM kernel test robot
<oliver.sang@intel.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed "perf-sanity-tests.perf_record_tests.fail" on:
>
> commit: 5ddf4c3a17dc499fcbaf35692bc894340062dee8 ("perf target: Separate =
parse_uid into its own function")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
> [test failed on linux-next/master f817b6dd2b62d921a6cdc0a3ac599cd1851f343=
c]
>
> in testcase: perf-sanity-tests
> version:
> with following parameters:
>
>         perf_compiler: clang
>         group: group-02
>
>
> config: x86_64-rhel-9.4-bpf
> compiler: gcc-12
> test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-7700 CPU @ 3.60GHz=
 (Kaby Lake) with 32G memory
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Closes: https://lore.kernel.org/oe-lkp/202506251422.589f230a-lkp@intel.=
com
>
>
> 2025-06-22 14:23:54 sudo /usr/src/linux-perf-x86_64-rhel-9.4-bpf-5ddf4c3a=
17dc499fcbaf35692bc894340062dee8/tools/perf/perf test 126 -v
> 126: perf record tests                                               : Ru=
nning (1 active)
> --- start ---
> test child forked, pid 8698
>  13bca6c-13bcaa5 g test_loop
> perf does have symbol 'test_loop'
> Basic --per-thread mode test
> Per-thread record [Skipped event not supported]
> Register capture test
> Register capture test [Failed missing output]

Register capturing is different functionality to UID filtering.

> Basic --system-wide mode test
> System-wide record [Skipped not supported]
> Basic target workload test
> Workload record [Failed record]

Something seems off, possibly something to do with permissions here.

> Branch counter test
> branch counter feature not supported on all core PMUs (/sys/bus/event_sou=
rce/devices/cpu) [Skipped]
> Cgroup sampling test
> Cgroup sampling [Skipped not supported]
> Basic leader sampling test
> Leader sampling [Failed record]

And here.

I suspect this was a test machine issue although later patches do add
UID filtering tests to this test. I don't see anything actionable
here.

Thanks,
Ian

> Topdown leader sampling test
> Topdown leader sampling [Skipped event parsing failed]
> precise_max attribute test
> precise_max attribute [Skipped no cycles:P event]
> precise_max attribute [Skipped no instructions:P event]
> precise_max attribute [Skipped no hardware events]
> ---- end(-1) ----
> 126: perf record tests                                               : FA=
ILED!
>
>
> The kernel config and materials to reproduce are available at:
> https://download.01.org/0day-ci/archive/20250625/202506251422.589f230a-lk=
p@intel.com
>
>
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
