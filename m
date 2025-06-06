Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF2836D;
	Fri,  6 Jun 2025 21:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749245164; cv=none; b=Thxkqsebe1vVu7p00G3EzXRdWYGXfS8y3F9hoLYfwfU+pz0kKt5Xf+1BRHrTCSkFxnfm4/6VvgXo01s3Ve78336F1rl3S5nfqKZAMZW/VqXzKZVUgsYDMm02yuV7OXXnTipS/EeViJkzDSVptND4ZsbKvyAVNt1t/t8rQGjP0f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749245164; c=relaxed/simple;
	bh=P/Kfse8MZ7/nPZ2PUNCeEZ76+M3/DNjQ4KzcgKuG5O0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=iXy6nPNy4wUhc9R0leuXRDe2tYYVLWZQ1l/Y46Dd40BPf7VRYvkR29AsV8wLdm/On2W54RurBaa6P/j3N1wWi6J6XCgYNZVyDhd9gxM743bzOJk6QljtcQAn0wxLwOoXK27jCRTaMQqCN3Mxr0FuGpZs6yvsbAF6UoN5blMWSV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=f6nMpYMQ; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="f6nMpYMQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1749245160; x=1749849960; i=w_armin@gmx.de;
	bh=/tj1iGDlRT6q9MjHJ8l6Dkokkjh/J6fjXRl7bo2zibg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=f6nMpYMQ4yiFyOEBo2m8kGHotgZibF/ckxiTzkkz3tdeaGH6UUsZBc/i8ztsXyRa
	 wAuKdfBCUneI3+SD+62uRTKoirggKQ8/zyzcw9T9T+hX2L6UHQEES+0ddoS0wF8GV
	 iNdyOXPTKsokLr2ahQ7OJ64MrahU7KWq3oj0sG4rgj4ZzOSdqNV5i/zHfUaoF5qDE
	 CJDVO5UsXsiGMxZzzPFIm5/Ex7nVMwSJr7un0YwtxIohSMsFjUJATyoBq6C6uEmUL
	 C8v0KGMNayIvcfBFaL8Ef4FMPMLcCpS3K0fLyZSieOA2sQjYrxWQhTeEOHB3llUsy
	 ZfSZGsC9pl/FYVcG2w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNKlu-1uC0mT335m-00VXC3; Fri, 06
 Jun 2025 23:25:59 +0200
Message-ID: <dc67341d-2376-44b3-81fd-f3c5c2b241e1@gmx.de>
Date: Fri, 6 Jun 2025 23:25:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: samsung-galaxybook: Add SAM0426
To: Joshua Grisham <josh@joshuagrisham.com>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, platform-driver-x86@vger.kernel.org, thomas@t-8ch.de,
 kuurtb@gmail.com, linux-kernel@vger.kernel.org
References: <20250606130909.207047-1-josh@joshuagrisham.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250606130909.207047-1-josh@joshuagrisham.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xISwjz5rUYNPXvBxbZFp9L78XPcqQSVpKdV2wBbFNyoTJ0csZgv
 Ub1TdKSGDfcqVgkvq8iL5KU9M3VLPf7qG4tKn+Z1lIdEmT44r1oTOKCTmZzqbqqQItQlCY3
 TT130N9KVPCFcFrXzotQOcr8xg11N8B61zEJQag5o2qYjLMw7aJjI8LnT1yqhPN6xFASoBg
 cjCjxK6wQgnwIFHjIncfA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dcmGv8WrdPc=;qdhmVlBZkU1H0RbRHJM0LmA7eJw
 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
 Q1SuvZ7kGP3cI+Hg

Am 06.06.25 um 15:09 schrieb Joshua Grisham:

> Add device ID SAM0426 (Notebook 9 Pro and similar devices) as reported
> and tested by GitHub user "diego-karsa" [1].
>
> [1]: https://github.com/joshuagrisham/samsung-galaxybook-extras/issues/6=
9

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> Signed-off-by: Joshua Grisham <josh@joshuagrisham.com>
> ---
>   drivers/platform/x86/samsung-galaxybook.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/platform/x86/samsung-galaxybook.c b/drivers/platfor=
m/x86/samsung-galaxybook.c
> index 5878a3519..3c13e13d4 100644
> --- a/drivers/platform/x86/samsung-galaxybook.c
> +++ b/drivers/platform/x86/samsung-galaxybook.c
> @@ -1403,6 +1403,7 @@ static int galaxybook_probe(struct platform_device=
 *pdev)
>   }
>  =20
>   static const struct acpi_device_id galaxybook_device_ids[] =3D {
> +	{ "SAM0426" },
>   	{ "SAM0427" },
>   	{ "SAM0428" },
>   	{ "SAM0429" },
