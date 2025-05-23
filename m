Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751782045B5
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 16:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748016459; cv=none; b=iAOCyj2KFn+bZVpfQVOSbKJmY9mo6JoOXWX7JsDuVVegesopTGmuVtdxcVpJ0E3YDsLRyHBA/M7iwCV3cwjOdthkoR/fFLh8QtMdClHdB/c2IsNSeeI/9TbFKJnqsp75g5iYndF8LA9ZLDd/efJBKerCX++ShJ6f2C1mmhqPYE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748016459; c=relaxed/simple;
	bh=y9OYzuX98oTB1Cnsu0UWtD1TX6DeKBLx6XvM4dg3M5E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sx+WFb0lbruN4jlzfPr3ndldm4trCHROtwRBNqfp1aG73lXqUpRccDLaY+TgFnhYYrKeNzAGWa0Y6mKKCngAjrp5z6id/9gufge4kifJTL2ayA5vOUBC5wTF7krP6TDpl5rU6XFKOrbr0Lb3UlSrhbt2wPIOfpK7Pue8bNnKwoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UIwvPYqD; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UIwvPYqD"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf257158fso72452105e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 09:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748016456; x=1748621256; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ySA+I9x3ijxPrMXr+uDkaCBuOqoQX2Q5RgcLdxKb0qM=;
        b=UIwvPYqDiFyE0KWOHtncKn5Vw0aWT9Ti8FGGSE2yvNynG/aUXuFkcOnI3ynFslgb+7
         x7vruntiaqPwV0UG9TRiS1dTmxkPZ6OD6PMp9qelnciAi8+gaRrWJiaFcBN7BGSrpgDZ
         Kdompbog9FvQl2i6JWTyI6YL6zv1rvHTRc/A1ZoF2Bw6J7KXTXbWAXTmtzFdpCeLNssx
         qBXifebUeOGm08hLNxMr2v6KjfYihJRdt0QqeLR7RHLQhBi2YNV6OUGD9HuVJHKhGnT0
         FdnExBQIzNMwkRMFr5gtJ6FyXn/KRCw0Ok2h3lzndR/0e+ZETnyljh72xYHKMmY03kjf
         nXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748016456; x=1748621256;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ySA+I9x3ijxPrMXr+uDkaCBuOqoQX2Q5RgcLdxKb0qM=;
        b=QK3ObZAwL3JB2Q4KzIGs9C89cVh7LLtINXSJngCHbSElqZWfKVzpz9AqIvVsLmKVLs
         47YZUtsL+e/A4suLsOWz8zcB2LvWCQ4D2uFTZChBBn5qivW3Q1ebsoGCoSBU6b1rTVlz
         v1GNMUvHf3bVPMT3eAIz3KTAdz35jUxNIPVZ3FVdkZu3eFZ6/BCtKej65wIgPVFO1ADk
         fqrqm52j11q3WUXwFpT59Bymz0mCbewXTAMS0Z0feXwj5CP4x3JU+ERZna2oSDpZg9nt
         dA5BweEChq5Hrm1A6cY3O7zM0ePD5K9/t5bo10aPGAfz1pF5jT7XtpxVJeZsNohgkk/1
         /LSw==
X-Forwarded-Encrypted: i=1; AJvYcCWaIiJ+k1gCPNjdbzEDDIO5PefTX3itfLql3DObWynglg9oQv//i8Xy0qnw1CHvFrE5GsL98AArzDrJQSY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9iY1Ofd/Y8nR+2GYPmzmomKNHEiLVfHB+oLM1+Y1EdQRkrJFH
	Ep8IMKuTTWiXWuoq/1gXU2ofzOqFUdh+1GxIV+KaZ/O/OA0oMY9rNH+8uyiSDxG6LVQ=
X-Gm-Gg: ASbGncsE86sYFlnCKo6BF7P1dr6Fts+g02rq/ZNzYSYUScgFJU5S+zpyqBq73Rc3p+q
	gGsPnRgVvS1n8Jp2yhCmDZeKaPtkF1s7Nw0u7TQtxXkEKjWtAvhG7rpTpR/pmU2iNYnvJ4bVA8j
	wpvbm8la7qwXa53VYJKr0Jo+/vc/ECFp46DKWqMRdeHCjFLqmVZoi4X+5LFV1OJeFcPToqkhR7B
	VBvYrJi+jYK93cy+L+16uyQcmaki0Q5hBndPKgadANSDTZl1pQeKwKOUK0wXDG8r2ULGjx1ODRl
	JC7DGFtB016fWpbpwkZC6RMCLHtCtzZqTNWwsJD8j1Q/+xnd4qPJOYMM
X-Google-Smtp-Source: AGHT+IGofrhPwUyQkmyigwaxUlF2xUHWhAZovkrgIBPkwqcSNQYKQBTR5Syeu5oZ8hxjg03O13Decw==
X-Received: by 2002:a05:600c:528a:b0:43b:d0fe:b8ac with SMTP id 5b1f17b1804b1-442ff03c4edmr317016795e9.30.1748016455699;
        Fri, 23 May 2025 09:07:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-447f3dd94d1sm143921865e9.34.2025.05.23.09.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 09:07:35 -0700 (PDT)
Date: Fri, 23 May 2025 19:07:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Suraj Kandpal <suraj.kandpal@intel.com>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Xaver Hugl <xaver.hugl@kde.org>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/plane: Fix error pointer vs NULL bug in
 create_in_format_blob()
Message-ID: <aDCdRKZHmCPwaJWp@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The callers expect to receive error pointers on error but
create_in_format_blob() returns NULL.  Change it to return error
pointers.

Fixes: 0d6dcd741c26 ("drm/plane: modify create_in_formats to acommodate async")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/drm_plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 04992dfd4c79..75a7e8aa6611 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -209,7 +209,7 @@ static struct drm_property_blob *create_in_format_blob(struct drm_device *dev,
 	formats_size = sizeof(__u32) * plane->format_count;
 	if (WARN_ON(!formats_size)) {
 		/* 0 formats are never expected */
-		return 0;
+		return ERR_PTR(-EINVAL);
 	}
 
 	modifiers_size =
@@ -225,7 +225,7 @@ static struct drm_property_blob *create_in_format_blob(struct drm_device *dev,
 
 	blob = drm_property_create_blob(dev, blob_size, NULL);
 	if (IS_ERR(blob))
-		return NULL;
+		return blob;
 
 	blob_data = blob->data;
 	blob_data->version = FORMAT_BLOB_CURRENT;
-- 
2.47.2

