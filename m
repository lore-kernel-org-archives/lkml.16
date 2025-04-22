Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA89284697;
	Tue, 22 Apr 2025 13:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745328737; cv=none; b=llb+b+034z/lM9BYoRPj6tmZDlQiooCoM/WfTmcj9porMtydBTXtykjQM3dfdynMPRvKrWzehEZ9ioG/WuORoDrVI2Za6dtBsgPmjYg4zTYG1qKE+510w2hGK77eJJ6mgy5jRBB80Jbn1TI6StzV7L6zpucjBllu1uUiYwa+ylU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745328737; c=relaxed/simple;
	bh=a3TPpkp3dVLMhX0tMuwCmJmM7PVgdf6PB6QGOLrovas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kU9+38MwU6Tmz131lQKi3a0AxHZXUh1bKybnmZiCi0HF7/NCuGEQjbzoKLRa0f6aaoeB8nCkqcZoBnja//OhqK8sTlAco5LxkMlqrVfrnINlnGq8UdaQ1I8jq94LohfKK/Ot9L8TWHqT1BSzQAssDgXxnMxwBfGYRxA7v16d+0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YUBtroK/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YUBtroK/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745328733;
	bh=a3TPpkp3dVLMhX0tMuwCmJmM7PVgdf6PB6QGOLrovas=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YUBtroK/3p8k8uHM5z6Cxtc7xtjzoqpysmVKAjTwndu7tgXEBuhSQjtxkxMpgScmT
	 29TVMZplVlL169BEJPbfbphTUXVwRKSxNmoShfAns7m/OVq4qsSfLIzQayc9DuAQTd
	 uC7Cu8TfDrKu85ibkgwKdW/D48myOPHMnTIvsSQ5ViJBMkDS/eA0YfnqH/J+m2Xuyt
	 G+ZnkVaipXffimU20ICLHI41jGHxlT6kr22w+PaRn78wqfWf/FxeCaKLfsdh0Oj7F6
	 xmut/4fbjSpoUIH5bkq+EBLfg9rX9IF1QpY9/oI1JFFtk9KovbKZaDoY4eCwnEy9wG
	 zCIwqwx0nOPKQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DD8E817E02BE;
	Tue, 22 Apr 2025 15:32:12 +0200 (CEST)
Message-ID: <950f38bd-4156-49c4-9b28-2e57d162fe48@collabora.com>
Date: Tue, 22 Apr 2025 15:32:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/8] arm64: dts: mediatek: mt7988a-bpi-r4: enable xsphy
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
 <20250422132438.15735-9-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250422132438.15735-9-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 22/04/25 15:24, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Enable XS-Phy on Bananapi R4 for pcie2.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


