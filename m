Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0285718E3F
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 15:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744472895; cv=none; b=mflpBn5s3PvkSDU2f1S9Fs9rAAaPa6TxwoWH4CQ0AUMRnVvrJ8pZA5bOJG27nIrD/1bwg4I2iIL+Yh5nyPYCrwSmR30iG53wb+SevjFg88MtwQiQ0UWEy5U4WPnWTbY3YezJYRpgdYxJsB+ieZiwtNCxa9lJAuUIW/IzZjQqMAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744472895; c=relaxed/simple;
	bh=npOifUoSFsZcZbBoUi8xFTy1MgrjKQm9iM4m0A1xJaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHTzsR/cSHgusMRTWabZlM4ZdXsHnFO5abSQo4j4p5mUY2vRebyPK7q60e9s6KQ7itgDBBeontNZ/Pxq8wylP8R329zbVkwOmRi00yMHGMrw9odbVtyIFDSC6zpnkgys0fVOCx0wILxfsm7H/JYV+dSjYlS1pPgt7TEMCxdA5VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=e6ESQZ0A; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="e6ESQZ0A"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0unE7GRZ19cbVRqz2ttCoLdcRw5QhIWcr0VhRWnwLaY=; b=e6ESQZ0ArdMhnRJvh+3TBV+Wsh
	qcseKum9XlYkff8RtIOexL52JVPbwRNryRUhUaPfSdjrNNzsZuHk2haBHRkofHACp12D9EZa7X0Jc
	JboNzTKoeClhTufMtBcot1Vb1IVsNVKbHZUMhee1w97BruFow9fkuUIPL5dtH2/jVXvhCcX8RDwvU
	3OY+H5qq8eMHg2RpYqkTNy9Cch8HV9EmhIlt+kZPa8xGW6wZ6aPvYgsrhUCcBRiMnrXYEVkma7n6w
	5htg2LON9C+o1/z1bR5WxfYsQmZTPQ0DRp6aXn99tJ4TR+Zy9lUUV2Cmg4WGj/BxznxKgpf5FxNTd
	6qERCNYA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3d5U-00000005mEx-1VUn;
	Sat, 12 Apr 2025 15:48:08 +0000
Date: Sat, 12 Apr 2025 16:48:08 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Oscar Salvador <osalvador@suse.de>,
	Ryan Roberts <ryan.roberts@arm.com>, Zi Yan <ziy@nvidia.com>
Subject: Re: [RFC PATCH] mm: don't promote exclusive file folios of dying
 processes
Message-ID: <Z_qLOHxcfVmiXYp4@casper.infradead.org>
References: <20250412085852.48524-1-21cnbao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412085852.48524-1-21cnbao@gmail.com>

On Sat, Apr 12, 2025 at 08:58:52PM +1200, Barry Song wrote:
> +		/*
> +		 * Skip marking exclusive file folios as accessed for processes that are
> +		 * exiting or have been reaped due to OOM. This prevents unnecessary
> +		 * promotion of folios that won't benefit the new process being launched.
> +		 */

Please wrap at 80 columns.

One easy way to achieve this is to pipe it through 'fmt -p \*'
