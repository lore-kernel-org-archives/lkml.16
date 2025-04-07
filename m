Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5099A1F3BA7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 14:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744037932; cv=none; b=WEQswaIDLltmCzh8FJBS3JhsMVKeZWJS8rjlaFeHpS5ZzYQZFLhLW9m5L754dnLaPEuOl0UfbCN971r5PhJLYx8Xntb4LCdJYBYUZm92kvQ+DKimhoKjsTVe7FdbRqCjsRHfi4s2b89hER07WynXVRL0FcIpB6tnoJGKjJBNmm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744037932; c=relaxed/simple;
	bh=BpzgmuGlEFK/RQSOak77g/Mgr8Oovi8BXchVpl8j8E4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NqEmZJg1XRXaojdn9G8WGmSxFWASL8rnKScgBZ1DriyjTTGZ3tlwfq0ig33Ej2Vh/JWWJe6ydum6WyGeRrn3SP5Tows4KQ7HdluSkmoAlOjjLV9oYN6WkRofb7+ldeqVva+dDsvMDh4pOGiuFY6X8WGjgDc/+wOXC2eO5l1UCoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nVyN3qze; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nVyN3qze"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6eeceb05894so4994966d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 07:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744037930; x=1744642730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BSL/Umne63WeKz6DVQx0NLyY1Y4Pn9uacURukfI+Kqk=;
        b=nVyN3qzeqaLxh8SKoM7Cg3NaFkTJY/ep01AR69ROQhGeBclgKSC5Ww8OzMEjn/uE7f
         EmwlSaDyh5hroT8b+oasPmNNff+03X1R18PIW2rbVeoelCcw+RRvnMF/X72p9v+d5sv6
         GbJVc5wrRwtMlVNOvypzcQ/Y7SPg6YG6uvrE3GcrpPm5acqenMY/xReHnFbpz0emdAGJ
         aM7mLPWBA7uSjHK4AER+2sEu26Q2Wp71vQ/1CvMeAe9M2fXj/v1RNGTQyOPsteLHoJsd
         fELpFt7eeAUHlyOwX6Wojnb82fAFWLnRYLTazQI/20HneihNALCELIl7/9odcsU9tWf5
         vjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744037930; x=1744642730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BSL/Umne63WeKz6DVQx0NLyY1Y4Pn9uacURukfI+Kqk=;
        b=ZDLtqmEAZdtO4YLoFdrlv6Kd2Jek+uf5hmeQdpyeqRgDa22DS8E3b6c1zxVy/aqlIb
         JtjPWqhOFcNMToQuj3THYlCKjFvO/h6nGhdOQruP2ounzkBtCHnAa8EylT9NZgF7914f
         tG9Pgm3E5T33BQyqY8zrvsLnmKRU0vfsNsRYg12Y7feKuLKZADpfrzEngiMxUNTa2OGo
         jc4mdxPyioW8mea3fNLeqOPG90rnzYz8kK5usIiuokCBWyWiTXIBjNJV9BkcyMH7tpZI
         Bwb4vqH3M85mmVNw+Ldi7LIcQuLGtkUvSpfgydAPMi9uOjB8TLLXZyYXzgGUcKoLF7hI
         Yd9g==
X-Forwarded-Encrypted: i=1; AJvYcCVWoOw8yvKIWLLGdEjfHB39QEcznRc8iDIcAmpb1QDZVLEvT534Cu/l5xXnF5haKoUqo2na8vgNT6SUexw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyX4vNieRUB/SL77EwSPI1/N/pcod/22doFURfB5vwhVvzYhYD
	ZS4zWJxwg8Wg7D/a5EWo7jOYKyKko+tWa/B9V90sUapJF2cJeSU=
X-Gm-Gg: ASbGncu8B7FgGUeeTF/tHSs5m5rECHUVOdk0+OdgftSiuqMQO76bdc+jUmm1w/+BGLj
	WbXpC7115rZrE+op1+1TMtcQ8Cvfwh0wsm0+z1UVis+ScpFViI+XXdRRQy9UUrVrUbP8AJB3SiP
	JbES61EoOi05/uQn+Nsa/MFuBGJQbxKoJWko0ukuguVL3cB0MztjG16efUGxGPY70futWNXiLQJ
	5BxkMPmrK0bcG+JauFfa0iInOwOcAqBbIqnsQN06OxzW0aZU87L/Wd3Aw3aYNyFFRHd8PM9Fff1
	KSW1z2BOyf4YF0qIFIQncF3Mhdy2Mw5HwemEgUugZA==
X-Google-Smtp-Source: AGHT+IHkhABbtbnbZCCqFm6QnrvFXaTc5FgxOup1Hmvg0MMV6iWmGuCzMsv9xxt25ZU2Gr7ek+7lYw==
X-Received: by 2002:a05:6214:e8e:b0:6e4:29f8:1e9e with SMTP id 6a1803df08f44-6f00214d08fmr75158456d6.0.1744037929933;
        Mon, 07 Apr 2025 07:58:49 -0700 (PDT)
Received: from ise-alpha.. ([2620:0:e00:550a:642:1aff:fee8:511b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76ea5782fsm607790885a.73.2025.04.07.07.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 07:58:49 -0700 (PDT)
From: Chenyuan Yang <chenyuan0y@gmail.com>
To: patrik.r.jakobsson@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	airlied@redhat.com,
	yakui.zhao@intel.com,
	alan@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Chenyuan Yang <chenyuan0y@gmail.com>
Subject: [PATCH] gma500/cdv: fix null pointer dereference in cdv_intel_dp_get_modes
Date: Mon,  7 Apr 2025 09:58:47 -0500
Message-Id: <20250407145847.1016528-1-chenyuan0y@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In cdv_intel_dp_get_modes(), the return value of drm_mode_duplicate()
is assigned to mode, which will lead to a NULL pointer dereference on
failure of drm_mode_duplicate(). Add a check to avoid npd.

This is similar to the fix commit cb520c3f366c
("drm/gma500: fix null pointer dereference in cdv_intel_lvds_get_modes").

This is found by our static analysis tool KNighter.

Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
Fixes: d112a8163f83 ("gma500/cdv: Add eDP support")
---
 drivers/gpu/drm/gma500/cdv_intel_dp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index c85143792019..4bd66804bc09 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -1767,6 +1767,9 @@ static int cdv_intel_dp_get_modes(struct drm_connector *connector)
 		if (intel_dp->panel_fixed_mode != NULL) {
 			struct drm_display_mode *mode;
 			mode = drm_mode_duplicate(dev, intel_dp->panel_fixed_mode);
+			if (!mode)
+				return ret;
+
 			drm_mode_probed_add(connector, mode);
 			return 1;
 		}
-- 
2.34.1

