Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7172720FA94;
	Mon,  3 Feb 2025 18:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738607260; cv=none; b=oyar8c7i/9r/A8dFGzLIBMm5R3HQyQ7dYX6r5BaEAazPMWknnukwChl8Fk+sCWHjQhNyirnF8rucXu0fgTiNyOfvVR2a+3l0T87K6d+fgkj9IaL79WFhgx90f4EJjJHB3PRMc/aCF6czlxs/gtlaeF2odMypB+nKK1B8zWYpCNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738607260; c=relaxed/simple;
	bh=nIeE5O6wKBb88hOTGBMcFuN7pvj3KJG4kN1RUuCo3Gk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n1WsdSZSfoQUyo0Le7EkzHYUnP44YCEv6Wf01Wf5tYDsmlr52UQPmm9TsusjbvEPI9GFvdVQj6xa3UEY+b30GgMBNMtnCmU3A1LiCZYypQERfqSgpnCWBvQHBLXMRkisbzs762Kf8Ha4Xvqc1BDMdRSzqCIMR1CNMMkJZfaMpHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O0/rpAWg; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O0/rpAWg"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e549dd7201cso4673365276.0;
        Mon, 03 Feb 2025 10:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738607257; x=1739212057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzABHP5CzaLvUmDBd2e0Y8hw1bkoD4rrP7ahn29JoF8=;
        b=O0/rpAWgEMM1Tw1c7NRxFuuJ/k1ywoJ0A9XeNkcDIsMjIuH8i+mYPcTKdFuCgR8uWm
         8qRxEMdAOJG2zTAXila5PzppsppWToYbHzjJTJgbm3JB90HhIVcRBzZXI/M1/UtCwiwo
         OTL2D4g2GeDxw+Fh5qyg2lvnaq9lXImFBCfyTz9cCNU2NPNo8wi6tJt1kgYKO3d7b4vk
         lxZEMyKgGuC9t1d7uUrkILD9Ozdk5M4DtA53GGxwgM3gy+CUfokcknG0Mn1YUH3yLhWt
         ISNqKT7D+QOKmTFsrraOFcDW1UbYmtJ8fQBMW2SFAdItb3AvHwjCR0PgUKnTcszDEClW
         dQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738607257; x=1739212057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lzABHP5CzaLvUmDBd2e0Y8hw1bkoD4rrP7ahn29JoF8=;
        b=a8jiKeQ8Ota8ZGh2Cv2p1zD4wdal5cZ1rSwh4Z5OIshol/jIBuUU4uSaV26WiBDR3x
         hsEobanYMO0/DXIM6w/0sNDxmDraY3pwH3rLL5Uvr78V6HI3SdsZc4Lac4+2gX57V1fb
         21x1KnMZcwyOLqhz997aNnK4MJJ/LWrdyIiS1JFhPHiwfJvtJdEcma1rwCmZQ9N5HBkk
         GyVya/Ne+158+ghAM7A2OVCD1wdTuC7Mvz6eA6efrS9XQsuL4j0YhEfUv6O40DSPk0QZ
         lXqvj8cZ9jYQcuqX1es012ZLS49gLmR63+1LfuN/WTE8dvIkZS6RLk21z+SEEenDXbap
         288A==
X-Forwarded-Encrypted: i=1; AJvYcCV7N07elDNDzcZ/ql0qHhnfe7GQEwMCOWf2bimC/8AfIuW5FkKvtyg4pd4Ya3ecyDqLAA4obE8D5uiP67U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzznhK+SKe6mnbCTJyrXQakeDYvvvQGej2FB83ieH39jqO9WFvE
	8zNIamtsaM/fsBpbypLDrFiLjpK79W9LY4pwhYqKRr9Jbi0EKb6tEGjJiw==
X-Gm-Gg: ASbGncsudtbFsLg6hLipnLMa4nbUYdxVyURSy+uijCC1uoMGX85MHZyg17pGr8kLgXj
	Dd2wOBx1lIRBNE71ufKqeQxdzZPi3P/U+fPUHjH1cgLeXj3d5QDJWMI+hqwJ5BW3y3KLFH3xlA8
	Q6HxseJ3gjS33ufKF4rIHfaRfPzBfbJgUkC/AMocZL2bzTl6pacnDeLbvd0DUmLT57VIc30LSny
	qmt63JMErB5WWp5V9u+cEsuWnNyOI/xujHcq9ny5b6zD1X7HhueTy9CySRlwhaHcw/aPJT8PM3V
	ph1W4tkbJ9qKnk3yUJpQfpc=
X-Google-Smtp-Source: AGHT+IEo2ZiceoSyXKXtgo+/Xvn95PRv6XPz5bAbcVxkATWcUlPN0LGP8qQ0toJs9jqh8JkveO2eGw==
X-Received: by 2002:a05:6902:1546:b0:e57:f631:d26b with SMTP id 3f1490d57ef6-e58a4bfd28dmr15919735276.42.1738607257160;
        Mon, 03 Feb 2025 10:27:37 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5acb2bc726sm2142239276.30.2025.02.03.10.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 10:27:36 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v8 08/14] MAINTAINERS: Update ALIENWARE WMI DRIVER entry
Date: Mon,  3 Feb 2025 13:27:07 -0500
Message-ID: <20250203182713.27446-9-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203182713.27446-1-kuurtb@gmail.com>
References: <20250203182713.27446-1-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dell has been inactive in its maintainership role of this driver since
around 2021. Due to this, add myself as a maintainer and update path
to support upcoming changes.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 896a307fa065..129df78d0298 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -792,10 +792,12 @@ F:	Documentation/admin-guide/perf/alibaba_pmu.rst
 F:	drivers/perf/alibaba_uncore_drw_pmu.c
 
 ALIENWARE WMI DRIVER
+M:	Kurt Borja <kuurtb@gmail.com>
+L:	platform-driver-x86@vger.kernel.org
 L:	Dell.Client.Kernel@dell.com
 S:	Maintained
 F:	Documentation/wmi/devices/alienware-wmi.rst
-F:	drivers/platform/x86/dell/alienware-wmi.c
+F:	drivers/platform/x86/dell/alienware-wmi*
 
 ALLEGRO DVT VIDEO IP CORE DRIVER
 M:	Michael Tretter <m.tretter@pengutronix.de>
-- 
2.48.1

