Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EAE22068D
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 21:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750110449; cv=none; b=IeMwkQvWKarW3qJyWYi+CZfvFLidOUDl+CVIDzYghwydthA1R96MM0fHGqVo5v2ZWy+6JeP8+5hzff+u8iB3Wy98ujBBwcDoNPDj1unT+GK4kobmxo4XRA797bNXg8BM8bhw8JexRBdzCjDRP7IpSDIK+KuTGEzssVJr/NqxnFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750110449; c=relaxed/simple;
	bh=z2qeyaEDa8QvsVY4HmYmJ2h1mEKFu6Hb5NQ1IlDbbqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G0/pfzK5n736kKLn6+c977hSeHUx88IgUF4zoWNPIRde/FV+TCbeLck3jTL/gc01TuoGhhPbVUh3Cg7+9kJcTmheI1HO6MUT/WI5NK6KyBDVMvs2/JunNpgEpvnypA6HiWFlx3Gl8TN9qhk3dbsMWTvkBLXm9eUcBwzCkrlLM1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=w+XP0ygq; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="w+XP0ygq"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-235ca5eba8cso58225ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750110447; x=1750715247; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b+7yTuFOYw/+OFN7i63Es/kgRcKQFjeHwd4HaCwCrWY=;
        b=w+XP0ygqwHz1aXcB/otsdxPk8qNTDBvDqGyld3g/Ka1w6M+bL0ETNkyDQrhVaVgdqE
         5uRKf9uAlbTNZJuVnxw7eS2OlepzkQw0ste5n/sq4KAGlCtmOqkpPN8bL4weUVf6hzQD
         J3UacVmPIusbRx3n/aO3uiyDMfnndj2Ai+K0tj9eokd0jtGJXehGy2gwYaHWCGsWJ7Gm
         6sVCfg3kTSvrLm1fJQvNlHEDEwa3zqGoYrpCv0bnIeWhbS7duWgrUaqG1XLExR5bqmcT
         Cl8/J/ykSTCm/tG50ho4fQhJLgHsr+gYH3YXi5DuNGW80WCgymvLcZIMKusoiX0LJ6TD
         uhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750110447; x=1750715247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+7yTuFOYw/+OFN7i63Es/kgRcKQFjeHwd4HaCwCrWY=;
        b=ZB4PsX8LLPH/wJZj0d2efZ9G+YlaoMzhrdYi90GZuFkIHeTJb9MZ+QXjAVHcEeKQEU
         WtYIGhbp/7PBXDJdzr0kq33X1O4QGBqEWtuhM7hjHIsaPwHTcJJdAZ+CgwXKpkdz287U
         YP5eHMgmN1PABDyXuw5yJPoz7z94D02AqVtyGIoEsG6VraAqU+ZFrXfcQq5LZbw14j+Z
         F5Y0Ykhzv/1+kAWDmYXxnlRv5HbLiB1vQNScRw1WAGuuJYMDzkyrpFv5DG2O2qcfc9W0
         MZ/NvS/H2mBsXtq3Iz/Rm451b2U+FB4LbVrG9K/EqnLukrS5YV5Q0Tg8wbOCPR2QXj5i
         hUDw==
X-Forwarded-Encrypted: i=1; AJvYcCVLI3yo3bOi8tDiiuTH8g+U4LbpRW7mOclOZRuCLxw2fSGG/2JIhx5BlB2yTqleN64ULqixz4mRt1GOTxE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3F13u5Ws19J51P1Kh1rLhE/NrYAMmRCxKu3CtUBsHrrcRAAtN
	5YSAT2Nt/9z8XUd5Xk9n55+F1oB7hFgsFlh34wneEzJI7R4OfOadr2O/LEiVHExMvw==
X-Gm-Gg: ASbGncuR1aVQ3xc+ouwchsV0prGz+Am818YtAfirZslW4/Dh0WS7ui9mexYf6gHu/Uz
	9J28dRacGV8l0+yqbRw+AluZ9OtK6syskSx11SmyY7I7yAm9ORQaiEMTOgwN5BsVsGf4CyTJo3O
	BPiSVgHadds6sI5r3fOy/hFljuVa9kjgolzwYpNeI61lAfbC97RaFX2+geHeqlJV0xolaF3X/ux
	NTGG42GI6BJHwqpCx4I9rUy5b6nXYgnnz4snLsH4kPCHTWF0DVTFF3O1KmXmu3GTDmG/Tq4JUYl
	E9PqiK/Xd5yjxoTerc6WkgHHdoAGjagR9TLu3HeOTyM2rj7cTK7keIjHgDShSCml/nkJYJDLCm9
	6yKDiIEz67j8RDQtd+Jfz7c+4GC9at18=
X-Google-Smtp-Source: AGHT+IHag3rw8aX4ZKoeizjYKIh5qE5BVC5WmHX9g+TIQMgoMav4KZZJKeYmD/v1LvZQLFwcJimtlg==
X-Received: by 2002:a17:903:1a27:b0:234:bf4:98ba with SMTP id d9443c01a7336-2366c5bf768mr6069465ad.6.1750110446641;
        Mon, 16 Jun 2025 14:47:26 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1680c1esm6263160a12.48.2025.06.16.14.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 14:47:26 -0700 (PDT)
Date: Mon, 16 Jun 2025 21:47:17 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, yi.l.liu@intel.com,
	peterz@infradead.org, jsnitsel@redhat.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev,
	baolu.lu@linux.intel.com
Subject: Re: [PATCH v2 04/14] iommufd: Use enum iommu_veventq_type for type
 in struct iommufd_veventq
Message-ID: <aFCQ5fAn4FYXUr0G@google.com>
References: <cover.1749882255.git.nicolinc@nvidia.com>
 <208a260c100a00667d3799feaad1260745f96c6b.1749882255.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <208a260c100a00667d3799feaad1260745f96c6b.1749882255.git.nicolinc@nvidia.com>

On Fri, Jun 13, 2025 at 11:35:16PM -0700, Nicolin Chen wrote:
> Replace unsigned init, to make it clear. No functional changes.

Nit: s/init/int

> 

Reviewed-by: Pranjal Shrivastava <praan@google.com>

> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/iommufd/iommufd_private.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
> index 4619285c09b7..32f0631368e1 100644
> --- a/drivers/iommu/iommufd/iommufd_private.h
> +++ b/drivers/iommu/iommufd/iommufd_private.h
> @@ -526,7 +526,7 @@ struct iommufd_veventq {
>  	struct list_head node; /* for iommufd_viommu::veventqs */
>  	struct iommufd_vevent lost_events_header;
>  
> -	unsigned int type;
> +	enum iommu_veventq_type type;
>  	unsigned int depth;
>  
>  	/* Use common.lock for protection */
> @@ -581,7 +581,8 @@ iommufd_get_viommu(struct iommufd_ucmd *ucmd, u32 id)
>  }
>  
>  static inline struct iommufd_veventq *
> -iommufd_viommu_find_veventq(struct iommufd_viommu *viommu, u32 type)
> +iommufd_viommu_find_veventq(struct iommufd_viommu *viommu,
> +			    enum iommu_veventq_type type)
>  {
>  	struct iommufd_veventq *veventq, *next;
>  
> -- 
> 2.43.0
> 
