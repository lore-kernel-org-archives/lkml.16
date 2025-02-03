Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4981DD9A6;
	Mon,  3 Feb 2025 06:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738563797; cv=none; b=tDVXTBXdUnk2EjrbBheU3OHlw1sY+IPlKzYbgREutmqpRmFisFHCJQqUv+csp1N4b5gnGvzXp4A0Y6yKk0/ZCGmuQ+gMB4lkrlzOHlPIWUtRkY2yC1q0zI+5Gk7KgW1Eim1Or9iM6gv/IJzlHxxc2hHBZ0o+MzwivOvfF1RFcQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738563797; c=relaxed/simple;
	bh=Woq4swbnYq3xsWIj3EtplDj2WuXqxSueFP8J8UTTZS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hMYYk9xznFxlimrvBGz7Y8FEzjwfCyPkfCtvpdmxUqW5p8qBXE5bHA3e5k4e2D0YWBR18DnIIgWK/5WPeSAw3u1+N9GSiR7UNDjCob6TbKFgcnMQz1giqDECxBL9ZcY7NnnLnp0MjaP63PNCa00Vh5lfWdIBPif/dXALhucyklQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i559oPQP; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i559oPQP"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-51882748165so1250135e0c.3;
        Sun, 02 Feb 2025 22:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738563794; x=1739168594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0Qac2DNxaP3+ckGylXZbGeHgHst/csov0aaJCMEn8w=;
        b=i559oPQPPUQNL5apR3XnizSimSo7HgCeYNVO1XvbCTokbCW/vtmBJ46pGqChbz5D3d
         eYaFXACWHP8M7gYyIsKBdxsrgoumibnvsyWmrKVslLb0vfrV9Rerp7WpiQr2loHUO8MI
         HaBy5+XAUjiN798at2DVnavQPlGlJ8NwHd28weFbAzuDVnC6kFZ4obwjDTE9A01R2j0O
         uHKCuWbPbs68cY1G0e+VhNWv3c5pzcXpnrriY7K42feQqHlcst7D7ijXMWt6GfIM+vjD
         dpO7J/ux9xpiypUjNsVxJCU4KERfAIaQgM1sFPu5jafuK1BIG6obg2OttKo/kEvC3kxX
         yvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738563794; x=1739168594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H0Qac2DNxaP3+ckGylXZbGeHgHst/csov0aaJCMEn8w=;
        b=bZFSTJZw1twHt5eamexkxLw70L4MyDX6wuEWx7fvuJxb4sTCrYScAZ5D9zKOEuHMHr
         tF6aV5Ta2m/wP/wpi6RdeCKvBLqnrWzy7yXqCkYdC6sUN2BFtGm+egcROvp1bjuADvbc
         ksMWPCKsoaJtnRLs974uHYXrFjVfL0Khw/sB885yNRU9iEPMX1JpMzMznMLjtt+zF33X
         UcjkGbjPKmKnWOAjNoVzHeT8NC7g9YQkZc/QXa9GgTnu9I+EtmLMMTZ+N/GK/SDUTq4z
         HjCLfrpsr5e0WHr02rHsBztHL/Qe8X70rPrwqfDBCPf/Yp3bOhbGh1wsFRUh9g4ycfNV
         halQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwHJAiRL0R3CypkfsFUw3V9ITjBRPGF17Cy6wvHdOqAljm4d9vZua9hEDfnbCdQPEU1MoLKTVFaM3f0ok=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBcKwWX+9zQ3brlzjSh//vd8mQOCDVvJCLTfzG3KU3N/6IsBsI
	K0cyZXhE+IQ2G1img8cT/yfW7JO2OjUZ7hRTXg2khiTteWuBX7bDdHr4sQ==
X-Gm-Gg: ASbGnct/mY1nZM4JcqOZGHg/V+4zm/Z2e9bRpdIS1/dxhiEn/vfw8srC3+pJO5cxOcC
	BoNEImLq0t2Lb/Zt3ky12/Fg1pJdcYThNqcE9FnADwIcPtC52jyoBhGYBcgOuyCp46ugVARnDe1
	sMAveKhuOaIn1OCnW2LS+YJfOoYiHMdurRrOZ+TLXX4pQJpXZ6n6qiu4at5h4j48Y+b1h/7Sf7c
	dJfgTsoNyROTzvEGLSK/m7iKtkZfavgOofC+AiT+jzCjxXcFhU5tkLOml+czyO40ZQATU++GRCm
	TkPd2UJcYQrbySRmnGreU0s=
X-Google-Smtp-Source: AGHT+IHKrHTLQK9iQQDWNz2P6RChImI/EQoPH1kAE5B0xYW+X0AB4qmVHkVblfSOAV3dnAuldeTZKw==
X-Received: by 2002:a05:6122:8c01:b0:516:1b30:8797 with SMTP id 71dfb90a1353d-51e9e46654bmr14989922e0c.11.1738563794160;
        Sun, 02 Feb 2025 22:23:14 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51eb1d64c20sm1138789e0c.32.2025.02.02.22.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 22:23:13 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v7 09/14] platform/x86: Rename alienware-wmi.c
Date: Mon,  3 Feb 2025 01:20:50 -0500
Message-ID: <20250203062055.2915-10-kuurtb@gmail.com>
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

Rename alienware-wmi to support upcoming split.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/Makefile                               | 1 +
 .../platform/x86/dell/{alienware-wmi.c => alienware-wmi-base.c}  | 0
 2 files changed, 1 insertion(+)
 rename drivers/platform/x86/dell/{alienware-wmi.c => alienware-wmi-base.c} (100%)

diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/dell/Makefile
index bb3cbd470a46..f8aec8502c2f 100644
--- a/drivers/platform/x86/dell/Makefile
+++ b/drivers/platform/x86/dell/Makefile
@@ -5,6 +5,7 @@
 #
 
 obj-$(CONFIG_ALIENWARE_WMI)		+= alienware-wmi.o
+alienware-wmi-objs			:= alienware-wmi-base.o
 obj-$(CONFIG_DCDBAS)			+= dcdbas.o
 obj-$(CONFIG_DELL_LAPTOP)		+= dell-laptop.o
 obj-$(CONFIG_DELL_RBTN)			+= dell-rbtn.o
diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi-base.c
similarity index 100%
rename from drivers/platform/x86/dell/alienware-wmi.c
rename to drivers/platform/x86/dell/alienware-wmi-base.c
-- 
2.48.1

