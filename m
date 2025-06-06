Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684B3191F7E;
	Fri,  6 Jun 2025 09:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749203353; cv=pass; b=cGyE+YzEfxMsU8WqUmhh3GcjlhmDjs7wxUpSHUyGc0KCA514mGbth/RaKN0mVXQ+zU6Bu9FsNUNYfM5PP/rqwuhlOMDxkb5MhIXvvh61RjB69UZTOSVSEEUhqD5KmMf4RlZtvy+mUY+dYdIrxRUfsARv/PLHJ/P2P4jNbsvbNoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749203353; c=relaxed/simple;
	bh=ufQdgJJ8ELiGvRLyctLyDxDULThwCFQ5M0s2dHp5WcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=evxLqmH9vtNp39RF1DNMtcyryPccZW12xxtHqtrfbhMTCKfcZLqyyRQdZPHqlWiJ38p/n67Od8WhdWdhx2S7iFcrny5eLT3lU1u4Yq4999+Md3RTlU7PbQAanX3uSuBAKQ4dGYLz+Mwki3O1NEZgvIkJ4HkhAY+IFcmO9YZtp2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=AXrT3X/g; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="AXrT3X/g"
ARC-Seal: i=1; a=rsa-sha256; t=1749203325; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BDRQhUXbZUXBzSw5etuAVJudYAJv3trPbVEKVW6rlGrgnN2e08Az+GzLRKwRLQdkcFR7fOyxG9ejgamyeLed2xLloQDaL7Tj4xkzuxHsT1U4x4jtQoA050uUt3/9O/uIALARzVrZGsXqwm6Snm/kIao1kEYs0Qvi3mfNjtDFCSQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749203325; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pOMikGDm0MmBx1ffFfqI8HnHprOULeEnm50fJ4rduiM=; 
	b=OuYOkQ9JUvFU83oyRWnXcQMzx7c4joJcXfgHpBqS5d05ixiVEmg0hDqHLMfvCSdHv63o8X7iWYPBOVVzhk1JR20vnJlxODrToAaQWK1QowIlGwo+dp10ALfOvcP/mwK41OYAJiNtA2gXQDfdfaN2U98I06l4YnCZ5jTFDi5epzk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749203325;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=pOMikGDm0MmBx1ffFfqI8HnHprOULeEnm50fJ4rduiM=;
	b=AXrT3X/gdWM3d/al73oHTm1DN8lTjiDmui1fUMKEtuAgJ8VTAhcjSRq1wH5kJy1D
	i6TL+OWL3LgzNr/iD08U06uj/1K7RrfU3lipLp0BRWmhtFqYTQ7OmYX+ir8o+VVQ+8B
	RMNAI2YuCzcS8ffKZTdwWX4K7unjDiVoAPnTqY0M=
Received: by mx.zohomail.com with SMTPS id 17492033238565.683996663710104;
	Fri, 6 Jun 2025 02:48:43 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 heiko@sntech.de, linux-rockchip@lists.infradead.org,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Pei Xiao <xiaopei01@kylinos.cn>
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject:
 Re: [PATCH v2 1/2] ASOC: rockchip: fix capture stream handling in
 rockchip_sai_xfer_stop
Date: Fri, 06 Jun 2025 11:48:38 +0200
Message-ID: <9468228.NyiUUSuA9g@workhorse>
In-Reply-To:
 <c374aae92c177aaf42c0f1371eccdbc7e9615786.1749201126.git.xiaopei01@kylinos.cn>
References:
 <cover.1749201126.git.xiaopei01@kylinos.cn>
 <c374aae92c177aaf42c0f1371eccdbc7e9615786.1749201126.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Friday, 6 June 2025 11:18:21 Central European Summer Time Pei Xiao wrote:
> Correcting the capture stream handling which was incorrectly setting
> playback=true for capture streams.
> 
> The original code mistakenly set playback=true for capture streams,
> causing incorrect behavior.
> 
> Fixes: cc78d1eaabad ("ASoC: rockchip: add Serial Audio Interface (SAI) driver")
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---
>  sound/soc/rockchip/rockchip_sai.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
> 
> diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockchip_sai.c
> index 602f1ddfad00..916af63f1c2c 100644
> --- a/sound/soc/rockchip/rockchip_sai.c
> +++ b/sound/soc/rockchip/rockchip_sai.c
> @@ -378,19 +378,9 @@ static void rockchip_sai_xfer_start(struct rk_sai_dev *sai, int stream)
>  static void rockchip_sai_xfer_stop(struct rk_sai_dev *sai, int stream)
>  {
>  	unsigned int msk = 0, val = 0, clr = 0;
> -	bool playback;
> -	bool capture;
> -
> -	if (stream < 0) {
> -		playback = true;
> -		capture = true;
> -	} else if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
> -		playback = true;
> -		capture = false;
> -	} else {
> -		playback = true;
> -		capture = false;
> -	}
> +	bool capture = stream == SNDRV_PCM_STREAM_CAPTURE || stream < 0;
> +	bool playback = stream == SNDRV_PCM_STREAM_PLAYBACK || stream < 0;
> +	/* could be <= 0 but we don't want to depend on enum values */
>  
>  	if (playback) {
>  		msk |= SAI_XFER_TXS_MASK;
> 

Tested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Acked-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Thank you!


