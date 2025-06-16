Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A365C21CC62
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 22:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750113981; cv=none; b=Sh7bQuJzg+t4oT5nzBWtPiPnVPG/3L6XJfAdHeUmaraeKqyBCPXjelfl1dnDnzt/jcp0x0glR8Dghc1oNyBBpBz0ulqNxaXs4e2ocTF4HQbjEzmLWv85wptCNETicr5gMX/F0GAOZn6JU7AWqYbf7HsmmGTprAneAtL3LSlZG78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750113981; c=relaxed/simple;
	bh=KrYOke53fZhaOdyqNU6WsSDo4eyk49qxBayckScAUt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SYkDCuhMesJ6GPRafg1pL0AaD64HGtTKs7AWNy1J7aI0t35djrCRIehl6DTWX0LIdAe6VRWBOkFqpF6wfms8cVXKkD9puFSzhkE+OcnzK1x9H0jtjaWP5uVGMngUJ2ocBJcO74x09kQsm94SbGj79sNksVf8+Y0lsr+6uM+TrMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kgLIT0uq; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kgLIT0uq"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-235ca5eba8cso64855ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 15:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750113977; x=1750718777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L4d+8ZjXH9zZ77lKYUp6/tF7Z8I85twtKvurv24F7nU=;
        b=kgLIT0uqLNbuQNTRfUxPhUc2GoQvJ91IimE0ryNr//1pVbrKsbR+NtlLIuhKfJyDig
         +ZUWqZKSU1cqLmRDDw8T3T0H9Gdenq3rO0NIWFZ/45V8k7Ql6KUXDrIX9FAR2A/dCAPp
         M052u2iN6WPDp9P3NuIFwfcZl/VQxjWxDaYDQV01lzcggEXOiZqe4vWC7PQCNqfmQ9tQ
         jLdSDw78wDVSE8d+gGz9YLUlMsJ58O1W71L/WFezbQZDc67WZLkNpKBPwpwR0ztR44yW
         bfXKMHmvd1b15EtS2w0X4TdpXMMD6B7Ckhl4CIsFfMaG5LUzYTfHa4B7nqS2TO2Omg6X
         nz7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750113977; x=1750718777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4d+8ZjXH9zZ77lKYUp6/tF7Z8I85twtKvurv24F7nU=;
        b=cu5KsAoY885IQiX3K4L/BFUZgTVNcQhlj11UAxvBvJh7LF+eC1QjpqtNDprK5jCO27
         m9VA1ApHnuKzfUYjYnkfwn4sReZCL9b2N/+XhfTSPOWCyt2uekOZuKUvi7wVJaDJCZEi
         rT3dYIBVZlWg79kawVW5owP2bsmCLlYO0/VivWN/vzu7hRoV3kVZS6jH3sR0wZzGuBRA
         vA031TcdXTrqRaT8xQYocs1IGNZMfYPXYjhnMPitokC1lcgFxeA6MI8qQqu+Paps9SOp
         1AtDBd0KwVhW7jfUbX5nHLLeXgnrOcxtBTIE2UdLYRYQDKF+ysu8wH7gOFC7PdsegP8I
         32lg==
X-Forwarded-Encrypted: i=1; AJvYcCUj4UV5pcu66RyZhIa3ay7twoG74cKog0+Xxx+RRySp/WQukJaoX7/wM8NiStPluKxujrwDwctzOAvomaU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoYaJ1GS92PEEW3orz3w+/CM4Ejj5VlIzUdUJNUe/9ZREmM5S+
	uTS2JkTfs2+giIII6cFLAn+XdrVIIjIojyqdAHTsitISAwrLj5a8Lv+09riQGQylzQ==
X-Gm-Gg: ASbGnctnS+Dp4BCY1n9zIguJwICPceSf2uh+6Gf6e5XaYDQwHVvUU9B0n5N2/tOAX5t
	JcMyreQzhWlrf95qBkQJqO/ALhhtBQ43Jhtkus3NK/nB+Mmbkduk6PUQzi0TTH0j1gJArHjJk6H
	KX1OMQfCA0zSDR5xQCGaUs+4l/Jejxath+c01IrMXAsy0urcq1scZfsnIJ3K1Upc0QdrvLvDaaj
	UPJLJVg9mU4Pkg1IidsTp+d999IPHh9Vesktsyq8NRBfHqsdZGvgdzu+uJET6nMjRhR5O+QTkkD
	gjX0GhZkafxR+e5MMJ4OED9O8QGvn8i672OPF8xRoytPRWlG/R4TyTd2+anwkHZtxR/e2QaG9+k
	pN4eITQCma0ECSrAjNn+N
X-Google-Smtp-Source: AGHT+IHbp2l3BN8cw3PKIKwKBRH+mwq9oeWC2v6BaROwnYe7V6Peft6fYvtgkHe+hYIr4hoxzIvQpg==
X-Received: by 2002:a17:903:b45:b0:234:b2bf:e67f with SMTP id d9443c01a7336-2366eef0269mr5944675ad.9.1750113976583;
        Mon, 16 Jun 2025 15:46:16 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74890082a7esm7656250b3a.100.2025.06.16.15.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 15:46:16 -0700 (PDT)
Date: Mon, 16 Jun 2025 22:46:07 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, yi.l.liu@intel.com,
	peterz@infradead.org, jsnitsel@redhat.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev,
	baolu.lu@linux.intel.com
Subject: Re: [PATCH v2 11/14] iommu: Deprecate viommu_alloc op
Message-ID: <aFCerw6zMXkyYKax@google.com>
References: <cover.1749882255.git.nicolinc@nvidia.com>
 <5b32d4499d7ed02a63e57a293c11b642d226ef8d.1749882255.git.nicolinc@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b32d4499d7ed02a63e57a293c11b642d226ef8d.1749882255.git.nicolinc@nvidia.com>

On Fri, Jun 13, 2025 at 11:35:23PM -0700, Nicolin Chen wrote:
> To ease the for-driver iommufd APIs, get_viommu_size and viommu_init ops
> are introduced. Now, those existing vIOMMU supported drivers implemented
> these two ops, replacing the viommu_alloc one. So, there is no use of it.
> 
> Remove it from the headers and the viommu core.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  include/linux/iommu.h          | 11 -----------
>  include/linux/iommufd.h        | 18 ------------------
>  drivers/iommu/iommufd/viommu.c | 20 +++++---------------
>  3 files changed, 5 insertions(+), 44 deletions(-)
> 

Much cleaner now IMO.
Reviewed-by: Pranjal Shrivastava <praan@google.com>
