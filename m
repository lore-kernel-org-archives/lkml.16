Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CE438FB0
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 23:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743376461; cv=none; b=qlvu/rKDVJ85wbcstyqIZDtotaawN9iKifYFUgek6D++jA8G72UKb5jpZmEB7pCFKBjJ6rl6rlFmwoIj7UMCUeurb70qB5cg2L+I4Gbovg/GRPvwMYVAfeRZ+Ha/i6BraDyrzXvFyi2eURSqZF4fnQCEnn6DIw0uMqZ4lqPfJ+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743376461; c=relaxed/simple;
	bh=NkOMhcXrC/jW6pY8KEWT/YdXdb3huaro4QfHKbDGLzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rsTbArjKFH6Xu6iTweMptGIDofWeR0PETpRrZLRJv449Uh1/qT6X4ahoUo40dOAiQYuxB6aMlHSvsbeb3A3yvizTn5RWBtdpX+QocUKwxCSzbC8sYEDR7pOA40Hw21AD37gudfZD6CDDE4I6GrjCCoXcI/mBgjx/V7Sr4j1/NUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=JXXNYMxC; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="JXXNYMxC"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 1029840E021E;
	Sun, 30 Mar 2025 23:14:15 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id SYiqqmB0qdI9; Sun, 30 Mar 2025 23:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1743376449; bh=Kkprs2kGxIWD4glBMbh075fjoPI323XMOBqGSvlx76I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JXXNYMxCy49jRQ7luW87ivpqddodq3Cj5PZFOWN4PG58hFLiaD2SjxsG7q3A+XS1O
	 13V79RqAfxm6nPVQZIZ0Sj+ikXYn+I4AU0pUbJnt3XacgtrEwPsrA4mvJDAW7SYwXk
	 ZFjznBSbPF4QuQRA2CLNY6yzuhHc6e9aMTONmtVkUTqoFIhU+YdGW715rvQArAPM75
	 YtVPAh8ikRv9/pBCGuGn5+rD9o2sBbQCJQ60rysfq5KSj7C3zIjL0O97MyGc3wl08d
	 1WmQ8/A/OL7yCV+M8STPw7lJpiL/rUQIXMGmMP5OzwwOcgqYcESBljqjYL/vuKfsrC
	 Bpx2Z31EVRU6E8QZJMN5N46Hx/NjE1yxB40abe0n6rMNmnsvKiA1u1/MQ5ixmPCw1d
	 m+LzZ5RrzZJEAYKIL5A736Q5WWHKc1XU9Mh49LclTjVHa9nGNCKSzORpH6csYrMWX/
	 G2pblmMSUYbA3fMmM5lXcGFBHRontPfCvtcG1znvG+3ulo2hCH/LM1hsvTN3fLTChj
	 tCWXnpNYs6HenRTGUn+VAzo1p8qhKBPTD8fVphDyjV8NxGbNW8IGIxNKej1zAG5yYH
	 s8qE+HIBOJ9l2TtZSQX2HE+hcGTlIxjAP+9potQDF0JrgXYHpDsny+cCGHOBslfCT+
	 bKpr7IYxwrzPNLKr2H7M9bsU=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A62B940E0215;
	Sun, 30 Mar 2025 23:14:02 +0000 (UTC)
Date: Mon, 31 Mar 2025 01:13:55 +0200
From: Borislav Petkov <bp@alien8.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org,
	Peter Zijlstra <a.p.zijlstra@chello.nl>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [GIT PULL] objtool fixes and updates
Message-ID: <20250330231355.GFZ-nQM6NPcC7nWl__@fat_crate.local>
References: <Z-cSQXJKMyBSfAAc@gmail.com>
 <20250329153242.GAZ-gSmu8qiXufR04k@fat_crate.local>
 <CAHk-=wjqLm+eTuyLR_84vWOZK+AkhV==r=PcuAt3+3nf68SjOw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wjqLm+eTuyLR_84vWOZK+AkhV==r=PcuAt3+3nf68SjOw@mail.gmail.com>

On Sun, Mar 30, 2025 at 03:19:40PM -0700, Linus Torvalds wrote:
> On Sat, 29 Mar 2025 at 08:33, Borislav Petkov <bp@alien8.de> wrote:
> >
> > Btw, test bot complains:
> >
> > https://lore.kernel.org/r/202503292202.Sge7ZEUc-lkp@intel.com
> 
> That's not a very helpful error message

I found this:

https://lore.kernel.org/r/202503280703.OARM8SrY-lkp@intel.com

which looks like the original report.

Looks unsolved yet...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
