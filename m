Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5678C70810
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 06:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745820658; cv=none; b=mnWZfP/el2R1EvORgltj8+BjyDPugMZDHl5P3zgG4G0euXoX9WKIhKEszvJ3mLfrZ5oWQ1ipqmjLHQp+jIAEKWAO7WzU8UyYB0BWqf1IlIrcHHst5avV+AHMrRD+jBTr/g2l65RRu8W2EUfji5mqdCE14ApG4HchRylSQD7igdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745820658; c=relaxed/simple;
	bh=9Otz/d2gzrWoOePyNeKzlIpVCpLA5uOam+AtSbppq4k=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=pe8MmCcGJL6nWtmn+w33ywCkz5as0NOh5NONR6jtx3s3IV+OPOlL6YdG7AmGKryF/almg0JqzBcx+nTeAsLZT5qNbcjS9/akN3dEVl4yeP/rEf1hlu+uue81Z3RfsFXTrrUvXcVUlykedYOZ7MONdDHSKR8OfTozdFoHbIJijFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q3oufHE8; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q3oufHE8"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac6e8cf9132so844286466b.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 23:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745820655; x=1746425455; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QphPfE+vUE67L3trT4TGohjxqNrvuWYQckH1kmeBzLI=;
        b=Q3oufHE8krJzjrCbJdctCb/d7isHMp944GMq8wkT00sERHuMMHrR2EED6v+Rp4Q4VX
         fP3ug8sv+gEIAQzoyLyaagUknGtxQddjTNoLO8PcYCKIb6unPTwuU/mPTA+XWLStusj2
         65cvh14Ryila8Y2AqD/BO8cNG+x+Ac7m2SKhfoUBdfTFthLn94qWu65inuqRhmwWPhDl
         J0FA3o4eYBrY542XKqzBXL2/+m2YUQCvxKdBW6Wh2N+NmXO6GFRst3oY0odfYH75YVsH
         KnGNfsKLnoCkb6B9HuZQRXavpJPoXOcEnjuhvJxk6+FQ/pz9CefB+ssN9uC4gnG3kW5F
         da1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745820655; x=1746425455;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QphPfE+vUE67L3trT4TGohjxqNrvuWYQckH1kmeBzLI=;
        b=az8izs4OWxE2vIN/oo3i4Qt8I/Y+NiZJw6DUHHDa+czyCrOn+FswTa7CPc0lL6gFw0
         e7Jc/nQTrcFfjC7oJ24vN/BortlpkBy8ZnpgOAxAxX7bEMOIlNhhJBB2F3SdIu9niPYg
         j+SijcfAz4ocncmtG1+M0JDbYQQ+Z2U/0p+n8jxVvFc67fkn3Y3nEFG+9OoRd0zobl/v
         7vWjaQwPfWyAcM/5lejRpGpY3Hn/MiSHmFBoKxzKbTzWMuUYTii37sl9jkADV9ITHQ2X
         WSL1MbrvWz0oq2o755Iw1e3Gdrjeq8qDFv+qFU9AeblhNyTqfqQdQn9VDXLkd1b4Mitf
         sBkg==
X-Forwarded-Encrypted: i=1; AJvYcCXmRUcVssnX3vXBL5sO4WUJnMa0zIMqPrA9I6ZG+eYjgU213uEqluQF85R8E2cTuCOEpHAlOnHE174gNb8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6D3TfZD5uIbOCkAjgyCI1nZ0tc4wlKgka+wtKulqeNX9PMaG5
	QW/L7aHowgILOLCtrazuXWVO1cH3lcOtRJv8K7rlsuwBhbwpMRMN
X-Gm-Gg: ASbGncs9X7/cYGP+7MR6qNv6fC72FWzsjpHdTrgI2UGWHuoMAczM05BOXFC7bgosP7l
	0PdHYaU8FL328ootY8YBVP4LQRtHWC2ipErqCBg7dOG3XdPYAquEjXHlHP1NiCTA5vOIMQ4r5iz
	YAemjuAEycw2KEZ0UYsTGT/+4cvuDXkwM+DTPfcj6VkdA0pHfX0bj6COWEJIdU62b4uV3ptd2dT
	Yw1OrF875pgOzbJPiCvhFAA5sEMg2h5W5dNLHyZECGfo2CRKZDnkIxtg6N7o8UFFodz668j6eA2
	l/poHHWkwGv90xxdPakVym32TsAQCVjPpwOQTzCmpKdsIadDvgbqsgFxPTIRPHjJssh1yYN7/Pp
	82/zzVwUyJCtLgbntVw==
X-Google-Smtp-Source: AGHT+IHkHGWY//K0wfWb5JEsBAo4EX5tBYhxssfjjb2vj5Y0wAC7SsY0YE6ZYBAcqI4jC1DXrJwMuA==
X-Received: by 2002:a17:906:f59f:b0:aca:a162:67bb with SMTP id a640c23a62f3a-ace739dcdd6mr918382966b.4.1745820654333;
        Sun, 27 Apr 2025 23:10:54 -0700 (PDT)
Received: from [192.168.1.18] (146.10-240-81.adsl-dyn.isp.belgacom.be. [81.240.10.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed70611sm569224466b.143.2025.04.27.23.10.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Apr 2025 23:10:53 -0700 (PDT)
Message-ID: <3aea4181-427f-4859-8a89-54c139775da6@gmail.com>
Date: Mon, 28 Apr 2025 08:10:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] drm/panfrost: enable G31 on H616
From: Philippe Simons <simons.philippe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>,
 =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
References: <20250403055210.54486-1-simons.philippe@gmail.com>
Content-Language: en-US
In-Reply-To: <20250403055210.54486-1-simons.philippe@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, is there any issue with this serie

Thanks,

Philippe

On 4/3/25 07:52, Philippe Simons wrote:
> Allwinner H616 has a dedicated power domain for its Mali G31.
>
> Currently after probe, the GPU is put in runtime suspend which
> disable the power domain.
> On first usage of GPU, the power domain enable hangs the system.
>
> This series adds the necessary calls to enable the clocks and
> deasserting the reset line after the power domain enabling and
> asserting the reset line and disabling the clocks prior to the
> power domain disabling.
>
> This allows to use the Mali GPU on all Allwinner H616
> boards and devices.
>
> Changelog v1 .. v2:
> - merge flags to a single GPU_PM_RT flag
> - reorder init/deinit powerup/down sequences according to
>    Mali manuals.
> Link to v1:
> https://lore.kernel.org/linux-sunxi/20250312232319.25712-1-simons.philippe@gmail.com/
>
> Philippe Simons (3):
>    drm/panfrost: Add PM runtime flag
>    drm/panfrost: add h616 compatible string
>    drm/panfrost: reorder pd/clk/rst sequence
>
>   drivers/gpu/drm/panfrost/panfrost_device.c | 71 ++++++++++++++++------
>   drivers/gpu/drm/panfrost/panfrost_device.h |  3 +
>   drivers/gpu/drm/panfrost/panfrost_drv.c    |  8 +++
>   3 files changed, 63 insertions(+), 19 deletions(-)
>
>
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> prerequisite-patch-id: eb8a11e2b24bb282970d8b8528834dea7ee392cc
