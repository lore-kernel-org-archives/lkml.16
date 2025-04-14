Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E939329AAE5;
	Mon, 14 Apr 2025 12:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744633994; cv=none; b=Bn2dL2EzMh85/iUic2FBcVZ/dP8waCUZbubD0oxMUGY0PvdmNm4x4isOwKwyuM+RZvhE+cbEkwMQJyuptjCYIH3BWmVd6Txut5JNzn+x9Cml04Dh+fitCnIHa7SL13s4u9wkVKttLUs+/yMqMHHdjMYJ2kQ3Vur3waWbekCF3cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744633994; c=relaxed/simple;
	bh=6400OJF4YI0lPtmmohOJ8lmx6Xr6n7ia3Oj+TECM5Ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AK5Pv4A5V/DN//nyiaTpaXc6bQx9kGkDIBABrAGjrkyn+/HSJJ57M/g0qCrHwuJ4xP/dhRWiv+/+zYTAZ6eKWXqsa1LCmx6hNixJKhk90w5AZOBVjqZNpBLZv86dpVz5TMzxVR04HbEq4627bmorFdCJmm6GH5HovoxRuk6JhDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1u4Izh-0000000016s-3E1k;
	Mon, 14 Apr 2025 12:32:57 +0000
Date: Mon, 14 Apr 2025 13:32:54 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <linux@fw-web.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Wunderlich <frank-w@public-files.de>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt7988a-bpi-r4: allow hw
 variants of bpi-r4
Message-ID: <Z_0AdtyvehR9SHnU@pidgin.makrotopia.org>
References: <20250412102109.101094-1-linux@fw-web.de>
 <c8f9f019-a238-47c8-a900-9ca48ce09503@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8f9f019-a238-47c8-a900-9ca48ce09503@collabora.com>

On Mon, Apr 14, 2025 at 11:27:23AM +0200, AngeloGioacchino Del Regno wrote:
> Il 12/04/25 12:21, Frank Wunderlich ha scritto:
> > From: Frank Wunderlich <frank-w@public-files.de>
> > 
> > Sinovoip has released other variants of Bananapi-R4 board.
> > The known changes affecting only the LAN SFP+ slot which is replaced
> > by a 2.5G phy with optional PoE.
> > 
> > Just move the common parts to a new dtsi and keep differences (only
> > i2c for lan-sfp) in dts.
> > 
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > ---
> > v2:
> > - added basic dts for 2g5 variant
> > - moved i2c used for sfp-lan to board dts
> > ---
> >   arch/arm64/boot/dts/mediatek/Makefile         |   2 +
> >   .../mediatek/mt7988a-bananapi-bpi-r4-2g5.dts  |   5 +
> >   .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  | 404 +-----------------
> >   .../dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi | 403 +++++++++++++++++
> >   4 files changed, 414 insertions(+), 400 deletions(-)
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> > index 58484e830063..a1ebc9aa4ba6 100644
> > --- a/arch/arm64/boot/dts/mediatek/Makefile
> > +++ b/arch/arm64/boot/dts/mediatek/Makefile
> > @@ -22,6 +22,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sd.dtbo
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-rfb.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986b-rfb.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-2g5.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-emmc.dtbo
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4-sd.dtbo
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8167-pumpkin.dtb
> > @@ -107,4 +108,5 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
> >   DTC_FLAGS_mt7986a-bananapi-bpi-r3 := -@
> >   DTC_FLAGS_mt7986a-bananapi-bpi-r3-mini := -@
> >   DTC_FLAGS_mt7988a-bananapi-bpi-r4 := -@
> > +DTC_FLAGS_mt7988a-bananapi-bpi-r4-2g5 := -@
> >   DTC_FLAGS_mt8395-radxa-nio-12l := -@
> > diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
> > new file mode 100644
> > index 000000000000..76eca976b968
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts
> > @@ -0,0 +1,5 @@
> > +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> > +
> > +/dts-v1/;
> > +
> > +#include "mt7988a-bananapi-bpi-r4.dtsi"
> 
> This should at least have some different compatible, if not probably also a
> different model string - as it's a different device.
> 
> 	compatible = "bananapi,bpi-r4-2g5", "bananapi,bpi-r4", "mediatek,mt7988a";

Imho it doesn't make sense to declare compatibility with the
"bananapi,bpi-r4" as the "bananapi,bpi-r4-2g5" is NOT compatible with the
"bananapi,bpi-r4". It's a different board and using firmware meant for the
"bananapi,bpi-r4-2g5" on the "bananapi,bpi-r4" (or vice versa) will result
in a non-working Ethernet port.

