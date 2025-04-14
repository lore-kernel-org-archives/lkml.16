Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FCA2749D7
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744642750; cv=none; b=Fmh6uDWe1VhxCp7x1yAHHbiW/0YTqCuh829frFL83uXuOUbHN8Hi1YDDhlafEwCXIzRINQElijBkXVlJXlldA0d/i/6/vxYRzPlTBsKphbeg9MDRUSODIpR2ybbVXymG5BVx69Adb/UYYb+VwvNyg8WGaZ1NNR5Owq/Q8iOqvrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744642750; c=relaxed/simple;
	bh=x8T8uwj/TLGIU0lF+Fq0pjFkLdrbonvSm35PpZ00zz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bWGQ4oiuE8XzUNuZKFKYLhAKFvDdw5VjYtKyku8cMQG3P5THV/uav6Y+koOncuoQy9wZpJhax5GkUvPpb9TLrIEuYlQTNk4VnAv1Wt5HQkZxx0PAVkDh2ItZDPquEg2DRBYLmKpSP9QcpdGFGRzC5CvRKA3zEgoo1PXCrRs2Ego=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Lx4a5OGA; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Lx4a5OGA"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-72bceb93f2fso2930327a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744642746; x=1745247546; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PTu/tTBiLDnLTo19OmaQLQq2DdZvvnanifk4lVRIq1Y=;
        b=Lx4a5OGAN9/Wf1napXhNyDcYomwPRaOVCyVQbaj0bXa2zSxDFnRIFmpGRUwuOqE9VO
         6cmWfN0mR+El0gG72xwmkO+1/hAuMkV+36MH4UBqgY9t5lOITLd3BtecbiZnUhSuSAeb
         ztPLzQ6xc0WSqYiSBcueOAuKe4jQbtcMe0RWY8lXWlKyqZOBVMwrNiGZZ2Comp7y75ET
         NEVYutaqGa7/5XjcoDlV7vCUmmIdGZ6PB9rmiuWb7TBeLoJK0C9KZ5yvTBmEkmM5qQL5
         Ju1ESoVCDly3fF/TMtsA0bfr/ZnPUHSHAmB+Um7+lVfYINKWpkHPIY235DGtQbh/juOu
         XaZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642746; x=1745247546;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PTu/tTBiLDnLTo19OmaQLQq2DdZvvnanifk4lVRIq1Y=;
        b=PGa0wyh+sf4Wdc/8fm0RhEa1R/0QNKCoww2qpSiAulzmAF+nHLtAaxyW2XgT80WuC6
         hQzvHIF9yfe+z+Ej5IXMf85Z9FE5P57PKQ8MvdM3KrFJrfNKNIReD9tpIl4T2me9L1bU
         XP2vkj8sCdZn+yHfc50oLjyZ5nCbNJJ8Mt/Btwm6O22IPOE2MYuJt6PCoKzBgsJLYzEZ
         +FRGbmLv3WZeip1YynSd8DWxutPVMLneytDcv9O99EpM645evyxKXpE6RlixTZgy6fvT
         859/PbinqHyBJyl0yfiBuVWvFXnGRhjjAD1AG7vHQb48ndqf0m0laDFh+LdJFx5bzNoJ
         hgXA==
X-Forwarded-Encrypted: i=1; AJvYcCXCDonE+rlxDU6zSIhXCPbMT6hTKICpTpGj8yjz7jgRX7v5/koI4+b840D4S+U2iWa1+1j+SplFMaikf5s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT/WpPHnbxejxQO+P5PynJ1n5t+by0Tngm3RGOw/DEPo8pQuM9
	kak5p6JUIUeOSnCn9KMwZjowpA/bXZWux9129NKMBPn0S2Tqun7gwf7KAOYf9d0=
X-Gm-Gg: ASbGncuB0x7Yj6XJGpzQII9UIbDodKz8jMq/5dSxeQOtRvpg41hJAVpJe4Xr9MkVBxU
	UKqhBpyKNjJY+gVGAwle5zeLMCbHOiSi43JBfSkw34i2+aRF8HKOsC9jqpnxoaaTmVJlt0nm3us
	F2+QgtMFEohAiTPznDC2JNovB42+IQ7cTGBDPxvidSGa7o3Q/z0/AEA3OQIFkbRcryUdg9KXN53
	zpH6hlx2jNyofErRaSRf/0cQpDRqdqTbnJXyWoyV133blY00dh7waxwdYSl0SOnO9/79zQNxI/j
	WTRSQTAQ9gb4scIpUvEy6JlU9Dk0EHFb02CkCzVtZMvHkX7Pnj7iOdBrbkSOg+UigGwvorxOEY+
	fP7nq3Z9Sg1rBN/8c/SnUjMReYds5
X-Google-Smtp-Source: AGHT+IF1glTK7Rxcw8wLI6vS9cuIAF6Jejh7PaHmK35pumQJ1AqOK5QhIhTv8QqFc965AKmemYt/Rg==
X-Received: by 2002:a05:6830:6209:b0:72a:1222:9e8a with SMTP id 46e09a7af769-72e863c607fmr7034537a34.14.1744642746453;
        Mon, 14 Apr 2025 07:59:06 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:442c:b496:9db4:da43? ([2600:8803:e7e4:1d00:442c:b496:9db4:da43])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72e73d8ee4esm2029688a34.39.2025.04.14.07.59.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 07:59:06 -0700 (PDT)
Message-ID: <0b1b428d-9ad0-4581-a13a-88f4ffd6c4e3@baylibre.com>
Date: Mon, 14 Apr 2025 09:59:05 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: adc: Correct conditional logic for store mode
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: gshahrozui@gmail.com, skhan@linuxfoundation.org,
 kernelmentees@lists.linuxfoundation.org
References: <20250414140901.460719-1-gshahrouzi@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250414140901.460719-1-gshahrouzi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/14/25 9:09 AM, Gabriel Shahrouzi wrote:
> The mode setting logic in ad7816_store_mode was reversed due to
> incorrect handling of the strcmp return value. strcmp returns 0 on
> match, so the `if (strcmp(buf, "full"))` block executed when the
> input was not "full".
> 
> This resulted in "full" setting the mode to AD7816_PD (power-down) and
> other inputs setting it to AD7816_FULL.
> 
> Fix this by checking it against 0 to correctly check for "full" and
> "power-down", mapping them to AD7816_FULL and AD7816_PD respectively.
> 

Sounds like we need a Fixes: tag here that reference the commit
that introduced the bug.

> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> ---
