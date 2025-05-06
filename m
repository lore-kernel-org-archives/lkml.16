Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DD324886E;
	Tue,  6 May 2025 08:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746520015; cv=none; b=Zoz//LUDy80Axr5BoqihOxx+yLHDa99o0y99/O1CMHcv0RQ8dAy5/HrJGj6QH5BCiVWa1yCisjHb+L9zTrtAomntuJqkDeCRMS/Vmm23WZTmxO0nvI1Le+5ewDyBhf5LHEvMT6jtklkN7CtqgTN1ax8rVnVj6Zgssgt1iEpzyTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746520015; c=relaxed/simple;
	bh=ad97OQP3nn2YqrRFzD02fywEVWGG5tYkx4QSKxSCpwA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rkgklBddBJ5vwq7qIloxbU2PYkMAAlmdxtnhQQ4uo0H3L0cX5rJNMXzsPOuBG7VYzrXejdOdAsd69PjuPM5yfKyXtGo/N709RBuxWc/btPq8pPnEnkjtalliEA+VrJxo+Q+qO+w7v69yoaGDLU//aKkXVmvh94vm4GgXNLgA354=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PSEM0vsc; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PSEM0vsc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746520011;
	bh=ad97OQP3nn2YqrRFzD02fywEVWGG5tYkx4QSKxSCpwA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PSEM0vscIDZEYCJakmdi0kRAntYLb0wMyGU6c9qz0Juc7BWnKyWS47x+iU8c6Iohq
	 YNODsLJ15zrpgMeWLJOoCUzdgAuLr+q6xr3Cd3rVYej9uPvt7R14fVfitnc3XNH5YH
	 u9asjHeS1kTlgc1VNkOh0ik7QLr31oqHKgi3ZZ9GCZMTP/ogpjkZobGQjZSrZ7RZzE
	 24JCQMsyeV3fO6G7LEKxUC8MmK5UpZ+kTtdbrFtzA64OzEkuNPrVK0jY5qrFjh4C6G
	 65tYIaZBsZoxBK51I2o1rLf59muGHUeWdKxrJnyeOIjYst0loXUOvSA1mOFj9Ul/CD
	 cU4Bbklzo2WWw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B3CE117E0B46;
	Tue,  6 May 2025 10:26:50 +0200 (CEST)
Message-ID: <ce48bcb3-1881-41bb-aafe-bf90b78d47e4@collabora.com>
Date: Tue, 6 May 2025 10:26:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: mfd: syscon: Add
 mediatek,mt8365-infracfg-nao
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250502-mt8365-infracfg-nao-compatible-v1-0-e40394573f98@collabora.com>
 <20250502-mt8365-infracfg-nao-compatible-v1-1-e40394573f98@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250502-mt8365-infracfg-nao-compatible-v1-1-e40394573f98@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 02/05/25 18:43, Nícolas F. R. A. Prado ha scritto:
> The register space described by DT node of compatible
> mediatek,mt8365-infracfg-nao exposes a variety of unrelated registers,
> including registers for controlling bus protection on the MT8365 SoC,
> which is used by the power domain controller through a syscon.
> 
> Add this compatible to the syscon binding.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


