Received: from smtp.smtpout.orange.fr (smtp-23.smtpout.orange.fr [80.12.242.23])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0DA2C9D;
	Wed,  7 May 2025 17:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746638198; cv=none; b=SimvnoTYKme2PtMoC7vDIWBnbcWp7coLQptYK3TuozEkLByZCyHaYCe4AiAduZs3nnh3j1eLlwLzqJB2VMeIl9DHjWlwGwrc1BAoY7kLjQMCrqW2gZfPCrz/aQdNLUG8ySlV6Pb0BpBohSIKXucbiXb8on/jhVpjzu+Pw3I+xaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746638198; c=relaxed/simple;
	bh=ZkVo3XCJP7aTzyXcH76H1fv7+RhSJ+RWRQ4A7ntDDkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nmmJNr859P3MVvQVJZX+Ce6UmxA2qxbO1WQX0NrgJPkv0QDgQ66Q39kszSWPWgbVc6j/GpZk2bs2OMeTuVpnIqYowJuuUVwAdOBOBb6sNYHTMKXVPgN/ngLjdHq20u5DV7VeX0kM10+uROh8/Mpb+e690h9BUqt1cXm6WXc1q60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=CYrxyyYm; arc=none smtp.client-ip=80.12.242.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="CYrxyyYm"
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id CiMZuIeFmUxKYCiMZu1ZE6; Wed, 07 May 2025 19:15:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1746638121;
	bh=+0ykhHojT69RVsplWj2aWmMhC2Tvr/5jv5CrtnYrBuM=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=CYrxyyYmDhGIsB+Jw6pW2GT3o3WBA3xZRhDDOWlq+w59EOAguncrEpZcckWkHXMpQ
	 8QypKOdWozn98LZuru+X1XOqgh5QIErAzwPaU7mdbVpCc7hxUDVKpcwYMqhP2brWVc
	 NZUp4wfr5nvQ/7bZfF2xW1qb5obV9NrK+mUo21+CV71vJIJQBqTs9a+6Y8vhILYFtw
	 nIloVyZ9409AHoETMb7uChjbS2UQlHQZ4zwLLSbmGanux47j0QUs1dl9AwGguNHPdf
	 BqQGXkEgGTm0LYxNPqpZzLQb0FfXBXW4cLDucZ1W74d5g76GRrFIZmdoJ8Xe+1XIGI
	 j0dIfmmtIgbrw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Wed, 07 May 2025 19:15:21 +0200
X-ME-IP: 90.11.132.44
Message-ID: <5ab1af21-ebe4-43a4-bb70-fa25c442e24f@wanadoo.fr>
Date: Wed, 7 May 2025 19:15:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] ASoC: rt712-sdca: remove redundant else path of if
 statement
To: Colin Ian King <colin.i.king@gmail.com>,
 Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250507140907.255562-1-colin.i.king@gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250507140907.255562-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 07/05/2025 à 16:09, Colin Ian King a écrit :
> There is an if/else check where the else part is executed if
> adc_vol_flag is true, this else path checks if adc_vol_flag
> is true (which is a redundant second check) and the if path is
> always taken. Remove the redundant check and remove the else
> path since that can never occur.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   sound/soc/codecs/rt712-sdca.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/codecs/rt712-sdca.c b/sound/soc/codecs/rt712-sdca.c
> index 19d99b9d4ab2..570c2af1245d 100644
> --- a/sound/soc/codecs/rt712-sdca.c
> +++ b/sound/soc/codecs/rt712-sdca.c
> @@ -1065,12 +1065,8 @@ static int rt712_sdca_dmic_set_gain_get(struct snd_kcontrol *kcontrol,
>   
>   		if (!adc_vol_flag) /* boost gain */
>   			ctl = regvalue / 0x0a00;
> -		else { /* ADC gain */
> -			if (adc_vol_flag)
> -				ctl = p->max - (((0x1e00 - regvalue) & 0xffff) / interval_offset);
> -			else
> -				ctl = p->max - (((0 - regvalue) & 0xffff) / interval_offset);
> -		}
> +		else /* ADC gain */
> +			ctl = p->max - (((0x1e00 - regvalue) & 0xffff) / interval_offset);
>   
>   		ucontrol->value.integer.value[i] = ctl;
>   	}

Hi,

apparently the same pattern is in rt712-sdca-dmic.c.

CJ
