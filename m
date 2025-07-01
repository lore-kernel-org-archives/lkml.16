Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AECF26A0DB
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751357828; cv=none; b=gKq9dKTUSYx2/d3uTHNH8Z/WWPM0eIBKJyVQAl7/GHXgtiyJy8V0fhoHOS4gJCnxBdlLSe9gEcIouo0mJlDY8izAA6QkI7o8nf84q65nRH/epNADR4LeRMyyDLl7ZXwWBO+jQDkqE4HIIQDi6IijLBW7UgG5O/ZvDY1Y67osEEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751357828; c=relaxed/simple;
	bh=EcfZcgX/KzHTqMkRzdgkCdFSyL/wfJUE3j3C+p8Up9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VGrVpu5NXLQdc5934OVl2QpuwsmrYiP09+L2XQTWOvmd6VHxlTK2bLFXHXVFmqaTXlwH/TQ0UEGozdGUbiRIXdYcxM7wfXg+/vyozpBdkmrS8iB6rmXj1qvW5pXz5eq4s8k2RBerPDuNHtpvsUek33RF0R8rCmfuQiu/ZqM3Mfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=k4UcACWW; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="k4UcACWW"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4538a2fc7ffso34797935e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 01:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751357825; x=1751962625; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XfPRhGcB3Y4E2N3R/jd+CsAbatnKTO0iTJe0rlZi1wM=;
        b=k4UcACWWQMW8x5I5+YZvHx5oD3MYZeOVBTXx10VGQbkcWLsl8ap5EaM6V8a87DlFN7
         8dmaLqavySVN9OCBHAYPn78ku1ujUdZE8fklkj0FYBPcQNCDjKXAwwzilNh26Bdc3q48
         Kwiu05pth3dP/UFxf7xQQwwApOIhWvHWRy5DZDmS9NEXqScKEHKBakqjyvaPS1KhtRUK
         XG98f5dxonMKZL8JdZ5gNiYmy/pRkIWCUHzTLH3DrI8obppyJER0QG8xT3oYwZrTtoG6
         Z+ni/7k5l3vOv8wmJZknsfySuyWy1L3j/XS0tKx8yiRNHGL/Ob82Sy0Xhe6Ax3nHY1e+
         comQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751357825; x=1751962625;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XfPRhGcB3Y4E2N3R/jd+CsAbatnKTO0iTJe0rlZi1wM=;
        b=Jby3JWqigYdDU6vkj+OdrIln4JyehPp7xlyEM1nmxFKyaRbL5baLqPX59kSuvNwXzF
         yY9kuNW2hr5UiYV0zXjt/E6U0K7mqQ8IYuQfglDO2cSBSP6KIwNWckRGubHbPAQ7w8Md
         EJvbEn87z0t8aOw053p/bHVzLsPLuMPNWWXaubSwJNQwn1jobcVtlWDd5KJRwpTZga8F
         lLbWzQlLpYKj/o11MyQ1zOAVqdDAvMAVNUAx0b1we1D9dIWtkALuCs8FOevShNsFvu6v
         HHNGbobx/DsDqxRln64/cl/rlo4oxwnqKUg41hxhR4KuE94B0RZB5ZxXvwNb34fQmVAK
         GZ6Q==
X-Forwarded-Encrypted: i=1; AJvYcCU1Mv8BhoW9P1TRGuzdfE3074K7TmyFXLDaLo8S/URF8Xug3nUoY1e19Mj46LtpKQoIvPo05lIBxgeX85U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI43304zNtf81LIephK24WY1dKnSB53r4YHV2HeGEN6AW2wtqP
	N9Hg56VmM2/gQSeHSDc+cYJSqjXYO1Bma+ftRQhWhKlq5Jkmd/k3+Cool/pTWJdhqVs=
X-Gm-Gg: ASbGncui6OBRP4HAsgRm+o/6qZYeDOhkrZ57ufQzX/0wDuwIsL5Jo7aPVirA5NRMk5A
	vnMVq7GcukKRtcgKggc7cSn6eci/B/MrLiJeZkkyFqgutHPZ7HYEQedPQ3MzdjrvRa94DnNbSXZ
	g8IGA1UaEsbIwUGRtyDqxee91Ik8FYSwRi6CjIxKpTR6BzlLOqPe84fMdJHyJdnqbPCvkTruS0K
	kobtfrmfwzAWD11OhRs8hVWcXyeikHXIG6mkDSt625+TF/yGH3l4SjT0/CRCQLEbKcDtmOw30gW
	BvAYUP9vysw12F2evAEuxaHQK0aIUYREzlY0ta+gz7SvHyIVibDOd/2gxMVEv492NQWQEw63TVM
	5q8SpjD05bJw5gNfE/zDJ7FTKPKUxU/i+vpS98bwhgbw=
X-Google-Smtp-Source: AGHT+IFNW0Gd1HhmH87xCE6By8JuGO3PB2k4h6ksmT3X58JMjtLORuZd9++ccAGzs4slWB1G0Jx0/w==
X-Received: by 2002:a05:600c:c0c8:b0:43c:ed33:a500 with SMTP id 5b1f17b1804b1-453a79673d4mr17688195e9.10.1751357824351;
        Tue, 01 Jul 2025 01:17:04 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fab6esm12766675f8f.31.2025.07.01.01.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 01:17:03 -0700 (PDT)
From: daniel@riscstar.com
X-Google-Original-From: danielt@kernel.org
Date: Tue, 01 Jul 2025 09:16:30 +0100
Subject: [PATCH] drm/edp-panel: Add touchscreen panel used by Lenovo X13s
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-x13x-touchscreen-lookup-v1-1-a1277f119f92@riscstar.com>
X-B4-Tracking: v=1; b=H4sIAF2ZY2gC/x3MSwqAMAwA0atI1gZa6w+vIi4kRg1KK61KQby7x
 eVbzDwQ2AsH6LIHPN8SxNkEnWdA62gXRpmSoVBFpRqlMWoT8XQXrYE8s8Xdue06UJlxajWZmco
 aUn14niX+53543w+q+pwIaQAAAA==
X-Change-ID: 20250701-x13x-touchscreen-lookup-03ad81c3fc46
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Daniel Thompson <daniel@riscstar.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2020; i=daniel@riscstar.com;
 h=from:subject:message-id; bh=rsCSDF4oa1mXKkIMQDvD8kEAVJWdqOYxGDG8Q97DkO8=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBoY5lr4c6SE8UwkHRKilPNXpBDUkdYB0HUtZ1Z+
 Ibel7vdVxSJAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCaGOZawAKCRB84yVdOfeI
 oTSBEACYPrcSUl8ZMnpPrIHbBehm4w1OmEz+4S7ROwOR6GAZmIgvOTlpvv90AuioK12iAMIIG70
 0dMnlSmINF2XuuWWqHJvoJ/xHAOqAJGuj6MTnQCg1pbMBsYpAPUHzJOAQbPfYGoQb9bQskXiUGB
 JXyqo/PUzhk9qSn2N0g18Qmdcv8Y8SUeq4gl68s48xk6HOZYjCPiusl5oIEzpUv2SCz7lultbAa
 PV4n+zQHfXnwLgpieAtqET5qdYbe2eFj2eXDq8ngvrfqUp9pToUfNpA31BAxVxGPohOx8Q+FB5M
 BX/9ZjvS+5jbS85t1l8ysLDC8ZWQN27Ir+2COPdTAb+SrClhDYu06oiV0CeGgKD+GdF8ErQLdgl
 niKwdNZr8hAQQXFZSOeNaMLsFNAywcKrBUV/PDl9uuooaXXUNhMwVFCnUncrIgJBm/48LjHSW1n
 dHSKoWfuu+U/2cbi/nJiJ8CObR41bZRUr1z7YSubYw6V7uuWwGqq9Lbz/i6yzh2q7ALpyjQSFgL
 fKCZzM8SjZiURhzPHo49d08X58F2dph39P76Kg37zsY2jqSgCfrNyuDp8omlwzAxZT6nJ3/lbm1
 WCNYH5pP4+tdq1pzyYDp6/vR8ZYrZ1rZqtiIR2M1ROjIzh/BOWDpy0XVzb30vW2V3hxlRPm6/8k
 Y8Cj6o3OKOysb9w==
X-Developer-Key: i=daniel@riscstar.com; a=openpgp;
 fpr=E38BE19861669213F6E2661AA8A4E3BC5B7B28BE

From: Daniel Thompson <daniel@riscstar.com>

After (checks watch) a little over two years I finally investigated the
boot warning on my Thinkpad X13s and it was caused by the conservative
timings warning in panel-edp.c . The X13s was sold with a variety of
different panel versions; I have the 300 nit multi-touch variant.

I have been unable to secure panel documentation so the I copied the
timings from NV133WUM-N63.

The raw EDID is:

00 ff ff ff ff ff ff 00 09 e5 84 0a 00 00 00 00
1e 1f 01 04 a5 1d 12 78 03 5c 70 a6 51 4c 9c 26
0e 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 74 3c 80 a0 70 b0 28 40 30 20
36 00 1e b3 10 00 00 1a 00 00 00 fd 00 28 3c 4b
4b 10 01 0a 20 20 20 20 20 20 00 00 00 fe 00 42
4f 45 20 48 46 0a 20 20 20 20 20 20 00 00 00 fe
00 4e 56 31 33 33 57 55 4d 2d 54 30 31 0a 00 51

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 90e8c154a9788ad40e2101fdf39cbd92f2e0773a..9144de974f1e4abdd1af12613238f6f28d98fc41 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1935,6 +1935,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a3e, &delay_200_500_e80, "NV116WHM-N49"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a5d, &delay_200_500_e50, "NV116WHM-N45"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ac5, &delay_200_500_e50, "NV116WHM-N4C"),
+	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0a84, &delay_200_500_e50, "NV133WUM-T01"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0ae8, &delay_200_500_e50_p2e80, "NV140WUM-N41"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b09, &delay_200_500_e50_po2e200, "NV140FHM-NZ"),
 	EDP_PANEL_ENTRY('B', 'O', 'E', 0x0b34, &delay_200_500_e80, "NV122WUM-N41"),

---
base-commit: d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af
change-id: 20250701-x13x-touchscreen-lookup-03ad81c3fc46

Best regards,
-- 
Daniel Thompson <daniel@riscstar.com>

