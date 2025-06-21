Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BA018D
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 07:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750490659; cv=none; b=HqL8UAb9dQS+l/CcvCah749PWD+jclI7u+jg5YU3m4YQLBuq46lc+4+WEouIFX337exGxqpcinZJMVP97ERaUmErvkwaV+hTV2bQoChax3+E7R31kwRkN5OvVviWjmQtknpbuVqz+Rn+tEjbml424kFDLIDKHm9SRU8pFD/b3aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750490659; c=relaxed/simple;
	bh=H9u8nVYW4zA3crI5DG82Ji8l+AgbkzkClgr6O4o+gdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lJ9h664nj0f5zQxKp4Quk61d+HvjOLSa5LqF+ky2nIDzYlUNoI9SsGO4kjCYBkCods04mOluc6dnrs0DKbQd5USEUAJaiJijSrfdV6U6ipWGAVw9RYXHen+nnXUYweweNEiE/Pyu/BQTm9xcIYHd08U4XyqrcZ3hgL7B9IXGOt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org; spf=pass smtp.mailfrom=wbinvd.org; dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b=HktGL8Gj; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b="HktGL8Gj"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so1860453b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 00:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1750490657; x=1751095457; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+HeWIsoVT6FkKzrfKSamEov0QwXhFYmWGVZQGord2Kg=;
        b=HktGL8Gj+pdp3c1pqAq7iXq5TeW9NFkOON7JzZx3TdS2gBjad4l3DpbGZY9a8tP9cT
         97zbN/3eF12f3/ueWruoE8RdGAUwGm+32gashhfu3CfiGhbYDHyD2Quknww+DlYIyP5T
         eSi1vsj2M8TKVhI3GLv8U4CaNnA86In1dIE9ZbeYUYcSUkmLnq6W3szWbIjxboRr1jJY
         fErYBAScNmJuLb/XnyiDGQ7CYytTmaMKfrD6RNGBG6ojDP0MRChceG1RyGEpM+72712k
         dH/famnPgeiXiC2O/YImM2hlyaEGTdYwJ/wwVSfEL1itlzDe7TzyJwhSlGSlS530GcIM
         g7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750490657; x=1751095457;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+HeWIsoVT6FkKzrfKSamEov0QwXhFYmWGVZQGord2Kg=;
        b=C55tymtFOPJ22NYGga+oCsmm+T0/YhJgFKHiw8IMDljJR3vfRr/G4wlzYKwjlfibNG
         AcryaX5jKfk56G0VbdVZjX6DeQERaxG4K28O+6BUA1QuFx020LNursXh0nHmDd/Jod4e
         lFMWTTKe1HrqhXhEWIJaPYfUl1iqPNLw3hciLR9PQVPeYEh3SS9ZcV63TcTM9rfsenGl
         fZOL/03kIzayM+dx6AkYa1xTmtlyfRvFEL3ssZC6b0RU+976xCQpwbMQVCJi7C1DWskn
         NiC9xzMxaN/7zxny07cIavI9O31Ec15HuGbiPX5pDtnQ8nev+Jyh6GjHGhdAMKnkfNF5
         xlpQ==
X-Gm-Message-State: AOJu0YyFUtNoZudKiMc1geJT7nZEQT8RaPtdy2tjb4//xis+mMuJwJAi
	jcI8NcQUu7Jl3ioljvCLvgdoQ5TwPAaLZv826NJMsW4A3KHJo5Wbh+8Iksoio/3rm9/5JEpibhG
	V3GL4
X-Gm-Gg: ASbGnctput5ZOMUCg8w1dEfA/DrcTHitC8kPOdwKHVV/bk0HqxqhUvpmN4RF+BrjaoC
	S0tpqlTuarLfleyTE1V6jQOfTDh+Co/neI1BA8bJWhAeBgFcwUL5LGn59nUbwhiPB6WgLKIn1iC
	mx64Gi/64lZWDXfFkb2++BR6KNgx4wIPGJ43tv2SZ+A0UMPUuzRHJCD/g35ahRMXDlA+0D32PSU
	RZWs472SxOxDJL1sjYq7C7mdGoCvkGumL9QoFwa0wnvnGjctsjJl65FBVbpxRWFUDAUEcXumw+5
	MZ9SR/6gGL0+cozCGOkI301eFOgoo6IL6Cg7gQqUBW03l7uYuPtsS6BxCec0+c8Pvz3vAORqX0s
	/n8CefVHuyIBOEjeDjrOKNoYdHpxvybw=
X-Google-Smtp-Source: AGHT+IExIo4Nhbuk9/L4h7Jp3TstTkBts3vWPdZmgTtFeh+z+4HF1LmFfSQKIBMdGT3cIeIpOfiV6A==
X-Received: by 2002:a05:6a21:32a3:b0:1f5:8c05:e8f8 with SMTP id adf61e73a8af0-22026d8fa8bmr9459597637.25.1750490656640;
        Sat, 21 Jun 2025 00:24:16 -0700 (PDT)
Received: from mozart.vkv.me (192-184-162-253.fiber.dynamic.sonic.net. [192.184.162.253])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f118f647sm2751391a12.16.2025.06.21.00.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 00:24:16 -0700 (PDT)
Date: Sat, 21 Jun 2025 00:24:14 -0700
From: Calvin Owens <calvin@wbinvd.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, "Lai, Yi" <yi1.lai@linux.intel.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, x86@kernel.org
Subject: Re: [tip: locking/urgent] futex: Allow to resize the private local
 hash
Message-ID: <aFZeHv72yPGovnRv@mozart.vkv.me>
References: <aFGTmn_CFkuTbP4i@mozart.vkv.me>
 <20250618160333.PdGB89yt@linutronix.de>
 <aFLuDoX9BGBUC3tW@mozart.vkv.me>
 <20250618170924.Z34OXf1E@linutronix.de>
 <aFMoDcWy-OzE3yoV@mozart.vkv.me>
 <aFNCHS-5LLywIAC7@mozart.vkv.me>
 <aFR8EuMg82aMCvjo@mozart.vkv.me>
 <20250620103110.xd5CEFDs@linutronix.de>
 <aFWuwdJUEUD8VcTJ@mozart.vkv.me>
 <aFYEpPIwhlL1WvR0@mozart.vkv.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aFYEpPIwhlL1WvR0@mozart.vkv.me>

On Friday 06/20 at 18:02 -0700, Calvin Owens wrote:
> On Friday 06/20 at 11:56 -0700, Calvin Owens wrote:
> > On Friday 06/20 at 12:31 +0200, Sebastian Andrzej Siewior wrote:
> > > On 2025-06-19 14:07:30 [-0700], Calvin Owens wrote:
> > > > > Machine #2 oopsed with the GCC kernel after just over an hour:
> > > > > 
> > > > >     BUG: unable to handle page fault for address: ffff88a91eac4458
> > > > >     RIP: 0010:futex_hash+0x16/0x90
> > > …
> > > > >     Call Trace:
> > > > >      <TASK>
> > > > >      futex_wait_setup+0x51/0x1b0
> > > …
> > > 
> > > The futex_hash_bucket pointer has an invalid ->priv pointer.
> > > This could be use-after-free or double-free. I've been looking through
> > > your config and you don't have CONFIG_SLAB_FREELIST_* set. I don't
> > > remember which one but one of the two has a "primitiv" double free
> > > detection. 
> > > 
> > > …
> > > > I am not able to reproduce the oops at all with these options:
> > > > 
> > > >     * DEBUG_PAGEALLOC_ENABLE_DEFAULT
> > > >     * SLUB_DEBUG_ON
> > > 
> > > SLUB_DEBUG_ON is something that would "reliably" notice double free.
> > > If you drop SLUB_DEBUG_ON (but keep SLUB_DEBUG) then you can boot with
> > > slab_debug=f keeping only the consistency checks. The "poison" checks
> > > would be excluded for instance. That allocation is kvzalloc() but it
> > > should be small on your machine to avoid vmalloc() and use only
> > > kmalloc().
> > 
> > I'll try slab_debug=f next.
> 
> I just hit the oops with SLUB_DEBUG and slab_debug=f, but nothing new
> was logged.

I went back to the original GCC config, and set up yocto to log what it
was doing over /dev/kmsg so maybe we can isolate the trigger.

I got a novel oops this time:

    BUG: kernel NULL pointer dereference, address: 0000000000000000
    #PF: supervisor read access in kernel mode
    #PF: error_code(0x0000) - not-present page
    PGD 0 P4D 0 
    Oops: Oops: 0000 [#1] SMP
    CPU: 6 UID: 0 PID: 12 Comm: kworker/u128:0 Not tainted 6.16.0-rc2-gcc-00269-g11313e2f7812 #1 PREEMPT 
    Hardware name: Gigabyte Technology Co., Ltd. A620I AX/A620I AX, BIOS F3 07/10/2023
    Workqueue: netns cleanup_net
    RIP: 0010:default_device_exit_batch+0xd0/0x2f0
    Code: 00 00 00 66 66 2e 0f 1f 84 00 00 00 00 00 66 66 2e 0f 1f 84 00 00 00 00 00 66 66 2e 0f 1f 84 00 00 00 00 00 66 0f 1f 44 00 00 <49> 8b 94 24 40 01 00 00 4c 89 e5 49 8d 84 24 40 01 00 00 48 39 04
    RSP: 0018:ffffc900001c7d58 EFLAGS: 00010202
    RAX: ffff888f1bacc140 RBX: ffffc900001c7e18 RCX: 0000000000000002
    RDX: ffff888165232930 RSI: 0000000000000000 RDI: ffffffff82a00820
    RBP: ffff888f1bacc000 R08: 0000036dae5dbcdb R09: ffff8881038c5300
    R10: 000000000000036e R11: 0000000000000001 R12: fffffffffffffec0
    R13: dead000000000122 R14: dead000000000100 R15: ffffc900001c7dd0
    FS:  0000000000000000(0000) GS:ffff888cccd6b000(0000) knlGS:0000000000000000
    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    CR2: 0000000000000000 CR3: 0000000a414f4000 CR4: 0000000000350ef0
    Call Trace:
     <TASK>
     ops_undo_list+0xd9/0x1e0
     cleanup_net+0x1b2/0x2c0
     process_one_work+0x148/0x240
     worker_thread+0x2d7/0x410
     ? rescuer_thread+0x500/0x500
     kthread+0xd5/0x1e0
     ? kthread_queue_delayed_work+0x70/0x70
     ret_from_fork+0xa0/0xe0
     ? kthread_queue_delayed_work+0x70/0x70
     ? kthread_queue_delayed_work+0x70/0x70
     ret_from_fork_asm+0x11/0x20
     </TASK>
    CR2: 0000000000000000
    ---[ end trace 0000000000000000 ]---
    2025-06-20 23:47:28 - INFO     - ##teamcity[message text='recipe libaio-0.3.113-r0: task do_populate_sysroot: Succeeded' status='NORMAL']
    2025-06-20 23:47:28 - ERROR    - ##teamcity[message text='recipe libaio-0.3.113-r0: task do_populate_sysroot: Succeeded' status='NORMAL']
    RIP: 0010:default_device_exit_batch+0xd0/0x2f0
    Code: 00 00 00 66 66 2e 0f 1f 84 00 00 00 00 00 66 66 2e 0f 1f 84 00 00 00 00 00 66 66 2e 0f 1f 84 00 00 00 00 00 66 0f 1f 44 00 00 <49> 8b 94 24 40 01 00 00 4c 89 e5 49 8d 84 24 40 01 00 00 48 39 04
    RSP: 0018:ffffc900001c7d58 EFLAGS: 00010202
    RAX: ffff888f1bacc140 RBX: ffffc900001c7e18 RCX: 0000000000000002
    RDX: ffff888165232930 RSI: 0000000000000000 RDI: ffffffff82a00820
    RBP: ffff888f1bacc000 R08: 0000036dae5dbcdb R09: ffff8881038c5300
    R10: 000000000000036e R11: 0000000000000001 R12: fffffffffffffec0
    R13: dead000000000122 R14: dead000000000100 R15: ffffc900001c7dd0
    FS:  0000000000000000(0000) GS:ffff888cccd6b000(0000) knlGS:0000000000000000
    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    CR2: 0000000000000000 CR3: 000000000361a000 CR4: 0000000000350ef0
    Kernel panic - not syncing: Fatal exception
    Kernel Offset: disabled
    ---[ end Kernel panic - not syncing: Fatal exception ]---

Based on subtracting the set of things that had completed do_compile from
the set of things that started, it was building:

    clang-native, duktape, linux-upstream, nodejs-native, and zstd

...when it oopsed. The whole 5MB log is in "new-different-oops.txt".

> > > > I'm also experimenting with stress-ng as a reproducer, no luck so far.
> > > 
> > > Not sure what you are using there. I think cargo does:
> > > - lock/ unlock in a threads
> > > - create new thread which triggers auto-resize
> > > - auto-resize gets delayed due to lock/ unlock in other threads (the
> > >   reference is held)
> > 
> > I've tried various combinations of --io, --fork, --exec, --futex, --cpu,
> > --vm, and --forkheavy. It's not mixing the operations in threads as I
> > understand it, so I guess it won't ever do anything like what you're
> > describing no matter what stressors I run?
> > 
> > I did get this message once, something I haven't seen before:
> > 
> >     [33024.247423] [    T281] sched: DL replenish lagged too much
> > 
> > ...but maybe that's my fault for overloading it so much.
> > 
> > > And now something happens leading to what we see.
> > > _Maybe_ the cargo application terminates/ execs before the new struct is
> > > assigned in an unexpected way.
> > > The regular hash bucket has reference counting so it should raise
> > > warnings if it goes wrong. I haven't seen those.
> > > 
> > > > A third machine with an older Skylake CPU died overnight, but nothing
> > > > was logged over netconsole. Luckily it actually has a serial header on
> > > > the motherboard, so that's wired up and it's running again, maybe it
> > > > dies in a different way that might be a better clue...
> > > 
> > > So far I *think* that cargo does something that I don't expect and this
> > > leads to a memory double-free. The SLUB_DEBUG_ON hopefully delays the
> > > process long enough that the double free does not trigger.
> > > 
> > > I think I'm going to look for a random rust packet that is using cargo
> > > for building (unless you have a recommendation) and look what it is
> > > doing. It was always cargo after all. Maybe this brings some light.
> > 
> > The list of things in my big build that use cargo is pretty short:
> > 
> >     === Dependendency Snapshot ===
> >     Dep    =mc:house:cargo-native.do_install
> >     Package=mc:house:cargo-native.do_populate_sysroot
> >     RDep   =mc:house:cargo-c-native.do_prepare_recipe_sysroot
> >             mc:house:cargo-native.do_create_spdx
> >             mc:house:cbindgen-native.do_prepare_recipe_sysroot
> >             mc:house:librsvg-native.do_prepare_recipe_sysroot
> >             mc:house:librsvg.do_prepare_recipe_sysroot
> >             mc:house:libstd-rs.do_prepare_recipe_sysroot
> >             mc:house:python3-maturin-native.do_prepare_recipe_sysroot
> >             mc:house:python3-maturin-native.do_populate_sysroot
> >             mc:house:python3-rpds-py.do_prepare_recipe_sysroot
> >             mc:house:python3-setuptools-rust-native.do_prepare_recipe_sysroot
> > 
> > I've tried building each of those targets alone (and all of them
> > together) in a loop, but that hasn't triggered anything. I guess that
> > other concurrent builds are necessary to trigger whatever this is.
> > 
> > I tried using stress-ng --vm and --cpu together to "load up" the machine
> > while running the isolated targets, but that hasn't worked either.
> > 
> > If you want to run *exactly* what I am, clone this unholy mess:
> > 
> >     https://github.com/jcalvinowens/meta-house
> > 
> > ...setup for yocto and install kas as described here:
> > 
> >     https://docs.yoctoproject.org/ref-manual/system-requirements.html#ubuntu-and-debian
> >     https://github.com/jcalvinowens/meta-house/blob/6f6a9c643169fc37ba809f7230261d0e5255b6d7/README.md#kas
> > 
> > ...and run (for the 32-thread machine):
> > 
> >     BB_NUMBER_THREADS="48" PARALLEL_MAKE="-j 36" kas build kas/walnascar.yaml -- -k
> > 
> > Fair warning, it needs a *lot* of RAM at the high concurrency, I have
> > 96GB with 128GB of swap to spill into. It needs ~500GB of disk space if
> > it runs to completion and downloads ~15GB of tarballs when it starts.
> > 
> > Annoyingly it won't work if the system compiler is gcc-15 right now (the
> > verison of glib it has won't build, haven't had a chance to fix it yet).
> > 
> > > > > > Thanks,
> > > > > > Calvin
> > > 
> > > Sebastian
