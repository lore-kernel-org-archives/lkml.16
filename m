Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B475E27F747
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745915295; cv=none; b=OQwG+DzrhP+W96shBSYaHgpoIdUFP402OTkzvxEN6DXZyFg0KNWRFRaKQxBqxnS/9nPpCeynSciB0Ydvy971DqInYiaoq527BXaa+xa9F/4ur/6IVHbrZ0I3qvfOVMd9d2zAmHx21zldwybNcfyp8dsV39HC2xfErbIaHOeSynA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745915295; c=relaxed/simple;
	bh=1FsywMQHT6aCTH/4QijjV+e4uu/3MJPm0YGRHU38ci8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I0GrN0abyCfKL1krBJBMK1L+AeCfNNAN1fuCeEw4F8Lwe3jZFugj7BqOeg7W7uFC17SeqbiEwHeou13mYH0Pe8e+nZ4lOT9JedR3waYa6uod7G2jKSJypcRkFOHAPxEXeg7iie9zZCN6YsiTetLoHhU1u5rlvkzjZ+1gGjJFvQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XiJ8FYkW; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XiJ8FYkW"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2240aad70f2so89155ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 01:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745915293; x=1746520093; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D5QKxnLZKN15CjETYE0cz5F8y62z+3Lyd2c2OfhrGOQ=;
        b=XiJ8FYkWjiPglKhfyBJ5prckcaI3Oa4QLpYgaC039SrK9qp9Jr9TccEMyia82CHt70
         a5xfZ/lh3c3l40eIxHIBkOstUioBe4oGiLrevvU7ZQPk2UVr6cijRKI12swS64jjhI9e
         I0GEFmeoIeUYsf0udTcxkW7/y4CdTTsmibDzvBeHuvn5hPTUdcOoa87zNc5YxD68Nmno
         gybrcdpv7WjLxOYMP3LWlP/8et6GfwsEF8BLmhflDrJT6FUSEazYPCUfX5SU3QtLf4H3
         oAoivNXqrEmsr/EOOqCSsg6G8HZ8aNnFAiTE+pWPzGOZUg+WvhCn44r2lvHJRqeYNxb/
         bhww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745915293; x=1746520093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D5QKxnLZKN15CjETYE0cz5F8y62z+3Lyd2c2OfhrGOQ=;
        b=oBsvYZEmmLRNNxixOuUFfaDAnDK56g7CxAFbxMcyzKnDZKNFzyw47t8SFSRhtdMCbM
         BVXH0JRy1j7hscxxLIvHoBgkuKrtD7eP7aHK9FNArCkRQQiclVlROqpe8k5g+sIoLY0O
         P/V6s5bQA3qasiapNGN80oeXHkikgXUQcki1LJTl8cLmItXTFS3AkTDMLr9FgPwBL+SX
         xBjrkhfxT+c2alFqRV9zc6K3Km2pc0W5bwuCYXNzdoVQIqsdC/R1j7YVwTHxq4msziwC
         HvgUsXlUx229tF0Ggir58YYVShS+UOFrA0wdqYiKLIXJ6QZiszPIwT4UTa9kGsdE4v9e
         GWaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUAHfW/nvBIOBvbm3cN3jKeRPAs2TIEgdVvrIixFmKHzOPR4lwPSzB9/HMLhlZcMbg4+Z2P/thpzSXxz0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZGAtW1PcNhKi0AbfGO+u0qC5xNoxbZIzbdqxzB+OOXTTNeUq6
	U6GBvBAiXBxyGgOJQNvPXoMAdvqSPdjCrAFskSqkJBHMri877DjqDrKV401sfQ==
X-Gm-Gg: ASbGncthOkz4W/aDsELecFChwe9K3JJJJXdJ7pr/QCK8K+XuCXyv4ypmrxOHa/6LsSx
	QEJk9gjKj3S6X8d/+btUyYonFcN2gqePRI7kvydpDIBx6wx4CsDjUL/Zc5RCX3X5IO/49Y2BAtx
	1+40KS8bKhNsYox+HlRY0YdgVHkFWNM8HHcYeA4+iR/tuqfQo4Lacifw9fjU5QH/UlmhfcWoCIk
	/y0NPX9XY1zaRazO5ChLlS+Burbhh+OLFKJz+BXpOMbQbqBpgzO/gYrq99WK53Q9fQM8HdFpUL+
	BtH6rCL4aZyX91VIYub3DwmSb/5c9RpapQ/w0ohTA4Qp1kLiWbfxc8afXAmFEX1hS+2vgJgo
X-Google-Smtp-Source: AGHT+IEBLTjQEPi6T2MilTT/Y6yv+CY2P+m49PsmJxyrcH4D1FATZ6uG7LkMVqt9dbTXi33w3gHvEg==
X-Received: by 2002:a17:902:f643:b0:223:f479:3860 with SMTP id d9443c01a7336-22de6de05c5mr2640355ad.18.1745915292715;
        Tue, 29 Apr 2025 01:28:12 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a995edsm9628409b3a.130.2025.04.29.01.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 01:28:12 -0700 (PDT)
Date: Tue, 29 Apr 2025 08:28:01 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com
Subject: Re: [PATCH v2 10/22] iommufd/viommmu: Add IOMMUFD_CMD_VCMDQ_ALLOC
 ioctl
Message-ID: <aBCNkcLp6XZpjYYT@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <094992b874190ffdcf6012104b419c8649b5e4b4.1745646960.git.nicolinc@nvidia.com>
 <aA_0TV0RkVOHk7Qj@google.com>
 <aBAEuP9962XweHPc@Asurada-Nvidia>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBAEuP9962XweHPc@Asurada-Nvidia>

On Mon, Apr 28, 2025 at 03:44:08PM -0700, Nicolin Chen wrote:
> On Mon, Apr 28, 2025 at 09:34:05PM +0000, Pranjal Shrivastava wrote:
> > On Fri, Apr 25, 2025 at 10:58:05PM -0700, Nicolin Chen wrote:
> > > @@ -501,6 +504,9 @@ static const struct iommufd_object_ops iommufd_object_ops[] = {
> > >  	[IOMMUFD_OBJ_IOAS] = {
> > >  		.destroy = iommufd_ioas_destroy,
> > >  	},
> > > +	[IOMMUFD_OBJ_VCMDQ] = {
> > > +		.destroy = iommufd_vcmdq_destroy,
> > > +	},
> > >  	[IOMMUFD_OBJ_VDEVICE] = {
> > >  		.destroy = iommufd_vdevice_destroy,
> > >  	},
> > 
> > When do we expect the VMM to use this ioctl? While it's spawning a new
> > VM?
> 
> When guest OS clears the VCMDQ's base address register, or when
> guest OS reboots or shuts down.
> 

Ack. So, basically any write to VCMDQ_BASE is trapped?

> > IIUC, one vintf can have multiple lvcmdqs and looking at the series
> > it looks like the vcmdq_alloc allocates a single lvcmdq. Is the plan to
> > dedicate one lvcmdq to per VM? Which means VMs can share a vintf?
> 
> VINTF is a vSMMU instance per SMMU. Each VINTF can have multiple
> LVCMDQs. Each vCMDQ is allocated per IOMMUFD_CMD_VCMDQ_ALLOC. In
> other word, VM can issue multiple IOMMUFD_CMD_VCMDQ_ALLOC calls
> for each VTINF/vSMMU.
> 

Ack. I'm just wondering why would a single VM want more than one vCMDQ
per vSMMU?

> > Or do we plan to trap access to trap the access everytime the VM
> > accesses an lvcmdq base register?
> 
> Yes. That's the only place the VMM can trap. All other register
> accesses are going to the HW directly without trappings.
> 

Got it.

> > > diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
> > > index a65153458a26..02a111710ffe 100644
> > > --- a/drivers/iommu/iommufd/viommu.c
> > > +++ b/drivers/iommu/iommufd/viommu.c
> > > @@ -170,3 +170,97 @@ int iommufd_vdevice_alloc_ioctl(struct iommufd_ucmd *ucmd)
> > >  	iommufd_put_object(ucmd->ictx, &viommu->obj);
> > >  	return rc;
> > >  }
> > > +
> > > +void iommufd_vcmdq_destroy(struct iommufd_object *obj)
> > > +{
> > > +	struct iommufd_vcmdq *vcmdq =
> > > +		container_of(obj, struct iommufd_vcmdq, obj);
> > > +	struct iommufd_viommu *viommu = vcmdq->viommu;
> > > +
> > > +	if (viommu->ops->vcmdq_destroy)
> > > +		viommu->ops->vcmdq_destroy(vcmdq);
> > > +	iopt_unpin_pages(&viommu->hwpt->ioas->iopt, vcmdq->addr, vcmdq->length);
> > > +	refcount_dec(&viommu->obj.users);
> > > +}
> > > +
> > > +int iommufd_vcmdq_alloc_ioctl(struct iommufd_ucmd *ucmd)
> > > +{
> > > +	struct iommu_vcmdq_alloc *cmd = ucmd->cmd;
> > > +	struct iommufd_viommu *viommu;
> > > +	struct iommufd_vcmdq *vcmdq;
> > > +	struct page **pages;
> > > +	int max_npages, i;
> > > +	dma_addr_t end;
> > > +	int rc;
> > > +
> > > +	if (cmd->flags || cmd->type == IOMMU_VCMDQ_TYPE_DEFAULT)
> > > +		return -EOPNOTSUPP;
> > 
> > The cmd->type check is a little confusing here, I think we could
> > re-order the series and add this check when we have the CMDQV type.
> 
> This is the patch that introduces the IOMMU_VCMDQ_TYPE_DEFAULT.
> So, it's natural we check it here. The thing is that we have to
> introduce something to fill the enum iommu_vcmdq_type, so that
> it wouldn't be empty.
> 
> An unsupported DEFAULT type is what we have for vIOMMU/vEVENTQ
> also.
> 
> A driver patch should define its own type along with the driver
> patch. And it's what this series does. I think it's pretty clear?
> 

Alright. Agreed.

> > Alternatively, we could keep this in place and
> [..]
> > add the driver-specific
> > vcmdq_alloc op calls when it's added/available for Tegra CMDQV while
> > stubbing out the rest of this function accordingly.
> 
> Why?
> 
> The vcmdq_alloc op is already introduced in the prior patch. It
> is cleaner to keep all core code in one patch. And then another
> tegra patch to add driver type and its support.
> 

Alright.

> Thanks
> Nicolin

Thanks,
Praan
