Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB90264603
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 11:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745235414; cv=none; b=CVfGRUlvrgXhbHEUzCMW8xP1epe94fNwF3LMpbedBCDbC23lcGxBxjd/lZPT6MXPa45BBhuR1yeC3fuml48wJ4owNgUsJGAA4tjMs2NoilHi67y1SwwqAKXTWtLnknFaBHzOnxD9UbeX6r+wALVfrx4ecG1XleRNMCjKaK3uPo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745235414; c=relaxed/simple;
	bh=6jgwuydzP21mp+sdPH4PqF3RDChr7YSCZIupZ2m3tGI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=BdePrlquU8nQq2VQI12mi+MdDpLaehe71L7/dckDSCbD5h5l9/9p35Ti6c4rY8ASqjJCNQ2btxfJ+d/puXipEdwcDbRAzFi+6O+NM8BBAtuSpl/vvO8mquHn5SiN5EJIyrzpWcsItrikOSOhoXsyZhMnBouCnWOsW3clZrvgVOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=kDQbQo/X; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="kDQbQo/X"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-301a8b7398cso639480a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 04:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1745235412; x=1745840212; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FhFIJlsJNcjxF9uhU7iVu8lHjUkQFZCXgWTbQ9gvUIo=;
        b=kDQbQo/XixJmVHbj8/2hK2r1kyNfOK19O2JPxZK5DhRE+7AuuMmo8v3i+kjIkBxQB7
         GAJA00FkpcmCDxKKJYo0VPGF+iEY46kHGG9iAA9Enrr7mdfKlA4xVJqMj16xMCoskSQL
         Dtid/xMRY9f+j465m1aJ8pQwNUv6u6p02xlIa/C/M86q+LGnhYU48mC3ocq/Rh+uGUyD
         Gle6ufEl1smyz3hJizr48U0qcGbIASNg5rSQNWXYH/msD56p9jma+sDiiJBB+6qeQCeB
         gaKgoP50X3lQWLbagjA4/ZWtZUxdTolAKaEpzggtJQM2sAEsmUb/zSQwcnJHdytMpi3q
         QEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745235412; x=1745840212;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FhFIJlsJNcjxF9uhU7iVu8lHjUkQFZCXgWTbQ9gvUIo=;
        b=VnamcGhPR2k24FSM7YFXwKJZryrraObtmdJ15yGbCnmc/tVs4ZPJeRizG9L/3UXJA0
         Knvo0qKt+Pc/ezRleLN9TT+gelRCKW0VhhvNoDB8UVjSfFA+rdlIG0ua2dArijkG2ozn
         lF9MHPU/PF8cczaIHQ6+gyiZ2/EFJcT027DphN5fWYubV8HjjO0ncYdWH0C6u/XCx//L
         dMMx82+cEn4a2dtWAARMyhIHYLMpG28HiabUTvOqJvMZkSWcNW2FSoKoWuZ88mZSGGA3
         Ds69sCAfPP6JGL7bVzhOUAo1se8BsU7f8nCrgQeb0uxBrNlj/kkvMuxjWkXd7bsOF9SI
         3v7A==
X-Forwarded-Encrypted: i=1; AJvYcCVux/KTv1VfprxSxCLcm9xE9DQtoFivzvUx7UYVVwYqSFJeLYGvzAVHuTor+3hYg23ZwXDxfAZneib9ON4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGlFZ5t8KIrgbiKJxBdlLA/7OBgYnxDs7eT5XMP3B5l+tgqZ14
	n/5jeYulVb5WOVgQVFDgOGBqdqvr9UfUCIqcAfbLfLPUuxA+VvPxkVmgesbP3Rc=
X-Gm-Gg: ASbGncvA8SEQpW2gamRiP7PiXd0SutXC4QBbtewkx1xcJ4R9g881IyyIoEN30XLD794
	hTjonmSMxktdyl4TViBF9qCXabXYT5446+AUwD5vmrwmNTIs+sXx12HJI2NbE1GTS/hO/1UH/U1
	tPETOTX4ai1Kszy/RPG+O0B9+35LeBx5DRUPVfgOK/94Uajtr8Fr/VeYz+qhYEqJSfqefqwJh6V
	4/KCaTBGoFxIZO+jtk8U0nRW8Y4SJ2cvSvjauRAoznYdYRXE7HhgraiTjFWe7Hk6vm9Za95B8oZ
	s8XHAAqGtdcjnJDuur5rC8LhCJTWWMQEU4UN3txVsWWr4udPRk+EXRRNuX6V35YlBSMjqK8Z2ML
	ffXHT
X-Google-Smtp-Source: AGHT+IEQibR5xQidIYUwJo3e02nfg8SuAc91PkHN6vP3VoUqrxvmz0rkxCDtnt4Dp/uczZukPl6SmQ==
X-Received: by 2002:a17:90b:3b8d:b0:2ee:acea:9ec4 with SMTP id 98e67ed59e1d1-3087bbad9edmr6449614a91.3.1745235412328;
        Mon, 21 Apr 2025 04:36:52 -0700 (PDT)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087df4dfc5sm6336689a91.32.2025.04.21.04.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 04:36:52 -0700 (PDT)
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
Subject: [PATCH v2 1/3] drm/panel-edp: Add support for AUO B140QAN08.H panel
Date: Mon, 21 Apr 2025 19:36:35 +0800
Message-Id: <20250421113637.27886-2-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250421113637.27886-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20250421113637.27886-1-xiazhengqiao@huaqin.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

AUO B140QAN08.H EDID:
edid-decode (hex):

00 ff ff ff ff ff ff 00 06 af b9 fe 00 00 00 00
00 23 01 04 a5 1e 13 78 03 c1 45 a8 55 48 9d 24
0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 18 86 40 a0 b0 08 52 70 30 20
65 00 2d bc 10 00 00 18 00 00 00 0f 00 00 00 00
00 00 00 00 00 00 00 00 00 20 00 00 00 fd 00 28
3c 71 71 22 01 0a 20 20 20 20 20 20 00 00 00 fc
00 42 31 34 30 51 41 4e 30 38 2e 48 20 0a 01 79

70 20 79 02 00 21 01 1d c2 0b 58 07 40 0b 08 07
88 8b fa 54 7e 24 9d 45 12 0f 02 35 54 40 5e 40
5e 00 44 12 78 22 00 14 ef 3c 05 85 3f 0b 9f 00
2f 80 1f 00 07 07 51 00 05 00 04 00 25 01 09 ef
3c 05 ef 3c 05 28 3c 80 2e 00 06 00 44 40 5e 40
5e 81 00 15 74 1a 00 00 03 00 28 3c 00 00 60 ff
60 ff 3c 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 4f 90

Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 52028c8f8988..958d260cda8a 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1880,6 +1880,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xc4b4, &delay_200_500_e50, "B116XAT04.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xd497, &delay_200_500_e50, "B120XAN01.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0xf390, &delay_200_500_e50, "B140XTN07.7"),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0xc9a8, &delay_200_500_e50, "B140QAN08.H"),
 
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0607, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0608, &delay_200_500_e50, "NT116WHM-N11"),
-- 
2.17.1

