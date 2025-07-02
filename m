Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7FF2DE711;
	Wed,  2 Jul 2025 21:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751490179; cv=none; b=u2IpHpexXQB9T5bqOsIn1Ci975ZYHPI8ve0/F+5ZNOiPQAUC49Q8XW3cV93qeTcp4PG1+kEqDx0lEPpl0ZCdiq7mVAbBLIxlqkpJc3IPBhBK9G4kYj9cY1c7Bq+Aye7PnZ8T9NTzhpB1CR09WDpVpew95Qv/0UDIgveFTGRtxWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751490179; c=relaxed/simple;
	bh=7VX+4FXtEgWxCwQZYFAkBrVoY00hVeIiCeXazH1tkiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WzdlK4OYR4PVZxo4tr5/ote/VJEjs6B9h9DxMsGR1m0cVV5oBXdWuJEVQKjy+pCQc6Lv1Ul7Px9sZEaONlNuNgi5+IH/7pzIxO6eTZ7ku3lB8AN15Si6h7OhejJF2cA6cNlwN9fk/elIHdfbdNf8YH+mFAGVDzYzKd5ZCriYjLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TDZOogq3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TDZOogq3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53507C4CEE7;
	Wed,  2 Jul 2025 21:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751490178;
	bh=7VX+4FXtEgWxCwQZYFAkBrVoY00hVeIiCeXazH1tkiM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TDZOogq3sGawwQjdu3BCQrROMBGB/mEWyEMpKiu8E1kCoB0XURRoso6B95kkxsRyd
	 QMvGAQANDedQhoyrqToRyQCRHoh6sNdvHlKf9VbR5bdNxSTkherThEOEL5kP21wjn8
	 dig5lWeLkg8+ZL0wwBqEZk00y0Mkk9lMmvb33YPIad7f1e0gD+93VGR18wUwOhg68N
	 fEshwQTGEEC/9pZu8rnrAHecbrZobfK20CNEGdlgkPEMgVkHBsPNfSQChwqgnrI3t6
	 7YsRDQ/F/G0HQZNRnm8ILwSCKJt5iP0OLT7Zf/JmdgD+BSa0C3VA+wyqVkfR2rFKQ6
	 iwpq9lQxjnSiw==
Date: Wed, 2 Jul 2025 14:02:54 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: kernel test robot <lkp@intel.com>, Nikunj A Dadhania <nikunj@amd.com>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org
Subject: Re: [tip:x86/urgent 1/1] arch/x86/coco/sev/core.c:2170:30: warning:
 variable 'dummy' set but not used
Message-ID: <20250702210254.GA3996668@ax162>
References: <202507010218.3O5Ge0Xt-lkp@intel.com>
 <20250630192726.GBaGLlHl84xIopx4Pt@fat_crate.local>
 <20250701150644.GA3563357@ax162>
 <20250701152953.GCaGP-8bWPmRWI10Ec@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701152953.GCaGP-8bWPmRWI10Ec@fat_crate.local>

On Tue, Jul 01, 2025 at 05:29:53PM +0200, Borislav Petkov wrote:
> On Tue, Jul 01, 2025 at 08:06:44AM -0700, Nathan Chancellor wrote:
> > Citation needed. This reproduces with Clang 15 (earliest supported on
> > x86 now), Clang 19, and GCC 15 for me. Were you missing W=1?
> 
> Nope.
> 
> $ git checkout -b test 4a35d2b5254af89595fd90dae9ee0c8f990a148d
> Switched to a new branch 'test'
> $ make CC=clang-19 HOSTCC=clang-19 W=1 arch/x86/coco/sev/core.o
> ...
>   LINK    /mnt/kernel/kernel/linux/tools/objtool/objtool
>   CC      arch/x86/coco/sev/core.o
> $ clang-19 --version
> Debian clang version 19.1.7 (1+b1)
> Target: x86_64-pc-linux-gnu
> Thread model: posix
> InstalledDir: /usr/lib/llvm-19/bin

Spooky, same SHA, build command, and configuration from this thread with

  Debian clang version 19.1.7 (3+b1)
  Target: x86_64-pc-linux-gnu
  Thread model: posix
  InstalledDir: /usr/lib/llvm-19/bin

from unstable Debian (since it is what I base on for my Debian
development container) shows it for me... Can't imagine the two Debian
patch levels would have caused anything here but it is probably not
worth thinking too much more about since it is already resolved.

Cheers,
Nathan
