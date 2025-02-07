Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F46A80BFF;
	Fri,  7 Feb 2025 10:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738923875; cv=none; b=lfWVU4UIAtAfcd2M1TZ9SSHdkiR0FBhrQ6nFDfEkeKohn2IuEQCK24qWq1sCDaVZQMl1LHgBFK7CPv3KxJU62+pLhUwbdb+ed1HEVsJqI5nK4qhAlbu/GnOSrVK9xOfgDqm+F8kkm75+kURpyPHQmK6VMrt7Q495CmUn3T9sJt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738923875; c=relaxed/simple;
	bh=FN7MfmtdvXq1POuExLAk+7+wSvYvFRPnOI7xvfhHDB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WYUgGJv5d7RVhYT+VlkIuXDQBmp4U5NctQZK99u4yx7EjA2Ecq4PO6UMvicjAhWNOkS7MK/qkVvD8fihNPguL95eiFUYmBT/Ns9oCuWs2S71oxFj1f2QY39i8Y14GQzjcCri9fPIAVJnR7u8BbCU1gA/4eWTVTaw9tH63omC9l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=MQxr0Ge0; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="MQxr0Ge0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dG6q0eUvla25R2FN1Jt5744C+rNB8H4vL7BzPhRVw7I=; b=MQxr0Ge02yi1anyweNjp+NJip3
	3nVH1uovjLmlZ/gZe3oJ2HvpBY1jQG3NNHL6LLCrsaF23RUIraLIvQQXPtioryDs6/fK3MOzX7neN
	FOSPOVYmbdDfavI867F2i56PdPt5vkrrewQnsAbquB5+BC4HQhXHLoIBh1/j5C7gcZyhTz1VoExNx
	6fh6JTajV8FU6e0CBq7D+NDZWxvx4kIcOp4lFG1LkMWD1d1h4KuDLHU49vW0WtJHOohA1S4SX82Mz
	I0AdlAS4/PHvZnuIiegSHoYyenVQuzdpeN+jtu2tMJymaWI+eC+diWxdVhoYjCL9uLHwFim3dxFs8
	vrCqjECQ==;
Received: from i53875bc0.versanet.de ([83.135.91.192] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tgLWX-0004HP-Ru; Fri, 07 Feb 2025 11:23:49 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: linux-kernel@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>,
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Alexey Charkov <alchark@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Jianfeng Liu <liujianfeng1994@gmail.com>,
 Niklas Cassel <cassel@kernel.org>, FUKAUMI Naoki <naoki@radxa.com>,
 Kever Yang <kever.yang@rock-chips.com>, Johan Jonker <jbx6244@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Algea Cao <algea.cao@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Sugar Zhang <sugar.zhang@rock-chips.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject:
 Re: [PATCH v5 2/3] arm64: dts: rockchip: Add HDMI0 audio output for rk3588
 SoC
Date: Fri, 07 Feb 2025 11:23:48 +0100
Message-ID: <11286959.nUPlyArG6x@diego>
In-Reply-To: <2781606.mvXUDI8C0e@earth>
References:
 <20250203171925.126309-1-detlev.casanova@collabora.com>
 <bfe9cb98-12ba-484c-95af-e5842edaab76@cherry.de> <2781606.mvXUDI8C0e@earth>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi Detlev,

Am Donnerstag, 6. Februar 2025, 18:17:51 MEZ schrieb Detlev Casanova:
> On Tuesday, 4 February 2025 05:14:37 EST Quentin Schulz wrote:
> > This is an address/bus-less device, so I believe it needs to be put
> > among other address/bus-less devices, which for Rockchip SoCs is at the
> > top of the DT? c.f.
> > https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-style.
> > html
> > 
> > **I** would put it between the firmware and the pmu-a55 nodes.
> 
> I wasn't sure about this. It makes sense to move it with address-less devices, 
> but the rk3399 device tree has it above the hdmi node, so I wanted to stay 
> consistent with that.

the general "rule" is to
- sort by address (the part after the @)
- if that's not present, alphabetically by node-name (not phandle)
  and have address-less things more to the top
- &phandle {} references are sorted alphabetically

And yes in the past there were more creative variants ... like keeping
hdmi-stuff together sounds really great [also to me in the past ;-) ],
but then you end up with a huge list of exceptions.  [0]

So just following the generic sorting thing causes way less confusion,
hence we go that way for new stuff.


Heiko


