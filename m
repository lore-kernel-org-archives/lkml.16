Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E0F8F6F
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 03:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747451384; cv=none; b=aoQRhrxR75qBTXMsV5FqXwfcro4L/axIIzGjT14QuR6XDtVRIiB6/7ihg1YFFUug2+kDQxzOP0pJb0+3P+30xMNxjqAZx4PUgOfev1Vt6cVOpqiAtJkXXAAsLx2OK0EY8NRzWp1lZ3wI6Mz+qDHNqKAET11tDjz0gH0ATDqe91k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747451384; c=relaxed/simple;
	bh=sQ0SEi8+VhRFz4W8nCt63NwfeaeVosLlIspPPRiUdwU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=o6lKJ5bRCifmDqL/0YVhB1iZ26HsubOvdKNe3uzhBdKem08xZ3s/xT/xlAKC71a6kRJuGZYT4sKinId8JhqYUKMZMCwOrqLv1gDAnKrCpTAjXtR2B4oEiOh4j7nW3ZZHkugyKDATWOWc7V+7MRmoTeSXgygkieD2WDwOwPFZlCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iOVi+ywF; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOVi+ywF"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-47662449055so16685961cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 20:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747451381; x=1748056181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ffCQ/OEpQBGYzhPI44r26h6E9XjNcAQxTXB2Nzg9x64=;
        b=iOVi+ywFpkS7aGWV+x0ThfySShf4Miot33SctxBrTc7OcKiSvjYnrJnBunWTIlhPjN
         7/hEesl8M+dxXGtUkd6LSuMwdx4gTN7kGWCiyNfZXhDetQA5dYrkK6FdcmsKMRk8ZKC1
         vgZfKA8VwmIPHBi4D62oE6ll50LuW2xI1QYRAwaiac/RzZKiDrL1gYHCBUF6zIlCcw+X
         AqmZm2ewOESa4YFLk54eRiYiO81F80iVWrN3wjdadpgbp9/1rSj5r0SYpJqEWYcNCx0l
         GTFqlCKhmPcAa4gMRLLivsPy57QepbwFC36ir9glHHjkOdBnKXAjwvWZ4NwIT9DIztJG
         bbGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747451381; x=1748056181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ffCQ/OEpQBGYzhPI44r26h6E9XjNcAQxTXB2Nzg9x64=;
        b=bSoJavCbhbvFIzrZ3MayZE3qOPVoUFHjVwfHl5WzpHl4kaL0bU36cEUz7bph9chzh1
         4vSunZvePgwimKpRAMC/hndJ2dQcT0R6gFRTiZxA5MpW7E4i96VCM0fbJ8OosgisSvin
         S8jliEoZ2DfJsKLado8+cJ0Sfkqf+N/MXVBir7Ybnc8pXHAxT5pcF2PG2TQyV5hi5xIy
         jpiIQXjDmsIqR7sMVMZe6YFM6fjI8icDmOrx17QvagvxVIwXm0MOJgrFgucnF2yo2xV1
         2BEjX2rgXbxvv1LfbxPKdTaiarFAk5cW9ieJHUdjXmn7mB6GyHWBwpayIccyk09d5/J6
         9pMA==
X-Forwarded-Encrypted: i=1; AJvYcCXxTCc/xk+9XM5Lc7NnJ+lMBkvAt/G235Bu6DNDq1jP3JjvUqrWbIDr03nT8aRF3aTqLbdr6vRQYSNCvfQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1UL0d8cG86XTxZY3i2/7Y7wSUmjWNI/77zir7tN/HsUjQ+hxX
	CEHXV69wbq0pgkDtDETxKkT6D6CYN2s43WAcETXdpL9hX+/3Amy3apc=
X-Gm-Gg: ASbGncvnCQd9QPoyG/VFLQB19HmtOu7Zb/CcbR90YRKm//zsKnVEG2wLn60un9AOpoC
	glaPtV2uHlR1VPKMF6qP7BGtCFbuWf0tN2qUmc8x7F+vOmq4YKWZIvMIcA4hg0TDycmemHIeQzu
	z7xvWNn7XFnDt/yclgqYz5HCWycifAsWz1f1HS2AOUxFEunesuvH2eHtluqFpxBGy2ukD7W5sFB
	iIT3t379rCNdCc9ZLJuI3x7PBc2v+u6jpnunLInl4V9m7YM6gW2i3cLbO+zgrkJlyPwaM+Q5peQ
	1CLxIPu2H9kE5Hck3bSDXDUtfKb7Dh252LQjciAzjvcevT73khzeUwxgK9Fy/psR/FhWVBAkvZo
	L
X-Google-Smtp-Source: AGHT+IFAY96+ViAXpFtWvPTpkpmN/e9/h01C8VfuwPJZMxAbErTShgFH39ZlL3cy+dkElD1U1qsPfw==
X-Received: by 2002:ac8:5c95:0:b0:479:c1:6c21 with SMTP id d75a77b69052e-494ae3509eemr113366961cf.5.1747451381027;
        Fri, 16 May 2025 20:09:41 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:e487:156f:5546:ce07:3a5c:a2f1:3741])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae3f8f6fsm19165861cf.30.2025.05.16.20.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 20:09:40 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH 2/2] fixing typo in function name
Date: Sat, 17 May 2025 05:09:35 +0200
Message-Id: <20250517030935.823041-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"ENABLE" is currently misspelled in SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS

Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 drivers/gpu/drm/radeon/atombios.h | 2 +-
 drivers/gpu/drm/radeon/kv_dpm.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/atombios.h b/drivers/gpu/drm/radeon/atombios.h
index 2db407892..b961096a4 100644
--- a/drivers/gpu/drm/radeon/atombios.h
+++ b/drivers/gpu/drm/radeon/atombios.h
@@ -5072,7 +5072,7 @@ typedef struct _ATOM_INTEGRATED_SYSTEM_INFO_V1_7
 #define SYS_INFO_GPUCAPS__TMDSHDMI_COHERENT_SINGLEPLL_MODE                0x01
 #define SYS_INFO_GPUCAPS__DP_SINGLEPLL_MODE                               0x02
 #define SYS_INFO_GPUCAPS__DISABLE_AUX_MODE_DETECT                         0x08
-#define SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS                               0x10
+#define SYS_INFO_GPUCAPS__ENABLE_DFS_BYPASS                               0x10
 
 /**********************************************************************************************************************
   ATOM_INTEGRATED_SYSTEM_INFO_V1_7 Description
diff --git a/drivers/gpu/drm/radeon/kv_dpm.c b/drivers/gpu/drm/radeon/kv_dpm.c
index 55dbf450b..4aa050385 100644
--- a/drivers/gpu/drm/radeon/kv_dpm.c
+++ b/drivers/gpu/drm/radeon/kv_dpm.c
@@ -2329,7 +2329,7 @@ static int kv_parse_sys_info_table(struct radeon_device *rdev)
 				le32_to_cpu(igp_info->info_8.ulNbpStateNClkFreq[i]);
 		}
 		if (le32_to_cpu(igp_info->info_8.ulGPUCapInfo) &
-		    SYS_INFO_GPUCAPS__ENABEL_DFS_BYPASS)
+		    SYS_INFO_GPUCAPS__ENABLE_DFS_BYPASS)
 			pi->caps_enable_dfs_bypass = true;
 
 		sumo_construct_sclk_voltage_mapping_table(rdev,
-- 
2.39.5

