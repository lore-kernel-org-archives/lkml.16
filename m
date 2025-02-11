Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA7A1F03D9
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 10:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739269155; cv=none; b=IYlcn1sfll+em4h+89AB5zV12dbUZyoLHGkWwD6CYo5zMxJ8yELdCl6tCDLO0z/OJsYCSyGEeQHnIeSVPiBNKooOEilakT51XPnkbPTjJ2ikcdd31CSD8h+LLaZZ8G0cDIql+CNG5cTPdRLJhGBbTAuvaa+yN6uIGA/9kylRQkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739269155; c=relaxed/simple;
	bh=mmYq0ka1rA31PoqSV1w1EnHuELlMe9cDQhIVsboEH4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n5dITzbiz11+1d/9p11QyPKUWJNvAPpGGftcSQGBWhlID54qKokP7s1bk67NA5QHQnaYapOXQkOQRENQiPyT/Zf+fsBYb8QJWni4L9yL944VwzihDZtrpeGeskUJXnUXuqDxFTI43XFpuvCIfp2xmfXSoU8JRkUemo7kQApHn5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FbIZsUL0; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FbIZsUL0"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38dc5764fc0so4001245f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 02:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739269152; x=1739873952; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d1+7CYo2GEpNNd6dJTgksWpYBgWB3H8P41Hw271gq6M=;
        b=FbIZsUL0E8B1mxv3MhwM5VVhhb8aivonj/oWvHc7eWMXRS6cREBKaKwbLbsVBJ3rCN
         FN5D3/qGfyyyFBjiSkmObVbzwdaritTR8bpi16EVsMeXVIYvftwGO3XaOkBuGfREzlv6
         6f+pAyEkTxy4bY1H9BZUpxWeU3pXXvfdn8PMVbbPvG7gtV8rwLf5wZUjMLZZiIf3wjX6
         Zzd0ZVw+5Mjvrm9DsiZKiOVeCDma7WY+mxOPQsuJso2xqZF3qgmrM2uuebEMe6VOkDBF
         SlCM4vzxY7gUARIUqlMJli7b9jynxtuxy5kU4OBgB4PVLgwBqjlrNVVWFMgylzsvN/Nx
         KlBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739269152; x=1739873952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d1+7CYo2GEpNNd6dJTgksWpYBgWB3H8P41Hw271gq6M=;
        b=NlIJSBXSUHPmM9ufexp387knPhIh0yFxrdL8HY5vnba6xka174rHtKaOdA8LZ2TuEn
         PXlEJEWWDwNUx3QlAQXTLaGbUK/P45EeDIolIzx1KIE7mIMLyszg90tpfBFl3WHPQCph
         3mELMmu4MuqCahhKHb72Mf8fjwebcvo+N+wQXnLP1cZDcIx62ngLNNbXXSeCdci4ftbV
         M+vvPZJBXWPrNBZBBozPMl1I1oMHaUWXG6CUbnhCg3R7DocOtkINnZz46ZTwKmFXkZER
         7j7bYuFBXHdHkGlG3iRO8usm/TdynOY5aStmHqXowRLodmuXuzbd2RTUprEqIk3Fau99
         n36g==
X-Gm-Message-State: AOJu0YyXR156pfXku20SKd/G25JyLlO1aeIW8wJvXsQs08FT7nWkVRBJ
	ZvZIn4//19HKZ2NpCP5l9/bMwbVLiOS9FiLMgZ2AA4cOTX3N3PFj0EKDUn2tdg0=
X-Gm-Gg: ASbGnctJ9LrsVh3kgUIRlxN2+QhiDs4THjZs2Cekxa0QvSVINEIkkSyUE2jMLbVMEAz
	YjHCmz/Q2dJbB2nQbApABXLQqGnmt+wPrnYzbbWDTX+d9TIiCJqeXCw8HrhC4WItdic9+CjttAJ
	+gpc7aasx9ZEIvjys7wL4FCiaK+mzQSNSpuJ7uRIw31jwRL+cylyGJs4xFRHjFf51sjphqyNyKb
	VfBEBPbx6VFLWcey0+XBMHqMTDgZYEXXLvlzOdADxe8ffrpYgOGJj0sqFcGVfkKKOBFfdW2XYUd
	xxS3M1VG8NAJJqod58GXAZlYhb2xJ0P4bSzws4IyMtC56zJE9jiG3N/N+Q==
X-Google-Smtp-Source: AGHT+IHh4hDVGqmsMf5rJQ27Gh0Zf6r2TAYfUuWPHNsKZyYXSF39sDKmhxO9TOc6pLn17KWtWMv46Q==
X-Received: by 2002:a5d:6d87:0:b0:38d:d69e:1326 with SMTP id ffacd0b85a97d-38dd69e1b18mr7568941f8f.9.1739269152351;
        Tue, 11 Feb 2025 02:19:12 -0800 (PST)
Received: from [192.168.0.156] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd3dcca71sm9090007f8f.76.2025.02.11.02.19.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 02:19:12 -0800 (PST)
Message-ID: <012b0381-a5d1-49bc-aa59-aae0d35aa034@linaro.org>
Date: Tue, 11 Feb 2025 10:19:12 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] media: qcom: camss: Add sa8775p camss TPG support
To: Wenmeng Liu <quic_wenmliu@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250211-sa8775p_tpg-v1-0-3f76c5f8431f@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250211-sa8775p_tpg-v1-0-3f76c5f8431f@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/02/2025 10:07, Wenmeng Liu wrote:
> SA8775P is a Qualcomm SoC. This series adds driver changes to
> bring up the TPG interfaces in SA8775P.
> 
> We have tested this on qcs9100-ride board with 'Test Pattern Generator'.
> Unlike CSID TPG, this TPG can be seen as a combination of CSIPHY and sensor.
> 
> Tested with following commands:
> - media-ctl --reset
> - v4l2-ctl -d /dev/v4l-subdev0 -c test_pattern=0
> - media-ctl -V '"msm_tpg0":0[fmt:SRGGB10/4608x2592 field:none]'
> - media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4608x2592 field:none]'
> - media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4608x2592 field:none]'
> - media-ctl -l '"msm_tpg0":1->"msm_csid0":0[1]'
> - media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> - v4l2-ctl -d /dev/v4l-subdev0 -c test_pattern=9
> - yavta -B capture-mplane -n 5 -f SRGGB10P -s 4608x2592 /dev/video0
>    --capture=7
> 
> Used following tools for the sanity check of these changes.
> 
> - make -j32 W=1
> - ./scripts/checkpatch.pl
> 
> ---
> This patch series depends on patch series:
> https://lore.kernel.org/linux-media/20250210162843.609337-1-quic_vikramsa@quicinc.com/
> ---
> 
> ---
> Wenmeng Liu (3):
>        media: qcom: camss: Add support for TPG common
>        media: qcom: camss: Add link support for TPG common
>        media: qcom: camss: tpg: Add TPG support for SA8775P
> 
>   drivers/media/platform/qcom/camss/Makefile         |   2 +
>   drivers/media/platform/qcom/camss/camss-csid-690.c |  15 +
>   drivers/media/platform/qcom/camss/camss-csid.c     |  44 +-
>   drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 245 +++++++
>   drivers/media/platform/qcom/camss/camss-tpg.c      | 737 +++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss-tpg.h      | 130 ++++
>   drivers/media/platform/qcom/camss/camss.c          | 113 ++++
>   drivers/media/platform/qcom/camss/camss.h          |   5 +
>   8 files changed, 1282 insertions(+), 9 deletions(-)
> ---
> base-commit: c1696380f08cf7cc68560a11f2e8c51cb24aa7ba
> change-id: 20250211-sa8775p_tpg-7de227a82eb4
> 
> Best regards,

Great to see this work.

I think the TPG should be another type of PHY.

---
bod
