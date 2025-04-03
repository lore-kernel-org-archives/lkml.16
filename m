Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85EF2512C9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 16:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743698894; cv=none; b=pImtZKrc6xRbxa58HvVOLtGYjuL+qVw0J7nA1EA6TdtOeKgD+wXdpCbXvevsHgus6LyXbRzQOCuHn41pAv/W5468Q8e+hqnk8QBs0X8QFzveCpdS27pyaNXsk4tDE6m/TyJ8er8IQq9J/fqTy1xhrV6P3eHRKY4QxX846FkFJhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743698894; c=relaxed/simple;
	bh=4wuv9Dt/9rj9cF2a6+xai4em1wNvUS1HPV5q6UbrWUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BDugB5TiVZaCCU6PAiJVpZl04ueqfUc1MvF+4wVArkNTpi5NULtBW9T8G9XnntES+xOlYDr9g+HYY6wSuDJCfjwxAcMCojUPpAhUGPmFff95tqgKzYjMs8u3PrMnhV48I4I0io4sHXKKDTwnxcVZCaX7CJY2tY3KDgCSrktK9lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=qcI5+E/B; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="qcI5+E/B"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-72c3b863b8eso764008a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 09:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743698891; x=1744303691; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YSC+FUFy0d9lpIsypY5Nl8Mx6gi/Bcekgwf80nw84HU=;
        b=qcI5+E/BAMUqLNMLWOxjRN+MGmAaw/lfkN8AYIMxn9c52qcobC/3x8AiMyfeBpR353
         Ld2gtJnmGa/G9qvTeVl5TSw7ApYH3RnoFtC9uwxKd9QXy5QEXojXnzh6jQkq059ZaRub
         Ysrm+M0I7fmFRY1zFNV98+Z5cmhJCU+aM+0xQ5hpfu+OyMBZxm7SR/DWnyO1qQEKxv7Z
         VINdf5/gw0PmUbDPCwdwb/h3K3SiI+o3uKYFQm4A/mnAueisCrvCTiwvJD9MTOHmoUaj
         ITpfimb6PgHKSvuUFtzLIzuICpyQP6W/sL5i5JHC2qHIZCim6/e17TBTszKJIr/ou/S4
         dXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743698891; x=1744303691;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YSC+FUFy0d9lpIsypY5Nl8Mx6gi/Bcekgwf80nw84HU=;
        b=URS/nZl1Bs8RKUWEiIOmc6dhhgt93NC2FvaZPu6NTIDU6p/Rk8YdlNSy1Amg6kaZue
         fXnKdep/BzIbBjJ9XX4OqCHY9c85vV5IU02bT1SbOOgKpkJoKRPneizWHKIhMmPbBXh0
         G74Xa3qQ6q7acFamsRYooYfmz8hhF96zoMMJpQrmW0WNhH/EyA/o1LgvQHcJWz+vW1DZ
         F3mO7tMDNhrrVGnu/9JKURDY59+kb6bFGxysrS2DcHszomD97SCANG7M+wJXYnFIhETW
         cRwFl/x35lqCHJ+EVBnvvJfIxT/UE9hwh4uU60hwziAwO9sUo14C6wvz1Qcu2Rp9IdkZ
         MBOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSpbdCrz4hLykKxqRe5uPxNDIHCMO90P7hWMlaMDsszG+XOYqBENsVv5u6Qc94N8NQ/4V/NL3hNzQ+TW4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNoSGZap17nVeDB4RgyeiQ0Gy+C8sZW6zNxhuPvRXJZM5/7Pdy
	EhzFZOygTMsuo5165TKXuhp8/41U+Y451W+U/ajhvi6lcXl0KpULqXQOOV7Fqrk=
X-Gm-Gg: ASbGncviChOzIL5O8Ie6IKAy3t7PQBxZSbAjyCIhgpc/8ix+9tyFOZTgbTnVGonoMeg
	+1sRiaN+FTJojkSScJXigVdpE/AwHSNlX3+FC5HuLHP4PsfGlRPorQvd/9TBNOwdhpV4ceYXJQz
	8jK0YLFtB9QfNG5XPoQteo6zxY/nGns3q7yGWXXEaYAyDxIrrIiFQD6hdMnsDuMtQmFmihp3Hok
	4wyURZRa0IiP3BnQxxJ11V1mWM2JP62YGg+mgNGP8KqhUuSXQMayc62xah5XQ/NIsfXkJ5BMETo
	lREw/p8cTXJm7hcFdZYUl5wZopt+JGIcgf19QOLHBDR/snPI64njAdybRXsQSJnV9acOcAn2nu0
	VmzsO7Q==
X-Google-Smtp-Source: AGHT+IHMO8mKj7XI4u0FpdUX8+XWGlKjBQ/8BZn9Gd3V/HfCKgUeXNkn3/hksONPqG77YFoErY/6nA==
X-Received: by 2002:a05:6830:4987:b0:72a:1d2a:4acf with SMTP id 46e09a7af769-72e3696f946mr147011a34.17.1743698890734;
        Thu, 03 Apr 2025 09:48:10 -0700 (PDT)
Received: from [192.168.0.113] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72e30511237sm281580a34.15.2025.04.03.09.48.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 09:48:10 -0700 (PDT)
Message-ID: <c146175f-6a21-4039-8c81-5933a9ef5ef6@baylibre.com>
Date: Thu, 3 Apr 2025 11:48:09 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] iio: ad7606: add SPI offload support
To: Angelo Dureghello <adureghello@baylibre.com>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20250403-wip-bl-spi-offload-ad7606-v1-0-1b00cb638b12@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250403-wip-bl-spi-offload-ad7606-v1-0-1b00cb638b12@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/3/25 11:19 AM, Angelo Dureghello wrote:
> Add SPI offload support for the ad7606 ADC.
> 
> Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> ---

Reviewed-by: David Lechner <dlechner@baylibre.com>

