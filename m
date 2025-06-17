Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1981C285071
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 16:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750176673; cv=none; b=OejBsmNsXX/VNXi6RptrG66gNMLILbCDEYtB8wiazf2D9r4CvEPUv/dSnCMFT/U4Xtmc99Abd8ymN8Vewor7fj9kFk6XsT/o7MLPcaqty9VvXGxquSIzcVIeBFWpCxv1nIb569m3X4YWNETrixGUrKrQv6QVosBS+pV5s4i7FtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750176673; c=relaxed/simple;
	bh=nI6mZX8UIGXCS2ky4Mde5RPI4jG8feBj1XmxlwS/Qi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J3CYQ2TNiYavTDDQfwkfuEszBHGL/sFDCPb5Sn9WaUtCfq8TUelk92x/Jsh33eLuT6EANtdNA1BWljqpzfxFItlRBVvs+aICip6EYrStP/TiGy74uIusqoZ3Fh04zCJQjGF9/H05YAYY5wqLBLpqCPoXLoQR+50JF5+EjqKavHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org; spf=pass smtp.mailfrom=wbinvd.org; dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b=U97lQmrz; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b="U97lQmrz"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b31c6c9959cso33345a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1750176669; x=1750781469; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kXVdaP2cOJuMHwGR5xIkb7zkn+fH5FKb+gzDtJIqbNk=;
        b=U97lQmrzKzP3hsMgKQtZYDApTkRBU8ROKhMAATYmMC18BpRectDKUPzdJCCsZ82kzZ
         L2mhJSdsKWiQL79UPJbKxZfKpFKLBKQmwkOpPtVhy1lGiM0kAQQviSCoqOj1and0GmCZ
         wuIP5wFUu8erOBUE99ZcHykfg/8i24T4svkcPLRyxiTwwA8WMYwHZ8MKo80oDfgZvLhh
         XfuhqwriGaVcdI3IUQEmXnPkuk7YKiCVoPpvUeQr/PXjJSQZeUXeor/bgSNhsefVGOty
         uGHgMstL77RTVyQka1N81s5pdbIeiGJpiQeaNEt/P+5nmdLI09P5zhhjOgwxPaLY/1/x
         nrxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750176669; x=1750781469;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kXVdaP2cOJuMHwGR5xIkb7zkn+fH5FKb+gzDtJIqbNk=;
        b=hyEVuwU6NbZ+lsi9lSSqQLZdRSgYyvctKs5gOk14/3Cntjmlz+84gukt7v5sSAk5k2
         s1rwz8VkpxxUJwLvWGGyRY5QSGE10LwM3DHsMus0ZSxaXD4SzNM4IdGhS21FPOTvX0yq
         45EPKx572oWnZyKNhsbOzLfN6ahXBEsEfExKe4D5BPAq+clKuE3XlTYWlQm3DCa4327A
         ZFdlW0d+A5+prowi403FDaenb1yWSpdLDQguBu/dHUpzE9yza/2nV7/hpLuwlqjNNVbZ
         UlmBD4RGjlHhGzOqtjilA2itlG9VL2MmeQ/Bg7ZHnE8/Pcd6xv3KNjjflWBM1IWqvYjp
         FcBQ==
X-Gm-Message-State: AOJu0Yz3Wu6pcqfwvB2WY8F+Icc3hspBe7fOrOJfzhk5qG+9422C+jAq
	yvdVEG1D0PPtC7uOLjYQdH7RD/iF5a9UDATXAlJU4AAvwfYr0O91fRB2sDuY4wHgilEBG6r1Vqa
	fQ2gF
X-Gm-Gg: ASbGnctrYei31zQiUScfaxcf8xrNsPMCLqTYaQfyzGZr8F5AR5jQ4hiWIgYSgbot08S
	byklAmlZoxuLUFQ/oa4XTXOAjvtBet20a83R3fZmCVJKW+5o1DqmVEyTtA+9y8z0fNmAVIBaLkb
	SWx95jIDTEudtfO5F/BlJUe0PhIkZwGaQ+N3aDxFylYtq3ULEKVyY11sjQLRm1/e0cy3TTtrkTl
	VZgJleCyXGVohqiaPuk9IkTQQX2Cy9FQBQgZg8yqYCtMInA5nqDMniZOOJ79NSWRKIxtyv5ubNl
	zuOWaVMJwpYM5ZWF/uFrZ1FFHT0OSMO5WUUNUEjAawnW3Hps/HW5DRquWzEaVkKVGBcYnsLr8I2
	nATMpcoGtyt72Y0YctNVzSogK5P7z6DE=
X-Google-Smtp-Source: AGHT+IFYk6f34ctVBzTOxlm8fGaCjBky8FTOeYc7QhtR+iwWenKOkBoYq8IuxTXnH5FF557mzL5Rwg==
X-Received: by 2002:a05:6a20:244b:b0:215:fac3:2ce2 with SMTP id adf61e73a8af0-21fbd65e0edmr22330171637.23.1750176669337;
        Tue, 17 Jun 2025 09:11:09 -0700 (PDT)
Received: from mozart.vkv.me (192-184-162-253.fiber.dynamic.sonic.net. [192.184.162.253])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7488ffee527sm9352985b3a.19.2025.06.17.09.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:11:08 -0700 (PDT)
Date: Tue, 17 Jun 2025 09:11:06 -0700
From: Calvin Owens <calvin@wbinvd.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-tip-commits@vger.kernel.org,
	"Lai, Yi" <yi1.lai@linux.intel.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org
Subject: Re: [tip: locking/urgent] futex: Allow to resize the private local
 hash
Message-ID: <aFGTmn_CFkuTbP4i@mozart.vkv.me>
References: <20250602110027.wfqbHgzb@linutronix.de>
 <174965275618.406.11364856155202390038.tip-bot2@tip-bot2>
 <aFBQ8CBKmRzEqIfS@mozart.vkv.me>
 <20250617071628.lXtqjG7C@linutronix.de>
 <aFEz_Fzr-_-nGAHV@mozart.vkv.me>
 <20250617095037.sOnrJlPX@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250617095037.sOnrJlPX@linutronix.de>

On Tuesday 06/17 at 11:50 +0200, Sebastian Andrzej Siewior wrote:
> On 2025-06-17 02:23:08 [-0700], Calvin Owens wrote:
> > Ugh, I'm sorry, I was in too much of a hurry this morning... cargo is
> > obviously not calling PR_FUTEX_HASH which is new in 6.16 :/
> No worries.
> 
> > > This is with LTO enabled.
> > 
> > Full lto with llvm-20.1.7.
> > 
> …
> > Nothing showed up in the logs but the RCU stalls on CPU16, always in
> > queued_spin_lock_slowpath().
> > 
> > I'll run the build it was doing when it happened in a loop overnight and
> > see if I can trigger it again.

Actually got an oops this time:

    Oops: general protection fault, probably for non-canonical address 0xfdd92c90843cf111: 0000 [#1] SMP
    CPU: 3 UID: 1000 PID: 323127 Comm: cargo Not tainted 6.16.0-rc2-lto-00024-g9afe652958c3 #1 PREEMPT 
    Hardware name: ASRock B850 Pro-A/B850 Pro-A, BIOS 3.11 11/12/2024
    RIP: 0010:queued_spin_lock_slowpath+0x12a/0x1d0
    Code: c8 c1 e8 10 66 87 47 02 66 85 c0 74 48 0f b7 c0 49 c7 c0 f8 ff ff ff 89 c6 c1 ee 02 83 e0 03 49 8b b4 f0 00 21 67 83 c1 e0 04 <48> 89 94 30 00 f1 4a 84 83 7a 08 00 75 10 0f 1f 84 00 00 00 00 00
    RSP: 0018:ffffc9002c953d20 EFLAGS: 00010256
    RAX: 0000000000000000 RBX: ffff88814e78be40 RCX: 0000000000100000
    RDX: ffff88901fce5100 RSI: fdd92c90fff20011 RDI: ffff8881c2ae9384
    RBP: 000000000000002b R08: fffffffffffffff8 R09: 00000000002ab900
    R10: 000000000000b823 R11: 0000000000000c00 R12: ffff88814e78be40
    R13: ffffc9002c953d48 R14: ffffc9002c953d48 R15: ffff8881c2ae9384
    FS:  00007f086efb6600(0000) GS:ffff88909b836000(0000) knlGS:0000000000000000
    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    CR2: 000055ced9c42650 CR3: 000000034b88e000 CR4: 0000000000750ef0
    PKRU: 55555554
    Call Trace:
     <TASK>
     futex_unqueue+0x2e/0x110
     __futex_wait+0xc5/0x130
     ? __futex_wake_mark+0xc0/0xc0
     futex_wait+0xee/0x180
     ? hrtimer_setup_sleeper_on_stack+0xe0/0xe0
     do_futex+0x86/0x120
     __se_sys_futex+0x16d/0x1e0
     ? __x64_sys_write+0xba/0xc0
     do_syscall_64+0x47/0x170
     entry_SYSCALL_64_after_hwframe+0x4b/0x53
    RIP: 0033:0x7f086e918779
    Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 4f 86 0d 00 f7 d8 64 89 01 48
    RSP: 002b:00007ffc5815f678 EFLAGS: 00000246 ORIG_RAX: 00000000000000ca
    RAX: ffffffffffffffda RBX: 00007f086e918760 RCX: 00007f086e918779
    RDX: 000000000000002b RSI: 0000000000000089 RDI: 00005636f9fb60d0
    RBP: 00007ffc5815f6d0 R08: 0000000000000000 R09: 00007ffcffffffff
    R10: 00007ffc5815f690 R11: 0000000000000246 R12: 000000001dcd6401
    R13: 00007f086e833fd0 R14: 00005636f9fb60d0 R15: 000000000000002b
     </TASK>
    ---[ end trace 0000000000000000 ]---
    RIP: 0010:queued_spin_lock_slowpath+0x12a/0x1d0
    Code: c8 c1 e8 10 66 87 47 02 66 85 c0 74 48 0f b7 c0 49 c7 c0 f8 ff ff ff 89 c6 c1 ee 02 83 e0 03 49 8b b4 f0 00 21 67 83 c1 e0 04 <48> 89 94 30 00 f1 4a 84 83 7a 08 00 75 10 0f 1f 84 00 00 00 00 00
    RSP: 0018:ffffc9002c953d20 EFLAGS: 00010256
    RAX: 0000000000000000 RBX: ffff88814e78be40 RCX: 0000000000100000
    RDX: ffff88901fce5100 RSI: fdd92c90fff20011 RDI: ffff8881c2ae9384
    RBP: 000000000000002b R08: fffffffffffffff8 R09: 00000000002ab900
    R10: 000000000000b823 R11: 0000000000000c00 R12: ffff88814e78be40
    R13: ffffc9002c953d48 R14: ffffc9002c953d48 R15: ffff8881c2ae9384
    FS:  00007f086efb6600(0000) GS:ffff88909b836000(0000) knlGS:0000000000000000
    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    CR2: 000055ced9c42650 CR3: 000000034b88e000 CR4: 0000000000750ef0
    PKRU: 55555554
    Kernel panic - not syncing: Fatal exception
    Kernel Offset: disabled
    ---[ end Kernel panic - not syncing: Fatal exception ]---

This is a giant Yocto build, but the comm is always cargo, so hopefully
I can run those bits in isolation and hit it more quickly.

> Please check if you can reproduce it and if so if it also happens
> without lto.
> I have no idea why one spinlock_t remains locked. It is either locked or
> some stray memory.
> Oh. Lockdep adds quite some overhead but it should complain that a
> spinlock_t is still locked while returning to userland.

I'll report back when I've tried :)

I'll also try some of the mm debug configs.

Thanks,
Calvin
