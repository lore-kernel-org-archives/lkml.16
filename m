Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A84A2054E0
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738588621; cv=none; b=VRIcusJoOCfrpM1BioU/O7/2omzo1+TDK3IVfsmWghMa5vE4QTcNpLLJB8tr4YJ4SZgKFBtaL1du8T+9U4gLgxAnK7j6NF4tQs26IAVu2rKTnCTGyO4A5CUyuohGr0A1+rrR8k7vk/R41AhXIqfw5bs8idqJ7uDq10XyD6pNk38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738588621; c=relaxed/simple;
	bh=zzaLyT9M/NIjLYsrqKiK/pPYSkvPh+zh9QZBX+VXaXU=;
	h=MIME-Version:Message-ID:From:To:Cc:Subject:Content-Type:
	 In-Reply-To:References:Date; b=HQotZBk8asL/bBHUGwB/Vsce0joutr3crintkwgoR1ctFo2jm8OWxemq+pJEF+ZwdJjvwmjEy0SvBqyImPY0x6Gffx6MqiRxKPgYmSNwFB68VnJ8wOuiKFtjsBvCNbzBjFdd7RonBCMOzemlCZYq4YiT16hJ/Eo1oZq3/bNtLek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=D/NPlynD; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="D/NPlynD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1738588594; x=1739193394; i=frank-w@public-files.de;
	bh=zzaLyT9M/NIjLYsrqKiK/pPYSkvPh+zh9QZBX+VXaXU=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:In-Reply-To:References:Date:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=D/NPlynDLpvtBn+0kQWaUMFstxqf3g2lWSSiNuT8F7I9ok+e+Vht+eAgKXRE177Y
	 G9HUeNYKRvh9ldIV6QfNrhOcz6GoxR+xlqlaARfkjGOKAqhtIk7X9rj6ePeXTIEVd
	 mKYd3W+YUncGZVyfkfzZ/jTX5zFYrEbDN5bAVbwUz2pLGWNY/TIcvrLKIbK3DvE50
	 QdoqOjf9Xxg3r+AAqmN9T67b1u6TjKM9/bpLDwF7jPrpRJUIxmT1kCb2aIxBbqvc8
	 QG3cd1lhJ8C00Vkvkwp2Ll9/qkym+Faga7GCb8pwg/LhAZCBrAAr7jzOw2WuWSMJ1
	 jFmzgxzWWVXB57dU1Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [194.15.83.77] ([194.15.83.77]) by
 trinity-msg-rest-gmx-gmx-live-548599f845-t5dbc (via HTTP); Mon, 3 Feb 2025
 13:16:34 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <trinity-23c8b516-bcfd-4dc9-8810-5e17510b159b-1738588594123@trinity-msg-rest-gmx-gmx-live-548599f845-t5dbc>
From: Frank Wunderlich <frank-w@public-files.de>
To: daniel@makrotopia.org, robh@kernel.org
Cc: lee@kernel.org, arnd@arndb.de, krzysztof.kozlowski@linaro.org,
 pankaj.dubey@samsung.com, willmcvicker@google.com,
 john.madieu.xa@bp.renesas.com, nm@ti.com, vaishnav.a@ti.com,
 rafal@milecki.pl, john@phrozen.org, linux-kernel@vger.kernel.org
Subject: Aw: Re: [PATCH] mfd: syscon: Restore device_node_to_regmap() for
 non-syscon nodes
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <Z5_4Zh7vbB2ku5so@makrotopia.org>
Importance: normal
References: <20250124191644.2309790-1-robh@kernel.org>
 <Z5_4Zh7vbB2ku5so@makrotopia.org>
Date: Mon, 3 Feb 2025 13:16:34 +0000
Sensitivity: Normal
X-Priority: 3
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:/mW2hxmFt/fxoayc9dCfsghZWHvRQjHJJEcCc/I8+lhB1EwHgYrpOjp/nDQJaz56cp0Ow
 Ee8ukMLgoKMk8j1usKbk37q/PhH82LAt5kxenRjA9BkHFJ708WOAB6rA6Z3iIsLlnDm0wnbgyi4t
 Qb5h4FmZBkoWHHN2LNYuqazA3jopVaicGfUMnQImtgcdOD3uXOQPVNw1SdWXf44lI43oHHJyeGXt
 OoNWP05jxQEJ+IdI7WAb4LDqRlkxNQr5p7r892I+0ELDa5QdtBo+xjPQF8405HIER+qFIqttdajv
 sWzJpqjBlmm/wXi4deMg2hAeRG++9BNA2e4No8gMqeEd46a/Pk8W8numU1bXw7tMQw=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+KP95lJJuMU=;Au08bsS98A+ucC4P5ff196/YE1N
 76wPPq1BtFuElP+Gn7NAOMkpBfVKdI+ubwuSRqzZ/H0joSBRViOd+AD/2nNacdCWWTRaN8/sq
 R0UgTj/a1B5GW2xasQTTOBgdGDeJVc7HaCvit34bjNbAQDWziF53TyIYl5uwOjHEdC2Qh6BZh
 lIxfQgV5254mpl0Hz1itfbJ1Opd6+N7xF/sBY0lIOv0kE0pRmwDdMUebmrgvmFVb5x4HrSUhI
 851UyHHB4ABQWWtDGvmO4pr9i3ieOJRcSMesLI0DwdVX8Y69sajTA8j+li+ciotBMBjpVB4PE
 zUFO1U+aSTM++5wf+1iee2jKFvNm4I1AeXGEbcGTXk3PnccmbV/4sQT2aS7AR8Zuu7aHjSv/8
 1SzUysFc8XhlL6k7Tc78mQ5Hjg/U3KpLlIC0ZJiUTwEGWmFjNWgnzORvfwGi9Zy+edu/pmRFk
 eRhYtkJFKcaqKolsnqysN/7evISQbo0UGTdBZrvQ8mPwrEX+egh1KuuoRIP48sFwBd9rZVSvN
 /v5S2SzdmK3J0lK5HRC+gQF9G7V+wIoZZTsS3nKVOLRnhxSee0PNItZbIz14V2rdb9X3N+ISq
 tiHx+AD9gq2b8+7KRRuDDg5Y1ZHhSJHUExLb3obMT5zo6bP2RhlO0rYpLJDiqJh8EMw9AtiCR
 ktVX1rrGvq0IeDCTqlheJL6ruLl4zpQUvTS4PlCgak96s8usPuJT+z38vQy9gkesJ7Cm0oIk9
 nfK6YS8WZXnuh3y0HBq/lu1ZAFhkzjoaEKK5rxgTEqgxAbAhgt3vRBOFO1G0sJdm12h8zPnON
 eTx4tWABnA5wLyGunbPSlFUooS/RddHsEcUoGFbNH+2aNpYx2d8ECDj/MKXjbbzNXRMPxib0O
 nOtaB2mq+exnq1Pwv94WMyeliwqxyWApDbNypd7O47sw81dtAJcvoIXHEt6TWyKef8R6DSzDY
 vSB1vilnzs5FPG62yPKmOaTiqoQn6YOYUAe3oXIGb9WYmIJNo0hXjv/jFuav4/TB3Nxchivpq
 bzEWFuV3Js46LxNmZPJvOLVf2ezn7uFbdpL84qa0D9Wl2YazTGhzTS1SSnl9kvQ5Rdj6cf57k
 QzkpNN2QUPMSCrXaqu0RUgb+YpE+1c9Qie3TGGhoO8pLF2jKPzSMRvFb646ZwkqcuEXIMeF/s
 fJB40MtzW3d8PU1NFMoWw
Content-Transfer-Encoding: quoted-printable


regards Frank


> Gesendet: Sonntag, 2. Februar 2025 um 23:57
> Von: "Daniel Golle" <daniel@makrotopia.org>
> Betreff: Re: [PATCH] mfd: syscon: Restore device_node_to_regmap() for no=
n-syscon nodes
>
> On Fri, Jan 24, 2025 at 01:16:44PM -0600, Rob Herring (Arm) wrote:
> > Commit ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a
> > "syscon" compatible") broke drivers which call device_node_to_regmap()
> > on nodes without a "syscon" compatible. Restore the prior behavior for
> > device_node_to_regmap().
> >
> > This also makes using device_node_to_regmap() incompatible with
> > of_syscon_register_regmap() again, so add kerneldoc for
> > device_node_to_regmap() and syscon_node_to_regmap() to make it clear
> > how and when each one should be used.
> >
> > Fixes: ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a "sysco=
n" compatible")
> > Cc: Will McVicker <willmcvicker@google.com>
> > Cc: John Madieu <john.madieu.xa@bp.renesas.com>
> > Cc: Nishanth Menon <nm@ti.com>
> > Reported-by: Vaishnav Achath <vaishnav.a@ti.com>
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
>
> Reviewed-by: Daniel Golle <daniel@makrotopia.org>
> Texted-by: Daniel Golle <daniel@makrotopia.org>

fixing Daniels Tested-by-tag :)
Tested-by: Daniel Golle <daniel@makrotopia.org>
and confirming the patch fixes the clock-syscon-issue (on mt7988)
Tested-by: Frank Wunderlich <frank-w@public-files.de>

> This fix is required to un-break various Mediatek clock drivers as
> device_node_to_regmap() is used all over the place there (in
> reset.c, clk-gate.c, clk-cpumux.c, clk-mux.c) and commit
> 3ba5a6159434 ("arm64: dts: mediatek: mt7622: fix clock controllers")
> has droped all those unneeded "syscon"s.

