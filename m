Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999C9B673
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 03:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743477587; cv=none; b=IjWothOkmOBApk0XpVm+P32u6Iz4XHNde8Y+kUQQZjvVvPF6C1i4BseaHL/HPGCPyDPlOfqBTjsB22anOmwgCTp6LodmDHfnAT8xubfEkauk3XX1GUlp/YsI3N9bf6njIc7vbTnOk7iwhTrp3k2NS8gMBDBw9leZFBoIhkkmAQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743477587; c=relaxed/simple;
	bh=ETeNiEfpaxEIGUNVigD1LxoYsMBjMte0dye27u2P+l4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kSJTg+b8cjzpXkdse19s/12gckabeZwE3kAuqVjLu5Xajz9KcHmHgLt5QkxGCudfMQskEOLsORlWnckJRaOY1iFjHnv5rJVzu2nylW4qKFbwLzLFM+VJv9pBkwDiSH+VfuFuU53gljsp3S+mQDmo5N2bSmPodOMALziZ7IPIATY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TmrUElFP; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TmrUElFP"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-225df540edcso112454465ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 20:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743477585; x=1744082385; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qSA6nscHvUXLIy2KiUBnTSjJSsojlhHgxKPamJIxqA4=;
        b=TmrUElFP3oim2sbY0X1iQ5W0hVKpfhE4T09xEpwR0S4OJ+X+4uhzK2lEXeAcBHVxlI
         WSL7JTFrvxO9AIC7quqHN7yU69wuXR6LpIjChdA7yZgKvPqiBQCeGehzOME/wWsSJo7P
         PN9JlDPNi/a9xWavRnMXw7yUEH9koKrFnrf5UMBMnDxExURvaJplmR5T8QuHeY6o9ByA
         OFSQ2CNiHvHoMkIsahTUTvI23itc0FOpJJivh4YBIbmAn52YFvpgB9kBclqIpk3eCuSn
         E7agbSs6mPUtwGuD4Al3A0LBCW7ekB1Bymw4Yni5f5+iFLFhkSNYwg4abUwtXSi4AdrM
         Rg7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743477585; x=1744082385;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qSA6nscHvUXLIy2KiUBnTSjJSsojlhHgxKPamJIxqA4=;
        b=AdzVv8XHYC2v3sCKH/dxzmSqBOHQfCvTWQAjCcqm4zBwsjOme7KdkRwyeOaIA+sIUw
         YUOLy1dNCJj5/ebheAPnM8OH2C23+8qMyQAzwGkdzg8PiL2TekPxGP//riaXQD71I9Ja
         gmp3jxWdoT2OoHPcb4Ndw+4FdAuOn+O7pbs0PaGaCEikmJ9UF3MJTXpsdXFvoL39G++V
         /Uov0mTZSucFCaiBjKxuPyOW9mnmLTYWTWR+yxzO5FfitTQ0vz08Xxm/bbKiVhFY3ibc
         c+jE8Hptps2QoJPPogVB3ndV/OmBeZUZCsKX3YA8V6MFduxsDjHrpf56wGTTZeyveEe/
         rlQA==
X-Forwarded-Encrypted: i=1; AJvYcCVDTW78466MHeXiACkX3Vcus3N2RMJ0QNdEP4KEENYoL/ewfIgWQj1U3OZ/iP01btNkoLl1HVpzVpIsD4U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPYaxECpAZXe5n8sxGC5Okmg4DLrWDU8eyK/xSlXfRxt95HNEh
	sS2cveuvEPGfUbxckbpr73hMn/WHiMR2sX7Hjl4We2Mkbt3PP2v1
X-Gm-Gg: ASbGnct46Onj0voEU6ujYGlO25F2mDRhW+6yvSka6SgMDCM2V6YivfpdNaF0Ll1m8Ks
	rg5rxZg+aZPZlrB77sv/EF6IKFVj1dvMg2d/wpaPbfKVCExiKQZ45ItguLaQjfBrPUeHLdsjIR6
	ZMIh4Dk0wegVAR41IxzEbUfMWDRvrbZY0mWk3sCn9bloQVGGzWesr9rL9/UgXEw5jPx5CSEX66r
	FxTg8j2hO2v13BkzCIwscDHP9WzC5chsW4tP/7A5Dbti/1zzzVZ3qG78d3NtRPr2dOUn9pbjMKO
	LK4+BL5oAsLUENusc8t4IBGtKKez8BOkBOpIuKv9dtApSh3lW6eEWAJuEsR6DvD9Op8PSoWxRf0
	M
X-Google-Smtp-Source: AGHT+IFevRgm143Sh1HSPNR922oPs6dlDmwWjnJnb+QfW2hFF1JlgS0mnFU402xbbOW30lgePWVVAQ==
X-Received: by 2002:a17:903:178b:b0:21f:58fd:d215 with SMTP id d9443c01a7336-22921ccc028mr224889835ad.11.1743477584671;
        Mon, 31 Mar 2025 20:19:44 -0700 (PDT)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1f572dsm77200525ad.232.2025.03.31.20.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 20:19:44 -0700 (PDT)
Date: Mon, 31 Mar 2025 20:19:41 -0700
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Huan Yang <link@vivo.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <jackmanb@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/1] Introduce vmap_file()
Message-ID: <Z-tbTWP5MYzwrRYX@fedora>
References: <20250328211349.845857-1-vishal.moola@gmail.com>
 <02ba63ed-ef1c-426d-b469-09878c5f03d7@vivo.com>
 <Z-tGXf5mfTclxZgl@fedora>
 <a3618dd8-5b4d-45d7-b619-1c89ca7fd6b5@vivo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a3618dd8-5b4d-45d7-b619-1c89ca7fd6b5@vivo.com>

On Tue, Apr 01, 2025 at 10:21:46AM +0800, Huan Yang wrote:
> 
> 在 2025/4/1 09:50, Vishal Moola (Oracle) 写道:
> > On Mon, Mar 31, 2025 at 10:05:53AM +0800, Huan Yang wrote:
> > > HI Vishal,
> > > 
> > > 在 2025/3/29 05:13, Vishal Moola (Oracle) 写道:
> > > > Currently, users have to call vmap() or vmap_pfn() to map pages to
> > > > kernel virtual space. vmap_pfn() is for special pages (i.e. pfns
> > > > without struct page). vmap() handles normal pages.
> > > > 
> > > > With large folios, we may want to map ranges that only span
> > > > part of a folio (i.e. mapping half of a 2Mb folio).
> > > > vmap_file() will allow us to do so.
> > > You mention vmap_file can support range folio vmap, but when I look code, I can't figure out
> > > 
> > > how to use, maybe I missed something? :)
> > I took a look at the udma-buf code. Rather than iterating through the
> > folios using pfns, you can calculate the corresponding file offsets
> > (maybe you already have them?) to map the desired folios.
> 
> Currently udmabuf folio's not simple based on file(even each memory from memfd). User can provide
> 
> random range of memfd  to udmabuf to use. For example:
> 
> We get a memfd maybe 4M, user split it into [0, 2M), [1M, 2M), [2M, 4M), so you can see 1M-2M range repeat.
> 
> This range can gathered by udmabuf_create_list, then udmabuf use it. So, udmabuf record it by folio array+offset array.

I was thinking you could call vmap_file() on every sub-range and use
those addresses. It should work, we'd have to look at making udmabuf api's
support it.

> I think vmap_file based on address_space's range can't help.

I'm not familiar with the memfd/gup code yet, but I'm fairly confident
those memfds will have associated ->f_mappings that would suffice. They
are file descriptors after all.

> > 
> > > And this API still aim to file vmap, Maybe not suitable for the problem I mentioned in:
> > > 
> > > https://lore.kernel.org/lkml/20250312061513.1126496-1-link@vivo.com/
> > I'm not sure which problem you're referring to, could you be more
> > specific?
> 
> 1. udmabuf not same to file vmap usage
> 
> 2. udmabuf can't use page struct if HVO hugetlb enabled and use.

vmap_file() doesn't depend on tail page structs.

> It still need pfn based vmap or folio's offset based range vmap.(Or, just simple reject HVO folio use vmap) :)
> 
> > 
> > > Thanks,
> > > Huan Yang
> > > 
> > > > Create a function, vmap_file(), to map a specified range of a given
> > > > file to kernel virtual space. vmap_file() is an in-kernel equivalent
> > > > to mmap(), and can be useful for filesystems.
> > > > 
> > > > ---
> > > > v2:
> > > >     - Reword cover letter to provide a clearer overview of the current
> > > >     vmalloc APIs, and usefulness of vmap_file()
> > > >     - EXPORT_SYMBOL_GPL() instead of EXPORT_SYMBOL()
> > > >     - Provide support to partially map file folios
> > > >     - Demote this to RFC while we look for users
> > > > --
> > > > I don't have a user for this function right now, but it will be
> > > > useful as users start converting to using large folios. I'm just
> > > > putting it out here for anyone that may find a use for it.
> > > > 
> > > > This seems like the sensible way to implement it, but I'm open
> > > > to tweaking the functions semantics.
> > > > 
> > > > I've Cc-ed a couple people that mentioned they might be interested
> > > > in using it.
> > > > 
> > > > Vishal Moola (Oracle) (1):
> > > >     mm/vmalloc: Introduce vmap_file()
> > > > 
> > > >    include/linux/vmalloc.h |   2 +
> > > >    mm/vmalloc.c            | 113 ++++++++++++++++++++++++++++++++++++++++
> > > >    2 files changed, 115 insertions(+)
> > > > 
