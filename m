Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B1327E04D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 09:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750410111; cv=none; b=FjCFLcXzRpA1WLt92JQtwkaR+fefBU/LrW0Z2BSRnn0VmXGcX+pPJ8gDNcPiwDYcKoGLMYK81skMFB2Qf1PIfIUms0jsXon9gQqayCeAi/iTPzpC69GX6Z5cPn8WNPkpvM2L/hDTWXLGultBkd9eDJ2oy2GvQA8rk2MQIkcJEvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750410111; c=relaxed/simple;
	bh=u20LsYVv2bBVewclmCl8t7SLbB0OfMCAGOvLPeYZR3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n00WbHWTSG2WRDxlXCPGwDdspGd5lLIYa8Z5fA9gyfpQVBC9QfXHRkJsY27VJdmVh2mGsxpsKEZA5Ns4BcprShw3kHRVIzJMiKkpqa++J7XTVsemMT9oKUi+0fa/Zwt+JXqO05qfbDpZvxVsIQtPeoMZWu+i3iSWgphkIkjVR2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=b5+IYxp2; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="b5+IYxp2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uc0t/KwBwBUp7lsgLA5du3AoKFB1dg6IBCy1aVt3dzM=; b=b5+IYxp2455cgv8be4OjVh7SlN
	ya8O/sBc8w00lHFoQNCMm57gzJKffIQcjVyWBMFz9KWwvWjZYMeF6073W2g2SQhJUYrkKcwTHlcN0
	JVAhLQ224MIla7i2hKRycdxJghEZ3+ezbIRnM/qTH4d4B6vjO7utnKHa06wXuL3xhZcRc6rgRzSqZ
	UtDwdYzGp4QW2Mwqd35AdkQFpcu6V2ZOUb/pmUotxwi7m6ePzQ9NAJLyYsmwfwTRHQCNYg+0hAxXH
	/I07MfAjWwc/fWyaWad/wa6/9BYr0/QynToY2YsLp6hVgc2QQ244SKPuVxYE2/kz192UJLh/aZsZH
	mrxDkgSQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSXcz-00000004gAz-283L;
	Fri, 20 Jun 2025 09:01:41 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 91CDD308989; Fri, 20 Jun 2025 11:01:40 +0200 (CEST)
Date: Fri, 20 Jun 2025 11:01:40 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Khalid Ali <khaliidcaliy@gmail.com>
Cc: dave.hansen@linux.intel.com, luto@kernel.org, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/mm: Fix log overwrite in CPA check_conflict()
Message-ID: <20250620090140.GR1613376@noisy.programming.kicks-ass.net>
References: <20250619174305.897-1-khaliidcaliy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619174305.897-1-khaliidcaliy@gmail.com>

On Thu, Jun 19, 2025 at 05:42:41PM +0000, Khalid Ali wrote:
> From: Khalid Ali <khaliidcaliy@gmail.com>
> 
> On certain configurations (e.g. custom builds), check_conflict()
> may produce a large number of warnings, flooding the kernel log
> and overwriting earlier messages.
> 
> Observed warning:
> 
>   CPA  protect  Rodata RO: 0xffff888022a75000 - 0xffff888022a75fff
>         PFN 22a75 req 8000000000000023 prevent 0000000000000002

That's not good. Your system is sick, limiting the warns isn't making
that better.


