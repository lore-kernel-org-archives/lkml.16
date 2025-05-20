Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FAD288535
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 20:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747771696; cv=none; b=ldAIPVNGuN9lgQ5dV9i7DZLSsfUCeT/ZD5wIbynE3uG3rDCMpnAfbMeZRUteprquutNxm/KRiyWo/cQ/CBYUQPoEd+d/85IIpxUKD7qTXEAwna7zP5QXKEJsS2udbPzQ+uwSLavyMfiWoCYPp7fTKwfJe4JI/c8nCANh/mkPFwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747771696; c=relaxed/simple;
	bh=Sp4iowCv17Ki3bVAgnYELgSIyd7FyxFl7J76QdNNy2c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ix/W1c4qFfWd7q6iPBdQMruaABV9Cx2KUSAVU7RUCLbHaavvS3oh8mRXpawScfnZpufCuP70Pg5DoFW9P41AUs+dm1SkP7cvMtQxIOITqAhp1HU59wCbte4KO9uBqkQKH67U4LJBD7DFnkL6z40I/1/geYnEh6oq8zCIKZ4db14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=xMWEREjL; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=m+EIpz59; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="xMWEREjL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="m+EIpz59"
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747771691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SjGt01Hfvh68L0RUZU6CtDchpTZVq/B3lkjldO7grxI=;
	b=xMWEREjLYLUK3n5pRComnJ+FmOoXeXR+SGTlhswpmAASveO1PiYyDeaR//wfu2pqTycFj8
	iOzZwbvgfXXeFpwCXswKpngBmJH+hSZwKR2QVAcN4judoKvDjeKRlEiqr9JOrmmit899KC
	IG3Qr//e5nbUOk7USK0bdxpP+0VXgoEX13Fx5X7isN9GLVSPnaluugSKWoq3i3sCLph5xr
	wYgInjcZCQJATvL1eagg0wVly0sMPKdGwkZiL01ohUWEsosuVooFJCqgtU5bOF8DCncQzU
	qWnHpObEj9Luihl4q3K6/UNeEblMIByTtubBo20hlcyOUNTeOj2LKGz54Juu4Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747771691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SjGt01Hfvh68L0RUZU6CtDchpTZVq/B3lkjldO7grxI=;
	b=m+EIpz59bReTawLDyvq9o0iadq+YB+0DnyQ3TfVLxnERbOUKcnrV1ZbRk2U4s0uAX7EtEf
	8VpzbxoiJgZhm5BA==
To: Jens Axboe <axboe@kernel.dk>, LKML <linux-kernel@vger.kernel.org>
Cc: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
        "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: printk NMI splat on boot
In-Reply-To: <a93e1a96-3685-41c3-8979-472b20dfca14@kernel.dk>
References: <a93e1a96-3685-41c3-8979-472b20dfca14@kernel.dk>
Date: Tue, 20 May 2025 22:14:11 +0206
Message-ID: <84a577t590.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Added Cc: Paul E. McKenney <paulmck@kernel.org>

Hi Jens,

On 2025-05-20, Jens Axboe <axboe@kernel.dk> wrote:
> This has been going on for a while, and finally getting around to
> reporting it. For every boot on my Dell R7625, I get one of these:

Is it possible that you could compile with:

CONFIG_PRINTK_TIME=y
CONFIG_PRINTK_CALLER=y

so that we can see some timestamps and from which CPU the printk calls
are originating from?

> bnxt_en 0000:01:00.2 eno12419np2: renamed from eth2
> usb 1-1.2: new low-speed USB device number 3 using xhci_hcd
> usb 1-1.2: New USB device found, idVendor=047b, idProduct=0011, bcdDevice= 1.00
> usb 3-1: New USB device found, idVendor=1604, idProduct=10c0, bcdDevice= 0.00
> usb 1-1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> rcu: INFO: rcu_sched detected expedited stalls on CPUs/tasks: { 96-.... } 3 jiffies s: 53 root: 0x40/.

The expedited grace period has only been going on for 3 jiffies.

What values are you using for CONFIG_RCU_EXP_CPU_STALL_TIMEOUT and
CONFIG_RCU_CPU_STALL_TIMEOUT?

What CONFIG_*HZ* options are you using?

> rcu: blocking rcu_node structures (internal RCU debug): l=1:96-111:0x1/.
> Sending NMI from CPU 0 to CPUs 96:
> NMI backtrace for cpu 96
> CPU: 96 UID: 0 PID: 3241 Comm: kworker/96:1 Not tainted 6.15.0-rc7+ #254 NONE 
> Hardware name: Dell Inc. PowerEdge R7625/06444F, BIOS 1.11.2 12/18/2024
> Workqueue: usb_hub_wq hub_event [usbcore]
> RIP: 0010:vprintk_emit+0x360/0x430
> Code: 87 01 0f 84 91 00 00 00 c6 05 36 ec 8a 01 01 c6 05 3c ec 8a 01 00 0f b6 05 28 ec 8a 01 84 c0 74 0d f3 90 0f b6 05 1b ec 8a 01 <84> c0 75 f3 e8 47 0d 00 00 80 e7 02 74 01 fb c7 05 bb ec 8c 01 00
> RSP: 0018:ffffbe47220c7b78 EFLAGS: 00000002
> RAX: 0000000000000001 RBX: 0000000000000246 RCX: 0000000000000000
> RDX: 0000000000000000 RSI: 0000000000000002 RDI: ffffffff93019c48
> RBP: ffffbe47220c7c48 R08: 00000000fffdffff R09: ffffa1bf658fffa8
> R10: ffffa1bf64e00000 R11: 0000000000000002 R12: ffffbe47220c7be0
> R13: ffffffff9260f8ee R14: ffffbe47220c7c58 R15: 0000000000000043
> FS:  0000000000000000(0000) GS:ffffa14dd4a34000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000561066512398 CR3: 00000090a0a11002 CR4: 0000000000370ef0
> Call Trace:
>  <TASK>
>  dev_vprintk_emit+0x130/0x140
>  dev_printk_emit+0x3e/0x40
>  ? __dev_printk+0x2d/0x70
>  _dev_info+0x5c/0x5e
>  usb_new_device.cold+0x87/0x3a0 [usbcore]
>  hub_event+0x1113/0x1900 [usbcore]
>  ? __schedule+0x4e5/0xaf0
>  process_one_work+0x140/0x2b0
>  worker_thread+0x2ea/0x430
>  ? process_one_work+0x2b0/0x2b0
>  kthread+0xd4/0x1d0
>  ? kthreads_online_cpu+0xf0/0xf0
>  ret_from_fork+0x2d/0x50
>  ? kthreads_online_cpu+0xf0/0xf0
>  ret_from_fork_asm+0x11/0x20
>  </TASK>
> usb 3-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> usb 1-1.2: Product: Standard USB Keyboard 
> hub 3-1:1.0: USB hub found
> usb 1-1.2: Manufacturer: Silitek
>
> which appears to be this spin section:
>
>         /* We spin waiting for the owner to release us */
>         spin_acquire(&console_owner_dep_map, 0, 0, _THIS_IP_);
>         /* Owner will clear console_waiter on hand off */
>         while (READ_ONCE(console_waiter))
>                 cpu_relax();
>         spin_release(&console_owner_dep_map, _THIS_IP_);

This code is waiting for a CPU to finish printing a line so that it can
take over printing the next line.

If you are using CONFIG_HZ_1000 and a baud rate of 115200bps, you will
only get about 14 characters printed per jiffy. The last line
successfully printed has 68 characters and the expedited grace period
timed out after only 3 jiffies (which would be around 42 characters). So
the numbers and the timeout make sense. But why is the grace period so
short?

John Ogness
