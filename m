Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFC62BCF7E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918439; cv=none; b=kz0OXXtHo5k+al0CkUFPrf7OM+PNHE8tZ8Vk7wXytNOjdcc/QRe+C7VWzSXVJXrWHK0zErnBDI/GxojPn63/ohHt+ZxmPIUTAgJxbrX7CfmcQ1J/Ubwl9F4gy93aEBGZFdL0HRzg8mWEfES0vGVVV7lPuFZD5t89LdO60oeZ1Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918439; c=relaxed/simple;
	bh=Mtubd7kcUTSuCVjg0jfNXyqdjQoCE84ajtDBpsHqT5k=;
	h=From:To:Cc:Subject:Date:Message-Id; b=Ai+jX7ODEgg5fMHDXrKhWW8TWwsZRlEnvAEsv+Qax3IwfNbxUFxSwIqs3prgQQmMuLZxKqmxV6ffFhcgR9znmZxUztEiN+fdJ6wduSk+/JbN8SEDI/1FG6mlTOSDYQw3i7EIUJq1/VYWlbqJz312jOtDnvhcAaPBBQJFVB+hF8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=1wfMONlD; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="1wfMONlD"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7393eab4a75so805925b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 02:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1745918437; x=1746523237; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BvaliSErUYZ24zOy24oW0l9inFOug0V/EfItbz4+qJY=;
        b=1wfMONlDQxJ2V/NRZJBNkfXlS3UZB5SRspIXThQ6rlrC3VWUr4Z4cKnHSgNUJFKmDK
         +2Jx6OgIPLSv1AtmKefvWPvhXoaEwEOUFNTn6ErLwPb8CNmIuiixOjri+XHw8J/9b7W+
         xsS8m+EYB8KYXC8tGuyfzSI36dkvT9A+b4kKe+tfeMKsODLXx8Bg5pbYK1ganXlocKRS
         3lpSERI/lRzbt1TxMLtBPfu+ksrh2lEO8N7EanJhqTMThIjX6I8ZsIx6Iwqlfour3+XP
         oPOKdSmddQX4Ge7pvun8WBwtqUAXUFa9jl5qWG21cABSp1hhuCZ7cd5q8hIdYZexWTGc
         D4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745918437; x=1746523237;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BvaliSErUYZ24zOy24oW0l9inFOug0V/EfItbz4+qJY=;
        b=nLKjPuTE2WiVBYMbm3GtYv5oTqLkV24oDdgcoVjBnwicJQ7156ziwYdki6PQKpsu7H
         D1943/JC7hc1p4Ok4le6TIUkX7MZyTKYcZ0EhoNgEOtvZnpVSzLnJ5f9SiOkcXqtaSis
         9cxJxKFtW6LCx+5GuCZg9dmaN3FGFFLn2ObTE4Bb52FXvenElyCwaJ9+4WhDBGRvy/nw
         eOdteRKUnxBlvxfBzp2wxD9h9USJoNCz1bm/q09AYHHlrrhs5a5smYwyi5J5FUyunq62
         cfUep9PLsTUTRkyDNB6ke4sriD2tcYZqDlj4QgztOU2MEpc1ILKkS8EtAr63lH/KA0yy
         7UkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlpcURsGaWz7nSoN8H9yYXfLKWjKWom/YX6I6bXcIoQCUVkCJPBHO+awQG+cNFbwtr8GXo8+n87pLWKUg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpYPokP73TpNQtrKwshSibNXT6NKPYeJ9ulrpDpFCOoqezbJEs
	NPdLeFxwDxFTgphJIZGEpZr9ClXM4J0nCf0/HkGaEaH0RuBNFkIH2SDgN/CiX9M=
X-Gm-Gg: ASbGncvN0CX6dKEoJbV7u+AnRsik6calEjAz2vRiuRZt6474V6yXpzsqzrLgVk2g52g
	mPjbkQYvc9VPMMAj+LA4xgO2VTPMUBONsXlq4DngigqAiMxsDM5kSzw1nPiMSxTBU/zNIttFEyX
	V+cu988/t/iB7B0mIPEetkS+jimYwoSfOKo31IjP+u6LpXDi0CofSeDePBR3na/JjcH4Q+FXVKL
	kQCo+2yiwNyoi4czcAdLGnR1t8AsQ39Y5ndQhksp5rat2ObQqE8ra5C3+txOBJVmKNPWb3ueOQY
	rtid0/ztuXadxPClECLa68HIruQRZxwL/kyBEWJj3UwwoAIWjx7qGo1xQqRrBIEHIUYlSvsFe8o
	ZFO19nqVtEkHfm2A=
X-Google-Smtp-Source: AGHT+IEV5ogys0l2vXW3zP5HCQ1ycfry815W3wpmmpb0QJkuLBL078T8CYF88qMpcAKeaw6hSxPNRA==
X-Received: by 2002:a05:6a21:1349:b0:1ee:d047:ec23 with SMTP id adf61e73a8af0-20942f162f0mr1518908637.11.1745918436818;
        Tue, 29 Apr 2025 02:20:36 -0700 (PDT)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a9d44esm9722786b3a.148.2025.04.29.02.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 02:20:36 -0700 (PDT)
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
Subject: [PATCH v3 0/3] drm/panel-edp: Add support for several panels
Date: Tue, 29 Apr 2025 17:20:27 +0800
Message-Id: <20250429092030.8025-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

AUO B140QAN08.H
BOE NE140WUM-N6S
CSW MNE007QS3-8

Changes in v3:
- PATCH 1/3: Sort the list
- PATCH 2/3: remove delay_200_500_e80_p2e80 and Sort the list
- PATCH 3/3: The test timing of hpd_absent meets spec, don't modify
- Link to v2: https://patchwork.kernel.org/project/dri-devel/cover/20250421113637.27886-1-xiazhengqiao@huaqin.corp-partner.google.com/

Zhengqiao Xia (3):
  drm/panel-edp: Add support for AUO B140QAN08.H panel
  drm/panel-edp: Add support for BOE NE140WUM-N6S panel
  drm/panel-edp: Add support for CSW MNE007QS3-8 panel

 drivers/gpu/drm/panel/panel-edp.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

-- 
2.17.1

