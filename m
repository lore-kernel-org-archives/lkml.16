Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5615120E6F7
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 18:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751740710; cv=none; b=Or+X6AFjj9e47b1LVy5gxcIobA5EHi1cf0RpTmi3UzTRps9mJUJnLFzUnjd14nNucavdDR3J5qnlQVnUFzqLs4ICp/F/Uskwz08HiAtPy5LnWbBcOLYYYVv9gWERx6oq2ve48O4+QDkzGzlZZvWPAKciUcr9xeK6Q+SV1+0ITHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751740710; c=relaxed/simple;
	bh=WIHdEgEb4h7ncGmlqKNUeHDxe1TLcrT5/vC0Zduw6NY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NMXLi4yNIh7ZGrPTpxgwQUGbnMsgF5FY2LLZfDcEAKfohNWkTJ3elpCI9HKbu2BeThB4NtpyiaivMjPfBtthqnxohwfLjOBP9YbsO539XHi4V9KT/0wOH42sEYIBmaooQp3arsHfgvsMjiAqfO+v3KefEQMKufEPdpEIPmfHbUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=M796u3Wh; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="M796u3Wh"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7d0976776dcso223891485a.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Jul 2025 11:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1751740708; x=1752345508; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WIHdEgEb4h7ncGmlqKNUeHDxe1TLcrT5/vC0Zduw6NY=;
        b=M796u3WhOQlJnRyUi6KCA5mOBngSG7pYexme1NipRRKwhjCRZmRmaL4qW23/MADF04
         EVMgpz8MSxd3mnCAkEUimm7nyDAAy/AfA+23koKmLFV0k+NeoR6++sQB0vN5ybXyYBIx
         EnHBp7EwdcbMHoWEKN8S7YN5xL59XSA2mG27EuL1TmgjaLpfEkHkwx8sVFutTsL2Mqq+
         JYzOzmoIPmpHnfTgNznnCQdiBpiGNk9s8gq7K10PAYP++hCN9ORjzrFlDHmNnkpAYoMN
         kRJ5LyjwAjhARa6dWFNS2FFcGhgsuljQp+LGPcDYu+VbIhc4hK/IBj/Q4s1nzu4Y7waT
         Qqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751740708; x=1752345508;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WIHdEgEb4h7ncGmlqKNUeHDxe1TLcrT5/vC0Zduw6NY=;
        b=TyOiDishYaYuzNkp7nvI8TKZ34g559YFFvfvMKTNWyxBeT0jLiSl4VjxXiSIjmSQcN
         yk54O+KByukwODA4BH75obrQrcH6grAsLAU6WYoaAJMXkDOPncFE8PbiDz2KQI1pYey2
         7qDpUcpsJlLICvCrcGwefAxrjNsd05sd6ufweiSprbxRFXOPVTtE9F0jo4ikx5aObftg
         YqcghSeZPAY/hwfzSVoPjrjiFdour7rpZCvfGKvzDu5RsFysxfrPV9jldkHcNzJPjIZu
         rMvU+nw9KogP8LDuDkN2AlQyfgA5iVlhTsrpNRyNMuQTZ/zF4ZgD228mzFp0UCJXfIhx
         lyrA==
X-Forwarded-Encrypted: i=1; AJvYcCXruxFNgfkQclezP4YHmXPVrr28C2OqeLZpQe0pWQg88MYP7vKXvko0NB9pzUWby4ECZGAb6JRwhUBGLhw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy7hmi1TxSyFV9w/pLEfEqs3Cp6sdCBcQC93lNHptctqOK7Pmf
	ojxgGK1ChYZ1l8tSp+yE8RAwOfhmwWR2AACjbZ9KxXuSgH1P+yl6SWMYxNby/IARX50=
X-Gm-Gg: ASbGncvof0znd2+D45PdTYRgETgP4kInqdeIBkMRCUqIf/OL8Swpz4KItX+NaHKCOwr
	rC3k82MT7qdT+hfxMaFzt3LNtSNnvXxgVUERhHfzfsSJPijUqB7Vrn1OUcL0hpVCec9a6D2N6bE
	HeAXOgHf3go5epVAI4plY4pz1kKplRuKn6B3WIAI4pPGCl93hy4rcHU46vEcL5qQstgcRmnPHG6
	jWGbBkOtVEb/1iKYeaVKb6/iFaTQfmcuzaL5bDScYLaRLj+2Qo+j9Oy7rXCP5FJtcRuRcAX82Yg
	sOP6b+fKg3SdW/IGJiGhPY7dgURLUE++wDBjK5kVbfSK1G0JudQ+LmKa3KVCxI4tJ+8VY03bt4o
	wNE7pMoyNw6mLV92F2DeGUDShqJpwC/Amu7ANb4l93l4/uP/q
X-Google-Smtp-Source: AGHT+IHGynn880Btao0rr5ATgmcaLhy8fafgWIOLP+yaNkVftZqqbIrm82pa3BfiHgQu8aK3kR04IA==
X-Received: by 2002:a05:620a:40c9:b0:7d3:f0a3:d8cc with SMTP id af79cd13be357-7d5df169b32mr814175485a.45.1751740708064;
        Sat, 05 Jul 2025 11:38:28 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbe7baedsm345886685a.57.2025.07.05.11.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 11:38:27 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uY7mM-000000068pv-2jB7;
	Sat, 05 Jul 2025 15:38:26 -0300
Date: Sat, 5 Jul 2025 15:38:26 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	nicolas.dufresne@collabora.com, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v4 3/5] iommu: Add verisilicon IOMMU driver
Message-ID: <20250705183826.GN904431@ziepe.ca>
References: <20250623153931.158765-1-benjamin.gaignard@collabora.com>
 <20250623153931.158765-4-benjamin.gaignard@collabora.com>
 <20250704175425.GM904431@ziepe.ca>
 <62cead85-2d50-45f1-8020-7aea77f6833b@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62cead85-2d50-45f1-8020-7aea77f6833b@collabora.com>

On Sat, Jul 05, 2025 at 12:04:05PM +0200, Benjamin Gaignard wrote:

> I would like to avoid that but maybe a static spinlock can solve that problem ?

I think you can't really (technically) store an iommu pointer in a
domain and not prevent it from being used by other iommus.

Can't the spinlock be in the domain?

Jason
