Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B4B18DB37
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747309704; cv=none; b=P4caen7R9f8Jt+2RXj2w4l73ZZ3Ai9yEen7c6grwkOzPITb+FJwp6pgoNbp5wtEKf+rtMP9M740EhH9hBPryB5YR+2/FBqn57RHY/oOvN4Vjbc24z0PUxrDZLQ2V7W17zcSnxlzqBpXZPgnfQxzT2DTFrZzewzgYXzMACvQ9Rjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747309704; c=relaxed/simple;
	bh=Kq9+Buz5fcVW6ofMM3wKqdJLpRwgrA5JhjkA1NJu7QA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZqE7dMUkwDgwTaV6cwde1Q+QeSDHViIaEM98FWroKp/EFE936jrwt26ciEQF6ligz5mokDZe46AjPx6KG51ALws4qIrZXcB82K9JeaJxB4s2TiuenEukcjwbNYMF/4LWUnnsNCd/YKXpRfMBJ4WEz9Vmf0sZKVU+haUyA8GpfHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; arc=none smtp.client-ip=212.27.42.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from localhost (unknown [82.64.135.138])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 037D52003D6;
	Thu, 15 May 2025 13:48:08 +0200 (CEST)
Received: by localhost (Postfix, from userid 1502)
	id 90FFDC4D5; Thu, 15 May 2025 11:48:08 +0000 (GMT)
Date: Thu, 15 May 2025 11:48:08 +0000
From: Etienne Buira <etienne.buira@free.fr>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Etienne Buira <etienne.buira@free.fr>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware/raspberrypi: raise timeout to 3s
Message-ID: <aCXUeOmy28tqg6Oy@Z926fQmE5jqhFMgp6>
Mail-Followup-To: Stefan Wahren <wahrenst@gmx.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Etienne Buira <etienne.buira@free.fr>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <aCIiEp3CXD2o9dTw@Z926fQmE5jqhFMgp6>
 <048fd6c5-9f09-4c06-9a23-e5821dc291d5@gmx.net>
 <aCWMrJcldfrsNTQq@Z926fQmE5jqhFMgp6>
 <ffeb860f-5522-4130-ae47-45a6068b17ea@gmx.net>
 <aCW3d7tc27Awj62K@Z926fQmE5jqhFMgp6>
 <cecda824-4f47-4e4c-bee9-1a59cd5d801c@gmx.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cecda824-4f47-4e4c-bee9-1a59cd5d801c@gmx.net>

On Thu, May 15, 2025 at 12:31:38PM +0200, Stefan Wahren wrote:
> Am 15.05.25 um 11:44 schrieb Etienne Buira:
> > Hi Stefan, and thank you for your interest.
> >
> > On Thu, May 15, 2025 at 09:42:43AM +0200, Stefan Wahren wrote:
> >> Hi Etienne,
> >>
> >> Am 15.05.25 um 08:41 schrieb Etienne Buira:
> >>> On Wed, May 14, 2025 at 06:20:32PM +0200, Stefan Wahren wrote:
> >>>> Hi Etienne,
> >>>>
> >>>> Am 12.05.25 um 18:30 schrieb Etienne Buira:
> >>> ../..
> >>>> Out of curiosity and because i never saw this issue, could you please
> >>>> provide more details?
> >>>> There is nothing connected to HDMI 0 & 1 ?
> >>>> Which firmware version are you running?
> >> Please provide the dmesg output, so we can extract the firmware version.
> > Firmware version is 2025-02-17T20:03:07, i also attach the full gzipped
> > dmesg, as long as a patch of extra traces used.
> > I did not specifically test other firmware versions for the timeout
> > issue (but i did for video output).
> Thanks, i'll try to reproduce.
> 
> Sorry, i forgot but is this reproducible with a recent stable 6.12.x kernel?

Just reproduced with pristine 6.12.28.

