Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1A219F13B;
	Thu, 17 Apr 2025 10:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744885227; cv=none; b=c+bv+ai3WqqWOf+Ip11sBF/aas1/7rNgTAy9sfcsq0C2a69NzBnZGth8XgPw7MkvDoV/JlOZzIrjx5ZMRMAFbBtqnLgNG4z4J5gGPcbRDLd7gAJK+tHTSTLETh5TbIr0tWkozg3F+JViYHjr3sNFleJN0B7Be1IxXuOpNamaKgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744885227; c=relaxed/simple;
	bh=t8QO5inibbVaRdLTebeM3EUSRTdUneDCopbPlpjTzXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=urbukF77+xSZ2lp1saKr0HDSvw3jqTWebAWt7OfD3lulDabMJPAWG6fDNUyqmNmMCOjUFBcOzWVrE0Y64vy7wkaQt6v0iIn6e6qq57UZpYdE1l1C63mANvbf6k9a8KKAuuurGV5+NKeyXl9Lwc58QKFUHScR3iPML2W9NN09WgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=bYGpjKZl; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="bYGpjKZl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744885223;
	bh=t8QO5inibbVaRdLTebeM3EUSRTdUneDCopbPlpjTzXQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bYGpjKZlLu2/A25093yupLUcTmoCdR8nVXkwXcRfZSylhLJKpDwHJCXAQ31AhoxS6
	 OLewrKh7aX0HPKQoxDrUBdXFVjvPm6t621rGZ+J7w015FGa3r0HsznL47Y92JAXHST
	 r5WZiPhCr0MZCvmlAzgUnNosf8O8w9/9P5QcQ/tQvVr7TK0ZLf5KQjdo3rPXTdDm9Q
	 sGn7Scgp4HqgcDRgefl9zpSp01d/+bqyxZeL10CnR2LXWBmL2Z8uIlGrUhR4o/0DfJ
	 5PXGJsyVVZJtxf2lHbF6oO6/+GNogZfWmzR9VAZKqgmR1LnSvDnt2uftfMVt1J6tpq
	 PNL1JkofZTA+A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AB24B17E08E3;
	Thu, 17 Apr 2025 12:20:22 +0200 (CEST)
Message-ID: <af336ed5-2c8f-4da7-9497-6f23a6959883@collabora.com>
Date: Thu, 17 Apr 2025 12:20:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] ASoC: dt-bindings: mt8195: add missing audio routing
 and link-name
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20250417-mt8395-audio-sof-v1-0-30587426e5dd@collabora.com>
 <20250417-mt8395-audio-sof-v1-5-30587426e5dd@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250417-mt8395-audio-sof-v1-5-30587426e5dd@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 17/04/25 10:44, Julien Massot ha scritto:
> Add missing DL_SRC_BE link,as well as Headphone L/R that are
> provided by mt6359.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

