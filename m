Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91A41922C0
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 05:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750223956; cv=none; b=gshUciV8vV1G5J9T21bpS02MAoghjHStoYnyFkUCn5FsV0eaAdi0haWH0Wp+DqOf8Pc4Hv6bs5APy3bCCir1Hl86h/NUOVfwfDgbk1tTo8vp2yo3/3j44W6Ch6fzkfNOtc3ZvUZzt0BWPgFdVCC0x+zNsgxtZEVABWZyG9IlkHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750223956; c=relaxed/simple;
	bh=A+ZiXEmEky5IlyZPbtuFRiVaurumTSh8ev8UoHMhViQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=ix4GZ/bdqfW38nZpGz7z/ut/pG2PLab8mDVrHm2Rl28/FcNCiDvvvgdBkCD9EhozlHheF560yZnOiORdCg3XM33kSvHjNMU8mAK0gXFkeATGnc6XUJTSCD/inOLzL5sc6hoHfBpvBKnXHl1d07sWlHnASixqCC16UXcIxWnSS/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IRdBzsjG; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IRdBzsjG"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-74849e33349so5418829b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 22:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750223954; x=1750828754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=93AlL/SSPC05gRaqokJqlfRbqE2xn7lGHJk2c5JfDgo=;
        b=IRdBzsjGbrObBpKclA4oO2myEWcNt4CujW2xKFaEzXRMXPYlN9ghWm1WXZeteFwl7Z
         cexq1sTZXAM0cZYwBeMbJ06AZxxrUq7ETX3x/mi7EuwuaRndgrnvS1dLx7ybsXAlBdlk
         L7FWvCyZW3vRE6OWH/R25drmWbQKRBwiFUZU6rBFoSJae6iUlUsUfQe8eZvkTr+mz7er
         nsihjm63Ra5AprljBF/ylG9X3uMX5VEBYbwA6TUP6xuAtOOe9mshFk7EsC+h+/lpz4Kr
         Ps/MB6t6mMO5J8bPm4AsKHu98wU1Y3307CYchuFOgEZdeVYcHEcyA8GWjgyvJn1zZxtq
         ENYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750223954; x=1750828754;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=93AlL/SSPC05gRaqokJqlfRbqE2xn7lGHJk2c5JfDgo=;
        b=AihPxsYlzM6gKygiJh+CSbfS9TtLziIkS7tih36ApXEAje6VfKhKvQ2h1FD+m4eHyh
         C6v14XCwM47t+xKfQOExW5Rt36S4gtophi/JDKwhOzybk8TXtLCKRBACmfPdMD1Fyd1+
         h5bZj2U77E4teEFQ43kl3kz0EbFfAzZmp12sNsB/qDA35D4kwEqCgDRuk+TsuOsZt89y
         2mQESV21mBHMwhI/F9UjkDR5/IYm3/73XC5LkCIVBrTFioUacnON45d8h1r+Wkts52Vk
         YyYb0lK7MZ5VIDd2RPlTyrqPA6eIoEJqHMji9S23jKh2Wmlg7VYmYg0j2OiuLUpF4S09
         fBBA==
X-Gm-Message-State: AOJu0Yw27gpv8QnBdfeDVoor9WQ2HFkcSt+41bmjhXlMME6NiFyhPtHe
	tpcLg46scAFHGsfkNl4jOteLUT68TYd9zg0EPDUi9QJKFxDML/vXgAno
X-Gm-Gg: ASbGncsBcHP0K0xeVjAC1VakSq6tuAXDm0NVnCTewJli8/sTc19IyED2gjQ0LnyJj1D
	MDf8g+toXgRC1IuWqztLQ9xX4pnY00c2Zf3ow8/kOgwYliHKJELfppMTPwoU+EkfqXt9DT4c0TY
	esktC+UXdNEL8LWByD8he3o+3v/cqqwut8dps0euZZcRVUU8YVKyzfmq3F+b9mZ4hOTgiQqqQ/p
	4N475flvhiIOvN7Hj0193p+pNe3nCUhS1rIx+ONbDmUL8rDjIfyN0BMU3CPoVpEcRjSZe2EEB/D
	jSZMaoqAFC7OiM+TCXpIytE8gy2dIBJKwv/C1b1HQ+YPwmotnBuZMUevwy07xrJcGPlARhQ=
X-Google-Smtp-Source: AGHT+IHEU99Lhlee7usnyz2PjR/PopFd/HoDipT45ccz/6cuIuiC9UV78J138Tx3TWY+EPin+LWsNw==
X-Received: by 2002:a05:6a20:e687:b0:21f:5361:d7f7 with SMTP id adf61e73a8af0-21fbd57fc07mr26167100637.31.1750223953985;
        Tue, 17 Jun 2025 22:19:13 -0700 (PDT)
Received: from ?IPv6:::1? ([2405:201:900e:b1b1:9025:ce8f:3766:9930])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1680448sm8355414a12.45.2025.06.17.22.19.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 22:19:13 -0700 (PDT)
Date: Wed, 18 Jun 2025 10:49:09 +0530
From: Abhigyan ghosh <zscript.team.zs@gmail.com>
To: jhladky@redhat.com
CC: linux-kernel@vger.kernel.org, zscript.team.zs@gmail.com
Subject: =?US-ASCII?Q?Re=3A_=5BBUG=5D_Kernel_panic_in_=5F=5Fmigrate=5Fswap=5Fta?=
 =?US-ASCII?Q?sk=28=29_on_6=2E16-rc2_=28NULL_pointer_dereference=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAE4VaGBLJxpd=NeRJXpSCuw=REhC5LWJpC29kDy-Zh2ZDyzQZA@mail.gmail.com>
References: <CAE4VaGBLJxpd=NeRJXpSCuw=REhC5LWJpC29kDy-Zh2ZDyzQZA@mail.gmail.com>
Message-ID: <07D9F8BC-47A7-4E87-8655-C978C056E308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Jirka,

Thanks for the detailed report=2E

I'm curious about the specific setup in which this panic was triggered=2E =
Could you share more about the exact configuration or parameters you used f=
or running `stress-ng` or Linpack? For instance:

- How many threads/cores were used?
- Was it running inside a VM, container, or bare-metal?
- Was this under any thermal throttling or power-saving mode?

I'd like to try reproducing it locally to study the failure further=2E

Best regards, =20
Abhigyan Ghosh

On 18 June 2025 1:35:30=E2=80=AFam IST, Jirka Hladky <jhladky@redhat=2Ecom=
> wrote:
>Hi all,
>
>I=E2=80=99ve encountered a reproducible kernel panic on 6=2E16-rc1 and 6=
=2E16-rc2
>involving a NULL pointer dereference in `__migrate_swap_task()` during
>CPU migration=2E This occurred on various AMD and Intel systems while
>running a CPU-intensive workload (Linpack, Stress_ng - it's not
>specific to a benchmark)=2E
>
>Full trace below:
>---
>BUG: kernel NULL pointer dereference, address: 00000000000004c8
>#PF: supervisor read access in kernel mode
>#PF: error_code(0x0000) - not-present page
>PGD 4078b99067 P4D 4078b99067 PUD 0
>Oops: Oops: 0000 [#1] SMP NOPTI
>CPU: 74 UID: 0 PID: 466 Comm: migration/74 Kdump: loaded Not tainted
>6=2E16=2E0-0=2Erc2=2E24=2Eeln149=2Ex86_64 #1 PREEMPT(lazy)
>Hardware name: GIGABYTE R182-Z91-00/MZ92-FS0-00, BIOS M07 09/03/2021
>Stopper: multi_cpu_stop+0x0/0x130 <- migrate_swap+0xa7/0x120
>RIP: 0010:__migrate_swap_task+0x2f/0x170
>Code: 41 55 4c 63 ee 41 54 55 53 48 89 fb 48 83 87 a0 04 00 00 01 65
>48 ff 05 e7 14 dd 02 48 8b af 50 0a 00 00 66 90 e8 61 93 07 00 <48> 8b
>bd c8 04 00 00 e8 85 11 35 00 48 85 c0 74 12 ba 01 00 00 00
>RSP: 0018:ffffce79cd90bdd0 EFLAGS: 00010002
>RAX: 0000000000000001 RBX: ffff8e9c7290d1c0 RCX: 0000000000000000
>RDX: ffff8e9c71e83680 RSI: 000000000000001b RDI: ffff8e9c7290d1c0
>RBP: 0000000000000000 R08: 00056e36392913e7 R09: 00000000002ab980
>R10: ffff8eac2fcb13c0 R11: ffff8e9c77997410 R12: ffff8e7c2fcf12c0
>R13: 000000000000001b R14: ffff8eac71eda944 R15: ffff8eac71eda944
>FS:  0000000000000000(0000) GS:ffff8eac9db4a000(0000) knlGS:0000000000000=
000
>CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>CR2: 00000000000004c8 CR3: 0000003072388003 CR4: 0000000000f70ef0
>PKRU: 55555554
>Call Trace:
> <TASK>
> migrate_swap_stop+0xe8/0x190
> multi_cpu_stop+0xf3/0x130
> ? __pfx_multi_cpu_stop+0x10/0x10
> cpu_stopper_thread+0x97/0x140
> ? __pfx_smpboot_thread_fn+0x10/0x10
> smpboot_thread_fn+0xf3/0x220
> kthread+0xfc/0x240
> ? __pfx_kthread+0x10/0x10
> ? __pfx_kthread+0x10/0x10
> ret_from_fork+0xf0/0x110
> ? __pfx_kthread+0x10/0x10
> ret_from_fork_asm+0x1a/0x30
> </TASK>
>---
>
>**Kernel Version:**
>6=2E16=2E0-0=2Erc2=2E24=2Eeln149=2Ex86_64 (Fedora rawhide)
>https://koji=2Efedoraproject=2Eorg/koji/buildinfo?buildID=3D2732950
>
>**Reproducibility:**
>Happened multiple times during routine CPU-intensive operations=2E It
>happens with various benchmarks (Stress_ng, Linpack) after several
>hours of performance testing=2E `migration/*` kernel threads hit a NULL
>dereference in `__migrate_swap_task`=2E
>
>**System Info:**
>- Platform: GIGABYTE R182-Z91-00 (dual socket EPYC)
>- BIOS: M07 09/03/2021
>- Config: Based on Fedora=E2=80=99s debug kernel (`PREEMPT(lazy)`)
>
>**Crash Cause (tentative):**
>NULL dereference at offset `0x4c8` from a task struct pointer in
>`__migrate_swap_task`=2E Possibly an uninitialized or freed
>`task_struct` field=2E
>
>Please let me know if you=E2=80=99d like me to test a patch or if you nee=
d
>more details=2E
>
>Thanks,
>Jirka
>
>

aghosh
