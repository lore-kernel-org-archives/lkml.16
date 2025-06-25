Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6358D270EA5;
	Wed, 25 Jun 2025 08:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750841345; cv=none; b=ftLYWEPDl7pOmGTHT1rydiMoatOI+BVy6x/+E9/xN1QBy3v9wwtWSvK+ht+iKR5D1TAzFkalthqr52I+czcoxA+uvIyD71SAww6Txu/jKFpdouPRoDr5i5HDZVPJuEO4arxPNuehh+jThl87jP1QwLI0nv24ACTEK7MRBEDzWlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750841345; c=relaxed/simple;
	bh=5thf8Wycz4i1YNTtM2V2Ka5a4Ck3r1j0sf6a6jbKBNA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oXbmjhVKUd6DPmEhaAcQqoo31eqcAFk+hurPjmtyMnl9Elj0nhHSi15zxFbtikmEUQNN/RG4KeHfUYlYlmhmA8Ob1w23MtU1nQLtdrcGb1JxRvStIgijtgMQ9kL9+3rkKZqI3G3XpDonsOhPSr8dRyPJvbzFlLhapqXIz34NyrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DBFjJ89d; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DBFjJ89d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750841341;
	bh=5thf8Wycz4i1YNTtM2V2Ka5a4Ck3r1j0sf6a6jbKBNA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DBFjJ89dTMeINVLWX/krjxG40YJ+LvFI7sTmuGBSZPPRxQTu6WqNqzw+TwCBODDv/
	 HPzeT9NjRWXse9OtyaeNkYC2rZZQOADCENPN1dTSKAMoIW0oo0hccGxyW5gW4f6AoF
	 Gpso7kSHDX+OiV9Yv26e1apocQIYaqWrNWbarko4tQkHuwsppOmSH8ddblmH2JfwaT
	 BfW8USB44zbgfN8W19SRgCtNiFZTSK9s4W6bCeDlG/VD7XsSmzzgO7UP+Jk5v5blKm
	 qfvqMKJFn+/YJ67L7/O0dj6AnYofR9qAVaIlg+YcbmeS0ZSLYANrFuhyQXhwKjIbyW
	 CI/WdN9yN7Gig==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:9506:6478:3b8b:6f58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5519A17E017D;
	Wed, 25 Jun 2025 10:49:00 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: krzk@kernel.org
Cc: angelogioacchino.delregno@collabora.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	guangjie.song@mediatek.com,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	laura.nao@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	mturquette@baylibre.com,
	netdev@vger.kernel.org,
	p.zabel@pengutronix.de,
	richardcochran@gmail.com,
	robh@kernel.org,
	sboyd@kernel.org,
	wenst@chromium.org
Subject: Re: [PATCH v2 10/29] dt-bindings: reset: Add MediaTek MT8196 Reset Controller binding
Date: Wed, 25 Jun 2025 10:48:23 +0200
Message-Id: <20250625084823.19856-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <ae13aeea-bf44-49e5-82c6-5e369ea96d84@kernel.org>
References: <ae13aeea-bf44-49e5-82c6-5e369ea96d84@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

On 6/24/25 18:03, Krzysztof Kozlowski wrote:
> On 24/06/2025 16:32, Laura Nao wrote:
>> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
>> Add a binding for the PEXTP0/1 and UFS reset controllers found in
>> the MediaTek MT8196 Chromebook SoC.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Signed-off-by: Laura Nao <laura.nao@collabora.com>
>> ---
>>  .../reset/mediatek,mt8196-resets.h            | 26 +++++++++++++++++++
>>  1 file changed, 26 insertions(+)
>>  create mode 100644 include/dt-bindings/reset/mediatek,mt8196-resets.h
>
> No improvements.
>

Apologies - I misinterpreted your comment. I assumed you were referring 
to adding the commit message details to the binding doc (which is why I
added a description for reset-cells), but I realize now you likely meant 
the header file should be included in the same commit which adds the 
clock binding documentation. Is that correct?

I’ll fix that in the next revision.

Thanks,

Laura

