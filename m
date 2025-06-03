Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31A5238177
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 13:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748958664; cv=none; b=DY8ufW0CuhXDKhKrEYDKbKeQ3nYCHCQsQY+WePyDpogCTrwMR6kIb3gUP5NOEb09qNn8jrpqnXuWmXjb+CR0cXLG3ZWdJStkG4fEUQBMwMXbJghVS3VpF6oaVFiWY/QGCeW++WDGEF9ECVb0zzMOKHdnCiU5H9CZCYS9+u2isAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748958664; c=relaxed/simple;
	bh=TpMwl2oz7EgmR302mml/BLJBQvaM57yfpZzI6Z7p75c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WcrfRbl6NVrpSbC57fU38iHpgueqAAIXv481za/jI5xmGz3RvS4S52F6KrW4/ggDHnHmzzEB+xns3yPPmf8pPKlUhOiZZqCUp7CeTGvu/SYJogQI3/wZsA+5EHswUOWS8Gheipc+dJVzuEHKCUr2nWWSywDEfuyXUOfvjh27/Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=QHfIQXw5; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="QHfIQXw5"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6facba680a1so60190526d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 06:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748958662; x=1749563462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YjoJn2Zm/22QHFjhWW1StoVgQrArf1QtKVAZNo0G9LI=;
        b=QHfIQXw5But1vmUFqdBH6BH/hFhbWI4i6QCDYKQrH6nXF1gNEWyy3Linkm2QzQB3eS
         hQ+jSXBuKlpUDWA8HxTrScBMYslIuisCvkwxxZoOp0hOqSgCk8kTO1XCvTZryXT1AV3s
         vLVgX/f5cdSflDOz7fT635cTw7WA3xxlF6PYdR2WoOmpzZUxVTW/M9y1cfI4RdC/3fB/
         epQDqplIPk4dJ6LYXVowzT3PlepXl2womploBf3dqZ0F2j5JdNj9tjRAAy3NxziyZrNy
         0mqe4M1l0RGyrNmg4SBuwcBh4a0FdBz9gzPQeqsUhQEAgJ+aDTuNihxlJbkzwdDRgTJt
         mRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748958662; x=1749563462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YjoJn2Zm/22QHFjhWW1StoVgQrArf1QtKVAZNo0G9LI=;
        b=W7UvIM9r1HDmDtBYzQouBcg3A+A2mFJ13673mSs2SGBFvAnCZSSteAy7ZRJY7s6yDF
         SeClLI03JrnPVv/XRF8PS2ES4V1rKEPhjGjhBQ6bnovIAe4e/vieZmkm7EIZRyoJwBJy
         OS3was9GQn8vnkyEzPtqx9LG/T9/7c+/QhNx4KqkDI1iPFk/hp6bOTj8D/9FoA+6AYOt
         NW3bdE2ZRfNv6MUY1vC16qUtwFw2GlCqgSVTcKDig3TroZ1j5yZdcIZ62daD9V3CFMZl
         VB1KYNcQ7zsOMesgWsYuQFK7NT7fmze2zuYFSZ9oFhz4Dbj6qG6LjibvhwKWxLv8KeOg
         +HTg==
X-Forwarded-Encrypted: i=1; AJvYcCVN1OkAOZvOPy4FKW/TBYnevb0ktfwUumzKsAdBhHgiLqFjPhs8eZHKGvNPZ1JIv268kadqJdW9wcnB5VI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4S+3Qv5Sk27ncZ96UtsY08JqlGe0JLHzjud5NZEKbWkDFcwd7
	cJ39bJ1o3dmxowZ4/A6n+XFJl+BQdd2Svd9iovx5t08pv6PfKOdxh+KHN/kcGGMfjntz45wDatf
	jy+mf
X-Gm-Gg: ASbGncsAR1Z+3F9/4A6eVbLVpPsp9xEMBRR/+MivUODllHN3zq221zNVL7CpXWjRI6E
	9Sl3LDGyBs51p9TzRBW0L3amyLU9FDSKnMN9gi7/fLUWJT4G3ORQlsS7krFKqb5E0Aq8zTrp79s
	x0zOy0+tVTfUCx99riryLkjz72tuHZrE8Twr1dBlXAfiLrlrJ6bGbToTZRWQrtyRYuCcMitPmrW
	s9dJEtLuVCUQqcOhNRPhZIJLsmesIB2KyYDZRd381Q3dODx+RRzEcKM0Y1tM4XlDHIYNfACppvY
	UcxHZHgMDhtSomNVK5vmnattkybMQBYxiIGBxXMD8wbSK4YT30IA4pwklhk0EmlFjf0us1awK1O
	gD2gwehhVq/mnMt6eAjMtE6+6gbg=
X-Google-Smtp-Source: AGHT+IEFP32FP1kWWCcJZHDROTyLVsjrCtV3bR6kiIwGVnTYe5RPt72l9Jyf9JX2LfFifGppycDP9g==
X-Received: by 2002:a05:620a:4629:b0:7c5:3c0a:ab78 with SMTP id af79cd13be357-7d0eac62c8fmr1708400485a.14.1748958650816;
        Tue, 03 Jun 2025 06:50:50 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d09a0f9925sm841658185a.41.2025.06.03.06.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:50:50 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMS2T-00000001hDC-3YG8;
	Tue, 03 Jun 2025 10:50:49 -0300
Date: Tue, 3 Jun 2025 10:50:49 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
	dan.j.williams@intel.com, willy@infradead.org, david@redhat.com,
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
	zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
	balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org,
	John@groves.net
Subject: Re: [PATCH 11/12] mm: Remove callers of pfn_t functionality
Message-ID: <20250603135049.GL386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <4b644a3562d1b4679f5c4a042d8b7d565e24c470.1748500293.git-series.apopple@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4b644a3562d1b4679f5c4a042d8b7d565e24c470.1748500293.git-series.apopple@nvidia.com>

On Thu, May 29, 2025 at 04:32:12PM +1000, Alistair Popple wrote:
> All PFN_* pfn_t flags have been removed. Therefore there is no longer
> a need for the pfn_t type and all uses can be replaced with normal
> pfns.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Yay!

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
