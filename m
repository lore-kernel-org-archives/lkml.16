Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195A93DABE6;
	Fri,  7 Feb 2025 15:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943228; cv=none; b=Y/vQZncVKvgk896TG5p91Ev3wJWpIkdP6zdI97pxrY5DD2V/f0OSDxIGv/Y9FsHv9c7O//t53SbrkD5yhHcGe7moBtDJqFpTCqrBgj423P2a0z7G/aOJSyLX8kGrF4tWSs1MJTKwuiVE1W+dyrVpdx69rzOF4JrmT9OZu5f+MTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943228; c=relaxed/simple;
	bh=6/0ifSyK9A1jLPrUzoCWiVZBxNyv0pTaBibcfd2UN0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hkVnMeBw944RJgLM8QbSF0vP1C+mn88gzKMjekAonpXi8SFwyVu6pByKvLyjsIyAeOk/PbeEr4NzZn+0XN+xaMnaoZyEUGEOb9UxUsJnYME1XQNs4APBGNXln2iFm7r4HHhjSvmD7Mj7U7N/MujhkQLUAPeistbu060mH2yYMlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W3/aJMhI; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W3/aJMhI"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4ba71bf28efso790103137.0;
        Fri, 07 Feb 2025 07:47:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738943225; x=1739548025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q94zQ2y0w1KQlOf/S2AvbwbvutIGIqCEv4xXfHY0lQA=;
        b=W3/aJMhIxcaZi/xKsSmzDeOTkGrU2mK2Wvkz35QH0NANYC0jg69AHJ38iWIIv682g6
         RvXYkJ3Tqswu65I9CYc5CADuSRhzJCbP93E8xBaP0v4XtnHL2MAK0TZUo8nqvgF8b7iS
         GYKQ8v4WePwj7fro0chhWI0/5BHijeU1pcw6lpwRx9gYdaa8V97uEv8S7a8lAMwz79MJ
         2N+e44AubsfT6X2iNFYUqFeb3LqoKiFnpzdmEcZxos9JBypp/NZ52EyIPR5YV69RJuwE
         KOWdb/LdofuyVA368kYSazF2yFjcoEIVrGowP8ctMZJUEOHq+lFLFbz8RptX6V39I3NT
         v3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738943225; x=1739548025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q94zQ2y0w1KQlOf/S2AvbwbvutIGIqCEv4xXfHY0lQA=;
        b=pJ1jBfLVgWq1omGrYuVJKLX/OjCJbD8PRk4GDK6rAPQ4dds68S6X+fSQ4ivpNj/9qu
         1AwK75ieDHAdtIuDn28HhudVyPZp/s4cVe30Y1wvlepEJES2jbKAKNj9nM6ji0Z5ZIsp
         VXiAdlCw/czVoMnZt5yHBEGPgX8qB11BjOMierAPBgFwET+7qm1ssSkZvbCj0VOi+N2z
         OEHOE359kbKIBlTIjrx7AHtFgW5VX7wj3Q44+/lxZLmeBvP6srRWnLBvn/wbFeiSWpgp
         k1u6ikyVHxO2rWBGuIbD+dRnkwZpTJ5mB0gd0A7dVSaKwQZSowX2nnqsogil2FtepuJM
         TPVg==
X-Forwarded-Encrypted: i=1; AJvYcCUyDKUqBaSuoH9anuE8EIm260/D5coem9b6QHKwPIbE4AxpMYxUNJ0kBkPhWrBSxmcoVJIGjoEf9liI+lM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCAfhGawqZoReaiuESbkAbM58bzN2/Nz1SDWAcs6kS0QAEPX1t
	BZNQLit4WYQEEeKTd53QkfhvrR5zYB0mkZVDHixBBlyP47PrDkyqjxrLSg==
X-Gm-Gg: ASbGnctYeAC1NyqjWSjvh4scdxOXn5I6+W2pw3vyCsOI32cw0B7ux8dIyqdUr6821Cs
	GP+4NEVa0iW2cd+4hlMJf3zp4rS/k/ht0Q32TX17PF6GuTRHyySpKYjefkgUVecra3DdZjU6xD8
	y7BZDU9pTDXT8/H4zuf39cApgsy4PG3SZaqRya4pGy99lW1BWmLjc0eHH8fwGeRocrnRNAVn7Qn
	COyqGiUE2Kacf+lzr1Q9fVzuhsuPTMJMBE/1VyTDN1NOyj/qg/l0UOgDTYQKUIVCG8YSpkhs0gM
	WqGX41Z2WKSB7sWBjEERNHM=
X-Google-Smtp-Source: AGHT+IHc0MCHKgRHMdMC4LoF+LZgaujLC0fx0Nu12T79sSLgxWwMj2LmhR2hFaufiDMU9jh+svizyg==
X-Received: by 2002:a05:6102:8082:b0:4b2:9eeb:518f with SMTP id ada2fe7eead31-4ba85e4b3a9mr2809728137.10.1738943225603;
        Fri, 07 Feb 2025 07:47:05 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4ba76cb8e44sm768456137.0.2025.02.07.07.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:47:04 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v10 08/14] MAINTAINERS: Update ALIENWARE WMI DRIVER entry
Date: Fri,  7 Feb 2025 10:46:04 -0500
Message-ID: <20250207154610.13675-9-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207154610.13675-1-kuurtb@gmail.com>
References: <20250207154610.13675-1-kuurtb@gmail.com>
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
index f7550dcced78..3dd440f34c63 100644
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

