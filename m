Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7841AAA29
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 14:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744468554; cv=none; b=qcux6gaFHgMdeaLdwIGTUAXEKeupZbGI5lOQtgWELtYyzpruRU6us94mHwJ3qs7PoLQGy36WHgnsRPdHwQc+ckg7d/j4JG0/zod4deOaYXaelxPXMPRherjPNxUoNoe6Ptjp1pwS5v6gb9UVpBAQhzsNVxT82DguGvcNx0UV7eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744468554; c=relaxed/simple;
	bh=TbaDZzL6rMhmNxwCb5EkKrjkKd4SNnXJvVsLOY0xK3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eMQj1+JkLd4CCb87cnLlgvDrZaRMT/KozX8tgETwudqDUF+8ZWK9DF9J6mpf/dCf5DzuCDwn8BaGwO7vqU4IumtVY4/fXhtH2tJK9NKF/ojF5v+8xFQ+vBJCQttnKDzMq134Mq0zeM++1PK0adGgAfS3mdjZmY+i3RDOf2wPWRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=JnaOdI5B; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="JnaOdI5B"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6ecf0e07954so40938686d6.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 07:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1744468551; x=1745073351; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dKA6CW8lkxsZYkZcNj1adEARS2rUQdUi3RNcgzxuj0E=;
        b=JnaOdI5BUB0a3mlfHxjKSZGw46aH6gXZo3DGj0ORT8gZsbH4o4+TlBxBpt4Rep/EmP
         kwMNPG2u31oIQGPNe0kVnt23tLej+Xy5GzszUn+J+9CBXEvFUwPkngFY91G4aHobku53
         zJIheAqNCXJhOd2/SGhKWeCV37M9EnmoJunqDct4YXas6lrqMwzQGPWcjD8Y9ULh3fgG
         lWOtxK7KacXGG8E38PjrvZLPKPIFDmWrsGt8N86bBQUefrbDFAGjno3xyIeHsys1GNSD
         RJhy9fGyg0JvH8RheyAuR3lXS/7U7MyGzLh0CQL3wkQiXBz+5rlmP8uUpgyXT/mrhr/0
         Xm2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744468551; x=1745073351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKA6CW8lkxsZYkZcNj1adEARS2rUQdUi3RNcgzxuj0E=;
        b=EGfC3Pd+RTXEDpPMdYufJTR1KQXYYoc6oZtu2BGZFLVm7bK7EFGioKqlF3JkC00Ip1
         Y/JLoUMLNVgfKRZp83qmqcVbMGQh81R0dtxoNjE/L5hACnt1OlcLX5Q+sVhC26jArEPH
         +LT31xUgsa1jWzvJFEs0RR1F4+288prOSc1MSW0WHIby6t+nAcyCEgNoq4Ef4CwqhzCc
         kK/9eO6T2xM0wEYleVqwUf+fPfJAgPlrjBodk9XLM67oRANX3bj3OBGh5BtccPhiL/tz
         uOX9AVK3fnwAR1jnu5+kATOSnazMoBVR4NHEChULdyHEh5KlXEGwc41OosnsIJVRHpGn
         HirQ==
X-Forwarded-Encrypted: i=1; AJvYcCURTIoyndHJkQ6U31hzI1Dh2s3SX1W5aRN4OOL3Be0mVmsIiSoKPbqFtjnEy2CR29fFOWQg/XgVurUWStk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx79FZQ4zi/diAd6gWFKWc0ugKCahjtOHqycmJozBiiMoOYJ+OX
	/QOd3j9PVwYtXnqGAuOGKDiRSOd39JmP9NEOITm6LRz1DORyD69//3ahVsbaJwk=
X-Gm-Gg: ASbGncvCJEvJm6b+UlBJ0EvRcWgwxJg2xJDhYWtyBi/xPfUxLVdVGbzmV0yWNHD2miY
	AoBDMqQpl5FKyQXywLF/9CAm4ktc62ySN2FkJrBjGivk27bSIM/DfG4zgTCrHfQCE0o659fS0Wh
	5HtTH96E/ndgVB+RKz9ExRa0GUzz2ETvKg/0dA5LjBpDoWXzbzEcGfHRWD3+d2FLHCbSRyEWG43
	v/GvX6It0ThTX6fFarWu1B5zvxVN8VlQIRoadK75OqD4Ng9Dpc5fasUDOPLq49pZ8H31jbGjrZ2
	tvk950aPNSmPPzdcOQxi342D8LTvTvIiptip9DwiI7nmyB3xpTxqBosuocAynuD7CPLMuI3zVCP
	yZ9r3h9oAT/jn53QssOPfHpU=
X-Google-Smtp-Source: AGHT+IGqSSEfyQRXlH6VjXNUEfEkbf0/sQSfoUZEWOGabEh6iMrD2lgAmfhikxDIs2A67ZjcfmNMdg==
X-Received: by 2002:ad4:4eaa:0:b0:6e0:f451:2e22 with SMTP id 6a1803df08f44-6f23f15d640mr105210826d6.38.1744468551139;
        Sat, 12 Apr 2025 07:35:51 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f0dea215adsm50726506d6.120.2025.04.12.07.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 07:35:50 -0700 (PDT)
Date: Sat, 12 Apr 2025 10:35:48 -0400
From: Gregory Price <gourry@gourry.net>
To: Ritesh Harjani <ritesh.list@gmail.com>
Cc: Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org,
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com, akpm@linux-foundation.org, mingo@redhat.com,
	peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, hannes@cmpxchg.org, mhocko@kernel.org,
	roman.gushchin@linux.dev, shakeel.butt@linux.dev,
	donettom@linux.ibm.com, Huang Ying <ying.huang@linux.alibaba.com>,
	Keith Busch <kbusch@meta.com>, Feng Tang <feng.tang@intel.com>,
	Neha Gholkar <nehagholkar@meta.com>
Subject: Re: [RFC PATCH v4 0/6] Promotion of Unmapped Page Cache Folios.
Message-ID: <Z_p6RBQN0S_N9oAG@gourry-fedora-PF4VCD3F>
References: <20250411221111.493193-1-gourry@gourry.net>
 <Z_mqfpfs--Ak8giA@casper.infradead.org>
 <Z_mvUzIWvCOLoTmX@gourry-fedora-PF4VCD3F>
 <Z_m1bNEuhcVkwEE2@casper.infradead.org>
 <Z_m3VKO2EPd09j4T@gourry-fedora-PF4VCD3F>
 <87jz7p1ts7.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87jz7p1ts7.fsf@gmail.com>

On Sat, Apr 12, 2025 at 05:22:24PM +0530, Ritesh Harjani wrote:
> Gregory Price <gourry@gourry.net> writes:
> 0: Demotion disabled
> 1: Demotion enabled for both anon and file pages
> Till here the support is already present.
> 
> 2: Demotion enabled only for anon pages
> 3: Demotion enabled only for file pages
> 
> Should this be further classified for dirty v/s clean page cache
> pages too?
> 

There are some limitations around migrating dirty pages IIRC, but right
now the vmscan code indescriminately adds any and all folios to the
demotion list if it gets to that chunk of the code.

> > Assuming we can recognize anon from just struct folio
> 
> I am not 100% sure of this, so others should correct. Should this
> simply be, folio_is_file_lru() to differentiate page cache pages?
> 
> Although this still might give us anon pages which have the
> PG_swapbacked dropped as a result of MADV_FREE. Note sure if that need
> any special care though?
> 

I made the comment without looking but yeah, PageAnon/folio_test_anon
exist, so this exists in some form somewhere.  Basically there's some
space to do something a little less indescriminate here.

~Gregory
