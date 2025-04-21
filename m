Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C4639FD9
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 02:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745201723; cv=none; b=u3SUqZvw8DAyQM6YMZQQR2XzB86Vb75hr9zVMF0fpjgbyLqJh9INkqScDQ5DKxW3UCvh3n80lPXw7FJ94MNf0x+20mxAUmQ8CFhZbbGaL5ikvqT8pjS+DeHBot3RyxPaZjrlI83Me7E9TEn6ZjCILsRc0KI61enshqU+NnfuODQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745201723; c=relaxed/simple;
	bh=SSzYHzvdWPiC1S20Z/FQZqw5w+ZdGaHQ8jeVsGP8h8E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ycv+JN+/NcsvQRz2bKd0JVEg+M6v4hBPeZbA3fzKRmZjb0g4Pk0EEUYWG1ofelNurJqWJUHodsgruzaEKnPhlQOoA1ruWb6kPUJgvdnM+iAA9oapeyOWDFn/4EkGGmAyfoLX0v5YahfDi62hFvJ1eFg2wWqhAv1qPWMrLC9+jwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mIQHQaN7; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mIQHQaN7"
Message-ID: <4068852f-db8c-4780-a1df-dbbd69f7e526@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745201717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RBMq7xgDK0mfdUWx1cjYpvG3AKniIYiwC4eZ90x1nng=;
	b=mIQHQaN7+2XxyNUF1re4VpBr2wH993eXv3H54uuE/QTuL2amLZb4VWgXtjRTUX6wy/ZfsN
	0UAjBbjhdrNcwdh4WQx4lTXQkYKd9Y+8f3Pqh1gmnuSJz0gRhG9gbbpDoqhXHw9Aebun4a
	9/qd3/pwWLopyqpV8kvN02UIW3CcFtI=
Date: Mon, 21 Apr 2025 10:14:26 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next V2 0/3] net: stmmac: dwmac-loongson: Add
 Loongson-2K3000 support
To: Huacai Chen <chenhuacai@loongson.cn>, Huacai Chen
 <chenhuacai@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Feiyang Chen <chris.chenfeiyang@gmail.com>, loongarch@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Biao Dong <dongbiao@loongson.cn>, Baoqi Zhang <zhangbaoqi@loongson.cn>
References: <20250416144132.3857990-1-chenhuacai@loongson.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250416144132.3857990-1-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 4/16/25 10:41 PM, Huacai Chen 写道:
> This series add stmmac driver support for Loongson-2K3000/Loongson-3B6000M,
> which introduces a new CORE ID (0x12) and a new PCI device ID (0x7a23). The
> new core reduces channel numbers from 8 to 4, but checksum is supported for
> all channels.
>
> V1 -> V2:
> 1. Use correct coding style.
> 2. Add Tested-by and Reviewed-by.
>
> Huacai Chen (3):
>    net: stmmac: dwmac-loongson: Move queue number init to common function
>    net: stmmac: dwmac-loongson: Add new multi-chan IP core support
>    net: stmmac: dwmac-loongson: Add new GMAC's PCI device ID support

> Tested-by: Biao Dong <dongbiao@loongson.cn>

I checked version 1, and no one has signed this tag. It seems to have

been carried out internally by Loongson, and this is somewhat ......


Thanks,

Yanteng


