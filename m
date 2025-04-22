Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176B52853F3;
	Tue, 22 Apr 2025 13:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745328690; cv=none; b=YsYWL1QEe+cZ1s82F6g/K0JCwupHPWwKOvIxmB/aPrFqZxlcXk6uePtDR0AaAU1+n6w4OLOIZTlI0BZwf34AFxj6UVEsGnb2WkiNOb0o7Zyf0AMxt8iaXz/FqN17b1PRK7UwtRJ8ijLy2vIxt4XMHWfwj85083RjbSUeIaHVTG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745328690; c=relaxed/simple;
	bh=FJ+H6qNLc32NphI5YX+2HPS2FGnq/hpZqebOoXEmT0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jr3Z7FwIEgtvsBxToXZiAV5fU3RFpx8qfVP8z2XuU3kquRGpHCKKPnyrOdxhVQy31wVud7gPWyU5s89GzuOdm0dcvmZEclhpIWHC+6CrYgQFMg0goANbnPYZrEAVDlAMDPnj+PKAAy8cTBv8ZmzASF9b2EwldUJqrmwjgN4pAyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Zi4HcB7x; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Zi4HcB7x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745328687;
	bh=FJ+H6qNLc32NphI5YX+2HPS2FGnq/hpZqebOoXEmT0A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Zi4HcB7xvv2AnzdQmSBfHK/iExVod1qcoLkof1gFRJNrv+xk/ETPVfVCyIuIaMIkp
	 6x9l0rjNlqQzEYkzw6mhujTOG7eOJEQ8kayVAQn2wru1AOxpkHet6r7z8Li7rUkqTe
	 g12ebHEcXleSLdCqpLMImo/pKhoU8PiaVcOmIhAs/pg4MBc0WlVLevdL7S7mjL3rdc
	 dr54cIAezKNrb1jdrgzQZqTk/+/OQradYxvW72Da/3pI/xT4IRWDCHy9vqJjxdM3zY
	 PN5XaIIupGaq8HbGg3i5OlxBAKJtXC4MC1BD/Gfeh3YdrGpqFyQ2r8GrwSpZlrnYyi
	 Bl8osISpj2YLw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 39DC717E0CAB;
	Tue, 22 Apr 2025 15:31:25 +0200 (CEST)
Message-ID: <80b19eab-78f8-4403-a734-73db5244a07d@collabora.com>
Date: Tue, 22 Apr 2025 15:31:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] phy: mediatek: xsphy: support type switch by
 pericfg
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Daniel Golle <daniel@makrotopia.org>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org
References: <20250422132438.15735-1-linux@fw-web.de>
 <20250422132438.15735-7-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250422132438.15735-7-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 22/04/25 15:24, Frank Wunderlich ha scritto:
> From: Daniel Golle <daniel@makrotopia.org>
> 
> Patch from Sam Shih <sam.shih@mediatek.com> found in MediaTek SDK
> released under GPL.
> 
> Get syscon and use it to set the PHY type.
> Extend support to PCIe and SGMII mode in addition to USB2 and USB3.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


