Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1DB27FD6E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 11:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744715102; cv=none; b=KVfWBd+bmRgaAgO0vebLS7OQ4TASycZKcBKjr9MYpoSxD3ptgDwgJVPQ2+H3IAV/kz6NTXiRarh7ZrktPibuBGJxUbUTpg3n8NYj4BSigcawzCHgtCPiSKTGGp4Lt4rFqBaC8YwR/HaYl1iNJxlz0+bY0/th4j4D2K0nqcZeNN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744715102; c=relaxed/simple;
	bh=ScA2iqdZJ5MNIvl5JujIkunmA4FaA07hCPKiOnMjN7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XYfxluimMcQTKzsCVA6ppxB0JHfta8kjegF1PV4XsjfHfTI/4Qwj9gi2QK5zo0KxhLil5pB+ytCk7Uw0sQMmsyPnj0ooxDg+vUZc4MNk2yw7s16skHq0kmHkHo1B5KRr0q1Z+x3xytansi7TrOUML1GHzyJjzzfqjWA8WKOcwVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4H6gQm+F; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=S6nH4cBG; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4H6gQm+F";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="S6nH4cBG"
Date: Tue, 15 Apr 2025 13:04:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744715099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E3/1V/6uthutUjpNUH1wPnXSydVnRp7Q0Qreb4iaGeM=;
	b=4H6gQm+Fm7zL60Sx3yrmwnhshFTWykqjHZKNrcjNtMwDNP9Q7uQH/AYIhtMW2J7oAnS1Fl
	b3ij91ESkEKxxXfXXyP6C4wqdj8mrPEk4XIiY9aSobFB3vgwRsKpc6Uv7ZviGxw9LEuQqy
	m3qBGvAF7R3FVKfGaKIufVJpulxpFr++avhDgrXe9MO8GzFKv333j8PRgDUwd+n6UzCbHV
	kikbhwyCnLtcu9Jm/WgWn6L2I0L1LDpjwii2cJwELLfd9lvW/dd1wtnvskwykSOHexaCtM
	tEWomNL7TPAQTR2c0xYs2dUttqOEeJZk9jZUa6bgKoBSanPVqESfNlDjheLJBA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744715099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E3/1V/6uthutUjpNUH1wPnXSydVnRp7Q0Qreb4iaGeM=;
	b=S6nH4cBG/2iNPgn7o6isYMqgJju1il4L8ckPrwNmIpFAh8XMMql2rM2cnIIt3v0UDFh7uX
	nulJKrEexYWXIQAw==
From: Nam Cao <namcao@linutronix.de>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Tomas Glozar <tglozar@redhat.com>, Juri Lelli <jlelli@redhat.com>
Subject: Re: [RFC PATCH 6/9] sched: Treat try_to_block_task with pending
 signal as wakeup
Message-ID: <20250415110455.0Qj-4EN2@linutronix.de>
References: <20250404084512.98552-11-gmonaco@redhat.com>
 <20250404084512.98552-17-gmonaco@redhat.com>
 <20250413150540.3ZW7XJVs@linutronix.de>
 <fb998d03b4ecc51834bf4383a71932ca877900cd.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb998d03b4ecc51834bf4383a71932ca877900cd.camel@redhat.com>

On Mon, Apr 14, 2025 at 12:31:12PM +0200, Gabriele Monaco wrote:
> Mmh, that's a good point.
> The thing is: this happens when the signal is generated while we are
> scheduling (on different CPUs), so we take a short-cut and put the task
> to running directly.
> This thing is already racy, so we may or may not see the waking/wakeup.
> 
> Now probably waking shouldn't be there for the reason you said, but I'm
> not sure a wakeup not following a waking would be correct either.
> I might be missing something here, though.

I'm not familiar with signal and sched, so I don't have anything more to
add, sorry.

I presume this is to make the srs monitor works? Perhaps it is possible to
modify the model so that this patch is not required? Let me stare at srs,
maybe I will have something..

Nam
