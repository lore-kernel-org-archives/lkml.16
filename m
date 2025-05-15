Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBB2296FB2
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 06:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747291322; cv=none; b=hjT3Gnd2+NFvCr476WsmUXW1h4NAO9UhtsGDaRBWZ/gjad+q6HbyjOKedmF6skYuIdvgbHfLJpYpjN7IcNpC9Tu6Jfu2u04+GDM7MB8ILd8pmj7sBTKXsbJfyWROTVb43RDK8P+I5BnciLn0jctx2hkcuDfI74EeYPh0N8gMTkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747291322; c=relaxed/simple;
	bh=dOdu2Ci6ROPLjf8PLzJmQYNLL9AUR9xNrQR8OsJrFJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aa0whwFfMCNk6OzPP1ErFsK6AN4zZCqMAEwWTDsEqz8PtCkSDiNFUtIhapY7XqJY3Lran6T2PwvE9ToPm9tV333MqI6z8WGZFrEvrfGS4/G76v4vd25sEnHLQs6FIf7uygeK6MTthSCHKjNBlf1Y1/ZMu0OetnZyG16yV3yLTas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; arc=none smtp.client-ip=212.27.42.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from localhost (unknown [82.64.135.138])
	by smtp2-g21.free.fr (Postfix) with ESMTP id EE3E32003E3;
	Thu, 15 May 2025 08:41:48 +0200 (CEST)
Received: by localhost (Postfix, from userid 1502)
	id 84740C4D1; Thu, 15 May 2025 06:41:48 +0000 (GMT)
Date: Thu, 15 May 2025 06:41:48 +0000
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
Message-ID: <aCWMrJcldfrsNTQq@Z926fQmE5jqhFMgp6>
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
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <048fd6c5-9f09-4c06-9a23-e5821dc291d5@gmx.net>

On Wed, May 14, 2025 at 06:20:32PM +0200, Stefan Wahren wrote:
> Hi Etienne,
> 
> Am 12.05.25 um 18:30 schrieb Etienne Buira:
../..
> Out of curiosity and because i never saw this issue, could you please 
> provide more details?
> There is nothing connected to HDMI 0 & 1 ?
> Which firmware version are you running?
> Do you use a special configuration?

Hi Stefan

There is nothing very special, hdmi0 is connected to a monitor, there's
a (independantly powered) hdd on usb3, keyboard/mouse on usb2 ports, a
Gb network wire, UART, and nothing else.

The afore-mentioned next failure is also about graphic stack (hdmi
signal is lost as soon as VC4 driver loads), i seeked for help here:
https://lists.freedesktop.org/archives/dri-devel/2025-May/505475.html
(btw, if you have a hint...).

Regards.

