Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B483225E447
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 12:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744200018; cv=none; b=c80Ngmr1laz6Nuja4oTRNa50F6nIgd4hGOEdZj+/ODESmEfsM+Kkgzr2hA6NbVR2cI3vJ6Dy14Pvx/OrJJr0DkfPFGFWLZyNp/xvisns5b426B9H7RCDKQjxnaAu7/sx42Os/Eshx1uEbd6WcHHqcomErSk+ESbhRX0cXYH+B4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744200018; c=relaxed/simple;
	bh=2uRFW9QLGemmzhYUeWpyeh4xJ3SB2m7pNnC82mb/aaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQHvCcAUIV7kyFq+4KJiBCNV7o6LuFUt+ysQL4MBrv8NNn642Kk3rcmP6pMhqYZWyMHvvs+7KULAe8qIrmsSYym2Tpekm4i14eVtnKbJE5K1PsI9qJKN+d0NUT12ojF6O/n3M2LxHkAlc5Tx9T5A3AGhF+XkwzT2onw4+NRlpTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EoDfAtC3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EoDfAtC3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5828FC4CEE3;
	Wed,  9 Apr 2025 12:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744200017;
	bh=2uRFW9QLGemmzhYUeWpyeh4xJ3SB2m7pNnC82mb/aaY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EoDfAtC3P5BnRBFqoi71qR78V3zaP8iiPNPG2/mNtUJVxzYvycP6YTAT87mz6q9AZ
	 boIe3IVzcCsf6cO8tll1ANhRZy7aknqwu+M1SFIAcie5faP5m9qxM06fVSkdPskv5M
	 uRL0zkxfyhavhcQCXEbJR8JDZUJc3I/UHwLi7qgtHwgm7edwiVsLAgCol+klbQISWu
	 yBLby+dln0kdsDZIGd70Ru+4Isfno0LkyBILJ37Q1DMGrddV3/mCQXN2QpuOTqkNu4
	 UhXSc+UVLPS23NykNWgPFubzNtk4f+C9wpzd/N8pZIcTXiCsVeykKBg0Kn1JwRP9Pc
	 AwcK1EDkhLj1g==
Date: Wed, 9 Apr 2025 14:00:12 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "Aithal, Srikanth" <sraithal@amd.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, linux-kernel@vger.kernel.org,
	David Woodhouse <dwmw@amazon.co.uk>,
	"H. Peter Anvin" <hpa@zytor.com>, Kees Cook <keescook@chromium.org>,
	x86@kernel.org
Subject: Re: [tip: x86/boot] x86/boot: Move the EFI mixed mode startup code
 back under arch/x86, into startup/
Message-ID: <Z_ZhTJaxcXubOATD@gmail.com>
References: <20250401133416.1436741-11-ardb+git@google.com>
 <174396438105.31282.2243827952440371468.tip-bot2@tip-bot2>
 <6eb78989-efa6-4558-9637-9467560265cd@amd.com>
 <CAMj1kXHTQSfsr8m86zGZCp1cvp9_kOpOe6P1MjjjSh72HZ8PSg@mail.gmail.com>
 <8bc0a2a5-a486-4a4d-83e6-45b6c00685ea@amd.com>
 <34a1c2bd-53f2-4f4f-9f5a-272f677eb9a3@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34a1c2bd-53f2-4f4f-9f5a-272f677eb9a3@amd.com>


* Aithal, Srikanth <sraithal@amd.com> wrote:

> 
> 
> On 4/7/2025 3:11 PM, Aithal, Srikanth wrote:
> > On 4/7/2025 2:00 PM, Ard Biesheuvel wrote:
> > > On Mon, 7 Apr 2025 at 10:38, Aithal, Srikanth <sraithal@amd.com> wrote:
> > > > 
> > > > Hello,
> > > > 
> > > > This commit breaks the build of next-20250407. The kernel config is
> > > > attached here.
> > > > 
> > > > Build error:
> > > > 
> > > > arch/x86/boot/startup/efi-mixed.o: warning: objtool:
> > > > efi32_stub_entry+0x0: unannotated intra-function call
> > > > make[3]: *** [scripts/Makefile.build:335:
> > > > arch/x86/boot/startup/efi-mixed.o] Error 255
> > > > make[3]: *** Deleting file 'arch/x86/boot/startup/efi-mixed.o'
> > > > make[3]: *** Waiting for unfinished jobs....
> > > > make[2]: *** [scripts/Makefile.build:461: arch/x86/boot/startup] Error 2
> > > > make[2]: *** Waiting for unfinished jobs....
> > > > make[1]: *** [/home/VT_BUILD/linux/Makefile:2006: .] Error 2
> > > > make: *** [Makefile:248: __sub-make] Error 2
> > > > 
> > > > 
> > > 
> > > Apologies for the breakage.
> > > 
> > > Does it help to add the following to arch/x86/boot/startup/Makefile:
> > > 
> > > OBJECT_FILES_NON_STANDARD := y
> > > 
> > > ?
> 
> 
> 
> If the above is the solution, could you please let me know how soon it might
> be included in the linux-next build?

Tomorrow's -next should have this all sorted out.

Thanks,

	Ingo
