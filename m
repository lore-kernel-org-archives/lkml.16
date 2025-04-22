Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951BA27CCFA
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 12:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745324739; cv=none; b=T6J49roEdZTOwZW+iMKhyLLyZRsB/fog4BxDkrko+su7oOvu/JwNhSe8LmD7BofqBwKWcW55Cx2ZPzK0z6rSim7YuFfGo4o3ENEDTwL2Wdcw0HDPw3ppw8/e0R71/6Hf4AvoidUOYO6ee6LK/sd+rlgg3UkfpiRpO2vc+gDmIm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745324739; c=relaxed/simple;
	bh=J9XHANGMqOthXkxTgCt1OqkEDHiUiYVX+WKl+1QDb5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uDrFWYJ5heIxi4KH/uX/pQz05lXxYhVs0KtXwVH/5H0yZXDmbwYvrrfIAKNrYhN+4fqWCaA4QJ7Plz6fSQNI0L9lGk/HY6fl/+AGUmGOQHxLYEfOYJb/AHk7neBGCMgbXy3AGYzgE7IibsIyB85I5wk071ilCeH3QTHytQJ9ekc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VZsC0bkz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VZsC0bkz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2DF2C4CEE9;
	Tue, 22 Apr 2025 12:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745324739;
	bh=J9XHANGMqOthXkxTgCt1OqkEDHiUiYVX+WKl+1QDb5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VZsC0bkzKRn7MZWfQcI6IPRFCT+ozTG8HWBR4ZWVZfsItfn7Mw+YqGqE2W3m2DdJr
	 P+t/8aN5xFXs9XLh4qVyxbDSuaqHKRkbOiCWpCrEye92KQQrYxLWw//5Hrlu84ORLH
	 OT7kzEN/TyQsl3JSgLqnil+i2CnzhVL8BeAuPbyspgM+jF1RnGHLzDFauIBMuzV3Lm
	 KN06xoWY8C52DeRTqy1dwFlvo4KioATxTc6B2Udr4AA3RUrtquouVfavs2vL5yNdfR
	 rIvzzxbfmCpuy+IDDrhvgdxs1LUr9OwZn0N5IldcMo8ssV4xCSTlzoWfxjH+gHqrWg
	 4kJbiEYwUgtLA==
Date: Tue, 22 Apr 2025 14:25:34 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 0/2] x86: vdso: Two small ifdef cleanups
Message-ID: <aAeKvpzKsLsKzK8J@gmail.com>
References: <20240910-x86-vdso-ifdef-v1-0-877c9df9b081@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240910-x86-vdso-ifdef-v1-0-877c9df9b081@linutronix.de>


* Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de> wrote:

> Some small non-functional cleanups to make the vdso setup easier to
> read.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
> Thomas Weiﬂschuh (2):
>       x86: vdso: Remove ifdeffery around page setup variants
>       x86: vdso: Remove redundant ifdeffery around in_ia32_syscall()
> 
>  arch/x86/entry/vdso/vma.c   | 35 ++++++++++++-----------------------
>  arch/x86/include/asm/elf.h  |  4 ----
>  arch/x86/include/asm/vdso.h |  8 --------
>  3 files changed, 12 insertions(+), 35 deletions(-)

Looks like these patches fell between the cracks - I'm applying them to 
tip:x86/vdso if nobody objects.

Thanks,

	Ingo
