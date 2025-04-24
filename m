Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274AB2144B6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745480130; cv=none; b=olteuAmMY96EvLh/jn/wGYMCakcPV/nFEgYGn6Kl+61w/k1UtwNSNAuIxm/+YY8zETcQYP5wTuzdyLXMk/gCB82es9dNtBHcLxkfhIR1JfsDkEP6ZRyz6qn7alLsxtbsvr4JnN6wMFv30k2bG8+ZwT0tsanRBaZjeH5q1V3VzQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745480130; c=relaxed/simple;
	bh=T0kwBGjxljasHaaepEeFq7C9uTMkSN2h2iiLB3v6ask=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nSDwOxC2SDTQY7kHWE8OoOSBvQVuDReRkym2A+59lXrTkgI7/iLM+tKTgtgLbdrh1TtRbThxJN6uZiENVUjWKzGfkF6lDpNdEbeYBQO9AQMrv9KoQEdBb62DfIZE1QW5Nk1dZBniICrsDIKFbjMQaG46fBuiL23XgkLD+L7yQa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SGIdEUv8; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SGIdEUv8"
Message-ID: <b2651b9a-694d-4417-ae90-00a4256f9611@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745480124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T0kwBGjxljasHaaepEeFq7C9uTMkSN2h2iiLB3v6ask=;
	b=SGIdEUv8ixPZp7SJPeHj00XJWK5dX4df6qcw+dvgwU5WLKqtNwbeGLyNbJbKAJ08flmTOk
	TdkOPOj6GklqJF1f3tYIgxvabWGeHksCAJctFe5sMWcjU76qWFqMhTstffeef5NXTe9cj9
	D9p/cACXtMvKw+47m3OGBb/u+RJPzC0=
Date: Thu, 24 Apr 2025 15:35:07 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next V3 2/3] net: stmmac: dwmac-loongson: Add new
 multi-chan IP core support
To: Huacai Chen <chenhuacai@loongson.cn>, Huacai Chen
 <chenhuacai@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Feiyang Chen <chris.chenfeiyang@gmail.com>, loongarch@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew@lunn.ch>, Henry Chen <chenx97@aosc.io>,
 Biao Dong <dongbiao@loongson.cn>, Baoqi Zhang <zhangbaoqi@loongson.cn>
References: <20250424072209.3134762-1-chenhuacai@loongson.cn>
 <20250424072209.3134762-3-chenhuacai@loongson.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250424072209.3134762-3-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 4/24/25 3:22 PM, Huacai Chen 写道:
> Add a new multi-chan IP core (0x12) support which is used in Loongson-
> 2K3000/Loongson-3B6000M. Compared with the 0x10 core, the new 0x12 core
> reduces channel numbers from 8 to 4, but checksum is supported for all
> channels.
>
> Add a "multichan" flag to loongson_data, so that we can simply use a
> "if (ld->multichan)" condition rather than the complicated condition
> "if (ld->loongson_id == DWMAC_CORE_MULTICHAN_V1 || ld->loongson_id ==
> DWMAC_CORE_MULTICHAN_V2)".
>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Tested-by: Henry Chen <chenx97@aosc.io>
> Tested-by: Biao Dong <dongbiao@loongson.cn>
> Signed-off-by: Baoqi Zhang <zhangbaoqi@loongson.cn>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>

Reviewed-by: Yanteng Si <si.yanteng@linux.dev>


Thanks,

Yanteng


