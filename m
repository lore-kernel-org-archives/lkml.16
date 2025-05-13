Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC6D242D94
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 11:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747135382; cv=none; b=DbASpuBotcmsIBOxwv6wDZ7edv0AZVvlqISl2gmmS1X7uPTYlwIFrz/eGs1eHdmL6C8VIhfcrHfpJib2ZYtdvH/mCEuCIsquOaCWNHvozsG3wjgkI5PRGnsQeULhdhEuU2VRcRPwA256wIoBUfvOTdLXn5tSnorCPP/+AWE4dbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747135382; c=relaxed/simple;
	bh=tSTXC3bLSpcD7G1GBYXkFYcyfWGuyZozNLQm0puH37g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ltaho5AF8X8zYpoBjo9Rb/NOpP9jbMNvtEELxSNeOnKqK3SKxXfE33bJ8QT2xWNPyQJPcn7aMtVFrRGA3o2XkxCZk/ss49ZNIWULRTqSP0HZ/zCaQH6iERPfob89xJu9pG26mXGKdjrifVZK4LJIZXGPt61EqJ0k7WLIzVqRVEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=qz9zL4yb; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="qz9zL4yb"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-85e15dc801aso548257339f.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 04:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1747135380; x=1747740180; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GMd9Mw32tylTlIfNhjIKQfPW2uM6xw8n8nk6ZE2GfhM=;
        b=qz9zL4ybP8HPWSUKMe8++nHt+DdHntH1FAM0c+viGyKwBcwbyPCvoBNFQNWsnAjS/7
         rfEL3ICS0a7sKtH4e+4CWcJ2P+xmhqNLO/QwQo3IOOwTM5hPN/mmV0W6dQEOyvfMZ9wG
         dSu829sp40KziSJpMfHSLAhYFUTotUbSzROuCA6pQzjBUphM5E12tspuddjbwIu9cnib
         WQDbJ7/kAttdpzLfpQNxyLBr+Fwn0naJ4hqqsqjF3HED7R5bLVeTFQVpehlYvWVTIgue
         66V+a2mLjaiuuT0jvgc+EyfKmaOahdpz+Xfv65MTPQZ90i92IF+ryQ8xZod7H+RKKmcC
         A3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747135380; x=1747740180;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GMd9Mw32tylTlIfNhjIKQfPW2uM6xw8n8nk6ZE2GfhM=;
        b=wNOMtVI2MRtYnuAl0CmXyVHzES4dVFI7WLGXPjM/UwriK+z+EAZpPmswgzgYLAWR1F
         lMDyL3LSKTEztdrXVYs+xY4tIQArP0c2wybCydsnR+/RcDnncr/pPNjXM7g7gzjOf2up
         EEOSPnbbIOVnkIcj4owgC9vMAya2GR5g1txf3QFhMlZ+IDWS0kUj5Me0cv21AtEFudB0
         93sFJfVcfouXuMInUBR1NVi7zcQjKFamUpZbFVLDI8inTQRyIpnfuLC04hdKAdyjLPTx
         QkFyGL6lwMrWmNOIgWXSU0bEJUYtR0aerHR6iPh6YW75510IbocW0AjDAeMTAK+6fz7I
         Hj5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWJmDbUu7Zn4JM4E7PFdXbBzAtWIuvAqFj0H4+LqfssaEVknPdxP197SvlHER56OERGZmLgIEbIjM+DI/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ0Tc/VY0SRD6Jegbt0bfyo+cXwfZSHO4eKyNDBMP8LVlHP9oy
	lfFJSz3D7DZAmmGof380AF/KsdaVYhGTvcROnOW7k93k0qcILSAXOD+oiaFpwHfYWb/t7WYg9aV
	K
X-Gm-Gg: ASbGncseKiaOSZEd4Fy1E35j5b4QfvQ3rCp6ExRS5xpbr4126rixJw76eYlCIPdNGlx
	cWeGbLwLx9OCGIvKLd5c2AKEBhzKfJtX1PrMc0nHdX66FUwwqZiSHWucjibvqNqrmFpIuSBJK1c
	zhJtky63tdjFBpaUVrZ7JMwChElEo4Qmv96pxFsBy/LsJljnb1NjUsUup+AczouqqY7d/S40oD1
	Cd24pEkH+ZtUuieYmYyCO3psk271fZi1UW98WziiJPeN755bwPk91PQv7WM+L7/l1lnjb3BglON
	15c9zHZ8exlYTBTXu74S2mGE+vx+YnsqhrlSSMpJqrcHM5LYihxfgv8=
X-Google-Smtp-Source: AGHT+IHZ2FDbXNLi4OL3xF5SwaB/7xgFmAeEis6B2PzyuyHL3U3MF+6Tu+p/+hCdOPx/PpdjKFJx0w==
X-Received: by 2002:a05:6830:6486:b0:72b:8aec:fbd4 with SMTP id 46e09a7af769-7322699e5f7mr12138934a34.3.1747135368962;
        Tue, 13 May 2025 04:22:48 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:9697:71e9:e239:bcd2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7322647eb00sm1907216a34.2.2025.05.13.04.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 04:22:47 -0700 (PDT)
Date: Tue, 13 May 2025 06:22:43 -0500
From: Corey Minyard <corey@minyard.net>
To: Yi Yang <yiyang13@huawei.com>
Cc: openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	lujialin4@huawei.com
Subject: Re: [PATCH] ipmi: fix underflow in ipmi_create_user()
Message-ID: <aCMrg1wqUVi2iCMk@mail.minyard.net>
Reply-To: corey@minyard.net
References: <20250513081622.125071-1-yiyang13@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513081622.125071-1-yiyang13@huawei.com>

On Tue, May 13, 2025 at 08:16:22AM +0000, Yi Yang wrote:
> Syzkaller reported this bug:
> ==================================================================
> BUG: KASAN: global-out-of-bounds in instrument_atomic_read_write include/linux/instrumented.h:96 [inline]
> BUG: KASAN: global-out-of-bounds in atomic_dec include/linux/atomic/atomic-instrumented.h:592 [inline]
> BUG: KASAN: global-out-of-bounds in ipmi_create_user.part.0+0x5e5/0x790 drivers/char/ipmi/ipmi_msghandler.c:1291
> Write of size 4 at addr ffffffff8fc6a438 by task syz.5.1074/5888

This code has been completely rewritten in the next tree and already
fixed.

-corey

> 
> CPU: 0 PID: 5888 Comm: syz.5.1074 Not tainted 6.6.0+ #60
> ......
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:88 [inline]
>  dump_stack_lvl+0x72/0xa0 lib/dump_stack.c:106
>  print_address_description.constprop.0+0x6b/0x3d0 mm/kasan/report.c:364
>  print_report+0xba/0x280 mm/kasan/report.c:475
>  kasan_report+0xa9/0xe0 mm/kasan/report.c:588
>  check_region_inline mm/kasan/generic.c:181 [inline]
>  kasan_check_range+0x100/0x1c0 mm/kasan/generic.c:187
>  instrument_atomic_read_write include/linux/instrumented.h:96 [inline]
>  atomic_dec include/linux/atomic/atomic-instrumented.h:592 [inline]
>  ipmi_create_user.part.0+0x5e5/0x790 drivers/char/ipmi/ipmi_msghandler.c:1291
>  ipmi_create_user+0x56/0x80 drivers/char/ipmi/ipmi_msghandler.c:1236
>  ipmi_open+0xac/0x2b0 drivers/char/ipmi/ipmi_devintf.c:97
>  chrdev_open+0x276/0x700 fs/char_dev.c:414
>  do_dentry_open+0x6a7/0x1410 fs/open.c:929
>  vfs_open+0xd1/0x440 fs/open.c:1060
>  do_open+0x957/0x10d0 fs/namei.c:3671
>  path_openat+0x258/0x770 fs/namei.c:3830
>  do_filp_open+0x1c7/0x410 fs/namei.c:3857
>  do_sys_openat2+0x5bd/0x6a0 fs/open.c:1428
>  do_sys_open fs/open.c:1443 [inline]
>  __do_sys_openat fs/open.c:1459 [inline]
>  __se_sys_openat fs/open.c:1454 [inline]
>  __x64_sys_openat+0x17a/0x210 fs/open.c:1454
>  do_syscall_x64 arch/x86/entry/common.c:51 [inline]
>  do_syscall_64+0x59/0x110 arch/x86/entry/common.c:81
>  entry_SYSCALL_64_after_hwframe+0x78/0xe2
> RIP: 0033:0x54d2cd
> Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007f4751920048 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
> RAX: ffffffffffffffda RBX: 0000000000796080 RCX: 000000000054d2cd
> RDX: 0000000000000000 RSI: 0000000020004280 RDI: ffffffffffffff9c
> RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
> R10: 000000000000001e R11: 0000000000000246 R12: 000000000079608c
> R13: 0000000000000000 R14: 0000000000796080 R15: 00007f4751900000
>  </TASK>
> 
> The buggy address belongs to the variable:
>  ipmi_interfaces+0x38/0x40
> 
> The buggy address belongs to the physical page:
> page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x45a6a
> flags: 0x3fffff00004000(reserved|node=0|zone=1|lastcpupid=0x1fffff)
> raw: 003fffff00004000 ffffea0001169a88 ffffea0001169a88 0000000000000000
> raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
> page dumped because: kasan: bad access detected
> 
> Memory state around the buggy address:
>  ffffffff8fc6a300: 00 00 00 00 f9 f9 f9 f9 00 00 00 00 f9 f9 f9 f9
>  ffffffff8fc6a380: 00 00 f9 f9 f9 f9 f9 f9 00 00 00 00 f9 f9 f9 f9
> >ffffffff8fc6a400: 00 00 f9 f9 f9 f9 f9 f9 00 00 00 00 f9 f9 f9 f9
>                                         ^
>  ffffffff8fc6a480: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>  ffffffff8fc6a500: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 f9 f9
> ==================================================================
> 
> In the ipmi_create_user() function, the intf->nr_users variable has an
> underflow issue. Specifically, on the exception path (goto out_kfree;)
> before atomic_add_return(), calling atomic_dec() when intf->nr_users has
> not been incremented will result in an underflow.
> 
> Fixes: 8e76741c3d8b ("ipmi: Add a limit on the number of users that may use IPMI")
> Signed-off-by: Yi Yang <yiyang13@huawei.com>
> ---
>  drivers/char/ipmi/ipmi_msghandler.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
> index 3ba9d7e9a6c7..27a12b31cfb6 100644
> --- a/drivers/char/ipmi/ipmi_msghandler.c
> +++ b/drivers/char/ipmi/ipmi_msghandler.c
> @@ -1246,18 +1246,18 @@ int ipmi_create_user(unsigned int          if_num,
>   found:
>  	if (atomic_add_return(1, &intf->nr_users) > max_users) {
>  		rv = -EBUSY;
> -		goto out_kfree;
> +		goto out_dec;
>  	}
>  
>  	INIT_WORK(&new_user->remove_work, free_user_work);
>  
>  	rv = init_srcu_struct(&new_user->release_barrier);
>  	if (rv)
> -		goto out_kfree;
> +		goto out_dec;
>  
>  	if (!try_module_get(intf->owner)) {
>  		rv = -ENODEV;
> -		goto out_kfree;
> +		goto out_dec;
>  	}
>  
>  	/* Note that each existing user holds a refcount to the interface. */
> @@ -1281,8 +1281,9 @@ int ipmi_create_user(unsigned int          if_num,
>  	*user = new_user;
>  	return 0;
>  
> -out_kfree:
> +out_dec:
>  	atomic_dec(&intf->nr_users);
> +out_kfree:
>  	srcu_read_unlock(&ipmi_interfaces_srcu, index);
>  	vfree(new_user);
>  	return rv;
> -- 
> 2.25.1
> 
