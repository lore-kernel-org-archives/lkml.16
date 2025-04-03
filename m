Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A2D24A054;
	Thu,  3 Apr 2025 10:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743675277; cv=none; b=ZCANMVfhT+he7T0Awa1zrGCydrQtoZwhRjwlFxg09ESPNiGxFfSIb0/M8haBbTiDdRZd610jPFP4ZSrFOQFuEgr4pl87Zdz1d5Ubad1llqVE36uqVWhzqlp/vcXnw+R821xnLrtL4YHqkW+Z40YQN8AJrsCWR60xKxL5scHvtoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743675277; c=relaxed/simple;
	bh=0vZozkhE7JZLo5OJeXpoE83upBP93297ZDa4MSzYioY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pJm5HuB/9cQkQ36101UF+Qqt7OE6L1x4NLsvQ+wnrrUXE8j+tm1WodajZ/l9AThFVpFEStGDpIVy7ySTNxjQvL3854iFDL5yij7cWXv8dUkg4cm2McOW5jiVXEDGpBZlQLtrU8pEm00sG8MnGcmy18KV3r62EhwPkntcrRx9RTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QqAsPzQY; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QqAsPzQY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743675266;
	bh=0vZozkhE7JZLo5OJeXpoE83upBP93297ZDa4MSzYioY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QqAsPzQYfosQj2O3c+LIo9G2MhZHo+IgFBteFzHENE/j02rRK8wbCwUjyF0vnWdNG
	 x6DjksuG6a5sz/WdKW48uXCtKkuRXs50TzCIveCnp33QvRwG6Rf9ohp3J6nFERv5BJ
	 XUL89UUPaAcqgwKu5nEP70C7rmFjJuZpknkVIm7t13lDdaFplj6dOJY4rW3wTWprQH
	 vZNZn5G2ZNK6H+zB9QUOj98LOPkJgIkZUV1qtoMzt45ZvzOPE5ZqoBUWrz6P10F65u
	 5Xo4jtan+lD7l7pfKKf7ckcWCME6+vdJs28cm9DEplx3Ip9XH9sxuKlmkuX5OIUvk1
	 M+Va44y9Am2Mw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4088517E0865;
	Thu,  3 Apr 2025 12:14:26 +0200 (CEST)
Message-ID: <c5eef09f-5344-478b-87ed-05f6d8478dea@collabora.com>
Date: Thu, 3 Apr 2025 12:14:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: memory-controllers: Add MediaTek DRAM
 controller interface
To: Crystal Guo <crystal.guo@mediatek.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250403065030.22761-1-crystal.guo@mediatek.com>
 <20250403065030.22761-2-crystal.guo@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250403065030.22761-2-crystal.guo@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 03/04/25 08:48, Crystal Guo ha scritto:
> A MediaTek DRAM controller interface to provide the current DDR
> data rate.
> 
> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


