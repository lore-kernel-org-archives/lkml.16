Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A7221CFEC
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745837746; cv=none; b=nO4OOLZbyYtF6uTdfUhV7O+/nr+/0sIp1fYmkC3JR83xxNyafrI59ovls8KLHnYLx2KCFqulD7XcDUPkmmPXxtlN3O1gsAXZG4EL1KcxG3TmJOr68ofCYtjmaRHt6RHLRhDi0cASK7gWRT/cY6petr3VHPUqdf/1kqxfTRXQ+/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745837746; c=relaxed/simple;
	bh=Wey50fUT5Nf8jtt0fFzgyeoJOVVmx+3Cfd5R2oIoURI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kjnIGyFfTuRvVbk+EZXqxhz+hhJONR1y/eoh/J8ZcoHdDoEveKHnVi5H5U6QSHEYo3vwOEhgTAUU2LMGcWA35olj4j3Cy5CXPA8zIqACuj3JeRCpywv2ZT2TIKxnGtGktmG0BkNa0XnYU5UdGJTPwC4G7r81TerfsBy0o9PtiRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=O6kLFuOe; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="O6kLFuOe"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3913b539aabso2529665f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 03:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745837741; x=1746442541; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dFN7Y9ajG7mv/bsFcbVbsJZjkflbAhC0QhrNhHTmMUI=;
        b=O6kLFuOeMyBeMlK9UpORuPrjcOw9Qq6UlkxhUN6yjLFPrp7QJg45iDvr2lvmsAJwGz
         135jWC4vHYEDmaDVt4dGxCov3EzQpdbh6VWdoveoNHsSGiMqdYovn/oZJUWc2zp2I0rR
         gRfgfd3vUjycLkPrDeRhy9RGC1t8ONOXaBkxY8I+1GRkwOhNqsc2P6pLv2uDpf6Ch/GU
         2y19F81nHbotQT4RDzU62BZR0aKGr7RaX6i8VrFOg7dPTzM7TtmZB5mlPlDUJHhzLtMT
         8aa8MAvGA0XgyB4AcXm7EywnKj+BYSf9MzMP8lccHJWVyA7w1vonqhVNM+XHRBr7yegg
         ZC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745837741; x=1746442541;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dFN7Y9ajG7mv/bsFcbVbsJZjkflbAhC0QhrNhHTmMUI=;
        b=HxJxUzps9UUmPgUVYV6tVpk/5xgpCKn39pioQt9tTzlFHwdJz9oAGKjbnjeh9iYdM2
         VWvH/Lg903CUlGngqDond3XnVxScQOupO9tUk38aceRCGjQkhHnc3ddxRq4K/ZJZAh0f
         LnCoO13Pz0f5hRSa3g9B7AcrBRg/akxU60ddS6PBrLOcxCvQYmr8HNO34iy5ckCULuzc
         4Ex2qAu8Whj9Z4YkkCiI/pfJLc0jTqLib+r7rtJGUHE3iFAnyPGsxWshQ++KH7CjVIXX
         4Gd2jiUE1vmpNdzPARCq+hjGKhOgrd+ReJCmc57W/F+5bw2TYEDFMgv2g5E5vowYZV+7
         ACDg==
X-Forwarded-Encrypted: i=1; AJvYcCXYQn/cfQad0zYRWMjfBn5qIVCfuX00vYyPWBK4L0wc32S7KfF5prx3yY1uHcuyn/8cD4n+JRFQr0dVnlg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5DdJKHslazHOLraCE6ByFrFxGM5V0thFuMfQ6kwQ4MArhZIT5
	FVt/vX66/uHQBjvqRh4zkk5SRSX+KG0CvVL+MozTBz/UUPUsRX8OhsU9m7v0Or0=
X-Gm-Gg: ASbGnctFBwFW551SuIZHOh0tA2e/IHktpwYfCVBcSIs2vaRPw+V/9BKjQ/hM7XuWccq
	viHoWO4KhXJqP1lIWPdAjO8hYmIpIkVPGX9ZKqDC3GNqudHjPUTBor0EOI5fGnNEydrJVUuX2Nz
	YCuWri4Gv4G2sRrqmPtoCp0+S/P3jHtgtjYM5UiYqJLlgXqDd+JBiS1VrT882+ZUjRJ3KKNRSk3
	oOJlXkkdcqrhOplVh7JEImYnyZqAUJlKwQWiOLW0USlMu0JogxV6MpsjV+GOMuxnyZ2+9cGQGja
	5jWKGGHPYKyjiVPKFnxcZBMCw0ygRWBYy3/8EeUNxJ0/c7rVrQ3teqxW4o1syT+BqO5CAZq/W7v
	wg+K+
X-Google-Smtp-Source: AGHT+IEuL50Qb91w0VnQIGYw2e2ACPF850zzX/DeAKCpElcbElEkW0pFf9mYkjOQNgyB0LDalxJ54Q==
X-Received: by 2002:a05:6000:400e:b0:39c:2669:d786 with SMTP id ffacd0b85a97d-3a07aa66708mr5765250f8f.19.1745837741235;
        Mon, 28 Apr 2025 03:55:41 -0700 (PDT)
Received: from [192.168.5.157] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca56d5sm10907013f8f.32.2025.04.28.03.55.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 03:55:40 -0700 (PDT)
Message-ID: <4f5bb188-1232-4642-ab7b-d985192f5085@baylibre.com>
Date: Mon, 28 Apr 2025 12:55:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Fix pre-1970 date handling
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>
References: <20250428-enable-rtc-v4-0-2b2f7e3f9349@baylibre.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20250428-enable-rtc-v4-0-2b2f7e3f9349@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Angelo,

I failed to Cc: you for this new revision because it doesn't touch the mtk rtc driver any more. 
Still you might be interested as it fixes the issues for this driver. I'm looking forward to feedback.

On 28/04/2025 12:06, Alexandre Mergnat wrote:
> This series fixes pre-1970 date handling in the RTC subsystem. The changes
> are particularly important for MediaTek platforms using the rtc-mt6397
> driver, which can only store dates from 1900-01-01 to 2027-12-31.
> 
> The handling of pre-1970 dates in time conversion functions is improved, which
> is essential for hardware that must reuse earlier dates once their native format
> limits are reached. Sign-related comparison issues causing incorrect offset
> calculations are fixed, and the test infrastructure is enhanced to validate time
> conversions across the entire date range.
> 
> These improvements ensure the RTC subsystem functions correctly when hardware
> date limits are reached, particularly relevant as the rtc-mt6397 driver will
> hit its upper limit in less than three years.
> 
> ---
> Changes in v4:
> - Remove "rtc: mt6359: Add mt6357 support" to send it in another serie.
> - Change title serie to "Fix pre-1970 date handling " because MT6357
>    support is no more related to this.
> - Remove "arm64: dts: mediatek: Set RTC start year property" because it
>    is not requiered to have MTK RTC working.
> - Remove "rtc: mt6397: Remove start time parameters".
> - Rework time comparison fix to avoid cast.
> - Remove change in rtc_valid_tm.
> - Improve rtc_time64_to_tm change for readability and efficiency.
> - Extend conversion test cover to reach 1900 year value.
> - Link to v3: https://lore.kernel.org/r/20250109-enable-rtc-v3-0-f003e8144419@baylibre.com
> 
> Changes in v3:
> - Rebase on top of rtc-6.15
> - Added explicit start-year property in DTSIs for MT6357, MT6358, and
>    MT6359 PMIC RTCs to ensure consistent values between hardware
>    registers and the RTC framework.
> - Removed hardcoded offset and start_secs parameter in mt6397 driver
>    in favor of using the DTS start-year property.
> - Fixed type comparison issues between signed time64_t and unsigned
>    range values to correctly handle dates before 1970.
> - Added proper handling of negative time values (pre-1970 dates) in
>    time conversion functions.
> - Modified rtc_time64_to_tm() to correctly handle negative timestamp
>    values.
> - Removed the tm_year < 70 restriction in rtc_valid_tm() to allow
>    pre-1970 dates to be validated correctly .
> - Link to v2: https://lore.kernel.org/all/20250109-enable-rtc-v2-0-d7ddc3e73c57@baylibre.com/
> 
> Changes in v2:
> - Split the patch to have:
>    - Add MT6357 support
>    - Fix hwclock issue
> - Handle the year offset in another way, but the V1 way still viable.
> - Link to v1: https://lore.kernel.org/r/20250109-enable-rtc-v1-0-e8223bf55bb8@baylibre.com
> 
> ---
> Alexandre Mergnat (2):
>        rtc: Make rtc_time64_to_tm() support dates before 1970
>        rtc: Fix offset calculation for .start_secs < 0
> 
> Uwe Kleine-König (3):
>        rtc: test: Emit the seconds-since-1970 value instead of days-since-1970
>        rtc: test: Also test time and wday outcome of rtc_time64_to_tm()
>        rtc: test: Test date conversion for dates starting in 1900
> 
>   drivers/rtc/class.c    |  2 +-
>   drivers/rtc/lib.c      | 24 +++++++++++++++++++-----
>   drivers/rtc/lib_test.c | 27 ++++++++++++++++-----------
>   3 files changed, 36 insertions(+), 17 deletions(-)
> ---
> base-commit: 424dfcd441f035769890e6d1faec2081458627b9
> change-id: 20250109-enable-rtc-b2ff435af2d5
> 
> Best regards,

-- 
Regards,
Alexandre
