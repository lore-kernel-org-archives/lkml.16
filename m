Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55A2204C32
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743519277; cv=none; b=nb2O4mYX1BN4FWh6wYhzva1793NNU89bsu9Vsdr4jDW5TdJXMcKIwlm1rxlj2TTrpsM8kc0/fHOhdI5vBJ6mbiugcAuAXTPTaShIYYx9dlV5Suc2n2xOUOjS0SWRiMmYUEsfJCqmQHP6DmHfIYP1OLrHTxl5Wfz5TUjfE/HgCxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743519277; c=relaxed/simple;
	bh=zGZlSi2BqCt+R6dm06k21LSPRbY+w39lVZKBDxia/Dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q1gbd0XtTdqOhBTr+F+yGbJtM6a1kLjuMVVthGAgPi35Z/j2xWKHzGws6NQe/566LYSa4aQyDwKIQqnBBmS3qiVvrvjFvnuOW0KCRJ9aod6mudyH1Xf7OXk26hj869GlPrITwOk2ItPxFPJXVnDq6aelvMJ09hN9C4XJOkFrFUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=cl4He09o; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cl4He09o"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=L389wZVP3qEmEkevkXkBSCJqphdCyIAjO23zO1P0Ib4=; b=cl4He09oJMjrESK6u7iUOBfefp
	iUJ4qD6M4XfdU1pFsxXyNm5SjzPwyzsQ3f4o68hfoxQKgj61kEqzh7w1RJLtilMHnOhxlabYaglJu
	SkNeXwJ0jDtsEBbTp2WzlaQQwyKr7ttAMb0cXPI/d2k/PsHFmazOCC+vm6IQYK7xdLxS9dM+GA+Ni
	NqwJV2O2DG474/zPsrE74+uUo+9zwlVg8cgE7G0Ady2VPPpyxHOeabXHej4LN+BiMNZeosDPrvWq6
	4Aua0k9nF1UV5+h5KZBLvpmW7NB1Fa7DGSWc48/pNdefuWfe2PZC1HWZcRRgtvOiLu8z9YCiHKV0x
	A/oPo+7g==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzd0U-00000006piQ-0opT;
	Tue, 01 Apr 2025 14:54:26 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id BC7C330049D; Tue,  1 Apr 2025 16:54:25 +0200 (CEST)
Date: Tue, 1 Apr 2025 16:54:25 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sohil Mehta <sohil.mehta@intel.com>
Cc: x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Kai Huang <kai.huang@intel.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Mike Rapoport <rppt@kernel.org>, Petr Mladek <pmladek@suse.com>,
	Jani Nikula <jani.nikula@intel.com>,
	Tony Luck <tony.luck@intel.com>, Xin Li <xin@zytor.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/9] x86: Cleanup NMI handling
Message-ID: <20250401145425.GK5880@noisy.programming.kicks-ass.net>
References: <20250327234629.3953536-1-sohil.mehta@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327234629.3953536-1-sohil.mehta@intel.com>

On Thu, Mar 27, 2025 at 11:46:20PM +0000, Sohil Mehta wrote:

> Sohil Mehta (9):
>   x86/nmi: Simplify unknown NMI panic handling
>   x86/nmi: Consolidate NMI panic variables
>   x86/nmi: Use a macro to initialize NMI descriptors
>   x86/nmi: Remove export of local_touch_nmi()
>   x86/nmi: Fix comment in unknown NMI handling
>   x86/nmi: Improve and relocate NMI handler comments
>   x86/nmi: Improve NMI header documentation
>   x86/nmi: Clean up NMI selftest
>   x86/nmi: Improve NMI duration console print
> 
>  arch/x86/include/asm/nmi.h      | 49 +++++++++++++++++--
>  arch/x86/include/asm/x86_init.h |  1 +
>  arch/x86/kernel/dumpstack.c     |  2 -
>  arch/x86/kernel/nmi.c           | 87 ++++++++++++++++-----------------
>  arch/x86/kernel/nmi_selftest.c  | 52 ++++++--------------
>  arch/x86/kernel/setup.c         | 37 ++++++--------
>  include/linux/panic.h           |  2 -
>  7 files changed, 122 insertions(+), 108 deletions(-)

These seem sane,

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
