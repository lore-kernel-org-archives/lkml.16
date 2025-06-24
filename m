Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAA32E62BC
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 18:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750788774; cv=none; b=l/Br/75VWtJQI5yOhhB96oAC285A88bxFmL27VSEvtSfs46ak7rQnCGdB3zPTixsDvYHlI1QYePQ2wpepgBoQfCYtLwti1DfhLngbmNUnAj7hrRGBgfGpRYPa4g40dDCKn/7DAh9fvePk6sdid8UVQTlz2R+SGI3L2m50a0R+wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750788774; c=relaxed/simple;
	bh=1RMvRPlD1Tqj4JYT7g9obPgUA64IytuZoSXX7HWT+oE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l8dsRYg3BDOc8tMptS82CWy8DEJ4jvMynn4bMqAK2ItZVRt0I3SvTmb6Kfb04Jaa+1CCUf+T/ydGYEZrrlfdwT1Ag0LOq7OMWHMRh5+0UXHakRSPon5/k8Lc+vHz3TWk5p+qgal+EX39wihhL/TjEbZLBqm8i5hO1j8LwCW33Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=pGumHYEw; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="pGumHYEw"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7d3e7503333so820623685a.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 11:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750788771; x=1751393571; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NTUhS7HsUi4ncH3W/Kp0Qjyu1eBnpAdLomHIncteQ/c=;
        b=pGumHYEwxOr6Wl2oNaXb7B7Fpcz66BBCS11Ajbc5FDYkJKly+MrYpZebFhcnLZpKLa
         FRqGDmcMxZNXYrFSKMjCQRK/Y1KUVcW1YslnMa32NvStOq0ckHrRHAj2OLQaX44c0J2h
         HHRuj2swJFFT95BeRgJByHinDEVaBqtjsxmp9FqsqQ1nAnClCY5GO0IqhceCrNxtnRRr
         XHHxWUCmWVT0F1Iq2WsEcpyMg+JynYD9kLi382fbtgyI8STrpBcrmpNjDKHX5lglOLZD
         HRedc/sVVbOrgMTIcmfu3WSdFeQfFbvDCpfw5tYNp7Gdk7OMVRfFS1Ukygq2HjkH4kMp
         r2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750788771; x=1751393571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTUhS7HsUi4ncH3W/Kp0Qjyu1eBnpAdLomHIncteQ/c=;
        b=rzwV32dyur1aIgh6gLw14fiS7ju5cFFKVFUv3s45tbmktmuOVPRjEJmKzEj1bm3Ni6
         yorhVKhVK6BD3Qe1X8G0gF+z9ZSxxRwt3EC3BmyLFPJTzQ7HC9Psj3wb57uBFxoEz/qE
         t4P0pWXnYW9NS7+fwKE/L49V7a+QgBWEKUFJzm6hVmw5Ujk8fq/t2MPaP2ZAqDPqMIwe
         vWvnPEQVXJefAs6P7LjWH0vLk7UjpFZ0jPyJ9naNXbJLzDHZi42a2NodU7gzDN0Fuq7q
         SdSuYz4vfiE6njWIVoBctGveLNeDL2703RaAFiQodcmDBFXHX8t/nUf/+RIsaGz0Ljc2
         W7HA==
X-Forwarded-Encrypted: i=1; AJvYcCVQLR1h+33rrlUxJbgBkUgjBkD2HKJ42wZV2q2ZU1vmYCKLj2NG+E10B4FtvJiy5HO2L9ywq4jnQ24oZ2E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPhVIXcxOcTzXONcjK6x84B34V0LNHKP/cgY77A9aIaDAIkUIm
	NNw8kGFZKG40Hdv9UJFV8hE2qMWM4NuKzk7ROPKV6At3AfyJdIpvU4H9Cd43PESPUFw=
X-Gm-Gg: ASbGncuuNcXpeBDGr5U904OtWHVQae2LKZwOLJ5R1ZbM9Ma4zO5dvdE8XJ+7DlYjuKF
	dc7xVMNP8jcbnKkNFq0NgDUH+ofG2UZqfTv23/qIAfuBaH3D0Or/H+TyDBunPgikp4GExpbyggO
	bVn77dfvHaoeFwFfFWYYHZtCJt1m+aqNi/6Ty8uynmZFOpWf+zloAjjAVGb3lS0WbmGyu8BbMlk
	cMeQQLW8sv7kXNTMF0W+oRtVVETV0GFoxlbzJSVBCEJQJ2BrDElV6veRfCWpeFjgFePcoD3ugUk
	CGNIYg4xKTQic/bpJK1wEgMXFCc+HUaZl+mmPqxzGZib9HC3FryxJt7l73NpdZ4/PMt1YgMUj3u
	/MTcGAVM7HxN/kYzslR3AIG+ZXuA/WFvlZKaqOg==
X-Google-Smtp-Source: AGHT+IEVYAPwlqQ5K5sfPSeY4qX2lln3vN4YWLqtBK9131XNcH/wJIfhgNwEVLFl538+prOc0GcBxA==
X-Received: by 2002:a05:620a:2990:b0:7d0:98fc:83f9 with SMTP id af79cd13be357-7d4296ef4edmr4538185a.18.1750788770913;
        Tue, 24 Jun 2025 11:12:50 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f99a6755sm527990185a.32.2025.06.24.11.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 11:12:50 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uU88X-00000000hAG-1TBX;
	Tue, 24 Jun 2025 15:12:49 -0300
Date: Tue, 24 Jun 2025 15:12:49 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Alex Mastro <amastro@fb.com>, peterx@redhat.com, kbusch@kernel.org,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] vfio/pci: print vfio-device name to fdinfo
Message-ID: <20250624181249.GD72557@ziepe.ca>
References: <20250623-vfio-fdinfo-v1-1-c9cec65a2922@fb.com>
 <20250623161831.12109402.alex.williamson@redhat.com>
 <20250624005605.GA72557@ziepe.ca>
 <20250624102303.75146159.alex.williamson@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624102303.75146159.alex.williamson@redhat.com>

On Tue, Jun 24, 2025 at 10:23:03AM -0600, Alex Williamson wrote:

> I think we're specifically trying to gain visibility to the
> anon_inode:[vfio-device] in the legacy case.

Ah, I see.. 

> The @name passed to anon_inode_getfile_fmode() is described as the name
> of the "class", which is why I think we used the static
> "[vfio-device]", but I see KVM breaks the mold, adding the vcpu_id:
> 
> 	snprintf(name, sizeof(name), "kvm-vcpu-stats:%d", vcpu->vcpu_id);
> 
> We could do something similar, but maybe fdinfo is the better option,
> and if it is then dev_name() seems like the useful thing to add there
> (though we could add more than one thing).

I wouldn't encode a sysfspath (which is what you really need for a
device name) in the [] section.. fdinfo makes sense for that, but I
would return the full sysfs path to the device from the core code
rather than try to return just the BDF for PCI.

Prefix /sys/ and then userspace can inspect the directory for whatever
information it needs.

It could also return a %d within the [] that indicated which group it
was for. In most system that will tell you the device anyhow since
groups are singular.

> I don't recall if or how we accounted for the concept of vf_tokens in
> the cdev model and I don't see evidence that we did.  For instance
> vfio_pci_validate_vf_token() is only called from vfio_pci_core_match(),
> which is called as match through the vfio_device_ops, but only from
> vfio_group_ioctl_get_device_fd().  So using cdev, it appears we don't
> have the same opt-in requirement when using a VF where the PF is
> managed by a vfio-pci userspace driver.  Thanks,

Hmm.. I can't recall.

I wrote a small patch to correct this, I will post it.

Jason
