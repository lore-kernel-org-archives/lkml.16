Received: from smtp.smtpout.orange.fr (smtp-22.smtpout.orange.fr [80.12.242.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBA51DACB1;
	Mon,  3 Feb 2025 06:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738563829; cv=none; b=GaGv0gAvYqV0IS3Bt4ecY7iLso/RGkc4TUiTmExppcQGj3ibxxs5L+gTIDkfDNsoTcnw81ZxLTdA8+NuSNpd+LeByfTWrGN9wRaWFb+rroBmQrRaqHLQQkxTpLypP3PwsJ2rDud78MOx8ceuJdch2FZ++xOG5EnA/kMCsHY4orQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738563829; c=relaxed/simple;
	bh=VjtBG6ClA73FCQmU6xkx4zbjwLDRbSIzvI+IRDZaUPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AMgGG++hDgjkrq8lZd7xME9MP+ZTi2V2ChkFdYvPKy8eYVDulgWd6vPrAJ0SPvgzX2QHhqlAr2gIpuDHUiipZQkIfQVcpP8q8B18Dx9wh1+W1SeIndH3J212P6kJNP62QXKy34ukSCpPELWF4DWwkGeeTMCQ7lko25i1zUUNb8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=hQhHUkhr; arc=none smtp.client-ip=80.12.242.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="hQhHUkhr"
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id epqrtzu4SUbA0epqutuPta; Mon, 03 Feb 2025 07:22:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1738563757;
	bh=sl39fq1it+zd8XuT1PGqhrbjFQbpNj0qTxM2/DiXRE4=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=hQhHUkhrE6k9S97QNKCd0rOzfcnKrqZE/YGBFMVemREiXr7voV0yRo/R1fLOS2sYM
	 s57FVVNUVRbMWrCMRmhBuPUADjX4CzNbQZnxOTQ0pHsX2+9F7M46/vzoTUx2NzOTYs
	 QiJle4qP2idzvbiT4589PD1ansh1yQU8/bsIV0I9/sYqvxrM7ih7j4FlUmgMU+uVhL
	 K4Hvo2oEfIxaufFY3N4Bu9ondQHdzxnYeiZzDOFVVnGgZBrvB3SDzFpTMPwEkoB4BW
	 qYy/n9hfXJjClnJqrKaxo8+BSlWRHMnIbDTmeSaWZS176lL54GxgSmxvEYghEkQwgk
	 +W/Ck5Pe3Qz0Q==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 03 Feb 2025 07:22:37 +0100
X-ME-IP: 90.11.132.44
Message-ID: <a2e4d538-5406-437f-a09d-0cb811d7d399@wanadoo.fr>
Date: Mon, 3 Feb 2025 07:22:33 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: usb251xb: silence EPROBE_DEFER error on boot
To: Dominique Martinet <dominique.martinet@atmark-techno.com>,
 Richard Leitner <richard.leitner@linux.dev>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250203-defer_usb1-v1-1-f6bba254215d@atmark-techno.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250203-defer_usb1-v1-1-f6bba254215d@atmark-techno.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 03/02/2025 à 07:08, Dominique Martinet a écrit :
> Use dev_err_probe to silence EPROBE_DEFER error on boot:
> [    0.757677] usb251xb 1-002c: failed to get ofdata: -517
> 
> Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
> ---
>   drivers/usb/misc/usb251xb.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
> index e24cdb667307802b9eee856e20744ebf694395e8..ed7c99621fc9af57c988b2298a576248b329ba3d 100644
> --- a/drivers/usb/misc/usb251xb.c
> +++ b/drivers/usb/misc/usb251xb.c
> @@ -637,8 +637,7 @@ static int usb251xb_probe(struct usb251xb *hub)
>   	if (np && usb_data) {
>   		err = usb251xb_get_ofdata(hub, usb_data);
>   		if (err) {
> -			dev_err(dev, "failed to get ofdata: %d\n", err);
> -			return err;
> +			return dev_err_probe(dev, err, "failed to get ofdata: %d\n", err);
>   		}

extra { } can also be removed now that there is only 1 line left.

CJ

>   	}
>   
> 
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250203-defer_usb1-254070d18cc9
> 
> Best regards,

