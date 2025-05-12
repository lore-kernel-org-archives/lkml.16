Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EE71A317E;
	Mon, 12 May 2025 11:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747048733; cv=none; b=nxn0k/tWfVf76upyC9FiFLoUhz++rQNs/lbJJTvicCqg3JITfCbGvLfWF1IYvSWPRg7pAQ8dimCqa1Kr5j9Qrl7txdb8PD7vunwgbTZMLmE1wGtNwTgPCAhkB5KqnNpmJF6DZNuRboBjZUH9NasqfiMZuQUfhlT/s6MbP3uo9ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747048733; c=relaxed/simple;
	bh=ChtQ/9s+duTX3tq4uH4bQvjGWJQpVh6ASx1lije9Olc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=trd6WN5EYwLqbwmbjA27g6FZ2BX1h6FNLqNcO5lvGj9RoFzKMTOTww2gfrVGfr3L7/wfe436vLr8AK/LR34U06oiikX3Esm3mxS0fXRtLjWK0BT08/hq4L42M9egPHVBeGHPsc/xn8Euv2QMygxOwhIX1f0/P289/Ll/qozh76w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=XykPirUq; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="XykPirUq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=1QHb+jW4QgFhaEaixB4uVZPrgggCZCnmHUsuraUoIWE=; b=XykPirUq2Yiys8M/
	ZBtsIQ0UJbRq0dwsIgWS0EsfqsmqJQdeOWunCFUzPH0FPxXo+ZC8qPlfPwmUZKhQ3r0D0xIaXhzXv
	vtY0B5auPhyBczRjVPF8yGlxT8TnoYdpq6lpN+ovVRfc2lVexRi6q4K1ymxVzlmJ14ftjnw0H3XT9
	nrP07oU2rc2sCUhpLqyd9fgmXnoShEUx3mDT9cpTsinXqibOxLETNj9J8ayTYDh6YsC96HKXqD9J4
	DYKmhzOz1aZyLRrqexk8wUHISQzIP6VJBIwbHWNx+SG9zqnA8JwtpSyQrN6dfOEzQxq6KclJ+8F8S
	iC8CgX7v0NZHHcoRdg==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1uERBD-0030yS-2r;
	Mon, 12 May 2025 11:18:43 +0000
Date: Mon, 12 May 2025 11:18:43 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: perex@perex.cz, tiwai@suse.com, krzysztof.h1@wp.pl,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: msnd: Remove midi code
Message-ID: <aCHZE7G2kTeGrDlN@gallifrey>
References: <20250511172957.1001583-1-linux@treblig.org>
 <87ldr2uush.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <87ldr2uush.wl-tiwai@suse.de>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-34-amd64 (x86_64)
X-Uptime: 11:18:29 up 14 days, 19:32,  1 user,  load average: 0.00, 0.00, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Takashi Iwai (tiwai@suse.de) wrote:
> On Sun, 11 May 2025 19:29:57 +0200,
> linux@treblig.org wrote:
> > 
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > Nothing calls snd_msndmidi_new()
> >   thus nothing sets chip->msndmidi_mpu
> >     The call to snd_msndmidi_input_read is gated on that being set,
> >     so snd_msndmidi_input_read() won't be called either.
> > 
> > This is probably a missing call to snd_msndmidi_new(), but since
> > this is ancient code, it's probably best to remove it (especially
> > since I don't have the hardware to test it).
> > 
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> 
> Applied now.  Thanks.

Thanks!

Dave

> 
> Takashi
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
