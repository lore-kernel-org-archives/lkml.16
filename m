Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F284214C5B0
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 22:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750114336; cv=none; b=Bt3rhK8G9UBSUTTEGpp+/5bY1xhF4MY4ppEH+iOOOlkRyoG2eyZzxpp91kwJHmpLgcXUzDy9eetpucD2hqbpIH5Ldc6+UibcsikoCKe0bipV5nvY7BagdCshpeAbrHapC2g0R4m7lrzQ7n+YQ0YHno9EaMBnOGJ5GRqg3p1+1e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750114336; c=relaxed/simple;
	bh=PmDF/LX+MEY7yNxnBISXFQV1FTEkhwSQHKJS5tTjenI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ByRZq0sUR8TmhK2eBv0WEfRPEFfUyLtv1wfDUBiGgC3ppvvB7stE9YBoqtzfIYOdmvICqXPhHkL4v7PbSJ0hDFaVhjMHd/Az9Jo4UxEudrlZhb9gqzJbGIRWPlIjWMRKPQ7z2QegPXdG07XlfDsAnMuls9gPMNtKQK1mVOi5WlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aPcgWDqN; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aPcgWDqN"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-235ca5eba8cso65505ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750114333; x=1750719133; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jj6+mcpbE9V02qadLzbuN9y/flOOPMALPxxrYxqko6o=;
        b=aPcgWDqNlyYS7EHeUOdGbiYb5ZaeCTaKT9VhYRuQ6Dw+l0SB/CQYZT6rd1SSHTU7M5
         gSU9ScXizjrNSTQArjSAp3SENWuyhJfIekj6zqZvTiYyYUDefwe2HvNO/QRqKxbumCkV
         SNjKLVC6ov45QbLrLvM7k8HuEbsul7mmPlL+QryvY9gFxTXwz9J1as7eHe4+nZwUdyVR
         ieHIMIUgqXNvgMF/t0jQHDpOEEDX+rH2xrV8jbxRnj3yI/X7K9q5rkJH8yGiOm/9ZKR1
         xAq1Q/bScY33e9xi6O3EDJ/bx82JW5OonFYa5QqQIajW9hgbnbRFGkKU+1FrjCac1Oog
         LQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750114333; x=1750719133;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jj6+mcpbE9V02qadLzbuN9y/flOOPMALPxxrYxqko6o=;
        b=bnI4e4VwaE7CLC/Ly4QrMf0AN2DlNl+2CkYK+SGgp3GF+nUxmx+meCvG3y5RxgL6MW
         ZH0JQP9bwtPF6qKekBrcMF5vU0xk+/5x53ACYs5RBYT7+HfiPRL8SUqUyW1wf8Wwjzpo
         WKt1IqvyqC8Mp3XCc4E7HohdW4Xls9NGFPjNJiIirOJx9ng4FgyCUqJw5nAgoDjVHsWP
         sh/NUCFVZxbs8XiFE/uiM6ByiWmGA5n9Ywvuj/4JJNBueLgieZg5RY8b4tSso3h0fIOh
         16lZo6vvxIiBVJ4Mp1kdFb+hSVMJMtQNiOaDUgFX9W6seTlN27QLXBL3Iz4d7zjySGEk
         rJDA==
X-Forwarded-Encrypted: i=1; AJvYcCVviIG1gnDEr1BucydkKsEAR3H1AFA+g+S8fgQKTGb9iGQTIH2YtpCjslbwAAhlXUjAVjVRf9TQR0CjecA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEpyGmHUuAEt9fsZm9LyZR87v3TxqfO1m7ovqHrHWz8NfHL9Hq
	g9jwI3YcqKsb7hQmxlB+UJIw1YRDJjStC9SnyUXF2c3Ceu+ZcFjEzx+RpGvpeJ1BKQ==
X-Gm-Gg: ASbGncvFaRpHP/jG/E71EqpKCSDmJCgFmettcyVa2hrThoVcA6vE1MZWEBlRySmTmZC
	DLyL08uEL0s9sb+0t7C4tZ4PDe+t1I29V/cezH9SB0BILuhPyuokVEWKoRh2vdLvkcxqCCOM5qH
	pv88LRdQDY35yqcUtEtAAsuJIB6UBOvzoObA3hfPujGoCTVeFCrfYaJKJpTKKe0RV0jsFq1m1gP
	59emMU2v1G8JbjLQBchE1IQzrOgvEhGWFN0onUmNHeORFVLr2fIPMH+X3qlizBohw8/Z6L7NvDH
	UF2KKkvTgiFPllZx+YSCxkED/Ksui0CUSdziTBuznf8ZPNtPi+oAUA0hR8ZhL5TnDstTkqyDbrX
	9hy1agAfu9QAocU8h41Aq
X-Google-Smtp-Source: AGHT+IGlPE9uP1SbbWnzOuYOIe1eDG4YyhjqWGy1/roBJfbAZkNgrizH5BthvNw3ZPe4qwD5HsBoXA==
X-Received: by 2002:a17:903:b45:b0:234:b2bf:e67f with SMTP id d9443c01a7336-2366eef0269mr5964675ad.9.1750114333086;
        Mon, 16 Jun 2025 15:52:13 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b319dc80726sm3333506a12.68.2025.06.16.15.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 15:52:12 -0700 (PDT)
Date: Mon, 16 Jun 2025 22:52:04 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, yi.l.liu@intel.com,
	peterz@infradead.org, jsnitsel@redhat.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev,
	baolu.lu@linux.intel.com
Subject: Re: [PATCH v2 13/14] iommufd: Introduce iommufd_object_alloc_ucmd
 helpery
Message-ID: <aFCgFPlz5dYlN8N2@google.com>
References: <cover.1749882255.git.nicolinc@nvidia.com>
 <e7206d4227844887cc8dbf0cc7b0242580fafd9d.1749882255.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7206d4227844887cc8dbf0cc7b0242580fafd9d.1749882255.git.nicolinc@nvidia.com>

On Fri, Jun 13, 2025 at 11:35:25PM -0700, Nicolin Chen wrote:
> An object allocator needs to call either iommufd_object_finalize() upon a
> success or iommufd_object_abort_and_destroy() upon an error code.
> 
> To reduce duplication, store a new_obj in the struct iommufd_ucmd and call
> iommufd_object_finalize/iommufd_object_abort_and_destroy() accordingly in
> the main function.
> 
> Similar to iommufd_object_alloc() and __iommufd_object_alloc(), add a pair
> of helpers: __iommufd_object_alloc_ucmd() and iommufd_object_alloc_ucmd().
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/iommufd/iommufd_private.h | 26 +++++++++++++++++++++++++
>  drivers/iommu/iommufd/main.c            | 25 ++++++++++++++++++++++++
>  2 files changed, 51 insertions(+)
> 
> -- 

Acked-by: Pranjal Shrivastava <praan@google.com>

> 2.43.0
> 
