Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD9A1F8F09;
	Thu, 15 May 2025 14:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747320753; cv=none; b=vB2a/kKvUBfudMAG87BnN33za2pJueQPFXMTMka1ZqUDJdNHyJG0vHXMN7UskQDT4A7yqKN68Fy7T3nCdfbtbXV82vEGN0Sf1ggfokabwkxv7DcPOXhGjljRBxUpPnReS3+F+J4HGGD8Zw4cdHn1M1UZq6jwHnKhunIHTxrWRfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747320753; c=relaxed/simple;
	bh=F5SNJrqSpwmsGkyY6xl7s4ci6DCAjBHoLSPwiIEcVm8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fe7s+etspBWBKP3QsxyHMLJZnJLyT7EWmBVex/2mQn/zsjhlcfqdCDoInLG/XfXwDT0DUGBSE3IQUKluzlOeKvGLlPzqgX8zzdO7RQEQXeOtVW6BtGEwfTXDZwCkxly4M5tn/s2LCodLmJQH+LxVH65fCZbkYjazYM+G79lTx1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=R4rW7++c; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="R4rW7++c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747320749;
	bh=F5SNJrqSpwmsGkyY6xl7s4ci6DCAjBHoLSPwiIEcVm8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R4rW7++cWu4sO17Y7TZzoZA95tSmHEFWWIOygJXR3/vQSsIk6TljdeQCWzdRsZvgP
	 WGniK6+fgU3Djaj8LtZR1E34pA23ONj2Q5MNN4vFfzezDGdIhlSCzh+4rhNCoSj8mL
	 sa4OCADNPFp3DUHQ+g0gZXcZVBFjvbpvhUmb2kVkCEayXjxLVT26cOPYEA5fiHBBOj
	 sz4+wc0j/cn5izGI+c+CApAZ67GdEG4v0JirqDiwn8Kkdyp1Ut333IHdFKp1CmC4uj
	 ShpEo9yher2JWml+lIQjH7nTsAHXu9s+7NKWnHubTQSq1IzTYltMNsLi9ohxLXAm7Z
	 7TW+7zxvexj6w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6DC3C17E0062;
	Thu, 15 May 2025 16:52:28 +0200 (CEST)
Message-ID: <89234201-9315-41f5-ab13-68272f62c53d@collabora.com>
Date: Thu, 15 May 2025 16:52:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: mediatek: mt8188: gce: add missing
 'clock-names'
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Garmin Chang <garmin.chang@mediatek.com>,
 Friday Yang <friday.yang@mediatek.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250515-dtb-check-mt8188-v1-0-cda383cbeb4f@collabora.com>
 <20250515-dtb-check-mt8188-v1-3-cda383cbeb4f@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250515-dtb-check-mt8188-v1-3-cda383cbeb4f@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 15/05/25 15:31, Julien Massot ha scritto:
> The 'clock-names' property is required by the dt binding.
> 

I just remembered something....


...care to respin this patch instead?
https://lore.kernel.org/all/20240911104327.123602-1-angelogioacchino.delregno@collabora.com/

Cheers,
Angelo


