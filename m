Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01ED25BF06
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 13:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750858660; cv=none; b=Es+t67sdTvfRj7PEQkOGLFz8o+e4c0f7il9bGt14hpqCb0YbzPPdQhvLjQZBOeDly8ixfOMGNgIFujPcEVGhZ55uE2w2ubt0fENDtMktRiYudKilvePKgmFfTRQGXcoi4h0/ucNJTbn7vc8FKUTmqy4lvOSJV9dwAAoAEa5iI5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750858660; c=relaxed/simple;
	bh=UdYQ1Nu+L55yueU5BMkbqZe3IiP3IgOF4R8o04XgR7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dpWdFwJbCorqzRT4v3sYrRjk4g5MzTf2fb+oxI0wpKro1QU5rLDi5Qcvwj9VI6ZDjpsMZ1oYqAWl3dDxUILAnKWH6WKpKIInKjVA0Gw0OhFUUPHqI6YGEMJvruMNjzvcvYAW4U52l5ycgxfaeXmFeMz+0g/DfzFag5dNmzzFMm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=cXdMmmSk; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="cXdMmmSk"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6fd1b2a57a0so13336996d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 06:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1750858656; x=1751463456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NglHKItE2MnRf7kVBkJpZrmGam+ZtM8lvAR6jGRQjyo=;
        b=cXdMmmSkAlersHuk/9zZ11+H0UbZsmv+DkMv0M33cF3FFrg9hpe/HNE6Z/G8DwPYlt
         7KVWLKup92g4GCd1VQ7amzL5CfUxPpGbni3Fb0FfxfNqjvpaIxpzlIr9jGIHk0Y7rFO0
         DmGJe4ugZ0u9kNpRdhmlxkhctY0pqiJFTuIGQLGlOV/32tN3mnEW8t4H6uWy5hv3uNpL
         5yxD9dYLeGV8mbIfwkJImgghxEGcVZTRVrTvfdsX9MUUVeAjzNdv9DV0mY8gh2fpt1SU
         ZsaN3J24gb7qapGMeUxgJJEvQ1tA32ByqUpkaS7NJQk4tXKX9FpbQ4EHtB/Wt+PoGmKQ
         FDkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750858656; x=1751463456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NglHKItE2MnRf7kVBkJpZrmGam+ZtM8lvAR6jGRQjyo=;
        b=RLT6s+3+0S5smUHAIz+PmkN/5emO89RXeDG5KilU2j4Y/8DDYSGcFAyQALhcyso1Qv
         tMpAfUEqEAgUp2IMcTi2QOcMDGS6tqXgsKrAAITuFF3IC+60fRfcJlU0fAood5n9aXyX
         TvcSVI0naTgfycaG8I8qfVMFXKnA7o7aA9P/JwtZS7dlLCLhx6YT+wotuKdnq9avo7eH
         le4GPhU2J5l+DGQFX7evDpicqEcvL48rQhBExV/v3J3+N8A94cdk7zk37VY4eToz8x4x
         jljkt2Vwi6DFhrqA+3KQwCzxk9I6/st0XHXPrGwWjIJhFnQf3ObSc8X0iVdv/N28gTEE
         feSg==
X-Forwarded-Encrypted: i=1; AJvYcCUwueZH/ZASqhXQuPn+fGkDFkihsdGeO0qFkysiB7JIX+KEiZrgsXiJY2nfSYYv9ztB1JjEBCYrVtkrjzc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+w3OxqFtB4nB/quCvsEKY4zfP2PJfrnjPO5POjPzptPV1t3IR
	iK/LRo3kvYyN/MP9XZL7EYLjloOq/LMefhQF4kME0mFoy7/ZO8GZ7GitPKpticHNoss=
X-Gm-Gg: ASbGncss0YkCyTx3FegokezBcxZ2Zuv1/VAwZ6CUDb56iQ8/TwDqt1r6UR9oKqZwzkh
	vg+Me5mcX8PY1LjM0UI2d++Dr/xuw+rRQQPuVQQpgAqzxbHYso3Uu2gFOXC2m7ltS0AUGnTDTJz
	f8jEEYRpE99xwKFlnFvr1Auf49H5O+N8LMHYrIUc0hzsuCrSHZZnD9muvCz0gQcBRvQY6iHWEi/
	UutjssXab+C6t9yoT3A0aPmKOu1pYSG3zmyJfiVLD5z9VvVX/Fst+/mbmjswZ/npvZ+Tb1+Wn3P
	0q8dZHDmM3wvV4Gke3cTOasZT5eRhvPD1mhLBaR73LAAv9bQUfctJFyrt02fkomfXKcSm6l6huZ
	k901jnM0m1YQ2BUsZjnDMFHFLH+Btq1IfOiSGQA==
X-Google-Smtp-Source: AGHT+IHNWTn84Obl4sCOYge34wUPUvuPQlJlnAKQv8tTsnsg8qT0v7mGMowd+Em7yTBlsKIc3f9P2A==
X-Received: by 2002:a05:6214:cc1:b0:6fa:b9e9:e799 with SMTP id 6a1803df08f44-6fd5ef802afmr35290316d6.24.1750858656416;
        Wed, 25 Jun 2025 06:37:36 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd093e167esm68119946d6.18.2025.06.25.06.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 06:37:35 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uUQJj-000000014g9-0Uom;
	Wed, 25 Jun 2025 10:37:35 -0300
Date: Wed, 25 Jun 2025 10:37:35 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	=?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>,
	yang@os.amperecomputing.com, will@kernel.org,
	jean-philippe@linaro.org, robin.murphy@arm.com, joro@8bytes.org,
	maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
	james.morse@arm.com, broonie@kernel.org, ardb@kernel.org,
	baohua@kernel.org, suzuki.poulose@arm.com, david@redhat.com,
	nicolinc@nvidia.com, jsnitsel@redhat.com, mshavit@google.com,
	kevin.tian@intel.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [PATCH v7 4/4] arm64/mm: Elide tlbi in contpte_convert() under
 BBML2
Message-ID: <20250625133735.GB213144@ziepe.ca>
References: <20250617095104.6772-1-miko.lenczewski@arm.com>
 <20250617095104.6772-5-miko.lenczewski@arm.com>
 <aFRlDSZ2PPnHixjc@arm.com>
 <7105112f-b0bb-4191-b3c9-93522162319c@arm.com>
 <636c8901-6e05-479f-ae06-ee391d4d36e8@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <636c8901-6e05-479f-ae06-ee391d4d36e8@arm.com>

On Wed, Jun 25, 2025 at 02:07:23PM +0100, Ryan Roberts wrote:
> I think what you are saying is that despite going via invalid, the HW may see
> this direct transition:
> 
> +----+----+----+----+
> |RO,n|RO,n|RO,n|RW,n|
> +----+----+----+----+
> to:
> +----+----+----+----+
> |RO,c|RO,c|RO,c|RO,c|
> +----+----+----+----+
> 
> There are 2 logical operations here. The first is changing the permissions of
> the last entry. The second is changing the size of the entry.
> 
> As I understand it, it's permissible in the architecture to update the
> permissions of the a PTE without break-before-make and without issuing a tlbi
> afterwards; in that case the HW may apply either the old permissions or the new
> permissions up until a future tlbi (after which the new permissions are
> guarranteed). That's the first logical operation.
> 
> The second logical operation is permitted by FEAT_BBM level 2.
> 
> So both logical operations are permitted and the Arm ARM doesn't mention any
> requirement to "separate" these operations with a tlbi or anything else, as far
> as I can see.
> 
> So I would interpret that combining these 2 in the way we have should be safe.
> RNGLXZ and RJQQTC give further insight into the spirit of the spec. But I agree
> this isn't spelled out super clearly.
> 
> Perhaps we can move forwards based on this understanding, and I will seek some
> clarifying words to be added to the Arm ARM?

FWIW this matches my understanding as well.

AFAIK the actual physical issue for BBM < 2 is the TLB lookup HW
cannot tolerate having two entries that overlap in address because of
different sizes. Every lookup must return exactly one result. If more
results are returned the HW fails in some way.

For BBM 2 if the HW lookup gets more than one result the HW selects
one unpredictably and uses that.

Permissions shouldn't have any impact because they do not effect how
the lookup is performed, they are the result of the lookup.

I've been looking at implementing BBM 2 support on the iommu side and
I didn't see anything that said we cannot do arbitary transformations
under BBM 2? For instance when degrading from a contiguous range of
block descriptors down to single page descriptors I'm expecting to go
like:
    16x2M -> 2M -> 4k -> FLUSH

Jason
