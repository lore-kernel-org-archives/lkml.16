Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400D51A08A4
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 12:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747745032; cv=none; b=MTkuxjzQwpoRlUJNRTSVL00M5a5jogXVA3OWJWyNpYz/wHB0c0nbnnIfvK8sv2sn0GfJpE0RLE7Iq1TqG6FKsJpAcF2KqIdGjfMmPUYlDO2aS4P5ICu2d5Ms8MEdefZxfXucRNUwd3Q31owzxPjPt27drEfKQtOZlfivPkiTCBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747745032; c=relaxed/simple;
	bh=PgNZglmGGNL83wMbMwlFyu+NPIKNRdCBMfPZoyVgx/U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IQUndE9ib0CcExMOpZpUr1v7kzV1zqWx0w7257ehM1WQ655XpFzZdFD2dBzg1SJYGWOFlHt87ozeKjfzetpfw2uNnCuWBrQAIDt1L4zhKqdPwk6qzaHktBn7BBMmXdXlQgo8VXfTcAz4wH3AzZLzVrP5vR3eYER3sLlEpf7zeMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HC3ANQkm; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HC3ANQkm"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-443a787bd14so24000425e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 05:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747745029; x=1748349829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2oupSw0jmhW845RsR27QnK12DgltGY1gE9K5C6v+m3E=;
        b=HC3ANQkmfpmj91IWi6BlaiLT3oWd4W8J81cSwbbA6FtWe8nzIqhA7xzs7uS/0FDyf1
         TsKfoTaagH7KSZB5pOqxxAXsp/zvledNXoMsTT6rUKaM2qpPDhvGVn3HWVLwPDgAGfnt
         I9fEDd9FVCahPyUxeS9amlQQKwj6O7hRAkcKFwH2KO0DLmuXCLnj6oLu+2QUYDij2W6c
         i7UwUqRp9K9YX2jBNgFJuzodYNymP/szQlxOKbeopGmgVZfZGL1qCuK+Gq+w23hCXUkt
         igD6RgoXu8IXTG388//WdzrjljdvuHD4crY0CfrP6KLLbZH+0AW+4Nw0d2aXbClZaiBH
         XXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747745029; x=1748349829;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2oupSw0jmhW845RsR27QnK12DgltGY1gE9K5C6v+m3E=;
        b=kaFI/sXOq6kzC4YWu8nRERQoipYjMgXslbJCFAopP7Lc91MbF3QB4euyJ8e8O1z0W5
         0kcx6PeSPBFMEJViXjThjkPUc4QgCWc/LktZ1W59WzYpJgJTPdhphllGDsvEG1atuv7P
         f9Bmm8CxI4U5Q4ktsIaNrv7SON1UgXUL/Bjdmr8cyRRuG0x4lARSMFayWgwW4kYd5rt/
         XJcE7xFg9Dw9gbK2dMblZzCOYEqXapToprkgBm1NKp06NAef64+oXpD27IOIeEl6wf1v
         XMh4SK9vdPjnloToTbe5HvJpZEQV4n1uWj5QcKtSPF10WlyhJLWtAKpao14u75tO9U/v
         ja9g==
X-Forwarded-Encrypted: i=1; AJvYcCXXpL46S9583XElI/YI0F9PD2hjVEzZkLZUP0qcdX0dURrArXkg0yhJc47utjKl1RKVVO9hg5LhMcS1IBs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaRLjq40x7asaZv0QhquKvoGmrAn3yNBPauIFiksNU+KGCegQe
	arXT7j650EWyCyrLrTf3elzxT1XUVyNC57vS0/P/83RUhzo5arZahtNgOTyCiteV
X-Gm-Gg: ASbGncu7Htl14emJu/ue0W+LgEYs0c+aELQHFjEFKzlDgChDhOMBJ/E7XuBkij5yhpz
	8g8vbnXlAmO+MEmVtuE6XGRRuYzXbWXfEqCtXEcsbQr5K8/75pTAuQunTVIE9fjerkRZtild94Y
	uXhY2FkHzwABOgjzqWSWurRIhZosh2a8XwFpdgGoAJzlaYtnEpo0W57jvMG2wCm08TkeK8+umav
	3E8Sy6MbixHwHdI0FtDd8W8iQDg/myC73CspLZhB3kdMRfsucnim+pWa0TqMOL1AH735CbVY8qd
	33w2ThIjBLBSQA4U84RwLfQTOg25/fGahaKXEH0qnMyuPSbqICP8SrpVO/xqFnD9t5jTsMoNbCM
	wa0/sbp+1vFPmnGgbGofZGuaSprbRx1dU0W2HLrtJsVJtqdgXVZPYP512/QToO25vTaFJpannPA
	o=
X-Google-Smtp-Source: AGHT+IHVv4M5EAujyQEVcJsKFqGc6F8fpLpKxczpm8CuZ8FVgi9qM4XICzD4bScwGZgCB+wKuOM8KQ==
X-Received: by 2002:adf:ff8f:0:b0:3a3:598f:5a97 with SMTP id ffacd0b85a97d-3a3598f5d50mr12866479f8f.9.1747745029376;
        Tue, 20 May 2025 05:43:49 -0700 (PDT)
Received: from ernest.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca88735sm16667546f8f.69.2025.05.20.05.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 05:43:49 -0700 (PDT)
From: ernestvanhoecke@gmail.com
X-Google-Original-From: ernest.vanhoecke@toradex.com
To: Douglas Anderson <dianders@chromium.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v1] drm/panel-edp: Add support for AUO G156HAN03.0 panel
Date: Tue, 20 May 2025 14:43:28 +0200
Message-ID: <20250520124332.71705-1-ernest.vanhoecke@toradex.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

AUO G156HAN03.0 EDID:

00 ff ff ff ff ff ff 00 06 af ed 30 00 00 00 00
1a 1c 01 04 a5 22 13 78 02 05 b5 94 59 59 92 28
1d 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 78 37 80 b4 70 38 2e 40 6c 30
aa 00 58 c1 10 00 00 18 00 00 00 0f 00 00 00 00
00 00 00 00 00 00 00 00 00 20 00 00 00 fe 00 41
55 4f 0a 20 20 20 20 20 20 20 20 20 00 00 00 fe
00 47 31 35 36 48 41 4e 30 33 2e 30 20 0a 00 bb

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 00dae545832e..9adbe0f11421 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1869,6 +1869,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x235c, &delay_200_500_e50, "B116XTN02.3"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x239b, &delay_200_500_e50, "B116XAN06.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x255c, &delay_200_500_e50, "B116XTN02.5"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x30ed, &delay_200_500_e50, "G156HAN03.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x403d, &delay_200_500_e50, "B140HAN04.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAN04.0"),
 	EDP_PANEL_ENTRY2('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAK01.0",
-- 
2.43.0

