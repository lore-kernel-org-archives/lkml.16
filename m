Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A271F5424;
	Mon,  3 Feb 2025 06:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738563794; cv=none; b=qVyFyLcdhkkj9FWPStJpD9y7DQ1baeYDYl9I/0j6RYB/VGr9SR2WNmSfHZ46rFAuhgeMYWfQf/rgQaeLfcyvPXsQQQ7MMAi+MiRx6DGALI76BsXoQdcXFJvk+5XUBGdbUdrUb6tEh/rgwwi1EokkErQyqMhmFNyQ+KNrNm1NT/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738563794; c=relaxed/simple;
	bh=ndcGEPrnD62GulMfN5unalpKAMLHfYYZBWLNH8mur48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V9Uax2TXSWoLQrNgYs1m4OMoBvScvVvgXedZIxO00fZb10Wdza1+TqgYosa5KfnsBIiNKc63RANClcgNL5jXSVmHIIWpyk+uGo0+MmDN5f2XeLk6RiY0Y5IJNi2BR53c0shCfgKvSzyjG5jbWBiyjzkSbyO/DlWvusiPYyaz+yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lhuH5eDp; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lhuH5eDp"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5162571e761so1351881e0c.2;
        Sun, 02 Feb 2025 22:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738563791; x=1739168591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APpgpffaIqDe69AgyJqHNVwT7sOhy3J7j/9W39EGZXI=;
        b=lhuH5eDpbDhKoOYtWkSfE3dVKWg5dR2cPv86z8A1YStgltC0o3FPDRxrguBAL/euw8
         4GW8rlXN7T3l81GWEyTzN08cb5RsScR5CUPTAggC8tkBIcC/gEgYf7QQzgLf7ih8nIB+
         oFK0mKqLdMJXQRALpZb4LqLkdJAsNeKU5GhHSPGLyxA3cD8qbZ0a8tXuCB6xSyBASiW+
         LK3o1pHmtn0Lkhz0dl04eEakEKdNLd/vZItrMavs8Z1J0phpb+Z1eGD4eU9q3ck9CPWa
         JBexMm5V5MEc90hLXPgHr/K5tf1fqR/QDbbkx4pa0HeM8+pRud57p7bzt+gtRDQS//BY
         xtQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738563791; x=1739168591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=APpgpffaIqDe69AgyJqHNVwT7sOhy3J7j/9W39EGZXI=;
        b=AQfDRJHFlY3RJtdCEaoAhpT9OeluT/pV6OPlxS7uHcK5inzFMyH65lKQHnEqWCXRWM
         JTDWAvzZNDx2d0hMYbhVP0otKBUcZj4qG4K92V3yQEwcRw/xI+0BOXKkmAl2DH7WM1yW
         v0WGddN2R3aVONGgw4oCmJjgx4lJDYwxgcrI/ytwMSsul+InP8uqfcnItMvHtiP4JAxh
         c+AEGyHrnBRYpi4KftCZOGHrE+68K/zz9C/rPiodaR+KIqeKAwLhiWzyMxgx/7HebWuR
         5tLbpWlC41+TUSPc5tZP+m9JuobJLFOIjPKT363ZVpOGFYIIAPTWyvcQWbpkircXJiKo
         CpAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxbd4iA4ejGeF/l3lWVZo0nEtDJa6zbr0U5F+DyLqNPhzTGvJYvS1QkCLUaQYacdC4OZU899ZgV0+awbM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzsCEXfn4SyeNDXtLJnpruvpL7L7s1o8kOk13s8Yc/L2gKdAuk
	eAn5FTqTusFqUtatsdBYTYYlAWlXnIzDu0+HZPKYp+4dmW50fklIVBDgWg==
X-Gm-Gg: ASbGncv5Ts6UvkTCw9N83yoQ0AgKL80XDinUt2uEy2oZRakDeIcsX8iNUIzv8FBmUUH
	DGGGKjLpqOqGK5uidDuXjT+hLSc0pmQnXmLfcpkb89iMKMvFwzgcSeZx1B9X3CI1kCOpqhJnd3L
	8xdZtCUpr7B1yCqEcgqr3kWs6QWHve3RgLnITdgN6cP9WpagdeaU/Rgvwhm85eY+tNu4L1WhiXi
	blQgYEKXcgPq3nBWP0FBAeL4gxWm/ppkoRwz5sjsRQ148jo7acIVw/rpo4H7pxp+a31uPjDxB3z
	hxPNVZ+STY8OAK4rpIGdLUA=
X-Google-Smtp-Source: AGHT+IEM0LzSw4i2ZHoCtIXncShu6ZY51LcW57QXKspBlwqdzVDxFoQNBaluc6Ckokf0RLH5sDMzpQ==
X-Received: by 2002:a05:6122:32cb:b0:516:2833:1b8d with SMTP id 71dfb90a1353d-51e9e55db69mr15237430e0c.11.1738563791602;
        Sun, 02 Feb 2025 22:23:11 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51eb1d64c20sm1138789e0c.32.2025.02.02.22.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 22:23:10 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v7 08/14] MAINTAINERS: Update ALIENWARE WMI DRIVER entry
Date: Mon,  3 Feb 2025 01:20:49 -0500
Message-ID: <20250203062055.2915-9-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203062055.2915-1-kuurtb@gmail.com>
References: <20250203062055.2915-1-kuurtb@gmail.com>
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
index 936e80f2c9ce..09a117a1f89e 100644
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

