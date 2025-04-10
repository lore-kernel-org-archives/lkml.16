Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752C842AA6
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 12:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744288293; cv=none; b=soeGRKHflmfUnff9eTl9QNGteWX6nNbnf3q5xLupYwPkIkCYJ3nsl/bK/bKaal6ec2k0+jor7yo7zHaCtOrGmPwTFhnHgqan2OyxqJFoOsOmNy0q4RKS/pBpZYBmfwP3r6bJFlnc2lf3ufajJ5AmIKk30YnWVJxW/Bao26RPj0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744288293; c=relaxed/simple;
	bh=lFu6YZJlqG8/cTEuCXoGQVAV0K6QPdZaA/cvPy5x+VM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bNGRYmlvbvdaFaU1YnHN3bPsGDqITTxvcfKaiFJqRrFgKgxfuzFQl3cISy62NMyV/VWoaaxGVsWJC5rsESSndgjkVpQFlNaDLx6iO6u1aUXXvbNrEZkKT9eByM8wSQ06rSm6Iy6fQsjd/hjSPDhEFQSdGuHwHJEKyJyr9XCYi90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=eWq7rglW; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="eWq7rglW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=o9HPNqR1NrKG0dCf5Dii/xKrU9j5czgEkK/PmU6NEEE=; b=eWq7rglWRHB3Dafsvs8RgV1Vtq
	KxWLMrUw7CQ5TRJlCg99+cerIZ9xD6vlOeqJMuLwK2bwGMfemDG/sUd8yV3dYRGgMUiF/1vk3PC6a
	q98289wvWL23yAmd+qiDV0t8LqUi4CW/r2UdJFjRu+DJdXDPf6M5U9S1vsJRFs2eNjqmoYb8ifahx
	akCjahrmJIusGXhysJVHZ9UbHL9oitz2OTFqVlYdoL6iJtuA3RkckW8ExmDuk9M9zfceBlWKqAQvQ
	0jgRQlAAOL3EEVsvgfpiN4MEtQ59STnxVpI4eKZMQ5WgTwcDN6xlT3y6541kG1dmruInwIoT7cvNl
	NZZjIXBw==;
Received: from [189.7.87.174] (helo=[192.168.0.224])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1u2r3q-00EfZn-4l; Thu, 10 Apr 2025 14:31:14 +0200
Message-ID: <ee5cbc11-b909-4754-ab62-de9581d9785e@igalia.com>
Date: Thu, 10 Apr 2025 09:31:08 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/v3d: fix client obtained from axi_ids on V3D 4.1
To: Jose Maria Casanova Crespo <jmcasanova@igalia.com>,
 Melissa Wen <mwen@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Emma Anholt <emma@anholt.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250409155504.1093400-2-jmcasanova@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250409155504.1093400-2-jmcasanova@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Chema,

On 09/04/25 12:55, Jose Maria Casanova Crespo wrote:
> The client that causes an MMU error is expected to be reported.
> But in the case of MMU TFU errors, a non existing client

"In the case of MMU errors caused by the TFU unit, [...]"

> was being reported. This happened because  because the client

There are two "because" in the sentence. Could you add an example of the
a MMU error with a non-existing client in the commit message?

> calculation was taking into account more than the bits 0-7
> from the axi_id that were representing the client.
> 
> This patch masks the proper bits to do the calculation and
> limits the returned clients to the expected axi_id ranges that
> V3D 4.1 and 4.2 use.
> 
> Fixes: 38c2c7917adc ("drm/v3d: Fix and extend MMU error handling.")
> Signed-off-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
> ---
>   drivers/gpu/drm/v3d/v3d_irq.c | 33 +++++++++++++++++++++------------
>   1 file changed, 21 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/v3d_irq.c
> index 29f63f572d35..1810743ea7b8 100644
> --- a/drivers/gpu/drm/v3d/v3d_irq.c
> +++ b/drivers/gpu/drm/v3d/v3d_irq.c
> @@ -186,24 +186,33 @@ v3d_hub_irq(int irq, void *arg)
>   		u32 axi_id = V3D_READ(V3D_MMU_VIO_ID);
>   		u64 vio_addr = ((u64)V3D_READ(V3D_MMU_VIO_ADDR) <<
>   				(v3d->va_width - 32));
> -		static const char *const v3d41_axi_ids[] = {
> -			"L2T",
> -			"PTB",
> -			"PSE",
> -			"TLB",
> -			"CLE",
> -			"TFU",
> -			"MMU",
> -			"GMP",
> +		static const struct {
> +			u32 begin;
> +			u32 end;
> +			const char *client;
> +		} v3d41_axi_ids[] = {
> +			{0x00, 0x20, "L2T"},
> +			{0x20, 0x21, "PTB"},
> +			{0x40, 0x41, "PSE"},
> +			{0x60, 0x80, "TLB"},
> +			{0x80, 0x88, "CLE"},
> +			{0xA0, 0xA1, "TFU"},
> +			{0xC0, 0xE0, "MMU"},
> +			{0xE0, 0xE1, "GMP"},
>   		};
>   		const char *client = "?";
>   
>   		V3D_WRITE(V3D_MMU_CTL, V3D_READ(V3D_MMU_CTL));
>   
>   		if (v3d->ver >= V3D_GEN_41) {
> -			axi_id = axi_id >> 5;
> -			if (axi_id < ARRAY_SIZE(v3d41_axi_ids))
> -				client = v3d41_axi_ids[axi_id];
> +			axi_id = axi_id & 0xFF;
> +			for (size_t i = 0; i < ARRAY_SIZE(v3d41_axi_ids); i++) {
> +				if (axi_id >= v3d41_axi_ids[i].begin &&
> +				    axi_id < v3d41_axi_ids[i].end) {
> +					client = v3d41_axi_ids[i].client;
> +					break;
> +				}
> +			}
>   		}
>   
>   		dev_err(v3d->drm.dev, "MMU error from client %s (%d) at 0x%llx%s%s%s\n",

As we are declaring `begin` and `end` as hexadecimal numbers in the
code, could we display AXI ID as a hexadecimal as well? Just to ease
future debugging. You would need to change "(%d)".

Please, don't forget to mention this change in the commit message of v2.

Thanks for your patch!

Best Regards,
- Maíra

