Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09022C15B0
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 10:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749811728; cv=none; b=Cu8OakgRWyeNB+yfqOo1xKfwntKDelysL4hawWm77GfCRlJAwPPy2xDmcsWTgL+nTYtbfpyokhGGfmuaxh3taWglF/9CEXjNSnURMWxaU7MTK5++K3tInvY/eo/GhLBppwDju9beiBVhvQLxWzCM9QXUIN1j62S2oYd1xnQWu+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749811728; c=relaxed/simple;
	bh=8FoUBY39YWLYR5zMkSvqogVDZoelGOlIN3A2H7Y4LS8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pgHTCR2yefNUoxTQEZdDiikn34gUDfZUlfadQ12OC6+Eom4VkA/sY5kj4AXf273szLlVtqKIY+FjTNwuiqzM2vjkB7IcXejHC7eG4i6HAj9mjLOEKamY9EkTbSY5qREnpnumJ5H6ksv4S+14dRHwx1GVQXy9nsnE7ciX3DlwUes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ugJabBhH; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=21kYq2+B; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ugJabBhH";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="21kYq2+B"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749811725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WQHIscwFPFdzo5VbdA29wmcTnji85y17xI4a/67wplg=;
	b=ugJabBhHkJx4S7eRqku0M6vVNaSQmadWBmK4E6zG7KdS22AAve2spf96BAkybifJg57kCq
	Qxs8KsfNKg7ScCh9h2T85Iw3etjevlCrQFcr6+wIUVIPc0S7fUBBBYoFGeMQlArt0n3Y59
	QW538+ukxLlon3iBWtay6Q1GPiZ3VESJ8geGYVCfboZO7Fif5axd0BoHBLC20paSXDIGnb
	mYbI/IjeUNjlOnCMvU+BbEiGLHAH9eMU8Eoxz8j+Bsv4Th7feJ85lQxqF19VBfekLczrL3
	3ncY3vJsoCnknizlNL+87utywxOezEhxqz+8+5EEWW1XaKd57MtfcXOngW3EeQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749811725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WQHIscwFPFdzo5VbdA29wmcTnji85y17xI4a/67wplg=;
	b=21kYq2+B3lN0T0GM4taq8XefVW1tPHK87juKaFp28l+QnP0MAO9yv3QXgKI6mDcqMzlSj+
	UU/2qV39NOlasJDg==
To: Yury Norov <yury.norov@gmail.com>, I Hsin Cheng <richard120310@gmail.com>
Cc: linux@rasmusvillemoes.dk, jstultz@google.com, sboyd@kernel.org,
 linux-kernel@vger.kernel.org, eleanor15x@gmail.com, visitorckw@gmail.com,
 jserv@ccns.ncku.edu.tw, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] clocksource: Use cpumask_first_but() in
 clocksource_verify_choose_cpus()
In-Reply-To: <aEuw7ls9hieUv_Ox@yury>
References: <20250613033447.3531709-1-richard120310@gmail.com>
 <20250613033447.3531709-3-richard120310@gmail.com> <aEuw7ls9hieUv_Ox@yury>
Date: Fri, 13 Jun 2025 12:48:43 +0200
Message-ID: <87ldpvsyr8.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Yury!

On Fri, Jun 13 2025 at 01:02, Yury Norov wrote:
> This exact change has already been submitted by me and is under review.
>
> https://lore.kernel.org/all/20250604232550.40491-2-yury.norov@gmail.com/
>
> I don't understand why are you undercutting my work, and moreover do it 
> for the second time.
>
> For the first time you submitted something that duplicates my another
> patch from the exact same series. John Stultz has pointed that, so you're
> surely aware.
>
> https://lore.kernel.org/all/CANDhNCoJ_MmpEfyuL+JWav+NUfQDH3dm196JSE-Mv3QrPUzi3g@mail.gmail.com/
>
> Kernel development process implies that one makes sure that his work
> is unique and doesn't break someone else's development, at one's best
> knowledge.
>
> What you're doing not only breaks this rule. You're in fact trying to
> get credit for the work that is done by someone else. This is the
> definition of fraud.
>
> I cannot make sure that any other patches from you are unique and
> written by actually you. Therefore, I will not take your work anymore.
>
> I encourage everyone else to be careful working with I Hsing Cheng
> and check his patches for uniqueness, at minimum.  

There is absolutely no justification for accusing Hsin of fraud or other
nasty intentions.

It's sufficient to point him to your series and tell him that it's
already been dealt with.

I deal with redundant and conflicting patches every other day. That's part
of how open source development works and it's trivial enough to either
pick one of the patches or ask the involved parties to sort the
conflicts out.

Thanks,

        tglx
