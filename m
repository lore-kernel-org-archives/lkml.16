Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBED323D
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 16:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747412009; cv=none; b=iBxMKrHNQ7N7BKTbprCr1eQtW2ZteZWBcxotT/PaHvkmTERry6OwmZKJ1xJGlet21rGt9tuNYGEdo79bsS/E91o7L34YZpv812ba8lpeGiyHBHfKnjAh0xGLmLoyq/cv07YTm7bj77WECiqw9Sfdj8kFklAvMh4lyFwDd4MrVE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747412009; c=relaxed/simple;
	bh=Jl7PZMVZyZYqkHZm8fEKqNok0zI8bgPv8dDYVJLvz4E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h4vyz9Zsx70ze/ZM3TUR8LciYsKiijEhE4XFg+VTTlo72w2gFZEraj9/oMyCiGZX1WQk6kTznchENsW8itpnI4zb9dDpBgJSZarI5ekdvRR9VwtfU/LpheBImhtcNv3lmyx6EYVU/Ktc0dZjPR7n7wVlAWwyzI5CBlhdT6yADd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T4CCE6P4; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T4CCE6P4"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5fbeadf2275so4305324a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 09:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747412006; x=1748016806; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hLJmovg9plUQcWnyMDtPPXJApgKGoEewf0WKlQ2WBJ4=;
        b=T4CCE6P4czBQKfA84CH4hy6L8D9NfF+xQ2R/Z2N/hLpYwpKZemg01AipuR+lm4qkGM
         ++rR83IOOlyN02LmlSAMVR9qo1iPSvRB6CXTg60eVbbsKz3f166tvVvXZshkbWrPGdvZ
         C7ww7aMB2iuvpNZTDfww2ucKPW01KIQo6twY987hYHXXIeDxxvolq9ccBCSGGkA9A5Ob
         GtNo1gkSCztmvpsW+1qmydq0urjrUiWGP+ehebvdrmZoSELnTx8mOEwfKGY8F2Fr6fHv
         aLKXmEZWEpp/+EmpZ1nv6GN2Z0GGa1RaNtrrN6cWJ8ibjav91xIUJSxDmxtvyIeWQ0PB
         jjEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747412006; x=1748016806;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hLJmovg9plUQcWnyMDtPPXJApgKGoEewf0WKlQ2WBJ4=;
        b=YmBGjTov1NpJxiZUlSWCyMIOj/MxxPhSAOvWxGchk42ruJkbPk+joK0vYBFpWBazFm
         x21DFDN7+nvukTFXonfpESICP2hbtW5yNBJvjozSwBDMRqZI5LKDlFTQOtBftU6nnVcY
         BrrX7oZk9m2ePPnb8sX5ZHEPPQs8KoPDrpeMsAcTt+o5DcsxaXI+9sibxtk5DA56UqHw
         OLP7XsYrjGAqaBwmrXcjDjZ4EdzOuo83J9DbWyd9RQiAn1cG3N8omrxIrDbATn+kKm6C
         0m2vG7pLS3WhoLUpsHvwEt8803sOsFE3Yyu0iL8b1LNsrazhBoLoWsWeIWEfcfcmq4CO
         YmcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvGMsdMK/ZD7GiSunZa9Rj+9mK4K9DM2mF1e98ty++tirxjw3x1wVBylwV/Xs2QA6ev22GPnBAq+sFFf8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4YM9tMczS2T4y0LYrE9UaGrl7PTdF5r3SH1OdAl6WxR4HCOv2
	iOXhV3mgfpPfURjsRypvH5TF76aZbc8skp330KLpN0t9A8DguDeWrnL3
X-Gm-Gg: ASbGncsGT/ccmJaJ1n/qVB1QpQL4dDbiNBcNRoYsptZWiQifZmi7q2Mg92PKMilbHDy
	p/EWrnCDju+kE2UonTR7E4Hds03BSBQ6P7GjLHa4w2/yZw3Ww9DFuRdkn/N/kmam4kU8PE9G5uf
	zNCpUlTLJPtyi8tVft8c1Zbqdccbxt8aPb0xFhfckI//OcpGlDTJRCwL9p1tXEOaTK+xTwF32XN
	XhsLQZMdvL/EyKyBYniCFPiXoqeFDUd2EbVackVe86xuNTjZ3/psTRAmNz2K3IJT7RJ0+3Gx69I
	W3ivEeYwc42je/WEO/RLe/J1OqG6Sapw+h5EFkQ=
X-Google-Smtp-Source: AGHT+IHNN4EPAuY1cd4IMbE8HdxTl2O6RmOg1nWALDwkNAMDfdDvrOuPS2dn2gOhqkvwH1ifaGmjtA==
X-Received: by 2002:a05:6402:5cd:b0:5f6:4a5b:9305 with SMTP id 4fb4d7f45d1cf-60119cd4192mr2838792a12.33.1747412005973;
        Fri, 16 May 2025 09:13:25 -0700 (PDT)
Received: from pc ([165.51.5.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005ae3888esm1616084a12.65.2025.05.16.09.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 09:13:25 -0700 (PDT)
Date: Fri, 16 May 2025 17:13:22 +0100
From: Salah Triki <salah.triki@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: salah.triki@gmail.com
Subject: [PATCH] drm/amdgpu: check return value of xa_store()
Message-ID: <aCdkIkNOQgnA5Pou@pc>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

xa_store() may fail so check its return value and if error occurred free
numa_info and return NULL.

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index 707e131f89d2..bff82ac651f4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -876,7 +876,7 @@ static inline uint64_t amdgpu_acpi_get_numa_size(int nid)
 
 static struct amdgpu_numa_info *amdgpu_acpi_get_numa_info(uint32_t pxm)
 {
-	struct amdgpu_numa_info *numa_info;
+	struct amdgpu_numa_info *numa_info, *old;
 	int nid;
 
 	numa_info = xa_load(&numa_info_xa, pxm);
@@ -898,7 +898,11 @@ static struct amdgpu_numa_info *amdgpu_acpi_get_numa_info(uint32_t pxm)
 		} else {
 			numa_info->size = amdgpu_acpi_get_numa_size(nid);
 		}
-		xa_store(&numa_info_xa, numa_info->pxm, numa_info, GFP_KERNEL);
+		old  = xa_store(&numa_info_xa, numa_info->pxm, numa_info, GFP_KERNEL);
+		if (xa_is_err(old)) {
+			kfree(numa_info);
+			return NULL;
+		}
 	}
 
 	return numa_info;
-- 
2.43.0

