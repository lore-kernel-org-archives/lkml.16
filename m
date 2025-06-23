Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701FA1E2852
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 06:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750661101; cv=none; b=XpC9pb7NkawpG+JbXODkLl5sc8Ec3w2QUINIkCDQYmB/MBpOQIiHbp9aNlrWGx4RSUghTUGjshcyD25B+pJlSAyDjv0zuLJlRaDYPDL4RcLlDYFoiy7mPSdV7Kn5I6dL3K3oZtI25Cf1mPV8pGkqtzfsnSY4FznLNueS8V5bJWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750661101; c=relaxed/simple;
	bh=D5wB8GTFVDuCJiFhGrONiRmhnC4J1aRZ8kfkMi+2S7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IN3YrLR2eMz1VYLr8WCi7FoQUr5++OFMnrTr1Bq90Zf86CuzaoNGnfrrDn3GNd+jKCME8cTj67FccAYfnwUurh/ZBiYwgJB9C68P3bCIRVICfGjCDORfhhpLAm1EI1CJnC5ow/MxiFofTOdg8I1PhRBcHDNu90exz36zkVoyZVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=c/w3szZ8; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="c/w3szZ8"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ae04d3d63e6so480112066b.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 23:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750661098; x=1751265898; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vbu48gx7NEhId69+qzMyPOiXCZJK31FbL3aO14F5yf4=;
        b=c/w3szZ85ohMGqFSsB9gaUZl9R9aJ9UCT9FESYf62/xJm0K0LI4gWQCsZFw4J7tXSC
         IdVgyxIsf4jtHrqnZgsRh3Rals+o8eJuzZcxB3H4jb3+6YLKsPV0HGwy2UBm+rjpEHSQ
         Hp3jkP/PsKYs9G/MhU+J200fIP7XP2ylUr27dgZ3jW8ZOPmh1f1Lb+q8Z5ZefKdcpwkU
         B8Pzrx2DU3iTHhvesHUgvAca0+eTdBiXW7AeA+h84tjz8uAc7Kt//lIFXHqJSAoO8UNV
         c8DzL8/sLbkx4QqIMzNDEeyfgjHU/Vj8PLrU0LtdxgyiGG3xKo5XaY4CRGbKWKsQUduZ
         h/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750661098; x=1751265898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vbu48gx7NEhId69+qzMyPOiXCZJK31FbL3aO14F5yf4=;
        b=SlCfRgBWCXuyoDBdodIMwGtPfd5udz8iUxMwPoJYQRfGq6UX1E7mxAJRPeSQLx52DW
         vEsZw8qESpNznDMqc5QWhLwSYmvwJUQbdMJGsnpBoD4ng9XBR8bxtGYR3Fr4Sk5s/u85
         FbUQdio7GCu0Q55dBqFkFQkUEnj0ct73g4JPtNJGZjLfp+9fkxKFJfF+ehGOaHuyvUq2
         2qElkoi2MfR7vCB9OtiJt0Z0U/5uX7nJKJhC60I0LniYqSLHL6r/HOhRi7YZAXiCm6Py
         bk1Wk37o3pYnqavQPokQPu9ZC5G4D3xNtX+hycwq/+Wj3MNrGZRmOPSiCft5Qgxg1pHI
         A7Lw==
X-Forwarded-Encrypted: i=1; AJvYcCWLqMX/BkQ0djtm//kSRonadup8B61oWcJI0SndOZK8oUAXs8PDV8paoIBOAimwwLVeiTLNhXR6T76xeGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRJgBCEZykGWgGmzoMEGxjY06HDWScr7t7nSDSm0DrNI7C6G/x
	NMwBbG2kORCdEzq4Nz64Kq1gaPNWSDI8E9s2en5swN16fpVstD/f1CJwHjaLFgMeFxw=
X-Gm-Gg: ASbGnctHgg7oQmZ97s7/zRMzTjC3QEd6YkI+Q9mdUodnBW7PoVZtGWytu7eUysClrii
	mTmOTSeVAIRZ12K5lqnL+goH4wQeAQz9RD/pSJFv7NJ74TfhVmDqeiceByQBHAwfADkemIM1uVj
	COEBqT2m+pn/3LLfOdVJl95X40pL/X+oZd+GbzX0Va808qv9GqtLCSD/RYmSShQmoKT2GADvIvU
	QJAp8vV8UKDnbvXx6B3Vj/AnWL0o2vu4xs+HpJJBVc9pVJcm6pCwpsn6QZsnNXO/ughdZDZxVWq
	gHgL9ieU/rayByEHYyCcdHXG+pnxqV9xx8q8KGaTKwhcuuis0RnnaAU47y0/dT/1eb4blH+ZjHq
	ELxxiE3E6RvDQUw1AKYkg1l+6qUAG8E5y
X-Google-Smtp-Source: AGHT+IEOzTOG7c7R00rqnL+INk5sjS4mj52ZR4xU1BeF+DiFIb5jKd4us01mqAW9xyhdkYM3Dd47pg==
X-Received: by 2002:a17:907:fd87:b0:ae0:6283:5d58 with SMTP id a640c23a62f3a-ae062835e1emr846280766b.1.1750661097735;
        Sun, 22 Jun 2025 23:44:57 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ee4ce9sm659258266b.69.2025.06.22.23.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 23:44:57 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 23 Jun 2025 08:44:46 +0200
Subject: [PATCH v2 2/5] drm/sysfb: simpledrm: Sort headers correctly
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-simple-drm-fb-icc-v2-2-f69b86cd3d7d@fairphone.com>
References: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
In-Reply-To: <20250623-simple-drm-fb-icc-v2-0-f69b86cd3d7d@fairphone.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750661095; l=812;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=D5wB8GTFVDuCJiFhGrONiRmhnC4J1aRZ8kfkMi+2S7c=;
 b=NmoLdHl/zy8/Ccu5xTGjwDXOdaQQcr3O/5YtL18RtixZv928CEKzL1gkps+b4W6pfu7E3uThf
 DcKk9lC2NhrC1nEiqi8avoRWgJ/zlM71+o1oVF8JKPfU6UAHI/If7RX
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Make sure the headers are sorted alphabetically to ensure consistent
code.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/gpu/drm/sysfb/simpledrm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
index a1c3119330deffc9e122b83941f3697e5b87f277..349219330314e3421a6bb26ad5cf39a679a5cb7a 100644
--- a/drivers/gpu/drm/sysfb/simpledrm.c
+++ b/drivers/gpu/drm/sysfb/simpledrm.c
@@ -2,9 +2,9 @@
 
 #include <linux/aperture.h>
 #include <linux/clk.h>
-#include <linux/of_clk.h>
 #include <linux/minmax.h>
 #include <linux/of_address.h>
+#include <linux/of_clk.h>
 #include <linux/platform_data/simplefb.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>

-- 
2.50.0

