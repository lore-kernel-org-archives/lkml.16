Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DF62701D9
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751286981; cv=none; b=Dn2BQjHiEK7PuDIJa6YcxsIXzIBIOrO476t6hdE3twt5omocsKQ+CeZvf18vI6AZU30Zi+lL78HFHYYhn5XIRe+003rqlvZTnZhRWRTRqFdB+rCuz12lV0QgbKm+3xDk8O1m0Axoy/vy6+PMFCmFjQBHcwQhUA6QhW7IUBPDKDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751286981; c=relaxed/simple;
	bh=Iqbi9XJU3Rcsr9hOuzWCaTBhtE4KFyjIWoG/KOJnLcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PbVJROMiBZFfGqw6+I1ryPgFFVGwLDzPuIO9jCEAz/Ubk1SHKz182Y8epQTIO1XbYJ9yGQxRzX69fP7ckFGPWdSUunxmhwI3ZBwS8u8lQy0NqAXMQJ6tHrgmBoawDPNQejQfpOoghab8aRRGVPRIXl2isIMTTcj6mIyMw4nYP0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kNc9RbRH; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kNc9RbRH"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450ccda1a6eso16764525e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 05:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751286978; x=1751891778; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sTk6vgTqpktXfMs2jw1tzY/3Mhfdc83Si91WoTu70s0=;
        b=kNc9RbRHsyaYh0UkLJdn63hztu61RV+oRswciD6FCo1L/LvU4Sws/2q8rk/0dzkGn+
         6S2Yy79psRELTgsIkWbqFyeVXGgd35Igaub3YLq0loSgfBk5A2m3t4aja0hRz3gfZSz2
         Tr3lXrpBrgPgRMd9PtasyG6ziO8lpmaJPBUP/Ze9Bdg7u7dUf0oWSERItUGCFoHg2+sO
         ry213PyZeeGe1LzTZdgrSKPaIEuq1vD5a9jwvoQtW/7vJJT61k/XVfZDtmAngN4NE9M8
         niO5EjpCxRx6KGWdNhD5VeSG4fAUhosayx2xSXx2Qpb3mN7CvzBNFip/aRBCik89ccXE
         lbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751286978; x=1751891778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sTk6vgTqpktXfMs2jw1tzY/3Mhfdc83Si91WoTu70s0=;
        b=U/RxUEPjtWTJt2iSbVXNOeKV8/qQw7eThO6m+DsGXWZu5R1/gK6j48txCLtGVyBDst
         BWRbDz8kv/6s+BR1qKNai6UkpBWT3+XbNB2hcBTWyOGt1fkIG4HZhoB3OUXVNLAhu7gk
         RcPjBBgmvZgI+zg2lYqWZRR29ikri2KKInSKzaW6u/aDQnUtJGcfx17M19MGdTyVErdh
         sE1lX3ZK6lbylPF65pJbLkkgXDDhxOoyzf2rLsT8qIB7iB2qBXo2QU79H9Gjee+Q2LFP
         wVioGbWWA7VuNbG22/74cK3KsmW9BPfCi10UVaxHcE96E04kj0iZ/oeXu7v0IzjI8bJ4
         +HAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxI2Fc2giuu/5ErJYsWebzhD5MDge810w+rIgM52tAP0mdkd5N3i85p+EdnG1MHMzymyv5V8Tz5uZHvmY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSo1hb/vb5XSn+QOkTs25i1k9eD+k3l4SXAeWWYmLDJO/nuj+6
	zU6uHjbjMcLVBcc5H/R+cVWcfTkuukTeiIx6mUmY7yPtVKyqjkrQxMTT/HEetLAXjSc=
X-Gm-Gg: ASbGncuR4HfvstPdydShKG2ZEotAp7hrD4W8HHmrTy2zwOZwbR87my+meSl2iHc7vjC
	c1yrs8mSzfXc+RQ9mmrUnpZYq3lqoQMazVPsR9CLRzLXAY3vczGDMupzOTYl4Es33mTYeLc0+iS
	7iUfTjb8JA1kKmWYMsDzPZqG0hWAWpmLa4ZSCteZuPAby0Kdl5O+HasiOVdQBj8aWI0/Cq6Dp6t
	CSMVx+ceBvUTaydcmYmEhgJe/LxT09c/N31LXUew7b8TNgR3gZiBrIKjbqsdWSA7ztyV3dM5tel
	KGsPausCyZxfCer2GrlOYKg2wx8tej/a/GZ2RSgQG9IVbhAzYHpnfXWq9eIDosyEd8M=
X-Google-Smtp-Source: AGHT+IGodC564GL5rE7SFk0/J9O10Wn4F5hiF1J3YUnZxSumumM4a6Ana+kyQSrduZXBrfrz1Dx6YQ==
X-Received: by 2002:a05:600c:6285:b0:450:d01f:de6f with SMTP id 5b1f17b1804b1-4538ee51961mr149563425e9.15.1751286978275;
        Mon, 30 Jun 2025 05:36:18 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e59ab5sm10090309f8f.82.2025.06.30.05.36.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 05:36:17 -0700 (PDT)
Message-ID: <d86c48f4-fa10-4205-b0de-43fc8be0c848@linaro.org>
Date: Mon, 30 Jun 2025 13:36:17 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] spi: spi-fsl-dspi: Target mode improvements
To: Mark Brown <broonie@kernel.org>
Cc: Vladimir Oltean <olteanv@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, linux-spi@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Larisa Grigore <larisa.grigore@nxp.com>
References: <20250609-james-nxp-spi-dma-v1-0-2b831e714be2@linaro.org>
 <175128365072.28911.16806664823646528710.b4-ty@kernel.org>
 <9f707fd9-a9f0-45d3-aaec-e20bad4c4f76@linaro.org>
 <e5dabc83-eb1c-46eb-b24e-6dc8b19c4ff7@sirena.org.uk>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <e5dabc83-eb1c-46eb-b24e-6dc8b19c4ff7@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 30/06/2025 1:25 pm, Mark Brown wrote:
> On Mon, Jun 30, 2025 at 01:23:18PM +0100, James Clark wrote:
>> On 30/06/2025 12:40 pm, Mark Brown wrote:
> 
>>> [1/4] spi: spi-fsl-dspi: Clear completion counter before initiating transfer
>>>         commit: fa60c094c19b97e103d653f528f8d9c178b6a5f5
> 
>>> If any updates are required or you are submitting further changes they
>>> should be sent as incremental updates against current git, existing
>>> patches will not be replaced.
> 
>> Not sure if this is a mistake in the notification or not, but this one
>> shouldn't be applied. There is a v4 with some issues. Although the
>> notification on V4 that patch 1 was applied is OK.
> 
> Please follow the above for any fixes that are needed.

Ok I think I may have just been reading the notification incorrectly. I 
see that patches 2-4 are listed as "(no commit info)" so I'm assuming 
they weren't applied.

I was a bit confused to see this notification on both V1 and V4. Maybe 
an artifact of the first commit that was applied being the same?

So nothing needs following up, that particular commit happens to be the 
same on both versions and it looks like the remaining patches weren't 
actually applied.


