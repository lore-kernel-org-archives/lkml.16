Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1DA27FD6F;
	Tue,  6 May 2025 16:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746548412; cv=none; b=nX7pFjO7EKfz5Kjqem55x00dT1p1zC1PQWkwvI7l9/s/8wsPmcYRDBPLo9klRqmi9cSuFQVKsLHff5lSgsHKYnyXcIXvirUfIo2SQ3u9twA/uz7QCwST/qNjJZ7tenLLjpDGQNvzc+mo7k4FNwkIg+m0DGQmydRV+NRLUKzZnME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746548412; c=relaxed/simple;
	bh=2AXrQAfRhcQ2MvcG2UBO+S2yBNwkd6bk+UO6zsf9n90=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fGSqEQF2PqAsIknjMF8hKHLDlBBKyLO1mP5KSnNQEWL5awPweRffktyRBwiMfM4tZAefzVYnRlbyr2+oSYP8wauusLXGvcMu3rvAC8ST4vsyfIjl+KVRHYIK7qmO+0P8tdF5UFM21pf6dE5TMhgA2sWh06iSWaJRDplLSJQmFw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iwPhSHdF; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iwPhSHdF"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so38313925e9.2;
        Tue, 06 May 2025 09:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746548409; x=1747153209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k3qc17DEFxTpF4iC04L3bgB11KvKUfwQcfBGjcC6vpU=;
        b=iwPhSHdFcEVKJP5vFrcSc5RqPRzSJtUQ3E/rt0Fog0+Y23F19KQxYEFF0BStq20RvK
         /r/UtAG7piuHUVKJZ+ZcpQ9lZ5T1xb2OdrztJ/BuD+U6ES9wDrAVWwiMb3TduC81pTjA
         aFQgowKKD96WgmurVOouYT274pY3msyG/D+4amgskQkTpZtXsAPAiAWg7kRZe9IaVFSW
         NYPVgVaVm/uzuEyEvT9KfBAIku3FV3bAPu50wM1Q60Pzj9psZm9fKjxpQk/lG25jjEAn
         VqLT6gPvfrxlBgxnAX2IDzR0lalCWr/7A6RrYuKKASlavjbE4OzI7s1lKyWdThynd9hA
         JJHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746548409; x=1747153209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k3qc17DEFxTpF4iC04L3bgB11KvKUfwQcfBGjcC6vpU=;
        b=fhaBDqSq9XD7I9JYssqXNjNiooXOLmJgfvQXhjYlxTsrvrHIXFN9R6QMq1glI1DN7z
         n5drzW3qNcpn0+imSzbdZ71ZuYrk5sj0pyeSdliaLEnzwzIm/Cag+n6ttGeJ0r1a32X/
         bc0OiKNskgaCn0Pj9XCytENxgtR1AMl09pY0lT4pGc2hRuZVdvbHELJq7/yWM6q5et5+
         pRO3ruwBHnMTTiEM6kSPXuElklTFC2O06aEnDDY7qb0rUR0GScxSCChrnbi83c85u7aL
         k7hKzfR0bPpptzVK66i9+dydoZkfQIoshogYzqlD+n39MwDmrAsCelRee3rBSKM6u7Mi
         26Dw==
X-Forwarded-Encrypted: i=1; AJvYcCWFxCusTbUkfY9p5hYNcTvE1JbScxHr2rpX1sWeoOvSVxm/CM2qES8epuQLmtNxxantxjOuqI1kLEx/+m8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6Oav6APR+wb+8L247qbs3QTzJnLgttxtv5+NR44wk0LXFEZZJ
	NKxEx+ysnxYB4scmAhe9f5irq9NUI5suHQ+jCVeDYvUQNt4BTLUS
X-Gm-Gg: ASbGncvSSe2QH2yMGlyQuyRKmL/gO949+H0aVpVDj/zzf30pDp9kaJSlj9DvfgxDWbV
	2kY7fJ8tBl34mnMio/YChDATzCKWoO16AqNj1/QCKxRaSrD3ItBBk8EY1RGuW0t6PSrrbtb5hK9
	c9BbvFCudZe1EcJH2CHiX0MA2xe5FQ/mOLQrHbtRb+DlvDIUbcRK5TRjEKiJY15eh/3gRfrWVE9
	ND4fMq9U72aMu8iaL7Dg7JW4z7fJlonwSJt/mretulUIM1DewFTOWEuWdmtk9JRVGXSS2+BDDSl
	ExF0aqzHvskqkqrHKMMq3VsbMbllu5U6/ABOZAJ7xA==
X-Google-Smtp-Source: AGHT+IEl9AAm++w6tszNiHiWfiBZgIN92Q256sIYVAF0+OGgNQafoTkoaDQDck7lPyH/qHfgISwETw==
X-Received: by 2002:a05:600c:4e48:b0:43d:98e7:38dc with SMTP id 5b1f17b1804b1-441c48aa36bmr109604715e9.5.1746548408780;
        Tue, 06 May 2025 09:20:08 -0700 (PDT)
Received: from localhost ([194.120.133.25])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441d11b4c1dsm19852075e9.0.2025.05.06.09.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 09:20:08 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/display: remove redundant ternary operator
Date: Tue,  6 May 2025 17:19:57 +0100
Message-ID: <20250506161957.149194-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The ternary operator is checking if ret is less than zero inside an
if block that also checks if ret is less than zero. Since the nested
ternary statement is always true then the -EIO return is never
executed and can be removed.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 56c7e3318f01..155b4baf6ab5 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4192,7 +4192,7 @@ drm_edp_backlight_probe_state(struct drm_dp_aux *aux, struct drm_edp_backlight_i
 	if (ret < 0) {
 		drm_dbg_kms(aux->drm_dev, "%s: Failed to read backlight mode: %d\n",
 			    aux->name, ret);
-		return ret < 0 ? ret : -EIO;
+		return ret;
 	}
 
 	*current_mode = (mode_reg & DP_EDP_BACKLIGHT_CONTROL_MODE_MASK);
-- 
2.49.0

