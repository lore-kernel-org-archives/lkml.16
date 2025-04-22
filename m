Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CAE28541A;
	Tue, 22 Apr 2025 13:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745328693; cv=none; b=igtb/n64LBylkilh6oQSAh5nIn5qq8Mbof+fEPJVdWEX0nZcqxV0HdiPh8W4UGnoRKM7Y8p4E0YJ1aiD4a6HzRNOB+gjol1CRJ/u7aypIAk1ZM6GMIf9BDhIfLF1bknbyfKVYiRpG9jFSfHVcVPHKIgNYHNAXIgHDTQu8j5dEYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745328693; c=relaxed/simple;
	bh=uxRkFn5GGKR61GJD29fIEi4WrE6zCuwdOIW9qIt7JBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=La/WCj83qNfokNnIzgsuu2kZZUI58aRx/8UZbZ2aj0w6QCJEamcKqLIg8Ph9JXIem2CKimO6kyx5t6vkx9N63OhNedqnorV22BPNMpEs9DqMZlP2D71F62mgqGH7icOfLFuDakpBUr/ocAGR2x0Lv0wlaa4mKsVPpgOqbz8t8bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lovIi5E1; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lovIi5E1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745328689;
	bh=uxRkFn5GGKR61GJD29fIEi4WrE6zCuwdOIW9qIt7JBo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lovIi5E1jC7zJKuQ6of3+VK0ExG/J9aKGlb5sZEArNGaWTyUq6BCmf5XeGZU6bN/p
	 Cqrk/qwHyBaHk6amES/goBhjixOpc+OjCVezFDV2jzXIRtNUUN3tTJdhkBQYrQtLNJ
	 T8MxuluL6Gz/GGwHR43MJZnKdXBgtHFHlK4Qj9LTSpFFC69t1u5eRh9qshFRF2wBeJ
	 UNxfWV9+JKkhriBQDYMnHzMaTSyKufJgyAq02Zl7KXZARGc0sIKaHtishJLdu3zvaL
	 XNI2g6bb9UuetSIC8Gc4PdjkLt0nubuxNluqPfeUzWaylcCqaspD634eI4K5pg7Foa
	 nHWlgGdXmwagg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CDA8117E157E;
	Tue, 22 Apr 2025 15:31:28 +0200 (CEST)
Message-ID: <98b14dbe-a8c5-4f6c-99fd-209d714c8194@collabora.com>
Date: Tue, 22 Apr 2025 15:31:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] dt-bindings: phy: mtk-xs-phy: Add mt7988
 compatible
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
 <20250422132438.15735-4-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250422132438.15735-4-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 22/04/25 15:24, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add compatible for xs-phy on mt7988.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

