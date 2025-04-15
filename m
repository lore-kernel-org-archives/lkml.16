Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F464C74;
	Tue, 15 Apr 2025 09:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744710770; cv=none; b=CNcPiUJ+WeOwEuPcwCXxq4Jf2g+Qqkazs60q0txgDdlc5kByng25hQScupyAxk1wKVWNyUGBSQzCv0ud7G+BY3iove8GmxipwbmBbGpHT3YLze/hYGw75lnlQkFG6NsJ7Ztv2AN3kiv5h4sN1C1Ck4nxK51XdhNMIVeahMBQ85w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744710770; c=relaxed/simple;
	bh=flvzDfsqbS3vR0XK7ckJ2rQ8OFXa7GhkGw8Wjc8yplM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=oe9b/aVJ+l5VPv3IZqnd467XbKcZ9aDHW+Hw11jv0aILPZjwVlHzxnyRbY38MQGoyZBMG9YYCOw/mx4WeNH2FbE1IcGwF00LLFrEgXvE8VcGJ1bxF2BJbr8IhghipLwg/UyXsvx+JfIkgbBeGtcuZUubedb6pIukbJhyDilXl9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=bLhOgagt; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="bLhOgagt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1744710739; x=1745315539; i=frank-w@public-files.de;
	bh=Q+JckBEpsrRgqh5xztZTHuIFUl86FPQgA/jK6oZPRJI=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=bLhOgagtIW/xrGe5Nq/eT10+fZL8R9146+562WV+19hEvp0m7LLIPpLGoQOaaZHO
	 0exsQBy34S+clURVRsFvn72m0tvnPd3HWlwkv2sNYgJ9MKSDYaP45u+oRCzNA8YXI
	 nHHCj5z9JdXGda+7Fhjgf4V7dWD6pwzccFQ6DXScBl1gBV66l5U25iBbohq7/wopV
	 kq8h3eSBqOiQfGPwTTdpn1DFUI6+1QbKv4DY12M5RRM2Q+HWKypRGIltIliw8T7xp
	 1rlbboCruan5kxl3GsRUMzk3IROhb+9XbMM1XPB3/5RnMSQi/WAy81AQPlsc5frQQ
	 pnEc9YdM80A9d08pQQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([217.61.148.30]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MK3Rs-1tjEjN2Nri-00WfPz; Tue, 15
 Apr 2025 11:52:19 +0200
Date: Tue, 15 Apr 2025 11:52:19 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Wunderlich <linux@fw-web.de>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: Daniel Golle <daniel@makrotopia.org>, Sam Shih <sam.shih@mediatek.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_3/5=5D_dt-bindings=3A_power=3A_Add_binding?=
 =?US-ASCII?Q?_for_MediaTek_MT7988_topmisc_power_controller?=
User-Agent: K-9 Mail for Android
Reply-to: frank-w@public-files.de
In-Reply-To: <700af1ab-f43e-4583-8f0e-27e5d4424338@collabora.com>
References: <20250413085806.8544-1-linux@fw-web.de> <20250413085806.8544-4-linux@fw-web.de> <700af1ab-f43e-4583-8f0e-27e5d4424338@collabora.com>
Message-ID: <2EA2BDB0-E1C9-49BC-98FC-5048905AA036@public-files.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MDFMwq9Ryka5EQJIRTUvtko9P8AePKbzPUmE9xDrQQAss83aXKG
 STQ21SuCC3A5uykYtRZaAicAhA1RltYfOdeAToH7BRl+YKP3qTUx0a6e4kSZJLqAI9f3JhH
 mmHa9PT41UQI4sFR00UU7pvbVse2JVC0ngcXy0evqylC+5T+BVSCrJSZaPfuYBNICBOCFvc
 9JesmxM19WSuIqrNJAuig==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:VK/pb+WoYXA=;bPDdGMYPFqQHNaVWNdlgFR7Fp8y
 rWQIkRE4B0iktDbhYZVOJ/v+gBRvcvY/3aV9Wha4vYf2j0y/nv6MBybsVgCLw/KbEmhUFN+EC
 miXg2SbKxGRQYeQoiJJmcq3Jgt51pe5Iqdix7p3Dw59AJhcYlwGpMkzomNa3nrXNWJDOgfOeW
 V01cIc1eZbqLgU3mCtfzWvVTCdb0Vdb9WvctQ2b7NlkoFBRNZf/EKpMZ0iPSyM0sxfx+Tzjcr
 KxUi06ed7sJBrAg3JGFYyfPFnNGBbjqaaSEhaawnu2xaF9ED0bXwS9gEcvBKH1v1Fz6JHQKn8
 BQzFd8lPgYKYP++r4ZPip1MJhfP5z6Il6IfZgmkaCkFosHYHDE8nikNQFCRnpl1gJ4hGGNf6Q
 8gQYev9dAz+1G0a2YviaQAaGVAVXj2iqUXX/nCtvTUKB+dO6LHGEB6VSGV/4La3anEZWfFFMs
 fN7yana8+8OUlMDV+WmGHlDZHvXB4F5B/Z6NwMjJ9hxWm9W94O8U+UxpR+w8nJO7k4ngJc3/g
 1+0IHh54E7Z56ZWhWaOlDvT44ur47m4t9pkjRffWkmNbnKejJu3SzoZ7fBTVkquCPdtkXK3Po
 ds4Y2phhrjfoonw741eFyci8ZxTo4RnVXouL6WDf8lPAHo1w1tr1tsJwkx0iDHjRzkEVZ4VHB
 B859Os0XrOCUTHnWupGSNKMhUoYBO2sxBXTv8cWCZFNaJbw2PbVSIEzSCvVPdhllmAXIRa1y2
 SSoJfBx9zFiLHbSxYK0bh2U0MqcogQ3+HM8sfvX5Nt3ltmviqw/x8+bTaRayOc72BdMGIwgA+
 KSFEvM6mtwtmv4AR/WVQx87VcEkk4BbuUOge/fxXMx5MIAAzUJYmu0/TjHzqchOmdYwsKbs1/
 SkeXC01UCbo8//5K4kdSnF7Y1i29xHLT1m/XzjXjcV7XtVzt2Qgs/BoAs35wVJ+VxKBpZM4YR
 MCenaYaG+lCQ/lFcN0T0Yvq5NM+Q9BLN1xSgcJeY2Jy83rs3bWA/LdgvXcVifRlrIqCWyB0b1
 OVA2v2pstzt2XYbGbjyfr7M0qcIf44KofgGOZFhf1gpOEemS6ocydFx3zoCk1bAPzowZ8gpgi
 t6eIUjG9sn8zBDoy/hWN9XdI3/4ULnfoXWZk9kBh9Xvini4EtbEcc0elP3kJokaVoKomC0t/y
 xwX72h+Pl50fFFvyu5sgKINi4DL6LmF3XBALJ+7xN/aUD3FcIa0EilzBLOQME3cCtZhgK1SjV
 W3+ALpBPt4DJ7o3eIBmrvOApT3W7qR5P/2dse8rSNipSBhYExhPlf5QyNpY6vAiPCCH59KkNk
 a3c3KYko2/Ln0PVgJf14fKP/85eO6Cs1mkFc1mq8fxxUs64kKZOkNNkXSfYGJfo5TKJHrqXHq
 1+EwjzhS91yh/KUqfzxpURFlVfsKa/dOiWxElJF0RIaQON+l4o4bxXXtzm5prRmXLCheCmEKL
 //Dmaufb4GZf9Zbp0NzkLsYdERI/JEmzLGHHvJ08LpZAQEaj2O+seThgZ6keyZBvTytMRSS6O
 jjmEHWUwYJ9+s2qCwJc=

Hi Angelo,

Am 14=2E April 2025 12:25:23 MESZ schrieb AngeloGioacchino Del Regno <ange=
logioacchino=2Edelregno@collabora=2Ecom>:
>Il 13/04/25 10:58, Frank Wunderlich ha scritto:
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>=20
>> Topmisc is a systemcontroller used for xs-phy and ethernet on  mt7988=
=2E
>> Add binding for it=2E
>
>That's the wrong binding=2E=2E=2E check mfd/syscon=2Eyaml :-)
>
>P=2ES=2E: Is there any reset controller in topmisc? Any clock?
>      If yes, syscon=2Eyaml is also wrong, and you need a driver for that=
=2E
>      Remember: If it turns out *later* that this has clk/resets and the
>      bindings are already set for just a syscon, it's gonna be way harde=
r!
>
>Cheers,
>Angelo

Ok based on the power-domain-cells property i guessed powercontroller is t=
he right place=2E

But based on your suggestion i tried moving compatible to syscon binding a=
nd made dtbs_check here=2E

I can confirm dropping the unexpected properties reported by syscon bindin=
g (power-domain-cells,clock-cells,adress-cells and size-cells) are not need=
ed for function (xsphy and ethernet)=2E

For verifying that there are really no clocks/resets in topmisc (have not =
found it in public available register documents) i asked mtk (waiting for a=
nswer)=2E

Also got it working without the syscon compatible by changing ethernet dri=
ver too (after this change xsphy was also working)=2E

Eth:
https://github=2Ecom/frank-w/BPI-Router-Linux/commit/d866e648717800b6f6395=
ad36c38f9effcf0498d
Xsphy:
<https://github=2Ecom/frank-w/BPI-Router-Linux/commit/0121a94df99700487704=
ca056b210b13db07e90c>

regards Frank
