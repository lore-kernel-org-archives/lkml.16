Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0463014E2F2
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 15:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747667738; cv=none; b=k9b2qBo0J11vcseRpMy0Zw+PX7JagRPfGYiVmycBqNAJYRfF0cluAQZKGujKumKD3poB42JiMmSgmKZ8sOoEg7lrb21GuOAVmMnJs+WCeZnom+mnIqBaOMOg3BqFZi5rkd+b8yElJGtoWkexv00TRwKgtRqxBl0Y20Xg5HN5qdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747667738; c=relaxed/simple;
	bh=7i0z8dkp7Rwv38waMV96QXnhG505dF5lZuodME1r1go=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=J6RBfi7dPJZAvX6RgCtz8RC9CLoxGCkBaN4ks57M61ZgH5RHBGBfXUtQJ0Cq06e0en8dASLJ0sIe1as9VgTft1y5H5QRsK1noh88uThFAx0TEN7nTadB19grMzkNajXbnGewNQ5HgeKWfzdfL+xhPgpm/PHB7HfDo3t+O3mtO94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=p23ZQnAN; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="p23ZQnAN"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-734e0dff444so3242790a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747667735; x=1748272535; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nJGdgARxukTLZl+ZyZJmv0v/UH1pE+9UaVbHtn6qyms=;
        b=p23ZQnANNFxiZjcxgF9i47sULZd+nGsQWGkYi78IqP+M9KrCNAtyOifMUUKKoEF0ac
         DzcPcGE/ZmfNpOtaNcJ8+/0mdHnpDT6upCBbMnLSJ+So8ZBtsrGyYhd8ivdWNl6C2XOw
         wbIlMLF/S8oLuXiLNbquMdZT3jkwXkSQ9NfZJewftZBlasgvd7ueMidBDl/dpVV1tP+z
         4UQX95oKbmRyjQZHEIt72qBnK9GMeTQQ6W7SFDag/JAVnJs7DQQk/0l23M6gpMqMk5Cz
         d2gGvHf0ivjiZm21y8Dt4pv2UitAjQ2AEIdMChIF1uqhm12B8XSZSIx57WszxVrjylo7
         ligw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747667735; x=1748272535;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nJGdgARxukTLZl+ZyZJmv0v/UH1pE+9UaVbHtn6qyms=;
        b=fscB9eNDO1bMV6MqbsHHxnIY9dMCkVTFhz8y05ruGRPz/OuyrkHHGZWV87IS4mYcPu
         CDjAKDvJcGFv4dd9zXaDTos6ptFcY3oY8FMTosOpeWKQBwvckHKYoM0Al+IsvUYCmx5i
         uRSqYifEpJcXsZO/oCxjpseVsJoNkFCzkCuNYx1OR7TaVkwJl8AYhYtDEdd0aM07Qzfl
         bhVrNSaT1cB1/MXmnSrJwNLOshzjTfA4XvPGGV3uJnRpoz9b5YHVKhshpn1T8qpo/XuR
         iGKmwkzkKceOM2SH9RDdJONEDgVCH52TiTMs3ncbtBF5FFAkYghtqlNVP4SI8L62kvGj
         oMWg==
X-Forwarded-Encrypted: i=1; AJvYcCUGu12k9yrmTdDAUB0XAUBiHSwVzuxQQe/hguMR2y113a7EUfRYj2CWdjJKJlyJIKvql8DrMDFM4riHiDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOkjaSAYTDdN1NJz7D77rkmgNcTKGtmYnX1MM3pwsGcByUWljo
	GnUOE0vcQWjOSwUjRv3zqVD6bmHhREBtRwUGCmz1BC4IBPIu/8qpUs/YHQ9n03FoMKc=
X-Gm-Gg: ASbGncsj8Dr7A2zOnx4s+qOffl6GNzSvhpNnFZH7PDRXEKJumMpkI+Wjea5dTSN0I75
	Nc0nf06LBRhm766jzi6ob4QFr1wa2z9G8fe9s7UC8FlSDYtAfg5nNCVQH38ysuJS5yWb4/NFp9b
	sz1N9WtJYyY4CKmkzFrHYA04VPNTfZ+cjkg6moGBBHyDB3vOkP+UeoEEnJICKN66uCJ12DA3aM6
	7GIvH1rAOhcOTH5/7Dd5xzbfP+xF+rPuDE7nDfWv1P3nzpTEXEJsrhX0m+RYvWVNPoLdj8Bsgh5
	vZKVj0RNrzxGrMW3w80+WKzIPpjufWSG5xXUz1LDwbgKht2HXFGrKHa9TisqZYUgic0WCJiko/u
	qXp6nov40QrgQ79tHb5nGeGqXUg==
X-Google-Smtp-Source: AGHT+IH6Fik1SZYN5QOy8Bw1FWgY0vjMNTWd7AkwjVQ2mOYKw62zzRRz5BNUCHUdDCUwYb6OqvRO9w==
X-Received: by 2002:a05:6830:6481:b0:72b:7faa:93b0 with SMTP id 46e09a7af769-734f6aad6bamr8417490a34.1.1747667734957;
        Mon, 19 May 2025 08:15:34 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:a628:91ca:eb5:d6f5? ([2600:8803:e7e4:1d00:a628:91ca:eb5:d6f5])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-734f6a4b0ccsm1443928a34.4.2025.05.19.08.15.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 08:15:33 -0700 (PDT)
Message-ID: <d40df6be-53d6-470f-b93b-520e21880c18@baylibre.com>
Date: Mon, 19 May 2025 10:15:32 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] iio: backend: update
 iio_backend_oversampling_ratio_set
To: Pop Ioan Daniel <pop.ioan-daniel@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Sergiu Cuciurean <sergiu.cuciurean@analog.com>,
 Dragos Bogdan <dragos.bogdan@analog.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Tobias Sperling <tobias.sperling@softing.com>,
 Alisa-Dariana Roman <alisadariana@gmail.com>,
 Marcelo Schmitt <marcelo.schmitt@analog.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Trevor Gamblin <tgamblin@baylibre.com>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250519140220.81489-1-pop.ioan-daniel@analog.com>
 <20250519140220.81489-3-pop.ioan-daniel@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250519140220.81489-3-pop.ioan-daniel@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/19/25 9:02 AM, Pop Ioan Daniel wrote:
> Add chan parameter to iio_backed_oversampling_ration_set() to allow

s/ration/ratio/

(This is a good commit message because it says _why_ :-)

> for contexts where the channel must be specified. Modify all
> existing users.
> 
> Signed-off-by: Pop Ioan Daniel <pop.ioan-daniel@analog.com>
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>

