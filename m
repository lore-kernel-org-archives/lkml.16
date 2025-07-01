Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A1E302CD0
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 23:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751411881; cv=none; b=elbtzRUAnGwshk5OZiWGtW5Rf+gQmPERfBvn4aXAFHd/VWNhJEhtljYYPdaypxY/4TCR7HbFip66tlis+ZdeQutXrQgOLBznROirBn6gstzKfqQApvXtrJT9oKNYSb7dO8fN54vONr52m/zfgWOBnRMIFxH0rmqBePKTccUtbtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751411881; c=relaxed/simple;
	bh=IVC8qqc56eJ51C20ZdeUMUIfsSlO+M/T3VM+z+MxsYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YVRtZyU+OBp5Z2ygXoPtQwWQ8Up4NrG1yiyJm6poSmqzcekrt4QHiqpTOFenRGsOHnCBfaXqF7NHdqUMiqIyq/PLW1CrtDEKz75nCR+RIM2cRXDwHld04zhqLkYEfvH/eMFIR6YbTnNvc4JiU41YJYmD80hR+LYnYI+PLdIS4DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=gu64NfXd; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="gu64NfXd"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1751411878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vSXbVhxIGkaH+o+88mv1rUZfsU9HWHbpjsI8nim4HX0=;
	b=gu64NfXd7BRJkwYs99MHZmltbLj67vGNXScsj/T5l338HC2oavCXAlmkhSUuyh4xtfVCR7
	loY3Im1+WnuIIGO2TN3Acw2jYfnl+TYWDy936qb0jp3Dq32GYjaOoq7CFylwERcWzqMsCB
	31bbGWZczTJcF8r/BBAb4uduGmckfGDDjGk1rbOqeml8hdDODpx2yWj/r9AvB7X2Glg+vz
	Xalg2u5QbIzOxvn0BB4H+UHCUzvw1jluG5LvRmysorWKc8AMByPp5AMtkcLWG64rMKyGku
	CWxANovFuaAn8fCxToiwI2JU/tvaEzoG+p4wseHduSSO5bL7GJ3+XNxGTa0XDg==
From: Val Packett <val@packett.cool>
To: Douglas Anderson <dianders@chromium.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Val Packett <val@packett.cool>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] drm/panel-edp: Add BOE NE14QDM panel for Dell Latitude 7455
Date: Tue,  1 Jul 2025 19:53:28 -0300
Message-ID: <20250701231643.568854-6-val@packett.cool>
In-Reply-To: <20250701231643.568854-1-val@packett.cool>
References: <20250701231643.568854-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Cannot confirm which variant exactly it is, as the EDID alphanumeric data
contains '0RGNR' <0x80> 'NE14QDM' and ends there; but it's 60 Hz and with
touch.

I do not have access to datasheets for these panels, so the timing is
a guess that was tested to work fine on this laptop.

Raw EDID dump:

00 ff ff ff ff ff ff 00 09 e5 1e 0b 00 00 00 00
10 20 01 04 a5 1e 13 78 07 fd 85 a7 53 4c 9b 25
0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 a7 6d 00 a0 a0 40 78 60 30 20
36 00 2e bc 10 00 00 1a b9 57 00 a0 a0 40 78 60
30 20 36 00 2e bc 10 00 00 1a 00 00 00 fe 00 30
52 47 4e 52 80 4e 45 31 34 51 44 4d 00 00 00 00
00 02 41 31 a8 00 01 00 00 1a 41 0a 20 20 00 8f

Signed-off-by: Val Packett <val@packett.cool>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 3796c41629cc..9a56e208cbdd 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1939,6 +1939,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ac5, &delay_200_500_e50, "NV116WHM-N4C"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ae8, &delay_200_500_e50_p2e80, "NV140WUM-N41"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b09, &delay_200_500_e50_po2e200, "NV140FHM-NZ"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b1e, &delay_200_500_e80, "NE140QDM-N6A"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b34, &delay_200_500_e80, "NV122WUM-N41"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b43, &delay_200_500_e200, "NV140FHM-T09"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b56, &delay_200_500_e80, "NT140FHM-N47"),
-- 
2.49.0

