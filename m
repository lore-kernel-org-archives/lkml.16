Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA042288CB
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 16:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750782193; cv=none; b=QwT6s1UJiCOAQ5scSgoD1WxIjz09w+33P2bKTKeMAWXJ692MQF1NTfSn9VdBvBAj0YUhBpNaP44YoR2pyVY2r57O1ryN/mcQkvUKeD8Oxete+ylngV/Cpz7+2t+78DsTPFws7EgpxRvdpHDGwtodhJC7hILiDoxwrPkiW76tG0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750782193; c=relaxed/simple;
	bh=1Rc21hdBhJ2gdI2HBkCH5J1X95BOgohLovrNBhxWY4k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=agCfhmGiG1pEr4YM9Lnn+JNRqGvuChl+k+jAHAkt0xiUG5m0qN1+uTZeIlHXwkdCdlbzQSYFXOx2TKedP/a7Jw5SdRvahtpuzBN8FrijziH7o5E15IuEz9lgwhAqxHJaobAUwadDiJZwlvf34G6lORVtkXiwVdkif6iB1WV+isw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IhnnQEl0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IhnnQEl0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750782190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SQ1cJVJB4QesCVy0GBfFAaNnQlE6Nxw4fvJZ0MPFAG0=;
	b=IhnnQEl0fEs+s4L62/2sWx7PNrSzF11NZiCN+a+2M75iJwcYsRCjxJrrNzF966gyYqjE/e
	macwr3kV+Xb3Pbgkry+/X2sA1Ql9zSS6aYygt46HnMtTrTy/2meE5+wsl22j8CGMBCIDdH
	q1TQfmy6Nvb0+0LrvPgqp4YCNNEQRZI=
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-1U0cl4aHNcaC3ZipVUHd8w-1; Tue, 24 Jun 2025 12:23:07 -0400
X-MC-Unique: 1U0cl4aHNcaC3ZipVUHd8w-1
X-Mimecast-MFC-AGG-ID: 1U0cl4aHNcaC3ZipVUHd8w_1750782186
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-86cf14fd106so74848139f.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:23:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750782186; x=1751386986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SQ1cJVJB4QesCVy0GBfFAaNnQlE6Nxw4fvJZ0MPFAG0=;
        b=GtgdslbEqmlEXAQKzuGX3kTe153zd2TLILj/DjU4/wCojqggELLL1wsWycAciuDnsQ
         skZ3/6lDcok/KKGFnlyPlQGl6Q/CkIl7HZB7uW6O7OW9XHzd1Y4at7t96kD/evFBoIFQ
         NxwV34NMPYXytlQA/XOR+3d6dk8QkEao66V0hgfSeYBbhEAwUYnWspDJrZpuFfBZJND2
         w9xuQIZHZjETWUl7jaqkuNbAvxG+uiBGZ15qO9+7FKFV3BJYGmrpZfWVv0y6++oi7WBQ
         RSLX0xLdGDWvIhrO72r11G84fZ18fB1y+Igm8t7rdy59r6TG6w4cPCk2hyHwGCRc6jdl
         0nBg==
X-Forwarded-Encrypted: i=1; AJvYcCXpJPgTb+8sP5+E7PLKxZmNIL5TAoR21fUHjPj0tIRugqAvPdqZyj3zZvHCVlPNf3esLf0KfN8CSVN9ywo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKpRag8u6oNmZdm50xzgOpAYVHiY1e5gyVA5naHiD6s7zCdj5T
	3lGnfsTQj0iOG7gkrp8pINmYkqPOxIC6yUpLnsYM9fDJwu0yHYBiY7IaFNwTlpMRyFGRdLv/URo
	q505h1YRGuqwAO58OidNS34xeE7bFe8RgaulLat+q4/wlNL327x9UmnUaORany0hlCQ==
X-Gm-Gg: ASbGnct87+JQ58I4/qEEgfx9Mb7URyiqjghSo1Th80Zny9D/m7XHN/HbjYcOjztVbHw
	sQzKuPRH2/IJ8AGapSUs6/Z9luAmo0/SgcoM7Dw8BBF/wRRHhDQ+F9C0yhtaRKd/3bResIKnSh2
	ermFQ6S4vB6hhgDH6DpyEfpldvGyI53rKIW24HRAbKXIm4jwatPVYNG/kXxT5dt2N3ZvIhS0NSQ
	VhdJZL2qjcAZIN2ixCAajI2qufNC/zs23Rlj83dbtYIPXH2firULwWYoVUngfJpAMiiUWKreigL
	Hd6440dINHeznQjvHuY0lpZzbA==
X-Received: by 2002:a05:6602:640f:b0:875:b57e:a0fc with SMTP id ca18e2360f4ac-8762d1becf7mr503746739f.3.1750782186459;
        Tue, 24 Jun 2025 09:23:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTnsp2pZHJe4II+8eyu4oI1Cg1b4CQFUWx851KUXDAmhSM9KEnJdvxhnVMCr2Icu2bDJRVwA==
X-Received: by 2002:a05:6602:640f:b0:875:b57e:a0fc with SMTP id ca18e2360f4ac-8762d1becf7mr503745439f.3.1750782185914;
        Tue, 24 Jun 2025 09:23:05 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5019e04e4c6sm2307707173.89.2025.06.24.09.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 09:23:04 -0700 (PDT)
Date: Tue, 24 Jun 2025 10:23:03 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Alex Mastro <amastro@fb.com>, peterx@redhat.com, kbusch@kernel.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] vfio/pci: print vfio-device name to fdinfo
Message-ID: <20250624102303.75146159.alex.williamson@redhat.com>
In-Reply-To: <20250624005605.GA72557@ziepe.ca>
References: <20250623-vfio-fdinfo-v1-1-c9cec65a2922@fb.com>
	<20250623161831.12109402.alex.williamson@redhat.com>
	<20250624005605.GA72557@ziepe.ca>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 23 Jun 2025 21:56:05 -0300
Jason Gunthorpe <jgg@ziepe.ca> wrote:

> On Mon, Jun 23, 2025 at 04:18:31PM -0600, Alex Williamson wrote:
> > > Alternatively, if we wanted to normalize show_fdinfo formatting, this
> > > could instead hoist the print formatting up into vfio_main.c, and call
> > > an optional vfio_device_ops->instance_name() to get the name. I opted
> > > not to do this here due to unfamiliarity with other vfio drivers, but am
> > > open to changing it.  
> > 
> > TBH, I don't think we need a callback, just use dev_name() in
> > vfio_main.  
> 
> IMHO this should really be the name of /dev/vfio/XX file and not
> something made up like event fd uses.
> 
> The file was opened via /dev/vfio/XX, that is what lsof should report..
> 
> For the legacy route this effectively gives you the iommu group.

We don't need fdinfo for this, right?  The group is clearly visible in
/proc/PID/fd:

# ls -l | grep vfio
lrwx------. 1 qemu qemu 64 Jun 24 09:27 32 -> /dev/vfio/16
lrwx------. 1 qemu qemu 64 Jun 24 09:27 33 -> /dev/vfio/vfio
lrwx------. 1 qemu qemu 64 Jun 24 09:27 34 -> anon_inode:kvm-vfio
lrwx------. 1 qemu qemu 64 Jun 24 09:27 35 -> anon_inode:[vfio-device]
lrwx------. 1 qemu qemu 64 Jun 24 09:27 38 -> /dev/vfio/2
lrwx------. 1 qemu qemu 64 Jun 24 09:27 39 -> anon_inode:[vfio-device]
lrwx------. 1 qemu qemu 64 Jun 24 09:27 44 -> anon_inode:[vfio-device]
lrwx------. 1 qemu qemu 64 Jun 24 09:27 49 -> /dev/vfio/12
lrwx------. 1 qemu qemu 64 Jun 24 09:27 50 -> anon_inode:[vfio-device]
lrwx------. 1 qemu qemu 64 Jun 24 09:27 55 -> /dev/vfio/4
lrwx------. 1 qemu qemu 64 Jun 24 09:27 56 -> anon_inode:[vfio-device]

An iommufd/vfio-cdev VM even more clearly shows the devices:

# ls -l | grep vfio
lrwx------. 1 root root 64 Jun 24 10:06 23 -> /dev/vfio/devices/vfio7
lrwx------. 1 root root 64 Jun 24 10:06 24 -> anon_inode:kvm-vfio
lrwx------. 1 root root 64 Jun 24 10:06 30 -> /dev/vfio/devices/vfio8

I think we're specifically trying to gain visibility to the
anon_inode:[vfio-device] in the legacy case.

The @name passed to anon_inode_getfile_fmode() is described as the name
of the "class", which is why I think we used the static
"[vfio-device]", but I see KVM breaks the mold, adding the vcpu_id:

	snprintf(name, sizeof(name), "kvm-vcpu-stats:%d", vcpu->vcpu_id);

We could do something similar, but maybe fdinfo is the better option,
and if it is then dev_name() seems like the useful thing to add there
(though we could add more than one thing).

> For the new route this will give you the struct device.
> 
> The userspace can deduce more information, like the actual PCI BDF, by
> mapping the name through sysfs.

I don't really know what the rules are here, whether we're able to
report information for convenience or we should strive for the absolute
most concise reference.  cdev and group information is available
without fdinfo.

> I would have guessed this is already happening automatically as part
> of the cdev mechanism? Maybe we broken it when we changed the inode to
> use unmap mapping range?
> 
> > The group interface always requires the name, in some cases
> > it can require further information, but we seem to have forgotten that
> > in the cdev interface anyway :-\  
> 
> ?

I don't recall if or how we accounted for the concept of vf_tokens in
the cdev model and I don't see evidence that we did.  For instance
vfio_pci_validate_vf_token() is only called from vfio_pci_core_match(),
which is called as match through the vfio_device_ops, but only from
vfio_group_ioctl_get_device_fd().  So using cdev, it appears we don't
have the same opt-in requirement when using a VF where the PF is
managed by a vfio-pci userspace driver.  Thanks,

Alex

