Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCCF2F2A;
	Sat,  5 Apr 2025 06:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743835400; cv=none; b=SlRRuTtpNcVFgMAEVQep9jfKuvIwuGVJQEmo1UDlC4sZGQdFpi/AcrVoJJD61AR3wTM0gKJQTElybiRrHubnlP7X2e6ooejsTongaIe+nAqp46m3IUMH17rzD0K1npx99x4bky1GhzgP0Vy9VbZTLE9lMN+Vmq4E9owxssjRoqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743835400; c=relaxed/simple;
	bh=E7fYhz/ne81VPG1+Jb2RMsmqXAzSzII95bAA3CzHt0g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pxRKYq465r+NGUv/A90YxlmUJITgDoR+ZE6CAS3YU/i72O4oJxZArgXqK5haNfn69TN2jtMUXgWwsXgvHPgga2VvvNdBfKHMZw/Ll6wfs0yHzYSCjmuQK0xMzsQaNvD47wUr8FSruITcTxq0m6GbTbTAMcvHAGpxQX1CjHHPNFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mYxmDSLz; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mYxmDSLz"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-54af20849bbso2988360e87.0;
        Fri, 04 Apr 2025 23:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743835394; x=1744440194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cdbz3M5v6v3MavVjAqaNSG9JP3b3UDaj0IqZC8HnvyE=;
        b=mYxmDSLzM5TbIA/Lc7SJc4haFTVOJPsW9UheO1+XT4PQfVQOHCWmV7RCxOJaDNeVdl
         O9DtVLaKrX0Lt0Q187amMIauhGX6X1WyhRX2SF3EnezX8c2Hwee1QlxgMsa/KNVgA2Ao
         RXxcLjBP5ulf5PY0USStvfWkFwNR06EZogiFSZmO9R93Tvyz4f+ni87a+Fr9wUJs4GkQ
         z3j6GAeIXXIvsrNPSoruEiGyJQWbGfAQGk85WrjwOy9axlL1uRfb13/+UKVkTukKFnL+
         2OkPZ3V49fC3dwHe0LwMpfmBtcB7PVCKdIO34zyJEZGkuKY/B7AWnCJI6ELeuI7uhQdn
         k9Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743835394; x=1744440194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cdbz3M5v6v3MavVjAqaNSG9JP3b3UDaj0IqZC8HnvyE=;
        b=BLgW0eZGAiFwT7+aQ7PvO/uR5JgY5xcrjp6XV4AwunWx7j+S/ytG7wDa61BZWspnkR
         CX0DmsWJdzdTjJfDNonHnDkuCVEFVnjvitb96UoCABDERRDQsaPBNlkJzxTaVfU4ri/2
         umn3/wrUzRorukdH1GL0XNMfwdDzmxsDgAFHdji7xEWbN9YUF7HHmk5/YObPgtNbaSYU
         7aCnZr+vE69BzT3cyize2ONha2Yb5iVyGEjFODITlFGMJiNfhvk6NkUWA3u7LKZqsYU0
         99iIS2GAZRUNUr5jJZAHaC+YZotjzlNQo8Fi9f5dqwKU2rdVGk+iLx1VBANYIT2RnHRI
         01TA==
X-Forwarded-Encrypted: i=1; AJvYcCUVq14ZyKJxKlYFuQSyrU5iNv/bmphsg9Q6A+nTAF7zaRNeLaH9/YgwEXu/2fZamtvbmSNkoV+QOYfi@vger.kernel.org, AJvYcCWk9a0u4iHJNUxJAe8EeL2CD1zLp3aAbcqSKD8XA2pEh9qZVNKe6vz4y6OdCd5g+SLuZdy7/9lkSTemDaA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPRba0nnS9oLxBEiTF0ylQyKH2Fc4mYi3VbZJMm6V1h+YWd2bn
	ESSK/RMKkuG18io8ys6DNmWrjiGludBxtBdg/K3WhPrSXqtfyv33
X-Gm-Gg: ASbGncvo17zKucH+KwOOHaf4QbgRHoxp29nnr1wA2RG7cl5mHoNapRjpDH0lB15csAx
	6+qqLI6DL9bTxXQuSynUELbrP1yuS+XB1gqqMcQgwYwIlDY4HJ33P5JM+lJF4w6Z3lWo8jhhPhb
	1SnuHNHTv3unfXqqUKFheaRUI6nMQSK7xleUKW0U1BfX0NF9/gCk0mgDX/oLiaYZ0vOOSdo0wCg
	rw9D2YsUp1dv+XPT5RAfW3L+pUasVHGs4WV38+jlf0+ggunZJXTKComz/rT0Vqpa5lZ0fi5LvmJ
	tYhSpxnL8ZzxEycscjErvd/X7cQQZ6SrzC7rBpZQZdDKC91BFpvKGbvNpSPMRQ==
X-Google-Smtp-Source: AGHT+IFeY/Rmfo5n5YgssReQPHBVhF9e5T6Cf42xQVT2ThPprb/2PX9pjvDtT8QTL1HVq7Y/1ksRUA==
X-Received: by 2002:a05:6512:3b9f:b0:545:10eb:1ab2 with SMTP id 2adb3069b0e04-54c2278e0e6mr1497849e87.33.1743835394021;
        Fri, 04 Apr 2025 23:43:14 -0700 (PDT)
Received: from foxbook (adtk238.neoplus.adsl.tpnet.pl. [79.185.222.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e65d51bsm615025e87.186.2025.04.04.23.43.10
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 04 Apr 2025 23:43:12 -0700 (PDT)
Date: Sat, 5 Apr 2025 08:43:07 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, LKML
 <linux-kernel@vger.kernel.org>
Subject: Re: xhci: WARN Set TR Deq Ptr cmd failed due to incorrect slot or
 ep state.
Message-ID: <20250405084307.4080edf4@foxbook>
In-Reply-To: <c279bd85-3069-4841-b1be-20507ac9f2d7@molgen.mpg.de>
References: <c279bd85-3069-4841-b1be-20507ac9f2d7@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

On Thu, 3 Apr 2025 20:02:05 +0200, Paul Menzel wrote:
> Just a heads-up, that connecting an LMP USB-C mini Dock [1] to the
> Intel Kaby Lake Dell XPS 13 9360 with
> 
>      00:14.0 USB controller [0c03]: Intel Corporation Sunrise
> Point-LP USB 3.0 xHCI Controller [8086:9d2f] (rev 21)

This is not the USB bus generating that noise. And the problem appears
to be that some USB device gets reset periodically, probably /dev/sda,
whatever it is. This reset loop is also visible in your new log today.

The warning appears to be connected to that, and the suspend problem
may also be if some mutex stays locked for more than 20s as a result.

Could you check:
1. what exact USB device is getting reset?
2. is it reproducible on master? (seems so)
3. is it reproducible on 6.14, 6.13, ...

> [   74.898485] usb 4-1.4: reset SuperSpeed USB device number 5 using 
> xhci_hcd
> [   74.916241] sd 0:0:0:0: [sda] Media removed, stopped polling
> [   74.916634] sd 0:0:0:0: [sda] Attached SCSI removable disk
> [   98.803081] PM: suspend entry (deep)
> [   98.813999] Filesystems sync: 0.010 seconds
> [   98.819226] Freezing user space processes
> [  105.534176] xhci_hcd 0000:39:00.0: WARN Set TR Deq Ptr cmd failed
> due to incorrect slot or ep state.
> [  105.606437] usb 4-1.4: reset SuperSpeed USB device number 5 using 
> xhci_hcd
> [  118.822270] Freezing user space processes failed after 20.003
> seconds (2 tasks refusing to freeze, wq_busy=0):
> [  118.822281] task:systemd-journal state:D stack:0     pid:474 
> tgid:474   ppid:1      task_flags:0x400100 flags:0x00000006
> [  118.822285] Call Trace:
> [  118.822287]  <TASK>
> [  118.822291]  __schedule+0x537/0xbb0
> [  118.822297]  schedule+0x27/0xd0
> [  118.822300]  schedule_preempt_disabled+0x15/0x20
> [  118.822302]  __mutex_lock.constprop.0+0x4b4/0x890
> [  118.822306]  uevent_show+0x99/0x150
> [  118.822309]  dev_attr_show+0x19/0x40
> [  118.822312]  sysfs_kf_seq_show+0xcd/0x110
> [  118.822315]  seq_read_iter+0x116/0x400
> [  118.822318]  vfs_read+0x299/0x360
> [  118.822321]  ksys_read+0x6b/0xe0
> [  118.822323]  do_syscall_64+0x82/0x9b0
> [  118.822327]  ? arch_exit_to_user_mode_prepare.isra.0+0x16/0x90
> [  118.822331]  ? syscall_exit_to_user_mode+0x37/0x1a0
> [  118.822333]  ? do_syscall_64+0x8e/0x9b0
> [  118.822336]  ? __memcg_slab_free_hook+0xf9/0x140
> [  118.822339]  ? __x64_sys_close+0x3d/0x80
> [  118.822341]  ? kmem_cache_free+0x236/0x460
> [  118.822344]  ? arch_exit_to_user_mode_prepare.isra.0+0x16/0x90
> [  118.822346]  ? syscall_exit_to_user_mode+0x37/0x1a0
> [  118.822348]  ? do_syscall_64+0x8e/0x9b0Dez 21 10:22:08 abreu
