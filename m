Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F2C288C2C
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746624302; cv=none; b=s8FWs0h47LWylwlRyGWA2Xe8tYbfZGbyfGkDy4Cam6i7T097reouYzBmiGlv/Hi2cD/IROwgQmLDogsU6a5B0hu3VPU2UicvOf1H3J9oT3kq4CafFyijEAuATjGN/LVMmjf7SFV8FTpwS73/yWW3R1sWZnfHVpoyJyywQOxW8Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746624302; c=relaxed/simple;
	bh=JPbsFId9HOcNNCMKmW+AhN0ZtMa4qZCci/vBQwntvgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UeYROykHS6ZXWhdAjhQLY/+yq/ovNTOByxAnV8u44tzWsaSMTCz9Cn02/q7k6++c2ELsdEXNvV3iAZRy1JOkV8f6r1krmXWz16nGaVLmLzl6rkDHJ94wN6fB5/Pg2JAb6Gl87+hyanRnI0NCsbnQh0rx4tDoYocXoHO8pz9KcG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=n3ssBU8L; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="n3ssBU8L"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6f5496972d3so1274606d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 06:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746624300; x=1747229100; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1mNpLvD5vQVoCYoH8klEkGMCzhi+IWNYb5PmxSoaGgQ=;
        b=n3ssBU8Lp0W2PZYdMzR65aXwQMuNo/o7Nmr/FofZQnTiNB0QemN9b7ejhPlCpAw6CR
         urmmdwInwtUS1SSOutMdT9rQzv0Wb/W+KnEu3IPgWSgUTOZhSjWYvcQJYrFOIdoAIfVE
         /A6o5TlQSdBlYR01dk2tx7mOlgVv/Y3enhWwIoFido6LCwwMNWUj0fIzYZEUN9fBSe+U
         z6Nf+m3tKuUaywbd75n6tfNoCOtjzrVlaUa0Rsp2kumV+K/XsvkHlvuTcES49QPsdEku
         ag4mHEUHEA7Iv1O/rqXVVh1VwNKkwh71ECAeMqf1ff2nCfoDI8xzmS2JaSTjSE2+0e7L
         zHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746624300; x=1747229100;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1mNpLvD5vQVoCYoH8klEkGMCzhi+IWNYb5PmxSoaGgQ=;
        b=LSUGbSnUgOyLVbCo2XOjA7XaT5cdnJIqnWIQL0LmLitZaMzkHkMApPo+/+tVMcp6ZR
         vC8myTcq52G0cjB57VwPQKOK68jJTiv9VqZNgklKc8Wa6+upYCCvKNDNjwta6JC0nCAC
         hOQy6Y4V1fo474ba2zjH9MQDt5ZAGhdJlIEHRuXz6wGGZGxOFV+FfcD8eETiKQk5jNGd
         YTRYj4/zdJQt513e/GPptWT0wgwhfV7fklUrxH8xhufxmVrb3rVzCYhlkWYqruz27ogQ
         aM+tVysYzGWJYmF3vNm1x7YV0fw+lzUgQLatRd1yHibmXJWQaz5LrW3m2atmhZXVJR3Y
         TmVA==
X-Forwarded-Encrypted: i=1; AJvYcCXY1sFPbgceyTHI3T+8VSdkHRV+bXWtD/6YbAQzj+NUGjLdqIzzciOfsB3t3I4x8TIPo5a5h/7J3YuxtyM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMvG1XLyRx2fdp+C3gGUqTSuj/aXoj/Khwhi/x/ZCw7jX+4465
	sjFIsUqwhIdSRTdO9gW/mCy0I+DlApNEJXuTS0DGOxrsvqEg6RXLDKqLVLdumcza7CkRxpvooGA
	v
X-Gm-Gg: ASbGnct3Srlw566Df/hnzdNcwe6fVlqLeZby4EOTrApna2ZT3HLBZl1o69AEjp0O2FH
	xv5pNTsEGRLTJapXfTeqdWs/POIoRVcSzgr+OwjNSKBPLoabRJIHoYBGEY9c1E5ZgHp3CpO4YdL
	4bUaA0Zq6RxaCSzaolPIFVSD341gq45dOpZ3Q2FqC0BpPGC4JnRf5CB0XRLosK7ZidfHJdchbJr
	Rs468m9hIpz4GR0ef+d5yTFyop4R2KLd0MoYqbqRD1u/E4W32pro7X0c0mC+JRPVrB+QDldFwPZ
	GWSxEr7yvkijQo0CSsCZn35pHXC4+WAwgt1uZUvXlPo2x5IQpKF34j+cG3+RpNVayItuNmSHVeC
	BFGKvTl6tkx43Gh8=
X-Google-Smtp-Source: AGHT+IETb2JbAqHKM0Nsvz8Uj3dfNmRTjWBQrhF4LcQa8hFco6QFGOGpJTMa1w7dB5MoJJ1ZXmiC3Q==
X-Received: by 2002:a05:6870:47a6:b0:296:5928:7a42 with SMTP id 586e51a60fabf-2db5bed9a3amr1627337fac.22.1746624289401;
        Wed, 07 May 2025 06:24:49 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:3356:f6f6:bf76:a32? ([2600:8803:e7e4:1d00:3356:f6f6:bf76:a32])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2db5d0666fesm585351fac.33.2025.05.07.06.24.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 06:24:49 -0700 (PDT)
Message-ID: <9457b419-6aca-412a-b0f7-4b3c7274789a@baylibre.com>
Date: Wed, 7 May 2025 08:24:48 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] HID: sensor-hub: Fix typo and improve documentation
To: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>, jikos@kernel.org,
 bentiss@kernel.org, jic23@kernel.org, srinivas.pandruvada@linux.intel.com
Cc: linux-input@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250507055745.4069933-1-chelsyratnawat2001@gmail.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250507055745.4069933-1-chelsyratnawat2001@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/7/25 12:57 AM, Chelsy Ratnawat wrote:
> Includes the following corrections -
>  - Changed Measurment -> Measurement
>  - Changed clode -> close
>  - Gyro -> gyro
> 
> Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>

