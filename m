Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502262185BD;
	Wed,  2 Jul 2025 18:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751481486; cv=none; b=BLBETK/5HnNEVgkbpKZYIkdim/74dmKzTgHa6CRS0GZfmXVzyxJVdYVQdKskpPwIdbHrNOK1cxVelrMlPRfp9sMO0UiM4Fyd+MYzA1fc7Skvpo8r9piqF+VwUgDr87DMvFaFUfiEterR6UJp+VHQcWsI/LvmuSNP4FJjjCW93Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751481486; c=relaxed/simple;
	bh=LiKKhjp1gbJ5/W5FzJzAy8WE7+YnbuQY+5LX8+kFXFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=slE52rwZ/XjZ1dsxKkk8ZQxsaEzkflCmHVTb/Q+ptLMj5vf++mI90E2PhmKic1/0nZRHrXArgTbn/Uqb9LmtWe2UD4OabqbMCmmIPjhr7RAPVnXHmCZ8KG9J/qXBd8fHLECaqjXNf0GzrfUSz5QmK41JE+lXuVIzltWMDNzz+5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y7tad9KM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y7tad9KM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 538C4C4CEE7;
	Wed,  2 Jul 2025 18:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751481485;
	bh=LiKKhjp1gbJ5/W5FzJzAy8WE7+YnbuQY+5LX8+kFXFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y7tad9KM4EwmXA89gOC9T54k0KCKAFrBWDkkm4nizUWan9AKLreQATnva6aZximvg
	 H/dzUfc//xxh86X0haFOLNLWmxpyudXv2qJB66raiiedymJn2N9nsm/3YPzizGhe1b
	 PwXemSh/icqkHVx6jHKJ/6gE+80m/XjOy/IBsM7KchenuVGvfZMjqtOuq5hi/TW+Gp
	 81n/vng4CsXLF3n13qxTQztfinzIJvRkALL4EETNGpxmuS92icFMcfkUlZ7TT2KjS3
	 YzNLJI5g2oWWPLU+LxAuMo71309HvxqjXnTOAdNa2F1ghQ67JS9JwLMGlxjpWy9i/k
	 cvB8zCX6W0A0w==
Date: Wed, 2 Jul 2025 11:38:00 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	kernel test robot <lkp@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Linus Walleij <linus.walleij@linaro.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: [tip:master 19/19] include/linux/irq-entry-common.h:201:2:
 error: unexpected token
Message-ID: <20250702183800.GA3958046@ax162>
References: <aGUxH--v32Bv4T81@J2N7QTR9R3.cambridge.arm.com>
 <20250702132415.GFaGUy_6q0dZZI9AX3@fat_crate.local>
 <aGU_IY70Jt4bcbf2@J2N7QTR9R3.cambridge.arm.com>
 <20250702145425.GS1613376@noisy.programming.kicks-ass.net>
 <20250702150739.GT1613376@noisy.programming.kicks-ass.net>
 <20250702154137.71390C24-hca@linux.ibm.com>
 <20250702161012.GQ1613200@noisy.programming.kicks-ass.net>
 <20250702180136.GA3452438@ax162>
 <20250702181236.GGaGV2lAMxdCg_7MoX@fat_crate.local>
 <20250702182922.GHaGV6gl6axPokuBIr@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702182922.GHaGV6gl6axPokuBIr@fat_crate.local>

On Wed, Jul 02, 2025 at 08:29:22PM +0200, Borislav Petkov wrote:
> Should be fixed now... famous last words. :-P

Thanks for sticking with it :) I can confirm that fad009b77942
builds correctly for me.

Cheers,
Nathan
