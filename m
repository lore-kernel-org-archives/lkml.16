Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CE1B666
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 19:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745349358; cv=none; b=Ygjv8Fbm/oK5NhUpMagPyJHUWZuMIEfQDFs/hhjZyuvTpJUCia6xMnDxoAlWAKnWQUJEfPt/X6+RsReTGHk900x0OY5u1raV5NznT7lbZlVM+7YM6sJGuN6huHQpHRgxb5WlnhFlN97fl6yiDLdbGSCa6qkgXXQt3dRKkrrXl3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745349358; c=relaxed/simple;
	bh=jB3to8XLVxQJ5LgCGbXnmbBfUdZvBo80bwAjGWX1FM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V4O5xXM4C2BaBU6swK6AuIOtpcYzYGmlvYnDGiN93vi7Qop8bN7Sn1aAP1ON3YSSw3/g1FWIR+wfD7KFzDelOvtiMrXzmOtbzTE08TiwtO+JAvS9HiWUN8NBI1WNzIVIicIisSmqo/DiKn+Ha/AX+5M+0g/wZ0TH2/V6AdX1aHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Ysk1dMhY; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Ysk1dMhY"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6e8f8657f29so51783676d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1745349355; x=1745954155; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7d1mGroBPaOn9o0uqCQCDJCnumJpud9iMfGSCI94QIs=;
        b=Ysk1dMhYPUGZqQcPAZ/D8UqOUMiRpD3LIgqYyCP/LEHR+9GGF8UuQQrWKyAGcrUE4J
         ZVJsI/nh3Ndh28xLyk/sG41nCvIOPrC1gAZlELPzargtPenhGx/K6zFIVN4OMLNdrtW2
         tSpR6A30ST/O3rLOExRoRsgAjd5XJqvV8SmGoosl9XTm4bmaKRN41Yua/ZO4yEblHlCy
         khOcUR7LgpZWrUUfhiZC3Z983AYDLQqDUJj1rV+9GmoQa6lUVEErjjmxTanUeXTl5k69
         MYsx7pMnduU1+wqFHJHrfzwB62pCweHAMuAJ0NTjDJs9AHrB0+asA+LfcwPoZYk9Xyyn
         Q5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745349355; x=1745954155;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7d1mGroBPaOn9o0uqCQCDJCnumJpud9iMfGSCI94QIs=;
        b=VRUSiXgC9oxlc4fggmAsVhE+cSCY6CsaXVN/Pn5rA4OyfrHHuF039q/JoIxt1vn4jb
         vEf1e5X0iLf24eHZoPaSNEY6962Z+gA+THJwAK1A34ZJlRallISoSh2CWRBx5KUaB5wX
         vHfCe/LGXT2mtLNZ57prwRFDj4KEIxmz2gyUFBo1/Hfljb1q80XUpNhOgbrj1BX+Hxri
         r1QA529kjyCrQwaKU28LP7W7CFtHqBI3alaUTBVrTehhrNDijCXjPQ0859hB8c4dHHuz
         E/231YsG6cx2NC8HHy+C8rXvgDg0s4kiENChqrr2dVuboH37OHQtSEeOxOeCcDgcKhvr
         Qtow==
X-Forwarded-Encrypted: i=1; AJvYcCXr8muzptZ1xBGMRnFl4rGIe62AQ1lDLGJuZO780XXwK/j+ztmf3crgmUMPwO2gIifL9bexj03O0qafEiY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTWgG6cBCaEZBLKaAS+cYSY05o4OGSm4GBOQfltJrf12PNsbPI
	4o0c3/svDup5sD5kFdMUswuV4iMfkLgc1QZxExl73RuyP8SqGEElndkpoNDhnp0=
X-Gm-Gg: ASbGncuQnS42GdenjxMBTDxwwhFKrVWb4W4oflUkKsfuhZ+55Wr/lGoPscM3NSK38me
	bTYN7TLdmVBTRYQupSbwmGBJdZP1SLF7v155dRgRXNUDqcRNl6eQxMxaqexEVqG/VAbDwflMq9f
	XirLS9qFUotdiRGxz7h2ctXwuYCQgxSPe2D366QBKx6AmD+5d+JoLwbX/1glIDFeWF07Su3QQX/
	gntyYZhFT0HPbAoyrpNZXAluXFa7xgmjRWMJ18uncXoXq0sMmW4RhSHbI1thGoGHqI34Gt6X24h
	DIk37rmOWdi1Q1P2iuQqj6ikUtW5QSCiugEcIk8XN553Q/m5QQUb1hygjRaDqOlTa2RU8TBOr5s
	a1WAJvxCaso5OajdrzAc=
X-Google-Smtp-Source: AGHT+IG42qweyJjGbw7NVAt4l3iMAAjkcjftIU8iawlPjM1u7hmAqwA2QfyxHlkDQd215RnDOqjHbQ==
X-Received: by 2002:ad4:5f07:0:b0:6e8:f464:c9a9 with SMTP id 6a1803df08f44-6f2c44ee6femr255140626d6.2.1745349355218;
        Tue, 22 Apr 2025 12:15:55 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925b775c1sm588323385a.97.2025.04.22.12.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 12:15:54 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u7J62-00000006vnm-1E8m;
	Tue, 22 Apr 2025 16:15:54 -0300
Date: Tue, 22 Apr 2025 16:15:54 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Kevin Tian <kevin.tian@intel.com>, shangsong2@lenovo.com,
	Dave Jiang <dave.jiang@intel.com>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/1] iommu/vt-d: Assign owner to the static identity
 domain
Message-ID: <20250422191554.GC1213339@ziepe.ca>
References: <20250422075422.2084548-1-baolu.lu@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422075422.2084548-1-baolu.lu@linux.intel.com>

On Tue, Apr 22, 2025 at 03:54:22PM +0800, Lu Baolu wrote:

> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index cb0b993bebb4..63c9c97ccf69 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -4385,6 +4385,7 @@ static struct iommu_domain identity_domain = {
>  		.attach_dev	= identity_domain_attach_dev,
>  		.set_dev_pasid	= identity_domain_set_dev_pasid,
>  	},
> +	.owner = &intel_iommu_ops,
>  };

Is this a systemic mistake in all the static domains in all the
drivers?

Maybe a bigger check is a more complete fix:

static bool iommu_domain_compatible(struct device *dev,
				    struct iommu_domain *domain)
{
	const struct iommu_ops *ops = dev_iommu_ops(dev);

	if (domain->owner == ops)
		return true;

	/* For static domains owner isn't set */
	if (ops->blocked_domain == domain || ops->identity_domain == domain)
		return true;
	return false;
}

Jason
