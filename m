Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9329422489B;
	Fri,  7 Feb 2025 14:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738937303; cv=none; b=Sz2xNFsIUZYounFjGRVrZJXfGvnZNOhzsvD71Gr2+ha30XD2pF71OORPX64IqqIKCd2vHYrX7b7z+TNi3+tiBTeBPIfKR2GzuG6IVHZHpKvI+ZUqIW8QD86Oo2Hs/zyOG92mxTujYwOmDWkyiC1V303oz3JNxAAuDEddDYfln+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738937303; c=relaxed/simple;
	bh=6/0ifSyK9A1jLPrUzoCWiVZBxNyv0pTaBibcfd2UN0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GKG1cKi/mgc+KkD5lqK+c2br25/g6oAKBZ3UwezT9O16FqcotXAtB/ax4fs0JvITlFdKcctlE097vLL74lqI3ER3+N54KjavekRBc6+wCt3SWFX3LrWMpAXraVw/joj6xXjZelPaBoJi+pDLty2muh8UDXJ1IfRXq7ALMM6OdQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WRUsbz7I; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRUsbz7I"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6f7031ea11cso20761857b3.2;
        Fri, 07 Feb 2025 06:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738937300; x=1739542100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q94zQ2y0w1KQlOf/S2AvbwbvutIGIqCEv4xXfHY0lQA=;
        b=WRUsbz7IlZLHtMTQ7LGDPymAo3HT1zjkDMcSF9Hr4T4cNi/1OUkFrp45/yxI15hjuH
         57jw/oGZjiRRfX/IX3pxwgUr68GQoGwlsYxCV5P/LTdTeTWgeft53HnKiY1wgCb6VcJo
         73jlQwYGJ9Iz48yiF21QnjDjeQPkd5Fp55k+ASphcddSUfdmO+ZQg0AXypDoWnorGo+3
         Lb0eWzn9DgWuUv1yIGN/HP6eBzdpyTG6D+jEwPIBbROv3A3FBAV2FwlXU57ToFbLkh+t
         e4hZP5rQMKJ+4bPdfpU7rUj7b5plbR/vSnxl0Qo2lt/yr0mIWyWSbaPhyfasKZ0s9JGj
         iSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738937300; x=1739542100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q94zQ2y0w1KQlOf/S2AvbwbvutIGIqCEv4xXfHY0lQA=;
        b=sQ9Duwv2Q5ko8m6KGB80X/uvcr6UnAgEbZ5ZsCHAS2Y685VNVf2j9TCLv0nHPKxHU+
         3Bt+PO+GZ/4sikZ1nLPMbCXb+Is+82Mr68kWF0ETMzwhdPGeYcfDH3KHBOCA3BMPSVr7
         bse6k1LNxHU4d+OKMKgYJnxax5tXVfijOnBK7HC78AzwtPwyh7Ph0+PpSXOxRodSEx49
         0quSregTRX+vJjTuSE4lva5eLP0AKfxj+fCopIhw9jXungvZ+jbY45qvbfI5t/TJwUYm
         x6PWPK9elvmerQYIzlQRD2cIOi7PbhDkInI2VZ6V3SUhlCSlyyo+gq1fY2RGVx2L/k+I
         JF6A==
X-Forwarded-Encrypted: i=1; AJvYcCVf0xReNde7EXim+9DPNg6ED/f6RqLOcwlpzkMpDg/1Oxi11zFuyb7US8ah/2iJNJydpvLZfWyeaPJxVtc=@vger.kernel.org
X-Gm-Message-State: AOJu0YytGnHrmOcWIWL2PyDLC7GWsn0tAEQ7RvljVxAJjjz0qhD5R4iZ
	0v1Xz/UvuHDeSdKx6iPTXsqRecvAutfJsAqYlw+YpLdhmtcouPGJUeCk3g==
X-Gm-Gg: ASbGncvcHYzlN6sm5cNr3OH12xVja9P636V+rsKQWXeg7OlO78BjwVegtJOUqSGgHmE
	3R8jsqWmJ2P6Tjo5CA69eUorQHzQpp24x9BhLiR4Z8T+BJt0tVYsnfF9iaJEA1I4t7o4Fkf8Haw
	h6Ffyci6euuo68sk3DluiJVP0boB1B4C40iOnTEmZ+6tlYQTC3znRH4mKoJ2Va3T1ohlhC+UeRV
	ebY0/TovjLXonFggA4eeIL0ZOZ+CzWfz8BUqS/A2inx6++jN/HK2/a3Kzg3A2vwFY5VTlzhxlYK
	4Ga0vYNimKxBCEQGo6vYX3I=
X-Google-Smtp-Source: AGHT+IGdaTQ4xX+n+jt3sjR/yqwrt6anwNGc48AHbejYlW2rJRVbI50bpriFOsjfXIZB7veWu7Yyag==
X-Received: by 2002:a05:690c:3812:b0:6f4:8207:c68d with SMTP id 00721157ae682-6f9b2845562mr27876307b3.3.1738937300338;
        Fri, 07 Feb 2025 06:08:20 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f9a000f577sm5525607b3.118.2025.02.07.06.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 06:08:20 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v9 08/14] MAINTAINERS: Update ALIENWARE WMI DRIVER entry
Date: Fri,  7 Feb 2025 09:07:37 -0500
Message-ID: <20250207140743.16822-9-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207140743.16822-1-kuurtb@gmail.com>
References: <20250207140743.16822-1-kuurtb@gmail.com>
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

