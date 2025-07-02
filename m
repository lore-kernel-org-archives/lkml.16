Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5854A2652B6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 12:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751460916; cv=none; b=M5IM0RWafbiIcSrGA/hQ+o6tpUCtOlM7oRMVNp4FgURITWBC6kGHhNZqOHf3Y9+zxnd8qRcD+AhKQdy4GRVrCbMxMJdhSqdB0z4HSxlUn7VJV8O42txxiyBugM8GEM8xcmE1lkSOZZTTXqNtb/QAqJVIOOPL2OXbr7AbnDBv7Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751460916; c=relaxed/simple;
	bh=mM64/l+BoAfrZDnKLhvKyOQO1tYBWKk29YEAVmVFW5U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DnQv8yr7bZPqIfIISeR5alII/zMzEv9ze//m3Qiwynf0/+Cf8vq57D5m5EdW0zTbEdssDxPziSYXyltgvMXq9PZ6Mw6cBfuCCbCWgUZHcr2NMIdNvBNTgvyUHQu19L+8laaGIIaSYMYnIlOuvkEpINhj2cnoaNmPUK0W6TSa81I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bzU1HxKK; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bzU1HxKK"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2ea58f008e9so3774443fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 05:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751460914; x=1752065714; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NmMXignAcgy9m6Sf/k76zsomjXcz7tyoG6UG//CdDIU=;
        b=bzU1HxKKRVGr9UPj5EMkLH9JvDJxkUxJPexxVtxiEtPnauAC2V3e7bFSU/1YNkfoW4
         dxtZUqTTjUVppnIFUz5IGijXCBEz92LLIVlYGqesZAdyay0H/9EO2cMx2OJDZuDO7cEY
         8fByr9irjKSnnYvcwk9dwcCqpo3VkSebWTWpqhXBvFuEk03KYHUw0Yq76PXsarhmOpVV
         EwBGfIAx3r7ehMIsUP6NqXWWLRip6MZgSSLzxoucocaSkjsDEeGmB4CJFYOldLs3CMvV
         G72wQZ1+74ZR/ZuD63eiNvFAt7XZB3ws/ewOiCgTm0M2Tcbqzt6juon0M4nVit/GrKa9
         qAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751460914; x=1752065714;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NmMXignAcgy9m6Sf/k76zsomjXcz7tyoG6UG//CdDIU=;
        b=KoFV5NaE759ghejX3O39n6RctqcaqfZcpUpA/VgMejvhEsZhPqJo+PV4QH2dr5fxQ3
         +pyyqM8i0JtPFXUbQIIVApfjwvi20shO2PAOSrKjwkBGu6ftE0L5hPDzBBUwBFXdNWux
         dw8+r80zShjWmNWlGqnPLy1lypGsalu0kie4S/DW4dtfWxlPIrHVsbXOI1kra8AV/QJy
         LWgUUmyo4e9C5F4B8NXHngw5Fd8f4DRUs1pvPfuQEBADpKMEBZA1E728YRDVvO7sxSH5
         Lv6qv09nUD5edg/pyvN5UwxhQAOvwCBBzixHqkKx42fZX+RrvdCiXtIwUXRMc/dbWu4a
         HeGw==
X-Forwarded-Encrypted: i=1; AJvYcCUQrtCFS5JX8BQXIEyEq0HhmKTF4cN3Nj4OS4OblGgN+UCZDz2QrTGutsC+gUl4qIvHeYoUxycfrANH6ss=@vger.kernel.org
X-Gm-Message-State: AOJu0YypaKS24GD7ZRTaa5EGUvEFh97QNcb1E6rpuCjhSOH5fgabnrrR
	jwIv1y0sj7PW7PovaqCackZrNjazgqiwVSqzEIq+mnjRirfQ47rSFWdgaT9GF5tpfFM=
X-Gm-Gg: ASbGncsDTvpA+Sjtcx2CliNCmoAhrcveRdACrMn0nPrghw0SR47CzjENEPlEk/lfScA
	y0teATZH6SjBVlOhR14QIYUv+kF6K4OYGgZhTuYnx456CGfylLQ4g7lZpQj53ENCrs2syaXL6p8
	zRnjMg9IFXgUwiHcUz858mHUikf6wqzH6EV+meErNeKeyZhnQ/gRlimtVFO0kkENrdjPmWtIp/x
	pFsmAuVlfGhk+YiYTz5ZIY94JleeFJIYAR86q07+pCVgSLq9WuD0UH/D0XR15nCL4rvR/wDeKSC
	F5fVvUC4ZvcnEg/3Yaajy4DjdyjMK2oeTsQVY270XskO6R3ux0Jx+sa95GhLF4POpi+IeKgbyf5
	rmw/u
X-Google-Smtp-Source: AGHT+IGcYN9rPOHHdQ7PsgYM3Fqg0wPgCuGzQFBF1b+DB5bmZT4Xud99Stxy6A9dj5LlWMYjIyWJnw==
X-Received: by 2002:a05:6870:3d92:b0:2c2:cd87:7521 with SMTP id 586e51a60fabf-2f58890100cmr1816505fac.4.1751460914344;
        Wed, 02 Jul 2025 05:55:14 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:93a7:d85e:d088:8154])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2efd5145967sm3792144fac.49.2025.07.02.05.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 05:55:13 -0700 (PDT)
Date: Wed, 2 Jul 2025 07:55:10 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Suraj Kandpal <suraj.kandpal@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@intel.com>,
	Imre Deak <imre.deak@intel.com>,
	Arun R Murthy <arun.r.murthy@intel.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/dp: Clean up white space in
 drm_edp_backlight_probe_state()
Message-ID: <30b896c2-ae71-4cf2-9511-2713da7e1632@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code needs to be indented one more tab.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index db7896c7edb8..1c3920297906 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4245,14 +4245,14 @@ drm_edp_backlight_probe_state(struct drm_dp_aux *aux, struct drm_edp_backlight_i
 					    "%s: Failed to read backlight level: %d\n",
 					    aux->name, ret);
 				return ret;
-		}
+			}
 
-		/*
-		 * Incase luminance is set we want to send the value back in nits but since
-		 * DP_EDP_PANEL_TARGET_LUMINANCE stores values in millinits we need to divide
-		 * by 1000.
-		 */
-		return (buf[0] | buf[1] << 8 | buf[2] << 16) / 1000;
+			/*
+			 * Incase luminance is set we want to send the value back in nits but
+			 * since DP_EDP_PANEL_TARGET_LUMINANCE stores values in millinits we
+			 * need to divide by 1000.
+			 */
+			return (buf[0] | buf[1] << 8 | buf[2] << 16) / 1000;
 		} else {
 			ret = drm_dp_dpcd_read_data(aux, DP_EDP_BACKLIGHT_BRIGHTNESS_MSB,
 						    buf, size);
-- 
2.47.2

