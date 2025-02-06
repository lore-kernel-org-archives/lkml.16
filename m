Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEA11624F0
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 14:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738851817; cv=none; b=OlkVe9RhT7A9fnWHdiwosibSH3D3hcF5SrWH5jR4lpd3yFDAnOscZuoT+4P9GSjwlpst1znB/49EHyeQewr2NibPPTcCFK9I5SqlVv9Htm3v7kItLFNzXgKs5tSW3/K7IWjQFdZv0uzfv9/K0QTh5ZM6EAZ55DEWxJPivQRfR3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738851817; c=relaxed/simple;
	bh=vUvOXnud/9ZjNeBwkbZ3OCAJc6KYq9+6A5h/intuZtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N9PolXjopchhEULw2DNm+5r1m+k1BjPtCu9xFQ8sD0JL/atFlbPEAjCc17nHhbBb12o7obuvs8hWB133LSPC6HOTHBHeOTSGuRYaOon6GUjbuo5WCy92rT/YGj7FVOdcYkEGIS8jM46vYIOMeaLyZbwcZfNsdXK7x9AqGTYMLJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ESG6W7Ut; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ESG6W7Ut"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7PnrjZRFTqLvEtvRHv+8ucyPFuvDArddQ1Wq7UL4EbY=; b=ESG6W7Ut9sm6CGovvRv9w/3m1w
	gVTcdbwKYaDx8C6BihkI7ezfS0ws10WXXJ+hyWxOaX77rcfnLGRrO97H8MRdp5ay/4Az/KM6vz8ln
	uackznOcjH/M37ZSy1r+OpoRD8HMWK5eivGXKv3zUN6CTBaYyGO5BxuxAGbT/g4jx4LB7LOIQmB0j
	lZcHHGDxqeFgCkjNL42iZxsrATTMdwRw6WQosVHFvyo5vkq3BOAR4rR+CkKZeWhnT0NsLjUDPwFSo
	GP++6L9QjfIYhEqYkoi4cxUe29r8Nj/Fh/rtXKCGlhQlhyNN6ansmKExkpNAoMqelKkk67ndpjg0p
	TP1Jm3Qg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2ma-0000000Gy2X-3or3;
	Thu, 06 Feb 2025 14:23:09 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1394C300318; Thu,  6 Feb 2025 15:23:08 +0100 (CET)
Date: Thu, 6 Feb 2025 15:23:08 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Rik van Riel <riel@surriel.com>
Cc: Oleksandr Natalenko <oleksandr@natalenko.name>, x86@kernel.org,
	linux-kernel@vger.kernel.org, bp@alien8.de,
	dave.hansen@linux.intel.com, zhengqi.arch@bytedance.com,
	nadav.amit@gmail.com, thomas.lendacky@amd.com, kernel-team@meta.com,
	linux-mm@kvack.org, akpm@linux-foundation.org, jannh@google.com,
	mhklinux@outlook.com, andrew.cooper3@citrix.com
Subject: Re: [PATCH v9 00/12] AMD broadcast TLB invalidation
Message-ID: <20250206142308.GR7145@noisy.programming.kicks-ass.net>
References: <20250206044346.3810242-1-riel@surriel.com>
 <12602226.O9o76ZdvQC@natalenko.name>
 <8111558b52cec1152746b05a9c1d657d18df0fe2.camel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8111558b52cec1152746b05a9c1d657d18df0fe2.camel@surriel.com>

On Thu, Feb 06, 2025 at 09:16:35AM -0500, Rik van Riel wrote:

> This can result in flush_tlb_mm_range being called
> with a stride_shift for 2MB pages, but a range ending
> on a 4kB aligned (not 2MB aligned) boundary.
> 
> Peter, how should we solve this one?

I don't think that's wrong per-se, since all we really need is for end
to be past the end, one byte, one page, or one stride don't matter much.

Anyway, I'm in desperate need of a break, so I'm not quite sure what the
best way forward is.
