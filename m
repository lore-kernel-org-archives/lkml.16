Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF6F268FF9
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 23:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746142245; cv=none; b=Y0sVkfnC8HCvueJTIFycxqkMf8mBVxWrz185BWYEDSBMIRmnro0s7WrfRuG6lmC/V61QNiPi6vWW8nPOGFrCJUBcM2aodSLhUdu+n4dF/KhStRIPqRnFxOtp5mb55pTjQGP7BbQj+fU8iz7AcXuBImwy6jg3vfbPAZE20FgplDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746142245; c=relaxed/simple;
	bh=jTns9oIgif3VO77ABK+VfD8XlPhogUFLl51PFlle0ZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oiEhIsr6pWa3Y3he6p6k2ge/3CO6uWDAiYYlt33+2KYVPpkkClewdubovqUdov32pNGXNV9bz0ePex4legfzOv7DpWiaLk31CEXa/xASpwnpOSBuVnUf0BaNB30j5UzC6FpgOsAEeKBaP16a6Uy3FSweiNIPXMFkG9pEklcOe9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=R9XONA6C; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="R9XONA6C"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-72b82c8230aso446303a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 16:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746142242; x=1746747042; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KoA2UkN8oISoIkKyQZHvDSAzDe460fqLh62H4z/B99c=;
        b=R9XONA6CrGiyjO7ObhkDw67P6qD5PNtu+7Pr4pLQodewg7N72z0tr03KNLgqy2cEaF
         w+WsCEl3ghFpV+dLOhEIU1bNjwHUUuTehuBEC+XkbGyZ72x4itvMBy+WHz2tAEruFHdp
         nrK/7EyNKzNXbr/Y7XN3+VC6yl5CEW/MTn9czBe8ZboJlUcFnfGMWw0hN3c1OSBsN1cn
         2KpFsXSpNmIQyHdsFyJfjGrT1duIta1sPZRSdubwMyw9egcOqA2sxl2dmxpcX15YMk2c
         qJzT9Cc0qCiwSFd4edzCfzSAcPP/Fv+D7wDaBmWUVdlTfTruhZ/6Om4tVhyz1DYgoVc0
         CiCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746142242; x=1746747042;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KoA2UkN8oISoIkKyQZHvDSAzDe460fqLh62H4z/B99c=;
        b=QT0+8x7e0HtvG6Rm0bSPO6DgUZ3ibZ9j4lyNC1VKnmSdMjiuaTnnRsmzVJEKpJMMtF
         FbTajVOsduAGvaC6zMlTGu13xYYm/tFHgkDzokdNxPMxxDetUYDy4EUGjmJGTsvnG5Du
         Bd1OxLiI4W0VHtwvBKDEfCq4PZxlChryE3ZvrDQP5nmXkos0lL8yhTV+ES8HSUF1zT89
         RgT5zwzAk3zVQeLxN9Ev+wvja2lwhbbbWuaddPhksSEWbzZdhk+9BPtBPbyio1r2xod2
         oAGBGSKfvET41Cwsq0KG62J97f9dljaRGnO942BJvHncPPEvS+Lr8nO3n/p6nMXnjUp2
         prng==
X-Forwarded-Encrypted: i=1; AJvYcCUadK8G26SScvUXWLUucnhkJ6fA3MJHZkJnUHKhr+tY4fBRWOabCd82gNuGeVLj/CfcRxPRqMTvo1UALYU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVmSuxClG1bgskfwEVSrUmBgiERVJE/w1FJQEXh/z8MpIWK7A7
	Ks17HG9Q2d4c2yx88x8CmFjutNyh8zhNrmLb4OWEaDmBJdvDzbEnzOlrcXWhJHKESTfelHRV+SJ
	5
X-Gm-Gg: ASbGncsLlfvBLqvLJYTvpCt1rlt1wQNiBrvTdX4st7jQGgfqeIauv03wW2KYJ4VyBdP
	bSaxTKhPvgoPJW3QOODAJi7blB2N+RcXBy7RA0pWiTuw+bgM7GBtr1k0HN8kqFckIQdHk6+662C
	hi3lWEdDpet1CI/KKXrKFQQLbt7f5qHTBUBSO1WmRtbsbOmXV6hUVfJYebJazznrW7/w7l8nXg1
	vxkjhQSGVxq/RDUop+mE8klD20oCi+tw0O6cLhYNPW+3FsLeNUS9eVGaZsZbcgxf0RBeh4lfmF5
	uBamkJIrgXJ2qrKnl205bxFz8e99N01mAUjB2EeU/Bv9r4m5GaSo37M0n3fiRY02eSF71xchpt5
	uo6S9EA4Nuw6K1KEBvQ==
X-Google-Smtp-Source: AGHT+IHQutzKltF40eIlfzs0UsiBrITbt6d9rQunGgbvkTDcSJntFVMQ2ABf1f0PkqpxkIpQy9UQIg==
X-Received: by 2002:a05:6830:64c9:b0:727:4576:36f9 with SMTP id 46e09a7af769-731da0dad83mr582244a34.3.1746142241804;
        Thu, 01 May 2025 16:30:41 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:b1ed:e5d7:8ea6:40e0? ([2600:8803:e7e4:1d00:b1ed:e5d7:8ea6:40e0])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-731d350a04csm300686a34.68.2025.05.01.16.30.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 16:30:41 -0700 (PDT)
Message-ID: <a355a23e-03d4-4f1e-977f-adab632c7c5c@baylibre.com>
Date: Thu, 1 May 2025 18:30:40 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] HID: sensor-hub: Fix typo and improve documentation
 for sensor_hub_remove_callback()
To: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>, jic23@kernel.org,
 srinivas.pandruvada@linux.intel.com, bentiss@kernel.org
Cc: linux-input@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250430182300.122896-1-chelsyratnawat2001@gmail.com>
 <20250501231931.1865276-1-chelsyratnawat2001@gmail.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250501231931.1865276-1-chelsyratnawat2001@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/1/25 6:19 PM, Chelsy Ratnawat wrote:
> Changes in v2:
>  - Improved the kernel-doc comment for sensor_hub_remove_callback().
>  - Changed "Gyro" to "gyro".
>  - Changed "usage ID" to "usage_id" for consistency with kernel-doc
>    style.
>  - Updated the comment to state that only one callback can be removed
>    per (usage_id, hsdev) pair.
> 
> Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
> ---

Normally people put the changes here below the --- rather than putting it in
the commit message.

Patch part looks good though.

Reviewed-by: David Lechner <dlechner@baylibre.com>

