Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FF578F37
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 10:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749896843; cv=none; b=EjC7y6R3O4tUXCDnp2pXnwH6C4D4eGSBsVXF0Q9se5MWSl7Q+k4NHROIWczQlaM+kTQG/yMxMdwqfwo6pmWx6VEMl5AMVM1bSrzN7OFLnPsjksJzDwYyuchSZnxfXAc667ULGJJ6on7Lgt9i2CNf45QWYq8tEKQmsUwm5xVeqhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749896843; c=relaxed/simple;
	bh=FtPvNBQlvItApGTNmMWICy9/3GnJwAZIiS3Jnd0CxXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b02bbeRkfim22+sgkRTgu+THq1ybHtj5u4XRAF6y128D+nXgg7kFI8bVZR9uX1E6GhBJEHChf5+OpWD5Afle6X7+Bg+4E4qV0k+5te+QfxdHQoXPNSHw/6C10i/MjWVyKYRlYzbS4bLO3NJfuZ1BexpKNxqyMdfn++8Wl+XBAj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=wY1mC7sj; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="wY1mC7sj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FtPvNBQlvItApGTNmMWICy9/3GnJwAZIiS3Jnd0CxXI=; b=wY1mC7sjED7Wc0m44uwh27sWO4
	J62DmMnmaP+VB5W10wBanZwzcjZqLMaSW/wV7w3+PCUcxfvrloSHrkIEMIVVXAG0zfLTuLjOrCK51
	xgX4zMLFPMADeQmwVN6J0t4iZjBa0Wjh2+SeIr7FM953tTGKwZkIJh7G0W6IJ/2nFPiqJh1TNWmee
	+Sc8zbs3kJX9dLvtYN6mj0Ng9JYpWgOeOPAp3JLNQTbvAaB+fFl+WPs4BPQT+IISsd0FD2aleaJLy
	4LSP0oP69dD4YTYV0sC6cEZlDoJezHAXBya9PFe+WPJmWSJkU9ivESUAUpX4dUm9s/9xAycczuCvI
	KqZfeq3Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQO6X-0000000DvvD-3ks3;
	Sat, 14 Jun 2025 10:27:18 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6D544308640; Sat, 14 Jun 2025 12:27:17 +0200 (CEST)
Date: Sat, 14 Jun 2025 12:27:17 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	u.kleine-koenig@baylibre.com, Nicolas Pitre <npitre@baylibre.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v3 next 00/10] Implement mul_u64_u64_div_u64_roundup()
Message-ID: <20250614102717.GK2278213@noisy.programming.kicks-ass.net>
References: <20250614095346.69130-1-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614095346.69130-1-david.laight.linux@gmail.com>

On Sat, Jun 14, 2025 at 10:53:36AM +0100, David Laight wrote:
> The pwm-stm32.c code wants a 'rounding up' version of mul_u64_u64_div_u64().
> This can be done simply by adding 'divisor - 1' to the 128bit product.
> Implement mul_u64_add_u64_div_u64(a, b, c, d) = (a * b + c)/d based on the
> existing code.
> Define mul_u64_u64_div_u64(a, b, d) as mul_u64_add_u64_div_u64(a, b, 0, d) and
> mul_u64_u64_div_u64_roundup(a, b, d) as mul_u64_add_u64_div_u64(a, b, d-1, d).

Another way to achieve the same would to to expose the remainder of
mul_u64_64_div_u64(), no?
