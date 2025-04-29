Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1DF2BCF7E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918445; cv=none; b=UnGVn9a3AChClkXofjUIQabPewL7vM0dCe3iHhw3jp58PJlvk5ReyPdrUtS5uHAHCzZze+8KGEYIsh0lQEELBX4Q0ItpBjX9aQ+w3odFFUHZe2HM6xiGm5HVjoYdo0fTVRifGDnlJ9QDpG6vuPUQ8e0ubn6WCmmm/ZJlG91LKv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918445; c=relaxed/simple;
	bh=QePSLtnZw1BPrtbLbCz1Oico6u1oYlKPCkToaNnKsGo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=VjEr3RFTiyEoRkIbTq3UmSJ6u3KOMHtbJK0D/CLnZrQcsJ50T5IL/VE3es8Wo57S9XEurrsP/huqldvW50R4ouiSq0vY5TUvn9geDQcYIL8MjORR1ew+IKPycFpkV0vPdW8MBAFOh2AMPkPsFTYCIMGnRdD915wyIH+kVDbGUTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=V3DX1sa/; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="V3DX1sa/"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-73de140046eso683984b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 02:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1745918443; x=1746523243; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ExKjWtsve78lQi8SE/lpl6CdGXeN4uhSj147JMScLyA=;
        b=V3DX1sa/r5gWAxgEOgONSSWIvk6OlyiQ82FM9D1PYcVA/DBDj6Bf7I88V8S2ZKDFiY
         TkEg0XOa35I/ArIOXocRHHOiisJi2V7IspvplB5qnWl6NDUtEJCVNpYwclf06hosvdLQ
         8LHP4PC9V+Wi+/bfHFqHqGx4RFVnA2oARQB4gUNEowsoO9zFekzD6WIfvki33cfyn8p6
         TXNRfB/bVUIWHP6maD7M7YVLg09Kw1Ud0iWqlEGVJD2sPIWvt64yJR0FM8lR7WZWQQ1/
         gaLKnyQJP9P1Y/aRn3T7vnIhXs0SxECP0I6xQ/s1EZJ4wvTExwYPzSqRvCkc3SisJ+9E
         fF/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745918443; x=1746523243;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ExKjWtsve78lQi8SE/lpl6CdGXeN4uhSj147JMScLyA=;
        b=mKbDtDkZ1sIwoLp0i+ksSqLM7pJLjXD2gBqQmj9XraitWTvXM0UuR6PeWy4/iBq3xe
         Fot2xYq9S9wDfoWd4WevwD9MaeCQexLKWGjmoR3uRt3eBLyHIbgsli/TDhojfUfX9N5D
         LHKYr24sVPQ8nG5cpx5O3vLC0DMT4DUCc8ULtsyU3Y+Geav6hPdIfL9JVDQnCssc9gvR
         qKCoYVgaqMyMDNtZ0/IW7I/p/AlQwacwXgNF2xS200ZPn8b78B76zLk4kHiA6HnBwT+c
         ayyNGOtfupmIbXdxoyr8MCLEWw5WQQ+WYR22C1FEDk/qEZjd+armEfsZ/RLzYhWng7sh
         F10w==
X-Forwarded-Encrypted: i=1; AJvYcCWNp/z1VgNDT2Shjp1kG0stGlvgIPHefTh4MYMxsu9ykCquVP07nldssi1zOib7md8X00Ln4JaCaexZzjk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6DglodTD0CfOC9UVDHKNlUiFFXF5wrPMCXB2ABsl8jHIq1RHi
	ZIQV+YX0VJBulANhcjCP29PJbdItMuRP3VSZSVyxiA/39ITQBjmqJ74OevOycMk=
X-Gm-Gg: ASbGncuIutVdxXBMLwJjNw+E7ncMX2wZzVNKD7enwSEfDs14e83cuVpaXaA3zMcwUo6
	MKKB1/Y0tCrNRYoOZWEXohxaq+iey+pOhS5rTqmSPNWum6CdDFpIA9ZCHFfHuXHi9K78AszXTnZ
	xOArKxc5DSn7dZ0MX2QaZggdg0AgVeXTQO3+xQF5wxNt+IVcjdqhOceMrcRHMiAeK5Uz/aepMuE
	Olb7XNPImKDN40G+XQoJgwqiRE9isP5CLd87CVEVj9Bmh4S89iPfWyXO5+O91irMLpUupNpzYU8
	hdI00duNMaKz1GDq0nx2qjuG/5wBvYxlesGS6cEQeKee5KXHAV627l6WkSPnh3tkd3ysCUBUEel
	fTGkz9zxVtVNSY5g=
X-Google-Smtp-Source: AGHT+IH2iMzn53CRF+NGQzGZLWpsfyRGmknpAdNrvp1TjSVKEinECj9Y8/CPcYuQ77gfTWQW6bwtWA==
X-Received: by 2002:aa7:9a89:0:b0:730:f1b7:9ba9 with SMTP id d2e1a72fcca58-74029152ec2mr1011875b3a.7.1745918442626;
        Tue, 29 Apr 2025 02:20:42 -0700 (PDT)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a9d44esm9722786b3a.148.2025.04.29.02.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 02:20:42 -0700 (PDT)
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
Subject: [PATCH v3 2/3] drm/panel-edp: Add support for BOE NE140WUM-N6S panel
Date: Tue, 29 Apr 2025 17:20:29 +0800
Message-Id: <20250429092030.8025-3-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250429092030.8025-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20250429092030.8025-1-xiazhengqiao@huaqin.corp-partner.google.com>
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
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index a7ada5382c82..4bbd11d57b28 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1939,6 +1939,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0c93, &delay_200_500_e200, "Unknown"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cb6, &delay_200_500_e200, "NT116WHM-N44"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0cfa, &delay_200_500_e50, "NV116WHM-A4D"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0d73, &delay_200_500_e80, "NE140WUM-N6S"),
 
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1130, &delay_200_500_e50, "N116BGE-EB2"),
 	EDP_PANEL_ENTRY('C', 'M', 'N', 0x1132, &delay_200_500_e80_d50, "N116BGE-EA2"),
-- 
2.17.1

