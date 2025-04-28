Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9D2BE67
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 07:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745825214; cv=none; b=rJEApF795+ptjVcskeKU5w5yJhcblNQky/YTHjRm1CfaaxbjY8WfM4oKVS5/1QoJQLCPhUs1ISqyYrSTI54akNtNWpp9FuYK/TRaWHjd50yU8mpyLZesAdsHFtYqisftczJXER1h+heyaGZ6gboF9iA9YRFRV6EdXywaly7x83Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745825214; c=relaxed/simple;
	bh=nDBkBJAdWu/ACY86EyWr8Sx3/0ngI6TPK6V9GBIUBiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sA5NzaAGOscOc9ywYFqR6M4Y1RwyKdsWECfwt/Lc5eScRL6F+OdMJKF0C5xpHyCv/W4tNaQzAH3v7iOxUCFts10ibc7fnKOpLNkjUNTQmKtuHjm0P2NT1WGVX1ig1NHSg9vaoyOcu+jEviEih1uDywSZqUQEFSAkviR1RoCeS9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=BOcE2IqS; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="BOcE2IqS"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 99A4E240027
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 09:26:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1745825205; bh=nDBkBJAdWu/ACY86EyWr8Sx3/0ngI6TPK6V9GBIUBiU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=BOcE2IqSE0aj4vSs00NcAdlFm8ATmFEhh9teUyMmf0JirIaIWhgwB1vb2PndV51Xs
	 DeOwScmMKSPH4wtviibnNMzL1gBjlrmeWAo7YWmOy9GH59FrZwhqj3/u548KECG1Fn
	 UTrRW8YU2WWYkc+rrFqL12G1f+FJiDHnBnzAhVh20btLU4XT6l84J1O8rHrL8xsyxE
	 NNKOO1THUDZahjCzlAucJlX4qtQdrgWTXJuPevlaS8hmOqzM8Pg3PYZOwHbPdi/+xU
	 kzTbPBhNVrcUdj7xjTBlu1pA7oiSdaqZK8YGTapplJdQeeNKFx+6u9JjzqT50Yoke5
	 5tNdOFlnxVVrg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4ZmFPZ1fG3z9rxG;
	Mon, 28 Apr 2025 09:26:42 +0200 (CEST)
Date: Mon, 28 Apr 2025 07:26:41 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Chen-Yu Tsai <wens@csie.org>
Cc: j.ne@posteo.net, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: allwinner: orangepi-zero: Enable audio codec
Message-ID: <aA8tsao6hhW50k4e@probook>
References: <20250418-opz-audio-v1-1-4e86bb5bc734@posteo.net>
 <CAGb2v67-1tk0uAmYL-y6479itUxBJua76qhjn+0tTsN+Ni_a1w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v67-1tk0uAmYL-y6479itUxBJua76qhjn+0tTsN+Ni_a1w@mail.gmail.com>

On Sun, Apr 27, 2025 at 01:28:58PM +0800, Chen-Yu Tsai wrote:
> On Fri, Apr 18, 2025 at 7:32 AM J. Neuschäfer via B4 Relay
> <devnull+j.ne.posteo.net@kernel.org> wrote:
> >
> > From: "J. Neuschäfer" <j.ne@posteo.net>
> >
> > Line out playback and microphone capture work, after enabling the
> > corresponding ALSA controls. Tested with the Orange Pi Zero interface
> > board, which is a (mostly) passive adapter from the 13-pin header to
> > standard connectors (2x USB A, 1x Audio/Video output, 1x built-in
> > microphone).
> >
> >   https://orangepi.com/index.php?route=product/product&product_id=871
> 
> What about the USB ports?

Good point, I could test these. I have not mentioned them because they
are not related to audio.

> In any case, we don't enable peripherals on "headers" by default. That's
> up to the end user. The description for the whole adapter board could be
> an overlay that users can then apply directly.

For features such as pinmuxed UARTs (already present and disabled in the
dts), I fully agree, because they could as well be used as GPIO, and
that's for the user to decide.

For the audio pins, there's nothing else one can do with them, as far as
I understand it. It is possible to use at the least the Line Out pins
with very minimal setup, e.g. just connecting the pins to headphones or
something else.

I'll clarify the following points in a comment in the next version:

 - The audio signals are exposed on the 1x13 header described in
   https://linux-sunxi.org/Xunlong_Orange_Pi_Zero

 - The pins can't be used for anything else according to section
   3.1. Pin Characteristics of the Allwinner H3 Datasheet.

Although I would prefer to enable the audio pins by default (because
they are present on the Orange Pi Zero board), I would also be ok with
adding them as status = "disabled", as is the case with uart1 and uart2.
Please let me know your opinion.

I will test the USB ports and write a devicetree overlay at
arch/arm/boot/dts/allwinner/orangepi-zero-interface-board.dtso


Best regards,
J. Neuschäfer
