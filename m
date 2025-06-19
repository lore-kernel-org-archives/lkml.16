Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E8030E820
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 21:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750367256; cv=none; b=Rxg1xxf3HMcg1eajx5M5RDEpYImm8xF5kBBHT1QsGEbV3z1AzD7FlpaBTPWWzta9WRGakA+pGjAs16ykr73eYN0SwHow4QKq3jbozxP9/d5SN833WZf3zO04Tm9xkfljXqtyh3TdJ+J5ttZrXF5Lfa2A2c0PO0qgfpiCXC3dA6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750367256; c=relaxed/simple;
	bh=2S0qo9eU2yQW4dMRF5h762NyT5KZyx4xoURGJJGuDBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PCUc3hzvVoW2eK+coMQ5FLBIZ3CA3WcPGht8jt5f8WWy2DB0+54/j5DwdXkaBqyhcK+ohVulJNboOBZYw0sIf9uFwkW30zGqs1nYpHphM6e1vNBaGuMOzDpEwJZglR+B5rT37YxG/kwNoRayfsGeMZampu+S35CDBcwuyq1p/dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org; spf=pass smtp.mailfrom=wbinvd.org; dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b=WerVnLnw; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b="WerVnLnw"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-236377f00easo15459365ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1750367253; x=1750972053; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mHcAcMU+Bq8fWHdbfEb0sVu3rIHJb8v1HwPeS3jfUzk=;
        b=WerVnLnwJNrnNKz4XlxkdQv+1rUyfPUomrXeAV4zbY8or2UsjOR7fQKGhcayUBe9fk
         +CJSdMqGoBnWHyYcaq/lzxP5FQ87Nq1PaZ76Vuvc8KsycrWfHTT+dKF1KHjKLbjY6Icu
         VoJe3VvG1foa+4HRkwCDtEza7nAxM4NhafGOQ06JyGxGMnKIViuszWz2CRqyUv0ec2v4
         8m0VIgnaTDExSn1hoLUtEcT6iyMwwICCIcCRnZOGR4hAOfev1PW0CxxxNwfY41EBTZw3
         2grmximrF2PShiPzk5AfP7JYJ9TYo0YlgTJLkTmBOr4gJKXtQKDCojVhB7SW6hnFd/+o
         XwQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750367253; x=1750972053;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mHcAcMU+Bq8fWHdbfEb0sVu3rIHJb8v1HwPeS3jfUzk=;
        b=MHgY+cODwqKo/mUbT6BF5i2l+b4Y4gXBvOkkWsHyeUECCDLDrJ6RQ3L/4bAyiHTbBT
         u3dRB57rf1Nv5aCt88ysNY3kffCHMOgULQJ/L+kzVHwB7haScjsejcOWLPpCbBcnHF9c
         CfJfX8Mirjmp43ie/Bst22+noZm6UBxLJY8mTjKpdY5l73dMR1CTLCQtZwd6/RBflZqT
         MFHnSooIJD/22APnKFRCl9niLI+r6c9wXg0W30R3YtiBeWZunAgM0+FYIaNaC7AggYfO
         SBPzy5BB7yQIyZIXgy67UVIpWD924ZKBvJD6FWHg/Uxi5ySGG0Zmt7z6Y658ZQ9jVrs7
         spOw==
X-Gm-Message-State: AOJu0Yy7rlsL9fnplS3m4baHWpk93mV/wSvOoHGHWwtg9DWyho+sSnif
	/gRmktwhJwVJjVhN2fV9A9l3vEf8uDA5VEeSWng4XIy/D8fO6V+S5m6g85nf6WBPXwU=
X-Gm-Gg: ASbGncspNKQ8VtmSmCmrwW3c/42l7CMIYeAFmRLgs6pqlthF4DhCzMlttj9IHGatTLQ
	73AILTOwtmNz6ALgDCq2qKFfXOjTIl3vi/jTHZ8NpILuq4JiRgLAS37NcOdijjadf/V83o0PC05
	AN4ivDQqWDERpsHmn5VN8gbfduw1MmB43WfkB+j1OG95pevIx/THDxfE9Gnex7ebaxM4HmRgiD7
	0qKMvAsb1zkc/0AOGKxMyL7nl8Dbb0gjIoDZOvwh122eZ+hhqZYRdTLHm9M4UA9N5uAX4+DJ++5
	bJ0PNP2QHhU98s+O/PJSczkUS7mXed2WwPHhF1Mvb8y3MxB8mXxPRNJlrkID9+DzA1mNY4eW5Op
	+E2b+9kXJUISf4bOrbtrsEJI1viftbpY=
X-Google-Smtp-Source: AGHT+IHmJJLbnzmN6FQFlLl2wpV44li0iiT4dYC2Yo2bZjrq1TmJXooOcZymIoEygsxHC1Dw0qtGOA==
X-Received: by 2002:a17:903:2389:b0:236:9402:a622 with SMTP id d9443c01a7336-237d9a793e5mr3547695ad.34.1750367252860;
        Thu, 19 Jun 2025 14:07:32 -0700 (PDT)
Received: from mozart.vkv.me (192-184-162-253.fiber.dynamic.sonic.net. [192.184.162.253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8676123sm2290535ad.173.2025.06.19.14.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 14:07:32 -0700 (PDT)
Date: Thu, 19 Jun 2025 14:07:30 -0700
From: Calvin Owens <calvin@wbinvd.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, "Lai, Yi" <yi1.lai@linux.intel.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org
Subject: Re: [tip: locking/urgent] futex: Allow to resize the private local
 hash
Message-ID: <aFR8EuMg82aMCvjo@mozart.vkv.me>
References: <aFBQ8CBKmRzEqIfS@mozart.vkv.me>
 <20250617071628.lXtqjG7C@linutronix.de>
 <aFEz_Fzr-_-nGAHV@mozart.vkv.me>
 <20250617095037.sOnrJlPX@linutronix.de>
 <aFGTmn_CFkuTbP4i@mozart.vkv.me>
 <20250618160333.PdGB89yt@linutronix.de>
 <aFLuDoX9BGBUC3tW@mozart.vkv.me>
 <20250618170924.Z34OXf1E@linutronix.de>
 <aFMoDcWy-OzE3yoV@mozart.vkv.me>
 <aFNCHS-5LLywIAC7@mozart.vkv.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aFNCHS-5LLywIAC7@mozart.vkv.me>

On Wednesday 06/18 at 15:47 -0700, Calvin Owens wrote:
> On Wednesday 06/18 at 13:56 -0700, Calvin Owens wrote:
> > ( Dropping linux-tip-commits from Cc )
> >
> > On Wednesday 06/18 at 19:09 +0200, Sebastian Andrzej Siewior wrote:
> > > On 2025-06-18 09:49:18 [-0700], Calvin Owens wrote:
> > > > Didn't get much out of lockdep unfortunately.
> > > >
> > > > It notices the corruption in the spinlock:
> > > >
> > > >     BUG: spinlock bad magic on CPU#2, cargo/4129172
> > > >      lock: 0xffff8881410ecdc8, .magic: dead4ead, .owner: <none>/-1, .owner_cpu: -1
> > >
> > > Yes. Which is what I assumed while I suggested this. But it complains
> > > about bad magic. It says the magic is 0xdead4ead but this is
> > > SPINLOCK_MAGIC. I was expecting any value but this one.
> > >
> > > > That was followed by this WARN:
> > > >
> > > >     ------------[ cut here ]------------
> > > >     rcuref - imbalanced put()
> > > >     WARNING: CPU: 2 PID: 4129172 at lib/rcuref.c:266 rcuref_put_slowpath+0x55/0x70
> > >
> > > This is "reasonable". If the lock is broken, the remaining memory is
> > > probably garbage anyway. It complains there that the reference put due
> > > to invalid counter.
> > >
> > > …
> > > > The oops after that is from a different task this time, but it just
> > > > looks like slab corruption:
> > > >
> > > …
> > >
> > > The previous complained an invalid free from within the exec.
> > >
> > > > No lock/rcu splats at all.
> > > It exploded before that could happen.
> > >
> > > > > If it still explodes without LTO, would you mind trying gcc?
> > > >
> > > > Will do.
> > >
> > > Thank you.
> > >
> > > > Haven't had much luck isolating what triggers it, but if I run two copies
> > > > of these large build jobs in a loop, it reliably triggers in 6-8 hours.
> > > >
> > > > Just to be clear, I can only trigger this on the one machine. I ran it
> > > > through memtest86+ yesterday and it passed, FWIW, but I'm a little
> > > > suspicious of the hardware right now too. I double checked that
> > > > everything in the BIOS related to power/perf is at factory settings.
> > >
> > > But then it is kind of odd that it happens only with the futex code.
> >
> > I think the missing ingredient was PREEMPT: the 2nd machine has been
> > trying for over a day, but I rebuilt its kernel with PREEMPT_FULL this
> > morning (still llvm), and it just hit a similar oops.
> >
> >     Oops: general protection fault, probably for non-canonical address 0x74656d2f74696750: 0000 [#1] SMP
> >     CPU: 10 UID: 1000 PID: 542469 Comm: cargo Not tainted 6.16.0-rc2-00045-g4663747812d1 #1 PREEMPT
> >     Hardware name: Gigabyte Technology Co., Ltd. A620I AX/A620I AX, BIOS F3 07/10/2023
> >     RIP: 0010:futex_hash+0x23/0x90
> >     Code: 1f 84 00 00 00 00 00 41 57 41 56 53 48 89 fb e8 b3 04 fe ff 48 89 df 31 f6 e8 79 00 00 00 48 8b 78 18 49 89 c6 48 85 ff 74 55 <80> 7f 21 00 75 4f f0 83 07 01 79 49 e8 fc 17 37 00 84 c0 75 40 e8
> >     RSP: 0018:ffffc9002e46fcd8 EFLAGS: 00010202
> >     RAX: ffff888a68e25c40 RBX: ffffc9002e46fda0 RCX: 0000000036616534
> >     RDX: 00000000ffffffff RSI: 0000000910180c00 RDI: 74656d2f7469672f
> >     RBP: 00000000000000b0 R08: 000000000318dd0d R09: 000000002e117cb0
> >     R10: 00000000318dd0d0 R11: 000000000000001b R12: 0000000000000000
> >     R13: 000055e79b431170 R14: ffff888a68e25c40 R15: ffff8881ea0ae900
> >     FS:  00007f1b6037b580(0000) GS:ffff8898a528b000(0000) knlGS:0000000000000000
> >     CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >     CR2: 0000555830170098 CR3: 0000000d73e93000 CR4: 0000000000350ef0
> >     Call Trace:
> >      <TASK>
> >      futex_wait_setup+0x7e/0x1d0
> >      __futex_wait+0x63/0x120
> >      ? __futex_wake_mark+0x40/0x40
> >      futex_wait+0x5b/0xd0
> >      ? hrtimer_dummy_timeout+0x10/0x10
> >      do_futex+0x86/0x120
> >      __x64_sys_futex+0x10a/0x180
> >      do_syscall_64+0x48/0x4f0
> >      entry_SYSCALL_64_after_hwframe+0x4b/0x53
> >
> > I also enabled DEBUG_PREEMPT, but that didn't print any additional info.
> >
> > I'm testing a GCC kernel on both machines now.
> 
> Machine #2 oopsed with the GCC kernel after just over an hour:
> 
>     BUG: unable to handle page fault for address: ffff88a91eac4458
>     #PF: supervisor read access in kernel mode
>     #PF: error_code(0x0000) - not-present page
>     PGD 4401067 P4D 4401067 PUD 0
>     Oops: Oops: 0000 [#1] SMP
>     CPU: 4 UID: 1000 PID: 881756 Comm: cargo Not tainted 6.16.0-rc2-gcc-00045-g4663747812d1 #1 PREEMPT
>     Hardware name: Gigabyte Technology Co., Ltd. A620I AX/A620I AX, BIOS F3 07/10/2023
>     RIP: 0010:futex_hash+0x16/0x90
>     Code: 4d 85 e4 74 99 4c 89 e7 e8 07 51 80 00 eb 8f 0f 1f 44 00 00 41 54 55 48 89 fd 53 e8 14 f2 fd ff 48 89 ef 31 f6 e8 da f6 ff ff <48> 8b 78 18 48 89 c3 48 85 ff 74 0c 80 7f 21 00 75 06 f0 83 07 01
>     RSP: 0018:ffffc9002973fcf8 EFLAGS: 00010282
>     RAX: ffff88a91eac4440 RBX: ffff888d5a170000 RCX: 00000000add26115
>     RDX: 0000001c49080440 RSI: 00000000236034e8 RDI: 00000000f1a67530
>     RBP: ffffc9002973fdb8 R08: 00000000eb13f1af R09: ffffffff829c0fc0
>     R10: 0000000000000246 R11: 0000000000000000 R12: ffff888d5a1700f0
>     R13: ffffc9002973fdb8 R14: ffffc9002973fd70 R15: 0000000000000002
>     FS:  00007f64614ba9c0(0000) GS:ffff888cccceb000(0000) knlGS:0000000000000000
>     CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>     CR2: ffff88a91eac4458 CR3: 000000015e508000 CR4: 0000000000350ef0
>     Call Trace:
>      <TASK>
>      futex_wait_setup+0x51/0x1b0
>      __futex_wait+0xc0/0x120
>      ? __futex_wake_mark+0x50/0x50
>      futex_wait+0x55/0xe0
>      ? hrtimer_setup_sleeper_on_stack+0x30/0x30
>      do_futex+0x91/0x120
>      __x64_sys_futex+0xfc/0x1d0
>      do_syscall_64+0x44/0x1130
>      entry_SYSCALL_64_after_hwframe+0x4b/0x53
>     RIP: 0033:0x7f64615bd74d
>     Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d ab c6 0b 00 f7 d8 64 89 01 48
>     RSP: 002b:00007ffea50a6cc8 EFLAGS: 00000246 ORIG_RAX: 00000000000000ca
>     RAX: ffffffffffffffda RBX: 00007f64615bd730 RCX: 00007f64615bd74d
>     RDX: 0000000000000080 RSI: 0000000000000089 RDI: 000055bb7e399d90
>     RBP: 00007ffea50a6d20 R08: 0000000000000000 R09: 00007ffeffffffff
>     R10: 00007ffea50a6ce0 R11: 0000000000000246 R12: 000000001dcd6401
>     R13: 00007f64614e3710 R14: 000055bb7e399d90 R15: 0000000000000080
>      </TASK>
>     CR2: ffff88a91eac4458
>     ---[ end trace 0000000000000000 ]---
> 
> Two CPUs oopsed at once with that same stack, the config and vmlinux are
> uploaded in the git (https://github.com/jcalvinowens/lkml-debug-616).
> 
> I tried reproducing with DEBUG_PAGEALLOC, but the bug doesn't happen
> with it turned on.

I've been rotating through debug options one at a time, I've reproduced
the oops with the following which yielded no additional console output:

    * DEBUG_VM
    * PAGE_POISONING (and page_poison=1)
    * DEBUG_ATOMIC_SLEEP
    * DEBUG_PREEMPT

(No poison patterns showed up at all in the oops traces either.)

I am not able to reproduce the oops at all with these options:

    * DEBUG_PAGEALLOC_ENABLE_DEFAULT
    * SLUB_DEBUG_ON

I'm also experimenting with stress-ng as a reproducer, no luck so far.

A third machine with an older Skylake CPU died overnight, but nothing
was logged over netconsole. Luckily it actually has a serial header on
the motherboard, so that's wired up and it's running again, maybe it
dies in a different way that might be a better clue...

> > Thanks,
> > Calvin
> >
> > > Sebastian
