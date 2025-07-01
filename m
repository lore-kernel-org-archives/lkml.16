Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08464277030;
	Tue,  1 Jul 2025 15:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751382409; cv=none; b=Vtk8zt1m3abRs/Al6lnl+VipxFYTBneOOBGyMLvwTMvzvJMXgC8SH7C26pqgbp5glWATZqAeIkg/nplglDyD0xNLHsGNymkmfeaQMedVHZoiGHOvPx0OC/5gyUkCZPU8wK6qHnutMLGfc5kbULeqxNaiL+v9cfujMBaFiljVAoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751382409; c=relaxed/simple;
	bh=DQDOlEuIR6zGFT2URjegkLFCDiWJM1n4WPy9y29Megs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UxU8ATaImIzRmqbIW84zQ/2945a1V+J+nzfFAG2WvWobYu5iN8kTKhkuuBuxJdaOqafEVI5Jmv7xYHr6rPgNosVRR2XLdW5GI/TDEMre3KxHb5oEyOyBR7O7nas1pKEHwp6Pon2pzfpiW8iJXJ7biy9Oa1rHOqklCJ3c8BKuhu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lSHIhOjD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lSHIhOjD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B789C4CEEB;
	Tue,  1 Jul 2025 15:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751382408;
	bh=DQDOlEuIR6zGFT2URjegkLFCDiWJM1n4WPy9y29Megs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lSHIhOjDSRYOPRud6qkrPGPPyuMlnnnM7FVPioxA5KSzFt7/x6aggszFr67iyYaOm
	 2jpkFwO/eIykk31VGMM6w2ylkaKs0Bhq8QSiBxHBkVxWOYNjTcWFt2rIc8evWbOPFO
	 lD++suLlh7ALL3+USN3GYhTp3g1yLc6xTChA7DfgYSZBdKB/mu2LBEKAMfb5HzQz65
	 rFbc6A1WPsHQx2nTs1ouBV1w8y5RS0BUAUgJ6RGYaonxmy8THr4jb3XJw6AD3l/NKn
	 IStMKCIild0YMJldJW8VkAIBHR5srdlUuj2FpKn5jn2bdGSm2SLoSh5bWE7DxukQbb
	 OzwCjhmD2qeSA==
Date: Tue, 1 Jul 2025 08:06:44 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: kernel test robot <lkp@intel.com>, Nikunj A Dadhania <nikunj@amd.com>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org
Subject: Re: [tip:x86/urgent 1/1] arch/x86/coco/sev/core.c:2170:30: warning:
 variable 'dummy' set but not used
Message-ID: <20250701150644.GA3563357@ax162>
References: <202507010218.3O5Ge0Xt-lkp@intel.com>
 <20250630192726.GBaGLlHl84xIopx4Pt@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630192726.GBaGLlHl84xIopx4Pt@fat_crate.local>

On Mon, Jun 30, 2025 at 09:27:26PM +0200, Borislav Petkov wrote:
> On Tue, Jul 01, 2025 at 02:43:31AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
> > head:   4a35d2b5254af89595fd90dae9ee0c8f990a148d
> > commit: 4a35d2b5254af89595fd90dae9ee0c8f990a148d [1/1] x86/sev: Use TSC_FACTOR for Secure TSC frequency calculation
> > config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250701/202507010218.3O5Ge0Xt-lkp@intel.com/config)
> > compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)
> 
> Pff, doesn't fire with clang-19.
> 
> That damn compiler.
> 
> gcc used to complain about those but they fixed their interprocedural analysis
> or whatnot.
> 
> clang is simply complaining more.

Citation needed. This reproduces with Clang 15 (earliest supported on
x86 now), Clang 19, and GCC 15 for me. Were you missing W=1?

  $ x86_64-linux-gcc --version | head -1
  x86_64-linux-gcc (GCC) 15.1.0

  $ curl -LSso .config https://download.01.org/0day-ci/archive/20250701/202507010218.3O5Ge0Xt-lkp@intel.com/config

  $ make -skj"$(nproc)" ARCH=x86_64 CROSS_COMPILE=x86_64-linux- W=1 olddefconfig arch/x86/coco/sev/core.o
  arch/x86/coco/sev/core.c: In function 'snp_secure_tsc_init':
  arch/x86/coco/sev/core.c:2170:37: warning: variable 'dummy' set but not used [-Wunused-but-set-variable]
   2170 |         unsigned long tsc_freq_mhz, dummy;
        |                                     ^~~~~

Cheers,
Nathan
