Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6663E1A28D
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 02:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738375206; cv=none; b=bBZ+UxDZsQetYscGBAMhyMLypcCIfcL1sJwSIRGFG/yenGkwhhb+4q0FOfjO20678jqjwGaUC6IkTvpetzxI5Ce7jTU3LeFnymdf/2qsGl9jr8RHYRrhfrk/v6Du8hXHA+Q3bsefweEIGkQjCnzKQPShc24oOVcVWknkr4U9gtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738375206; c=relaxed/simple;
	bh=8+Yvu1B31Io7bxwbYSLyo4BE+K1XATyXjhCXbIokbfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VCcEntCkV+yDrATCWkBA8KUd+BcVg3HHK4hNYEV7pawxMAQqfnWBqRaegEoN/We3b1aLkuNQLmfe7WBsmKtXmWfJLrcVergbWx3kLHn4kcvgu0DRQU07jQnQ/m59y8hJoTkz1LNRjim4pM25CrU4WobhHEqlkMVeKY3Wmwgrc0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p0qpKd/g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p0qpKd/g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5CB2C4CED1;
	Sat,  1 Feb 2025 02:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738375205;
	bh=8+Yvu1B31Io7bxwbYSLyo4BE+K1XATyXjhCXbIokbfU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p0qpKd/ggNIzFPyMp+Jh3tXcsvoN2bsrJd6GxeYsFs7mggC8kj3bxFlDb75IfCVBa
	 turmrAwp+ufe4V4E5142iXLiOtL7AiW42n+5dMfPMKqJTXsO34JK+Du+4TEsCB9SJg
	 ahATOUL6Yq99GXtlNC4b1LJ6onk0hKclSzle5DF58NuVyzjfJvYV83wC5oO/1sB1PO
	 Albc0EDVuMQrcXaXCL3F42wNJyoDlkGvWppP6IE1/h/GdSY/BOrSzkurFOv6DmMPLc
	 lnQrxqZxiUqWoUGfkvl93PYFWxK5OPCp3HNHtQCFwEw2JXkJIaLbPIaMWBQzdR34aZ
	 VR8Gy7ZeLWE1A==
Date: Fri, 31 Jan 2025 18:00:03 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] RISC-V Patches for the 6.14 Merge Window, Part 1
Message-ID: <20250201020003.GA77370@sol.localdomain>
References: <mhng-5051a418-807c-4539-91b2-255492eae79f@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mhng-5051a418-807c-4539-91b2-255492eae79f@palmer-ri-x1c9>

On Fri, Jan 31, 2025 at 12:08:40PM -0800, Palmer Dabbelt wrote:
> The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:
> 
>   Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.14-mw1
> 
> for you to fetch changes up to 101971298be2aa4706c8602bd81066a0f6f2ced5:
> 
>   riscv: add a warning when physical memory address overflows (2025-01-29 18:36:09 -0800)
> 
> ----------------------------------------------------------------
> RISC-V Patches for the 6.14 Merge Window, Part 1
> 
> * The PH1520 pinctrl and dwmac drivers are enabeled in defconfig.
> * A redundant AQRL barrier has been removed from the futex cmpxchg
>   implementation.
> * Support for the T-Head vector extensions, which includes exposing
>   these extensions to userspace on systems that implement them.
> * Some more page table information is now printed on die() and systems
>   that cause PA overflows.

FYI this pull request added a 90KB ELF binary at
scripts/selinux/genheaders/genheaders in the following commit:

    commit 101971298be2aa4706c8602bd81066a0f6f2ced5 (riscv/for-next)
    Author: Yunhui Cui <cuiyunhui@bytedance.com>
    Date:   Wed Aug 14 14:26:25 2024 +0800

        riscv: add a warning when physical memory address overflows

Presumably a mistake, or else something a lot more interesting.

- Eric
