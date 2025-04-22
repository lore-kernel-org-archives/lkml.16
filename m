Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C63422B5B8
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 06:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745304246; cv=none; b=A77YRSpFJBOj0PdRUzoViLWnJxNlynfB1sOddEnWpRbN3drVs3O+AnEAFbFDAWySW0Lu5z/uiQGF9isHMGfr47mgL55uDEG3myBu5dvfi39aB/jy1ffUUknpwAUzoOkRKSaupJMPa0Ne7STZGQJMeVy2HKtG/LhYkJKOtAGcznM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745304246; c=relaxed/simple;
	bh=35gc6Immqq0MX1Xg7bIpvgHSlP2TVRMDUhK/ipSq3Ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BEF1bsiaVi4/9MtcQacnoTqXOJSwg3gUUAJpGu4IXsOnZVMGFV1yc5CMQzDI6DUmx1IlbxJRc2RFONNeHU5p5fbGLIvclpRJ4nMo4PTgeMOgFOkDPgjQ+WWYlmq9ipjB3SYn2GoYtJcA4dCbGxjqoFb2D7aMIl3VIwNCHwgD3CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qm51iqSm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qm51iqSm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E0AC4CEE9;
	Tue, 22 Apr 2025 06:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745304245;
	bh=35gc6Immqq0MX1Xg7bIpvgHSlP2TVRMDUhK/ipSq3Ak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qm51iqSmxA1RaxH1oXBSAEvF6Ou8B3PJeylxnlcZQlOnrhtTw3kS1HjJmtCBnNZkL
	 /SAUvz5t+1QElKR8z+bEZ2xxzwM7QNSOyAN3MbYJk18mtXBCDMoSjGjmp85MRtOGtp
	 BHKeTUbfVuL4l04D7NZt2Cnylv6WH4R08lEcVHlDz3GfcgvbfmKExMOXcaPV/yC5Dn
	 5amJTdykrSFHDVgHtA+ZcD5s/MH4IZ5rJFgAxn9LbY0DOU3jkPJApeYH919p9jvDBV
	 Nuv1YgHWtw2gxtrdP8Nn3kU0vHEO5QgLYDRrHW9K0635RSjn8voqfItzQmYHDtLLH1
	 LOBBV09R0Mk3w==
Date: Tue, 22 Apr 2025 09:43:57 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH 08/29] x86/boot/e820: Print E820_TYPE_RAM entries as ...
 RAM entries
Message-ID: <aAc6rS_eiFr5WCAw@kernel.org>
References: <20250421185210.3372306-1-mingo@kernel.org>
 <20250421185210.3372306-9-mingo@kernel.org>
 <aAc3wxUI2Jvqj2xx@surfacebook.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAc3wxUI2Jvqj2xx@surfacebook.localdomain>

On Tue, Apr 22, 2025 at 09:31:31AM +0300, Andy Shevchenko wrote:
> Mon, Apr 21, 2025 at 08:51:48PM +0200, Ingo Molnar kirjoitti:
> > So it is a bit weird that the actual RAM entries of the E820 table
> > are not actually called RAM, but 'usable':
> > 
> > 	BIOS-e820: [mem 0x0000000000100000-0x000000007ffdbfff]    1.9 GB usable
> > 
> > 'usable' is pretty passive-aggressive in that context and ambiguous,
> > most E820 entries denote 'usable' address ranges - reserved ranges
> > may be used by devices, or the platform.
> > 
> > Clarify and disambiguate this by making the boot log entry
> > explicitly say 'kernel usable RAM':
> > 
> > 	BIOS-e820: [mem 0x0000000000100000-0x000000007ffdbfff]    1.9 GB kernel usable RAM
> 
> Can't user space use that RAM?
> 
> Shouldn't we rather refer to "OS usable RAM"?

Or "System RAM", just like in /proc/iomem
  
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

-- 
Sincerely yours,
Mike.
