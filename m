Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C4924C094
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 13:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744897295; cv=none; b=VNlBp2UPdHcfWzRh2Uh2iMCYu7bFiG6Msd427IVz3j+DaR482GbRx9YAidRtYvILMvzdOzpfJzI5spYcVLFRlyMwuMhBP1SjmItIdQr3aQAt8fP8cTHJ6udTKTZztZzVLu/3EZsWxJwqPAP4gvFHrfSs2QRd3Yp8thm5BWNrP0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744897295; c=relaxed/simple;
	bh=kuAfYP5UvARagG4xlp5uWE7wPsCM5ITfhZ2pP4vf4pA=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=jUXXfTM1ERuD/2j29XQzI9QHra20PBxnXJ/UcZ+saaOZ3vJZMcEggBhrFdyZGiZ4tJ67OsrxEZrKQqdturFgagPvX9J4hcAUsZoHKyrE4WDg8B+Ipy2FUnrUNFglUe83JtOZKVZ5237XI2WVVaVn/wbKOLtJ89PmSwyhB4b95AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=e7V8X+pK; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="e7V8X+pK"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac3b12e8518so148597266b.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 06:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1744897291; x=1745502091; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8b5UBlhI7tagceuxs0zjhouMKp8JoC3Qnn8Fd0hnCOc=;
        b=e7V8X+pKH54rHfUok1XqYDVkfCc0Kqg1XRvfabg7z5wgC4hk4PG0jEERDHtxYc+tht
         FuI8JiTw4Z6wUMwJmM1c2UcWZHunRZI9xHAWJh1aEDNP7Mju+KbBXSgMLl774giDiJNK
         XCvqaqMpZ16jf6cxu7k7DUi064Vo9z31+KQ9FA7mggmVtjxXWSssJFmnYoxFsUVephXz
         Ftt70HTGryZjVDoxwoHxOb1pPGPwOyUezcAJQAbqArakjzuvJJtywcxftjY2zb2RGUmZ
         bOSPy+oGzbWSsOht7feXVQguGxHcAgLPek6omtkAdCp6cHy5UBpAq8ubxAKSSN2AlfYk
         2qVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744897291; x=1745502091;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8b5UBlhI7tagceuxs0zjhouMKp8JoC3Qnn8Fd0hnCOc=;
        b=gx1OtD5Ncl8zH/zGUhq0+n1rpIpVk3xy6oimYLM6mOlwBYieoT4hLyZxtK0MkD2Kv4
         wqtw061a1DRbP6eTHRia91QUCjsuyT4FA4BHpIVKSjome5KP67ygOfCjZ+Ov/tajm30C
         NHp92GM7rfuAhp1YBU4xCtxHnJ/JDIBWQNGpPBbRMnbH+T94z62KTHbiC2henpFla1KY
         ZLPmdSngkyyjgqv+EF8rXlqeAuM+EWx7jfRinYAIeg0lGCoZM9I2qBRtKf/NOCcKv+du
         epgCJmX6k8BIj3uFdxlDRzepA6s3pt9kVxk0qJgu8/V4t1rPoronp3H9SniUoBATG4y1
         puHg==
X-Forwarded-Encrypted: i=1; AJvYcCVJeGtj9u4O1ALiCq82sQ/Sd4qA9X0mnThbyx0AhCWSpBNf9ETIhD1VIIQvHAWGBNkyJP55L9KOE1AHlWg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOntS6EyaXSz1q2XbH3BQaYHe1AmyONXWPyEpm41hbDDAeNgWo
	ZO6WKb8FeHP6i27h+NM335LHGwkLS1YiPJ/e+gpiZzRfxoMaSA3px0f9pTi20+8=
X-Gm-Gg: ASbGncuQ6x6yJXH2QJ1IcCywtSbTd7qvk8oVzKzocw/aOVd/+SNPLGob7XTR4sUulQS
	lwX7uVBS5TISiGWTOyDmg5vtDttRuE2vfccntl6xpsYqzyblLfs33P9g3+XamyJQqXaE9he9+8e
	YHP9DA4zkBhp7s/Djh5qLqxXcvMF1AN66ilDxn0sI6dx70+hjpe5i1qkkepf5YmYjFLXYvDutgV
	ujdxs5AB+p1m4i7UqFGo8++Go3sUnDw3+ma+YzWRBQUMoCCB4znL++9ZJXIKfpKPQIq101tYgcl
	VbDnJYxOMzlmEa/SIr4kXtUsd+idmvkyCbbovnyJhAfNMLulc2eQ3LgrkE6xF8P6ClW0TmhtftT
	gMd/oarS69A==
X-Google-Smtp-Source: AGHT+IEJ4vU8prXmzLSN5mk9ksAdjmPcFn2w8rEFHTB4zYx6IwyrLaLSsVIaikyfHr12C+NZTNoQWQ==
X-Received: by 2002:a17:907:9624:b0:ac7:391b:e688 with SMTP id a640c23a62f3a-acb42cc678dmr478100566b.58.1744897290726;
        Thu, 17 Apr 2025 06:41:30 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb608b1378sm97199166b.78.2025.04.17.06.41.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 06:41:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Apr 2025 15:41:29 +0200
Message-Id: <D98YGSPT9OB6.26E97T9QSD4NW@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Rob Clark"
 <robdclark@gmail.com>
Cc: <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, "Rob Clark" <robdclark@chromium.org>,
 "Sean Paul" <sean@poorly.run>, "Konrad Dybcio" <konradybcio@kernel.org>,
 "Abhinav Kumar" <quic_abhinavk@quicinc.com>, "Dmitry Baryshkov"
 <lumag@kernel.org>, "Marijn Suijten" <marijn.suijten@somainline.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "open list" <linux-kernel@vger.kernel.org>, <luca@lucaweiss.eu>
Subject: Re: [PATCH v2 08/34] drm/msm: Remove vram carveout support
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250319145425.51935-1-robdclark@gmail.com>
 <20250319145425.51935-9-robdclark@gmail.com>
 <q2tzc2cvzfu7hirxcd6l6vi7veynqdopdg2myjbjkzbslcu5bi@52pmnd3thdil>
In-Reply-To: <q2tzc2cvzfu7hirxcd6l6vi7veynqdopdg2myjbjkzbslcu5bi@52pmnd3thdil>

On Thu Apr 17, 2025 at 1:20 AM CEST, Dmitry Baryshkov wrote:
> On Wed, Mar 19, 2025 at 07:52:20AM -0700, Rob Clark wrote:
>> From: Rob Clark <robdclark@chromium.org>
>>=20
>> It is standing in the way of drm_gpuvm / VM_BIND support.  Not to
>> mention frequently broken and rarely tested.  And I think only needed
>> for a 10yr old not quite upstream SoC (msm8974).
>
> Well... MSM8974 is quite upstream, but anyway, let's drop it. Maybe
> somebody will write an IOMMU driver.

msm8226 is also using this!

Sad to see this happening, but I get the reasoning. Unfortunately nobody
who really knows GPU and IOMMU bits has looked at this in recent years,
for msm8974 we (mostly Matti Lehtim=C3=A4ki and me) have a semi-working
branch but hitting random issues with it.

Would've been nice if somebody made functional IOMMU support back in
like 2015-2016 when more people looked at this platform.

Regards
Luca

>
>>=20
>> Maybe we can add support back in later, but I'm doubtful.
>>=20
>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>> ---
>>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c      |   6 +-
>>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c      |  13 +-
>>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c      |  13 +-
>>  drivers/gpu/drm/msm/adreno/adreno_device.c |   4 -
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   1 -
>>  drivers/gpu/drm/msm/msm_drv.c              | 117 +-----------------
>>  drivers/gpu/drm/msm/msm_drv.h              |  11 --
>>  drivers/gpu/drm/msm/msm_gem.c              | 131 ++-------------------
>>  drivers/gpu/drm/msm/msm_gem.h              |   5 -
>>  drivers/gpu/drm/msm/msm_gem_submit.c       |   5 -
>>  10 files changed, 19 insertions(+), 287 deletions(-)

