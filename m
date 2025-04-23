Received: from mxout3.routing.net (mxout3.routing.net [134.0.28.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7157C57C9F;
	Wed, 23 Apr 2025 13:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.0.28.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745416073; cv=none; b=bArw1dosQO1m2h2iOp8CEvl0iL+ego7HmLEwzgTBRSWTF3UOIBp1G6xGienTOJA6xzxkj89jR/WWFnhltLAUN53Ygad0NCYdZAH7teDRKDIMIA3rubfKYQHuQpxAqRADbo+8XJy0Zr0cAX458GvUosLxDOKz0b78Z5c8rttAmQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745416073; c=relaxed/simple;
	bh=hdJG21TL+AvOeJeTB8RJ+cFa9H+iGGwKryVw2CrsL0k=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=lYdjRgdW0N7COnM1wJjvuTEU5tMNeWRY7HlUQMCWQR8VnKDYkkteqc3d70oNyA1GBoDPD7l8pNM1weLEPV5TswznG3lhDkgCmCVBoy67g44hcs9bxicdZ/o713ys8jUxWRz9wUzrzNAEcwKh559ZcaQRtASZvWN/Z1AIWeSpQeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de; spf=pass smtp.mailfrom=fw-web.de; dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b=JzGmmKZg; arc=none smtp.client-ip=134.0.28.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fw-web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="JzGmmKZg"
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout3.routing.net (Postfix) with ESMTP id 28C5961667;
	Wed, 23 Apr 2025 13:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1745416063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hdJG21TL+AvOeJeTB8RJ+cFa9H+iGGwKryVw2CrsL0k=;
	b=JzGmmKZgT3R57Pwt0GXRMMsCtFazMoMWkuqMY2D9xQOuB/NE14E7uWC74E3A77pWXlqw1e
	QuosA8MFdJteMooqttO5xwm6HcODZ8FDCeF2ppRJL+GU/zvn1S3g7UkMLdvJBMXGoC6kxV
	LU2dsNj/nY/0lXQ+YCJZXB3+ZKiVvjU=
Received: from [IPv6:::1] (unknown [IPv6:2a01:599:a06:ae47:924d:415c:d602:5492])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id AE5951005B4;
	Wed, 23 Apr 2025 13:47:41 +0000 (UTC)
Date: Wed, 23 Apr 2025 15:47:41 +0200
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>,
 Daniel Golle <daniel@makrotopia.org>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_1/8=5D_dt-bindings=3A_arm=3A?=
 =?US-ASCII?Q?_mediatek=3A_add_bpi-r4_2g5_phy_variant?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20250423123339.GA191369-robh@kernel.org>
References: <20250422132438.15735-1-linux@fw-web.de> <20250422132438.15735-2-linux@fw-web.de> <20250423123339.GA191369-robh@kernel.org>
Message-ID: <D036900A-79D2-4C87-9D77-DBF443E12028@fw-web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mail-ID: c11d15a8-4a69-4433-87de-3e7ec32e89b2

Am 23=2E April 2025 14:33:39 MESZ schrieb Rob Herring <robh@kernel=2Eorg>:
>On Tue, Apr 22, 2025 at 03:24:24PM +0200, Frank Wunderlich wrote:
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>=20
>> Add new compatible for Bananapi R4 with 2=2E5G phy=2E
>> Base board is compatible with existing BPI-R4 only 1 SFP is replaced
>> by RJ45 port and use mt7988 internal phy=2E
>>=20
>> Signed-off-by: Frank Wunderlich <frank-w@public-files=2Ede>
>
>You didn't add Krzysztof's acks on these patches=2E

Sorry,i thought i've added them in my local branch before running format-p=
atch,but it seems i missed that somehow, possibly dropped these changes whi=
le aborting rebase=2E

regards Frank
