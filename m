Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941BA2836A2
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 12:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744288884; cv=none; b=Cvab3TxWcqmpi+eUCy0h8sOzjFv60gJr9I32bvKD9Qkx4bynQ8QzNd/DxwNliDnVFkezZ7FzxGLS4QDf5aZc78acSmC/RTK1fY8PFFTm3eXFf0ZHWtxQLEP/TLy0b94HBxy/fcqdwStPIFcp8P6qfrnultGaTUnoxlZGckY2Iuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744288884; c=relaxed/simple;
	bh=vXo5SCRGvexplMvukNA1r/KMPn+5HrNJhleiCwCZ4Bc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jaSJOmz1Xz/oQI6ufWEPGu80gNEfO+IZXwRuSVSTjvJNJMEgk3TSGEDkEiY/NyG/MiBpKRbq3uhRPnI42olUartW39/AuorikLBGuQQREnyPlnU4oBeuycnMOp/k/Zqabe1neeaW7PAMEF517CuKNjC4tnRRso+866eZtEVrCfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=jth3yJzn; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="jth3yJzn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qB4lpthXKMSgJMw0P+6qUIV90NCE2Pz6tBeYRSKcISc=; b=jth3yJzn1/mR6XgSKCon5hJeLL
	wyOn/x+v+tJw5lqtXGOOU0+af+/e2Q0xN2RCGzZBAg7OnctNRAoj3BMJD69HDgxx//fcrytxxHUaK
	OC7WE2En/XcXD9KmHH7ZbBQbk6bi/0+KRyJvoGYFcu6GxK0GzMvvD/vIvIlYz3F80QSp3wd7/Zjmk
	VAg8I2RQxgyXfb44D0zzZa7eHCe1E0izaoeYg1XbYlnfkUhzdGpOGgQeHuUOqAY9jy9+AunpHbvSE
	sDY2IAc46mmTVKN6pMMyLqE77PY5dGV9z9XlmQi+4NEgEQY9UzuEhjB5gPAjue9fiEsUy5DtpY4j8
	P5N0lUkw==;
Received: from [189.7.87.174] (helo=[192.168.0.224])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1u2rDO-00EfkZ-Mb; Thu, 10 Apr 2025 14:41:06 +0200
Message-ID: <efbd7d18-1cd2-4eb9-b504-c4a75370843a@igalia.com>
Date: Thu, 10 Apr 2025 09:40:45 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/v3d: client ranges from axi_ids are different
 with V3D 7.1
To: Jose Maria Casanova Crespo <jmcasanova@igalia.com>,
 Melissa Wen <mwen@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250409155504.1093400-2-jmcasanova@igalia.com>
 <20250409155504.1093400-3-jmcasanova@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250409155504.1093400-3-jmcasanova@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Chema,

On 09/04/25 12:55, Jose Maria Casanova Crespo wrote:
> The client mask has been reduced from 8 bits on V3D 4.1 to 7 bits
> on V3d 7.1, so the ranges for each client are not compatible.

s/V3d/V3D

> 
> A new CSD client can now report MMU errors on 7.1

How about "On V3D 7.1, the CSD client can also report MMU errors.
Therefore, add its AXI ID to the IDs list."?

Note that a commit message should use the imperative mood:

"Describe your changes in imperative mood, e.g. “make xyzzy do frotz”
instead of “[This patch] makes xyzzy do frotz” or “[I] changed xyzzy to
do frotz”, as if you are giving orders to the codebase to change its
behaviour." [1]

I miss such imperative description in this commit message.

Also, you could add a "Fixes:" tag pointing to the commit that
introduced V3D 7.1. This will allow this commit to go to the stable
trees.

[1] https://docs.kernel.org/process/submitting-patches.html

> 
> Signed-off-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
> ---
>   drivers/gpu/drm/v3d/v3d_irq.c | 21 ++++++++++++++++++++-
>   1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/v3d_irq.c
> index 1810743ea7b8..0cc1c7e5b412 100644
> --- a/drivers/gpu/drm/v3d/v3d_irq.c
> +++ b/drivers/gpu/drm/v3d/v3d_irq.c
> @@ -199,12 +199,31 @@ v3d_hub_irq(int irq, void *arg)
>   			{0xA0, 0xA1, "TFU"},
>   			{0xC0, 0xE0, "MMU"},
>   			{0xE0, 0xE1, "GMP"},
> +		}, v3d71_axi_ids[] = {
> +			{0x00, 0x30, "L2T"},
> +			{0x30, 0x38, "CLE"},
> +			{0x38, 0x39, "PTB"},
> +			{0x39, 0x3A, "PSE"},
> +			{0x3A, 0x3B, "CSD"},
> +			{0x40, 0x60, "TLB"},
> +			{0x60, 0x70, "MMU"},
> +			{0x7C, 0x7E, "TFU"},
> +			{0x7F, 0x80, "GMP"},
>   		};
>   		const char *client = "?";
>   
>   		V3D_WRITE(V3D_MMU_CTL, V3D_READ(V3D_MMU_CTL));
>   
> -		if (v3d->ver >= V3D_GEN_41) {
> +		if (v3d->ver >= V3D_GEN_71) {
> +			axi_id = axi_id & 0x7F;
> +			for (size_t i = 0; i < ARRAY_SIZE(v3d71_axi_ids); i++) {
> +				if (axi_id >= v3d71_axi_ids[i].begin &&
> +				    axi_id < v3d71_axi_ids[i].end) {
> +					client = v3d71_axi_ids[i].client;
> +					break;
> +				}
> +			}

What do you think about assigning v3d71_axi_ids or v3d41_axi_ids to an 
temporary variable and move this loop below? Something like,

if (v3d->ver >= V3D_GEN_71) {
	axi_id = axi_id & 0x7F;
	v3d_axi_ids = v3d71_axi_ids;
} else if ... {
	...
}

for (size_t i = 0; i < ARRAY_SIZE(v3d_axi_ids); i++) {
	if (axi_id >= v3d_axi_ids[i].begin
	    && axi_id < v3d_axi_ids[i].end) {
		client = v3d_axi_ids[i].client;
		break;
	}
}

Best Regards,
- Maíra

> +		} else if (v3d->ver >= V3D_GEN_41) {
>   			axi_id = axi_id & 0xFF;
>   			for (size_t i = 0; i < ARRAY_SIZE(v3d41_axi_ids); i++) {
>   				if (axi_id >= v3d41_axi_ids[i].begin &&

