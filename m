Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6690C1E87B;
	Sat, 12 Apr 2025 00:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744419261; cv=none; b=H+Wrj5SWZxvRTSdTMNdzRNrx5RhSgfCmVsaKLd2uRwlh2qGSFUChGZzWM3pXoA4XoQUpIbr1q0hSHS6Gv5xntZ8ewHyPrEF/nd+Fb8qGmbosswnEM7x1tBTaFCbR0T8sRS0Ic2bFsWG7+qjvrRAFIfcXpDmVJK+Do/yKEC/yfwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744419261; c=relaxed/simple;
	bh=s45L0YnkJ1vkVqnb9gTLWF3wJTlILXq+4YLkXE61rqs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZgU7IrghjkklhHr+TDdXLlGrfPpFRhRCpsNKgmlRGO4jPT42gwjhz/5zfRc8f45XUuJ0nUolDiSadFC+sJCaSFHhLmrN0vg5rXBQIs8nNIZXYbLSW84eTEBVzCaORhv/RnAxUSgerh05YgbJepwkrgTHEsSOe3OX1TvFFGiKzzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kxUKhr59; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxUKhr59"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-73972a54919so2388306b3a.3;
        Fri, 11 Apr 2025 17:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744419259; x=1745024059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t0Jdvg9bhsj2TlLlgKK4kFPCwh8w3DW34G5/8k1fXRo=;
        b=kxUKhr59waGTJcy2sZxukp7UYRK5TcXPjZ+fgS+00cwAy5kF4q2Cmv5tFvJ/IE1Hys
         qF1td4PBt9YL5sgTunJ3C2U0+shMoCUIY9kWskFx28cK7UmX6Kf5PBgVsIKgFQpxUBDb
         TJgeziItaN6Ce8LCRNFxG2h9lDBtT7Ap87kYgdPFFRm5EXX+H8uhNtOWzmQRErTUOQcf
         2z9iKboptvLjOfay6lYqJGnw4yhUSJRHODYIot2w/p8KH8G0S9oIN/8CJ36oA9akExvf
         p2nlVfRE5LPv6ft3BGibMC1RdEIexk0RuP0kmsIwFP5AfdUX2NomGP4AWh8vGKeGkBgt
         G8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744419259; x=1745024059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t0Jdvg9bhsj2TlLlgKK4kFPCwh8w3DW34G5/8k1fXRo=;
        b=k/BqXyvpD+Rodd79rrU+6Uo7AtZUxnV1azprAIMXUtEnH6sYh+lt89a1777ey6yj0w
         cK7n6mX21CONMjeUQUv7dTY0GmlF7TJDOB56wPaORAbrE9I0nPJFh4MsTJev9Vk20P3D
         l4/iDyVMEPQnkJpO3oa09U8fs+ARX/MHA0oZbaMJtbKZ7lIHDGs8XVu9CtutoB+LexTn
         xCqtoQo1KNUnX7SPlAu5zYCTxOpZ5v9DVHGaUxN4NE8gJaa6UjSY8mAP6n2Auk+YqtgN
         l3RnqUg6KIyIPtUeY5/EF4R+iaRURHDG04TrP7A/ry1tWvWsJw4esGblBvfla9KCTwOT
         i65Q==
X-Gm-Message-State: AOJu0Yz6JOjC7R9/wtszk1keew0lCTuBSsd6HU1Qz8P0iLK42Wws/g96
	OOmlu+DX3UPXQbKwe9+UxRC38Y2TX0k0I8e9xrDCdHkTtDE3p26ACmXEIVKp
X-Gm-Gg: ASbGncssGr7zkBnMfTrgvHt++60tsRhtxP3ygHvb115L2BZdXeVkC+HA2vvxLRQn39A
	a5NdHO+foB4VysGm0n9bgpTzeyCKOG7rn2tNg9R1PEoi1VTsKcwuu+4FkkhrMOQ44pXoOEtsBhS
	FhB/sqtOXafqCyOCd1Vr7YTE+IzZBbCZRUDfNGpSj81Dr++j8zCM9fh1GjxvTaWzWrNTxOmy6Or
	0ZIswDprbosBn3d5IZKeLviZxSCzUwIehII0ur8pfBONuK0Erd0w3U/0otQ5g9zjzg507w/wIJl
	dFWyWZ3l4JLOLrPhFPi5FZZSO4eZeGkZv51QQyI6iWlXA5dDFH3Wc3pcFYBkCevQht3qWa/npKQ
	2gjIU9xiOh3a+HHhEustehLN0Ze3s
X-Google-Smtp-Source: AGHT+IHe4ii2FtLn/r3QCdx0kXlhM2Ev3zMXUE8KcvJ3Z+FhF6+t+o0tbI8w0udyq3tq6NDzKeu+8g==
X-Received: by 2002:a05:6a00:1481:b0:736:6279:ca25 with SMTP id d2e1a72fcca58-73bd12a8333mr6935579b3a.24.1744419259191;
        Fri, 11 Apr 2025 17:54:19 -0700 (PDT)
Received: from mew.. (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230dd17sm2303274b3a.129.2025.04.11.17.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 17:54:18 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-um@lists.infradead.org,
	richard@nod.at,
	anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net,
	geert@linux-m68k.org,
	logang@deltatee.com,
	sbates@raithlin.com,
	dakr@kernel.org,
	dinguyen@kernel.org,
	miguel.ojeda.sandonis@gmail.com,
	arnd@arndb.de
Subject: [PATCH v2] rust: helpers: Remove volatile qualifier from io helpers
Date: Sat, 12 Apr 2025 09:53:41 +0900
Message-ID: <20250412005341.157150-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the `volatile` qualifier used with __iomem in helper functions
in io.c. These helper functions are just wrappers around the
corresponding accessors so they are unnecessary.

This fixes the following UML build error with CONFIG_RUST enabled:

In file included from /home/fujita/git/linux-rust/rust/helpers/helpers.c:19:
/home/fujita/git/linux-rust/rust/helpers/io.c:12:10: error: passing 'volatile void *' to parameter of type 'void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
   12 |         iounmap(addr);
      |                 ^~~~
/home/fujita/git/linux-rust/arch/um/include/asm/io.h:19:42: note: passing argument to parameter 'addr' here
   19 | static inline void iounmap(void __iomem *addr)
      |                                          ^
1 error generated.

Fixes: ce30d94e6855 ("rust: add `io::{Io, IoRaw}` base types")
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
v2:
- remove all the volatile in io helpers instead of aligning UML's iounmap() with other
v1: https://lore.kernel.org/lkml/20250409061129.136788-1-fujita.tomonori@gmail.com/
---
 rust/helpers/io.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/rust/helpers/io.c b/rust/helpers/io.c
index 4c2401ccd720..15ea187c5466 100644
--- a/rust/helpers/io.c
+++ b/rust/helpers/io.c
@@ -7,94 +7,94 @@ void __iomem *rust_helper_ioremap(phys_addr_t offset, size_t size)
 	return ioremap(offset, size);
 }
 
-void rust_helper_iounmap(volatile void __iomem *addr)
+void rust_helper_iounmap(void __iomem *addr)
 {
 	iounmap(addr);
 }
 
-u8 rust_helper_readb(const volatile void __iomem *addr)
+u8 rust_helper_readb(const void __iomem *addr)
 {
 	return readb(addr);
 }
 
-u16 rust_helper_readw(const volatile void __iomem *addr)
+u16 rust_helper_readw(const void __iomem *addr)
 {
 	return readw(addr);
 }
 
-u32 rust_helper_readl(const volatile void __iomem *addr)
+u32 rust_helper_readl(const void __iomem *addr)
 {
 	return readl(addr);
 }
 
 #ifdef CONFIG_64BIT
-u64 rust_helper_readq(const volatile void __iomem *addr)
+u64 rust_helper_readq(const void __iomem *addr)
 {
 	return readq(addr);
 }
 #endif
 
-void rust_helper_writeb(u8 value, volatile void __iomem *addr)
+void rust_helper_writeb(u8 value, void __iomem *addr)
 {
 	writeb(value, addr);
 }
 
-void rust_helper_writew(u16 value, volatile void __iomem *addr)
+void rust_helper_writew(u16 value, void __iomem *addr)
 {
 	writew(value, addr);
 }
 
-void rust_helper_writel(u32 value, volatile void __iomem *addr)
+void rust_helper_writel(u32 value, void __iomem *addr)
 {
 	writel(value, addr);
 }
 
 #ifdef CONFIG_64BIT
-void rust_helper_writeq(u64 value, volatile void __iomem *addr)
+void rust_helper_writeq(u64 value, void __iomem *addr)
 {
 	writeq(value, addr);
 }
 #endif
 
-u8 rust_helper_readb_relaxed(const volatile void __iomem *addr)
+u8 rust_helper_readb_relaxed(const void __iomem *addr)
 {
 	return readb_relaxed(addr);
 }
 
-u16 rust_helper_readw_relaxed(const volatile void __iomem *addr)
+u16 rust_helper_readw_relaxed(const void __iomem *addr)
 {
 	return readw_relaxed(addr);
 }
 
-u32 rust_helper_readl_relaxed(const volatile void __iomem *addr)
+u32 rust_helper_readl_relaxed(const void __iomem *addr)
 {
 	return readl_relaxed(addr);
 }
 
 #ifdef CONFIG_64BIT
-u64 rust_helper_readq_relaxed(const volatile void __iomem *addr)
+u64 rust_helper_readq_relaxed(const void __iomem *addr)
 {
 	return readq_relaxed(addr);
 }
 #endif
 
-void rust_helper_writeb_relaxed(u8 value, volatile void __iomem *addr)
+void rust_helper_writeb_relaxed(u8 value, void __iomem *addr)
 {
 	writeb_relaxed(value, addr);
 }
 
-void rust_helper_writew_relaxed(u16 value, volatile void __iomem *addr)
+void rust_helper_writew_relaxed(u16 value, void __iomem *addr)
 {
 	writew_relaxed(value, addr);
 }
 
-void rust_helper_writel_relaxed(u32 value, volatile void __iomem *addr)
+void rust_helper_writel_relaxed(u32 value, void __iomem *addr)
 {
 	writel_relaxed(value, addr);
 }
 
 #ifdef CONFIG_64BIT
-void rust_helper_writeq_relaxed(u64 value, volatile void __iomem *addr)
+void rust_helper_writeq_relaxed(u64 value, void __iomem *addr)
 {
 	writeq_relaxed(value, addr);
 }

base-commit: c59026c0570a2a97ce2e7d5ae5e9c48fc841542b
-- 
2.43.0

