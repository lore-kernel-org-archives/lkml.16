Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9661991B8
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743092089; cv=none; b=qDylNALetv7hE6vA1uRNDzAJvSERyP+rNxCNrGF6kVmBx/SxnagLKHLKtWBazGrLZzWmpJml9s8SMK2EF1HvQVW6L5erQEZ2DIoN6lE0EDxy0q70whMhDf0dByEkTXNH8K8K1ZIpQe7NmxgrUs3DcNyS3OXSBubsy7a8jzoFXfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743092089; c=relaxed/simple;
	bh=Amk6QMpffETB5UHAdzyexQClSs2Zm2hFX9nc8J7YUWQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ElVM1utMPMYLiuPLdefy/2YxT0pyL+FOfDJfcDvePp6/nTXJKqyhlIS51edodQmRsMbfHbzjv/mRBgmGfnGwIq5vrOyF7YAAXYqY//xCfM6/XvdVqanH+iZr6mVCDqlsmArtR65L3a2cGhjdV4cmCbKDVT+wOfbTspct8AHVbXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=iO5xR8Z2; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="iO5xR8Z2"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-72bb9725de1so327647a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743092087; x=1743696887; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AAevIfjZrxI0CofSj9kepLpMs0dL1bwqO8koew4382c=;
        b=iO5xR8Z2i/T5E0arTdkyBV1Kh31Pua+lenCSKl4ZNgm2hxzI22UdLSa6E3F3Z9XB4H
         QFXFM4bWgRXSgY1e/mC2a74LBcte6CPerFxIxlKkINUP/LqcYx/1cVJtT/vOPzkwkRDz
         gtJP8S7KM1qjVo1Zek/nAs1Zt3IQBycgK2MohKiawbQdbAPHKo0Krb0mlRNfCgOPbs+A
         W0lknRmwRH7EIcC3vIuuZV9Xmf+VBTklDCF6GyfEggFOEjaHHXhDevMol3hwZyjnT/1p
         0jFCxd0HoRobuj/Aqp/Ixnp2WapHjJ8sKk8/qmn1JcQiv1YB59qiuUi4lW9nSI+r8tsY
         mA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743092087; x=1743696887;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AAevIfjZrxI0CofSj9kepLpMs0dL1bwqO8koew4382c=;
        b=YGzKpWJH1FSpI7sLwn9vazaxby0rqtB398NrPMbqwnz61HkMyfmEnSK953URJ99NHz
         Lj1dEk8H1hv/gTR8HoW/94xYXwKkVYqioaliCzSro83MjotRlODjmOojUNmONnHJu6ic
         CarwTVd8h9ur/cyk265BNaXfA6sj2oYv+ar0O8HhShBn5/Fc/JXQIRzlvLHNHBGXdGuG
         hPRLYMLtGBlJbkk72yCkXpA/UtODUrUjgnMybfBIGgIvbogZ15hpzaQXrnYm7HMjnN0U
         1NLQbXPdCFUGh16QTdbb4ROkUklwxcX9lTYrO8gEy4an3WQee5o+MAqNRAxUY9/eOeWN
         6yzw==
X-Forwarded-Encrypted: i=1; AJvYcCWnjsisbh8IaiSXt8Pw2kBVhrt9O/yudkdpiTKBZSbAMMS4LTwEEwCq0wSrlkmr33Iwp024YXLabgWUrbI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoP0Q4sklj4XXd6S3j64J+651ErVKpQztFgfXtaBtszrR9iIZS
	azEEtPmaVayjW2mSCzGLMrPqDY4UiNulcPEmqcjlENTnDEYtvMaIUqHasP8pcKw=
X-Gm-Gg: ASbGncuuEkQB+f8wwRWXntSZZxKnECD2p/gpVqw0f4Y3R52hIOF3y5dW5IMwzlDjkbE
	GbWgW9XQDUchq2nLq8tPmVWuxIYP5SZt9BrKRC8+7aBw1hAKOkJbg8PKJntVBt9YQPSF+/NzdGy
	HiMewE9d9BBqAMPcpkHyOKUqmJAwEuCRptMa9uymNrH0FDD8aX1Ht6XfyQimhDDp8858MJLnEKo
	qGMcIvYu2Ok5W873yc0scnQl3bk6bXHYwCu9dQwkTBGdnI1zpstpemOeT5vHcAzEiMGQO23xgjJ
	ROFShm8NGEidGJDabyHL1ZqXZ1fiM0DUzz3i3kTeLLXVJmkAyOAu41v/3/03sS6dSUoo/ICHlI6
	vATpSgq4oOmictHqf
X-Google-Smtp-Source: AGHT+IGhmMzIClBYofJv4eoA5F/6WFz3QHXKjDLXtrtWhz+tAV3S/U2DTzHrFXt3T2Du+DnNRiDZ5Q==
X-Received: by 2002:a05:6830:3149:b0:72c:3235:9c5b with SMTP id 46e09a7af769-72c4c9beaf7mr2779969a34.16.1743092087156;
        Thu, 27 Mar 2025 09:14:47 -0700 (PDT)
Received: from [192.168.0.113] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72c58092526sm36834a34.5.2025.03.27.09.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 09:14:46 -0700 (PDT)
Message-ID: <c1433b12-4565-48d7-a8b9-ab5be3feacef@baylibre.com>
Date: Thu, 27 Mar 2025 11:14:45 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] Documentation: iio: ad4000: Add IIO Device
 characteristics section
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: jic23@kernel.org, lars@metafoo.de, Michael.Hennerich@analog.com,
 corbet@lwn.net, marcelo.schmitt1@gmail.com
References: <cover.1742992305.git.marcelo.schmitt@analog.com>
 <245b04928a4105d6c65a5f9b9b30204857e1f1d6.1742992305.git.marcelo.schmitt@analog.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <245b04928a4105d6c65a5f9b9b30204857e1f1d6.1742992305.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/26/25 8:25 AM, Marcelo Schmitt wrote:
> Complement ad4000 IIO driver documentation with considerations about
> ``_scale_available`` attribute and table of typical channel attributes.
> 
> Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> ---


Reviewed-by: David Lechner <dlechner@baylibre.com>


