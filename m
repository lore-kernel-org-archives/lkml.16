Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A62221883F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750295097; cv=none; b=V2bZ+xTVcLa94rVjvKRwNS8+cEmihSs+7Qwrsy3wGdgQORvONtJx6uGznJy6yonBrnWOYeNjt8mWCbuGOmwMo4sKfzI4fXiXQIgWXezOiJWxgWcS6hYSgjjUdZMMz/U5AqlvuaZeIvQWq/gOJtpU6XBcu6HSQSlCNpupM+C5xp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750295097; c=relaxed/simple;
	bh=A+kgl3pP41bBhorqPw1acgSIN74xjFREHN1mNj1smKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lze/7S17z8j4r0P1GFYNmtChMmHj7IbByRFovJnhmYg+SlW7ZlF5w3lXpD8Xt/Q3Svb+DwZCZ7XvLo05TxkfajDKvIazqqfFcWVfZPOqZmqTZCCS6jEEp3ujLehv89BFoAKfeORy5wkS1UFlkX4f4eBB/SwCkFEQN3yZPliNmZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BOqvdyht; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BOqvdyht"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2360ff7ac1bso1921235ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 18:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750295095; x=1750899895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sL9evNGVpzgjwGis6FRx6Ny95Jmdu1Zd+5bgNtHIJLs=;
        b=BOqvdyhtob3BUZvxB9gwEgNIPCT48gWbJoumTErp36Ik9X3VULJROAMw4gBfhxp94c
         vE/nKR+N7tVTJ+ysc6/Mr3ddGutJLBPqABLulBDp+KzlERZKrdo0Hb/xrVf/JpXUH+HE
         iQZd7k5ucQuTRbzKQRe2FZT4jy58Itig8723OTIb0paOe1bZ42Vc0MR5Qxv7SE10Yttn
         lM8ejBQ8mM9gKr98v9zn8jgblKSm48+cyg/ofFzoPepCtmtJbBp2YkV7g9ta/hxroUwr
         T2KMBF6vVbeQFYdYgSUHYodZq1nbwJYc95AgMz6ssBaoAfTul6QwvTP7ED8w5hryBZST
         2UiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750295095; x=1750899895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sL9evNGVpzgjwGis6FRx6Ny95Jmdu1Zd+5bgNtHIJLs=;
        b=U0gsJvQoghcPQVQ7g3ZjVooC5UVY4/qkrDUsA6pfPcPhlExqqOHacyq2y8N5lZEwJB
         YoWEr3cO2eS3GS2S5EqjDvfVRR3irh6dGShCtTIj9J0PnUJ7QkaSWkEUzp0foBAgPVtY
         Ggjh075K8e4m2mLyZGSExuKpbAOpuAed5IhedHSjfZ0aEmWrdHN59YWXzixHIvxaEJsO
         e6j3b1rImSYXzcTRUDILiQf1EUnu8X4L3omcqgJLncasSt3WkYxPnTFD875Xng96+9g+
         23zWR91eXtz44fhZIk06oQPRDASIX47P4vn/u8EY7L9ViQvXh0VJTrpldJPHOja+vXMD
         m3LA==
X-Forwarded-Encrypted: i=1; AJvYcCVYEfVADC8Xd0jo18fQNK7iYH/Y7S6HyJLyyfjrn/fCCTwMseKFGakA/fsbE5VMbXz6ud4f0MIMonUJxY4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxqgPIkT/v5iRUwOxSMpeUmQLpnNogtZCXp8JH9ogdyaGJwx4z
	vkGlXOvXJpbQ8e7KTDXSFo3Y4be5PCh3T0XP3D4KS+RGgMjnBXhREd6m
X-Gm-Gg: ASbGnct26i6R3Op6g3GWh1abeYOFrJCK6m+vEmslgBlKk33GkLOIAq439SKgE6hC1Tw
	PdBpCoNIshw2E38VYQDLCbLhEqsOMwF+o53Yjb6u4QnQlG/VxTE1T7j1CW9O5guzptKyOLGkd91
	beJECl+md4rr8pgQOlS4GLYmEt1ca56o61srAEhXGysB6NhLv8zqRofa0TXq3sARetJuf3WJcun
	PeUu8X2O99YVUgSYgD7qoGLmiZ0oloYmeCGGoJJ9EphBjupHHiZIBkBmlzu8D/y6sPktNaV4f5m
	P8M2Mf/iaD06rAe4wQy+ap8cIrxEPIOlXMfpi7GQBcqu3etoii7Q8qtVH3wUlQ5CQ8cYvLCJTNk
	7KalB+32PJRUlZzjhlOldymhYgofr4OkS
X-Google-Smtp-Source: AGHT+IFO1wmuMVt89YrBHlfn8kGYjqnEwLyl+KVA4zvbu8jubm0FHxst9cUWZDZj06afHE//hnBCAw==
X-Received: by 2002:a17:902:dacf:b0:235:e76c:4353 with SMTP id d9443c01a7336-2366b16e8edmr259851315ad.51.1750295095410;
        Wed, 18 Jun 2025 18:04:55 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2369843f99dsm36389375ad.185.2025.06.18.18.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 18:04:54 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id 7F349ED653C; Thu, 19 Jun 2025 10:04:53 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-um@lists.infradead.org
Cc: thehajime@gmail.com,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 10/13] um: nommu: a work around for MMU dependency to PCI driver
Date: Thu, 19 Jun 2025 10:04:14 +0900
Message-ID: <dce1cc8330469cca3f3e451885b7d230be57b143.1750294482.git.thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750294482.git.thehajime@gmail.com>
References: <cover.1750294482.git.thehajime@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The commit 8fe743b5eba0 ("PCI: Add CONFIG_MMU dependency") restricts the
PCI base driver to depend on MMU.  While nommu UML _can_ implement PCI
drivers over PCI devices (e.g., virtio-pci), the current nommu UML
doesn't implement it.

But without PCI drivers kunit complains as config for kunit
(arch_uml.config) defines the dependency to PCI drivers.

This commit fixes the issue of this compile failures when building PCI
drivers with nommu UML.  In particular, the fix is to undefine the
constant PCI_IOBASE to be able to bypass pci_unmap_iospace() call.

When we will support PCI drivers for nommu UML, we will refactor this
code.

Signed-off-by: Hajime Tazaki <thehajime@gmail.com>
---
 arch/um/include/asm/dma.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/um/include/asm/dma.h b/arch/um/include/asm/dma.h
index fdc53642c718..643d74555671 100644
--- a/arch/um/include/asm/dma.h
+++ b/arch/um/include/asm/dma.h
@@ -4,6 +4,19 @@
 
 #include <asm/io.h>
 
+/**
+ * now the PCI core driver depends on CONFIG_MMU in linus tree, nommu
+ * UML cannot build with PCI but without PCI kunit doesn't build due
+ * to the dependency to the CONFIG_VIRTIO_UML.
+ *
+ * This is a workaround to silence build failures on kunit, which is
+ * valid until nommu UML supports PCI drivers (e.g., virtio-pci) in a
+ * future.
+ */
+#ifndef CONFIG_MMU
+#undef PCI_IOBASE
+#endif
+
 extern unsigned long uml_physmem;
 
 #define MAX_DMA_ADDRESS (uml_physmem)
-- 
2.43.0

