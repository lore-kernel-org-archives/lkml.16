Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CDE242D8E;
	Thu, 19 Jun 2025 05:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750312690; cv=none; b=NjwVGKyQFYEXB1090yg90cqie+Y/0o3vC5z/siAMHyBs/TB9JoyvrwBLVIWDf0ZBXH9GUZrY0NC0EXJdVtfYmMfcbPUGGrmsEFiY/drbZVpudy/7aBs9gioR221agigCb0bdvHWMCCLtQrVBykiLLITxYwJ2RhP9+g3tybd+eWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750312690; c=relaxed/simple;
	bh=UPM/iUMRZV02JBzFSJZaNVgOriCBzjVhqgGwDNTwmuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t1q8IUvEv65PbTZpfEJuxLjzP737iU+6a+yE99d3hiUn6qplRuNEqnO8WB8UFEUPsp5b58J6OVesh9IA6lBJBh6UnyCfm5B8ZkKiRFr1bGgDGYOtyIpyJC0RY7PhHifTwbWOhWMS2uT69zjrafqxDWMmSizTHAxFngVDvaMLFDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tlxp+2tl; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tlxp+2tl"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4a6f3f88613so3466401cf.1;
        Wed, 18 Jun 2025 22:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750312688; x=1750917488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6ieeSo4vRKELhw8/rOXktM5LV24RcohaY2mZD0DT+A=;
        b=Tlxp+2tlcu4fKgRV2Bvd4AFMANmeOYrkStP/ajqSTquahTcfmtkLPzzxAHbwAao/Ey
         lIJJqye2GjnExvA6Ta3XcXndNKWp62s6lfafpAwSxJsgewtRqtsj1tUQEIULwU1so8mQ
         3/4dDB6XynU+DQRQrLaAKGCGUEr1F27Q9Feh0mpdv3z4EPYeZsvYwBqPcOoGF0yugNz0
         qVUwDYkWh/pd8yyVxAktbFryUhYCe9BFw/6AGSKUOF+Xvkm/HSE3EF6N/NRARPq4j9KU
         B1ylyj1wIzPXwMQcdSoQvwTzD+IXzqF0UacymdbOmfjMAb3JApaQCEkAU/u7ZVnqYkel
         Ilqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750312688; x=1750917488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E6ieeSo4vRKELhw8/rOXktM5LV24RcohaY2mZD0DT+A=;
        b=ST8XjInVxl3ZrA1UF8oA95necjbsxmiV8dDyzI4O37k/fcIo/jgBagCoHi2rwrx4VQ
         WAU6UVr8ehnSbKXY/Z7P2z+EQEdt0OJpc34bxX/9BWYG6UAQ1WZ2qlCbpJgdKo/LfspD
         vmfFWpMe1yORrak/9d2+vAsg4M6g03Dj9S0vUQOZ1hMrsWVT9tvrUEJl1BFNxYnzQSSd
         g7HfjdRapoagJJUBUV2+5D4vyD+MtQxvswrmqKK6wANMd4sRQPNnZaWtHGQRqz6niU3l
         9bhSrvKPhi/tc75lM7P36lRFZt9xY2Io9HxbyHxxv3SGzESAzr00FVXDIC8jmGZI7ohB
         GNww==
X-Forwarded-Encrypted: i=1; AJvYcCUqBZOMaIU6F1KLFbGgjiDyisySFo0TLkOKYVexM9ZQmEhUbtlDBHvRiscy0k+6scojGTwWn4PlORwq+Qs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzog1ZJeIs2URnod1BNjqaHa5Q8+0B0Hclp8bX6j6z1BG35f56s
	/yYqoS7/qIl3d2fEpAMd+SDmOR2Uv55S9HBD93VULyQ29oXQEHtYFJnG
X-Gm-Gg: ASbGnctpkCXDG0HE/bzbPcuQ7js017Gu5yAsmGP9OTlqro1ImNkNO5ZLKz+gef5ZyW6
	QhhNxaLyKXgwGDQVGeAep7cZNGLtx+RrwB6pKoTxEEHgJCYCsaawacIm6RCFni9+pkUIWPNb7Cm
	CDqD6hkU0qPQOYb6Enj26a920ygiX+udExXcB+iTcUq8Z7s0PV9TNuYkiTW0m+TkyAacI6NWwdG
	S+dmZo6nV7II1iqUIjEXpJ+mH96fz0I3SnMjKoZzarEyEOGpG4MhjfhnCVXmewhO5MyvASZ105o
	xsLhZM3j7r2MaRV9D9IOfMpP4kyhpJLYqCkLEs286/+/d5PSwOOAUENrZ360QkNj2yh5hyzFokG
	8vrFHI8zdrz0GbOTaWV33W8pw8KWTcKXszu7XrhN1oAaaMcbFjWqd6p695Q==
X-Google-Smtp-Source: AGHT+IEcgaKg2OtQgkTumlR6bZwenvChQUzb8wcskNs+GOrGozd81FZRDCNpNjG99v/XM9+ZEvANAA==
X-Received: by 2002:a05:622a:118f:b0:4a4:3449:2b82 with SMTP id d75a77b69052e-4a73c55b6a5mr377120781cf.13.1750312688133;
        Wed, 18 Jun 2025 22:58:08 -0700 (PDT)
Received: from seungjin-HP-ENVY-Desktop-TE02-0xxx.dartmouth.edu ([129.170.197.81])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a2e750bsm79171421cf.17.2025.06.18.22.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 22:58:06 -0700 (PDT)
From: Seungjin Bae <eeodqql09@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Seungjin Bae <eeodqql09@gmail.com>
Subject: [PATCH v4] usb: host: xhci-plat: fix incorrect type for of_match variable in xhci_plat_probe()
Date: Thu, 19 Jun 2025 01:57:47 -0400
Message-ID: <20250619055746.176112-2-eeodqql09@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2025061950-frown-cesarean-a1e3@gregkh>
References: <2025061950-frown-cesarean-a1e3@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable `of_match` was incorrectly declared as a `bool`.
It is assigned the return value of of_match_device(), which is a pointer of
type `const struct of_device_id *`.

Fixes: 16b7e0cccb243 ("USB: xhci-plat: fix legacy PHY double init")
Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
---
 v3 -> v4: Corrected a typo in the changelog
 v2 -> v3: Added version of patch and used real name
 v1 -> v2: Updated Fixes tag and corrected Signed-off-by line
 
 drivers/usb/host/xhci-plat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 6dab142e7278..49eb874b1d81 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -152,7 +152,7 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 	int			ret;
 	int			irq;
 	struct xhci_plat_priv	*priv = NULL;
-	bool			of_match;
+	const struct of_device_id *of_match;
 
 	if (usb_disabled())
 		return -ENODEV;
-- 
2.43.0

