Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C7B2AE84
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 18:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749924472; cv=none; b=reBu0fuMysYpsxkcXdGAyOF1i1WkC2c/hbz0TO861qJSWiZUPCN7dwcHEgPr4uWxuIj56CL9e/jiJ0D2LKH0Qkt/Xp1S0jVJgzklmUNzV6mfR22c893KhRiC7+2KVfN+SKZf+zcGG2LBAfi8DkylXA5BU9K0Ts4umG9XMHdKuH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749924472; c=relaxed/simple;
	bh=4SL5yngTiq2JOffVG78b7UMa10jtZ2nmLMXfBc1TnD4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=F9UJEfxoDgZgEd8r8qniBEqp4qTssAAilL0yt5cfB143o4dbxqfa8C5r5mF8q+sJiyuXG5ExmrWoHfDYnltK8cxxfBiMkN7YIm1KPdi3FAy0TbaNHB5Pp9eH5BWxkFpsFGU1THslK8q4n09m9ZBaz6SURMFX57nRoA0XeoU+0Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lCtsRgBE; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/L3dAMvu; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lCtsRgBE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/L3dAMvu"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749924462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PoEWSPEJColYYpUTWwh6q4aeFjYSSu1x97Dp1YIxOfY=;
	b=lCtsRgBEIdXC/f+eJDNs/TJKUUbNx/Ot/dOaPFD1sXTM00xnFCdgAqeU9x9vRKN6jGH4Qu
	uz1yKLJV60r0+1oNgt7B71kDSZV2p+l5w0mUI5bLrFsMBJqiC9aQHfLkyf28eJ3IUf/Hz6
	fZ/jNkS+XVL08shRTOzWK1uQ9PisdjUni3Cf8go1tSgirZ0lyp7XyTD6JbdUCD+KZ0tNgB
	IyYChctGQAY2DAW6ERxVla1RAt9fa6yGxE+UwieoRVX/K+BQxjse6Xs2H6wFMpQ5H5XDpA
	7v6GT5aZar+KiLYinSnWKEFdVDp5KeRUOfkpsXV63czzhJz+MIZxh7vZblVWbQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749924462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PoEWSPEJColYYpUTWwh6q4aeFjYSSu1x97Dp1YIxOfY=;
	b=/L3dAMvuMxlV1dYqUH+gmfJ3MlUpT48Mv6kyr4YcxhfGRGFhmqykcdzdKaPojh7bQ36snA
	cNpk5XWu8oDx7kBw==
To: Yury Norov <yury.norov@gmail.com>, linux-kernel@vger.kernel.org, John
 Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>
Cc: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>
Subject: Re: [PATCH RESEND 0/2] clocksource: Use better cpumask API where
 appropriate
In-Reply-To: <20250614155031.340988-1-yury.norov@gmail.com>
References: <20250614155031.340988-1-yury.norov@gmail.com>
Date: Sat, 14 Jun 2025 20:07:41 +0200
Message-ID: <87y0tunqmq.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Jun 14 2025 at 11:50, Yury Norov wrote:
> From: Yury Norov [NVIDIA] <yury.norov@gmail.com>
>
> The dedicated API works better and improves on readability
>
> Resend: drop 'fix opencoded...' wording (Tomas)

This is not a resend as you changed the change log, so it's V3.

Resend is only for unmodified versions where you got no feedback and did
not change anything.

And in the RESEND case you have to keep the version number so stuff can
be identified as resend of a particular version.

People have scripts which depend on submitters following the
rules. Chasing stuff by hand is just waste of time.

Thanks,

        tglx



