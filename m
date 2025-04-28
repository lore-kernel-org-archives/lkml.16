Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8D613C9C4
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745875817; cv=none; b=dcfrQER6FUDOCGC5zqVZXdUjxsmmeoXl5M1OTVrA7jtSaE8oy4nwi74k9uXa1SNVFmmeuQi7jjGIyAL60w+2cSQtTrDCvSYPrCjFobl0KmMfjyqmGgcNcthQULk84l4JrQCkfjKpyrsplXdBbgGK5wgdGm6Hm1kjSKgb0FQA7hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745875817; c=relaxed/simple;
	bh=nKCFuxpHhC2Jo71DANxQbzEOwjEyhE2ZZX+TDzhvCgQ=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G+q+CA0wIDcULv5gth4wiCxPuiCpPvV1Uju2z/sIbE12biqTc6Ht5YKXm/t7T9o3DZMTgDPMjLnAZoKqY52Z3bo896C5xgKacTeTdUwc0PUywx+h7jntN0ZbtqCf2tMlfZgzWjkDw7cxTuJvBgtl0Ewr323OjwkBT+vUyt7+fDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N8nzIuSl; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N8nzIuSl"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-30384072398so4616739a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745875815; x=1746480615; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YG1w6HHYm/l8zTsmOysX3vOudlRGWNt8bTIB/Yl2TlQ=;
        b=N8nzIuSlPNPKmqwfeV2SDtyMLG8jhMoXsOW3/dAiAgW3Ngjtxtnde/JMXaENwSrogk
         TzHGqY0spzSwyMckD32FiK99lrL0NRThH04UTB894ktqhEI1t5aH8vkQjfrK8QA0JKYZ
         LOy91pCE28hEu2q0cPvkT59DGK1PspG75UXnkR02R14LDvsjgnI3os1FLLAxZAhyczX4
         vzHTVXcz9ccoz5XD91AxgJ/2bLax8CH4w6RL4p35rc9uAYa/46/JSCgTaun1uETmbHT0
         4HjmD1vbJ1mGUyQl5l6LkEUsRsffuWf0KYygbsV876HbP+TMLN9QWBMLGXr9pQS+43qO
         EwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745875815; x=1746480615;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YG1w6HHYm/l8zTsmOysX3vOudlRGWNt8bTIB/Yl2TlQ=;
        b=HY62RXRhhAB9KKzIeL26X4E3S7hdKbrxrTij/xTe1WLITEyoM4/C8n2kwg2ilusPCx
         ZUhHAbLGYvHhaUuZhfrEq7qjWPo02ZNlDMzN4TJ/HMByiD2wtd88cQZF81lSIBzlLmmb
         MJm1K4Yvc+qLcr7fRY7c1/ctynstDwpBrue1S/9MGxYfHxho5ZCooEMqcOKsy+qhHHFy
         aG/YdIW9aTqtee1lGHPtPMWE7ISndWk4HLkxAitIi5+JzUasYWgzz6rcsFzdZm8PreKA
         5ikVhB48AyBrRPXjTshbUlN0Au2tXCLJttbucLrxSttxa7hMh2J+3dYuNWnfM4SXtKF6
         S9aw==
X-Forwarded-Encrypted: i=1; AJvYcCX7RlN9wXrKwYzA3AqpAVd0+VwWZ57SSPIOOAaJdKOFOxXOz3M8b1t33HI/pVwd3o0jmdMsySZfDK1PQVU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQhZYJIHdpLs8oPL9Y522Mq5sTr8NA9g7LGQj4vGvE4liSL3fr
	K5UpuaUabkmbYY+1ovZb7/f75ttcErlhCvY67hsD6vPNfjdxPFPP
X-Gm-Gg: ASbGncv8rdSvkyM0ICzkZQtexvhzbIM1y6+Z71yWOFz18QtfYc85ifvfQm4uiE59fsW
	fjyY+tbdJ9zERkdu36FBYJ2hnj7bvWGdVz8I/lUKirr4z6vBv0M7bpEWNGiOUvLVoX+9pwQLnIX
	fos+ciXhqbBTj93LDnJI4fDylz05SdaG5SPLxlZqFL0+Igsdzp25kC7Bvervq+MmcoCTJwSVzja
	xoC+RMcAZNSSQljBpGpp+LCxAhO9PU7rPIt2wMdtk7V04XZWL2hXBjIdGdISyA1n85gtc2pjxuV
	dI9b844X01IQioniXFLAX57mwujI6gK2ZyNd
X-Google-Smtp-Source: AGHT+IHPKcX8WdmgM611C5Af4M3Bg9+/VDHFvDyrnDb4nGevruzI5UEbSPnRp5eM73InHVi5WLDoWQ==
X-Received: by 2002:a17:90b:3906:b0:308:7270:d6e9 with SMTP id 98e67ed59e1d1-30a23dd65b7mr463424a91.9.1745875815327;
        Mon, 28 Apr 2025 14:30:15 -0700 (PDT)
Received: from debian ([2607:fb91:20c0:f614:98be:8f32:92e7:f9cf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f782d4d6sm7786725a91.38.2025.04.28.14.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 14:30:14 -0700 (PDT)
From: Fan Ni <nifan.cxl@gmail.com>
X-Google-Original-From: Fan Ni <fan.ni@samsung.com>
Date: Mon, 28 Apr 2025 14:30:11 -0700
To: David Hildenbrand <david@redhat.com>
Cc: Fan Ni <nifan.cxl@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
	muchun.song@linux.dev, willy@infradead.org, mcgrof@kernel.org,
	a.manzanares@samsung.com, dave@stgolabs.net, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] mm/hugetlb: Let unmap_hugepage_range() and
Message-ID: <aA_zYzaURCROGegP@debian>
References: <20250428171608.21111-3-nifan.cxl@gmail.com>
 <20250428123143.2b644354975c2b89e5ae51c6@linux-foundation.org>
 <aA_Z9R-vffyuwNyV@debian>
 <3eda315a-cea4-455e-87e8-39e6b82d4afc@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3eda315a-cea4-455e-87e8-39e6b82d4afc@redhat.com>

On Mon, Apr 28, 2025 at 10:54:51PM +0200, David Hildenbrand wrote:
> On 28.04.25 21:41, Fan Ni wrote:
> > On Mon, Apr 28, 2025 at 12:31:43PM -0700, Andrew Morton wrote:
> > > On Mon, 28 Apr 2025 10:11:43 -0700 nifan.cxl@gmail.com wrote:
> > > 
> > > > Subject: [PATCH v3 0/4] mm/hugetlb: Let unmap_hugepage_range() and
> > > 
> > > What was intended here?
> > 
> > Since I have changes in each patch in this series, I thought it may be
> > better to have a cover letter to summarize all the changes in one place.
> > 
> > Should I just mention the changes in each patch separately?
> 
> The subject got trimmed, I think Andrew is asking what the real subject is
> supposed to be

Oh. I see. Thanks.

The subject is 

mm/hugetlb: Let unmap_hugepage_range() and several related functions take folio
instead of page

Fan


> 
> "mm/hugetlb: Let unmap_hugepage_range() and ... " ?
> 
> -- 
> Cheers,
> 
> David / dhildenb
> 
