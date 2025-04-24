Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DC5221578
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 08:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484817; cv=none; b=XkhZZY5we/g7IC5HK3l+L7MDQwwkZyLPkTvU/LH085+EWKGpxsGtc5KKguVUFHT9W0GFCP+KR8XMx4MeIWqjRS+N5A9e0KcEOfQdM8NOFZPeLO6uSCXVhqQy5uYqOWwH1dguyfs2+/AKyxPMr4p5u9FeO9jy31mPlAIJSnrvmhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484817; c=relaxed/simple;
	bh=5ojH3ZWahBARhI4J+ZvuO4sM8pcogYb+XvowgVsXEOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EcxSa6WtXFBYteuXiLOHLFVeZXOtrGlW63leGd6a/uVrSjY4nNRiZNH0177vNv2uu4FMaJO7pwg3lla60PClhVqo8RYkUgcCMILNDUE36w05RBojqek6wsoWChP2yXySX8EAhXNDK+L0aRUoFviYQKcez+qam5YFan+V2PRw1L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BxZF+VQY; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BxZF+VQY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ul5XLvzlXvCxHC6yoQSLljuDv7EUnnxCGRVeiwlHACw=; b=BxZF+VQYznBcW8mFC9bP4dciX/
	g/5FcLylxemG4g7+dXGnUqq4yecmhIOOhfl4UnxjP4BDFmwSYw7Y63GHWtB0wREUqgGnCydqB0fqX
	cgEzjY4FTXZbxDq9HgmEmQkcefwM0lFiD74mn9wMKSlHVVJ3cu7epZPDNK7JvLumAIPE8zpLdsvPt
	YcDJHM8uytern9HNyDuXWZ3J2sDlkV5YOfjRhr3rAMwcyM01hqDNVDGtkIr++Zw+Df6RaKsUebmqB
	g9GJesylA10Ju6ykrj6BW683ZNaU4onVnfPwb0AUOhYz0dNV0XILOe7ghDkevurbYJLpFM1gpTsVn
	EXHfwpcg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7sKp-0000000BTo6-43mP;
	Thu, 24 Apr 2025 08:53:32 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6A8EA3003FF; Thu, 24 Apr 2025 10:53:31 +0200 (CEST)
Date: Thu, 24 Apr 2025 10:53:31 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] execmem: enforce allocation size aligment to PAGE_SIZE
Message-ID: <20250424085331.GD19534@noisy.programming.kicks-ass.net>
References: <20250423144808.1619863-1-rppt@kernel.org>
 <20250423143650.6595dcc7178351b62c31782c@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423143650.6595dcc7178351b62c31782c@linux-foundation.org>

On Wed, Apr 23, 2025 at 02:36:50PM -0700, Andrew Morton wrote:
> On Wed, 23 Apr 2025 17:48:07 +0300 Mike Rapoport <rppt@kernel.org> wrote:
> 
> > Before introduction of ROX cache execmem allocation size was always
> > implicitly aligned to PAGE_SIZE inside vmalloc.
> > 
> > However, when allocation happens from the ROX cache, this is not
> > enforced.
> > 
> > Make sure that the allocation size is always consistently aligned to
> > PAGE_SIZE.
> 
> Does this have any known runtime effect?

It should not -- currently all this code is used with PAGE_SIZE
multiples and everything just works. But whilst I was perusing this
code, I noticed that nothing actually enforced this. If someone were to
break this assumption things will go sideways.
