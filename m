Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B5372617
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 13:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747314982; cv=none; b=tPobQ+1AFbD4gH/yh73+unFyYS87pQtNsq9ptCLeAesawx8tt6nQ9o8GmBlkMKqo8J49idvPv7v3EAqIAey2WVLfaDyAOkb4v9hN5hdem/YES5vdk96ng9lQqiaILv1lq+xmimY+hfLjE32rgFGrgc6O4lTirxd8P8MjoeITLLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747314982; c=relaxed/simple;
	bh=pcg7aWx21FQxxU7XScMbUw1DC84e6I94kk7C7NITPB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tl17Mouhue4989hQEZ/L3inxk8NQTBolyhTWOfBGjEXjjDXMmqwTCqeIduRyhhs+GCs1J9KWyngS0S+l1UDb1It9TTNp3QfoTikR52LFufL+FLqVAB7TbCF1EZFOSEvqurTv2WtMLCA1X95rbJZR8M7ZrLLqHHxDeGEqK8OcDIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=So7VsZR4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="So7VsZR4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88785C4CEE7;
	Thu, 15 May 2025 13:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747314979;
	bh=pcg7aWx21FQxxU7XScMbUw1DC84e6I94kk7C7NITPB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=So7VsZR41VLN54nBmGdS+3XoUvmynVUbWQFwLBI+97YFXzbIYWUQrUOk8fHFwJJIF
	 V+r6lk2/FBUw71nCzzLhyqT7K013RBdYAHkFkj/r5lFMZUY+LmsTg1RKEdL0I48AQi
	 AyP6uI9Rt41BGAR40Drubhr3W1p1yAlUHKlU1xQRDgTbev0icKzCpm/8So4HeTZIHu
	 rxJmpH/+kgEmd+Bh50z4ICXDo7O5KoNw8dKLRrsZWOaItgxZMOOEPgY3WEaIcTPro9
	 n+ThiIoec27ei0KYDM8E4xH0HAvdosMCkRhuiXBFH8tcje5DG7dJCJI4Nj8wyuv9jt
	 2umc2hxWtC07g==
Date: Thu, 15 May 2025 15:16:13 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Michal Marek <michal.lkml@markovi.net>
Subject: Re: [PATCH 03/15] x86/kconfig: Rename x86_64_defconfig to
 defconfig.x86_64 and i386_defconfig to defconfig.i386
Message-ID: <aCXpHZ6_ezk4sxto@gmail.com>
References: <20250506170924.3513161-1-mingo@kernel.org>
 <20250506170924.3513161-4-mingo@kernel.org>
 <0591fcab-fb19-451f-a27b-1b449b2af4b9@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0591fcab-fb19-451f-a27b-1b449b2af4b9@app.fastmail.com>


* Arnd Bergmann <arnd@arndb.de> wrote:

> On Tue, May 6, 2025, at 19:09, Ingo Molnar wrote:
> > Editing the defconfigs with shell filename completion is unnecessarily
> > hard due to bad naming: if one remembers 'arch/x86/config/defconfig',
> > it won't lead to the right files, because the defconfigs are
> > prefixed with $(ARCH)_.
> >
> > Under the principle of 'higher order names should go first', prefix
> > them with 'defconfig' and postfix them with .$(ARCH), and thus make
> > all x86 configs match the arch/x86/config/defconfig.* pattern.
> 
> I think this patch should be dropped completely, it as it causes
> multiple problems:
> 
> - it breaks existing scripts that use 'make x86_64_defconfig'
> - it breaks 'make help' automatically printing the names
>   of the defconfigs
> - it's inconsistent with the other architectures

Oh well, I've removed patches #3 and #4.

Thanks,

	Ingo
