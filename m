Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0878F1EBFF7
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 16:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738254529; cv=none; b=QfM8iRWj72foFby07JkIyuqwwfR8L6S12uJ8VOVLJI/0PlTI5bau/3tPXTMkg7jx+oVskyn4ZFqZCmxr72m0uudg0Yv+qbbveHNgLiKfBpAGwNwdM+4v7ZvYl/WYA8KLc+AXl0UcPuXtaOi+CAkd8Rn0UnJH6DFQHt6qd1ikG4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738254529; c=relaxed/simple;
	bh=6sBfrYuIppRAhFV4h3PDHzQmciiFlS2I+HbYt0ia76k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LZ/gmjlxgi8gwyZvE9tkJAj4Y5hoEBlnA+OsVLPif2nFcomtlEqiPRzpOaNSzk/EcbQXaYaX+pZQC2dBfzVBkxTCozmR9P2iPQfyUm7ZPprEWJ+1i14MSFEZzhUnfAIDb9Wks7AIwHHSc8yn2StRhV1VSbXcHO5X6BWEzo4STM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=myNpt/PJ; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="myNpt/PJ"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6d8fd060e27so6631416d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 08:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1738254526; x=1738859326; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5OkXXACOng+utnMeMDItBc+7N83xw5BMkcJgXetJOrs=;
        b=myNpt/PJ9OER8GuTxco/vvEX9uye+Pr4Oa27qd9ekn1vXw9u6PEBVJhte3T6fj6Pdx
         MEeL2moZy22rTSWionR8vij5hkSUSf5PQvkdzNV/xfE8sdd+Q2DphQZWxHaH5+Qrcmd6
         Kj3oItvxR15972sYaPiae7Gr6hM9YjdHy6Z4QwDASmi9gUFLBPg3QJzu+8yJznP+zR6T
         hkNKxmYqYxh3c5TvYDupcpw+FZN4l6XeTHfhAL+Xo2eQrBzlCM7OKVWY5LL8KFXDtidN
         mtL5ICuHp8PzYm0LGbdXcWJz4uDPXOZq6J5LBEqC/NSbnMUgA7mSkeHuAxrVWzaCAt5v
         hpEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738254526; x=1738859326;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OkXXACOng+utnMeMDItBc+7N83xw5BMkcJgXetJOrs=;
        b=MeBITbIT12f0AsynOJaNRzsZg0j0Oc6B8tcOa4ItHZTcsxmUWRtVJoo9JYEjezwek+
         0WUZE6bEIHGTm0+1PJvs2ZeaoijJzO+qoGd08n942YHN+Bq5JUoVA5+G4KIGwEs4J7AJ
         u7KtvsWCpoPlaXmuvmY6pSfSgDDZXGFSr9/5DtxXTh2R1JUR3aXOrUdbMkd8krmW8RzU
         1UjFCtLfOTK6D6QuCJ8WrqrYqw/eBiDiTp7gJFVU7MdmlQn1Cno2+EOq3RHDQIrkXwqh
         X6htvpOvyveUiaFJnnDIcuzYduBnrbz/7Q1tpcnqMRxRBhgQhZ2OhZfROFJ1YnlhzFUL
         686g==
X-Forwarded-Encrypted: i=1; AJvYcCVB98XVVja0G+zywzxQVdUNzng5C7uMdtohj17Hl4OOEee9/z6gXaVZ1ijJBjrr5+K71buXnK4turGpNaA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxpH6Oo7aebOF512t8swUUpE/92sM5s9gNiHZld7DsxTrkGbyE
	C4dYnoHYKbVdi6ZS0onkBwC8Tk9/5M7ZFVnEIBIZs6FJuRj733n/oywBZDH7bHU=
X-Gm-Gg: ASbGnctkomlXafxSYBd9+Zz9QvCiNi+uij6KCWpkAnq3IGjON49kxi9Evjcx+cxN1qC
	xX4VNwEjxZgSGVcu+dn0ICvP73QCPjJqMvOEmuIh2BwzKVk6oNqZLik/Io2SWkk2uIo18irc6lw
	ELijHKJdOBd2tQKdNWgLdrDDXr9mVKskFV2ce/rZQZgBN0dIzwps0P85S6kaFa6QhcV376wY+om
	cWH0vJrnNBBdl7S651ZfKJgpQDQGNJRuHVsC/+iZoXjMBctNUowE/Uv5xXGTfD5MuUffyHspJTF
	Dmot+akg5Tkr0Q==
X-Google-Smtp-Source: AGHT+IHdxC8d8mU2OcTkeT5tBiu59oWvGA29kh8nxXp/9u2SDZ/2GrNB5ZUbcdJsmkBEfXlqL2tQnQ==
X-Received: by 2002:a05:6214:268e:b0:6d8:883b:142a with SMTP id 6a1803df08f44-6e243bef87emr112783916d6.2.1738254525734;
        Thu, 30 Jan 2025 08:28:45 -0800 (PST)
Received: from localhost ([2603:7000:c01:2716:cbb0:8ad0:a429:60f5])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e2547f4dacsm7757586d6.19.2025.01.30.08.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 08:28:44 -0800 (PST)
Date: Thu, 30 Jan 2025 11:28:36 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vitaly Wool <vitaly.wool@konsulko.com>,
	Seth Jennings <sjenning@redhat.com>,
	Dan Streetman <ddstreet@ieee.org>,
	Miaohe Lin <linmiaohe@huawei.com>, Nhat Pham <nphamcs@gmail.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mm: zbud: remove zbud
Message-ID: <20250130162836.GA1283@cmpxchg.org>
References: <20250129180633.3501650-1-yosry.ahmed@linux.dev>
 <20250129180633.3501650-3-yosry.ahmed@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129180633.3501650-3-yosry.ahmed@linux.dev>

On Wed, Jan 29, 2025 at 06:06:32PM +0000, Yosry Ahmed wrote:
> The zbud compressed pages allocator is rarely used, most users use
> zsmalloc. zbud consumes much more memory (only stores 1 or 2 compressed
> pages per physical page). The only advantage of zbud is a marginal
> performance improvement that by no means justify the memory overhead.
> 
> Historically, zsmalloc had significantly worse latency than zbud and
> z3fold but offered better memory savings.  This is no longer the case as
> shown by a simple recent analysis [1].  In a kernel build test on tmpfs
> in a limited cgroup, zbud 2-3% less time than zsmalloc, but at the cost
> of using ~32% more memory (1.5G vs 1.13G). The tradeoff does not make
> sense for zbud in any practical scenario.
> 
> The only alleged advantage of zbud is not having the dependency on
> CONFIG_MMU, but CONFIG_SWAP already depends on CONFIG_MMU anyway, and
> zbud is only used by zswap.
> 
> Remove zbud after z3fold's removal, leaving zsmalloc as the one and only
> zpool allocator. Leave the removal of the zpool API (and its associated
> config options) to a followup cleanup after no more allocators show up.
> 
> Deprecating zbud for a few cycles before removing it was initially
> proposed [2], like z3fold was marked as deprecated for 2 cycles [3].
> However, Johannes rightfully pointed out that the 2 cycles is too short
> for most downstream consumers, and z3fold was deprecated first only as a
> courtesy anyway.
> 
> [1]https://lore.kernel.org/lkml/CAJD7tkbRF6od-2x_L8-A1QL3=2Ww13sCj4S3i4bNndqF+3+_Vg@mail.gmail.com/
> [2]https://lore.kernel.org/lkml/Z5gdnSX5Lv-nfjQL@google.com/
> [3]https://lore.kernel.org/lkml/20240904233343.933462-1-yosryahmed@google.com/
> 
> Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
