Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3E028A1D3
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 07:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751874454; cv=none; b=P+p0jhcn8jv7TsowniVxsdH03nnvZQ9+yGGudtTpkDa67HPn4qGc0H+oPONHbbCrpMa6brpW5IxgTziHCUZrX4rZikJ5uSNGCzXSIhn1Pfn0GW+sH/xQjUfEr0xmS3yk5fwvyCLkgc7iwxSz3rY+nMnN5pV6k2GQaUfKP4fXqsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751874454; c=relaxed/simple;
	bh=gWcGlYBG9VdQBpWm6p9J7+lhSUYrFxwqeKyCXRoz8Fo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G/GOnW25w4n9YyQXgX8OaZokn7wLmdk3ik1/vbnNK49jM7oP/DJGi1j/IYfelPym+AWbWsJ+sKKOx+QhhXlcHJZYAejd98IqF3d0bliTcm5Ak29/CDWeBnJMpP1xkrY71IdP/T+BL8gdzO6ChjEhN50foa0QfF9uvj2Cs8tzYg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45348bff79fso30073725e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 00:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874451; x=1752479251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FEY2aQm3xhUcP7sj5Oq2Xh6CDlgTY4o4n58HV3+BEDA=;
        b=Zr/wSFb/BDmQbQvYwVR9ahF64itgph7QqORdpt1Wjc25B9Ez4B/bTc7xRWAFcSZv0A
         JRQgfOpIsWHgyhud0NFzgcJHSwyT7eDKze1W1xqpG0020RhynWlTsHj6tdH1IqNGYdoO
         lgLSmZEsT1/mt/vTI6ioLHnteNp+kkgCjr1o1cGzH7RB2x+4FiiTuXeScL+TsxgFAuJ5
         a4tXcbMovI63I+zILbJSNr/b0vHjVF72CT/2YsViJ/Be9KKencZUZGB5QdszDrjLwt3I
         wxrAA7qUoiEriDcHEBpv307PKh634IOkPMzTgVUdQqggwcFp1f62c7iPPXtL7I66NVjM
         MJqg==
X-Gm-Message-State: AOJu0YwObTr/VWXD3aBQojfBc1ko90w6SG3mpqo6tpTQzOO6GxErMP9V
	xoxAoLBaLjjgKbnc/9tar8H/ZmZ4mwXRBUhKnCKH6D8odOQnOysXUF5ixWik3w==
X-Gm-Gg: ASbGncuMo/jPbN/HMAHzITdQlEE6XYEohcjnyrJlEoJL++lPWVw1i4eyz8wUrE9zThR
	GhnjumCPBWfEgAFyVNQzN1yspeWZDB0Q4XlNERfY7kVBOxjUlMnrxy13qogFXdKi4aX6X9OOim/
	ZvUbD/VzLTaqBgTNZozkL3OG8i9Mhrfmh76/NBw0vg+eBJilYONai5N8KQvqKD92OO/GQctU6rE
	TQtdeRLnB8vqycDsoGCcxUj9y1mljujr2lhWaeAVU9xGjENxc9MX805zVxeaBHxASRgcWOz3CVN
	EJf7EchL0emJUp8kJPO4T1NkwMSGMKtbVubD2XMzkZJ4MxUNpfn6T9JGc2HKzZOq6CPtaYA4GRM
	X9ycIl/OzvvCOV4BtY3Ysp6Sw1hrkq2e3D+zWAVgPOesoaxOkLA==
X-Google-Smtp-Source: AGHT+IGQ2p0zyDFvUFfCc3BgCvaQgicnavFr0NvZLrUvFDtieMDoUV34wD0aEvzmFpPILe534mnd/A==
X-Received: by 2002:a05:600c:3b8d:b0:454:ad94:4b3d with SMTP id 5b1f17b1804b1-454c8221e2fmr7443515e9.1.1751874450628;
        Mon, 07 Jul 2025 00:47:30 -0700 (PDT)
Received: from mayhem.fritz.box (p200300f6f71c45003fa4d1e815666221.dip0.t-ipconnect.de. [2003:f6:f71c:4500:3fa4:d1e8:1566:6221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0ed9sm9499960f8f.38.2025.07.07.00.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:47:29 -0700 (PDT)
From: Johannes Thumshirn <jth@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	Abhinav Ananthu <abhinav.ogl@gmail.com>,
	Johannes Thumshirn <jth@kernel.org>
Subject: [PATCH 1/1] mcb: use sysfs_emit_at() instead of scnprintf() in show functions
Date: Mon,  7 Jul 2025 09:47:20 +0200
Message-ID: <20250707074720.40051-2-jth@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250707074720.40051-1-jth@kernel.org>
References: <20250707074720.40051-1-jth@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Abhinav Ananthu <abhinav.ogl@gmail.com>

This change improves clarity and ensures proper bounds checking in
line with the preferred sysfs_emit() API usage for sysfs 'show'
functions. The PAGE_SIZE check is now handled internally by the helper.

No functional change intended.

Signed-off-by: Abhinav Ananthu <abhinav.ogl@gmail.com>
Signed-off-by: Johannes Thumshirn <jth@kernel.org>
---
 drivers/mcb/mcb-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mcb/mcb-core.c b/drivers/mcb/mcb-core.c
index 9b8c40a6459a..c1367223e71a 100644
--- a/drivers/mcb/mcb-core.c
+++ b/drivers/mcb/mcb-core.c
@@ -107,7 +107,7 @@ static ssize_t revision_show(struct device *dev, struct device_attribute *attr,
 {
 	struct mcb_bus *bus = to_mcb_bus(dev);
 
-	return scnprintf(buf, PAGE_SIZE, "%d\n", bus->revision);
+	return sysfs_emit(buf, "%d\n", bus->revision);
 }
 static DEVICE_ATTR_RO(revision);
 
@@ -116,7 +116,7 @@ static ssize_t model_show(struct device *dev, struct device_attribute *attr,
 {
 	struct mcb_bus *bus = to_mcb_bus(dev);
 
-	return scnprintf(buf, PAGE_SIZE, "%c\n", bus->model);
+	return sysfs_emit(buf, "%c\n", bus->model);
 }
 static DEVICE_ATTR_RO(model);
 
@@ -125,7 +125,7 @@ static ssize_t minor_show(struct device *dev, struct device_attribute *attr,
 {
 	struct mcb_bus *bus = to_mcb_bus(dev);
 
-	return scnprintf(buf, PAGE_SIZE, "%d\n", bus->minor);
+	return sysfs_emit(buf, "%d\n", bus->minor);
 }
 static DEVICE_ATTR_RO(minor);
 
@@ -134,7 +134,7 @@ static ssize_t name_show(struct device *dev, struct device_attribute *attr,
 {
 	struct mcb_bus *bus = to_mcb_bus(dev);
 
-	return scnprintf(buf, PAGE_SIZE, "%s\n", bus->name);
+	return sysfs_emit(buf, "%s\n", bus->name);
 }
 static DEVICE_ATTR_RO(name);
 
-- 
2.50.0

