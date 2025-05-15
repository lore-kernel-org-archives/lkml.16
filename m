Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293C2E55B
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 22:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747348070; cv=none; b=lqRm5fcFireFuOKAjIISP8sa4GjTI5WYUO6V/VsWk69fcSsmhITS3cGaS3D/qS5gGbsGZZgQb/rmVj91PD3pj1TqGg9/xvJnVSWfOwUfweN7DttcJI+ePni+cYqtM3c/nLMFatwDMdk0BNkgrNg/G9ZruGF3Zuf2V3c+iNq9X7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747348070; c=relaxed/simple;
	bh=G9qaaLMfP3sN2KVrqa40koJH9mTLRUvKCYRBbj//N3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IMyzk+HtKuBhk4nsSqztRUBhyh2IQbIqe5nmTeCHlyNWaCgMKw9uPgf+Nb6xZFXdCT43D43VjuRjRnfciX5qjjif81OKWHkkCTUtjVzNaf5LuOZ7JcFHfwE1s3qQu0p3LDeNc+DuSODSfgi12dT82SMhMw8vofvd0vpFRODsnq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; arc=none smtp.client-ip=212.27.42.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from localhost (unknown [82.64.135.138])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 755552003A4;
	Fri, 16 May 2025 00:27:36 +0200 (CEST)
Received: by localhost (Postfix, from userid 1502)
	id C884CC4D6; Thu, 15 May 2025 22:27:35 +0000 (GMT)
Date: Thu, 15 May 2025 22:27:35 +0000
From: Etienne Buira <etienne.buira@free.fr>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Etienne Buira <etienne.buira@free.fr>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH] firmware/raspberrypi: raise timeout to 3s
Message-ID: <aCZqVzM5h9lwbfpQ@Z926fQmE5jqhFMgp6>
Mail-Followup-To: Stefan Wahren <wahrenst@gmx.net>,
	Etienne Buira <etienne.buira@free.fr>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org
References: <aCIiEp3CXD2o9dTw@Z926fQmE5jqhFMgp6>
 <048fd6c5-9f09-4c06-9a23-e5821dc291d5@gmx.net>
 <aCWMrJcldfrsNTQq@Z926fQmE5jqhFMgp6>
 <ffeb860f-5522-4130-ae47-45a6068b17ea@gmx.net>
 <aCW3d7tc27Awj62K@Z926fQmE5jqhFMgp6>
 <cecda824-4f47-4e4c-bee9-1a59cd5d801c@gmx.net>
 <aCXUeOmy28tqg6Oy@Z926fQmE5jqhFMgp6>
 <0703ff48-e781-49b6-8a8d-7cdbec73bb92@gmx.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0703ff48-e781-49b6-8a8d-7cdbec73bb92@gmx.net>

Hi Stefan

On Thu, May 15, 2025 at 07:48:04PM +0200, Stefan Wahren wrote:
> Hi Etienne,
> 
> Am 15.05.25 um 13:48 schrieb Etienne Buira:
> > On Thu, May 15, 2025 at 12:31:38PM +0200, Stefan Wahren wrote:
> >> Am 15.05.25 um 11:44 schrieb Etienne Buira:
> >>> Hi Stefan, and thank you for your interest.
> >>>
> >>> On Thu, May 15, 2025 at 09:42:43AM +0200, Stefan Wahren wrote:
> >>>> Hi Etienne,
> >>>>
> >>>> Am 15.05.25 um 08:41 schrieb Etienne Buira:
> >>>>> On Wed, May 14, 2025 at 06:20:32PM +0200, Stefan Wahren wrote:
> >>>>>> Hi Etienne,
> >>>>>>
> >>>>>> Am 12.05.25 um 18:30 schrieb Etienne Buira:
> >>>>> ../..
> >>>>>> Out of curiosity and because i never saw this issue, could you please
> >>>>>> provide more details?
> >>>>>> There is nothing connected to HDMI 0 & 1 ?
> >>>>>> Which firmware version are you running?
> >>>> Please provide the dmesg output, so we can extract the firmware version.
> >>> Firmware version is 2025-02-17T20:03:07, i also attach the full gzipped
> >>> dmesg, as long as a patch of extra traces used.
> >>> I did not specifically test other firmware versions for the timeout
> >>> issue (but i did for video output).
> >> Thanks, i'll try to reproduce.
> >>
> >> Sorry, i forgot but is this reproducible with a recent stable 6.12.x kernel?
> > Just reproduced with pristine 6.12.28.
> >
> okay, i've update the firmware on my older Raspberry Pi 4 to the same 
> version as yours. But even with your configuration i don't see this kind 
> of fallout. So I think we shouldn't apply this patch until we really 
> know what's going on.

Ok, thank you, did you make sure a powered hdmi sink were connected? I
noticed there is no timeout if no hdmi is plugged (but there were when
monitor were powered off, maybe specific to my monitor).

> You don't have another Raspberry Pi 4 by any chance?

No, i don't.

> Another cause might be the toolchain. Currently I use a not so fresh gcc 
> 11.3.1 from Linaro.

Previous tries were cross built. I tried a native build with (Gentoo
packages) gcc 14.2.1_p20241221, binutils 2.44, and glibc 2.40-r8; but
got same result.
Will do a software upgrade overnight to try with more up to date build
system.

> Except of this, I noticed that your configuration doesn't enable 
> DWC2_DUAL_ROLE and the LEDS_TRIGGER.

I have no use of them (and i have a lot of things to disable, but i
prefer to do that starting with a working system).

Regards.

