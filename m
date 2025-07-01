Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B6926D4F2
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 10:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751365151; cv=none; b=VTZgqkA16UAfjgAvX7NZYP3Xr1Ej08HU/ppteW0jelPFv0PPpWpRN0EtJIP1YluB9iIfzUdeuQMgHdCIOgIpxo0pyJLc3P9a70buNy+IUKpc9WUG/ZcC/fDz4J+gxx7VXmYh0wr5CwcBQ2CAZS9fypDYihE0txAgdV6qgFfQY1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751365151; c=relaxed/simple;
	bh=5ePagLuYL2VMDsyEsu/qgLhyb3aM5Fm7sdWD4I5OQt4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=EBaxKK+YLoO6goqE8/ywDsh2Cc3UIc3LiaQ4K6yCyXUEMVyPnaDdxB9JkNIXLQu0ByjbUCMheCmddYlTRcrqrOWpDAdX7PABsfKPPdWLAE2EkcJHaGILut4AWR+FR1RwS2Mozd6Lpu0J3HxbH+mrZhHw4lY8Yftw/4FGvp2f7Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Dgs+Rrop; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Dgs+Rrop"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751365137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UA19yU7D1UtfNEkINMRSif5lUbUOppk7unuGTMpUYp4=;
	b=Dgs+RropsLYy+2N/qGBKOnygdXq+3FU8t47D7NylSvWNUn8Mr/G9rm/FSGhLbhjX0LOUzk
	c3Xcc3jPcigu2FjP3JsbDewKDES7/ZgmBHgdwC7jrFxZ85SY0Hm29BlX4s63FZ7U0Kmt5F
	WDtG7HA+i/AY6qvko48/wOTYvBkvkMw=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH] ALSA: mips/hal2: Refactor and improve hal2_compute_rate()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <87wm8sclf8.wl-tiwai@suse.de>
Date: Tue, 1 Jul 2025 12:18:44 +0200
Cc: Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 =?utf-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <64167092-D0B5-4E78-AC07-62733EEEAD65@linux.dev>
References: <20250630214554.182953-2-thorsten.blum@linux.dev>
 <87wm8sclf8.wl-tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
X-Migadu-Flow: FLOW_OUT

On 1. Jul 2025, at 11:25, Takashi Iwai wrote:
> IMHO, this doesn't look improving the code readability than the
> original code.  And the generated code doesn't seem significantly
> better, either.

I didn't look at the generated code, but I think the patch definitely
improves the function (not necessarily its runtime, but its readability
and maintainability).

I think the patch primarily improves maintainability by eliminating the
magic number '4' that was scattered throughout the function. Now the
scaling factor is assigned once to the semantically more meaningful
variable 'codec->inc' and used consistently.

It also improves consistency by using 'codec->master' when calculating
'codec->mod' instead of repeating the constants '44100' and '48000'.

Additionally, it removes the unnecessary local variable 'mod' and the
'rate' update, making the function more concise (4 vs 12 lines).

Thanks,
Thorsten

