Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681B826D4CD
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750063194; cv=none; b=WyOjx1TkQpaWy4rRTjBQw2RQdVtF/ijWh4GY8+/MHOfL5FSHRQlEOtNp0YIfGJDa/8dmIZDrnBudIyJcoor1fIaDH1BR6jZSCu3diyuLP5UYZrLUW7IfWO4GPW65lteIqCCvlb/9qZazBKKkKer97O/AdeZbOcU8I7pTnIpfCmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750063194; c=relaxed/simple;
	bh=G8GMrgN/L6bqu38FeaPz7xFvjskZaKiH73A9Hy2jKzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=geylFpAaCVvNBwNqk3H4/EOcqb18/syCRHEVUgBETO9iG/+8tcp0+jN7quZOdKrg62/QnaKjssYKFi3Rln2K5/Xr8fazvhjlwErKpE3cjBvUO9dPyc0FZTOd2mlRw8sEgTezFpkfQNPq4bXjhK+uCIryD3glCL+X0MDTzrkPR2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=TV2UV97F; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TV2UV97F"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8m3bz/dVw+I3h/O1BcNyRvrT2mtJHkvOQEwjYn5lXsg=; b=TV2UV97F3kzzn4nKEW3kccHWzv
	8Jfv+YWAIukcRL9f/X0osBA6YTWTcRJMBgh3NTzJvG+KaFpJ7yV2LH+MY+3QCql95I95Jw1ma7DLU
	48kP5FGZR7GS8so3tPkRYRDvVyMVRNSqLPVje6YXZOjnU3sLPRr8c719Q1Piph0APxVgE75jXCcIo
	xRg3ui6gjoVNxyWhS2+9OzaKpz994Cp5e45i8m9zlsshAhyPgW7w/KoGa7DKVZJPwoxC3hCGuee98
	qxZ/OH818r63n5uxUvKfQ2SXNjc7K9IYJaJ5gCteYqvneA57wFhw5vvkWDwxMyKLGD1OCccFVs7R+
	LSaMpI7w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR5Na-00000003XgV-0snJ;
	Mon, 16 Jun 2025 08:39:46 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5F2C3304A2A; Mon, 16 Jun 2025 10:39:44 +0200 (CEST)
Date: Mon, 16 Jun 2025 10:39:44 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] x86/asm: Use RDPKRU and WRPKRU mnemonics in
 <asm/special_insns.h>
Message-ID: <20250616083944.GC1613376@noisy.programming.kicks-ass.net>
References: <20250616083611.157740-1-ubizjak@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616083611.157740-1-ubizjak@gmail.com>

On Mon, Jun 16, 2025 at 10:35:57AM +0200, Uros Bizjak wrote:
> Current minimum required version of binutils is 2.30,
> which supports RDPKRU and WRPKRU instruction mnemonics.
> 
> Replace the byte-wise specification of RDPKRU and
> WRPKRU with these proper mnemonics.

What about the minimal clang version and their integrated assembler?
