Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FB1E56A
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 23:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747179990; cv=none; b=n4qSuERMmmR3l1SWRxXtZD+FLPCiohUREL28w0aZGdutmj9IX/CqATgc5dDIbBciT9mBvl1lV+3AM/BLHOQi77xbRZ8G1CuYTK/BtitAZo4o8qNwVuW+REI4jbVB9sikbTMDqg1r1ew81NzJv3mykzbIMTjR4VYnQnpc2hagxv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747179990; c=relaxed/simple;
	bh=JHhqk38Z8zYxuJgof4ijnK3c+I9uYjeSE/sYJ320keg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZXkxJsg9TK/lDmLjb1LmJdp26bUe6LNIWJMQhWTVlaUh2MCRbzKWgGV1PeXNAf6zB2P6CYL1hs0nDEEbjWJGfle6Uh0Q+tdCpiDOd7rdBUyt+8m6jR42bRj1zQ0yEvdPDsxOI/FmrsqgO38lxrQfwPDLMeHD8osYUpJcbEAyN8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IXctFBDn; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IXctFBDn"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-44069f5f3aaso3465185e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747179987; x=1747784787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Am7EfrJqOwulXz2MygzhqsLfPIY8ao2NbUQeLabZZDU=;
        b=IXctFBDniPWV44CNoejTAfAjaBkhiowIQx2YioQu9a3nDl4EefMoxwYhobj3RRF7Vt
         M50+ij3P8Rxd6Qd+uLyAsExil2XMJMDxne/iThTVsJ2yIy54IcnWgHM/SVLU1vAIkysI
         Dj+NDjQNKFHP2xe/if3ihyz/LoYmLdGK7RWDpGAMdnddJC7UVoFvdvFlWDMk/L4sEeX/
         hJTsbVDlHtnht0cJrd4KWO7JpTaWsq1pYmoFharYOrYDShR+UA0FXwwx6hLtlisXZUJz
         R74zjFiF2T49+UYQB5b/mboF5r/ZcG6i0Vqlp5tw/NzaarlPOVv9hRFcxFwI8WBrdeX1
         +cjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747179987; x=1747784787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Am7EfrJqOwulXz2MygzhqsLfPIY8ao2NbUQeLabZZDU=;
        b=l1kBo7NA3ZNvpK6F35BXso3HCZ79LLDajGK/gOSS5kSnqj7Qg4TZkH0WnXCmbukk0l
         UsNtsaF+sWyLqRKhq7AxIuJ2I5EsqpaOl2piZsB9QR4iFktCkiEln4kjEh1Wd99pkU/s
         PrfpDxos8rJz5wEODmXGhAgKG0X/TL9WgGvGPh/xprETUl1alLgcutH00eg1F/D2LzzI
         +z/qJEQWBgKhr5kesXP61/VXGGwZ8xpOYSk88ACclGfZGlk0IOIVVvG7qAAAwaO5l8uE
         K+/uD/RMqhdnn02wP6R3uduLPCzLGBt7gVEChV/oM4L1fRhHv7Z5q5ZD7FEmOvZRLV4l
         /11Q==
X-Forwarded-Encrypted: i=1; AJvYcCU8A7Xw49mz4P/kGiQHpOcFLLrlQxdbORPmMa4vQdxl351qc/fvpodjvjakSWMT+jbI4eOVjnBtbz2tsGE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVHQzaNlED/rJmzpgnhCzqdryPm99L9JOq/tgXeCay9BNgcVp5
	6pX/HEGnxMDadE7b3MJW/7P4z3erfNWntP/WjACtp1/kytlt7Ftt
X-Gm-Gg: ASbGnctvJuOUhydiFl6gQI81mRAHeDvdWyv7kF5GRcQCnQzOdZ4jMN6pwQlNCbRzMDL
	vQjJhhAj9cibznXTbKPT8YSvZ41hVFeswECU0RJXP+3FBFvh/l0BoFyf3OgI441ulWE9bazss+N
	5dMdees+sKLgOxPj7tHO/HuOg0GYq+O8vOGvMmyP0qS9sbdfBcT06fieZF1jmQ8N8/v6dk5xUEO
	fJihoHTxjgynd30Iw0N9Q44MTH3r9ORzdKtcMAM8f4GQNqs53og9FIVRQB75riM+s4hX9VoCo0N
	bpBketkSYOG5Y50osviLjzRrDJnQh58Jn66Z4537ysaZk7D1gJYzo20/xFjgQxUPjn87PLXCmkT
	rBWeN5/gxEF3J
X-Google-Smtp-Source: AGHT+IHSw2JHRvnitJtJa6AdYdxRDFYEo1OfcoOtexkTf6XFYzq3VybGtqZnXlr+zjXBLXMGWv0Flw==
X-Received: by 2002:a05:600c:1c2a:b0:43d:fa5d:2675 with SMTP id 5b1f17b1804b1-442f219511emr2834195e9.9.1747179987106;
        Tue, 13 May 2025 16:46:27 -0700 (PDT)
Received: from localhost.localdomain ([102.44.114.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3369138sm5670665e9.8.2025.05.13.16.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 16:46:26 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
X-Google-Original-From: Abdelrahman Fekry <Abdelrahmanfekry375@gmail.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	skhan@linuxfoundation.org
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Abdelrahman Fekry <Abdelrahmanfekry375@gmail.com>
Subject: [PATCH] drm/amd: fix kernel-doc parameter tag format
Date: Wed, 14 May 2025 02:46:21 +0300
Message-Id: <20250513234621.322283-1-Abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DC_HDCP_LC_ENABLE_SW_FALLBACK enum comment was missing the required
colon after the parameter name in its kernel-doc tag:

  * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, ...

Kernel-doc insists on the form @name: description. Adding the colon
eliminates the warning and ensures consistent extraction into Sphinx
documentation. No functional changes are made.

Signed-off-by: Abdelrahman Fekry <Abdelrahmanfekry375@gmail.com>
---
 drivers/gpu/drm/amd/include/amd_shared.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
index 4c95b885d1d0..c8eccee9b023 100644
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@ -366,7 +366,7 @@ enum DC_DEBUG_MASK {
 	DC_HDCP_LC_FORCE_FW_ENABLE = 0x80000,
 
 	/**
-	 * @DC_HDCP_LC_ENABLE_SW_FALLBACK If set, upon HDCP Locality Check FW
+	 * @DC_HDCP_LC_ENABLE_SW_FALLBACK: If set, upon HDCP Locality Check FW
 	 * path failure, retry using legacy SW path.
 	 */
 	DC_HDCP_LC_ENABLE_SW_FALLBACK = 0x100000,
-- 
2.25.1

