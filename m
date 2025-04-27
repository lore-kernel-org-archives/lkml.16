Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB081F941
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 18:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745777794; cv=none; b=iq6zCczolS8fmH0JOZTrTr9KxnHTBNrt7/ClOdIVi1IJ9BPtfRrN5nJ0cqPpQ7atTZjhbZOMfWjBoFsFWKIVU1qabomnde89Te0xnPkPJoEDdm/zxWS8tsDvRSX651KnOfvGX2BBi5SUz4bwu6OnVmOXf+tbsYj86HkW89GWxto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745777794; c=relaxed/simple;
	bh=SLXSdmYtaQdrDl5nFr9zrm/SDTP1AznQWipUnb1xqos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vb62lxTKmFNkJPEusQ9vrbVzdi4gHw9rEYjsnuRcwezDKVlx2vmt5mIVS00jRasfrPK+8qYCTyyYFFiz9pkyZjbHYEXB9bpUgTG1/dOW0+aFYzqOn33cmFZub3Ns15kJuH9qB8x3hmSwU7c/7KLe5LV5X+8FBThKgFTqcN9RjDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=o1oC1KPl; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="o1oC1KPl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oOp6JjE1KZO09/VU6qzNCwl2fuAmGNH2bQ434dB2dYU=; b=o1oC1KPlAbmycOQ7LS3gkDNs3w
	JUAK0/38O+iluhV1LWJJumki/+TiMwmrv3Uja9NrZIUAookzRIyAZooxqgBms70e8wpv9RPAQBgME
	9Ee5TsvAJnaODl5huGY60rjGElyubm8VUNDJW3hl6n5CUry9xq5U2w7+m464MBDW6FD6BfLrr37u2
	97UCCiy72YOpTIebYn+5hsM/cJEBNbRHCmT05zwLX8byz6qQ2+rJ4XfqnUnpmvyPbBI1PRaBlSbQd
	ZAx0IDFUPtUs8CHgzEdXyFZsaqxOvrEvoGol0TJjv4w0qJIuMc594f+Hf47S56FUJTxwOsThJVnoC
	C32R+Ylw==;
Received: from [189.7.87.174] (helo=[192.168.0.224])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1u96Y2-009Spi-DK; Sun, 27 Apr 2025 20:16:14 +0200
Message-ID: <c3e4e3e6-51b4-4cad-b81f-5841e74ae659@igalia.com>
Date: Sun, 27 Apr 2025 15:16:07 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/v3d: fix client obtained from axi_ids on V3D
 4.1
To: Jose Maria Casanova Crespo <jmcasanova@igalia.com>,
 Melissa Wen <mwen@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com
References: <20250425122522.18425-1-jmcasanova@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250425122522.18425-1-jmcasanova@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Chema,

On 25/04/25 09:25, Jose Maria Casanova Crespo wrote:
> In the case of MMU errors caused by the TFU unit, the
> client that causes the MMU error is expected to be reported.
> But in the case of MMU TFU errors, a non existing client was
> being reported. This happened because the client calculation
> was taking into account more than the bits 0-7 from the
> axi_id that were representing the client.
> 
> [   27.845132] v3d fec00000.v3d: MMU error from client ? (13) at 0x3bb1000, pte invalid
> 
> Masking the bits and using the correct exi_id ranges fixes the

I changed s/exi_id/axi_id before pushing the patch.

> calculation to report the real guilty client on V3D 4.1 and 4.2.
> 
> Make the MMU error print axi_id with hexadecimal as used in the
> ranges.
> 
> Fixes: 38c2c7917adc ("drm/v3d: Fix and extend MMU error handling.")
> Signed-off-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>

Applied both patches to misc/kernel.git (drm-misc-next).

Thanks for your patches!

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/v3d/v3d_irq.c | 37 +++++++++++++++++++++++------------
>   1 file changed, 24 insertions(+), 13 deletions(-)
> 
> Changes in v2:
> - Now axi_id is showed in hexadecimal in error message (Maira Canal)
> - Improved commit log description with error example. (Maira Canal)
> - Fixed typos in commit log (Maira Canal)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_irq.c b/drivers/gpu/drm/v3d/v3d_irq.c
> index 29f63f572d35..d6ce1324905d 100644
> --- a/drivers/gpu/drm/v3d/v3d_irq.c
> +++ b/drivers/gpu/drm/v3d/v3d_irq.c
> @@ -186,27 +186,38 @@ v3d_hub_irq(int irq, void *arg)
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
> +			size_t i;
> +
> +			axi_id = axi_id & 0xFF;
> +			for (i = 0; i < ARRAY_SIZE(v3d41_axi_ids); i++) {
> +				if (axi_id >= v3d41_axi_ids[i].begin &&
> +				    axi_id < v3d41_axi_ids[i].end) {
> +					client = v3d41_axi_ids[i].client;
> +					break;
> +				}
> +			}
>   		}
>   
> -		dev_err(v3d->drm.dev, "MMU error from client %s (%d) at 0x%llx%s%s%s\n",
> +		dev_err(v3d->drm.dev, "MMU error from client %s (0x%x) at 0x%llx%s%s%s\n",
>   			client, axi_id, (long long)vio_addr,
>   			((intsts & V3D_HUB_INT_MMU_WRV) ?
>   			 ", write violation" : ""),

