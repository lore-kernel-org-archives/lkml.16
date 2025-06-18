Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77591B78F3
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 20:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750280210; cv=none; b=FNgKr0B7At7sDDkWRkTVYG8rhd5leF4WJOjBKg9l0t/rEMedfevxLtqk2MUVef2Sz3+c8+Rt8FuNmJtg1/IFqPtl/csVcCcj4MN0luGdsoPJI9kmHpw74OVF/U5Hac4rgsIC44o6dU+n3TC+C39jvt1MwYKconeWMDWBeNWHrvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750280210; c=relaxed/simple;
	bh=tW1r7S2kq5F+Cc/SU7zLEl7vpva+o4k3Q2cuTrLxTgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mqfa074XqHGjZCPiG7jIsrWaZbkiCnL/y0gTx/ySOZBBOhDRkckHj6pbUcqbj23+cxh1X2gumiB9ac5NzFKSEHeDBudUgOrxVhWoqRmk3DB9R6UwrjPT7qoySgsmz7BVroq3iDdtkfSV4NJ56X4IIFYddp08fPnvNtaRtGXCZvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org; spf=pass smtp.mailfrom=wbinvd.org; dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b=Tqc7QgEM; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b="Tqc7QgEM"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-748d982e97cso53508b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 13:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1750280208; x=1750885008; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B450IcU3E6ry+Hos8rg6sgzrbfZHpdL1PKr2QAvcOAg=;
        b=Tqc7QgEMzDkRN2kIdDq5l56bfiYmBCGknxNuAqGPkVleiV7izupbi9GMmFYiMfBfNo
         BjuMbfO89J2FL4v2rA91nFCkfvZw+tHMzIl4T5uQ1vBHPfPDkl6/hY22zF253C6+OLve
         /Hv9kc3g43AY42RvqiPjZR+kp3POXNbIiHtO8WJhZYK1yOYr8E48Je8HwP1/PgVbwnLl
         Z9vNYJVACrBq3mrEEI/iTNc05tDxRqZfe/B6+3Z5XTFz3XT6yq+ZD5+MFv9XhUx/PCUX
         0Zp44BVOierfd5i3wT+kxKPV4ivsZiIKYPI8+LzgwBwB6uZjl7MGEejzMnorLvjIN5PH
         H8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750280208; x=1750885008;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B450IcU3E6ry+Hos8rg6sgzrbfZHpdL1PKr2QAvcOAg=;
        b=wvPq1MfgWh1zAOc0Dy6oXqWrBsY9oyNsWpYafgp/bAfnw5PKl9BNHI/eWkWdBkGAaI
         PCjiTxMykxfcBwP+Lsw1mz6ZtlbAXKnR6rqQS0hUsvNq6tzIHuUEhI9oUAiBdmtY0IPT
         DzsKGcDxToFx6cn0SQwEghRS5DrA77J3s602PW9qpPOOKjaN2cxRl8Stxwvk2Yi2DYFc
         jI0CZjAKjuf8K+I+h1CxIlOlUIKT+HB2WBxzFODECrDVCcCWY9/VC5LoJUth+BcrBDER
         VgemWc2b77bayTxcZ6KgquV1Nbv7Pwy5rTnFYJqgihmg08Q+doE1+YCP1+LhMYdZSD1n
         Px9A==
X-Gm-Message-State: AOJu0YyEroL/IgR2rZ+dDnNCPOo0nDTq8NXkfAjNtm78emcMFydJ+B1F
	sxTlvtfZGNRAA8Ow+z4iUDVLyVF2oKiWR9FY3v/EZSKnKKg/yHcAvWrV+4YEZNkU53QoaDtjgB+
	IwqGN
X-Gm-Gg: ASbGncvjqVnIxp7/vaQj+iDLaXVztHGG1nfZSnI1g3ZQqg3g4GNoNwmnVItLUvYgFRL
	WB9xUH8YHs9z8gK4+vRMrI/8BjVG7rAxud+T6a6WYO7Ok83SJ8+1V6TLZQtaPLJEwBFSOcmvyao
	g5oS6nzR0qYBFSj36tMLzwABSbTBSZKn41ME1AiR26cbSTtojWFrHeTpmUeg98aWaussxNwtk9i
	J68+sG3KeDf2H8xnv5ES5U0oh7Q9SFnM1AQY3oat1mJUa2ZqPHVE1JLHH9Zd3dA12HJNOCBpk03
	nJ2JTUYkZWhKtIawkv1wQEfsbDoI8rgFHVXBVZQss7PXcmACLjDQWCiLcOdairmY6qGtkVT/uli
	0dwAtGX0FptWu9mCPzMKo909+luVu61E44+sV2qBjGQ==
X-Google-Smtp-Source: AGHT+IHvSSTTQWwW9GSw7wpzQ+GArYiPSyKvrBEjsVGNG7Zf6ad19dTj4MMoEYv5+YrfrRVbuphJpw==
X-Received: by 2002:a05:6a00:2186:b0:748:33f3:8da8 with SMTP id d2e1a72fcca58-7489cfc2976mr21074079b3a.5.1750280208093;
        Wed, 18 Jun 2025 13:56:48 -0700 (PDT)
Received: from mozart.vkv.me (192-184-162-253.fiber.dynamic.sonic.net. [192.184.162.253])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7489000ea2csm11567843b3a.71.2025.06.18.13.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 13:56:47 -0700 (PDT)
Date: Wed, 18 Jun 2025 13:56:45 -0700
From: Calvin Owens <calvin@wbinvd.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, "Lai, Yi" <yi1.lai@linux.intel.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org
Subject: Re: [tip: locking/urgent] futex: Allow to resize the private local
 hash
Message-ID: <aFMoDcWy-OzE3yoV@mozart.vkv.me>
References: <20250602110027.wfqbHgzb@linutronix.de>
 <174965275618.406.11364856155202390038.tip-bot2@tip-bot2>
 <aFBQ8CBKmRzEqIfS@mozart.vkv.me>
 <20250617071628.lXtqjG7C@linutronix.de>
 <aFEz_Fzr-_-nGAHV@mozart.vkv.me>
 <20250617095037.sOnrJlPX@linutronix.de>
 <aFGTmn_CFkuTbP4i@mozart.vkv.me>
 <20250618160333.PdGB89yt@linutronix.de>
 <aFLuDoX9BGBUC3tW@mozart.vkv.me>
 <20250618170924.Z34OXf1E@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250618170924.Z34OXf1E@linutronix.de>

( Dropping linux-tip-commits from Cc )

On Wednesday 06/18 at 19:09 +0200, Sebastian Andrzej Siewior wrote:
> On 2025-06-18 09:49:18 [-0700], Calvin Owens wrote:
> > Didn't get much out of lockdep unfortunately.
> > 
> > It notices the corruption in the spinlock:
> > 
> >     BUG: spinlock bad magic on CPU#2, cargo/4129172
> >      lock: 0xffff8881410ecdc8, .magic: dead4ead, .owner: <none>/-1, .owner_cpu: -1
> 
> Yes. Which is what I assumed while I suggested this. But it complains
> about bad magic. It says the magic is 0xdead4ead but this is
> SPINLOCK_MAGIC. I was expecting any value but this one.
> 
> > That was followed by this WARN:
> > 
> >     ------------[ cut here ]------------
> >     rcuref - imbalanced put()
> >     WARNING: CPU: 2 PID: 4129172 at lib/rcuref.c:266 rcuref_put_slowpath+0x55/0x70
> 
> This is "reasonable". If the lock is broken, the remaining memory is
> probably garbage anyway. It complains there that the reference put due
> to invalid counter.
> 
> …
> > The oops after that is from a different task this time, but it just
> > looks like slab corruption:
> > 
> …
> 
> The previous complained an invalid free from within the exec.
> 
> > No lock/rcu splats at all.
> It exploded before that could happen.
> 
> > > If it still explodes without LTO, would you mind trying gcc?
> > 
> > Will do.
> 
> Thank you.
> 
> > Haven't had much luck isolating what triggers it, but if I run two copies
> > of these large build jobs in a loop, it reliably triggers in 6-8 hours.
> > 
> > Just to be clear, I can only trigger this on the one machine. I ran it
> > through memtest86+ yesterday and it passed, FWIW, but I'm a little
> > suspicious of the hardware right now too. I double checked that
> > everything in the BIOS related to power/perf is at factory settings.
> 
> But then it is kind of odd that it happens only with the futex code.

I think the missing ingredient was PREEMPT: the 2nd machine has been
trying for over a day, but I rebuilt its kernel with PREEMPT_FULL this
morning (still llvm), and it just hit a similar oops.

    Oops: general protection fault, probably for non-canonical address 0x74656d2f74696750: 0000 [#1] SMP
    CPU: 10 UID: 1000 PID: 542469 Comm: cargo Not tainted 6.16.0-rc2-00045-g4663747812d1 #1 PREEMPT 
    Hardware name: Gigabyte Technology Co., Ltd. A620I AX/A620I AX, BIOS F3 07/10/2023
    RIP: 0010:futex_hash+0x23/0x90
    Code: 1f 84 00 00 00 00 00 41 57 41 56 53 48 89 fb e8 b3 04 fe ff 48 89 df 31 f6 e8 79 00 00 00 48 8b 78 18 49 89 c6 48 85 ff 74 55 <80> 7f 21 00 75 4f f0 83 07 01 79 49 e8 fc 17 37 00 84 c0 75 40 e8
    RSP: 0018:ffffc9002e46fcd8 EFLAGS: 00010202
    RAX: ffff888a68e25c40 RBX: ffffc9002e46fda0 RCX: 0000000036616534
    RDX: 00000000ffffffff RSI: 0000000910180c00 RDI: 74656d2f7469672f
    RBP: 00000000000000b0 R08: 000000000318dd0d R09: 000000002e117cb0
    R10: 00000000318dd0d0 R11: 000000000000001b R12: 0000000000000000
    R13: 000055e79b431170 R14: ffff888a68e25c40 R15: ffff8881ea0ae900
    FS:  00007f1b6037b580(0000) GS:ffff8898a528b000(0000) knlGS:0000000000000000
    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    CR2: 0000555830170098 CR3: 0000000d73e93000 CR4: 0000000000350ef0
    Call Trace:
     <TASK>
     futex_wait_setup+0x7e/0x1d0
     __futex_wait+0x63/0x120
     ? __futex_wake_mark+0x40/0x40
     futex_wait+0x5b/0xd0
     ? hrtimer_dummy_timeout+0x10/0x10
     do_futex+0x86/0x120
     __x64_sys_futex+0x10a/0x180
     do_syscall_64+0x48/0x4f0
     entry_SYSCALL_64_after_hwframe+0x4b/0x53

I also enabled DEBUG_PREEMPT, but that didn't print any additional info.

I'm testing a GCC kernel on both machines now.

Thanks,
Calvin

> Sebastian
