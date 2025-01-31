Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C1F16D9AF;
	Fri, 31 Jan 2025 08:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738312865; cv=none; b=CAEHmeg/qphxS5EABDzBBKTYfJlKGDBJkmWUYcfjangtJPnS6G+0gH64imu5a2VotLccltbXFHut7yjQ2Z74oDcctLJkhzpbrqvtOZdjIM0yn5Rqv/Mfh86f8ZtEnGAxxYK+KiBToe9R+r1PFNALNb9bsQvlKxxgKrC+2FquUMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738312865; c=relaxed/simple;
	bh=9OvmeAP/yaxb5aAyztika1t5CYmLDNwvuwmGkZshUpw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=baXXzlnuBCc7VNvgope25iYiAxe9lM9mocXmf5FFvGpSImpH/6gokobSc5cvU8gy1ngcyZ6uEKfFAM0iiZZEHXyk0ilX0iVuJ1dWVGhvsw/Lupj8WRHXXdJFMsv3gRh2qlOVCGQiaWthIUMOEhn8vYR0eRtHnVL57T3oNCr1ygI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bRykA1nm; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRykA1nm"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385e27c75f4so1446608f8f.2;
        Fri, 31 Jan 2025 00:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738312862; x=1738917662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFCMfZy+LRqyqtC/JDVJZId3JJ+MKq0oFH9I3MWAyHI=;
        b=bRykA1nmJuZnZZqFYZsCt5XIJfAlFSnZX2OHWEB1ZgJ5DaeF2mtGAM1UcEk/+m4WXu
         9hYO+4QmM9O2wgdOMPMtoM8ePrVBJAZud56aPCxZlT300PgrCArak8/qKipbU7H6QTN4
         WhQceN7usjX72y821da2m4GY2LYABBzDmqIsKBd+wbN7W9e6ApOpyNkq5zQjdPLHAB+Q
         pQJonqi6NHEtqR9S8Kz+w8f/k7HnkoQ56ZOWR49sWMqjpe7MQhD4GWQzDcrx2KD9K+oA
         UOfhYyVawFSP2LGkAK79NX4hhtDSojfLpMGgS8l6BASi3SsPmf00fWx6O9GoC3ob01RW
         TJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738312862; x=1738917662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFCMfZy+LRqyqtC/JDVJZId3JJ+MKq0oFH9I3MWAyHI=;
        b=v/xHU27eee32GfduAUH+FqwnCTYHez9yxLVKLGVmg7/lhAo8mO4tdIf7I3MmWshJeR
         tvz/YPNa2zjwI3km7jiFa72MXXLgBFKmCLMTd4xLhag8at+/pTV4pkxN8E1ofhTsglYU
         Gw5xqjqSbHS6rXkxLavqXuy0CcrceQwNa3LBPp/dMeWnRNKODnFnELCSowEx5I7ojR8G
         pRMQjNH5hkTFKgd3wo8lyBR4V/pzWNezy/aWx8CYjYbyGJSQw845IbWql0IjP5HtXwHE
         886vLSvHy/ykui5t9HJDjUIPLoJkfgMTP3Y7ifrJOpSscjjmYbsxURP7aHkJOwiZsZ5X
         e7qA==
X-Forwarded-Encrypted: i=1; AJvYcCVMPNUI4HAYGZG9fG3D0JGE2jCc4g7OEw2UG3F4d+mEahK8kSZeJI/dEyCu+tleckEJ8RkPn3rETLw=@vger.kernel.org, AJvYcCXLNptvEE4kWNUOzDn7tyikK1EwYs1KMuWFZS7A71xcg2Hwe0LUAxIUAa2crPs/N65LWY8H0cMCYjIdSfrN@vger.kernel.org
X-Gm-Message-State: AOJu0YwdjpWbm0Y4hM1qytRwdFYdo6GzuAke/05lGorbmDzSZETz9knb
	saZSiYkMB+ptrUBX/CdxqWmiJLUFnwrJstEwRh6nQdymI2Hp18oH
X-Gm-Gg: ASbGnct8PtoiBS0FI9JqYnqhRGQaUj51p58b6lCm0kfLtqkqm64Pmypb/89xwlWuUyL
	9mmBs9DXl9xMsdNBI7dvxHdCurHzf0dPoH2/y8GEihghQ3noLO32n/qAvYlIJ69AYEv1kfT9Fwx
	XpW9VHv8lcAC3I2iQdV1doxwOwGoIWhKnyO5Wo1m5vw81jzBf/QMNRDuiGXIomS1cVRkeaZDKoT
	d8pFpeQoTtWj4TYrFo6l0lA0V4CnH84Gi1K2Rh6tGZe2TuTR/kLajqxn2aqHaNeucrDrQ/XV198
	amokh7pue8eskawA
X-Google-Smtp-Source: AGHT+IHza/p5nBamqbZvAahq9OiWU9HSheTWC1m4yiDjCZM7Eo+JyoR3cTHvjgCNhCUoDSwuWUl8qQ==
X-Received: by 2002:a05:6000:1842:b0:38c:5e03:5d9 with SMTP id ffacd0b85a97d-38c5e0309bcmr3870061f8f.16.1738312861839;
        Fri, 31 Jan 2025 00:41:01 -0800 (PST)
Received: from fedora.. ([94.73.37.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c101599sm3991904f8f.23.2025.01.31.00.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 00:41:01 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com,
	arthurgrillo@riseup.net,
	corbet@lwn.net,
	dri-devel@lists.freedesktop.org,
	hamohammed.sa@gmail.com,
	jeremie.dautheribes@bootlin.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mairacanal@riseup.net,
	marcheu@google.com,
	melissa.srw@gmail.com,
	miquel.raynal@bootlin.com,
	mripard@kernel.org,
	nicolejadeyee@google.com,
	pekka.paalanen@haloniitty.fi,
	rdunlap@infradead.org,
	rodrigosiqueiramelo@gmail.com,
	seanpaul@google.com,
	simona.vetter@ffwll.ch,
	simona@ffwll.ch,
	thomas.petazzoni@bootlin.com,
	tzimmermann@suse.de,
	=?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v16 4/7] drm: Export symbols to use in tests
Date: Fri, 31 Jan 2025 09:40:55 +0100
Message-ID: <20250131084056.2889-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250121-yuv-v16-4-a61f95a99432@bootlin.com>
References: <20250121-yuv-v16-4-a61f95a99432@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> The functions drm_get_color_encoding_name and drm_get_color_range_name
> are useful for clarifying test results. Therefore, export them so they
> can be used in tests built as modules.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Nice and simple, in the next version:

Reviewed-by: José Expósito <jose.exposito89@gmail.com>

> ---
>  drivers/gpu/drm/drm_color_mgmt.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
> index 3969dc548cff605cbdd3d56dceafb2ca00a5c886..b73a998352d175a26c69e0878da28a6288cfc8b7 100644
> --- a/drivers/gpu/drm/drm_color_mgmt.c
> +++ b/drivers/gpu/drm/drm_color_mgmt.c
> @@ -28,6 +28,7 @@
>  #include <drm/drm_device.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_print.h>
> +#include <kunit/visibility.h>
>  
>  #include "drm_crtc_internal.h"
>  
> @@ -494,6 +495,7 @@ const char *drm_get_color_encoding_name(enum drm_color_encoding encoding)
>  
>  	return color_encoding_name[encoding];
>  }
> +EXPORT_SYMBOL_IF_KUNIT(drm_get_color_encoding_name);
>  
>  /**
>   * drm_get_color_range_name - return a string for color range
> @@ -509,6 +511,7 @@ const char *drm_get_color_range_name(enum drm_color_range range)
>  
>  	return color_range_name[range];
>  }
> +EXPORT_SYMBOL_IF_KUNIT(drm_get_color_range_name);
>  
>  /**
>   * drm_plane_create_color_properties - color encoding related plane properties
> 
