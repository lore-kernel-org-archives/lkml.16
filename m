Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C5D4C81
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 18:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745953064; cv=none; b=NMotiK5HX3CPwKZ0zDnsWoAPKWJflgkiL0XDsEbGLesp/M2Osd4mbM6hAzKiieGUSuM3ueQndDbfmVTXFqmWId894Hmyn9lMaT7HDuaw+JiJZQwTDDhjRS3xq9wBmbHhI3YOC+UumjhU8GvZKMrW8IxJ+TU2ayd0wen6SxoxMFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745953064; c=relaxed/simple;
	bh=neW8JICaEEWUIk+9rBwbn5iIXjtiSl0sUhd8RTSSX8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bEnG5OTA3XjZQyPYxKD0A9xR44bTdNlZxFaVc0Nd9v9xaFmFiRVEqOp/lh/0mjUPhfgfT7H/1OsktcZXUa4hGLgyq580cVAeJweBfNrCb0S8OI2Cx2h21xjT8LiNq/caWE+HogV6n2c2iyQlBhNgs4fWPkPJm/Vlh5kDI5KUxjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=op5DRgX/; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="op5DRgX/"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2240aad70f2so212125ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745953062; x=1746557862; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fdXV/8C/yQUJ8I+wtd2Z/G5iaXapJqIY6nj11Km1s7M=;
        b=op5DRgX/KaTY0NxUnn1fFffmY3C5vo109AmUOlkmp/aWk0wZX6s7lJqDiczqtZL/bx
         7d39aHojvWbM0l5hLfjDnSxqbnfnBkL2usFyFye0UyGQ8UsP0Yuz0H6eMk81criVqZsm
         5l0QxzQ7+oxC3H/8d/IcT7N/fO5CGtl15LV3q0wypcVUD9HRhfyJEtSW0U2AkSRBSNsD
         yseE9LRvUA8H9McpFjWOlUkNCX/93FsFSHd3oPUlkLyaFpHH2HEVrnCWQkw3/rPaZxJg
         HtRETnh/oOboFCUhSrxzcWGh+IIB7lbuag/LlUf9kYGroHzOpRrhUUraqvTcZrfYs71a
         ueTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745953062; x=1746557862;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fdXV/8C/yQUJ8I+wtd2Z/G5iaXapJqIY6nj11Km1s7M=;
        b=ZXahF+93sEB4ALD9bXKrITt3pBCYWPCmWarvwfPor9ve3A8FiCorOgaCXb11s1C+9M
         sUT3RTcaKAedVStomI2kymQ9ocy0uiXL+b8HRXYTnjQ3q7mVHFOW809aaary9IqXSkpm
         oroGR1MJVGJy2+zQvjN+2zF7oUPu4f9iC0zogMMa5Wel0MO97qW6pUBNngbXbG+ehVvL
         3L9ks47swyIz59f6+vuJBUyanOJLDy/psbQf2bFRrfS/dgX4fJCfR5LprSLPJG0hupQU
         DKHmyggCTox3KXEBmA5yj8lk1/lUE3ZgxlWON9MWTORxNIJVY+T0Krmhmc3/jMY/zubm
         qJkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdpx6HOp+8W7Z3e8zmDUwAmGl8p+189WRk6ef5reqb/DPnpBYXIhpfH5sBX8j2oEHGR84j3n0/rDKQwxY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpsDirS4eC7EvAfy2gZqx75/1IdWtlKfNzx5KU8sisk+d54ePz
	dGtOYQ+8wXJHhTkG/dVLwuo6imPeDZ9CN7Ecx6Ci/8CzX7z286XR0nXfZ9ZGDQ==
X-Gm-Gg: ASbGncv6Qe+oMpLbEo5bHKSW52Xqq1EAkYWp93oLkJpS47twvCldT79wp0EJrXTXt0n
	mr31i/uPklJb4IRua9LWGFvfSw5xb15CfUKBD9o7b/C3gJh4NrKmfqKJ5+J1o97p1oVDQuPMd3Y
	NXduyeORU3Xff9Nt+AdP2eDBcUBwdUzqhRLUmzZkIfEjj27jhzQYQ4Byy1Lij0sDI6vZkNLiVk6
	QASNzHwHgg16Ub8NSvEEMpXHELkT0cwPE260FU5L3+YLVOv34HY5JQjbAIrj/lmwiqfp/ldszAF
	hqiIC5+kXp+8wsGSI4VN+4KLC0m14tgZXkbp34I70utnNMMQivZTUaM7Jv2vJK9f/5H+DXiN
X-Google-Smtp-Source: AGHT+IGgXGpqrHCfuif7QcKDzCUp9vTefuXFD3aLx4LdLjCaDTVmYgt+1uOwojrpCvF02XNkiYlVaw==
X-Received: by 2002:a17:903:248:b0:215:7ced:9d66 with SMTP id d9443c01a7336-22df3f77b8cmr333515ad.10.1745953061819;
        Tue, 29 Apr 2025 11:57:41 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef097e0csm11594174a91.25.2025.04.29.11.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 11:57:41 -0700 (PDT)
Date: Tue, 29 Apr 2025 18:57:30 +0000
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
Message-ID: <aBEhGmoh0E865PxF@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <094992b874190ffdcf6012104b419c8649b5e4b4.1745646960.git.nicolinc@nvidia.com>
 <aA_0TV0RkVOHk7Qj@google.com>
 <aBAEuP9962XweHPc@Asurada-Nvidia>
 <aBCNkcLp6XZpjYYT@google.com>
 <aBEWFw2wq40SHjTn@google.com>
 <aBEXJFnLalIh788i@Asurada-Nvidia>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBEXJFnLalIh788i@Asurada-Nvidia>

On Tue, Apr 29, 2025 at 11:15:00AM -0700, Nicolin Chen wrote:
> On Tue, Apr 29, 2025 at 06:10:31PM +0000, Pranjal Shrivastava wrote:
> > On Tue, Apr 29, 2025 at 08:28:01AM +0000, Pranjal Shrivastava wrote:
> > > On Mon, Apr 28, 2025 at 03:44:08PM -0700, Nicolin Chen wrote:
> > > > On Mon, Apr 28, 2025 at 09:34:05PM +0000, Pranjal Shrivastava wrote:
> > > > > On Fri, Apr 25, 2025 at 10:58:05PM -0700, Nicolin Chen wrote:
> > > [...] 
> > > > > IIUC, one vintf can have multiple lvcmdqs and looking at the series
> > > > > it looks like the vcmdq_alloc allocates a single lvcmdq. Is the plan to
> > > > > dedicate one lvcmdq to per VM? Which means VMs can share a vintf?
> > > > 
> > > > VINTF is a vSMMU instance per SMMU. Each VINTF can have multiple
> > > > LVCMDQs. Each vCMDQ is allocated per IOMMUFD_CMD_VCMDQ_ALLOC. In
> > > > other word, VM can issue multiple IOMMUFD_CMD_VCMDQ_ALLOC calls
> > > > for each VTINF/vSMMU.
> > > > 
> > > 
> > > Ack. I'm just wondering why would a single VM want more than one vCMDQ
> > > per vSMMU?
> > > [...]
> > 
> > I guess the only thing on this patch from me was to understand why
> > would a single VM want more than one vCMDQ per vSMMU? (Just curious to
> > know :) )
> 
> It gives some perf gain since it has two portals to fill commands.

Ohh! I'm imagining concurrent invalidations / commands! Interesting!

> 
> Nicolin

Thanks!
Praan
