Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F98EEAB
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 16:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745427435; cv=none; b=PHdJco6zN9NRyaDfBe/KOS7JUYTFgws/oWdGPxVBactYJ3wEhMz+ck2XrlkSm5QDoMypODabUas3tRCZyY8/F0C6lDM3ZF4ytUVPTJS24TTUGT4FbbQfZk3fnDtcfsqE4Fvi7iUaOmDFcqjVIb5Pi2or4ly1uvoNdFDY9p8Zb8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745427435; c=relaxed/simple;
	bh=dhi7YPbJDF5Sv4T9p4l00KsiFYnUvc1VHj5DJ29C/CM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P2iHUB2rhEGPsFuWNn3WMws/E7Evfi+dEhjYs6Zmhw2otZq1N+FlqNUAOzB5DQ72JSkAjNuDYqbsB+3N0hyM8XSfvtPYhhx9/atJBGorFSMbGlRHPCpHkkhG+Ru2Qm3p6fxdrrtG7rBtRytliJU6cJNyx7l+I0nMdg5sz+6vwpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=TsIZkgjr; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="TsIZkgjr"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c08f9d0ef3so1997485a.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 09:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1745427432; x=1746032232; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dhi7YPbJDF5Sv4T9p4l00KsiFYnUvc1VHj5DJ29C/CM=;
        b=TsIZkgjr8584aM+qOaw2an5PXrySEr18/5itViTjJo3Mib11e/OWUxoNZFU3BfmdO1
         /eJjo7TsgiwzCFtCAtmBDcNnf7H0s/ZgBntRbftJ4nHkBL528X/fbZqkLrALNY2Insye
         mKa98TfmF/4oxJSB1Vz/eeiV9SN7imYFp/93FjeuDOTOARjZBJdMVNIB8LuCcG58Lbbo
         /ccYtEdP6KRkyWdSHpUWHs4WRWvYr5NwMfaJspGP1/brtloqWjkwXtGrQ2o7Q6Qx5si9
         lAhKfC/mra+wc7F18eP70Z/pV1+wf6cxJoPoxF2MgV8YjP1iHD8Nro6/Ss9ThsqMjl0j
         FJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745427432; x=1746032232;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dhi7YPbJDF5Sv4T9p4l00KsiFYnUvc1VHj5DJ29C/CM=;
        b=W7GAj6ofoJhu/KUe5Yrt71q6AmJ1GTv6QIKHxBtYNDPmuntLh8pSp6rydhNlZmOM1i
         iWx6CgYHiOjR/GhOEqszliq30/JLisbisF27pXCCW2ahGe4DtiidqrZwNAR6T8N5nEbB
         uKExoXzw2EFQNrdaRaA/dBwUUv1Cvu1qmudITa9p3H73zM+NCmBDdKXk7Mzo/pa3RnFl
         +tTtdpYitWg5n35tUN9wVCcuA6QbrL+XYPhkh/c5FSmrlNZPeSoDSiAewGGyvoyhzzCb
         zg3PELlfLW28wKICKwLBfc149cz5efYah6On0KBWT9LCxv2Xx4loR0SyFXEGAJnxcRtc
         AvUw==
X-Forwarded-Encrypted: i=1; AJvYcCWzIDvFu4m1OSwLQYzBnzoU+ZUU//Sn4DuJyZMn6NKRIpR2Hs8Z/yqCCQk9AyRe110uF8BVGKgckmTrTsY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrO/Ll3STRihjoQaxuVaV2hKoNpQ3PAojCFq1V23lLTturElJR
	B3WR1Iz8GU3Z9Wy4AD0DzGb6F/iK4CNcivBKkO+0/dT6E0b6E7J46tYvichFkr8=
X-Gm-Gg: ASbGncvl5lO3dFfmZR+yzjJfJTGPdM9U0b9xs8jH3xznRhmPR0DF9g1YmbXujsHq0+u
	1ORKx9rNbkAN+AW+13yXeMsOki0738F4vU4aDS4Ry+Jce+opP1rtUgt5zdy5nXQoksbZD89XgWs
	qa1lnNBQQ2dZ4LLAvSmNtZvqNs4aCj45d+3Iif8RHewQgkoxvkyOkepmUZMhD3LebwnIWZOkrpw
	4v3L1BHI1i5a6HOhl6t2LetUWQD+aAGoiuNvtvnNqc2Wqg9K7flWmFpj8Z42tfiZj9oyZgdHgy9
	jzbsRbwfPzU34JqxVcpbl71vHlp/4uVIoNe61/XS7yXZalGA1NZM0ZrdLDHBcc9u+sxlqYnR7RX
	cbmnXVvdsS0LS9oKcLVc=
X-Google-Smtp-Source: AGHT+IHShwd058je5yhrBHHtft+FaVd6aPfMpemsnKAJr8/FzC5ID/JRmyyXrev5e81NPUS4BdNFCg==
X-Received: by 2002:a05:620a:45aa:b0:7c5:61bc:70ee with SMTP id af79cd13be357-7c928049582mr3400940685a.52.1745427432602;
        Wed, 23 Apr 2025 09:57:12 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c937cdb14bsm487301185a.96.2025.04.23.09.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 09:57:12 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u7dPL-00000007LFu-2s3n;
	Wed, 23 Apr 2025 13:57:11 -0300
Date: Wed, 23 Apr 2025 13:57:11 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Will McVicker <willmcvicker@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Joerg Roedel <jroedel@suse.de>, Bjorn Helgaas <bhelgaas@google.com>,
	iommu@lists.linux.dev, Saravana Kannan <saravanak@google.com>,
	kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] platform: Fix race condition during DMA configure at
 IOMMU probe time
Message-ID: <20250423165711.GG1213339@ziepe.ca>
References: <20250423150823.GA422889@bhelgaas>
 <4129dca9-07fa-4b9d-a7d8-de7561d509e7@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4129dca9-07fa-4b9d-a7d8-de7561d509e7@arm.com>

On Wed, Apr 23, 2025 at 04:50:29PM +0100, Robin Murphy wrote:

> Indeed in my half-written version of this patch I was leaning towards
> removing the drv variable altogether (just doing
> to_x_driver(dev->driver)->driver_managed_dma inline), or at least doing the
> same as Will's previous diff. I figure the one-liner replacing
> "!dev->driver" with "!&drv->driver" would be too disgustingly non-obvious
> for anyone else's tastes...

The READ_ONCE alerts the reader that something weird is going on here :\

> For consistency we should really fix all the buses the same way - sorry for
> the bother (I can write up the other patches if you'd like). FWIW this part
> really was the most temporary stopgap, as my planned next step is to propose
> moving driver_managed_dma and the use_default_domain() call up into the
> driver core and so removing all this bus-level code anyway, hence trying to
> minimise the effort spent churning it. Oh well.

It started out this way but Greg really didn't want it, so this was
the compromise. Perhaps you can convince Greg of the merit.

Jason
