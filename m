Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694621A256B
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 10:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743329640; cv=none; b=RZXg0wbcmjHel3WhW+rxUNJMdtN+CfMayDLyYoVPLNafnCoqB7WCZdiB7FzBtoYPqbXd+aMI8Ll7oVi6P7ebxn6RNqnHtYjApXtpcU9/b9s4Y+Ef2CftuVacJerE2SK2JibyCrpzAIV+agQbXa3imxdvvcYB6kd6vM7sxafKUCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743329640; c=relaxed/simple;
	bh=5Dn34M3j1J/0yG2xzBOIVJdG+eWKyBdZzWhp6uW6JiI=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=tBnJ1bYvF/GQ5SwflgEgucYQKI5kf8xIlyYnWXpSIHCz50Z1zFxTk28/rlEeF0wsTcEb9nQHy5HHUgHVKVjZKhHKZnroTcrwoC0kHpCQoU/t1JZJiwvRO2TRhUFE2Yqy2StUMeu9diUTEN27lG/VfIh7BemEO6vlJLs749QZBeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ZLlD0nbt; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ZLlD0nbt"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e6ff035e9aso2258211a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 03:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1743329637; x=1743934437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JU9e44tO6FJo/GjHldkKNGDusFlokQ2t2C9nEsto6Fo=;
        b=ZLlD0nbtYKgcPRVStfN40UQt8fjE46Shna1bnIb1gxSE9B6ER4rbB4msA8LvSGsotD
         rDyyJESKgkWv/Sz2Is2vTiOXqumK+ezmg9XYniQztsmG4+6+Je3qFJ0TGS1GVH8rLq+6
         rAFHlwT7btx3CeYRGIyh8K40rg4/8X2fWBWK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743329637; x=1743934437;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JU9e44tO6FJo/GjHldkKNGDusFlokQ2t2C9nEsto6Fo=;
        b=vPsI/QIN6u57/HRlbMXnI6ipMGB2MgyKagjviFK9/fN4bQK3XQcNy6sV89B190aPUG
         vb2Arh5isM2BxpTAV/v/UBo4RQ2xWxN6cBg/xgF/Q/A1Ewtf4gjjb/Yr9kPwW0Xh2Phv
         np+OggANHLZvW1zIOGtjW0Z6ZO21ItFC8Lo5lFEvdLw+aePZYTuescrdrBMCWBRBfPhI
         fGc5TTctf037JMxk6A4QrhFNNUu0mIi1Q0z5LpOAnfP949R3r2LwC/C/vRlp+CmPTYqb
         Y+wA4q7UO9SOS2zdqFBoA9an/YGR351tevczUYjYeY9oiK0k+5hxLY43m20FE+GoLtDs
         TNbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGzL+EmZt3JRgsNU4e2LRk1qPN3/2rtNA9OJtTNZQVjMKTU8EYV0eGPHEXPhW+6/Fro4jHHcexROeS/+I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkXsOK1GicMCMiJGDLtChtJVk9p+BLfzdSjlnw2BP3j2Nakh8M
	d3ksxKLuziTqlqf6UGuBZlx2S6ImUQ/AaYc4zmlNWyRseA7yw1r36A7wATSuZw==
X-Gm-Gg: ASbGncshFv3VG6/FRhhtG9qkwk3RcfMmmRAyJQguVUNUshGPkYIndZR3rs6IfOTezZF
	UX86SJJfzch77f4GwaSajy7rc6ctGO3lObGxvqVgQs7YOtsVwiAx11AbmdBrLfKicdm5Rwp0Jt8
	EuBmkpKgBLORTQ0Pt9fjla0mAZairs39/aEZrzHLznNJFmysjslZ+EBC9oi0QS2vCgb6N+u7ycM
	KV8AUuyhsPyFC7MaN4qqYkwtNRjt2n3u6o5YMERMcvgD/OWnuvr8zgU7xOptz2ggqXsc8YJdfZa
	xML/9R+7TrGaw0VULM0yzCmVFDvGSZO+chvcD3O0ZokLfa4tx5nR0uD1qStH9jopEGx4ZCKTALV
	sYWPohbg=
X-Google-Smtp-Source: AGHT+IEhOwFN64RAI12GBOewic8rItD3qND4hzZYF1sIbS+MnHfLx1/+PRibZCWYf0GY0riRMXCk2g==
X-Received: by 2002:a05:6402:3490:b0:5e4:9726:7779 with SMTP id 4fb4d7f45d1cf-5edfcc1f72fmr4865313a12.2.1743329636709;
        Sun, 30 Mar 2025 03:13:56 -0700 (PDT)
Received: from [192.168.178.39] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17dfc4dsm4084750a12.71.2025.03.30.03.13.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 03:13:56 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Abdun Nihaal <abdun.nihaal@gmail.com>
CC: <kvalo@kernel.org>, <jeff.johnson@oss.qualcomm.com>, <toke@toke.dk>, <jacobe.zang@wesion.com>, <u.kleine-koenig@baylibre.com>, <megi@xff.cz>, <sebastian.reichel@collabora.com>, <saikrishnag@marvell.com>, <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <linux-kernel@vger.kernel.org>
Date: Sun, 30 Mar 2025 12:13:56 +0200
Message-ID: <195e68b2ab8.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <195e686b618.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
References: <20250330093505.22370-1-abdun.nihaal@gmail.com>
 <195e686b618.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
User-Agent: AquaMail/1.54.1 (build: 105401536)
Subject: Re: [PATCH] Fix memory leak in brcmf_get_module_param
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On March 30, 2025 12:09:04 PM Arend Van Spriel 
<arend.vanspriel@broadcom.com> wrote:

> On March 30, 2025 11:35:41 AM Abdun Nihaal <abdun.nihaal@gmail.com> wrote:
>
>> The memory allocated for settings is not freed when brcmf_of_probe
>> fails. Fix that by freeing settings before returning in error path.
>>
>> Fixes: 0ff0843310b7 ("wifi: brcmfmac: Add optional lpo clock enable support")
>
> Good catch. Thanks for the fix.

The patch is fine, but a minor procedural nit that I should mention. The 
subject of patches for brcmfmac should have prefix "wifi: brcmfmac:" as 
shown in the Fixes: line. Hopefully Kalle can take care of that.

Regards,
Arend

>
> Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
>> Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
>> ---
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c | 4 +++-
>> 1 file changed, 3 insertions(+), 1 deletion(-)



