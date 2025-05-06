Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0A933DF
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 15:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746545663; cv=none; b=YjCtZyPLSzCWNvjdtkYf8SMQWdvkv+Fh9B07Xcf0s1bMAJv0e8d/gZsfokJE+EIJCV8/2//R2w6ChLys2uQKwVMIfDPPUXZJC4a7f72tsQT7iNNtDNZfjG0T+fiojUoKpjsDMGuYTV25binGYGVjuWcYPh08Yyu7VsNMgES/Krs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746545663; c=relaxed/simple;
	bh=Ov/02G0Dcbs71zqBUcZd01NdKb7GrwiBG53tzfrEiqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YlxdwXNqvXWJzejIAb4s665ghYtjzdAbDin6tcy7bYFhJBKmSEn9p6abPeZonEtHeNFNBRh4aUa7133T4Vk0HvlgKk+zxX+HIcQHTc4SbehlHJffHVuvYjUCf0j/N5ib6DwLf+M0Z/RanigfwJsY0HsLUUYpiCkcfPit0IbfIsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=MssmoGww; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="MssmoGww"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6f53d271c4cso5262816d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 08:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1746545660; x=1747150460; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DEL0BdJeiWhFSL0UHqew6wK9zUeiS1/Nj6MKOwcN1sk=;
        b=MssmoGww22+bQo4FlZaOqUJc4tw4ZW8X30NxYC2l6bVuh3uRzorjT3/Zkt+UgcMVDw
         tDoC829GcsLFM4Ql955p1NuJ200Jc0kpku3ZAwHWtH8Bz0RsdNxBeLoHCwT7Mjk4M5IK
         Gj3unkgacoTj/10RrSk/bai/xqbZucxe8jw2WZEowOmPsKum6GVd6tPJbRYp/3cTAaK+
         JO6sEIf61B0xKEoNDV/b7Rt9kRkhE7yun3+klS9tGEkS220C+0d510xSrrBvdsJEaFm8
         uqksaCBz71HN+P45XuK1KNt3/6ua1Ke2F9mLEfG22QuR1rjUpPZPyl8psAns+AIred9P
         iyCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746545660; x=1747150460;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DEL0BdJeiWhFSL0UHqew6wK9zUeiS1/Nj6MKOwcN1sk=;
        b=MDeTqIMuC8XdasEZYJQ/vtXC97JeHife71zzK+yFxyG2EoIbyZicTu7L1rZpwzAmID
         tsOLyFpVm4HnO0Hfa9mlLIoEnOkTHbiSibVSlOOOzu3KgnRuM4MN7PEKZkKUGyWjj0Vx
         rcgHCWhga2noAY1SRKh+Kb5Pj/2i433NJkGXTL3KRYuJcmOGlow+aV0KL8m3OpWrDUzY
         NXgOorsZKpsMDOqu4KZ8yEphZdmYMKrNnD+bQSr8kQGv+Nf2aBu75uwCCvMSdJe3CzFC
         ZAfGIlEtyFSeSObE7eH0mODatru6hEtwbQGz7L53O2w1D7Cov9LAKykOFuAk/ipNr2/K
         m5kg==
X-Forwarded-Encrypted: i=1; AJvYcCWSD/+8+9OypNADDHpMl1+tnaQuVu4RrrVHeI3wva23/vt/0iJ97qDx0KTazXTg3UtvRxQLWqQqa0BOiyU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfk7q/bMkgwJXqGcePKpEUyL7+jO4z9cd9d46uTNVqTROgOAcN
	mMITg9iBziYlz1pdxxvd4ecYhNTbIMhD63vSUAs6WNRDv1KKneeLfEGiT1sCk9I=
X-Gm-Gg: ASbGncuNgoMJ1h+ANLTpUtA+fuTGBi5WdPA9SAwGQVQD9gWsZKvJnmpJYgIwg1DjHyD
	sqBIFT3fWUwTggo9al/jEK06pTSqGbLDEh0Kykpa3vQjAdwJys765UmJ89/7PJ+f2RrOpPfJM0d
	pbCiSwtd8oRAg7U2otoZkNlPHsOjI2dm+FZDb7Bhl7wHV0IjPXa3H5UtgL89UwwIKb9bsf+D+M4
	FY64waTr/17J26S1E6RAD8xwU5fNkyLw+NJCV0aLzQ3IHJB5KDMK+9bTYQaDj+53wF3Utubu7+s
	R1lR4lpVe0JrPfF1YzjGq4ucPaWYGZZWwuugtgiozQxZ2i9y3RPH9TQRHnAHQtODH4lsc9VFA4W
	mNgSLWlGInbEm3fbcbPs=
X-Google-Smtp-Source: AGHT+IGjVla9v9iPysAsiyzPvNdcdtY/Ygl5ECmnMcsCIIpAcHMP5wxwPNZpIf0QEMUcDCXVQaRW9A==
X-Received: by 2002:a05:6214:5086:b0:6e8:9086:261 with SMTP id 6a1803df08f44-6f528c3ac16mr186250976d6.3.1746545660278;
        Tue, 06 May 2025 08:34:20 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f4515absm71401096d6.79.2025.05.06.08.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:34:19 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uCKJH-000000008YQ-1aOe;
	Tue, 06 May 2025 12:34:19 -0300
Date: Tue, 6 May 2025 12:34:19 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] iommu/fsl_pamu: remove trailing space after \n
Message-ID: <20250506153419.GL2260621@ziepe.ca>
References: <20250430151853.923614-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430151853.923614-1-colin.i.king@gmail.com>

On Wed, Apr 30, 2025 at 04:18:53PM +0100, Colin Ian King wrote:
> There is an extraenous space after \n in a pr_debug message. Remove it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/iommu/fsl_pamu_domain.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
