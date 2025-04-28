Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188CE41760
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 20:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745871967; cv=none; b=mX0SNX3gRTLayHD0D9fPHGzPsApBg90v+Owpo6rHHBOfxOGDN8LdwQ45sx+D+E2k+hTqDoBOQ5FsJwRvmp06QZ28nf9wf3nU3sXbVmlgToxvLUY3LLFjRR6ol9m+pPeHXmiN4jt8iKKgDC0IRwwqlaMOM/7+FCU/o9vWmalqsF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745871967; c=relaxed/simple;
	bh=VGf/QmZis3k8gsBX6t/gMBCbXXMSQRWv4SjNTZpDaCA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iJHddQnA3pkPndRWHmDJfW3t+Dgv6b0AwrF7pM4uklQ+y2lpuhZNVnXNb/Lhi+VwcRNN0ENCpfUuhmVaXXW2nS8iDiJ0Iht95LmhpNXuI1oKXyRResMSNsGQn88+Hp6AtK1gKTW8Hgj9sCrJLosPFoOaDrRSUUKGlkM3ELTi0Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XP/GgB2n; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XP/GgB2n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745871964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C4oRenlf6ZXkOZ4M4A7BEPthPXLL9wn8/E4rBWOdjTQ=;
	b=XP/GgB2njEPRvazvAF6Q2LWLVJzIR2OWh8gU2fsbdGb3G8F1ZoGO+KUUhA3b7KtOKTqgB3
	fSl1PyEBeG5bA1cSQNJ2ka3ebM23PEAbuwdyoLCc7ZffSXBMKjIEb3P2lZWuj2F7Z41hM7
	JU/dJ2719lf9ckO2y4r5oBOqecnp6AU=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-HUqUFbCfOQOmLAYsTpc8SA-1; Mon, 28 Apr 2025 16:26:03 -0400
X-MC-Unique: HUqUFbCfOQOmLAYsTpc8SA-1
X-Mimecast-MFC-AGG-ID: HUqUFbCfOQOmLAYsTpc8SA_1745871962
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-85b5c68c390so39384139f.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745871962; x=1746476762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C4oRenlf6ZXkOZ4M4A7BEPthPXLL9wn8/E4rBWOdjTQ=;
        b=BwBlhFohyJYdMA2dDFWgvt/KPLVS7Ybkg7H1bPHrSF+/eK6Nh2opKUb57tvFB2lAv2
         Q6iCcLJ4apQPLQ8ElLAiPrba+TKF6KRmHLrzHGc+8wk2fgsdRmYwmh3BucVSIIN9/PgH
         QWbSBPRxChExHUD/831zHTe2iFsnfnEhcodek9lYTf3BmD6Sp7iCZ3T42lgnVGl6XFpa
         6V6Xf0JwKoCmOFCAtyJoT9E/Dsb7YBaNYkl/nFZBp8wQiOtDfbmoKSMmAO3DRnbPVWN4
         OUJOcZnkgUyAh08Q+QMWIksuqxn+qbviLqdMZyO8Ibl6Czs43suo6KunEAiYAOyJFPns
         jHJg==
X-Forwarded-Encrypted: i=1; AJvYcCW6jpmQM+xeX3TU35jLuUEdCn9/nWfQQUoYG8zUKhm5842sk5oz15KlkcyzrSjuL0qQ4ka5sSaM/F3/+7M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5vgrbFJzT8ZNnQbZVmysdwld4ZeuloEqJR9AXT0vSlD5Z/MW1
	9LoLmqC4eddGmta2wmPfePRJKn9eBb8EUwWTiACx7DtHV7UzLO6oadECjMuAzjlpluRoZPCe7P0
	//vmEivsQsGF0tw98ji95Vb7pPOE1DTAj85QruaQsmIwOKNF8anG5psCqTjMo7A==
X-Gm-Gg: ASbGncvYQEIgMsh85uSMchGux7a2TbXC+ZVx1Ri89kX0kh+jsBa6QQTXNs9JEcLa6At
	WNw/EWq09qD7vTQyI7ZyGuVLDyU3H47NEW9YCWQzroO05/RfJ2D4Ck8qKlmnNb9x6OnnFnraogM
	TKEs+cxXhkZEctlIVd2rdJGDRuDqWIIqU47dlHooFync1KX5CCNp89TYF8kekIsOLHJVK6Fi2T2
	5dAGxcEcvxtOZNJdZsz2kLsYU9Ag3x8TuOSBIYoPTRLqFI3dQieDf/iEor5/zVOzF9on+FFTPPm
	LB6MO2R1zxPpL3s=
X-Received: by 2002:a05:6e02:380e:b0:3d4:6d6f:6e1f with SMTP id e9e14a558f8ab-3d93b63506dmr34582155ab.6.1745871962560;
        Mon, 28 Apr 2025 13:26:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQ6RktMQ/g1jxZuRwgjhMKbfgCiAeUAio6yQ0WrdLPoqp16TVDnE3inrH72mfRdzeBq2m+wQ==
X-Received: by 2002:a05:6e02:380e:b0:3d4:6d6f:6e1f with SMTP id e9e14a558f8ab-3d93b63506dmr34582015ab.6.1745871962207;
        Mon, 28 Apr 2025 13:26:02 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d9314f5772sm21529085ab.41.2025.04.28.13.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:26:01 -0700 (PDT)
Date: Mon, 28 Apr 2025 14:25:58 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Chathura Rajapaksha <chathura.abeyrathne.lk@gmail.com>,
 kvm@vger.kernel.org, Chathura Rajapaksha <chath@bu.edu>, Paul Moore
 <paul@paul-moore.com>, Eric Paris <eparis@redhat.com>, Giovanni Cabiddu
 <giovanni.cabiddu@intel.com>, Xin Zeng <xin.zeng@intel.com>, Yahui Cao
 <yahui.cao@intel.com>, Bjorn Helgaas <bhelgaas@google.com>, Kevin Tian
 <kevin.tian@intel.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Yunxiang
 Li <Yunxiang.Li@amd.com>, Dongdong Zhang
 <zhangdongdong@eswincomputing.com>, Avihai Horon <avihaih@nvidia.com>,
 linux-kernel@vger.kernel.org, audit@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] vfio/pci: Block and audit accesses to
 unassigned config regions
Message-ID: <20250428142558.263c5db1.alex.williamson@redhat.com>
In-Reply-To: <20250428132455.GC1213339@ziepe.ca>
References: <20250426212253.40473-1-chath@bu.edu>
	<20250428132455.GC1213339@ziepe.ca>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 28 Apr 2025 10:24:55 -0300
Jason Gunthorpe <jgg@ziepe.ca> wrote:

> On Sat, Apr 26, 2025 at 09:22:47PM +0000, Chathura Rajapaksha wrote:
> > Some PCIe devices trigger PCI bus errors when accesses are made to
> > unassigned regions within their PCI configuration space. On certain
> > platforms, this can lead to host system hangs or reboots.  
> 
> Do you have an example of this? What do you mean by bus error?
> 
> I would expect the device to return some constant like 0, or to return
> an error TLP. The host bridge should convert the error TLP to
> 0XFFFFFFF like all other read error conversions.
> 
> Is it a device problem or host bridge problem you are facing?

Or system problem.  Is it the access itself that generates a problem or
is it what the device does as a result of the access?  If the latter,
does this only remove a config space fuzzing attack vector against that
behavior or do we expect the device cannot generate the same behavior
via MMIO or IO register accesses?

We've previously leaned in the direction that we depend on hardware to
contain errors.  We cannot trap every access to the device or else we'd
severely limit the devices available to use and the performance of
those devices to the point that device assignment isn't worthwhile.

PCI config space is a slow path, it's already trapped, and it's
theoretically architected that we could restrict and audit much of it,
though some devices do rely on access to unarchitected config space.
But even within the architected space there are device specific
capabilities with undocumented protocols, exposing unknown features of
devices.  Does this incrementally make things better in general, or is
this largely masking a poorly behaved device/system?

> > 1. Support for blocking guest accesses to unassigned
> >    PCI configuration space, and the ability to bypass this access control
> >    for specific devices. The patch introduces three module parameters:
> > 
> >    block_pci_unassigned_write:
> >    Blocks write accesses to unassigned config space regions.
> > 
> >    block_pci_unassigned_read:
> >    Blocks read accesses to unassigned config space regions.
> > 
> >    uaccess_allow_ids:
> >    Specifies the devices for which the above access control is bypassed.
> >    The value is a comma-separated list of device IDs in
> >    <vendor_id>:<device_id> format.
> > 
> >    Example usage:
> >    To block guest write accesses to unassigned config regions for all
> >    passed through devices except for the device with vendor ID 0x1234 and
> >    device ID 0x5678:
> > 
> >    block_pci_unassigned_write=1 uaccess_allow_ids=1234:5678  
> 
> No module parameters please.
> 
> At worst the kernel should maintain a quirks list to control this,
> maybe with a sysfs to update it.

No module parameters might be difficult if we end up managing this as a
default policy selection, but certainly agree that if we get into
device specific behaviors we probably want those quirks automatically
deployed by the kernel.  Thanks,

Alex

