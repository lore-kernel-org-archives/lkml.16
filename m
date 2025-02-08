Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B86197A76
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 10:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739012016; cv=none; b=GEdhISQ7i64yV1xlYeUtswtmSjaxzFAW/6/Sk9UiktliIZEM2CYwZIdibrtXxf91HM9wKVtcvQP+PNDzDplu93sj9qRwRVoi5/0bSnFr3T7EjCXjiSc3HnO9KcCdKIuwU8OIxSDWe81aRDBIeQprS2zZfLuNIt65QBHpQW40BaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739012016; c=relaxed/simple;
	bh=VJVK+kc+EJwO96tG8GidwV7lHP8DNTmDWpwhKU/Ynzk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=J84wAATV9Ul0eCuQsCvtsS/E+QCGOkQdog5IiuExT9vo6kAnu36++LTVSnoeSXkDHOwu5IdIRMHw6gJyeDomIcydFKdeOrw2UkZSl4hVIYkQWgUWvmcvHm6ikdEBPIAlAu4vn3DogHPXZMZobNb/K/8yezeydG057k8ApZKr7ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=ksHEufhn; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="ksHEufhn"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2fa1a3c88c5so3300429a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 02:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1739012014; x=1739616814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ifyUzZDgKebdTMDynBzlQYZwVvqMuxRcC6rov9fIYS8=;
        b=ksHEufhn/5Q5a5V3M+/8277cLXEpBiXl6qszK9a4tvbvfFPIKS98cMBPG/R9wejN6S
         Zi3F2WAepWxRL5LvPblMnPmwR0XlKCnpJnzwDt2mgohMfPJ6jXenttHnNsT1J4yvIfVj
         1OgOiiIfvTeyEr4je4vTQ7fJiCWOl1Y31NbhZy8buqXM6VOfEu9cS0TfzLe+DOt1XDG8
         wjPPW18CY4z7fgXAma+fhWDnxeF0iwzzyGbZPbOWCm130MPGz/mxfdW3wsyA0PtnD4N5
         /qfavKzkEklAO9r+7IsvPt5OrdDokMM/lTkdIYKXRn+enYpPt6WgitUBh+hCG0eUCNxl
         //rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739012014; x=1739616814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ifyUzZDgKebdTMDynBzlQYZwVvqMuxRcC6rov9fIYS8=;
        b=dR6Ki7QPnC5bzRaEsR1VshTSveG7ShCL8u+37zu011c1dbOYZTkhdUxdN2PJdgBI4F
         iTjck5ppAToFX5P07jjQuvLcWzsfyaEd2B4rhcFQESgCMUPVXcj8LmE9x34ozvUSb9up
         dW8XuFgMdNF0fdjYfy7YvEuTVtPNGoYD1oo6xJe4eXWSQtbsa9rwk304rqCYYFSpzYa6
         Zl4tMwMJwOd4yszsa6gGqVLtsOmds85pngaebbwBB2GIzSg4Q5tG77kNqm6NpcU3weXi
         elw6hqeewWchZL6xxN3XIzIHWwK1tDvBobxjRsZ47NEECJzH9em2rKT762N7CW9+kJ2N
         hIxg==
X-Forwarded-Encrypted: i=1; AJvYcCV9NbKIhrglwVFGr7RnsghXQAnRFn/FXzDk0C+UJS5Iijw5IsF79Z1TOk0mH5YCntZA3AmT7J+NEzrKjgI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4sCFzqpH38INWI/wf+exdHqrzWP/3F/Ky7LBjMai27d/l9Ujy
	Gn0KoHbWfIPWJCvnf0cRFh/ixOUfD90LgXCgl+iuIAQSp+DvUwH3rosj2yDdYiE=
X-Gm-Gg: ASbGncu+blNA4aXrtDR6b46Qblx82EVAZb724opzZpCKZ1Bvle3LDEWhemFoBkMHhNp
	qTuevek9d7q2wJbuml+9P5FpTwD7imjM4cd6Re4nEy0XYheHgoNrzRG5PBJZk7GnuUfYYo/lyXK
	Uwfe2mOLuGBAdYMDr/uUZiNUkzPiEUmXmAuKr9o1TZbhGGCXycZji8bL/R5nmT861z7Z7FTRw3F
	oGdXgOi/hhKkbe7k19eqOPLeHvT6p8gCRnmB2Z0xqLgtS80Qhw+6mxyY4bPWbJu46z0UT0lnp+8
	LaNTERou7m4mQ7RmOrUD5nA3stpfJLes3etn5ECSUzLvtb0i7LWH5/EBPg+JD7I=
X-Google-Smtp-Source: AGHT+IHy+71MYu/SjllpM7v8QcUoDCgx3OAzOTwkCu/N39mwnXIJTHVNc5qk3wqrJl8nWKdmmQrJdw==
X-Received: by 2002:a17:90b:3fc3:b0:2ee:8008:b583 with SMTP id 98e67ed59e1d1-2fa24274b87mr11174906a91.16.1739012013966;
        Sat, 08 Feb 2025 02:53:33 -0800 (PST)
Received: from dgp100339560-01.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa36f185c5sm2142003a91.16.2025.02.08.02.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 02:53:33 -0800 (PST)
From: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
To: neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	thierry.reding@gmail.com,
	sam@ravnborg.org,
	dianders@chromium.org
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Subject: [PATCH v5 0/3] support kingdisplay-kd110n11-51ie and starry-2082109qfh040022-50e MIPI-DSI panels
Date: Sat,  8 Feb 2025 18:53:23 +0800
Message-Id: <20250208105326.3850358-1-yelangyan@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both panels, kingdisplay-kd110n11-51ie and starry-2082109qfh040022-50e,
use the HX83102 IC, so add the compatibility to the hx83102 binding file.

Both kingdisplay-kd110n11-51ie and starry-2082109qfh040022-50e panels use
HX83102 IC, so add these two panels to the driver panel-himax-hx83102.c.

Dropped Neil's tags since V5 is very different from V4.

Changes in v5:
- PATCH 1/3: Both panels use the HX83102 IC so add the compatible to the hx83102 bindings file.
- PATCH 2/3: The kd110n11-51ie panel uses the HX83102 IC, so add it to the hx83102 driver.
- PATCH 3/3: The 2082109qfh040022-50e panel uses the HX83102 IC, so add it to the hx83102 driver.
- Link to v4: https://lore.kernel.org/all/20250123064758.743798-1-yelangyan@huaqin.corp-partner.google.com/

Changes in v4:
- PATCH 1/3: Single bindings patch for both panels with proper alphabetical order
- PATCH 2/3: Adjust the alphabetical order of the compatible attribute
- PATCH 3/3: Adjust the alphabetical order of the compatible attribute
- Link to v3: https://lore.kernel.org/all/20250117091438.1486732-1-yelangyan@huaqin.corp-partner.google.com/

Changes in v3:
- Link to v2: https://lore.kernel.org/all/20250117050410.933312-1-yelangyan@huaqin.corp-partner.google.com/

Changes in v2:
- PATCH 1/4: Add compatible for KINGDISPLAY KD110N11-51IE
- PATCH 2/4: Add compatible for STARRY 2082109QFH040022-50E
- Link to v1: https://lore.kernel.org/all/20250116130530.3010117-1-yelangyan@huaqin.corp-partner.google.com/

Langyan Ye (3):
  dt-bindings: display: panel: Add a new compatible for the panels
    KD110N11-51IE and 2082109QFH040022-50E
  drm/panel: panel-himax-hx83102: support for kingdisplay-kd110n11-51ie
    MIPI-DSI panel
  drm/panel: panel-himax-hx83102: support for
    starry-2082109qfh040022-50e MIPI-DSI panel

 .../bindings/display/panel/himax,hx83102.yaml |   4 +
 drivers/gpu/drm/panel/panel-himax-hx83102.c   | 260 ++++++++++++++++++
 2 files changed, 264 insertions(+)

-- 
2.34.1

