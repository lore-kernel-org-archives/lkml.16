Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9947A372
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 15:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743262393; cv=none; b=PbltvzNxzVG2MdxV6PmshHGT2zcHjc2k/uuWE7Efg+cSGz6hkfwDrDUTYyj5WESavm/hMH4EEDMtoMFfjNaKYoFwP6BMKyuegJfC80t2VgCFiu43hhi8E9w8gad7Z+TK8Pk7GrIjRoctZLYP2oXLesuH0ysljyY/g5PrZfFrEK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743262393; c=relaxed/simple;
	bh=8U0F5pmk7inEAA6WlcczSHmBu0SB2vDd56zbfXOcO5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MSgnGfe8YZc+xvPVKc0fVOlC3hiItdXhk0vlBLwJHni9KdRwcymgbcch6MqoYVgYj7Tp/3DtjUAmU/Q4rn/mnP2BQxY/osuA1nsvV3LKV1IS1p+nGzdA5QWn7euh5bXr5jOXj7cpln2WwhytnW0i3Rq75SlrmWjvEhDVJG9F5Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=BSU8ukP0; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="BSU8ukP0"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 42C8240E0215;
	Sat, 29 Mar 2025 15:33:02 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Vpsrkw_Mwa-l; Sat, 29 Mar 2025 15:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1743262376; bh=UaIEwOYMlAptnBnbqdiRGMOpO2EjIlkx41dbvF6N3ik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BSU8ukP0JGNDYiKJ6g+ZP8YYIL4a+4uyJR5ATgFxdMNh9I7ctxyuaR0QkheuQugtz
	 Tq6Fmi+VK3PLVNCqWqx6KoGD7li220RA6xlEqgOoxG+vmcVw4+NY5YYimDgNvJbtDk
	 OdpMLRUXP1zyZPJLhZDIrgCKtoQnMgEX+rMrsyp7tLhXMjy9ZiIikHKtsJmivTqgpK
	 pnbg6RpFgrbPYdhpyzytoimE0KK6ZD1ey0mnEGDRqVB7l85eYtxULplauRrIKxheYA
	 aQioS4CJywZLdvklt3oX8DUFAjEtYYUUbgF5XGF/zuG6FSJFDTRG+LHDGy/fZ0BgwL
	 E3YT5oHjDt/EObIyiRCtEGntPwKw7ZvSqz9EqwKKwh0pP3hBqiJ2Tdy+HcusyGg5mI
	 c3ZMPh4PNXG967tif783g6p8zpnubJf3yHn4X5e8ZUMh6Fud/uGce3qnIE27N6yfD3
	 ye/0L7lQf7q9iLYTFK81CDh8HXRd2KyVqVixLoLz1ALKrXeB6CfsZgkSqWnmo7KpVH
	 4kUlbkiCOEDdN0544ZU4jQ33ABhNqEI3IUCPiHy99AZGJrxDWw+SPENSSOycx+sFBG
	 Kt0bu0gQgfkVuYGc2EeIyW9ThY8PP0bq4/lMV8pKt/19KgECQho9/KXAmfF39NlFVb
	 eNWFxOy8fxktDDlfczNu1gUc=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id A7FD440E015D;
	Sat, 29 Mar 2025 15:32:49 +0000 (UTC)
Date: Sat, 29 Mar 2025 16:32:42 +0100
From: Borislav Petkov <bp@alien8.de>
To: Ingo Molnar <mingo@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	Peter Zijlstra <a.p.zijlstra@chello.nl>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [GIT PULL] objtool fixes and updates
Message-ID: <20250329153242.GAZ-gSmu8qiXufR04k@fat_crate.local>
References: <Z-cSQXJKMyBSfAAc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z-cSQXJKMyBSfAAc@gmail.com>

On Fri, Mar 28, 2025 at 10:18:57PM +0100, Ingo Molnar wrote:
> Linus,
> 
> Please pull the latest objtool/urgent Git tree from:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git objtool-urgent-2025-03-28
> 
>    # HEAD: ae958b12940bcd4ffa32c44684e4f2878bc5e140 objtool, drm/vmwgfx: Don't ignore vmw_send_msg() for ORC
> 
> [ Merge note: not all driver fixes below have maintainer acks. ]

Btw, test bot complains:

https://lore.kernel.org/r/202503292202.Sge7ZEUc-lkp@intel.com

Date: Sat, 29 Mar 2025 22:29:12 +0800
From: kernel test robot <lkp@intel.com>
To: x86-ml <x86@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [tip:objtool/urgent] BUILD REGRESSION ae958b12940bcd4ffa32c44684e4f2878bc5e140

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
