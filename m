Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C352628D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 13:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744897532; cv=none; b=ASKITt0wXVdLJnM3mkRXfxi+LrYINgwfjUmSZdldDk3JeA8TyXAhm53vbQ/zBhvAsIotvizaj9nRtNqXbECltqfO7qZjtrLGfGeJOHvPHwBxL5wo1Tojt0DzN6WB6pIXG4PlISB8Cf6R1yWm6/caZpMiSETS7YvOIvEBp6Uvl8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744897532; c=relaxed/simple;
	bh=64iGb0V5xGrlPmvhpWeIrwqVhtaTSQgt0BrhNU+Lh0k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=B+l2tBeyo1BizK5iGa2qxwI8M7m1oj2Ry2iFw1DtLZVjmv785VjU/L38KpN0uDAGBWnWc42uAjESxoKBjSNf3kEsEa+hyFcguJeeWqprsk7brBiysds2urMRq9M8fd1z+onXwujyJBHbqDJNdbZMaEiqI82DYgxKuT4MrbTCe6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXH/B9Sr; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXH/B9Sr"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so93290666b.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 06:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744897529; x=1745502329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gMRK/C6IRR/MfRx3XDCIMsJeEmZ8Nwb4lwT+UFro0Zc=;
        b=BXH/B9SrOUpar4WRLZ795miLXCPQN+ziLqfh35ZVpT31bgniNV4F5IjzWt71QYBSX3
         36oVlIMO2UEoZfBbqrWdIZ7jFKNPGMbOZhwbx2hkdSPY5YUIAMBAFys+X5QMSIkgHBcn
         vTbgw0maC68eBwAPTbuRVO7EUZTM/Z1cHknBSaeXkuJq7ROeYPsoArHO7mWhXJb144Gr
         G1sElzjHJfVMv+zYqKWJf1J4v5plpbGtUGh1CIblrRiklAl42IM5xvEAX9a1qGrSY7/8
         YEp7HMK2xHp0peq7+qiWFVU3DOHliSSdpx2J6rMb7lvSj0IXUKWVgp3Jt59EI/LDpdK9
         tHlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744897529; x=1745502329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMRK/C6IRR/MfRx3XDCIMsJeEmZ8Nwb4lwT+UFro0Zc=;
        b=il0l46HQIr3wPg3u27igfj+NO+nudSMiHboltNyaUD2PUJhFnGT5hkpoNDqwDlMIAY
         IC6Qa4gfQ+9Q7Q0mFRdttvyCrkFE7PwanqVU9JcZHnS9KtNHJRkzNB4WqWtysqujeZ38
         0FduE6kESLh0aB9KMQNfH7LbWMGrvr04tsrNoJP/b2lMks9s6f/V9rIzHqR8YBe3RfTq
         vBpc/YqxZ0uYxtRixsSKn6XqyS2vfGdE1Ahpv/5XEimgInYIKhnwsSe9ggWmX/87gEiB
         9Lqx+35QXaTsB5JpJLvcMo9pEo+TYwss+60Ycxo5zx+x0DRXqUv5sBk5QB/rLzETabUB
         ULkg==
X-Gm-Message-State: AOJu0Yy5NgLd6S2IrM6lr66MkQk6lFHxBNTTJYDujCo4UcHO8myXmWUa
	PnWDS43+gBpmaJF2XoHgHJZsmhqKD2uYSjX8IeEHXV1j8Kgez7ugjDE50reArco=
X-Gm-Gg: ASbGncv/YoE2hB96a1Q+IDtEdhBjtSj9g4ahiScOCW6h1lUhZufMOE7YviFRKdwrHYs
	09vM34BTeJj3hJPgiWyjLa3X0hwX4TYKtNlLFBAp87FCcqgnTNiXeVxgbVGm8fMfS+Uy1jGkeb2
	kvqov2Il5H2bmV21qRlq6o0KoKjSRqeP+r98HVbwo38KpO2uHiqYvYB34c/0P6rTri3sNxzAv+1
	mJzO4JnjQ13CJ3berIuFCSnEkE8idOtK88sFNnmbDwt8hp/lu4xheaUhW9q3mhTD9EGeedLuIms
	IhcBGPKaKdA/93cHyhSL/bybyMjIu0GMYQAmdHXF+a0wGjqcR/ZJcQq2nE3AGIMlATFHWDg9+oB
	eXMP1ILmAyA8G5rggselauQI6R2BDf2AKFOJdJVlTyGmOBCs68M/8vSUxe42IUT/fXnXzCNScjE
	cXl4XMJpAZvGmMtw==
X-Google-Smtp-Source: AGHT+IH09w642gc9QbfgAfKM9kn1FTfl1tEZzN76Cs6wYYe1JvaXTXPTA/PUaDDGAswtCwxs+H/DoA==
X-Received: by 2002:a17:906:f594:b0:aca:d4d0:a735 with SMTP id a640c23a62f3a-acb42ad330dmr546069366b.43.1744897528793;
        Thu, 17 Apr 2025 06:45:28 -0700 (PDT)
Received: from localhost.localdomain (2001-1c05-0098-bd00-b57a-3d8d-696c-b3ac.cable.dynamic.v6.ziggo.nl. [2001:1c05:98:bd00:b57a:3d8d:696c:b3ac])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb5f3006a3sm103730466b.151.2025.04.17.06.45.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Apr 2025 06:45:28 -0700 (PDT)
From: batumete1011@gmail.com
To: linux-kernel@vger.kernel.org
Cc: CheeseSpace <167085599+CheeseSpace@users.noreply.github.com>
Subject: [PATCH] Signed-off-by: CheeseSpace <167085599+CheeseSpace@users.noreply.github.com>
Date: Thu, 17 Apr 2025 15:44:30 +0200
Message-Id: <20250417134430.16580-1-batumete1011@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: CheeseSpace <167085599+CheeseSpace@users.noreply.github.com>

removed unnecessary quotes in readme fille
---
 README | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/README b/README
index fd903645e6de..beff112b72eb 100644
--- a/README
+++ b/README
@@ -5,8 +5,8 @@ There are several guides for kernel developers and users. These guides can
 be rendered in a number of formats, like HTML and PDF. Please read
 Documentation/admin-guide/README.rst first.
 
-In order to build the documentation, use ``make htmldocs`` or
-``make pdfdocs``.  The formatted documentation can also be read online at:
+In order to build the documentation, use make htmldocs or make pdfdocs.
+The formatted documentation can also be read online at:
 
     https://www.kernel.org/doc/html/latest/
 
-- 
2.39.5 (Apple Git-154)

