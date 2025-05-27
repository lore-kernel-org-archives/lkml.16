Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70CC8836
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 02:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748313410; cv=none; b=bqVMP9DeTjBfntqOv6TXwqKd/UjspYl/xc8IQ3AV60cZ4MIT0kOBoWP2mg1Mw/BoY2lomDwKy0Av4o+3a49AI5hrQf+trcuEtt8Cv0Tn3V+BD8nhlDiDjyzG/ASax8VYG56UQztGRA6BPYYykplaCe6eEyCvHPu9Nckww7R5rN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748313410; c=relaxed/simple;
	bh=IxFhFOfVR/d97FymSJiv4isF5ZND2eN40VFm3L41/jA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=gtVxeObTo3m7NMCh76fhqGcpVsiuuIadtyOwkq5L93VISwdmqNcVLnO7TG8fjcJPf1/2T4LzVD7Q9jsPWluuipmRSXtOAyaJQbDiHk5G1OdJYd7pLABG8aUL75Ce3TdX1FrfLZR3MKMjdDf9Ljx6CeIbV6tSgjNXfQ/y1D4v0lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=g3+iax4G; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="g3+iax4G"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748313404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jxLDvATeq4EvUrtiMA5gJipkjRHQ2+Vkf/2GOjiK+w8=;
	b=g3+iax4GFRzXd63kTruSkLYsAvk2juzEF8GUYMFhDdUfNhHnVBgeAdL9qqpBgBnJdMAcKn
	Gy2JJ6G3f5k+DxhqMZUTtY+ACvaxRsSTylkgWOrsN8E/KoArwnJoiQ+tI9I+2loo9EidiG
	NJxjA4425gen6W3nse8X4ltOdYAhxL0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] mm, list_lru: refactor the locking code
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20250526180638.14609-1-ryncsn@gmail.com>
Date: Tue, 27 May 2025 10:36:02 +0800
Cc: linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Chengming Zhou <zhouchengming@bytedance.com>,
 Qi Zheng <zhengqi.arch@bytedance.com>,
 linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>,
 Julia Lawall <julia.lawall@inria.fr>
Content-Transfer-Encoding: 7bit
Message-Id: <13AF220A-3792-491A-B5C2-36044C450402@linux.dev>
References: <20250526180638.14609-1-ryncsn@gmail.com>
To: Kairui Song <kasong@tencent.com>
X-Migadu-Flow: FLOW_OUT



> On May 27, 2025, at 02:06, Kairui Song <ryncsn@gmail.com> wrote:
> 
> From: Kairui Song <kasong@tencent.com>
> 
> Cocci is confused by the try lock then release RCU and return logic
> here. So separate the try lock part out into a standalone helper. The
> code is easier to follow too.
> 
> No feature change, fixes:
> 
> cocci warnings: (new ones prefixed by >>)
>>> mm/list_lru.c:82:3-9: preceding lock on line 77
>>> mm/list_lru.c:82:3-9: preceding lock on line 77
>   mm/list_lru.c:82:3-9: preceding lock on line 75
>   mm/list_lru.c:82:3-9: preceding lock on line 75
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Julia Lawall <julia.lawall@inria.fr>
> Closes: https://lore.kernel.org/r/202505252043.pbT1tBHJ-lkp@intel.com/
> Signed-off-by: Kairui Song <kasong@tencent.com>

Reviewed-by: Muchun Song <muchun.song@linux.dev>

Thanks.

