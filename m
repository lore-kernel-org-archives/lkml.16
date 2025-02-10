Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966B5222575
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739200238; cv=none; b=XzXdfPKAH65A0h6tVxRv+1ea9T8N/PWkTPGrwzgSbkD94dFvmsmsGu3MJcwtlxbkkOQLjzs2TlAP4BGsnRDQRtG9SDdA2zZijA79q7E6GcyIiL3xQUkyd/ruY6xWbKSB4unxS8gHEDX2s1xAlnScxsXIqKXLG+Zjp+TlCvPMhKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739200238; c=relaxed/simple;
	bh=Ab/EthacSp9k8Iu10wVGwmduPttIkWKvMepO+R0gYYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vEkpnFMdvmwLf/KCZciiy5YO2HmtSTyv/lham3li5AD8AW4HZl+wqjr2rV2O8Yq7+TSlopykJduh4PN/WCT6zaeE7rPN6Aq2caRXeKNuHlYFcYkhfsf8EjsI8Cbma2lFUgdLuZPzlec0bGd4lPg5KGYfBvll+A8Ul8rWBKORTU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EWak/CbG; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EWak/CbG"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so2349217f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739200235; x=1739805035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+ph2F5KhKVvbTUhZm/M47bz0r9DxDu0/tq/FGkmTT8=;
        b=EWak/CbGqH59vDzSirQhIcWEgRsPOJE8h1BBqwTc7+hQaZnSVGm5pgBaAj6FP1ECGW
         AgW64LFrDVaGb8l1D7P2NrcSKQINhHPN7ObDhZJCLOCfZ/hvGo8tFO+lrPcoUZ/HSSIu
         u1ngp/TW4q62xtkX89FkL+2qEgaoBsdpMNnewiPS4JycqCXcB5w7PAK5N8atJzY/CpGW
         FDcgHTTGgWJDQQrBRLiE0jyATHTeVvM854iMFUkVxk8BTWdDu6ewFi8DhiZWzpKR6l3D
         0hLj4jycZW1BGtJohCtgNE6AA9JR4jq7aQNzdSnxCZSAwVZygbM+5vTFvCfHkaDL0xDa
         uXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739200235; x=1739805035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5+ph2F5KhKVvbTUhZm/M47bz0r9DxDu0/tq/FGkmTT8=;
        b=tQaBCRl6GfzygqoTwH7TCNVXwNtoyb8JOBbBNoo+UKbcH+RZS4egFHMaWYwkBM5RTz
         qH+ZSYeD4qic5FvvxVG0L68+uLgytM7es/JJVgPTzhoYgZZahfd3Jib4Z+4SKgz1jCra
         Y1sQnZOV0C8ZoPYYYALHkoN1M7G4XR7TTbc3atsyVe8m9bIlmLYJPiPUqP86PIk7t2XH
         PdNsecmdRLev3eNi/MhcKHxPAuCwvXlq7h4PtxAOzVDfi9uZebft308htgGWwo+FUsGx
         91VE0Onk/hx2MBcIfXntiNIFhSpAQUjxA5o5vo7NfVB8lDB457x62xKel/mWhN6u9gt4
         7zBA==
X-Forwarded-Encrypted: i=1; AJvYcCW/27GCETGSnw4jHQjSpBHfhDYvQlJhU9q74/VcCBk5v2krlA919iZ2pIfuHxgwckMSdZqxlUa5WbzySTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvW4T4uiRh2OIFrjCwCdAkZmV/cN1+SArZbucFE4bBmy47JFit
	lPBI5P51Kb5XyZYqZ0bnsqbNpTn+aGQvjz0CGi5z5kkuIijhUfxa
X-Gm-Gg: ASbGncvEgfrhbEUY0n/7PmZDs30egXxKBiTRjc1o6jWFMCWYGqYLQ1fu19KODAgHQyv
	NO3rT4BREG0kArUUWET3vKJI0DEfu7br2X3se7XQZaQnhAgUz3KmeC4l1GhsQA+qC4LAWAhFHmk
	g0HsibYn4Qi/zNnWAXXRi9VhSZx+FaIq9HhoFpVhtlf2MApH8qZLYGBq8fRHsCoIzTgWN8UQmEb
	PbAj/akjrsqnQ6I3IrTB2rzpkW13ruVwGklrxXaXzf58adekC2cWD3a4yAGT7lkdYeGdR+gub5J
	bMBBdsXZS27CVstr84MIX7uGOhoRLx6dsPD+AqJuyf4FwcaWGps=
X-Google-Smtp-Source: AGHT+IFOFeSWRD97dU8jztQYtBklJWN5K+MWoHjK+bqB4GSWwnq5osOsLeupGK2kvMf5cbfCmVyXIA==
X-Received: by 2002:a05:6000:2a6:b0:38d:dc4d:3473 with SMTP id ffacd0b85a97d-38ddc4d34b0mr5128049f8f.51.1739200234740;
        Mon, 10 Feb 2025 07:10:34 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfc8881sm146834645e9.28.2025.02.10.07.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:10:34 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 2/2] staging:gpib: Remove GPIB_PCMCIA in Makefiles
Date: Mon, 10 Feb 2025 16:10:22 +0100
Message-ID: <20250210151022.4358-3-dpenkler@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210151022.4358-1-dpenkler@gmail.com>
References: <20250210151022.4358-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This symbol is no longer needed since it is being replaced directly
by its Kconfig equivalent CONFIG_GPIB_PCMCIA in the drivers providing
optional support for the PCMCIA bus.

Remove the definition of GPIB_PCMCIA from the Makefiles.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/cb7210/Makefile  | 1 -
 drivers/staging/gpib/ines/Makefile    | 1 -
 drivers/staging/gpib/tnt4882/Makefile | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/staging/gpib/cb7210/Makefile b/drivers/staging/gpib/cb7210/Makefile
index cda0725d6487..d239ae80b415 100644
--- a/drivers/staging/gpib/cb7210/Makefile
+++ b/drivers/staging/gpib/cb7210/Makefile
@@ -1,4 +1,3 @@
-ccflags-$(CONFIG_GPIB_PCMCIA) := -DGPIB_PCMCIA
 obj-$(CONFIG_GPIB_CB7210) += cb7210.o
 
 
diff --git a/drivers/staging/gpib/ines/Makefile b/drivers/staging/gpib/ines/Makefile
index 6b6e480fd811..88241f15ecea 100644
--- a/drivers/staging/gpib/ines/Makefile
+++ b/drivers/staging/gpib/ines/Makefile
@@ -1,4 +1,3 @@
-ccflags-$(CONFIG_GPIB_PCMCIA) := -DGPIB_PCMCIA
 obj-$(CONFIG_GPIB_INES) += ines_gpib.o
 
 
diff --git a/drivers/staging/gpib/tnt4882/Makefile b/drivers/staging/gpib/tnt4882/Makefile
index a3c3fb96d5ed..fa1687ad0d1b 100644
--- a/drivers/staging/gpib/tnt4882/Makefile
+++ b/drivers/staging/gpib/tnt4882/Makefile
@@ -1,4 +1,3 @@
-ccflags-$(CONFIG_GPIB_PCMCIA) := -DGPIB_PCMCIA
 obj-$(CONFIG_GPIB_NI_PCI_ISA) += tnt4882.o
 
 tnt4882-objs := tnt4882_gpib.o mite.o
-- 
2.48.1

