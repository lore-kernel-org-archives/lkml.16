Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA4D2066CE;
	Fri,  6 Jun 2025 11:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749210409; cv=none; b=N/RUe1gtAj+VEWGJU8tTUJfUNvoJyibxhqiSk8SkYXDZ4rtCM674rCpDYLngUJWWKbhoEoJdhixsrOvz/5UlMXHYwIro9Br3x5+tgETiGqfI/cswVra4gHbWSFb8ikpLeX9bQzuhOC7owP8Yq+l8KSu4nh9E+MVKpjgk85SrsA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749210409; c=relaxed/simple;
	bh=eOfExiUf+XekW5+oov9reWaBdBNfu1G6CdVlIAY38RI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R386TCf0PLSSbvCH7VUh+3qGKBqP4iF6b4YKm8IKWCTdZyLH3/wLGe6KyvK4LsFo4YeBjlchJmJpL0nal8QeBC8UH/iZQuiAP6Vxced0XLWAi1cTF1bmQN90wbLaSXbVyW2iHOnZyc+8ie7N1jZal2TOi86iPXgWCDr9S13Kre8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ot5vmcOD; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ot5vmcOD"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso1859703f8f.1;
        Fri, 06 Jun 2025 04:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749210406; x=1749815206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PjAcWe70JY96dBY0oozKYeEaxt/7BhJ8i+mA680ELKA=;
        b=Ot5vmcODDWYetl1x0FYs149KgvExH17+jGoVbgHag5eceOf5L96bRvEwXu6W7OOZnJ
         aBOO1URuoXSMs37c87BopxfKV5dFkT8q29nlfFBVZ/ejtHH27NpoNrsPmi4NAnfK20DA
         srA01qF/1VUbfHFw5iC6W/jK5zfoF8OpJ9D8bM5nFpms9yHVac/6Jb1T5pnlVkMeWAsI
         2y2x+DP7+6KIjY+98kYUjdL6VRv5jTlldrL2S0kIHzMAgrvHCZipehviXikMF/apC+BW
         5J8J9NdxqjTcqNXtw4oNIt0u7F3n+BGbtOG7y/TdpI0TTquDvgdnF2d29EMnm9gSEgwb
         1iPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749210406; x=1749815206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PjAcWe70JY96dBY0oozKYeEaxt/7BhJ8i+mA680ELKA=;
        b=AP4t6WFb/iSTjv2UF4PdtDdR/Xk76OMynNwGkNm7zev0BsP90IqQNg3BIqUp6CpXJd
         BN2NhETPzo4oIrCXWMQkwucZRXRY1gz6rgOzvlY71IXQyVHlfTQ4Etml5x/OFGjoFgPy
         gr789tXHOYOgrLhfklofstYtjhs62BZn7g9INJaG0hrLzLrqqJeBlLvX54EdIn7bZqcp
         gTCn/YzwppUZZ3v4YCLU1fBmdOVt08aX32rfTTbuwqMjNzhGmdvP5O9eApS3L68dg4gY
         Zw1nznaiEKxcZW76VmeEu88pMoPulNa/pFQVNRgwxU6F5LxUvfK1LVciH7jHFAKr9k2G
         B4OA==
X-Forwarded-Encrypted: i=1; AJvYcCVkSe6jAQ1MWE43FhbKjMwLJaOxCo9fGeFGlL3epYN0V7HRfn+fpkTg2HMeROyRKesRhKKB8RR9E1xU@vger.kernel.org, AJvYcCXLmBqrnFFxQrvBTKrH2qMTjgOhLlF9kxwyOlOSKUcfgZT0z0RMsAIe8S5DmyRK6VK4YgTQ5nRxpxo13GF1@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9dddzB9EMkIHWwxZBz3ucIBZB+VsJsbiZQRktcn50SMHx6a9L
	bQWo3WuRafuaaZ69mwJjRBhlc7GK5KaXvFD/T2GqUuw2SIMmEcymRHtd
X-Gm-Gg: ASbGnctmC/DRDnLHX6xZqMSZ2VI9zkoM6XOkOqGH58fwCSDPQ0/KDO4Zu5Lgfe5GdTk
	NcTcha5aQscAUUrTcPztAjOBallHQH8PvT767zWHIpfrBA0QUyYPDqaKSBRO7Xb1TOqiuOmWkpr
	zxVf8DrbKIkEClm2IlJprtHcHMGdRa3Zt3fbg3N+Ah5t8H76gHKZq0Ljj0/aGh3jncN+C8zi1pq
	3wPUhtaEcC6W/vWLAPz6OGkRBNhaCshnyTUghT0LsFyKqkmAFVFVTKqVKJ7WpQA1eeskpet3/e8
	VQY1iHgNYqA3bUyRhPe9PJQCMukiwv+/A9uEyrHszzw4qWTSwFfLk+KUGGfLIp/Qu+Kstft5azZ
	XGw==
X-Google-Smtp-Source: AGHT+IEh6fjC39UFkQxSRQZMudiWztOA2853bVG1ipDO9BfHLRZsNiFrRvJ/D0vBh0AbPo0EXQmGBA==
X-Received: by 2002:a05:6000:2c10:b0:3a5:2875:f985 with SMTP id ffacd0b85a97d-3a531cb60a6mr2563628f8f.59.1749210405982;
        Fri, 06 Jun 2025 04:46:45 -0700 (PDT)
Received: from eichest-laptop.lan ([2a02:168:af72:0:4223:e58c:4c9a:459b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532464e7fsm1630480f8f.96.2025.06.06.04.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 04:46:45 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: jagan@amarulasolutions.com,
	neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Add Winstar wf40eswaa6mnn0 panel support
Date: Fri,  6 Jun 2025 13:45:49 +0200
Message-ID: <20250606114644.105371-1-eichest@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for the Winstar wf40eswaa6mnn0 panel. The
datasheet including the init sequence was taken from here:
https://www.winstar.com.tw/d/308/WF40ESWAA6MNN0.pdf

Stefan Eichenberger (2):
  drm/panel: st7701: Add Winstar wf40eswaa6mnn0 panel support
  dt-bindings: display: st7701: Add Winstar wf40eswaa6mnn0 panel

 .../display/panel/sitronix,st7701.yaml        |   1 +
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 124 ++++++++++++++++++
 2 files changed, 125 insertions(+)

-- 
2.48.1

