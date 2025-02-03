Received: from smtp.smtpout.orange.fr (smtp-18.smtpout.orange.fr [80.12.242.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACA535970;
	Mon,  3 Feb 2025 06:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738563656; cv=none; b=UQxi1vbVPoxHrgNPWsjLspgNSKeq1pfLLgO5DpVOeLDj+mHSvuyRr2IWNeKsvv/S3p43Cg7tlwxEU89VD5gEUphaVCDDfbLkroxrILxsT83pDMre2YaLuVZxD70HqeQNfMNN+jzGIpKDT9tzxSWbhUpn2tmycSb7uS1vmsWLs4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738563656; c=relaxed/simple;
	bh=qkYHmKoU81b84qf13rk5eRh/TgqZqsKeDH8E3hZGcYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NIsvNX8YZS+Da7knqz+LAJt6m0BSRbsCmbupfQmg3AvwhbLSr2J01rRg1FRJv1UgYLBYH83IrrKvl/uARfzFU5bNqXx4h8r8hYLBqkBYhAq+mkCwifqZiTxJt75qqATE8Fxdw32JjiV7Y4BDAAYyMLdVYOSZ1bzxQWPdSKIwdAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=F1mHMOgw; arc=none smtp.client-ip=80.12.242.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="F1mHMOgw"
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id epp8tHsniiSnFeppBt1BnS; Mon, 03 Feb 2025 07:20:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1738563650;
	bh=2WMsab5oDn/iwfS5/+y8gS3zNOhGLIdC39tlIi+T2LQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=F1mHMOgwXL0J4DDyYUryCkGAJIrP5eEjce7lRs8B6Jf3XgtkJPzk5Cldb75KKkhkx
	 M7IRWFPDkAXSNMgtwpvXK6orAMFtRe8WTY25WcMtGnKLw/FKQboAyYD0yE8AIFOaKH
	 l6eRxGCqrRYRJ22Xwvs5EFtti+9eU0Lbvxo5Qwhbpw0YTaLjCkM8rTXc9lbWIH7FxK
	 slq/f66tlmQdcFKpmqlAIjaLugGq9RKSh5zU8FK4oMzmMcPn4cYMCciSmUt59AQP4M
	 JqhGZXWw53e7IORdLxWTRRCyUwe4y0MUbV8U+YEqSONSStGyKgnfvvknmalgKCzcAO
	 fSIeNhRfXSKeg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 03 Feb 2025 07:20:50 +0100
X-ME-IP: 90.11.132.44
Message-ID: <be00d750-ca90-4655-9b0b-e43bb83aeb01@wanadoo.fr>
Date: Mon, 3 Feb 2025 07:20:45 +0100
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

: %d\n", err should be removed now.

The error code will already be added in the message in a human readable way.

CJ

>   		}
>   	}
>   
> 
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250203-defer_usb1-254070d18cc9
> 
> Best regards,

