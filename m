Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61F827933A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 14:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751466896; cv=none; b=XEbqKkP2Oh5LG1+FXzR3ic0bEj8Y01eMviPE2weCMVHa4RNGYmTfNUFcPYjRi+mGZ3LABC9Lyc6G/IsFh19qszpVeBzZwyiPFISmWAM5vGKPJx6U3OZPpU7eYMtxfnPr06tmTZW8KurZjmDyMjHrZ0e6tIJ3UMbfl+cxQapyB/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751466896; c=relaxed/simple;
	bh=whjPTZqoz1mpn3P99EDAp4mRg0R9OqWvV40Jvip23Tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fdd2SNkxWRMMo4qS9awYpy+YZL8+4Yhyxp7SBSyMU8h3t80dTLpiIz8bLuSJqQmizdau+KZCXMLbY4U5jg1Qytr8sRfA+98XCyJWdTY0e4iwofn4XvWwIlIbUmIDXYorqGL/RK492IXppbSHi1CPZiTxR2CKhspXe+53wnXq/eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=o1I9sydw; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="o1I9sydw"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4a5840ec53dso83871921cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 07:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751466893; x=1752071693; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3TKAx5VB7svNtSt70XyGj4bAV0TsiO+hpoSUl8zIRR0=;
        b=o1I9sydwGyCmVZfUKOMJa8w4VLjcLNkgsyvRhBJKKS3+hjemyU2bDA834qOVOfPx+G
         rOiM+FcSuND2PkLMX/Gt6eSTYBcwIIdc6WeTlcH4fh05xip/zgb2348Avem6loepg7j7
         LPpr6YF3On+PEdUTkr0KLlJKHoCFj9czzERGThBoJQsf5Cl5acX3Ww+7bEd+XH7Zs2jJ
         TlmU19CeuSosStWfI052ooz6Cj3emVI6uXWvyzijPsooz1WfpdnPteb3JfhStow8VDdh
         GAPOfYY1E9G1ef3IHfBWGLnmGjfclzL3I0V4Hhwahkb7Avfavshfq/NT8DEm09/dtIzD
         ZLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751466893; x=1752071693;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3TKAx5VB7svNtSt70XyGj4bAV0TsiO+hpoSUl8zIRR0=;
        b=lXqtGbLulprTqRNLB/ZGxi9OL8KFyr/nNxKa2dI/X4CsusQxOhXdennHrzk4K0+InG
         n1f/gKtjGOQ04W2rkjl/PmqXpC5FQW22zQTejHfcx6iqTpT3pdWZEBREBP5zdwKFy42N
         K9A8yPKyGfYyfQRBh2/6h6kochkc02IzhS1U4NciTFGSpq5u336MZgj67Olx/auQ74zO
         yigllwlbbUq69KUR8HVMAG1fS0fjWBICtq02vqKpbIhVMK3Mnmf+5Faki/OZZjesNzTD
         ZIaDtW+1xBbO1ptiRjdOYu2pzVknAZxdKVYStI1juYycDc0SoFKrLsHXog4hNpS2x/BA
         RERg==
X-Forwarded-Encrypted: i=1; AJvYcCXf3Cju1ayOwL3XeJlPiRrA743/1My4APtL8LIHnEfIg9qu5dZ9Z8jO78IuzuSAurhSijcaFaoZUblpbz4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDHZWvplB2QBjHBhZ7pIxLGKrxZ3wfmN3Jj5Jb0qJNxu3hYq9I
	jAJzSuCmhpNADkDz8RqUKYmAE1Tee1vv0vtWQcS7a2YvTYLY29QEvDTCAmN8LUrnSME1dkEPOHx
	rw8w=
X-Gm-Gg: ASbGnct6Pg5R/3Nr/BjfulAxHDbDuj/ErP5hFy9Hi5kwNOhhbspL4SPdUom0oeL0FO8
	isz4s4ryCRR/as7co8gFL23dk/IYDHEgHQL/N9b1bp+6zC8PnWEjKL3TjTI58NNA3A806E22OwQ
	1AfLmZsnj4u4lt5AFCALqAEosl5nJUouYr49vWzlCIVJODz28rFU87ntY8Z4eAtlpleAKRiQPQX
	9LDGdB5GZMziaMYdTUV3bR1o73fGxb2Mh6jN3keXu5PtWaFHo+qHyjclG/9w1/V6NrUHVk9fA/o
	JHe0S7wvh1ovCj020a4MAg4dnRGdOKKQxbZkF2O6GImous5gYuNVQ9rTChyELFoHPROBH3ThmE1
	283jh
X-Google-Smtp-Source: AGHT+IE25QtcMu+gRgh1b1a6HlThrjgjgV02E8vVzYyLVIybiHtI0Gk28DDRhtjpHXVj/LjmQjaY+A==
X-Received: by 2002:a05:622a:11cf:b0:4a4:4128:c2ef with SMTP id d75a77b69052e-4a9768d90a6mr43155021cf.6.1751466893357;
        Wed, 02 Jul 2025 07:34:53 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc10bec2sm92040121cf.13.2025.07.02.07.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 07:34:52 -0700 (PDT)
Date: Wed, 2 Jul 2025 10:34:51 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Hillf Danton <hdanton@sina.com>
Cc: syzbot <syzbot+d630bd89141124cc543e@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Boqun Feng <boqun.feng@gmail.com>, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in hub_activate (3)
Message-ID: <fc5f7057-1c91-4354-89d5-f8bdeeae988a@rowland.harvard.edu>
References: <68648254.a70a0220.3b7e22.20c4.GAE@google.com>
 <20250702080515.2160-1-hdanton@sina.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702080515.2160-1-hdanton@sina.com>

On Wed, Jul 02, 2025 at 04:05:14PM +0800, Hillf Danton wrote:
> On Tue, 01 Jul 2025 17:50:28 -0700
> > Hello,
> > 
> > syzbot found the following issue on:
> > 
> > HEAD commit:    1343433ed389 Add linux-next specific files for 20250630
> > git tree:       linux-next
> > console output: https://syzkaller.appspot.com/x/log.txt?x=10d1f88c580000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=66357ac5b0466f16
> > dashboard link: https://syzkaller.appspot.com/bug?extid=d630bd89141124cc543e
> > compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
> > 
> > Unfortunately, I don't have any reproducer for this issue yet.
> > 
> > Downloadable assets:
> > disk image: https://storage.googleapis.com/syzbot-assets/b005e1db0f8c/disk-1343433e.raw.xz
> > vmlinux: https://storage.googleapis.com/syzbot-assets/cb3aa8bfd514/vmlinux-1343433e.xz
> > kernel image: https://storage.googleapis.com/syzbot-assets/e01227599a09/bzImage-1343433e.xz
> > 
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+d630bd89141124cc543e@syzkaller.appspotmail.com
> > 
> > INFO: task kworker/0:0:9 blocked for more than 143 seconds.
> >       Not tainted 6.16.0-rc4-next-20250630-syzkaller #0
> > "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> > task:kworker/0:0     state:D stack:21240 pid:9     tgid:9     ppid:2      task_flags:0x4208060 flags:0x00004000
> > Workqueue: events_power_efficient hub_init_func2
> > Call Trace:
> >  <TASK>
> >  context_switch kernel/sched/core.c:5313 [inline]
> >  __schedule+0x16f5/0x4d00 kernel/sched/core.c:6696
> >  __schedule_loop kernel/sched/core.c:6774 [inline]
> >  schedule+0x165/0x360 kernel/sched/core.c:6789
> >  schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6846
> >  __mutex_lock_common kernel/locking/mutex.c:679 [inline]
> >  __mutex_lock+0x724/0xe80 kernel/locking/mutex.c:747
> >  device_lock include/linux/device.h:884 [inline]
> >  hub_activate+0xb7/0x1ea0 drivers/usb/core/hub.c:1096
> >  process_one_work kernel/workqueue.c:3239 [inline]
> >  process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3322
> >  worker_thread+0x8a0/0xda0 kernel/workqueue.c:3403
> >  kthread+0x70e/0x8a0 kernel/kthread.c:463
> >  ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
> >  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
> >  </TASK>
> 
> Due to lockdep_set_novalidate_class(&dev->mutex) in device_initialize(),
> task hung instead of deadlock is reported once more.
> 
> 	kworker/0:0:9		kworker/0:5:5923
> 	---			---
> 	hub_init_func2()	usb_disconnect()
> 				device_lock()
> 	device_lock()		hub_disconnect()
> 				hub_quiesce()
> 				flush_delayed_work(&hub->init_work);
> 	*** DEADLOCK ***

This analysis looks right.  How would you fix the deadlock?  Make 
hub_disconnect do device_unlock() and device_lock() around the 
flush_delayed_work() call?

Alan Stern
