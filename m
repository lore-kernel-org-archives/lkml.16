Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7C61DED70
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 12:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738933123; cv=none; b=fVeDMxJ59uk0l5eYDauzRW59b4U7GU+e1r38/xqbP3JAZj558QONjWtpBR/cx/B1DeNAs5ZKIgUvG6s1PEntV+ny6MBaligSu72/kYabF5X0F4bbK4YoAA6VvNxWVaUDjIwTLqeDwZw8dXtkpYNmL8TkzJEHO+DuP/auq772YjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738933123; c=relaxed/simple;
	bh=Adsd+Z6BPNObCkOMArrvNysfcLpyeiAnZdkAzJ1/JUU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=n2OqmgFUifaS3DMA5dBsEHJluZMBXMQYFsO7VyN8NR0KeRvR7aMjTYCS3jajON/SlSXmb+DfBaB8QQI2Aet3Iklq5IteZVtGAe+DpP+EClZo3yhAQOtrEHjiWkSAVp0tVopsRdkDZlxgJEVuJCAuUjCd1KNf4oDBvaR9VJZ+6DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=J/8Nfucw; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=e8ncSKLX; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="J/8Nfucw";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="e8ncSKLX"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738933120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3tqBk8CYYCPCQZ12k7pFMTx3F/FhLywTJWN52qWg2vs=;
	b=J/8NfucwX8/PUsjRqSpOY5gHdNo4p90tY3GuHkw88EGXTQBb3VK7MlKaI2Wu5TFmW1sWvq
	7jd0g0nvXZxfxhtnQlqJiAl287BL4D47HU72OAWxdzyFOtgXorUCN4E45ULZZBoPOm8L6c
	S698pz8hhp+HPgrAFiGM98BdFjlYmKWheRlRyJZNSCecGFil2/+SoTa6TcmpwKctRz/xMX
	xhNhAJmVVOeDGcV3lSIULzjGdSJM+rRrOBfhA3v9AJFPkUVXWe4TaTQc0HAl05YFX80qrR
	wXlWftN+tt1yRim4UNGmTesek/sHit+LeHpqyffOySD3PQlFZ8rwMm0qBOK8bg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738933120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3tqBk8CYYCPCQZ12k7pFMTx3F/FhLywTJWN52qWg2vs=;
	b=e8ncSKLXvts++NLAjkwFOO5/PY1nRkeZ/HfuPxEqqqwDgjX1qtqL7ghyr2sXPZEdkorbQC
	/GxjoNvPtGqYKLCA==
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>, Nam Cao
 <namcao@linutronix.de>, Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>, linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Sebastian Reichel
 <sre@kernel.org>, Will Deacon <will@kernel.org>, Jon Mason
 <jdmason@kudzu.us>, Jaehoon Chung <jh80.chung@samsung.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Jassi Brar <jassisinghbrar@gmail.com>, Pavel
 Machek <pavel@ucw.cz>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Rob Clark <robdclark@gmail.com>, Lucas De
 Marchi <lucas.demarchi@intel.com>, Zack Rusin <zack.rusin@broadcom.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, Uwe
 =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Takashi Iwai
 <tiwai@suse.com>,
 alexander.shishkin@linux.intel.com
Subject: Re: [PATCH v2 00/45] Consolidate hrtimer initialization - Part 4
In-Reply-To: <87ikpmypts.fsf@ubik.fi.intel.com>
References: <cover.1738746904.git.namcao@linutronix.de>
 <87ldujz9a7.fsf@ubik.fi.intel.com> <87tt97m3u3.ffs@tglx>
 <87ikpmypts.fsf@ubik.fi.intel.com>
Date: Fri, 07 Feb 2025 13:58:39 +0100
Message-ID: <87bjvdnc74.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Feb 07 2025 at 13:08, Alexander Shishkin wrote:
> Thomas Gleixner <tglx@linutronix.de> writes:
>> That part 1 series has been applied and is in mainline already.
>
> Yes, I was grepping for the function that got removed. Low caffeine
> level in the bloodstream or something.
>
> But now that it's in mainline, I can pick up the patch intended for me
> or just ack it. Any preferences?

Just pick it up through your tree. I'm only going to collect the
leftovers.

Thanks,

        tglx
