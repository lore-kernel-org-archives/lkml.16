Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596492949E9
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 16:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748016500; cv=none; b=D14ULLYKnt9SGna8ZPfQo55+kzTuSLG61QHOXf62/2La51eJPqt87BehSjujYjVczK5K/cPd0fqCeGquIYiZXf8CQmym/ALxlDIaeJkwba3g9EaoeNKNAyI8GSGwZfpKfaEbub1BARVpOBzwYlhE8JjaRkUnqx2j8ZkF2NMxRmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748016500; c=relaxed/simple;
	bh=sOSd52a5sFsFjNwgnP65YA7nbCno1YCXhcKexikeCZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b9FUgtN39lSwhGC+MjYWyfEEDONIHvV/nmo+I/iE1X/Y48s+FBhjSvl97kK1p20j6dmGzSRigIF8XCEUtf3OT3X43CVm0EqXqh/a8np6gIgWQdT7Bnd0K65k7Zhfqpaho0J5tuI2JEJfD6putYIQUs6lZefpKa2mDCUFuUE4f1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bzPNEBgV; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bzPNEBgV"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3290ae9b011so158461fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 09:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748016493; x=1748621293; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hGF7HsXVnOrqTUKvr0Dj/ZLjMe7xNdGfL36SW0iFLZk=;
        b=bzPNEBgVxyGsYJJ7eQHtLerihWTYCCEkDyX9cuKt6YisD0fR0xk5rhH4jBPfJz4Yeq
         7D1qaq3ekppC0wUGiz5vUdTM3U/DK6ZEJSD/CdPu82WFFoic4Se6SzyHhtftRwxdJRHS
         Qyk8WhHMjxUOLs8e7iq7sGzgVdE5S93I4Wtqqh4Ycuqi9x3s9ZsUV3dF9Jniqc78e6z3
         +nIzV+bzmraVqMJymNgxAWQ7nMU1E32dWgs55v0pA+JFdjzXs297pffPnOZn04a9ka/k
         +dpiJUuyzlgNowCeng52k8FD78fyigYaOzmMAPhTGVi0wffKG1y8vr7MfdSWZ9WByNon
         WK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748016493; x=1748621293;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hGF7HsXVnOrqTUKvr0Dj/ZLjMe7xNdGfL36SW0iFLZk=;
        b=wUAEqVNTlHKD9/lXnwhx6BnSrSvc3QbBOx6YsLA16vmrObrIXOL3GmQeY4LyZf29YU
         jeFzatUv1j2IhqB9T2ZIf7g++8wmlUbMbNO59RKwLUj9VcwMHXG50UiZ/LA0xeIZ2Lq5
         pndLhc8bmEycvw3Kk/XDRDEftQVtf/A+Ms0r+ikz0LX78x7nts+z7EKsnrMsJ/dCs7eq
         cPJGFbaTpsxA79npSUT2kyL5WYg1E/TFHnY3jf/TDLDOEr3HbEW1XrNpkGux+3F3UHjp
         Zr55MSM+hjRAyTyOwZrzPQIWj3KiraYt20RBdHP96pfMJ6x3NsZm1Es6PQIr4wVpbHMC
         2m1A==
X-Forwarded-Encrypted: i=1; AJvYcCUgAcamUti3HyVKWSQSifxtKmD8Pfx2y31HnaoTB2bq2y5eJX49xq6/nrjNsgTzX0TZvVvGOpIuubdPKH8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPfYEoZ3cU6yi01yc1kTuBgrTLXo2tkYgh9P/8QbXSFX5vjmF3
	O1ElaT4/nDFW6GGHzc9oGM0bf8LRT3sF+ii81PMeMMLWvFEt0o8eVUa5JpklTmERYda9vlToaAs
	Hgkii
X-Gm-Gg: ASbGncsZ+WRQdpqQ2ZubIUqdGPxdzip8NDQM+mbVbIJb+aTUGQZIOY8kvdhRUcPI8Ro
	IjIxuJ3pEpuT00cJccjQGPDwc6Dw2H9l/fJ3HkNxvLmH8XJGWDWBY5+3G9QfBDDg7s8OfkLKtIH
	N3IiGydHIckQmIS3vc324edJ+k9YYD2PJ7e64EES1wh64ZFzt70iECIO68HcQ6EeseKSLDWy4tn
	HEec3EANv9fQTg9X7LxA36Mjm9RzRe8SD4jpLANBbwnaDEWJ2814eCcNmEtnlMUrbM+ajA8vn2Q
	Mx0eW4XDXbRUdQAsUS/5zUlw1fnteow+qYamaE4iYQMkPHwKNPg37c8y
X-Google-Smtp-Source: AGHT+IEgnqQ89pTDpIiXTK+5YoVr8iR1h5pIE/WFcVljNceH6shNrv9ACEId9Fo5qIq8B9APct4R0g==
X-Received: by 2002:a05:600c:3b21:b0:441:b3eb:5720 with SMTP id 5b1f17b1804b1-442ff0396b5mr274072555e9.29.1748016482352;
        Fri, 23 May 2025 09:08:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a368136014sm22978069f8f.92.2025.05.23.09.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 09:08:01 -0700 (PDT)
Date: Fri, 23 May 2025 19:07:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Dave Airlie <airlied@redhat.com>,
	Lu Baolu <baolu.lu@linux.intel.com>, Timur Tabi <ttabi@nvidia.com>,
	dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/nouveau/tegra: Fix error pointer vs NULL return in
 nvkm_device_tegra_resource_addr()
Message-ID: <aDCdXk98AhLBcWvK@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The nvkm_device_tegra_resource() function returns a mix of error pointers
and NULL.  The callers only expect it to return NULL on error.  Change it
to only return NULL.

Fixes: 76b8f81a5b92 ("drm/nouveau: improve handling of 64-bit BARs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
index 0ca2dfe99676..114e50ca1827 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c
@@ -196,7 +196,7 @@ nvkm_device_tegra_resource(struct nvkm_device *device, enum nvkm_bar_id bar)
 	case NVKM_BAR1_FB : idx = 1; break;
 	default:
 		WARN_ON(1);
-		return ERR_PTR(-EINVAL);
+		return NULL;
 	}
 
 	return platform_get_resource(tdev->pdev, IORESOURCE_MEM, idx);
-- 
2.47.2

