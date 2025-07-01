Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A6828313F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 22:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751410291; cv=none; b=V5Hiylik3pUKysRPn7wB8F2WdrSDutMiipzp692vOQphL3/BIkyQ3L608pqONmxlMrs2RgerKYcSb1u+F2+U/On1ujK62J1m+RdLZ3rTvr8MKdNRGr7X+PbYGOyfI1DMkuMpeMErYiu9wbPHz6Aw9UcTPpUbsEZcHSSyBDnOT3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751410291; c=relaxed/simple;
	bh=THyaiSK3XZpGPf2jkEiRMRg3uUKNoJcmWhjWuRS1+Mw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ih4vNyDa9zHm3Cw9vi6SVA+wLggI20QaVz+QkA2mVuvemzpMQC9oMYhO5tIYqgmoYcBN/jqI6JD6iqyW8mVhtVEG6PZPjm7UD7KavGYAbx2DQjj1mtd0UHkM0TwQSMq1WGfBEGCkDxdnBosMlmAgW4lza70huE6G0Jgi9d1arTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I1G6t++y; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I1G6t++y"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2357c61cda7so223345ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 15:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751410290; x=1752015090; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=31m5VALjhSZCUtaamU81Tt7LVwzdmFjl/OH4isUf0T4=;
        b=I1G6t++yD9V4C6VFrwS/Ox3IwKdstO81pMUTd+x+5nJN1PCohB5UF8K5lpeitFxLR5
         78bYzSEPQOIHj2grpze+b7urzmXMIa0Sg/gZNhxDnd8TdUnpbrvkpJ8Mp6qURIDsbWiu
         Qwkcst6EuiFEshPMUKSpIPPL3HcDSsVYHUp/BF2WkbngKJfySeT0/tYTp1jPIJtVlcGY
         nQ0TiB+lXGmAJsdNMBfS0G2Qz6ZNYu0/QdaNvLH1uACIXW7ld9z+ZreTwwIIastZdfNW
         KWPgHgZwM978OS4d7LTJQDBSXEzo1+mPuLK2svIXBbhUBdJgtM16dcfj7GudHniQ4Jbw
         Mzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751410290; x=1752015090;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31m5VALjhSZCUtaamU81Tt7LVwzdmFjl/OH4isUf0T4=;
        b=kh6W3HYlUIS8AuOle+U3/TgKUdiooap7AgnThWgM4wjoMg8QCPxwyO/jMpxiNS++UP
         P779KFhHSdRA/MV9XzwEt8ALM1S5YDw4B70EXwo67b7vcGH5v0BIpfYN0YDrRHi6SZlj
         DlLfam7epY9M2t5PLt00EYd+Q50GzyXIGdl7ygY7r4sFcqkthfGw/JItIn19CuUsm2xh
         MFa2f/dB5fZN30RTiO5FreeQa62RReK+wF1wwyXwQHD5MmmEX30LfC7VWYB3dC3Pu8gn
         SAlcbqOm1goPC2RT0TAvLTdZSJsWaOVAlUvNFVCYIqRl2OYWucVsV/5OBewSdFJT4jIU
         Gsqw==
X-Forwarded-Encrypted: i=1; AJvYcCUSIffzi03PUbS3+T3sKGdU0TmVa/JEqmMnbHzGcWGb5BnkOlu6P63fzDOyV21E/OoU3Koznbr+5t84QZE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtq0k4MLJllQ2pWs8vvtRrV98MgPF4WwoKSfPQWQqOOIv2sAMe
	X/gD1mfKyn4m4DrXDZSg8A9czbQJW/W6U3trKubDunL9KV4CPbj5z6iGP97nif0s3Q==
X-Gm-Gg: ASbGncupZvPOoHrTbZuSgAFr2/YdRwXm3QsaQMkGbZXQ7HY6reSPMpJwenxqQSlDDOa
	rpS5S/MstEkBcdgfhL/Z8YkmRFthZ03CrXDcYTnceOhw1R100zRsoPPOjpmzdHU5P+bOG6e1d0/
	1+C7HTTzi50yL8D1Ti9Fx1ustlExuXbUMC/cDEKCmdH89wlPgghdW9z2zw/9uUbVHW1M1svr257
	7z4lkk3cdKQBYXlQVIAaRoXXAw8XVRzEcYUwYA4RecwjepdVxaRRTBpvGDITvy8yAdjhTmBUL/N
	VBkI0zoX9k8pHKOV2H1JSs+ExttGtqh+PMMcrUVglpuFtAVdBpEdlM2tXd108Z/HSX47yH0GMdJ
	6rfB7E5L+Ntd1IJoeQHBz
X-Google-Smtp-Source: AGHT+IE2A3LONQdf5/UDXdamM9j2FEbJtnYf58bee8GseWxQ7r/tyyPKLeWd6GVOe4rd8pReDprYsg==
X-Received: by 2002:a17:903:40c6:b0:235:e1d6:5339 with SMTP id d9443c01a7336-23c601c954dmr3764925ad.26.1751410289353;
        Tue, 01 Jul 2025 15:51:29 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5384107sm17193429a91.5.2025.07.01.15.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 15:51:28 -0700 (PDT)
Date: Tue, 1 Jul 2025 22:51:20 +0000
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
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v7 27/28] iommu/tegra241-cmdqv: Add user-space use support
Message-ID: <aGRmaOORg-YDfncY@google.com>
References: <cover.1750966133.git.nicolinc@nvidia.com>
 <539ee2ec112162abdba511574e2205a77b425059.1750966133.git.nicolinc@nvidia.com>
 <aGQGm1-i4M75b9Qp@google.com>
 <aGQ6KCI9OZEwHdxS@Asurada-Nvidia>
 <aGQ_F7Qx3scbbA-J@google.com>
 <aGRDtYRXFLoT+PrI@Asurada-Nvidia>
 <aGRIctg4T6cQECx4@google.com>
 <aGRcPSwaJkTeUrMx@Asurada-Nvidia>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGRcPSwaJkTeUrMx@Asurada-Nvidia>

On Tue, Jul 01, 2025 at 03:07:57PM -0700, Nicolin Chen wrote:
> On Tue, Jul 01, 2025 at 08:43:30PM +0000, Pranjal Shrivastava wrote:
> > On Tue, Jul 01, 2025 at 01:23:17PM -0700, Nicolin Chen wrote:
> > > Or perhaps calling them "non-accelerated commands" would be nicer.
> > 
> > Uhh okay, so there'll be a separate driver in the VM issuing invalidation
> > commands directly to the CMDQV thus we don't see any of it's part here?
> 
> That's how it works. VM must run a guest-level VCMDQ driver that
> separates accelerated and non-accelerated commands as it already
> does:
> 
>     accelerated commands => VCMDQ (HW)
> non-accelerated commands => SMMU CMDQ (SW) =iommufd=> SMMU CMDQ (HW)
> 

Right exactly what got me confused. I was assuming the same CMDQV driver
would run in the Guest kernel but seems like there's another driver for
the Guest that's not in tree yet or maybe is a purely user-space thing?

And the weird part was that "invalidation" commands are accelerated but
we use the .cache_invalidate viommu op for `non-invalidation` commands.
But I guess what you meant there could be non-accelerated invalidation 
commands (maybe something stage 2 TLBIs?) which would go through the 
.cache_invalidate op, right?

> Nicolin

Praan
