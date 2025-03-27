Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A88219DF44
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743092068; cv=none; b=WjJJVreSa1Wug3dQLPTjrd9rj7eQyXfzQ/6NNB0iHM7kw3Z1nxnLwAR7vakJXPZ7SBfVOdznu8N3YGHTFRIXFRJOGkDEUvqeWktAchRLZIP3s/IBW/7oynRwrCfnp9riqBlagZJYCVX1Ra9zTVzKri24NwLnI25eGc6kh8a+4uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743092068; c=relaxed/simple;
	bh=GNhVFB92K5K7JKIG4jp0Cs6nn7gAJCe0a7Uemu1nmnw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bs3wExMUODxDQPYq/Z55KBFlPQocrMGyWxIe/XjZFmflnsjDlcsBdmuAOvu7jSqo00eEpliSXupnMCCkWBY/tnY1itEyhde80kut8gv+w8RCo8AXNfEEfxeM5gN6S+8vz70pFMpjYdCzK09tKTGeg1AeNxSyz4rES/GKKPFMvpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nxF/g/+u; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nxF/g/+u"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-72c40235c34so383674a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743092065; x=1743696865; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wBGuzgbgjNkNQcqVUiXqm271oXZ59Yt1bKTopnf6yGI=;
        b=nxF/g/+uqgnCDGfbHIK3MTUOKyl6X0UaHqew8MyVZlaGhor9RneQnCFGze43fa5Pfu
         He2fEM8KXp/hm9SrEvZUd3JLdFMOG2UmkMI0s4nJRVtWOyPG8yxtJlYiuYw3eIXpGnWN
         NYbNU5wRoRzDc13nszm9uXUW7RSK0gsxM/DGFTwLFgM3B568FvWsxi+t7kr0Q8gB7Q0G
         QJKT9394hFd6q63Key+eeslueFANbpvh6ommClB7hPqhe7ljgOA2gx+aMOlNGjJzi0DM
         sKCUr2tBBgGKMB6XmoGxUc+IIwEHiujHNe6ClngjJgBVkgsAdEKmrKRICOCgkxonh34/
         ZXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743092065; x=1743696865;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wBGuzgbgjNkNQcqVUiXqm271oXZ59Yt1bKTopnf6yGI=;
        b=eKoj/nYfGrFT/tNpjcCRQicCHB0pDDJRVf3X3gprI90DoZeHNpT8Y2auMK+4mSGrXM
         si4FaaiWDsHboNFXbfanHVXCj+5+8xI/LuWIgyN0NTisM+glCCd4HH6q9HbeAEcMBfJ8
         Ye2NFukcb+B+CzxAdgImDF9Q48o4mkiNbSiF+H5rP0D3msnfeC7LMyQ8m7I5G+rV7EgX
         qGkkjiRy2ZF+rE3jDcznTv9o0DKeSb4ibHwDRD0rF2beS+f29h+jNV+CrXVr/hdcNgyP
         gDuWuW1rD2+PKJHV0SPFS/s+O5ucYEMSA3v5XC7YDwcbK96zVNPx7S5tLnmyWOm6CzgX
         Ekqw==
X-Forwarded-Encrypted: i=1; AJvYcCUlFRykUNaPgERlOQNWpyJDBBk4jBv+grXeNO/tZ/2AXKqmGvpSTapF6H2ZVXMicXVeR5keFbwqcMCLd3o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwwL6WYz585DN4+bSAtesmfi2FaqoXRMqHrneVjizSzUZl8CnD
	HDsLeQS8mCbBjxOZsKqGjrdLFjuGNSRDKG+66xnnIGdEXDUYYXGkjittLST/GcU=
X-Gm-Gg: ASbGncsrmr0MrYs+nsPeeUL9OFBZ5a24nG8Qxg93KMAGtBSGncNzqcc9dwTzkMbSk4k
	B/XED1pOfFr/OY3YRwTCvySKYuccGjtjv7Iaf2GEtzFCI76tjceFUe+RG7bD0ht8vSIYaf082Ig
	s7+8yN7zE6za5a2LjQaSLTdFWnqPnStlLGtxxwGNDYi9g1pGjaxmKRUnv0CgE//ePHk/Eybekpu
	cLPQh1xzWrbLMjbklrOPYOnuJPaJyXh8OXqNockG85GkHCKW+rnh58pInEogi6quZLhOWg4UylI
	GZ7v3aEysb2QRmi3iIKt+msT1uUnnQ7Cc1xldV+TPUwMtFe6uQ17UmfaT/7la2MIWbUYiLiWhDe
	6MgQQVg==
X-Google-Smtp-Source: AGHT+IHQtT1DhyUe9XWbkgNCSz3KecGCefNVcwrr5ys75LAC9LLkn90zz5VjZC9zznoSGi6+KerVrw==
X-Received: by 2002:a05:6830:2116:b0:72b:a020:a2c0 with SMTP id 46e09a7af769-72c4c9f2c77mr2663755a34.17.1743092065276;
        Thu, 27 Mar 2025 09:14:25 -0700 (PDT)
Received: from [192.168.0.113] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72c580fa72fsm35908a34.41.2025.03.27.09.14.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 09:14:23 -0700 (PDT)
Message-ID: <ab73f7d5-77fb-4264-ab4a-03ee78aeee06@baylibre.com>
Date: Thu, 27 Mar 2025 11:14:23 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] Documentation: iio: ad4000: Add new supported
 parts
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com,
 corbet@lwn.net, marcelo.schmitt1@gmail.com
References: <cover.1742992305.git.marcelo.schmitt@analog.com>
 <bb57e4452cb6bf9f644c0ea2c248d4b72ecc65b8.1742992305.git.marcelo.schmitt@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <bb57e4452cb6bf9f644c0ea2c248d4b72ecc65b8.1742992305.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/26/25 8:25 AM, Marcelo Schmitt wrote:
> Commit <c3948d090080> ("iio: adc: ad4000: Add support for PulSAR devices"),
> extended the ad4000 driver supports many single-channel PulSAR devices.
> 
> Update IIO ad4000 documentation with the extra list of supported devices.
> 
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---
Don't forget to pick up tags. I already gave my:


Reviewed-by: David Lechner <dlechner@baylibre.com>


