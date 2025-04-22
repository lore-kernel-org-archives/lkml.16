Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57DF28A41F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 14:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745332674; cv=none; b=Fn69Zp66caBOPMhoGm+upQ8snJZIbZR19JDjRgkCqra88ZPisLz37h9J6WWiY37zUJ0HjGSDUAf2bu0lJA/y5iPR6UPYmud8feqNqmpDjiEHwIgjB0fAyXxxfZ9/zagfa5nw6z8KVnOyooiGhPDTAxYumFJj6Mzom0y/dQzc2VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745332674; c=relaxed/simple;
	bh=XOcO0ArbH6Md0k0EPnq4IKHD3/xoAvNCfcUCHuD0Lws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l5yAqKlmjR5cyg/v5li98M5S2Rci1PUEP85yd1hOpByv/+M5oXce66/t3qDjbzEZiKUuZpxM4XB5pkcuraHD0p6FKu7Ddl0X8/TXYUvj7waczEzxFEfF6PKIq3uTyhA5ut91Bpb4vAkljzN69rtgUdrbeYPCOmm4EBISBxR2SIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WGoliEGE; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="WGoliEGE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745332670;
	bh=XOcO0ArbH6Md0k0EPnq4IKHD3/xoAvNCfcUCHuD0Lws=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WGoliEGEinb7je8e2k53/89bUcia/ONf19VlR/muqYxTJvQTIpPn7RU2kAS8IalBX
	 HBqTxt+Qx32P314ouKFeYlltDVmGzmuZ7RmrljJWQ5o3SJpNS1g3sQMr5YgdXXrOO3
	 jAndt9N4QgD+4RUORgHHvMdzO+k92cibpsrQQjbEYgtvAkXXinhB0O1Cj6lPySGthF
	 dUU4nt1V1QZUmkxNDA/bWDRNyYLzVdrpfno0a4sVFS46IHN053wJhrrVzTz8GAYDNN
	 Z9JsT2e7GhQrZGnqjia9T61x0O81msR8JIvID24EoOIi5KOB2czovYPihFUKLgKbbM
	 Sp6TzP4SRoNcA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 607EB17E0CAB;
	Tue, 22 Apr 2025 16:37:50 +0200 (CEST)
Message-ID: <28e3f91f-a786-4ec6-ae70-bd92c11be81a@collabora.com>
Date: Tue, 22 Apr 2025 16:37:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] media: mediatek: jpeg: fix buffer alignment
To: Jianhua Lin <jianhua.lin@mediatek.com>, mchehab@kernel.org,
 matthias.bgg@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250418032559.31043-1-jianhua.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250418032559.31043-1-jianhua.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 18/04/25 05:25, Jianhua Lin ha scritto:
> From: "jianhua.lin" <jianhua.lin@mediatek.com>
> 
> The JPEG encoder image stride register must be MCU aligned.
> For YUV422, it's 32-byte aligned, and for YUV420, it's
> 16-byte aligned.
> 
> The minimal DCT block size is 8x8, so the vertical buffer
> alignment for YUV422 is 8-byte aligned, and for YUV420,
> it's 16-byte aligned.
> 
> Signed-off-by: jianhua.lin <jianhua.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


