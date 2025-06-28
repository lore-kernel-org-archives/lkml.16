Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B331B1EF092
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 18:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751134505; cv=none; b=J2pfXr5/xBz8LPobI38CieDtrM8ionvJL0DkdMcr1JIviOhZb+lbMuYMCRKVHnAimTXk8upXLMv0sVUsvoCWZHNCtYj/+q3USWAGBTrRzTcYtVsqVMP2ziIOtDf4f06Cpf8gcmF/+E7QjfKegs+7RovkoXjcRVncIr+wcaTRPak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751134505; c=relaxed/simple;
	bh=HhJu0nej6YkZjmJ541Hrwgt9nV16rqq0gQmZuoI48xM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LCV9Yq8IMcxSgPZsExY/OVWpdoaPn2cMcgj0ORI7YjRCmEhGP4BEWyJrlRTM8kcd6ikbEqF0GdEW2kyXbTPjm3FhYhGQujCovvAr2dlMpwycDd7kiJ7PI9kERZsydmpZfCLVH5L6OfgOVEij4aAzWRrHxfuZHVuHAW85cI/hdHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=oInSwLpU; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="oInSwLpU"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-736f9e352cbso558867a34.2
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 11:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751134503; x=1751739303; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=opMX1Qwlgu2eO59hinQtvPB+M4svOAtsX/gx/lV1xqg=;
        b=oInSwLpUKI48r+kfhv4mzfGO3WH2llVMu+CkFNv29gm9JTl8hZL+YwC3rbFCzHMCAV
         h6d3Mj0dQdY2Wq1YRhO0M5vfF+Mzvx4wF0q3f58CNypYQwOOqn0oJwaIdDbkB88z/7m8
         p8oj31FLBYL6zHAoH8XLsOZG9SFG+Uv3ot6pw8Aalsnc5XyLkbn8y82I1RLIJhQl1hr/
         O9SNwD/vCuA1NC6vn/xLqq72yyIsSx6CusxukngGLt8NjEo6wtxO30QYGp2r63XCWMU2
         ut7KC8nmuJeO0Xbmn5rz7M4XnECQOGWZA2vRopmk3YqugpvJG0hsO7GiIoWZuLYNYoue
         8kVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751134503; x=1751739303;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=opMX1Qwlgu2eO59hinQtvPB+M4svOAtsX/gx/lV1xqg=;
        b=eBU+AK1dThW3UwEqoTLS1r5u9GdpIGVVxd8LhhJuMwDUPcxPQpnR/D3pWozdEzeX2q
         U+4U1WgzFA2c+x/bt/YSSrwRuNyOJGpAMuqmMMAXv7hxe2twzRS4BuLDr+YbyKf/7Pvd
         DJh2+iF4nO9pHrDcN4lv7fG5L6qWqi4Ejtu64F0M5+fT9C1nFCKOyPHKpF8VhLL4MUNd
         K6gVylnJw8j8JKfnCcneGajzb1QOxVH+bCyZdYIM8HvSWx+Zs2+iwPS3Q/wH4ICrDUl5
         i1kaPWT33qdqXzePgt08pzDtgenenDMo+XstQ/4iy41rL4iyY704g4Df2GB6s4p/mqnH
         qxgg==
X-Forwarded-Encrypted: i=1; AJvYcCVnl31dYIb7Shh5bgGVrkATMl1B/ZUpIa/axPc2QCu2SLMGq3xu6OmHNCgfBdlnh2Tax02Y4r3JyW11sNQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGedrtsAd8/9VMrfT5+ybcyctuDI95Qlrv6CbKIyIoj3RQIJOQ
	Wv3Sk2m6sn0lvFiWl9VSGbvItITtoeYkoKrlFhFtNtrgJiHBN4F6l92N2+NaMDKqA3U=
X-Gm-Gg: ASbGncsfsoUclYeMrs0R06agXl1XLm0GTJum3ypIG0qkL1/Ab+OMq5tCfJqnH9dEJYw
	hxxp1jCSHvxdzXALm1IAO/YfZcVeKxdaHekUPrWGzSAQweslpIoWMO06Ee44BgRtaxGc/4RXCMT
	CUooQzeqtaqNRlhNWuASwqnFVH+FZ7VD/43mmE7MzJ0tM2A3C0/6AYP7k0I7j+oLk0nnr9qC26r
	D9Ymxtg3o/LpPt5h4BXkn9DqpBCgzjzyYKEqEsp2c798ZbSmJ/JMweKuifeZ7gUcZa6phfh1Sx0
	IsBOYTNEn/ikhC87xnRUI6pgipLvJiyGLb6d5oM9u5/YkMSuPS8ZZMbvnBOvuKGXznjRv4xiJPd
	mwnpmhB/3lV3uCwdORjuEV8NIG4CxgJgedkl1alU=
X-Google-Smtp-Source: AGHT+IEEQkM1gJRIew9gOz8gjXb3IwEUoI9QxGNe8m7jXfBjfsS45L+o6phsIwDzLFXqm/Od5/VXeg==
X-Received: by 2002:a05:6830:8009:b0:735:b9db:5939 with SMTP id 46e09a7af769-73afc3e703emr4147723a34.10.1751134502681;
        Sat, 28 Jun 2025 11:15:02 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:3092:a48c:b0c6:cbf4? ([2600:8803:e7e4:1d00:3092:a48c:b0c6:cbf4])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afb01d79csm905055a34.28.2025.06.28.11.15.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jun 2025 11:15:02 -0700 (PDT)
Message-ID: <bc8d1e7b-bcd4-42de-9011-4e1b6fc3a23a@baylibre.com>
Date: Sat, 28 Jun 2025 13:15:01 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: pressure: dlhl60d: make dlh_info_tbl const
To: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250628-iio-const-data-24-v1-1-353b97281534@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250628-iio-const-data-24-v1-1-353b97281534@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/28/25 1:00 PM, David Lechner wrote:
> Add const qualifier to struct dlh_info dlh_info_tbl[]. This is
> read-only data so it can be made const.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---

I got in too much of a hurry and missed that we can drop the chip info
array here. So skip ahead to v2 where that is done.

