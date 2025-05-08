Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E4621CFF6
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 21:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746738199; cv=none; b=ZQ1Q4KOdXdXh34lzMOJkM2QBeNyKgK9KLhvMN0WNXBXBcxhnAztTVeMraT9dF+CwFUb7jGOIzJ9vDIUtSYAdq2kcOeaXuyWM/s0CP4813UIn2aaCNWZeVUfc2wHImXihQedA3lxA2Aml4sYyjLpA/qT8qVgFpoyzVn6+L10SqH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746738199; c=relaxed/simple;
	bh=rWxpeRAeXokicQJ9Z8YfpiwCtuYvJRRE87ezbLzZW9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N8YXdui69oG7738zGZl7xaQM+FMG0d1XHRMN0HCX6L4noThfBHv3E0AuT9HKq3g8Y53vHOZ/ECRsWLeH9rC4Tc29N4hcu8fP7yM0FKRLHY9/QvvzXc0y8jSr8/xZsO0Db1FzvNEAhhfhy27gXZlisHY1oJr72xQkf/ltXMJzwhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=VZz2Pt98; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="VZz2Pt98"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-72b0626c785so1242254a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 14:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746738197; x=1747342997; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rWxpeRAeXokicQJ9Z8YfpiwCtuYvJRRE87ezbLzZW9M=;
        b=VZz2Pt98P7hv1U5XhOx9YXs2wjORr6ArZ7pt/dm04Q4JdXPS+97tLuLSm26vGsJ7a2
         /twLG3gLnbWuby8JNcCv5CeL+QXmuhUx5d6GPsz+5eX6ujhVEnhSBgfdDp5iuWPRTlWi
         D1lHtn1zysSGtakrMjnTIGdCEz08YbvojJ2RB4z6d11gP3l5oHIdViRK0dUE8s/9PwBf
         zxN3QAylR88Ip+5tvg9SS3kaM/dNvgbBDqu6I2oRLUjL5ppyhGe4YI610HppFUF27TKf
         KWbjP2qw7FC72iOb0+gu5RYzDeSS9PM2126onSQUJI99ji8Ea9FfKr+gmoTWE4Jo0hoe
         1TOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746738197; x=1747342997;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rWxpeRAeXokicQJ9Z8YfpiwCtuYvJRRE87ezbLzZW9M=;
        b=oXRiRsJZn+DJVa7Ys2QCZzag66oz6YC5vfWp26UuWoTNk8iqKxfgxmGC42pnGUGGsg
         l7GGzFC3DTRXFhU6dwCLY78byZpPM4Ieupem4tvPQ/UiehJ2ugFAj56+ASS+fco+Be7G
         kxgXsWJOYD4vuG7oRtDWxep8leNKSKMfCvI/M+ADBCVOhQg3YoE9b6tJcgiEt5lZveia
         430M87R6J0Rxw7Wm1RZrvmeVQ88R/oJNDbLQ9oHim0MUa3SOiwH+Nigu7Ns8aJqYSjWf
         JMlMRzlGzH777xLR0EHoxmeAph9WY7sytUBEY9wWoQapMzsB43hS2bizUeQlcbp/Lvjo
         Vt/A==
X-Forwarded-Encrypted: i=1; AJvYcCWqjfFoaa6rYmLAwcUKVUJYncjTBTRgKUyymYEwJR7XR16AReD4cjQjE6X1DszSixoFQR7gTkWuCvKr9X8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu46+YuSLzAtwfOAF213yg7SGiRfY4c/87zygfa5zmO5kpd7i5
	N2qcBnLPXz8uj6m+R+d0Xvl1un7xN+ZbExDwodDk+30sb2R550aFEF59RyxXCIs=
X-Gm-Gg: ASbGncvpNEjRBqD/XK8UdgCYempaIXCgawLUkvU6j8aC59FFid/WoWV0qmgeKn0P+KD
	JxOIF3cQdZip1ujGL6jHqtETTez0xTf+CNjojGAu9Ack+7i04BC4/2y+wPFn96dUhG2NfOzgRrj
	PI/lAgTxXnQgz74xT97PwPNvPyvSe8V0lvrr3h+bQsaw3VS3Fyfzj24muaOBNq14NqIokAmxGnM
	4GV3WFT7PsgB/dWayZPmJovDCGM5/W6s/i2CbmIlRFOw92up92L012P2Qp8y1r+CotNGH4IBCZ6
	aR+DW8GgWFlqtCwZk7idUuLeJXhBb2M3rDF4q7DaSyes/FJGmRRx4qSiSoJ2Puqv5fEOselcAeR
	Ih2FjYIOACTVUyFntsg==
X-Google-Smtp-Source: AGHT+IEr2MMqka5WLWK141klkGruo+u/j5u6j5rFw3buPNFlhVeimGmuRGD1CkkswVo8yYYli+ZYcQ==
X-Received: by 2002:a05:6830:c07:b0:72b:9f90:56c5 with SMTP id 46e09a7af769-73226abba9amr705432a34.17.1746738196962;
        Thu, 08 May 2025 14:03:16 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:1120:d1cf:c64a:ac7e? ([2600:8803:e7e4:1d00:1120:d1cf:c64a:ac7e])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-732265cd8e7sm245468a34.47.2025.05.08.14.03.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 14:03:16 -0700 (PDT)
Message-ID: <26d10040-08bb-4ec7-a438-7b4618df0a4d@baylibre.com>
Date: Thu, 8 May 2025 16:03:15 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: adc: ad7944: max high bits on direct read
To: Michael Hennerich <Michael.Hennerich@analog.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Jonathan Cameron <jic23@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250505-iio-adc-ad7944-max-high-bits-on-direct-read-v1-1-b173facceefe@baylibre.com>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250505-iio-adc-ad7944-max-high-bits-on-direct-read-v1-1-b173facceefe@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Just realized the subject is supposed to say "mask", not "max".
