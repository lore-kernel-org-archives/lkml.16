Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB98A1EF08E
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 08:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739263878; cv=none; b=NswljsNiK+J5FBCIwNhubulmW+OtdUnTAWpqyLArThUMwn0ZNBvWjPX3hwDyvhZVCibZMTYL0+Myj2haSNq1GcU+TJrIkuyYLt8A+T+QT8+BwS0VwzvdusLfs3FHR1TLWRLzBcL3zXJZj+4Mx7HgDg54L4S4sROoZTavs1PhXM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739263878; c=relaxed/simple;
	bh=uwOvEKjgbgfkSheXhWF/TM+S9VjTRURKDguxj/FPaIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qlDCKRzAKZfjiK+dwgIREz6yIjINAWXjUpZD8GLiPbpvnppkCN5MjKkihscZLy7SXt1e7nxP4G0VjgzgdE8ISLRodBA+wFrHqNgWyEx2Aqkjtf2mdKA+XFkX1/ql2ISmvpNH0SeQS6iMpN0WgI2uCoXYEwx+849YEdZxYRySB5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q0m6pnsN; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q0m6pnsN"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4395560cc13so1962025e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739263875; x=1739868675; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MBuVpfBGZc5QukwlLAhOoPlDs013WB9zKRqFDryvqwM=;
        b=q0m6pnsNvD08BHOucBX1kSYTIvBNSLzODyqxsTlpHsZObXnQW3MdeGchgJ8x81jSMu
         GMrnxwPnFJgLVBXORKgHFx5ueoxvxNPzxrWYIzQ07r3WXRm7weK67XME1GV6dCSak01x
         v/ooB54Bacc44aacXw5oy0L8URk2k4ZTwK8DD7TIZUt1NSZN8SfIvqzFEXu4aR01/lFG
         CudSrovyme/UgWOn5HIc4qvZgLohffsVwZ6aGc0appLsUPOgD6z3A+fJN5+c0yuqQt2i
         dQApsFfmFPq1NKBRTB0T65yG9KnsoD8bhqqaBcscISfaz5k4HLR3mcGOzoZjWxKcJ/PA
         kWmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739263875; x=1739868675;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MBuVpfBGZc5QukwlLAhOoPlDs013WB9zKRqFDryvqwM=;
        b=Lg0t8i22lm/5+xwsN5jeMPK57a027RS4x0tBGd3p5ftQSwKj9EdmW9Ed5P7yTNs3FY
         p7rfOHof/a3KO3yDsW8LYYT1VVgcTTy9gk0qY/ooLYQl4w11NxSzs5ndOrykOuucT28H
         fBquZ3mYyLVv1XutWzurhXI2XCuOoOYKx9VS8eM0c/BdQEZj/nKx+qyjIf6/ArNWJhzu
         kIT/tZhdU90dRUvH7ejfkJq5dzZxnImeVsEMY1CJEkCNggIIfdyj61B6g99riNR1LmBJ
         ZqF1SPb/bMSP2s9IE95k+rS83gxhARazNR9a/+5quUasgGCPlqPEKzsKaDOs/livXwci
         FGTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrJhNvaKRpCkPS7AyorUR59PNq+ZUzC802eI65ukBzVxrWMu/aqR00uDEhihY1rpU4d1xyYO8o2N/3Umo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxT9SJWXmZzzkZ3x3hxg39Kh4U3z9NeUSYp9UCpum07YIV9EKC
	oYMWxudPQUDfsfXwjFAgNydSZtdUXTVGC2gdv5Dno2g1vg0VVxv2jGkt9LqFc1w=
X-Gm-Gg: ASbGncunnbAcE4U0FSlZtZk3W8Qdw/4uhxFIZPy+x889ZZUTkE9eGzJiwaK3adGMIGA
	QqLGQcbHWA86c+Ovdoq4CE6k8OfkeMmq8s2vq3gv9PAVGUHfKFtZVAL5ntbgn0z1pR5XDzDvU4H
	oAfsi0qZjelGxs22Bal6ybQejcT520UDybShU8IFEhhPFbNteFcik4U8x434nAiuQFk7PSmTXu/
	mYWvdZtBNveq8qQANcExzP9rcNgUB1TQcBcltVw0le5qkGE5zerhrVp7JHpIDeLFyBS11UmL1vi
	milUyGXTmsdzxoj5341ePak/AfrZrBzGfL4Mq7pmCj6hc+ADW7cqQEQ=
X-Google-Smtp-Source: AGHT+IFO+zzAA08bfzxBeaVgp6Y5tU1Gn5sLS7Hh+RKdG5t/UoXpSO2gVdVDv0cTsXvcW1Ndi56IrA==
X-Received: by 2002:a05:6000:154f:b0:38b:d7d2:12f6 with SMTP id ffacd0b85a97d-38dc8d98e9amr11900744f8f.2.1739263875007;
        Tue, 11 Feb 2025 00:51:15 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dc0c5a894sm13914977f8f.95.2025.02.11.00.51.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 00:51:14 -0800 (PST)
Message-ID: <fe0b0066-5f06-412e-b66a-f3cf6ba74e9d@linaro.org>
Date: Tue, 11 Feb 2025 09:51:13 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 0/5] thermal/drivers/mediatek/lvts: Fixes for
 suspend and IRQ storm, and cleanups
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, Balsam CHIHI <bchihi@baylibre.com>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Hsin-Te Yuan <yuanhsinte@chromium.org>,
 Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?=
 <bero@baylibre.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 stable@vger.kernel.org
References: <20250113-mt8192-lvts-filtered-suspend-fix-v2-0-07a25200c7c6@collabora.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250113-mt8192-lvts-filtered-suspend-fix-v2-0-07a25200c7c6@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/01/2025 14:27, Nícolas F. R. A. Prado wrote:
> Patches 1 and 2 of this series fix the issue reported by Hsin-Te Yuan
> [1] where MT8192-based Chromebooks are not able to suspend/resume 10
> times in a row. Either one of those patches on its own is enough to fix
> the issue, but I believe both are desirable, so I've included them both
> here.
> 
> Patches 3-5 fix unrelated issues that I've noticed while debugging.
> Patch 3 fixes IRQ storms when the temperature sensors drop to 20
> Celsius. Patches 4 and 5 are cleanups to prevent future issues.
> 
> To test this series, I've run 'rtcwake -m mem -d 60' 10 times in a row
> on a MT8192-Asurada-Spherion-rev3 Chromebook and checked that the wakeup
> happened 60 seconds later (+-5 seconds). I've repeated that test on 10
> separate runs. Not once did the chromebook wake up early with the series
> applied.
> 
> I've also checked that during those runs, the LVTS interrupt didn't
> trigger even once, while before the series it would trigger a few times
> per run, generally during boot or resume.
> 
> Finally, as a sanity check I've verified that the interrupts still work
> by lowering the thermal trip point to 45 Celsius and running 'stress -c
> 8'. Indeed they still do, and the temperature showed by the
> thermal_temperature ftrace event matched the expected value.
> 
> [1] https://lore.kernel.org/all/20241108-lvts-v1-1-eee339c6ca20@chromium.org/
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
