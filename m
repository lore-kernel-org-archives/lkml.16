Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E16D1EE7C2
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 08:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739261438; cv=none; b=QMVXMob9D5KVLpKyEPwNCamPTY22Bo5VzwHELVS28wEiglZ24lV+0m6D9aavxxzwqsSf5Xdc0uklyosFuK38LN5E4AZXavUrdHVOmdgMR/m3kt84087jdnbVoSRHgq7Jq3vO/fTSXSkpI+S6gSBxxmqEmc4OTNJVISKiB8D+I8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739261438; c=relaxed/simple;
	bh=ymJbeUbw4hGpBCPEcJ+PlTo7IzTTXMUzLHzPuWmSnyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FtbkbViNuzpmD6gZv9Bkm7sGh+/g8UqsiixQN2hBK2YNbtr9M8wn1BEnrwL8H8MUGqF6p3AOEVaDwwP7Otb0o7UcDE4hsJThJZJkq3LwGmk4UgeFJKK6eR9AuWDGbxvWwlR13xV41jfE1iuMZnEqBgtEtVfqmBB1lzdzTPEb42M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HHFYOwOW; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HHFYOwOW"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43618283d48so35831675e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739261434; x=1739866234; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=78daTuQVz0FgeVjUA2ayAuQ5v2be1XKpu60xXrbYshs=;
        b=HHFYOwOWX8739IgeT2ifq2wHr+ovgtGupJPU78Eoj+f9vteJyW+/C8lIre+rVNs28U
         JX5xomrXzQG9ejcs3A4Ppd7un/FPt/CfP8QlFa5utrqlEvqRD5rQZlvzshLlMND1fhjd
         sr2euDjaLw21jm2m5ZwKuQ+5IZybqnIfzzM4CDqd3J9tBDG7x/mDL/pzMXmrikjVLgJ/
         CXf8upwDetrF5zOfxZN744A7vAF2ima0rrmED6tF+umqWAJW64RsI7PSqJvf7fibib2m
         jKKqXSxxKy95EpDyP+MVC3a/gpZGytjg6aq9tK+SLEOrLZKJPsbjjz9ggDA8G0MLrEu9
         lHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739261434; x=1739866234;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=78daTuQVz0FgeVjUA2ayAuQ5v2be1XKpu60xXrbYshs=;
        b=rpPjprcqBIMCH3ueR+1CBtnYRpNEPVDooqdUFR1MPozdH+MgjH4KPDauqJLgOkN0w1
         0tmx6b7nle2A/5XB+dvGNt28zYJgY7AwzVkVdOx/Kqd2jIpa7pGvolrtYZmLjiA31udb
         joizbq4Ge2YJ00PN0g3DAxex0BJJ2GVdaGO4MJdOkhqHpP34B8YuPWA1XjUn50B3Hh6o
         ngJGQdh6M0Cz0/tmt8x1jXL9BP/842Tz05okGb0rbrWGFQ2H1sKJx02HJHwEjd6nxelF
         CD2CsAAoj7g5b9Kv4scaDl08dyMA1sMTsQIHkdGHi1v2skQO5GXvqPkf8JLEiv+dENag
         BEpA==
X-Forwarded-Encrypted: i=1; AJvYcCWKaccd1WTvdfTD/1aBQc1xVvY602EXpatF9ZR20AAxLpttUuet1+pDGP9w5oBPql1tcYuzNLdjqdLk8Z4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA+OoMKwmumJjsb4MvfRxjuyFp9HQFaI+gGqaph0jcUaLDGM36
	jYK9cSGdTSawYaIxzL9A/mhx7KJzTg/2IyQRlB+pIMB6Z3UDH02rhu1RMJvf+dI=
X-Gm-Gg: ASbGncvq9g05OdMCm3d/A4irdHfoUe6PLC43cAn3OvNiPhrnJT0kqFEV3oMOeRMVLxY
	0cXQfqk8mk16tcRuljhtzEzGAmvOacA2J4LkuFLJXflg9F9PkWciDOX1ZkoaVrXf2dCHXKnEjdx
	K8+wYuW9dEe+QKeuyl08EIHY3gkWTsmvxWO1RJWiz4AIJaZL3VRkNt+kCLFdQ0yfF80nrXhADa9
	dfXhzf7byGWLS5eYWa1RuFX6+Dqo4+HiEozwVLhtMayyOZ3Nh3i+ZVs8cU2riBK8dQzooKKRJL7
	Q83FXhzAwEM6ajVaUhTVdAAT4HNhvveGFJ4bwmG1vwbefqViQAXjdi4=
X-Google-Smtp-Source: AGHT+IGLXEpFIAWJT7WvqNnDlD3lK/vfQpTxfAdtyharhsIDVFsFgpEKPN9BMWXc0m9HymMjl+wP1A==
X-Received: by 2002:a05:600c:4e8b:b0:436:1b08:4c78 with SMTP id 5b1f17b1804b1-4394c8693d0mr27743475e9.31.1739261434474;
        Tue, 11 Feb 2025 00:10:34 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4390db10b2fsm201248275e9.33.2025.02.11.00.10.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 00:10:33 -0800 (PST)
Message-ID: <eab96d3a-4daa-472d-a7c6-50b28b7afeeb@linaro.org>
Date: Tue, 11 Feb 2025 09:10:31 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal: core: Remove duplicate struct declaration
To: xueqin Luo <luoxueqin@kylinos.cn>, rafael@kernel.org,
 rui.zhang@intel.com, lukasz.luba@arm.com
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250206081436.51785-1-luoxueqin@kylinos.cn>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250206081436.51785-1-luoxueqin@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06/02/2025 09:14, xueqin Luo wrote:
> The struct thermal_zone_device is already declared on line 32, so the
> duplicate declaration has been removed.
> 
> Fixes: b1ae92dcfa8e ("thermal: core: Make struct thermal_zone_device definition internal")
> Signed-off-by: xueqin Luo <luoxueqin@kylinos.cn>
> ---

Applied, thanks for the fix !

   -- D.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
