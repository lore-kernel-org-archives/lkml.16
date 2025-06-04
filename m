Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D011F2BAB;
	Wed,  4 Jun 2025 17:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749057823; cv=pass; b=qgn0KO3hhPuSQqOadrPydsURCHcwhqJpkjGs93h+LiOQ4WEzoEtpm8jhuADTZi5xhLEyICiHxfT1mCAUNG5buQuJn+7/UOS3y83PQU3vBSA6ExdKGnVHxOqTpsfmBleKiWOy4TmiTvEEYe8RoA034JTGxyxR/mocuZy+/yS76M4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749057823; c=relaxed/simple;
	bh=iHOJUgt7fxQWV5dInB6mTzOoO4KOkNwp408pIZjcSFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UfGNtb8JES1K+GruGG6xdUJFR2HlgF5uchFXTrrfjdRz3HVHfei29ADNlzquT+OcLpaQCXBmSffhA/oI4a3Z2agWPt7bDP2hacIvBI1XcsSjWBq+BSo93yELxNOzRX/SLl+V1hnl1afppaimESKbz14CRq+A0cCdfkWKaZjAxaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=KZiIMS1o; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="KZiIMS1o"
ARC-Seal: i=1; a=rsa-sha256; t=1749057808; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=A+QIc+00sYXg/SVQ9yqTCjNyzvtbNtG0sbZuNlLNxVdKscu83OYg35G5WEToCWPsyn6KEIdDIvjf4SKSN2GwiVCPGeDI5QfyhpPEKujoWbvSBYD+Jmdq10YTdGIJwv+qSPK153ATor163WCgU/s4iQIrSKX6D2HgHH/9u21Mjag=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749057808; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CqhDunc2jVt4krlLrcz24GH9XTmIrYcELdMl5WuaLe4=; 
	b=PyHENpGXf5aUix9EgRTWxA8tIpgqN7d9QFaOtAvAozmO1nqL8nodtTiRmdTefpnXg3Pia4hWBDa0Olkyze+J6aUULxFjRPyXJdHkAyuBZ+1Lg/8joBx0PbgX1HPxXYtn5UJsUICDV+Sxe5NbnQZ7+koiXvGako7SB4LJW1JMNiM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749057807;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=CqhDunc2jVt4krlLrcz24GH9XTmIrYcELdMl5WuaLe4=;
	b=KZiIMS1o1I4zUBAGBnR3QzRAmcnlBGK8YjgIS5uVCH4cd915hgUiauXRVVrQ6TAo
	Mxv6S+HkTte7oshPEV7yy3rgW6bsKFAHITF+Ydq8cj2QPfris3JWEidtR3wdWc5hiwW
	JGyiBTHnB5ED3kKRAjVtA+3uGvPs7AYUqkC8g5Ak=
Received: by mx.zohomail.com with SMTPS id 1749057806578226.7029650221608;
	Wed, 4 Jun 2025 10:23:26 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pei Xiao <xiaopei01@kylinos.cn>
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject:
 Re: [PATCH 1/2] ASOC: rochchip: Simplify the condition logic in
 rockchip_sai_xfer_stop
Date: Wed, 04 Jun 2025 19:23:23 +0200
Message-ID: <5104592.0VBMTVartN@workhorse>
In-Reply-To:
 <81c7955216f5cc7565a396e50e5474ec8f6e3017.1749006565.git.xiaopei01@kylinos.cn>
References:
 <cover.1749006565.git.xiaopei01@kylinos.cn>
 <81c7955216f5cc7565a396e50e5474ec8f6e3017.1749006565.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Wednesday, 4 June 2025 05:13:29 Central European Summer Time Pei Xiao wrote:
> cocci warning:
> ./sound/soc/rockchip/rockchip_sai.c:387:8-10:
> 	WARNING: possible condition with no effect (if == else)
> 
> Simplify the condition logic in rockchip_sai_xfer_stop() by removing the
> redundant SNDRV_PCM_STREAM_PLAYBACK branch. The modified logic now:
> 1. For stream < 0: handles both playback and capture
> 2. For all other cases (both PLAYBACK and CAPTURE):
>    sets playback = true and capture = false
> 
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
>  sound/soc/rockchip/rockchip_sai.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
> index 602f1ddfad00..79b04770da1c 100644
> --- a/sound/soc/rockchip/rockchip_sai.c
> +++ b/sound/soc/rockchip/rockchip_sai.c
> @@ -384,9 +384,6 @@ static void rockchip_sai_xfer_stop(struct rk_sai_dev *sai, int stream)
>  	if (stream < 0) {
>  		playback = true;
>  		capture = true;
> -	} else if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
> -		playback = true;
> -		capture = false;
>  	} else {
>  		playback = true;
>  		capture = false;
> 

You can probably get rid of the locals playback and capture altogether:

    static void rockchip_sai_xfer_stop(struct rk_sai_dev *sai, int stream)
    {
        unsigned int msk, val, clr;

        msk = SAI_XFER_TXS_MASK;
        val = SAI_XFER_TXS_DIS;
        clr = SAI_CLR_TXC;
        
        if (stream < 0) {
            msk |= SAI_XFER_RXS_MASK;
            val |= SAI_XFER_RXS_DIS;
            clr |= SAI_CLR_RXC;
        }

        regmap_update_bits(sai->regmap, SAI_XFER, msk, val);
        rockchip_sai_poll_stream_idle(sai, true, stream < 0);

        rockchip_sai_clear(sai, clr);
    }

but this in general makes me suspicious of the intent of the code in
the first place. Playback always being true and capture only being
true if playback is also true seems odd. Checking the callsites of
this function confirms my suspicions that while this fixes the cocci
warning, it just means the code is now intentionally broken.

This here may be closer to the original intent:

    static void rockchip_sai_xfer_stop(struct rk_sai_dev *sai, int stream)
    {
            unsigned int msk = 0, val = 0, clr = 0;
            bool capture = stream == SNDRV_PCM_STREAM_CAPTURE || stream < 0;
            /* could be <= 0 but we don't want to depend on enum values */
            bool playback = stream == SNDRV_PCM_STREAM_PLAYBACK || stream < 0;

            if (playback) {
                    msk |= SAI_XFER_TXS_MASK;
                    val |= SAI_XFER_TXS_DIS;
                    clr |= SAI_CLR_TXC;
            }

            if (capture) {
                    msk |= SAI_XFER_RXS_MASK;
                    val |= SAI_XFER_RXS_DIS;
                    clr |= SAI_CLR_RXC;
            }

            regmap_update_bits(sai->regmap, SAI_XFER, msk, val);
            rockchip_sai_poll_stream_idle(sai, playback, capture);

            rockchip_sai_clear(sai, clr);
    }


Please let me know whether this looks right to you.

Kind regards,
Nicolas Frattaroli


