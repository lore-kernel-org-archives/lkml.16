Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62030226D14;
	Mon,  7 Apr 2025 07:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010788; cv=none; b=dCHMTSTVpGcs7zOcf/h20dTR2fbkS19Izme9BkfvTXeHp9FwSP+C6wnrX60Px1xkjG0VxMEVGZkHBG2mCbv3Tlu1mE+Uk/yNTuyLv7KYh1hskowWmJDgKnuk1i9VbuAsDjpoOP52RyoNwMYbJZpfvGSLr80YJ0FVQCQztaM6tuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010788; c=relaxed/simple;
	bh=uotZ2ajR6KptfuV3oT6wTBp1RVUk+IvL3zT0lx2wKpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m6VYJVvCq9uYZh2WgWQ0JRDFns3nhjEES4OerUSloDQ2ww4ztoKHolwE2de4BNxDqiYqDYrleXzVnj4iiZDFw4uZA9w2tL4B2V5Tz1UiilEfKAuVnfUt/ueefcH77pvcbmAFId4zwTh7bIHUMb4MRplx+OJ4DW4fzqZud8ac77w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LIWoajLT; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LIWoajLT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744010784;
	bh=uotZ2ajR6KptfuV3oT6wTBp1RVUk+IvL3zT0lx2wKpg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LIWoajLTEfejZcuREwXBH6mdfSpGRFFynXj2vc5bGixWs3YzYWguX3USmOAnw3weO
	 ogF/Roidm6YrAND3tdYit/eISsUekVRP9F/tFsnYixrAqePKxs2ODzs1kwvMYG5r4o
	 aIylv0/o3EgxPGnmLPlYLYyCjgmYiE6LHfggoFDSrSkg02ZR1/QyEVBKZxFDU8ltg9
	 DWD1H1mUwoMSSS+6ucKLaKeTo4NGJ72GC/t93/lgwqukC2uWJCG4ICymW7UBWJ9u/d
	 ZAouRKJhq4RGIyqQCdsWEo90iWgkayYQ5BF9jVGkkZIsnzmEFDj3s6lJPVAXGx1apf
	 raP4qMAad8bYw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BC22317E07F3;
	Mon,  7 Apr 2025 09:26:23 +0200 (CEST)
Message-ID: <8880595f-4178-45ef-8543-0d69c0b9054c@collabora.com>
Date: Mon, 7 Apr 2025 09:26:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8395-genio-1200-evk: Add scp
 firmware-name
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Ben Lok <ben.lok@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250404-mt8395-scp-fw-v1-0-bb8f20cd399d@collabora.com>
 <20250404-mt8395-scp-fw-v1-2-bb8f20cd399d@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250404-mt8395-scp-fw-v1-2-bb8f20cd399d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 04/04/25 15:53, Julien Massot ha scritto:
> Set the scp firmware name to the default location.
> 
> Fixes: f2b543a191b6 ("arm64: dts: mediatek: add device-tree for Genio 1200 EVK board")
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


