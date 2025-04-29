Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8322B2BD5A6
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918448; cv=none; b=qtB5mpkcL3L9Jnn0xmLLXRKum62zPyysNlZbs1dZnttotg9sr7OVHUJ0SKbHM6s79tNvIPIVInfm+svpInzyyb1fKPUc6I2QTPQ7FJVNxvJ0/8jBAKjCzLlkdqQWrppQ0N03hp9gtsI6C2EHA5oXyZER4Gez1JFsVUsKNhD542s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918448; c=relaxed/simple;
	bh=aj5LkUh49sT8keYezlaFLY5VXoSNrS16ED54wbeDwzg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=TX0P/KIOzo/vv9oWw6W5I7m5QXE/JxxhU7LpFTCMpVBRxxcxKAHKSlXTuch64guMj7hCzh2PJtoG/wZfYld/IycKrbAgmyE/PQu2YdUDalk5snWHaxPZS19OBQ0ZT1JmdEsTVEjlZBWbYlChx6LHqiJHQazR+5Uq/KvsAcL5X8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=YwtJysb+; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="YwtJysb+"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-737685eda9aso756884b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 02:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1745918446; x=1746523246; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=26BMu2J7+YmLinZWtd6WALTAuUBvQeb+c2nCPLBeOsM=;
        b=YwtJysb+pJHNzHismdgD+tRHA3zp3ZgcacBXQrDPBXAizaIf6K+Ufl9q8AfBh8PWTw
         XoECMd3ohLzBtdiBY6ia1DCnEVZzAq0/A/qNN5uwJvnWaItrF07hTCjbwEhOReH1KGLS
         13EeFf6NGIgW+5LiR8w0XwKiH9JhKNapYlx8XR5Spz2O45jCwCCxam92Tj3FFz1SZXmG
         R428CzHA/FGQ96SwpisITyW2bprgHULOjQYnJCmhgodkqQFXzA/Rn1Vd7rjWnr8O2L+D
         Bj1Qj1xMhaDm4exAkqV0mp8yBNzSpADV6/5t/WRzGSqXAUXM5UoPsS1/kWu7/n9J+9HJ
         ZV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745918446; x=1746523246;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=26BMu2J7+YmLinZWtd6WALTAuUBvQeb+c2nCPLBeOsM=;
        b=tbbyZmsR+6MX27/EVkJ6uC6ebM9qTOxzvC5yIqdygSCpGkdJYDDohbUI2vnrPEMKm3
         RLJ6XGNXo6SvDHJewikHRZ+ESBv/y8DBXZHmVtrDQjXr6wp9Cs/4FTLpkYWpq117ea5t
         VWkWkY4B7JPq1oXwJexPhqQiQtUjjb9yOtUO92T2SJVPs4ceLbpsGjt4e4rfmD+UQJ9r
         2Xy5dJi9yQqd9Aio6U8jPJ2jnqfg5x45HTTOmcwPpJh8ift61Ir6LggKwj7mDs5T3cLJ
         j+skCfKrC4RrLh/8kyu3cbGPepw3Jbi/ILtaMLa1zHD3jOHpvG/p1K7tL6PG0CZvJZ4g
         VxZg==
X-Forwarded-Encrypted: i=1; AJvYcCUHPwVuBfxayqhVPkKSZKhwbHlUihtiD3sjI0u+MdeRtCtXsuPqz3P/lH5DFuU5hQuL7id3IEdSkd5Ad1k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfuz7pyR6f3e44L9mpRgk06jau6iVHRamV9uMePdeql6S1XbPG
	I1Ow/XwHDHpJ8wjS6I99Oo+eO03SGZYE3aAPPSJFohsVtTFun+e8IHVgZz3Mg8A=
X-Gm-Gg: ASbGnctsF+bJx8Dxm+D9uIZQcTel8SYxpqdobklVuVtxTudNsoe8UBiGyKTzqhP2SqX
	GXxfmZwTX3it36mah1uiSq0CXYBBsqoPoW2GIUIPG5CsxkGTw/iaXFB0ImNbtrOtl2z+dHLDEKy
	y93McjZ7Ud8bC9XRETlEnLIEy92dNlaL5hkElT9HFLFFDgNd9//z/Ih2vi49ADGnYN8VX0LeAxU
	65Cvdz4+Skic0JyzLE1jRZkoQXiEJFEQSCtq3v1tcs1NhSxclnkmLUSFIM6uZVDiJtUxqhMZ66e
	XBLL0ae8ZxYPnaPEBTPqVkhUCO5X4sAaFuqdleIenCJ4oMxh+LXwtG/vaY/ItJka6rScgNVCPpM
	xg3bc
X-Google-Smtp-Source: AGHT+IECOeeos8hakKjTzrUcW1kd63GA+YGV9Aq9eutfb+q+Jb54LTlUEgtlh8xbmvIdH1qtRi0yCQ==
X-Received: by 2002:aa7:9a89:0:b0:730:8c9d:5842 with SMTP id d2e1a72fcca58-7402914f1c0mr915511b3a.5.1745918445711;
        Tue, 29 Apr 2025 02:20:45 -0700 (PDT)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a9d44esm9722786b3a.148.2025.04.29.02.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 02:20:44 -0700 (PDT)
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
Subject: [PATCH v3 3/3] drm/panel-edp: Add support for CSW MNE007QS3-8 panel
Date: Tue, 29 Apr 2025 17:20:30 +0800
Message-Id: <20250429092030.8025-4-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250429092030.8025-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20250429092030.8025-1-xiazhengqiao@huaqin.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

CSW MNE007QS3-8 EDID:
edid-decode (hex):

00 ff ff ff ff ff ff 00 0e 77 57 14 00 00 00 00
34 22 01 04 a5 1e 13 78 07 ee 95 a3 54 4c 99 26
0f 50 54 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 cd 7c 80 a0 70 b0 50 40 30 20
26 04 2e bc 10 00 00 1a cd 7c 80 a0 70 b0 50 45
30 20 26 04 2e bc 10 00 00 1a 00 00 00 fd 00 1e
78 9a 9a 20 01 0a 20 20 20 20 20 20 00 00 00 fc
00 4d 4e 45 30 30 37 51 53 33 2d 38 0a 20 01 3f

70 20 79 02 00 21 00 1d c8 0b 5d 07 80 07 b0 04
80 3d 8a 54 cd a4 99 66 62 0f 02 45 54 7c 5d 7c
5d 00 43 12 78 2b 00 0c 27 00 1e 77 00 00 27 00
1e 3b 00 00 2e 00 06 00 43 7c 5d 7c 5d 81 00 20
74 1a 00 00 03 01 1e 78 00 00 5a ff 5a ff 78 00
00 00 00 8d 00 e3 05 04 00 e6 06 01 01 5a 5a ff
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 76 90

Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/panel/panel-edp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 4bbd11d57b28..ba6eb58ce730 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1763,6 +1763,13 @@ static const struct panel_delay delay_80_500_e50 = {
 	.enable = 50,
 };
 
+static const struct panel_delay delay_80_500_e80_p2e200 = {
+	.hpd_absent = 80,
+	.unprepare = 500,
+	.enable = 80,
+	.prepare_to_enable = 200,
+};
+
 static const struct panel_delay delay_100_500_e200 = {
 	.hpd_absent = 100,
 	.unprepare = 500,
@@ -1975,6 +1982,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1103, &delay_200_500_e80_d50, "MNB601LS1-3"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1104, &delay_200_500_e50, "MNB601LS1-4"),
 	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1448, &delay_200_500_e50, "MNE007QS3-7"),
+	EDP_PANEL_ENTRY('C', 'S', 'W', 0x1457, &delay_80_500_e80_p2e200, "MNE007QS3-8"),
 
 	EDP_PANEL_ENTRY('E', 'T', 'C', 0x0000, &delay_50_500_e200_d200_po2e335, "LP079QX1-SP0V"),
 
-- 
2.17.1

