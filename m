Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1371805B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 00:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751502341; cv=none; b=akAd1EE0uFbQSqE+zTec/GlgU0QcI2Ky1mEz1DRH8XYco/W9DUB8geJR9c/uCqieP0iJlsmXoQkgrBcvEgz/4E8Jw++7uNYeWNBkhIPC+3/z2FcTrOlfToaDUFCj1tsn+PysyP5iIIEJBMTdn9AxzqFhExZfg7BeAD9ebnVuDcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751502341; c=relaxed/simple;
	bh=9y4XABaqBWnahpOhdIBVM5UPjT44k1Ocvy3+2J6Rrls=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Y/GcBhip5gMuB0Bp10xORnYd9PNb2jwjSFcccCO/RdqhWAdMrLMKGJleuLPBhyR9kSzNqWh2ib/bwKYPyDmAYqCErwPwj6pPEHsHUWkkksmG9wtogHyDrdvyJshjJJ/KqtF/G0N8AR+AT/BU7GybZvz7DxfHKbDBwzhrBQIkuE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org; spf=pass smtp.mailfrom=gentwo.org; dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b=O6zEX27Y; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b="O6zEX27Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1751502338;
	bh=9y4XABaqBWnahpOhdIBVM5UPjT44k1Ocvy3+2J6Rrls=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=O6zEX27YfhRXWhNmxLy8yaHxk7R+Bq1Qh3n5O5gtQw/mCg/Jgg6loHxU9Ul+xArc2
	 Qzkz4y7wI3g4ybZRDDpj9TGBzVZMDl/9F7wz4xDoUvuzECRE43qe20wCnXs3m3g4oj
	 4BoDmZUTVRzkQj8eO2nHz+F+w5Xz83lGAzzibAVE=
Received: by gentwo.org (Postfix, from userid 1003)
	id 8A60140284; Wed,  2 Jul 2025 17:25:38 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 8936B40190;
	Wed,  2 Jul 2025 17:25:38 -0700 (PDT)
Date: Wed, 2 Jul 2025 17:25:38 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Thomas Gleixner <tglx@linutronix.de>
cc: Christoph Lameter via B4 Relay <devnull+cl.gentwo.org@kernel.org>, 
    Anna-Maria Behnsen <anna-maria@linutronix.de>, 
    Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org, sh@gentwo.org, 
    Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] Skew tick for systems with a large number of
 processors
In-Reply-To: <87sejew87r.ffs@tglx>
Message-ID: <fb0dba1d-0edf-52a8-b546-750a68e55323@gentwo.org>
References: <87sejew87r.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 3 Jul 2025, Thomas Gleixner wrote:

> The above aside. As you completely failed to provide at least the
> minimal historical background in the change log, let me fill in the
> blanks.
>
> commit 3704540b4829 ("tick management: spread timer interrupt") added the
> skew unconditionally in 2007 to avoid lock contention on xtime lock.

Right but that was only one reason why the timer interrupts where
staggered.

> commit af5ab277ded0 ("clockevents: Remove the per cpu tick skew")
> removed it in 2010 because the xtime lock contention was gone and the
> skew affected the power consumption of slightly loaded _large_ servers.

But then the tick also executes other code that can cause contention. Why
merge such an obvious problematic patch without considering the reasons
for the 2007 patch?

> commit 5307c9556bc1 ("tick: Add tick skew boot option") brought it back
> with a command line option to address contention and jitter issues on
> larger systems.

And then issues resulted because the scaling issues where not
considered when merging the 2010 patch.

> So while you preserved the behaviour of the command line option in the
> most obscure way, you did not even make an attempt to explain why this
> change does not bring back the issues which caused the removal in commit
> af5ab277ded0 or why they are irrelevant today.

As pointed out in the patch description: The synchronized tick (aside from
the jitter) also causes power spikes on large core systems which can cause
system instabilities.

> "Scratches my itch" does not work and you know that. This needs to be
> consolidated both on the implementation side and also on the user
> side.

We can get to that but I at least need some direction on how to approach
this and figure out the concerns that exist. Frankly my initial idea was
just to remove the buggy patches since this caused a regression in
performance and system stability but I guess there were power savings
concerns.

How can we address this issue in a better way then? The kernel should not
come up all wobbly and causing power spikes every tick.

