Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31F813C67C;
	Thu,  3 Apr 2025 10:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743675278; cv=none; b=fcQP7TqWCqIyDOhXDW2/MDzRwYfAbzrr3+cr34mgZhwZUQSEZpFi/Ytv5dYmPPYLuSi+Sm3/+ZaxI+SIxGiFygbMmJUZj75QjDUu6+3OW2CbqZFxYO575WGlkrM6V/LDUzMcjLvKmtaciCgjIfU0yas6L7qewkr8qD+JjeBrKCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743675278; c=relaxed/simple;
	bh=pQ+giU2o8bR+aD+qw27N0esYeebZsDjxSFdqzbBOCrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lGLTN1wB8YnzjfsHjlyLUwC6W6lJqBaHVRYBBlCyb5DlYgSK82KZmyLfcydC++j0+q5vc0d59E6SkTHmI/6FvsYOfrNnD4wGMnoHfZ2Zoy/ZTFtXDjxpwmrSP6uBnipvFr2AOTlNHh3dOfObS7XAYGOeKDOBTK6QqQ6gv8SSCWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=PNimA5mI; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="PNimA5mI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743675267;
	bh=pQ+giU2o8bR+aD+qw27N0esYeebZsDjxSFdqzbBOCrA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PNimA5mIt/hfRCsjeMpmH4eTYTRmCpptdNG5VYisLtuNU029cxK+fj/yH4DJD01Q/
	 ur1N3Kw5pJJNkQJ0bP85jKifaTUVKhRJ7A7iHpICQdeE1ZFXqBzN5Q3ZPos3O7bq6B
	 KW4Fct8T6jz6VJZKf1bz2zLAtRsCbT16F8zLEgct0VimGM7uTwvIvhRd8r1e75gyqy
	 HsljNuQlcWg3K17jhBgafyZl36zNse33AMQwl7fmh4GCNyPBYM+17BPIxQMhGhKtlX
	 FoWk/a6ePZfrwfkGa3iWGXPt7KoUpZuKcKafRB2k1Lzt33P4TRMcLkknm6DtqvoqV2
	 i8lvkONG2mrrg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1E4FA17E0F47;
	Thu,  3 Apr 2025 12:14:27 +0200 (CEST)
Message-ID: <08ed1431-8e77-4435-9309-825b0f1ec4c6@collabora.com>
Date: Thu, 3 Apr 2025 12:14:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] memory/mediatek: Add an interface to get current
 DDR data rate
To: Crystal Guo <crystal.guo@mediatek.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250403065030.22761-1-crystal.guo@mediatek.com>
 <20250403065030.22761-3-crystal.guo@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250403065030.22761-3-crystal.guo@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 03/04/25 08:48, Crystal Guo ha scritto:
> Add MediaTek DRAMC driver to provide an interface that can
> obtain current DDR data rate.
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


