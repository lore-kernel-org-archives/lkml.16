Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F5A7082D
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 18:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743360456; cv=none; b=QQrBhf40z+lDIwZSaP9p8GqYMAWYUwmfovgb1+9h0Y1SDAPVPrsDXmoy/EBBecHF/t7tIUiRxSBC7Z2a8DLtk1ojyIQ0OMT5IX3+PH9/Q4laqdSiiH9dyDPvgU05sRJNB2YN7bWqQoPsdhcCLJZska0iZTRw0W8tggRyjmAu/d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743360456; c=relaxed/simple;
	bh=bsY0B3Y+y/9ZquNjorDM+E39mUGGYy2bCwJV5xa3oSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TOpkfAe3N0OlVSNQt6/r6DttC/+UHmK89cH4nnyfLiMyxpqtTJWolCz60IvXmDQBQNzowyUHX1LTXT08uR6836tYPRBHbjtpUC13rTlynCYAk5kTX89U4m0QUuv5ZJVh7plsyqvVCcSCmXGxIyY+hAByqkUW8rt5zRIx6QsHFzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pw8TQQGk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pw8TQQGk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50FF0C4CEDD;
	Sun, 30 Mar 2025 18:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743360456;
	bh=bsY0B3Y+y/9ZquNjorDM+E39mUGGYy2bCwJV5xa3oSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pw8TQQGkHrRqy7JxeXGykoI9lUVo7u1K7HUpmbS0RvtlmH/Ep+8bv431zXdJp3rmo
	 7xC3m1lfgePQgnNbncxHqRTahjmq8gOKOjnksQGHzPfWimHO/cNcpCA22yVtt1fzrt
	 W2QTHTmkarD498+mCMaPbXOR7Rr6aQgJRQq1N70w0jNuJZeTw76MTjBMUq6gT8etqM
	 ImhnCOUywZpg/oX0Kj62BR3OBNPKbm8eRoJRMN7kdE+gGRhFVp4VcRywug3+IlCfZw
	 x5+rcGJj+IguZCkLhUAfh3t2zJmlsBVPjwjyrWUNJ5GukcwqedIoxvgnadAy7OSH+Y
	 32Ze1xoVs7w+w==
Date: Sun, 30 Mar 2025 20:47:31 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Uros Bizjak <ubizjak@gmail.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH -tip 2/2] x86/hweight: Use POPCNT when available with
 X86_NATIVE_CPU option
Message-ID: <Z-mRwxb3r1yrH332@gmail.com>
References: <20250325164854.199420-1-ubizjak@gmail.com>
 <20250325164854.199420-2-ubizjak@gmail.com>
 <20250325171141.GDZ-LjzaPbAG1MwjZi@fat_crate.local>
 <CAFULd4ZT5mjjEXW3SnGQVMo18fO8CapFS-ikLQvYFw5EKtEfmA@mail.gmail.com>
 <20250330173140.GCZ-l__PVdSx6mj-zL@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250330173140.GCZ-l__PVdSx6mj-zL@fat_crate.local>


* Borislav Petkov <bp@alien8.de> wrote:

> On Sun, Mar 30, 2025 at 05:15:16PM +0200, Uros Bizjak wrote:
> > You missed this part:
> > 
> > --q--
> > ... where there is no need for an entry in the .altinstr_replacement
> 
> Not really - .altinstr* memory gets jettisoned after boot.
> 
> > section, shrinking all text sections by 9476 bytes:
> 
> So if anything, this saves a whopping ~9K disk space and makes 
> hweight* an unreadable mess.

What unreadable mess?

The proposed patch is:

 +#ifdef __POPCNT__
 +     asm_inline (ASM_FORCE_CLR "popcntl %[val], %[cnt]"
 +                 : [cnt] "=&r" (res)
 +                 : [val] ASM_INPUT_RM (w));
 +#else
       asm_inline (ALTERNATIVE(ANNOTATE_IGNORE_ALTERNATIVE
                               "call __sw_hweight32",
                               ASM_CLR "popcntl %[val], %[cnt]",
                               X86_FEATURE_POPCNT)
                        : [cnt] "=a" (res), ASM_CALL_CONSTRAINT
                        : [val] REG_IN (w));
 -
 +#endif

Which is 3 straightforward lines of assembly code and a straightforward #ifdef.

My main objection is different: if __POPCNT__ isn't defined during the 
kernel build of major Linux distros, then this optimization almost 
doesn't exist to our users. And I don't think it's defined.

Thanks,

	Ingo
