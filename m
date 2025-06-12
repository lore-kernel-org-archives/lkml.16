Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F7A1E25F2
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749709250; cv=none; b=UEx/t7NFnPHmVB03SZn3O5PblYreykfKEuurxUjb8BpRZ7g5h9RJMfAfoSzX+q4550+ygsgzkUzRkfDcL3WrTYCgzTHZgioeoIp1za5JcOuhxDbT/OxBos0LLyUdNOYQLpXc9OelqCl6xrazUwyWAmLcC+BVmrQ041QE7m6SibE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749709250; c=relaxed/simple;
	bh=UjKVWN7uen5QtJlj47WJo7MSZiaiu10pJfZXyVbBjLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tjmtw2kvvaLS5j6xwN6HJW2hsVCR+NsuHo18yaPLNkfMnZQDA+Cp9VbO9OKH1jqYAqwDhb6wu/Gn3ViyWvS7P5fB7h8/XhPKpmsUCykgj5DEaqzbYMUx6cl/k7jD2S/5yaPtnbLburM+Xj7I02qgV/ok3dh4q2V8zhdIts+xw/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PJPjyxJE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PJPjyxJE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749709247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=piaS+IvVA5BU5uoyHWio7NQXE3J6rbJilCTVKgCGvkw=;
	b=PJPjyxJEZH6N+jp60tdq7eDjUsXCHix79YpXahvuIbSCGFY7cJMThElBwkvEjmAzrhKJXG
	ldAHxb80YOJGk1eZc+t4dG4qlbcr9EeoyMD8pNpH8u/SkaK6sf96ul7KRlSGVmMsQ1TU9X
	QqcUdzbozHO1tCx4DJGOGwd/5fu6JAA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-OxQPsz7jMqK0-9ZVmPEwwQ-1; Thu, 12 Jun 2025 02:20:46 -0400
X-MC-Unique: OxQPsz7jMqK0-9ZVmPEwwQ-1
X-Mimecast-MFC-AGG-ID: OxQPsz7jMqK0-9ZVmPEwwQ_1749709245
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4f8fd1856so245969f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 23:20:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749709245; x=1750314045;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=piaS+IvVA5BU5uoyHWio7NQXE3J6rbJilCTVKgCGvkw=;
        b=FP6KSw2VFSLVkVJMzAsntUXVQMqxCoV3GhpLMM2BuKaZwCvq/RqZbywbEnWa1Jk6cw
         fA78QpibvBqxVyBuvBNXym+yD0Ze8lX+z0YBggcd0e9iOG92cUD35GQGhm4KF9h/5Iz0
         XtD8oOl6imK4VJFMT8CZw0i3iAZKWlvic/zuPsF8v4aLF2Xeuag8FuqvFU8QT60yUIgp
         wsRQuevmQaqcEzj9zaH7LTe2oxDMwPGLiI3TkAcXZG/5FOXzfLQLwGnY1NUcTneKe+mn
         qtmO1UFWbHeag6wNxJPQyyNp6/8zyui9iFlSCImzJn1+qkOrseWjqur+Pa/3m7Ua+eW3
         Lv+w==
X-Forwarded-Encrypted: i=1; AJvYcCWJWfE82q/iPfgrmCI3TV30lFVgN+nLuxlNfKM/dpKNA+S4H7zCUS0k1Dx/EanpJjIBrkegtOLf/iRjM+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPea14Hj3V/GY17l5xOVWLTDt0R6IfQV7FdjdDxTwesFJ8Aq1X
	3ZzW9pmD54en6gv3d5F9ijr8JcU14PwduDSEzfd+HQQ/IWuO9JmhP9bAA7UVCy7akxqUxoVzjxi
	liv9pmoP/Wz3C/pNr37jd0KGnYnuS2D8wfNUUH6RJfc2dO9DbmD4lO5ctefdYgJldrg==
X-Gm-Gg: ASbGncsS1kQer9mCFlUylYrTei1CS6y2rWh4rXDcqOj6nP14GjDcOgMQJ6aKgfz9PxC
	AyQsvq82xycObrJxSXAhN54jtDju2oXfxOC1uHPtbB5g9t3ssEWEJpCMi6iV5YuiK75GzmAz/Jh
	zVJGBqu0bg3JQGiz3UYF9IVteQdo0yN4v0/XtU4rhxwL/7xbQU8YkNhTUEYUwWdyJ5qEbabmDVV
	bZOlKCLCTlA9l3Mo4QqBWVMkB0MdQBtVywhhZdwu53KVvHiadouCje4/dXm2c2Syjnqw1P/Fe7e
	vp2uvL2xsL3ZbLhE
X-Received: by 2002:a05:6000:2210:b0:3a4:f6ba:51da with SMTP id ffacd0b85a97d-3a561309d4bmr1368858f8f.15.1749709244935;
        Wed, 11 Jun 2025 23:20:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2RtRKGSbUvUXqFG5RCVEOgWfBzpJ3ZXPuVL/rUgYKBarLIkU9OJETs4KF/dDE8YU6wvHsPw==
X-Received: by 2002:a05:6000:2210:b0:3a4:f6ba:51da with SMTP id ffacd0b85a97d-3a561309d4bmr1368835f8f.15.1749709244571;
        Wed, 11 Jun 2025 23:20:44 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a56198a3b4sm980497f8f.21.2025.06.11.23.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 23:20:44 -0700 (PDT)
Date: Thu, 12 Jun 2025 02:20:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cindy Lu <lulu@redhat.com>
Cc: jasowang@redhat.com, michael.christie@oracle.com, sgarzare@redhat.com,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
Subject: Re: [PATCH v11 0/3] vhost: Add support of kthread API
Message-ID: <20250612022012-mutt-send-email-mst@kernel.org>
References: <20250609073430.442159-1-lulu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250609073430.442159-1-lulu@redhat.com>

On Mon, Jun 09, 2025 at 03:33:06PM +0800, Cindy Lu wrote:
> In this series, a new UAPI is implemented to allow   
> userspace applications to configure their thread mode.


> Changelog v2:
>  1. Change the module_param's name to enforce_inherit_owner, and the default value is true.
>  2. Change the UAPI's name to VHOST_SET_INHERIT_FROM_OWNER.
> 
> Changelog v3:
>  1. Change the module_param's name to inherit_owner_default, and the default value is true.
>  2. Add a structure for task function; the worker will select a different mode based on the value inherit_owner.
>  3. device will have their own inherit_owner in struct vhost_dev
>  4. Address other comments
> 
> Changelog v4:
>  1. remove the module_param, only keep the UAPI
>  2. remove the structure for task function; change to use the function pointer in vhost_worker
>  3. fix the issue in vhost_worker_create and vhost_dev_ioctl
>  4. Address other comments
> 
> Changelog v5:
>  1. Change wakeup and stop function pointers in struct vhost_worker to void.
>  2. merging patches 4, 5, 6 in a single patch
>  3. Fix spelling issues and address other comments.
> 
> Changelog v6:
>  1. move the check of VHOST_NEW_WORKER from vhost_scsi to vhost
>  2. Change the ioctl name VHOST_SET_INHERIT_FROM_OWNER to VHOST_FORK_FROM_OWNER
>  3. reuse the function __vhost_worker_flush
>  4. use a ops sturct to support worker relates function
>  5. reset the value of inherit_owner in vhost_dev_reset_owner.
>  
> Changelog v7: 
>  1. add a KConfig knob to disable legacy app support
>  2. Split the changes into two patches to separately introduce the ops and add kthread support.
>  3. Utilized INX_MAX to avoid modifications in __vhost_worker_flush
>  4. Rebased on the latest kernel
>  5. Address other comments
>  
> Changelog v8: 
>  1. Rebased on the latest kernel
>  2. Address some other comments 
>  
> Changelog v9:
>  1. Rebased on the latest kernel. 
>  2. Squashed patches 6‑7. 
>  3. Squashed patches 2‑4. 
>  4. Minor fixes in commit log
>  
> Changelog v10:
>  1.Add support for the module_param.
>  2.Squash patches 3 and 4.
>  3.Make minor fixes in the commit log.
>  4.Fix the mismatched tabs in Kconfig.
>  5.Rebase on the latest kernel.
> 
> Changelog v11:
>  1.make the module_param under Kconfig
>  2.Make minor fixes in the commit log.
>  3.change the name inherit_owner to fork_owner
>  4.add NEW ioctl VHOST_GET_FORK_FROM_OWNER
>  5.Rebase on the latest kernel
>      
> Tested with QEMU with kthread mode/task mode/kthread+task mode
> 
> Cindy Lu (3):
>   vhost: Add a new parameter in vhost_dev to allow user select kthread
>   vhost: Reintroduce kthread mode support in vhost
>   vhost: Add configuration controls for vhost worker's mode


All of this should be squashed in a single patch.

> 
>  drivers/vhost/Kconfig      |  17 +++
>  drivers/vhost/vhost.c      | 234 ++++++++++++++++++++++++++++++++++---
>  drivers/vhost/vhost.h      |  22 ++++
>  include/uapi/linux/vhost.h |  25 ++++
>  4 files changed, 280 insertions(+), 18 deletions(-)
> 
> -- 
> 2.45.0

