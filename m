Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B3516D4E6
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 19:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738696565; cv=none; b=j5XPulu0Ob5Y0luU69dQF/On610hJ8aS1xH/9Zz+X0h0ce+JpCgmoO5dlTj8rcA44qyBM+YOuE8bNEI5MAaIXC6jiAfQ0NMsqbhW2SWJ0Z69M/Iknhi8CGMjzUOgm1Ubqf6qhdmf4mdic2D3Dx6+MVvZTGpLcHwsb0UNmMcXe3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738696565; c=relaxed/simple;
	bh=DnItlRYKz5NSnazVyRKSxC1u7AkupexFhmFvWYVnt70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aNP4W0z9tOl+1J3V5AP/POveI5TLR1LUe1WKG5ORF5M5PC6nWgul3CoOCnSgKHo44zTcamSoFHkSzcWD2D1ucgn4L16rbEtW1Q4sKhiUOnmF04FvwRunmYuH0cs4Gs+XCZIEI7y5fv0L2o4Rl4SK6HlsaEtKuN2Z2S5BuWptZ18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=VV13Ud88; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="VV13Ud88"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7b6f1be1daeso569884585a.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 11:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1738696563; x=1739301363; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RbSThg2+IgOzUPVYO+O03rGdKt6FNxSQQgDDlA3zKuo=;
        b=VV13Ud88/a6ujOwmHv3p3i0jA+i42Sq+FdVg2G5tTjVoECcp5LzoJNFHeKqp4VTtBT
         L6NWj5XBke0zfqU+ShCXAfYWe8iCKckF0eT51s1cFPTIqOy8+DEBmUjHLOsd98rgyqDM
         iUi/oaiw4iGlRMbxjt1bXRKDKgtFovBVKiSyWwRdSBxe7fozuwwda1MGLVrpZsafLBbc
         xyKjB8Jq3rli2rqxUZtvrtnCL5b2TtGEpckhFHPc3BhIOrxnoNFQC/DbTPwsMaqUQWQS
         /0ER2z0ikptzv6IXcqft3LB20XjRzy3+aJYXjE1pdBowKTrL+VkV88H3/fcTyXes/POm
         QT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738696563; x=1739301363;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RbSThg2+IgOzUPVYO+O03rGdKt6FNxSQQgDDlA3zKuo=;
        b=w6AzSho/xe5f4VW0t9278xYd99VH5ny2p77SlbW2IQ475blXtcLzvPSXJUsLZ5K/NO
         NeAHK61T4Yk8hhLatsJYMBKMXY9PpzcbFswz4rEnTgaLNZiw88qDii0mFj8YgWA1d0EB
         WHMBAwbGp8gag1TNFaghLqArk7jS3x+QDu/f+2DGhznyw4obfmP+k41wpdss511zz8Kk
         YNjgCopUyKi4uNGaoULqE6vJQ9DithGcAXccd8aXwDkmZg4Hc2aa1b4/NSdXpuavlW3h
         R0HmvdLhmxEHqVZ4bdrBop16v761h2e50QJQtdGO/3HbCUaKfrUbSyl/vm367HJkaSts
         uNkg==
X-Forwarded-Encrypted: i=1; AJvYcCU9YWe2opHnJ09Y/+QTe47ImsNev1VeQe4dJtllxHcqUaXSbHLLDAxu9GzQAcht1myRmE6OiwDYTF9ciKg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLnnbeppsgeAgpGXPSpHyFk4ZTTF1tYkvuRWjxUVF9iqdtvEPY
	z2Cp3mumYw8Mu5n74n533QW4vasLK7Srx9vwjMUj+p/LFRVtLRA7WXgxQ9tZp20=
X-Gm-Gg: ASbGncsBJU50WsEd9C0R7jGcq0k9SDQmjWsZD9CNv6uFjMTb6yzaMp8NSooDI1JGAlt
	4Enxaqm//Vosen8LtXfgoQ+/0nFJ/cn2muq1nWO+inlUf4luaMsHN0cqeVpK/yUdZk1UW9zC99O
	ze5oT3RsJyflgBSGY5cbqIdnwgrefGl7kS3fZKenUsC6lV66dEra37xQ7SD/90ZHtrkKe0+lPrm
	WadJdLEFQh+kLSgwXQAW7SStP7pcHB9C7MDWoTuGsFbvUHgxn9JGSwXoQNU8qJ6j1poaSHdCbj1
	Gc3T+VRIcdG+g3CYNxk4q/sFm+arezc2ZZ6ZeHdxCcBCfNJgL/IrhXVlVo/AFYvm
X-Google-Smtp-Source: AGHT+IFDaDGZr7b/tFbMEfs7niyU8J8dtoT91Z8F6Kt1MP6P2VK98JCkXIPoyuzy/DdpTLj+ZRuWhQ==
X-Received: by 2002:a05:620a:2710:b0:7b6:ebc6:181a with SMTP id af79cd13be357-7bffcd9997amr4139068785a.41.1738696563125;
        Tue, 04 Feb 2025 11:16:03 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8d97c2sm670296085a.64.2025.02.04.11.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 11:16:01 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tfOOv-0000000CUOy-1LgY;
	Tue, 04 Feb 2025 15:16:01 -0400
Date: Tue, 4 Feb 2025 15:16:01 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Yonatan Maman <ymaman@nvidia.com>, kherbst@redhat.com, lyude@redhat.com,
	dakr@redhat.com, airlied@gmail.com, simona@ffwll.ch,
	leon@kernel.org, jglisse@redhat.com, akpm@linux-foundation.org,
	GalShalom@nvidia.com, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-mm@kvack.org,
	linux-tegra@vger.kernel.org
Subject: Re: [RFC 1/5] mm/hmm: HMM API to enable P2P DMA for device private
 pages
Message-ID: <20250204191601.GK2296753@ziepe.ca>
References: <20250129134757.GA2120662@ziepe.ca>
 <Z5tZc0OQukfZEr3H@phenom.ffwll.local>
 <20250130132317.GG2120662@ziepe.ca>
 <Z5ukSNjvmQcXsZTm@phenom.ffwll.local>
 <20250130174217.GA2296753@ziepe.ca>
 <Z50BbuUQWIaDPRzK@phenom.ffwll.local>
 <20250203150805.GC2296753@ziepe.ca>
 <7b7a15fb1f59acc60393eb01cefddf4dc1f32c00.camel@linux.intel.com>
 <20250204132615.GI2296753@ziepe.ca>
 <3e96aef8009be69858a69d3e49a2bd7fc7d06f5f.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e96aef8009be69858a69d3e49a2bd7fc7d06f5f.camel@linux.intel.com>

On Tue, Feb 04, 2025 at 03:29:48PM +0100, Thomas Hellström wrote:
> On Tue, 2025-02-04 at 09:26 -0400, Jason Gunthorpe wrote:
> > On Tue, Feb 04, 2025 at 10:32:32AM +0100, Thomas Hellström wrote:
> > > 
> > 
> > > 1) Existing users would never use the callback. They can still rely
> > > on
> > > the owner check, only if that fails we check for callback
> > > existence.
> > > 2) By simply caching the result from the last checked dev_pagemap,
> > > most
> > > callback calls could typically be eliminated.
> > 
> > But then you are not in the locked region so your cache is racy and
> > invalid.
> 
> I'm not sure I follow? If a device private pfn handed back to the
> caller is dependent on dev_pagemap A having a fast interconnect to the
> client, then subsequent pfns in the same hmm_range_fault() call must be
> able to make the same assumption (pagemap A having a fast
> interconnect), else the whole result is invalid?

But what is the receiver going to do with this device private page?
Relock it again and check again if it is actually OK? Yuk.

> > > 3) As mentioned before, a callback call would typically always be
> > > followed by either migration to ram or a page-table update.
> > > Compared to
> > > these, the callback overhead would IMO be unnoticeable.
> > 
> > Why? Surely the normal case should be a callback saying the memory
> > can
> > be accessed?
> 
> Sure, but at least on the xe driver, that means page-table repopulation
> since the hmm_range_fault() typically originated from a page-fault.

Yes, I expect all hmm_range_fault()'s to be on page fault paths, and
we'd like it to be as fast as we can in the CPU present case..

Jason
