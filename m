Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E7E3FFD
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 15:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743436005; cv=none; b=boTYuCgdLwVVznVUVpMIbPut7zOyKkz2m98ci9+YJn0UXIZIoEPIE0yAMbm1F4hmiXRfYmNA7CORO6icM601/qFYLoSj3eOVmU52+5KSyguQ7LP40ZvEwMPGVWK4CYLLFUtMy4P6skYpYDQcCyzHPQvcqjQiK/HTD5YrJPTE+Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743436005; c=relaxed/simple;
	bh=BCo29eZfOLEIIn3SiYtAkzbioo1tOxSlpg0KNiOjSbk=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=LgcPgIXx2zvWvCtXXprkZk7VKbw4FPKxXZwcZlYIh78LWowQ7kPjvaRFTU1kw+NVHLaE/+tMW8rh21hrCecx4oyMrfesSWWQaI+mnLtAfLzFeV/h0NByH3AGmPmpCNvtNeKZTfY/audeKsbtSoIkgrbNYK9ZN4IHud4rkgGr6zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=CO99jJ8a; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="CO99jJ8a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743435982; x=1744040782; i=markus.elfring@web.de;
	bh=Kz+gGzeTBo0hUtiidDOMRNHIoPTNB4AIw1KRyjmjNsg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=CO99jJ8aL83kCio0mtJaTU/Fb7x2JEyMPZifOYvjOBSu2y3kM1LvFSPjzyjW1SU8
	 1WUDZvLEKVsLjUy0Nt3W/Ce8muYzqW3Iob9yrqbDeeaPVsiGpdF0h1maGAg1bqnBm
	 WD1exIyUinFyKE2BriodukH3gkUYWpnQlHfHiKjm4+5hbQykTAhwEVAGTo6x1RNzo
	 B/s6KqHpldbz66sBoBf6hpCbYKV7DPrDRZHjA5Ss5Okt3dMhAcCgte+3e9Bopq//3
	 wqa88zvG/OlIrsHsop232taY5iizAcMK1ebhL68IQeyK6vLYF3p0QbV+DTRubkR8f
	 v9VphEnnUzgfUmMUPw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.37]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M6YN9-1u1jFf2SqX-008yog; Mon, 31
 Mar 2025 17:46:22 +0200
Message-ID: <81279dfd-0586-4f12-a3f7-1a4397646d43@web.de>
Date: Mon, 31 Mar 2025 17:46:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Henry Martin <bsdhenrymartin@gmail.com>, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Arnd Bergmann <arnd@arndb.de>,
 Gabriel Somlo <gsomlo@gmail.com>, Herve Codina <herve.codina@bootlin.com>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
References: <20250331151238.13703-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH v2] drivers/misc: Add NULL check in
 aspeed_lpc_enable_snoop
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250331151238.13703-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WfXRpbQOzLQioeHvBg7xpO/cP8XzGV5HOiQ5vEjZppXgQuQv+NL
 n0UTjaqgXwqIyaWmd6UDf7i0nkt57HOEZWSbM1gUxV4lpe9x8GWHfI8bRB5olWjUgs8DHUv
 +llfLsiCShjT6BGwiChGyy2s8fusZf+EhZUxHg+47IfKKnBAkjvCj8DSQ5hDR8d7mWK04jL
 pBG1DiPtekLq029E+oX/w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lsJ+PD8X4Bs=;D0e2zKj0En2tN6ckcoNPqh5XV1G
 /vpeKbTYiO7KLzKRJJNhQRUM8VIuQAyUM4IjGy9ZbCuSt9OKsIK2o0T31dOXZZpNiYcA1GrKV
 R4Sc0eKFEZtTFd8FmgDC3p0SKmqU1tF/gUkQA8AMPqF2kPmWLTUDW4D0e95gVcKokDY413aK+
 kVwY1szVlusUFZ+AvIMoPuRFI3xk3qprKaDt8phq6xoIiBdR6inJPHLmRS9eIj5sX7+NB720x
 lPgoeuexVATcy6c3LD2Z7eS+KDlUSmPyj4UdOLOB0klKvp28VgZmOuC9nyf32Yz0/D/h9Riz1
 FTg7s+FEX5aWftGmzVBIUYWIvda1kKQhJZ3UdBXeSSjsf5mFc11R4btb+ay49EaIhgce4oxTQ
 ZnxUpiPKFGdI7B1Dh+IKOrDNVv1ramBxEHcaaZyZ5NVxbm8Kuh8tFXPS/IOkggH8XCpL8pZZi
 VgCt9RmVvM/LzIq5Mao7nWL4IF6nY0KHd6F5L/4h9xaY0oqKXj5AHE08CWqVZzD8EzZY3IQX+
 8wDVr29m6a+NVZyBSP26Tg0+07wN2znTnPZ1MDdZoCIocXcj23zkJStyJ5ucNYRYkQsz9q0qy
 x2UN3VlRV1Whkfu4Nf9MkxLVV9za1rXcQuBzDpTlHsuQWEXcCSPT6vH2IYmB6DS4GZTKXisT0
 B3ZEd1aUTrSsh+pZt5y2Ly28/ORfgOMwV1LnBcMevKC3tAnjVcEatsgvh5pnmO/OOZnrO6R8X
 1l1+NDIi4I2iPaqg5o+GQM9oE2pAPhOAV4ucJs8PPnqcBI5CHDvFBSIwYBvFoCUoLqgKzJlOW
 EoukVaOFQkV/edbh2ItSatMsqwvAiwZfwHsZVh4ZIdeE+NEy9kMqtwESiAbYSV1pOQiQ2ma9Y
 CbiXBnWdvw1ytxxXsVzwPzMUpUQNGEoWZv1bCtobe4GDadE8z/LD+KUUGiXW4K6sR7/cjR94V
 B4AWozmrMMdFvnI2tiHjgGxWZdv2uB1JBV1OQxp8CvKYF7IHcVDZTI5oNXfhNvuftF1p5WV62
 rzouEuZlC8RRd2gQyLImWlUaVlDkPw7zyBTBBpprky7gntkIqyW+75kMQYsQUdUdlbT4AmPK3
 ul5VUWP0ACQ366fWQkq3kLjTUNohC5EFAvkDCNnkwkUeRTkKtdkYhKYYSMxn+jLM/StSWon/C
 R0JkYGVro+V5cxNnU5M7UWzK0mAgoIMXcH+rAOAKNjXdnjCQ5mBh9RWkuvmAq0kFBqw2OpfwW
 5bojVVD0vJnZ2u/GYgD04fz8csg0NLpGymQLWP4KoPXvdEIJxV+vhHR1SFJuU8nBGAD4kLVml
 tIcOun8bTOlYp+a+PILEiWrbhKuQ0s/Fkki33LGcIGwQeRWPz77AtLZ9DVwMT1iRWYk6E15Yu
 QtYsG2M5NyUsbTsIYhNyZuCIsmkBE8ITUcz4J/XTuX/H0EvhyWAuWVxNeP08KLpVvvfGGSout
 dmwhltLVApxkpDgvlR8NZW39nVvNWjJpdO7Bntz7y8ygJZslAV1ZNaAjdSfjMvuxSb355Ug==

> devm_kasprintf() returns NULL if memory allocation fails. Currently,
=E2=80=A6
                 call?                               failed?


An other subsystem specification might be more desirable.
https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/lo=
g/drivers/soc/aspeed/aspeed-lpc-snoop.c?h=3Dnext-20250331


=E2=80=A6
> +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> @@ -200,6 +200,8 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc=
_snoop *lpc_snoop,
>  	lpc_snoop->chan[channel].miscdev.minor =3D MISC_DYNAMIC_MINOR;
>  	lpc_snoop->chan[channel].miscdev.name =3D
>  		devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME, channel);
> +	if (!lpc_snoop->chan[channel].miscdev.name)
> +		return -ENOMEM;
=E2=80=A6

Can a blank line be preferred after such a statement?


* May the array access be simplified another bit here?
* How do you think about to store a pointer to a corresponding data struct=
ure member
  in an additional local variable?


Regards,
Markus
