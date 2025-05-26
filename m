Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2031D63C5
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 19:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748288668; cv=none; b=OXQcFIFdm6uhy2aZVOHl5EOuO5NC7TPa6A9UPix+3YQYN1GuxLSo6sHkf+JbwO0/ram+Hu8In5hEHCsSZGvfJgy9RzeRwhV9sS9Xn1fx9HoPqK9OcRzM3mSOsIqt3ihj8e9AyqReQq6zx22neEw5ysHemnbx1mOKWFw3wvKvsJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748288668; c=relaxed/simple;
	bh=CK8JysKVIn1wabbBll5P2AsB0jqzQ5UGq0g3MIz+lOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQvjenjmn5wF+6qK4qTVZw2+lxcOjDBgLs3vEprJDnjEnLdiFETxq6OCHMd48Uh3cZtug8PUW0WRuGyM7KtahfolJ7u3rH8Ezp69Pfz0hKZboDUdiems9eFm2RYsQxwHG+Ut9XziVYJbkf2TskqzA7U7JWLLdnLUOogw+uIVGno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=IEkOrNr0; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="IEkOrNr0"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-476f4e9cf92so16526381cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 12:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748288665; x=1748893465; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t6x3GVRBafOUbt6XMXviRAhsrN8EerSjpBJlqi+s3Vo=;
        b=IEkOrNr05vSVGm5xCYwH8+78u+fCdbgo7DEG7nAAeSXD1LgmJYtFHLDxh6rlYyNMQj
         NXTPrW+AopYqY3fGCCcWpDGbVv79A4+oIJH2tKWD0Oy4M+9MDroctPOVvgzhnP94V72P
         3BIT1VGIBaU2QdR5vpHRcCjbHN6kgFN/C0/YgoDsqKKWYRnifdkib1ltMmygVFuRtIoF
         2HUEvmR6Y7MOnr4HwSw0ElmAmpe7y19hsKnPnkoysMW1IlDaQmjOFP6TaPAXq128eWNa
         ndpiZS2z8hJoYRq1mkgRV/Tc1qAiCvQkoRJkdS2hUtLLMx2pGo3aoAzhtsIrubg5cM/R
         bz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748288665; x=1748893465;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t6x3GVRBafOUbt6XMXviRAhsrN8EerSjpBJlqi+s3Vo=;
        b=UeGuEM8W230T5n21V9P8HNygva8tmYvPGcBmqGBj89/oCO4VJVMYenPUHoli4aHGUj
         PuHb6Ie5kMUUWNlEM2hsvm6/cqGRrR6aiMpgpsOr18gYtATVB/kSeu5Gn6NYhgDoVDZm
         hyMFvNdDuPL7jCVPP9CLxZ9o9KJ3dEFXhIXyS6DLnH77bqhawSdONs2q5DL2RbxaYsQS
         zUDBCEuLfkFRal/927jSrvckKD7FdDsuHOGoaRPOWO7+vstGSM0eAxhmUGPlrFwDSxV9
         RiBt1ibAa2ds9qi8NtIcN4ynuRFCzRwaeNG1BZbplLX6ztuutO3trBHe0bNotRXE+VWE
         KZ5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVonwwGxd3crbKmbJcHjMdf3HGkdPqjgmZzila5q9JN+btYRg01EdtAnGidy73OA5nPVpSCmyp0eMuaf1g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpqQoGTOERVdey/ND8lwe8kDyrf27gLuULBj3OeWfMYpLvSOxF
	zCi6J2MSWI3JzBVorqqFtQ1TqOJ9xtsdmIgolyiN5ZKbZSR+4kLPsse6Ie+fmlzEfho=
X-Gm-Gg: ASbGnctfZDUCMayjZzL/aFyiOROps+tXP9/KBJJXs60uZcF70LB+ZG4zkUpOhJSdr6o
	1eswEKHTWJXPIGWsIIVvd4cMyQ+CS855cEaD6o2nkz3l0WyfTZX/WKP8cx14IBwKGIFXAbYwDqK
	Df/2JWl62/WfRZ+shB8Bl3qw6R1LPzcUoFICQ8WSBIf3gmpJyeKHY0iua9ypwHLcsCSy8K/FmYX
	YK8s0zgqCHf0cyiek+28uiZWEqyVY9R/akUAxKMlTahtjEnNCoa34a310iLjc53lILnAMmHebXx
	uSgMOINMrH9YYpm8+nBHKCkGwfVWq9PDiA+v72jfH8Rz+LWQzuWaLja5DlGkS9nP9vQRjv18mvg
	qdCmYpRoBTCbEjhOjbRofFvK9Mxo=
X-Google-Smtp-Source: AGHT+IFxiSMJYUELeSfxwISguMW9AfotmvIS4kvd05cibYoRecWr7wlxSwNjUohVu4Je0SWxeRs4Pg==
X-Received: by 2002:a05:622a:7e08:b0:489:7daf:c237 with SMTP id d75a77b69052e-49f480c8f2emr118958631cf.45.1748288665412;
        Mon, 26 May 2025 12:44:25 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae3f9244sm156310781cf.29.2025.05.26.12.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 12:44:24 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uJdkG-00000000UXa-1OLX;
	Mon, 26 May 2025 16:44:24 -0300
Date: Mon, 26 May 2025 16:44:24 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Chathura Rajapaksha <chathura.abeyrathne.lk@gmail.com>
Cc: Yunxiang.Li@amd.com, alex.williamson@redhat.com, audit@vger.kernel.org,
	avihaih@nvidia.com, bhelgaas@google.com, chath@bu.edu,
	eparis@redhat.com, giovanni.cabiddu@intel.com, kevin.tian@intel.com,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	paul@paul-moore.com, schnelle@linux.ibm.com, xin.zeng@intel.com,
	yahui.cao@intel.com, zhangdongdong@eswincomputing.com
Subject: Re: [RFC PATCH 0/2] vfio/pci: Block and audit accesses to unassigned
 config regions
Message-ID: <20250526194424.GG12328@ziepe.ca>
References: <20250516183516.GA643473@ziepe.ca>
 <20250517171459.15231-1-chath@bu.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250517171459.15231-1-chath@bu.edu>

On Sat, May 17, 2025 at 05:14:59PM +0000, Chathura Rajapaksha wrote:
> On Fri, May 16, 2025 at 2:35 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > > By PCI bus error, I was referring to AER-reported uncorrectable errors.
> > > For example:
> > > pcieport 0000:c0:01.1: PCIe Bus Error: severity=Uncorrected (Fatal), type=Transaction Layer, (Requester ID)
> > > pcieport 0000:c0:01.1:   device [1022:1483] error status/mask=00004000/07a10000
> > > pcieport 0000:c0:01.1:    [14] CmpltTO                (First)
> >
> > That's sure looks like a device bug. You should not ever get time out
> > for a config space read.
> 
> Just to clarify, the above error was triggered by a write to the
> configuration space. In fact, all the errors we have observed so far
> were triggered by writes to unassigned PCI config space regions.

Yuk, devices really shouldn't refuse to respond to writes or reads :(

> So far, we have seen this issue on five PCIe devices across GPU and
> storage classes from two different vendors. 

Ugh, that's awful.

> > Alternatively you could handle this in qemu by sanitizing the config
> > space..
> 
> While it's possible to address this issue for QEMU-KVM guests by
> modifying QEMU, PCIe devices can also be assigned directly to
> user-space applications such as DPDK via VFIO. We thought addressing
> this at the VFIO driver level would help mitigate the issue in a
> broader context beyond virtualized environments.

VFIO can probably already trigger command timeouts if it tries hard
enough, as long as it is a contained AER I don't see that the kernel
*needs* to prevent it.. 

For virtualization I really do expect that any serious user will be
tightly controlling the config space and maybe this finding just
supports that qemu needs to be enhanced to have more configurability
here.

It certainly is easier to add an option to qemu to make it block
any address not in a cap chain than to add a bunch of PCI ID tables
and detection to the kernel..

Jason
