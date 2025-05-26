Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEC71DD88F
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 19:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748289441; cv=none; b=o82ozKqHyXaFuuofb6ukLbzTR2SFrppw77AisXjAnAfJWSiMEu33xy319wbUI52pOUWomaHpvnCglDGtRKPifMt4ygbRAW9JmmAJYcsCTEh1dpKrdH/4crHobiRfAVYQ+SHJWrFhpBhHs2ed0B5jyCcXdnAhEipwrslpTQradeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748289441; c=relaxed/simple;
	bh=JjAbM7bwUENza5M+9Ys+LTpnMeBhw+VDL+sZEhskg8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZFIrL+HIkMpoCgd4UiJy3GibATAxH09pS79fowVYUGphC9TiKG/4pFl187E4IFlUNe1o9XbPA6GR9I1eOP7Y0NHCADMcjEAQwB3gZR3/Jc8F3WqS2m16OgD9fFdIwJJmSCmf+X+k6UNVmpqakIg3oj4ElD9MFcBQ4oF3ngN42E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=jZ+DXS1p; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="jZ+DXS1p"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c5b8d13f73so267293685a.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 12:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748289439; x=1748894239; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=52+nhUj+fXQPtnoww4dOPn+bKeui7Kmj06MnKB1tkio=;
        b=jZ+DXS1p39MIdM+QtX+2ZF1iLDJdidx33EM0yeC5VzUre39wRNz5DSGYzK5mbw2RnC
         Vd5VK/oYpjxdooMNPSmna0mjnAQQGlIDWrHigAzngXtj/Wcyvw4o7EyZtY7BZGhIosuY
         ZQd4Cicm/aBcnRM9a7S+F+nFi5fsdIwQvcrM34fZktCjbvOVv1VB3Z8m4VTBRyXIl8hJ
         hhTfcQiCOJ+Pyj3hDmsHHImFqPZ/xr/zdzQl+Esb2u8Q/awl0v/Dr+9xoBbtyzYfmetB
         9XUdhr8OAXSRF+pWf8GbSZS40LxXJuzy8K7S+N+nU6NewG939FQhncf8l6Pkpwhr9R65
         l7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748289439; x=1748894239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52+nhUj+fXQPtnoww4dOPn+bKeui7Kmj06MnKB1tkio=;
        b=WUEHFaiKjrR44TAPgYXw3YKqlflhpGoAyInmXbmRZVr6DXCfyuXh8dxLRg1+EJHXK6
         HrF4zcNArbXOYcbR51bzz951WjV6uTMiOT4LcNZXUy4+ByqAJ3n8RnJgT/oUEOcuAk0o
         4AqHD02TAtVJQcpM6cIH0/7OKJrUx2RwFSbAxjKXpgSRy6Uwlo0ZV+HdZ3PTVqDwkzSK
         +WhIpN4kdbVoAMkunK6O8yRwmnRVsf+yobTblULJu0CJmjGnyf0BT6KusDFYjRYiWB1R
         9XOwNr5wQ/DA/P+i5DGkc8nv9HGr2w4rzhzC7Rf8otTb3K51oACA4/DKCTxJo8vWDE7R
         nw5A==
X-Forwarded-Encrypted: i=1; AJvYcCW9PasiO46KN3vGHq2AllSSoo8XaRCQQl55N7Tg1qpmT0KHKD0YhBZRZ+Rl5+joOKpuRuCzwHFvP6E9EQ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGEhOrTeuDBhjHCZ8GMIX5T5uX7oKpv01nN6GyPhJ5YPXQ18c5
	6Ynuw1zHt0KP90GCMmYyeGUtHzXUYSA7Y/bdLtjq7xWaH2v1WWWSp7n1NQNkVwPDGbxmk+7E153
	HcikU
X-Gm-Gg: ASbGnct6y6xAVlS973F92V7IGWV4n8HVvrf4m+QJvH4ieKc8vjQ21fvLSWdNlXrNlFE
	tBUKZXG8yYE9wobKqoBujLqkL6NXPufa8wmitLZuZXMqHhcEaVQ8mnVpgS6e8eiCbZNWiEzwm58
	VaZn69RSZ/RrkKu+qsARQKsiqnFjOTTcLxi2BG2wZy3Bg9Jk9IUCKB95h2L1ND+KUWTALo+Jcut
	/zskQooywVC6kIkiSIkoWUWrIfkQR3VfJyyNtSaO9l3MrsD7YDvJi7CUwMMmznp0KqiCGsMCogl
	9qsCoZlGJXjUFnsVo2Gya9GKohulEIpUASa+XQu4RvG9LSiBs1+188CM/dx7tSYFR8gmSykFXVk
	7bSJWM4z5h253QlgJ9peqWbPAPy8=
X-Google-Smtp-Source: AGHT+IFylJzlr+Hf21yAJjGNjVN0dUWZdqK9Jw5gc+JL3yLgiy4iZKIjMcJvpGVnbPd2NANnBq9o+w==
X-Received: by 2002:a05:6214:21a3:b0:6f5:421b:623c with SMTP id 6a1803df08f44-6fa9d173b40mr195321546d6.25.1748289438786;
        Mon, 26 May 2025 12:57:18 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6faa050c0b8sm33866496d6.74.2025.05.26.12.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 12:57:18 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uJdwj-00000000Ude-3Scs;
	Mon, 26 May 2025 16:57:17 -0300
Date: Mon, 26 May 2025 16:57:17 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@infradead.org>
Cc: Leon Romanovsky <leon@kernel.org>, linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org, zyjzyj2000@gmail.com,
	Daisuke Matsuda <dskmtsd@gmail.com>
Subject: Re: [PATCH for-next v3] RDMA/core: Avoid hmm_dma_map_alloc() for
 virtual DMA devices
Message-ID: <20250526195717.GH12328@ziepe.ca>
References: <20250524144328.4361-1-dskmtsd@gmail.com>
 <174815946854.1055673.18158398913709776499.b4-ty@kernel.org>
 <aDQQyjJv9YKK_ZoV@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDQQyjJv9YKK_ZoV@infradead.org>

On Sun, May 25, 2025 at 11:57:14PM -0700, Christoph Hellwig wrote:
> On Sun, May 25, 2025 at 03:51:08AM -0400, Leon Romanovsky wrote:
> > 
> > On Sat, 24 May 2025 14:43:28 +0000, Daisuke Matsuda wrote:
> > > Drivers such as rxe, which use virtual DMA, must not call into the DMA
> > > mapping core since they lack physical DMA capabilities. Otherwise, a NULL
> > > pointer dereference is observed as shown below. This patch ensures the RDMA
> > > core handles virtual and physical DMA paths appropriately.
> > > 
> > > This fixes the following kernel oops:
> > > 
> > > [...]
> > 
> > Applied, thanks!
> 
> So while this version look correct, the idea of open coding the
> virtual device version of hmm_dma_map directly in the ODP code
> is a nasty leaky abstraction.  Please pull it into a proper ib_dma_*
> wrapper.

IMHO the ib_dma_* family was intended to be a ULP facing API so that
verbs using drivers can pass the right information through the WQE
APIs. Inside a driver it should not be calling these functions.

I think the bigger issue is that the virt drivers all expect to be
working in terms of struct page. It doesn't make any sense that rxe
would be using struct hmm_dma_map *at all*.

Indeed maybe it shouldn't even be using ib_umem_odp at all, since
basically everything it needs to do is different.

The nasty bit here is trying to make umem_odp overload struct
hmm_dma_map to also handle a struct page * array for the virtual
drivers.

Jason
