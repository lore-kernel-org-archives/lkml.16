Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0EC22D4C0;
	Thu,  6 Feb 2025 14:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738852059; cv=none; b=s7UQ3iAat9JdF6ivrfbmjGaxtPT1bvKVxiPgf2EVtiIb/ceVpqA3sVnW5Jyz2ByD1TApqaSTN5w+3v8wTXccHMB9BMlmmz/pRPM6cDW4G07FPujpPzC4aJu7K5EZJ8uwLbpegqOumE546+onB8tEgvbQ32Y+C4bIf702tcXiBWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738852059; c=relaxed/simple;
	bh=KHUYCR+ZDGP+wllo9nG3RLnnE5iJTx/Qd+4nf5VyrTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X+VB0fAJO4zLn2UmTcwQKZTz10ryOADzYqTlFWbZRQ8wwF8tG4QR7bssENl7GCMSUXGkET2cDlALYgZRK3sXhYkqvSVUOzXw4MUTB9ev9mkDMcGhPPKWAQj6oSyDYfwzFXFKmraf9IsPHQKhh3z1yod8OgSSmXIIkSoYfteOg7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BCEaBwGj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BCEaBwGj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2D92C4CEDF;
	Thu,  6 Feb 2025 14:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738852059;
	bh=KHUYCR+ZDGP+wllo9nG3RLnnE5iJTx/Qd+4nf5VyrTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BCEaBwGjkQmDQaqu05MZWwYn6HphD1loJB67od9Q9BVzvUqalgrWc1r941SqZnbe+
	 J9rSCqOF4QNLIh1y4xFuZ4mRVy+XbmfPzsM5UaP2rp0980VPqHwC1bI14E/tnR4DcK
	 mtEPaxU9RdB6Mt4GVcgz32y+uIOH37yD7OMtwl8s=
Date: Thu, 6 Feb 2025 05:26:52 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Edward Adam Davis <eadavis@qq.com>
Cc: syzbot+90ac8355c8ac84b1b464@syzkaller.appspotmail.com,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] HID: corsair-void: add missing cancel delaywork
Message-ID: <2025020642-uninsured-stipend-f22b@gregkh>
References: <67a3a3b0.050a0220.19061f.05e8.GAE@google.com>
 <tencent_65865F89A52EED6ECB8C8D67E1C6FAD2FC06@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_65865F89A52EED6ECB8C8D67E1C6FAD2FC06@qq.com>

On Thu, Feb 06, 2025 at 10:52:35AM +0800, Edward Adam Davis wrote:
> syzbot report a slab-use-after-free Read in usbhid_raw_request. [1]
> 
> The delayed_status_work still runs after usb device is removed.
> 
> [1]
> BUG: KASAN: slab-use-after-free in usb_control_msg+0x434/0x4b0 drivers/usb/core/message.c:157
> Read of size 4 at addr ffff88812223c67c by task kworker/0:3/2954
> 
> CPU: 0 UID: 0 PID: 2954 Comm: kworker/0:3 Not tainted 6.13.0-syzkaller-09485-g72deda0abee6 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
> Workqueue: events corsair_void_status_work_handler
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:94 [inline]
>  dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
>  print_address_description mm/kasan/report.c:378 [inline]
>  print_report+0xc3/0x620 mm/kasan/report.c:489
>  kasan_report+0xd9/0x110 mm/kasan/report.c:602
>  usb_control_msg+0x434/0x4b0 drivers/usb/core/message.c:157
>  usbhid_set_raw_report drivers/hid/usbhid/hid-core.c:927 [inline]
>  usbhid_raw_request+0x233/0x700 drivers/hid/usbhid/hid-core.c:1295
>  __hid_hw_raw_request drivers/hid/hid-core.c:2457 [inline]
>  hid_hw_raw_request+0x10a/0x150 drivers/hid/hid-core.c:2479
>  corsair_void_request_status+0xc3/0x130 drivers/hid/hid-corsair-void.c:493
>  corsair_void_status_work_handler+0x3f/0xb0 drivers/hid/hid-corsair-void.c:512
>  process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3236
>  process_scheduled_works kernel/workqueue.c:3317 [inline]
>  worker_thread+0x6c8/0xf00 kernel/workqueue.c:3398
>  kthread+0x3af/0x750 kernel/kthread.c:464
>  ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:148
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
>  </TASK>
> 
> Allocated by task 2954:
>  kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
>  kasan_save_track+0x14/0x30 mm/kasan/common.c:68
>  poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
>  __kasan_kmalloc+0x8f/0xa0 mm/kasan/common.c:394
>  kmalloc_noprof include/linux/slab.h:901 [inline]
>  kzalloc_noprof include/linux/slab.h:1037 [inline]
>  usb_alloc_dev+0x55/0xdc0 drivers/usb/core/usb.c:650
>  hub_port_connect drivers/usb/core/hub.c:5426 [inline]
>  hub_port_connect_change drivers/usb/core/hub.c:5663 [inline]
>  port_event drivers/usb/core/hub.c:5823 [inline]
>  hub_event+0x28f9/0x4f40 drivers/usb/core/hub.c:5905
>  process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3236
>  process_scheduled_works kernel/workqueue.c:3317 [inline]
>  worker_thread+0x6c8/0xf00 kernel/workqueue.c:3398
>  kthread+0x3af/0x750 kernel/kthread.c:464
>  ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:148
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
> 
> Freed by task 2968:
>  kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
>  kasan_save_track+0x14/0x30 mm/kasan/common.c:68
>  kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:576
>  poison_slab_object mm/kasan/common.c:247 [inline]
>  __kasan_slab_free+0x37/0x50 mm/kasan/common.c:264
>  kasan_slab_free include/linux/kasan.h:233 [inline]
>  slab_free_hook mm/slub.c:2353 [inline]
>  slab_free mm/slub.c:4609 [inline]
>  kfree+0x294/0x480 mm/slub.c:4757
>  device_release+0xa1/0x240 drivers/base/core.c:2567
>  kobject_cleanup lib/kobject.c:689 [inline]
>  kobject_release lib/kobject.c:720 [inline]
>  kref_put include/linux/kref.h:65 [inline]
>  kobject_put+0x1e4/0x5a0 lib/kobject.c:737
>  put_device+0x1f/0x30 drivers/base/core.c:3773
>  hub_port_connect drivers/usb/core/hub.c:5363 [inline]
>  hub_port_connect_change drivers/usb/core/hub.c:5663 [inline]
>  port_event drivers/usb/core/hub.c:5823 [inline]
>  hub_event+0x1bed/0x4f40 drivers/usb/core/hub.c:5905
>  process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3236
>  process_scheduled_works kernel/workqueue.c:3317 [inline]
>  worker_thread+0x6c8/0xf00 kernel/workqueue.c:3398
>  kthread+0x3af/0x750 kernel/kthread.c:464
>  ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:148
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
> 
> Fixes: 6ea2a6fd3872 ("HID: corsair-void: Add Corsair Void headset family driver")
> Reported-by: syzbot+90ac8355c8ac84b1b464@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=90ac8355c8ac84b1b464
> Signed-off-by: Edward Adam Davis <eadavis@qq.com>
> ---
>  drivers/hid/hid-corsair-void.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hid/hid-corsair-void.c b/drivers/hid/hid-corsair-void.c
> index 6ece56b850fc..83d65fa29a5a 100644
> --- a/drivers/hid/hid-corsair-void.c
> +++ b/drivers/hid/hid-corsair-void.c
> @@ -727,6 +727,7 @@ static void corsair_void_remove(struct hid_device *hid_dev)
>  		power_supply_unregister(drvdata->battery);
>  
>  	cancel_delayed_work_sync(&drvdata->delayed_firmware_work);
> +	cancel_delayed_work_sync(&drvdata->delayed_status_work);
>  	sysfs_remove_group(&hid_dev->dev.kobj, &corsair_void_attr_group);
>  }
>  
> -- 
> 2.43.0
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
