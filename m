Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110001DFE20;
	Thu, 12 Jun 2025 06:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749708852; cv=none; b=MdXL9Gc6/YLnhmFetp+pCbUKJX6N2oTPVVQWw8iTymXZ+THxHC6yickSbs7r5TLOzqXIKJFk4pa8D+UnXfs+dfj7JPNWgkQkWdl/RpI090wOZfXndQNg+dhVU0xlaKRNCf2pEoN/Qnm4K9muat/uEVHdL8gBUsd5iSe0Jp4JN4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749708852; c=relaxed/simple;
	bh=N1ALVDfrYGPmjOFwwjT7K4Q9Dit3eb5jqKkO8HFS3ho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TrMJq9fL5WMimGxqGh//7obyC3HdPCbg1Z8f/qkcsM41lMWH+4U2uPZOl9wcbTFa55e5kvUZqCC+pjBD80M+Grzfh+IGu97ks2dsEDbzLAYNHE20Ct6wLW1ptCbpyXl6YvxqICP0lQI+dVU4hZG856csyNx6nnJB2E8lUg7HYxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dkNQZqnb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dkNQZqnb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749708848;
	bh=N1ALVDfrYGPmjOFwwjT7K4Q9Dit3eb5jqKkO8HFS3ho=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dkNQZqnbA0YtXKgvELtqrku34gkNoRLMpuyGMJRiyfRmCw9FAK3CQFbIMPnQFdRbq
	 H+ayX4EsvP4Wl/0VEwVWrcX4d11lm7n0GGB8ghIlfvvihLIvNtWsykzloDglB7Yzh9
	 ghOqCt1OrBpTvFwiHXP/faya+GBTwlmexOTXsgTTXc+U40zDeLVms50YRGj3Q+QWqe
	 lmaXpnXZWgoCLuz2uJv80wJMkluBnSabc19H2jMo5CgvoZa3RVV6qdly84uMNiwb9h
	 6FIOlQN3sLnadhBeoLq/VQZTkEnrZwz/vnjBsGT4g5Pxn+Bpu2rWC6LShd4n1h8do+
	 nNti/nXyNiUWQ==
Received: from [192.168.1.90] (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A696817E0FDB;
	Thu, 12 Jun 2025 08:14:07 +0200 (CEST)
Message-ID: <25839448-6307-479d-a6f2-8c3ae03bbfaf@collabora.com>
Date: Thu, 12 Jun 2025 09:13:59 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: usb-audio: Convert comma to semicolon
To: Chen Ni <nichen@iscas.ac.cn>, perex@perex.cz, tiwai@suse.com,
 franta-linux@frantovo.cz, lina+kernel@asahilina.net, livvy@base.nu,
 sstistrup@gmail.com, s@srd.tw
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250612060228.1518028-1-nichen@iscas.ac.cn>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20250612060228.1518028-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/12/25 9:02 AM, Chen Ni wrote:
> Replace comma between expressions with semicolons.
> 
> Using a ',' in place of a ';' can have unintended side effects.
> Although that is not the case here, it is seems best to use ';'
> unless ',' is intended.
> 
> Found by inspection.
> No functional change intended.
> Compile tested only.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  sound/usb/mixer_quirks.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
> index 0769ecd91144..a0ffe8b559dc 100644
> --- a/sound/usb/mixer_quirks.c
> +++ b/sound/usb/mixer_quirks.c
> @@ -762,9 +762,9 @@ static int snd_dualsense_jack_create(struct usb_mixer_interface *mixer,
>  
>  	mei->ih.event = snd_dualsense_ih_event;
>  	mei->ih.match = snd_dualsense_ih_match;
> -	mei->ih.connect = snd_dualsense_ih_connect,
> -	mei->ih.disconnect = snd_dualsense_ih_disconnect,
> -	mei->ih.start = snd_dualsense_ih_start,
> +	mei->ih.connect = snd_dualsense_ih_connect;
> +	mei->ih.disconnect = snd_dualsense_ih_disconnect;
> +	mei->ih.start = snd_dualsense_ih_start;
>  	mei->ih.name = name;
>  	mei->ih.id_table = mei->id_table;


Thanks for catching this!

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

