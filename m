Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC82849C
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751270096; cv=none; b=D/c0B31gp1l4Ybd6SXFAWlugaMr6+WbVwebOXUIixC2DoCfIvB6ujls8NMHRqi40u88jFYElilu7hqJjpkMbIU3hpTEuuhKPV4WdNC069fh3O3lKE6n8V6kx67PKl6e3kldGbVvSOVPKMr3aPUsNDCzn7hFh0vwN4rKdIMDAmZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751270096; c=relaxed/simple;
	bh=VGgquOZqegLVJkgABck09CmGKgEjEiT+mSU1NLWYgi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BS5GKFGXwS9/5BnSjdnW26/61zn6JEX+hLOmNsI6mc30iX6vtWSY+eniua9dSyp5cmcBVSOhrzsh72R1bB4KNlp5aUhUln35KJhlNJxkm/eSle12UGFwR75uMiNRb71Vrwjt2XpWXSjPp5wgQM7/3CoR6aNj3FPxC2oouB6e8c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=mv4r+kdT; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mv4r+kdT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=k4wd26zsMwoAGUvYXBkWmVvkFxqrPlCdo7gexf345Gk=; b=mv4r+kdTSiYO4d9ed64OcRs3v5
	sAZ8UHooLckuVMQzGXaK8xTV7YAmvGUk/xpGr9J3H+zpErZp4vkz6p69HyAp1oGp4Iax7mJv5F1rU
	T2cQg35+ve3qYFFa0+/+LTqMUi24F7LkO3Omr1XKXwRGwjngfNZ8O52+16/zo3WL4MmA9GEKtvfgW
	RSEOzZnHtt0HYDbjZfM6shEgngZrInHHtta8zFbkJ+91G2WMe5+5df1xX9KceGIHtnych2dhbcNbm
	vYCnDFSIBqyg4S+9P/nppY/ffEVhesVVio0Ji/yVzssHgqwBICRefp1EskgMFXp71RAyr6B8XiOSj
	fJ43eWDw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW9Lj-00000006k8v-1aNm;
	Mon, 30 Jun 2025 07:54:47 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E7032300158; Mon, 30 Jun 2025 09:54:46 +0200 (CEST)
Date: Mon, 30 Jun 2025 09:54:46 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Alexander Potapenko <glider@google.com>
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, Aleksandr Nogikh <nogikh@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dmitry Vyukov <dvyukov@google.com>, Ingo Molnar <mingo@redhat.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Marco Elver <elver@google.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2 08/11] kcov: add ioctl(KCOV_UNIQUE_ENABLE)
Message-ID: <20250630075446.GI1613200@noisy.programming.kicks-ass.net>
References: <20250626134158.3385080-1-glider@google.com>
 <20250626134158.3385080-9-glider@google.com>
 <20250627082730.GS1613200@noisy.programming.kicks-ass.net>
 <CAG_fn=Utve6zTW9kxwVbqpbQTRMtJPbvtyV3QkQ3yuinizF44Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG_fn=Utve6zTW9kxwVbqpbQTRMtJPbvtyV3QkQ3yuinizF44Q@mail.gmail.com>

On Fri, Jun 27, 2025 at 03:58:59PM +0200, Alexander Potapenko wrote:

> There are two modes, -fsanitize-coverage=edge and
> -fsanitize-coverage=bb, with edge being the default one.

Thanks for the details!

> > Also, dynamic edges are very hard to allocate guard variables for, while
> > target guards are trivial, even in the face of dynamic edges.
> 
> All edges are known statically, because they are within the same
> function - calls between functions are not considered edges.

Oooh, that simplifies things a bit.

I suppose that even in the case of computed gotos you can create these
intermediate thunks because you have the whole thing at compile time
(not that there are a lot of those in the kernel).
