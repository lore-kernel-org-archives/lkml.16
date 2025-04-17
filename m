Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712CD226D09
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744881593; cv=none; b=KqoelMqyXJ394Yn/y78hl4IZq/C7RqNxXgXCKRMsYsT9wAJT30Z8OBMTjuDRy24UZUamtQKf1sKOkPH9eEZSKg+fANAk/aMdvbAkCBIbvAW1EYppEhKOriGZjtHa+US8hWA+agYpxz0G7yQBcqj19lDwqh+V2CibbPmKUc4/1YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744881593; c=relaxed/simple;
	bh=c0K1k4gi7jfX1LPLyJd3p5I/AEh61IH4LSa4wlMvJUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IU/el2Titm+Nao05S0+G2fNryozk90GXYd6p7WflYAZ1BrNorb4qlLsr7+3+TGAGNOW0NL9tU2HimIwQsHmawL0QwYrLpiFIG7dSQcMIuligri2tAeDRKWGuw5V87RZygIIjmzQPbsCqGBME3xHef3x1EiqC5oi4EWUJfGbr/fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=ILvPd4NH; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="ILvPd4NH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1744881586; x=1745486386; i=wahrenst@gmx.net;
	bh=c0K1k4gi7jfX1LPLyJd3p5I/AEh61IH4LSa4wlMvJUs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ILvPd4NHTUqvn4jX6BiuPY3Wdhu2rZb8a/FCA/uWqO3ldvumTXUJi8/ceSOEa3Ma
	 AqsKAzgPAiDMexFRiX3yJdzN2f4FF7Sx43ZrMTop8mSDiGzVsB9AOxY3Y0Qe3bH0p
	 oJIbDFivbVa6xm8aC5/wHvyqK4U38tUw+Dfw2QRoGSmWgZRQbwZupDTy5/fzw28Wc
	 BhZh+4B3Leifjw94tvgjZkA0VX/n3M0xxEfMyeBuWbl6EJgrVjubSgkOFT1Oogtwk
	 fb6tWcrXdwJpwaHXXq4cLbEl++Fm12a9TJRjlY8H7dtpLKzZJxCpDbbx8wDueU9oD
	 X1zL3pMsJd/GRTgehw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.107] ([37.4.251.153]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N2E1M-1v8cVI1KAw-00wr3I; Thu, 17
 Apr 2025 11:19:46 +0200
Message-ID: <3ef06f75-2d23-4e91-844a-8a388a100f44@gmx.net>
Date: Thu, 17 Apr 2025 11:19:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: bcm2835-camera: Initialise dev in v4l2_dev
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250414-staging-bcm2835-v4l2-fix-v1-1-2b2db9a8f293@raspberrypi.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20250414-staging-bcm2835-v4l2-fix-v1-1-2b2db9a8f293@raspberrypi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:RTadzSC/BD+JD4/BCCr+twSEgPVJvYYZFHRAfrTWL3KAcURI+IE
 Pks8NdY2BQ7VPRzmLlAso3iAxochq6LyFQdyy82ayLRHo4pvmcIhqc+fKI6em+5xx7gwDRZ
 CCPVfR49ShCCGJUbpGbxO/jEjCAF3UnjhYZpAWtqt1/ryX2niweyJ/c/s/+clRJRqU5ENnT
 km0CYrY3p6vHZeQ9ltj6w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TE0kGaXWm/k=;ZBQnvv4X0XzIFLK5WeHqMvXHBa2
 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
 eLES2YiJE42TxE0S9x+dLYIOabbGHcU=

Am 14.04.25 um 19:41 schrieb Dave Stevenson:
> Commit 42a2f6664e18 ("staging: vc04_services: Move global g_state to
> vchiq_state") changed mmal_init to pass dev->v4l2_dev.dev to
> vchiq_mmal_init, however nothing iniitialised dev->v4l2_dev, so we got
> a NULL pointer dereference.
>
> Set dev->v4l2_dev.dev during bcm2835_mmal_probe. The device pointer
> could be passed into v4l2_device_register to set it, however that also
> has other effects that would need additional changes.
>
> Fixes: 42a2f6664e18 ("staging: vc04_services: Move global g_state to vchiq_state")
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
