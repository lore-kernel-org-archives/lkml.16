Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41CD223714
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 21:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750628021; cv=none; b=IWRpI014SOFMZ2cbBmhkRNmJADjZ13/HOIGkvjynOv14DA5ovK6z8HUKFmHgFMzHOKnp9gpiRJDDsDuc14zDuX4J24da9MxM0gUmdHOFNEVjfyAfvQwo7VxF5qvuQa7+iChKvijZqcX8GlR2stLNSIB6Njgj9jZH/JGuErKHbE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750628021; c=relaxed/simple;
	bh=A+kgl3pP41bBhorqPw1acgSIN74xjFREHN1mNj1smKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GHACaWq2qwOaDzCVaGN9U1b54mParFAemihsXQhI/Xuaw8qEKbaAknvekSl/+qyWzi5lBZT5GAnqHRpfdJpgt0oUresrQ1NpCBNUvva8avk7oFcX9pf28+x+ckZy6QTKcsRyBp28+/JVmX0qVpV/7Ysf9+6KtPTvAPr55GNPfj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JilzLc1W; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JilzLc1W"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-73972a54919so2704332b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 14:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750628019; x=1751232819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sL9evNGVpzgjwGis6FRx6Ny95Jmdu1Zd+5bgNtHIJLs=;
        b=JilzLc1WGX7ntYoHlbH3LVerlsvB564y5ADXapLhkLwjhyYb6WMQtb+VsODGc9enwm
         HZyEeunRgdRQafjPJ1pdjGEbFe8xZGht6XHbg8odAFLdl5Ttbu/GXg7MNKC7hZHad98g
         cTDkBu9uceGMED9yqZrZXqKEvirssjYjQg9nPDhq49/20Qwdnngi72S0bw2VOwSq6Obh
         Y6LYOwsEbWuTU2FTpzQR1pRKuzheLfQA0DmYuj6V0ikuMXgdcsFeJfuTrkQ3U01gmHGS
         a7hMhdlVa1pOY4nO1G7kfxqLyweECFoSrVdhal6Cm5Fo+IZsEj01dbD+8uVyUYHhj1La
         8rYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750628019; x=1751232819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sL9evNGVpzgjwGis6FRx6Ny95Jmdu1Zd+5bgNtHIJLs=;
        b=p6azmWEhlSKI7r8r6Q/j9BOFDaPsQc9IIvBQeNZWQj+5LMZQqx6T8p24w2T3bx761m
         JokroOoGxKiq8R1TcvSCrImg2oUkRz8A6/rOHGtT+kS76tWD4ez+otGI68ch/UaROszp
         EDQnd2ecpEtjivSfg5ONZyA/WGenKTEGmk3eMlL3kILocRWEumcUBBvJqywdjCqcZbse
         LBDkEGfvUiM5JEsFKeI+dm8NHqbXrOY/iZSX1K+iBbiSYrFxlwUr3XJ+Wp/O8U4obXQC
         LXaeBZaPyRRCtiSUH59DYv+aFiSkSSRMRCPCnGA2PKT4LM73zk2yxIpNFpRr6su5vqwd
         AAKw==
X-Forwarded-Encrypted: i=1; AJvYcCWqfZyL3tIS+4CAXuqBBUxbFswWVQUVj6dSciVClur7FNkfkh7PMyLe4d1cdjoaQUld3d9S1cAkn4OcuXw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv1jF7wzjKRi+n/rFGIt43H241jrnOu1gk6DMn5e7M4cMBVgEe
	wIFN8afOi+xbkSXH7gZUZ+HgwGmP9hJ62iQy+1jdWjpEYYFNbcja9pf7
X-Gm-Gg: ASbGncvIxev5EcD1FQBPLWu6IrrXMloWUitvrdgnDTT1VXYFtj7M7PjIFx9htnkxBGU
	tgE99ORQZBiGLZgYODS/EsK7Yu4EJCz3+SXh+EVxxkYCkxSAAK0PjLpCR67EQXEUgzKNk3Tj3Nq
	xh5jga47CSmibqEAB7m3Wr6lqDC65MUbgvMXg1jstYw9zSIPZS/EaZNGkcZsqzln18qc7kOkX5L
	vDNA9djKohMxcj0jExhDiO237UFhFjyGKgvGtwQXbPgkhifTpwkAYUGfxaNuPp9HKJJWTUt29uF
	snTYeWMBp7PixDW++W4mpbA7kJNqR/qN2I47oplgQQPybPnNGqSYtz4kUvN+eFATtpC37JBxd6z
	vm0rXasisbqtUKktSnwMkyCPg6fLCGE2G
X-Google-Smtp-Source: AGHT+IHnCoh0OAe4axWmL20FoXf5VObbkWOWaaYc43C4lAvRwQcH0SlNZZ/I60fw+XEGmY114DRcGQ==
X-Received: by 2002:a05:6a00:238c:b0:746:2a0b:3dc8 with SMTP id d2e1a72fcca58-7490dac586emr14075135b3a.17.1750628019333;
        Sun, 22 Jun 2025 14:33:39 -0700 (PDT)
Received: from ikb-h07-29-noble.in.iijlab.net ([202.214.97.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6c8c80sm6802898b3a.177.2025.06.22.14.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 14:33:38 -0700 (PDT)
Received: by ikb-h07-29-noble.in.iijlab.net (Postfix, from userid 1010)
	id A45F3EF1EB8; Mon, 23 Jun 2025 06:33:36 +0900 (JST)
From: Hajime Tazaki <thehajime@gmail.com>
To: linux-um@lists.infradead.org
Cc: thehajime@gmail.com,
	ricarkol@google.com,
	Liam.Howlett@oracle.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 10/13] um: nommu: a work around for MMU dependency to PCI driver
Date: Mon, 23 Jun 2025 06:33:08 +0900
Message-ID: <b7c74ee793ac4a5c301ebca27f8d58990625638b.1750594487.git.thehajime@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750594487.git.thehajime@gmail.com>
References: <cover.1750594487.git.thehajime@gmail.com>
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

