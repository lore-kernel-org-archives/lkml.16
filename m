Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F314B1E76
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 09:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746608527; cv=none; b=PqbQza3GIqjgDlbEJzY7VDCnW8P2HfDew33WJ04ivCPkqwV+lyAw0//iJU+n2y35WKzmcBZUauuIcO3JWjeJn2++b1ogWE5XF8gRfTWBQouuc9uvv/Ed3MfrjX00t5WmWIuBSHE4Xp1wU83/eThE8+wugQSnd3EycrwgN6+Pqhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746608527; c=relaxed/simple;
	bh=r+f7l9AOVpFnNxiZ3RtwA6x9mAcElUZiYH3C28v/dV0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QisJ/HEmPz0PPtCiA3VCFfMgkEOrlHL8vQb5rKraXq02jE+N3VuSC+s+sLhyVrkq2t8PeD2gA+lZ2sdKK+rDWjCZoZ0Yevh4SK70Y2F3Jw8qBfwkSFx2JIcImBH+WWW5HVRNPTzK7Wxu/yX1CtZ67wuQ0YCvWMHsjkltfWKYs3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QG0UU2oI; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QG0UU2oI"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54c090fc7adso8299824e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 02:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746608523; x=1747213323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/pJLnKxnzZNrTJcPzdko5t8TpadJCFLPrzFSRyRa37s=;
        b=QG0UU2oIHiuVhG+gHvwfuI2YNpGiLWtS77h0+LOmAAcTAf67pQqZQTCRrqp8sAgiaU
         KkO5/+rG5zg2MdqzDyWtQJK3gtk1AI7Kd5tiRchesPbk4HB81OyluoUt/eGly4c9/INt
         iyAjY3vGMEYnnZB2pvp9DpATyrNqgUTnxJRMHOWOF/TBeGWdxWIbiAtf0mFCEw6mRY3z
         +z8LhB5clkucKJun0aKw66ulPj4Oc2DTQd24u0o7ftvxWKx9oRzDloVsV3lgfuaJ9iQA
         l7mb2OFPy6oVyGnOCATE204ZHTsGv8mywkTFyXkFxt8VVR5wDsvfi7sOyXRLejGQB1e2
         KkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746608523; x=1747213323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/pJLnKxnzZNrTJcPzdko5t8TpadJCFLPrzFSRyRa37s=;
        b=kf411paToSDkYXTxV10L0iVym36OpSXHrZ0mPY6lkHwA2NFuGKb3TeaQTOOEMVpHtm
         YhNaOQqZPoa7s8bp1RVkG2CJkV73n2n7CLj6ygmvRNdrgh7YizAyntyQPmxc+4bOy+GS
         i6lcrwsYi2c7Ot1/3u1KJdYC72unt3x/2oKgb9l6AdeN88eE/KQFGNqiFN5PSvQ8vMT6
         0q0TB9yPIQIct/JBsZWfXPC4ACMQlPsW8Ad/tBizxZaxO+XcZ6zCpgGHPDm9jGAasBnK
         CViB2mjRoGS/QDTQi5Q3mzh9HAADx7rj8blxZzP3l07mFhv3pRTJfpMobuWmPncmOGlv
         uQwg==
X-Forwarded-Encrypted: i=1; AJvYcCV1ZgtsLDg6xZYQ7P521D8pYNccexDZfIz6o+mpVG/V5WA1PhB3WVcSN+FTF17CJGCLD7oMcchqeO2cKeM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Iy658DW+g58lnozD7ytyz6xdNv14ncG1PTo9nylsRSHQnmY0
	cMALPZSRm/RSWpcGTt3jOF+ONWOtdlZaU17C0bYS+/AXGoyD6dzYLe+gwcPT
X-Gm-Gg: ASbGncuei+sYwXK7WHsZ1CosnkYUhGG16XAPMu/cfMYA4PdO6sN1CURHUcIRPWhsDMU
	/UyM9YXrLDpsXPNPKXsXqq1S+TArbLGyTT61XLg+wqj9xnuY7ovTSAg1D/ev1+sBIuBfIFH7Pw6
	ovlc8+Epz6y22yOuhq6Gl5vzg76o40s3LVQkMakeNnj+CaldLWSQ68p/A+hu9P04v8D5XI7F//P
	V6Yb0tUY7JC/sONq+8qp4X1xMReG6gwxNegvF7suV8mqDFRdKcWp5ws/BATAlx+x8dkMTEU1rhH
	GwHJCe+2RICa/2ipHWAOovrxJXayuyTtIKLu8owhvHJZAi31cPJx4az70xiLcuDTDaaR
X-Google-Smtp-Source: AGHT+IHsOT5PcS4vLE1ER8el6kMOyNR7jmmlu10cgMWxyMzm1ieTgQmrC36xnqt0rgQimtJZp1Pgpw==
X-Received: by 2002:a05:6512:23a3:b0:549:b0f3:439b with SMTP id 2adb3069b0e04-54fb9291aadmr1136222e87.16.1746608522963;
        Wed, 07 May 2025 02:02:02 -0700 (PDT)
Received: from pc636 (host-95-203-26-253.mobileonline.telia.com. [95.203.26.253])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee0c1sm2264023e87.154.2025.05.07.02.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 02:02:02 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 7 May 2025 11:02:00 +0200
To: David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add mm GUP section
Message-ID: <aBshiBX_N6hhExmS@pc636>
References: <20250506173601.97562-1-lorenzo.stoakes@oracle.com>
 <20250506162113.f8fa0c00e76722a1789ec56a@linux-foundation.org>
 <c4258dfd-14ee-411a-9fa7-c4a1fa4fad1c@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4258dfd-14ee-411a-9fa7-c4a1fa4fad1c@redhat.com>

On Wed, May 07, 2025 at 10:05:58AM +0200, David Hildenbrand wrote:
> On 07.05.25 01:21, Andrew Morton wrote:
> > On Tue,  6 May 2025 18:36:01 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
> > 
> > > As part of the ongoing efforts to sub-divide memory management
> > > maintainership and reviewership, establish a section for GUP (Get User
> > > Pages) support and add appropriate maintainers and reviewers.
> > > 
> > 
> > Thanks, I was wondering about that.
> 
> Thanks Lorenzo for driving this!
> 
> Acked-by: David Hildenbrand <david@redhat.com>
> 
> > 
> > (looks at vmscan.c)
> 
> Current maintainers (mm/unstable) on 20 biggest files in mm, Andrew is
> implicit:
> 
>  $ find mm -name "*.c" -type f | xargs wc -l | sort -n -r | head -20
>  198195 total
>    7937 mm/hugetlb.c		# Muchun
>    7881 mm/slub.c		# Christoph/David/Vlastimil
>    7745 mm/vmscan.c		#
>    7424 mm/page_alloc.c		#
>    7166 mm/memory.c		# David
>    5962 mm/shmem.c		# Hugh
>    5553 mm/memcontrol.c		# Johannes/Roman/Shakeel
>    5245 mm/vmalloc.c		#
>    4703 mm/huge_memory.c	# David
>    4538 mm/filemap.c		# Willy
>    3964 mm/swapfile.c		#
>    3871 mm/ksm.c		#
>    3720 mm/gup.c		# David
>    3675 mm/mempolicy.c		#
>    3371 mm/percpu.c		# Dennis/Tejun/Christoph
>    3370 mm/compaction.c		#
>    3197 mm/page-writeback.c	# Willy
>    3097 mm/vma.c		# Liam/Lorenzo
>    2988 mm/rmap.c		# David/Lorenzo
> 
> I've been messing with KSM for a long time, so I could easily jump in as
> maintainer for that. Probably we want page migration (incl. mempolicy?) as a
> separate entry. I've been messing with that as well (and will be messing
> more), so I could jump in for that as well.
> 
> For page allocator stuff (incl. compaction) we at least have plenty of
> reviewers now. For vmalloc we at least have Uladzislau as single reviewer.
> 
> vmscan.c and vmalloc.c really need some love.
> 
As for "vmalloc.c" i can jump in as an extra maintainer aside with
Andrew if no objections.

--
Uladzislau Rezki
