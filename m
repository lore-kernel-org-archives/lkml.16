Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F4C1E8348
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 06:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746598968; cv=none; b=pPRhnmpwHHiaVKOSai7opmsX8krmmjCAyOdZb2dOu0BiexWydDi6EJx59+YUvKPXMY+f3qkzrIYXgZM4ShFZGKZrd6529eMmwH47ZGadOnyV02ymuE28kxZQeztLtCTurplMwW4aUcZipvrBVTTe2aqPh2oDyfaV+CLQu+bl/es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746598968; c=relaxed/simple;
	bh=TK7PwC5Hm/B/85gtiDIvAmTdM3kA4hXR+iWnqJqIdSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T9Q/CQg9Hwut84yoqEn+Bt7Ypdjlx++yNlRJxnvx2HG8VIhCYlU/0WPVzR1IoZ9sOkmyb4hVQlpJIj2BRkSAaX+rtkCFs/0bJtiEDTJUzjhhCaoifMsUh4UoG4asqGq7sOv3q9OSZHt2Uz7QnqBz7qy9k3BPtgNhpbjcn8Qx2aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gFLyl9fF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gFLyl9fF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 547C2C4CEE7;
	Wed,  7 May 2025 06:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746598968;
	bh=TK7PwC5Hm/B/85gtiDIvAmTdM3kA4hXR+iWnqJqIdSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gFLyl9fF6IrNq9IZhC9W/dILKh/hqfpwjZhA8aAQFNBu87yHPmwvIFWvNL0QzMkY8
	 rOhIt2qk8cwq1iV5cKooqQleFPppR0Fq0dGFspTch1IuEpa/0LrWAbi5tv/nrHuioN
	 Qw04t3tNqeeF4gm6EAVlGcZBI2WbJWsP0SWmqKy2ir8Fbcjsc/kUZ336WABJ+nm0On
	 iaxq/Mf4O8YSnJZJIbnrX/dsB6us6LI0pu10uR0cB5fY/BtUeL9IMwUrPt4OAUCkcg
	 gPRJ9QbBpRmiTiTp46OgBTcXCezn0uZmH3kz3aENt0h62XQk464CEh6um2tl/XcQUQ
	 0i6v/jHwst8lw==
Date: Wed, 7 May 2025 08:22:42 +0200
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
Subject: Re: [PATCH 01/15] x86/kconfig/64: Refresh defconfig
Message-ID: <aBr8MgC7l4efb_kw@gmail.com>
References: <20250506170924.3513161-1-mingo@kernel.org>
 <20250506170924.3513161-2-mingo@kernel.org>
 <5700be74-71e3-41bd-97e2-ac0c33b1c83c@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5700be74-71e3-41bd-97e2-ac0c33b1c83c@app.fastmail.com>


* Arnd Bergmann <arnd@arndb.de> wrote:

> On Tue, May 6, 2025, at 19:09, Ingo Molnar wrote:
> > @@ -63,9 +62,7 @@ CONFIG_BINFMT_MISC=y
> >  # CONFIG_COMPAT_BRK is not set
> >  CONFIG_NET=y
> >  CONFIG_PACKET=y
> > -CONFIG_UNIX=y
> >  CONFIG_XFRM_USER=y
> > -CONFIG_INET=y
> >  CONFIG_IP_MULTICAST=y
> >  CONFIG_IP_ADVANCED_ROUTER=y
> >  CONFIG_IP_MULTIPLE_TABLES=y
> 
> Any idea what happened here? I don't see anything selecting UNIX
> and INET, and leaving them at the default-off state seems like a
> bad idea.

I think this is a side effect of having NET_9P support enabled, which 
option comes with:

        imply INET
        imply UNIX

Thanks,

	Ingo
