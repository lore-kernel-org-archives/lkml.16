Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAE728B50F;
	Tue, 15 Apr 2025 10:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744711240; cv=none; b=mo9inteVqIBLp73NNzI4YVB95eA9MTz4GX1xCPtgadoEIs8lHiwo3EUC6ROcYUONNjP5HWKq9j9Goo9w4gFwXr7V4miv4dSPTtX+pxSFpeDJrzyG4w9SMN2jJmVxZyYtS2odSRp83QzavunRhR6acDio376u06B7rEOg1uXpa6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744711240; c=relaxed/simple;
	bh=08TL4SS2+6GWfQSTEv2kwM+pgCTVaW5hTA0mO6S727Q=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=ng5Xl6gKgq3LLkqYhUufjTD/tX9d62C+fC5y32dRjVSFJeDrf/xDHJSW1wWCrhwhDIDndpS5kCSiMQNpotMEnH4zRd24M4Lml9S9SY5ukniev486ssG/Reu+SOyThkA66UE76g+oimyL2lHBaOIGQGRDAanbkqwbd9IdA13aEf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=uwPlq/aL; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="uwPlq/aL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1744711234; x=1745316034; i=markus.elfring@web.de;
	bh=S5mNvVXjKkJ12rIn2tNOFtuCU9yqIRd6dSBd1W6Yrfg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=uwPlq/aLEn53n8K+E1uiSBcdWZkKeF2+6Xuuh9t/JEQBpqfQhF3BmVSYJ/O1Pexo
	 ynmb7zfJ0xXrhvKwWChSb8AH1jwJ25JDGs2pY2RjSB5Cy/ysyFi2+KTQl1MkrpsSe
	 KKG0KyKlojyngqUnpEpbGeSUP2z75gsIXceOuqbTQ5fgIDElFG0IvphYTWHiFHghc
	 Q2pz/3JoDVUZZ6gV37urJe5+RDXH4hfOLEKmv0GOr9+77bqt3F3/Bj/Rs7izsO4FE
	 e7SpJyq4LRLb/G5uIp9WjrAH2LwyRZcQPsFGTZ6jDliTvYJYjFeDt4FSDZXtIXWnl
	 k0AaIdjaRp1Iq8zUQQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.24]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N6sBv-1sxEbd32rv-00wbeV; Tue, 15
 Apr 2025 12:00:34 +0200
Message-ID: <18278ed3-fef0-400d-8cba-72f4c573d7ee@web.de>
Date: Tue, 15 Apr 2025 12:00:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Johan Hovold <johan+linaro@kernel.org>, linux-sound@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Rosin <peda@axentia.se>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Takashi Iwai <tiwai@suse.com>
References: <20250415074145.7202-2-johan+linaro@kernel.org>
Subject: Re: [PATCH 1/2] ASoC: codecs: wcd938x: fix mux error handling
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250415074145.7202-2-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bV3a5Af0//7Zn4s1ectj525pv6i9ZRzEE4KD+t3wR/q7f8yoK5L
 UWrE8J4QuRGOQnso/W5Tm/W+FX2c6X7mvGHTy54F+ZtcMBCMz30pFuMt7McOFqe1g0qLqgt
 Auk5GMhdWRLzgBq8EfCfrMmxJbdLFR8tGR5FnlPNdz86jP4l6jvj7VNi5SFYFVWIe6kuB/k
 oOfOIchFcVbShnkwaFH0g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nzoneqmzBsI=;mUWWbxGqcMEaBCwrz0zN8mfIZs9
 XVgZ9LOqpgwBkaOuoiGtPRYilieqiUJHa1Z+8uAYmkQTVLmu98UFL/Gd82mpI9B0Xapp7w5+M
 rpDlRcVArxwE297z9x6ZnBjkJFd+FIeFVofw16+fKHEwH15SBF65Ym7phnxW3bYK6bGicwlVG
 0Kca/Y8CQsh6nPCVPFUegdR8r5g2t5m6ahqqQZneSEBwYZgxbyUmUx/Tgcn/32AqZInKzAWxg
 sj17D54DmzYplxWGPw0/GEok2Y1TKW+Gqq5/Iheywfv/XDwtoZcBDuzmos7jTaSqwGtu0uzO8
 N5GYYQuHrMDcNrl2Y1EbnrRYtpGS0o8d4+HQA2zUuZeZxxvtxlTfRRW5eTMik3rusXGqqrSL5
 0CNQKPlmc6r7k+wSy6SGV+P/Ec3t7OJf5ca3wIcbjAYY+Bgp/0HSxyxKc1zNXYql/im6i0Kcr
 6UUwLia1diK0vnm2pvolaDPOU6QzXQ4KSWVMvyPDAD36XKc+xbvxKTNmufoq3RE2t6gdJ2pi2
 wF+QFPqahfbSjsFP4p5ejScJPZIJf86euoACn9wge5TqjGoXp0BnCriXpaOWYPOzsVXctByPG
 KNEksazaeGnFxFYIa1Uz5bx9U/KHh5sP6RUGJc97uPHMBftt85YwS3XwMfba4GMLW0b2UemWR
 T/AbgY2U2IZpKmXLp3s6C3o4q7f4zZi0KuaOJvhQzhBO2248+ycEwcDDSrV4zF3qF6kU1Jgu3
 EZHBYuI0wjr97D/xujUEldkOV4GEpRcFQ3vnwD2h/vKAAoJfJy+NFM5spz2sTH+aEPbNtiE/F
 Clw+o/71HYcr42xU0OPEC9VIFbkafNxv6GM8HUx7b4rc/ZgvsGYuPAkuhtW8Wdlhas1t4E+34
 apN0mOZD2T2E/7pmzwz+F3081bnRlQQ8K1/i3y+s8Go4FbYwRav/IoEqAX+IWMfjPUWRv2yRY
 7X/5GQEtXIEQihcGk52/BNkQj0lyylkc7KNyAyZJ0drHqOS0ToV/OvmgZRtlA1xB1tHlKh8vt
 LgXvsO2BqqdxFF6Y6ZzHQn5v7YaeCMo4ayg0AQFQYQWppo/vWbnFM/4z5JGxGhqnKx55KioSS
 RQ2tztnt0LXZH1W0xh3GPbYJdExU6DGn9t0gIkFa/fo7OTFXVg+huJ/dQw6T6k3tMAA2BvfWw
 OXiDiQB9sOJHh7EUTYHcl4oOndTYVpkmkAh5Vxt3xMujzjlZqAbnuliHYpL/lhLAdkfon3KsH
 o4BTFR8ImskHXGXdaQLYYE6GKcczvuA2VEb7zt4TKdLSvV0TPH37NctP9W0w9p8YKH0h2HSR3
 +Ppvq+eTc3XV7Tj3BX7KMu8H0GeOGYlB3XJLd5kVUsNaXb/2NldHOAt8zqjrnolqCQo19JBwA
 t5zxS6p3hlkwLaxFpEATn0cQdcEJbkvh1FS+oSg/I4hXXxHMmTRMiHg/AqtUjiqgO1EQtdbGy
 yOFtzWYagcb3c73wN/Fr2iQ4m60XG5XZtvTz2Qnvsg0nBdKqgcpPJmmaNsBaWt16/NZH6fw==

=E2=80=A6
> +++ b/sound/soc/codecs/wcd938x.c
> @@ -3271,18 +3271,13 @@ static int wcd938x_populate_dt_data(struct wcd93=
8x_priv *wcd938x, struct device
>  		return dev_err_probe(dev, wcd938x->reset_gpio,
>  				     "Failed to get reset gpio\n");
> =20
> -	wcd938x->us_euro_mux =3D devm_mux_control_get(dev, NULL);
> -	if (IS_ERR(wcd938x->us_euro_mux)) {
> -		if (PTR_ERR(wcd938x->us_euro_mux) =3D=3D -EPROBE_DEFER)
> -			return -EPROBE_DEFER;
> +	if (of_property_present(dev->of_node, "mux-controls")) {
> +		wcd938x->us_euro_mux =3D devm_mux_control_get(dev, NULL);
> +		if (IS_ERR(wcd938x->us_euro_mux)) {
> +			ret =3D PTR_ERR(wcd938x->us_euro_mux);
> +			return dev_err_probe(dev, ret, "failed to get mux control\n");
> +		}

May the error code assignment statement be omitted here together with extr=
a curly brackets
(as such a case is demonstrated in a subsequent if branch)?

+			return dev_err_probe(dev, PTR_ERR(wcd938x->us_euro_mux),
+					     "failed to get mux control\n");


Regards,
Markus
