Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5051264628
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 11:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745235418; cv=none; b=OL2YCoJy2RlKY6lOWUrSa/dG+zBxeViopPb98OkYwp1ipZkXtJK6a5FdynAuK+Ap6YJkScNj8gRr0N6uQgn9L8AHwC44eW68vI/MeFIFyRd4u1PBb/SOVkREi0Wj0jFCMq48S5mMElJr3JptnpZ5+K/pALV84tFVG92xZGO0Wmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745235418; c=relaxed/simple;
	bh=6LLGht8qynb8tY0BAWXhwp94AgEA5rjrwLm7CCR29Yc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Pn6uVHpLAfJp6hqdAdAk2Fl94y6CzJGWS0N8qvLfqVIJ+mykpeIzKzun5iJUPh8TifDAsCClzepkFq4N0kmdyGCZxMPvNEmqmfkUXLty8SYaO54vwEPMdUythOOiQtLzWIB+ZLQcz3bDcigqmoNqw+g8ZlaGjgwdUNAXZhRSGTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=MQbkKpPi; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="MQbkKpPi"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ff6b9a7f91so466905a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 04:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1745235416; x=1745840216; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FNzgKMUlsQlbaZsVnBHAf8TEaqUQ33irtDfzYvyzqio=;
        b=MQbkKpPiFRx0iIkO+kaqZJmsDymgx9xglYAlrTqLW3liZHYd//1Iwe5OSS1oxtXqnQ
         KlGfJOo4kV5vMuvj/3tIOgRLVieoNk2RwaxW14DsoGT1QITszb123VD+rPN1Z2jiC73q
         NjaHAgPg71x7hArjzGFo8o2d5NTBneLegl3hVIa2hljsbL8yFK56lQZ4SdWtjjb0Hglz
         giyb3zfWOYZ6vFUZQqCJLkYk4hvPkPerXaHo5EaXkGJcsbE8lNGCmVUKt3XKFoLGSjaN
         6alwPOif+KHo2uYbk9VAT3LphSMnW46b86qn2R/x2InWiRVPVW6vG3T1aVeoHQK+axFT
         3nqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745235416; x=1745840216;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FNzgKMUlsQlbaZsVnBHAf8TEaqUQ33irtDfzYvyzqio=;
        b=agCG1hckUWnpHqkyTb1wgfRU+EBPU9gqEYCgyc6tK0G75Ty9hnvsc5k3TqkQjMV47O
         fc9+vie/kyez/OG4DwGLtqYd7zeAlGXOVjLYXW4wXJuZojsllh/fmf+F2NKbLPktJ6F5
         bOOkxkMgsBV4CdiFbOVYAotACPo2zl/lL8PyCSpOObS1XUSh0JeKx/ig7uH1rJEr2mGa
         /tfzXrDRvtpdzD6v/c7hKxTrztX2Ptc0GGNEsmnWxUxEavpIa+c6u6TCaHfnBY1gdfvN
         UlTnpUZf0CBqPiF+Rb02gEFaUhndzt1FKUZogpqnxylkVdxuqD4RYl/ps3Zg/KR3smU3
         87tA==
X-Forwarded-Encrypted: i=1; AJvYcCXedbw3QUo+hpYqeO0favQEYl+fhBc5qjumPz7VWhW4bXcTzKs4UK/H4REp9mNqaki0vm97vGvpj6fScJg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbpBHwzx8z6RSicpJ4SbzumoynMRV9c9k2g5IruUVF6+zR4Ehx
	l/rh2qAmgjiJGpTIwDXOnCOKUmPfPOakJT9tJDTozSlcIjfMhCK8bAC95w6lLp8=
X-Gm-Gg: ASbGnct+Qss+mS3ZAGkKQeMNGggHBkQXeSaQXZLGdHIq/8cpk0ZHZYMhyCKNCquSq/w
	PaYOtIJxXleuPB+pGY2BJ1ThyU9ak/V3p+d+RbB/PfAUOvy2CLmoq38aprh4RtUI6Yd6QOwl4QJ
	NPxpKONd1of5sJWec8hWu6Ge4p4POgYrI3tHGrIuH6eMZaFV2SWri1NAbrWymj29SvAQ0OZyJOB
	h0Yg9lVR8SaQ5Qo7DCsI4YBc0MCps/my5jku7D5zFMOjhB+DL72Y//GXhf+Ca4VaQrbPtb1ZcwU
	zsE8Fw6Pfbqah3lHUbgMYl0CD8PlA4u17zsYNeW9SQR7cH64WV8EP/IgdsRW439EPn26DXConW4
	AEKH9
X-Google-Smtp-Source: AGHT+IG3PT3SNzrXWBwrbdd7fOhfXn12VvwyJT8y9iF6KHoASlVEwulMKJ9igvqDsQ+fCm73ctx7Cg==
X-Received: by 2002:a17:90b:3e85:b0:306:b6ae:4d7a with SMTP id 98e67ed59e1d1-3087bccb2c1mr6073478a91.3.1745235416066;
        Mon, 21 Apr 2025 04:36:56 -0700 (PDT)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087df4dfc5sm6336689a91.32.2025.04.21.04.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 04:36:55 -0700 (PDT)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: dianders@chromium.org,
	neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v2 2/3] drm/panel-edp: Add support for BOE NE140WUM-N6S panel
Date: Mon, 21 Apr 2025 19:36:36 +0800
Message-Id: <20250421113637.27886-3-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250421113637.27886-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20250421113637.27886-1-xiazhengqiao@huaqin.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

BOE NE140WUM-N6S EDID:
edid-decode (hex):

00 ff ff ff ff ff ff 00 09 e5 73 0d 00 00 00 00
32 22 01 04 a5 1e 13 78 07 13 45 a6 54 4d a0 27
0c 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 03 3e 80 a0 70 b0 48 40 30 20
36 00 2e bc 10 00 00 1a 00 00 00 fd 00 1e 78 99
99 20 01 0a 20 20 20 20 20 20 00 00 00 fc 00 4e
45 31 34 30 57 55 4d 2d 4e 36 53 0a 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 45

70 20 79 02 00 22 00 14 33 d8 04 85 7f 07 9f 00
2f 00 1f 00 af 04 47 00 02 00 05 00 81 00 13 72
1a 00 00 03 01 1e 78 00 00 5a 4a 5a 4a 78 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 ad 90

Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 958d260cda8a..92844ab4cb9c 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1757,6 +1757,13 @@ static const struct panel_delay delay_200_500_e80_d50 = {
 	.disable = 50,
 };
 
+static const struct panel_delay delay_200_500_e80_p2e80 = {
+	.hpd_absent = 200,
+	.unprepare = 500,
+	.enable = 80,
+	.prepare_to_enable = 80,
+};
+
 static const struct panel_delay delay_80_500_e50 = {
 	.hpd_absent = 80,
 	.unprepare = 500,
@@ -1916,6 +1923,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x09c3, &delay_200_500_e50, "NT116WHM-N21,836X2"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x094b, &delay_200_500_e50, "NT116WHM-N21"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0951, &delay_200_500_e80, "NV116WHM-N47"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0d73, &delay_200_500_e80_p2e80, "NE140WUM-N6S"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x095f, &delay_200_500_e50, "NE135FBM-N41 v8.1"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x096e, &delay_200_500_e50_po2e200, "NV116WHM-T07 V8.0"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0979, &delay_200_500_e50, "NV116WHM-N49 V8.0"),
-- 
2.17.1

