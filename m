Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BBC11DED59
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 22:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743201965; cv=none; b=L52DgSs51nqANuoNarItecLzhW56zLOiAsKPYEoFwBSqjR5PH6F7WARe2KzTj4LPDyYGC1xJviT+N927k0XBL0wpE6KUP2jzHSX5AXORKh4j54n10/oBo/PhxLsSouy3yBVVLJ/kl3+KFNRQTUqPdkpdiy6sMR228fJfDx5Y8SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743201965; c=relaxed/simple;
	bh=O9HcZ7QQF97Jl5Qs2jvOUMdMYn/JEbrhWafdueIC0U0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sSHbIwywiGb0k8hnd4MOusU+IgnytUiiOtaWhaKjw+VNEXUYRz3NJWFexcihA6zZM0LEX+dEGKmUSee4NFVR3AzvttaNltH3vWNDMQ49aI8wUe/AqeaqV6xFK0n/vaZLmZ793fJR2Ix2Y/XySk1XwCEL7D66l6uxCli+n1OSmmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NAmkQmk6; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NAmkQmk6"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-85e751cffbeso214446239f.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 15:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743201962; x=1743806762; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nqtWjpKQl0+Rceovy2PPRz2bVefezStJEzDQIoyhN5w=;
        b=NAmkQmk6feplWIROsL+FbfCE6ZnZWOjetyPSIINU11+ou59zm3Ju3wdFR9gIwRRGli
         0VVi1HN7lkyn8mqxK5fxCgNBjWf0M+rNzxKBgOJqjgg3vpRWUjbDAJGtKcSPdxQeF5eU
         DimZk0F7e65njAwbLfxNrtxfbmmDKbWZqQHg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743201962; x=1743806762;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nqtWjpKQl0+Rceovy2PPRz2bVefezStJEzDQIoyhN5w=;
        b=NB2yyZ02XG/OnML3Lz72G6W1ojrfv+1PQbAX/GDD1zgS/y4e35eGabaJizJmYn4YBP
         Um6L6eBbLvyJ86GuFfMABZMmmKL3rTcaL9sBbqCJUGV9caKITHsuo+pt3W1h7vk7tKJu
         qm09IlrHZWFuVq6FSO2Ygykx2NbpZhAh0eAweKKxnFVS3dbhpyM6TAUa3t6Q+mDjBJNz
         U+Ia0Oyk0jMLeIiuE3+MzXiNW5aIp6/mygdEmY5nK+KIszLUE9srZmAW2vLzauhsFFYx
         MGAmTbdUGB2dhHMYqxqZwAF35mMyWZuOceW2xgS20Wof6bOIJwRRrYbmy0uR+IxAFN9e
         l6jg==
X-Forwarded-Encrypted: i=1; AJvYcCVSjkgZxsnRdozQmw5yL+hNHm4tnl7hlAG2Gcp8Y+BNT+G0UAMI1x4B1rCsnJqa5QBomklqWC0Hm9+aE+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyK48gkdqyEWQf+ctUTUMWLX+X9I7pJro8RxrqWGm1LvtgMqZ9X
	h1Y5WzbN9fOQoBHQDWkJCkYTVeP6iLTL1R44kzjLLeUYvkULd7Scfe3CimtjLhE=
X-Gm-Gg: ASbGncsoCdznsSby4ST7IV/mRdsakxCTsYqi5tju4M/2brHAPHbOOJy+re/4G3U6kyM
	QKW9zfLdJe+jXcYTZOnphLFlMt5ouiIvs88f4Z9E47grGeWg8qboYDm7qjL6AT32yOmwIEQPDmN
	dV90/6WQHglNfaFwAySBUh5mbrdVWooz6AZmZL+5lkz6cs/Kk5MYzybJGrDdTkqscC2jzcBARoo
	exhUGF5qqrN7KBT2Ea6YzbPLVQY3s9WR8I25PZ5y1qpjUUccQXeNZsfHgI82zBrKQ/F5f6MuITQ
	TgknliE632KaNFBAO9a+HdA4iEpdXfAZwFbrCi3E04k+1HVQjwe2NcU=
X-Google-Smtp-Source: AGHT+IE8B0Y4+x7cusSExDaFtRYAJ4UtV2GfOT2Knpe2lYH3tt4pvG6kA/VEZg8rg2BDCxRFPuU0xw==
X-Received: by 2002:a05:6e02:1707:b0:3d2:b4ea:5f42 with SMTP id e9e14a558f8ab-3d5e0905e33mr16223855ab.6.1743201962227;
        Fri, 28 Mar 2025 15:46:02 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d5d5a6ce5fsm6852735ab.27.2025.03.28.15.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 15:46:01 -0700 (PDT)
Message-ID: <476c5bb9-79c5-40b7-bba8-b52fb244e90e@linuxfoundation.org>
Date: Fri, 28 Mar 2025 16:46:00 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: replace use of msleep(<20) with
 usleep_range for better accuracy
To: James Flowers <bold.zone2373@fastmail.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 aurabindo.pillai@amd.com, alex.hung@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250326070054.68355-1-bold.zone2373@fastmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250326070054.68355-1-bold.zone2373@fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/26/25 01:00, James Flowers wrote:
> msleep < 20ms will often sleep for ~20ms (according to Documentation/timers/timers-howto.rst).

Can you elaborate and explain why this change is necessary?

> 
> Signed-off-by: James Flowers <bold.zone2373@fastmail.com>
> ---
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 2cd35392e2da..2d225735602b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -682,7 +682,7 @@ static bool execute_synaptics_rc_command(struct drm_dp_aux *aux,
>   		if (rc_cmd == cmd)
>   			// active is 0
>   			break;
> -		msleep(10);
> +		usleep_range(10000, 10200);
>   	}
>   
>   	// read rc result

thanks,
-- Shuah
