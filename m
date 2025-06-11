Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62141274FDE
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 10:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749638082; cv=none; b=TPfTikSHYuv7dgb10Khh9t82Gq/WrgQ28P+9ZTKtPh0WT7AMVIvFLzsi3eVTBnqcvdPDrMXVgcwQFod6v/TtWjdb6f7a74ZxiOjdvjzDKlLSlS7NS5dT5f4V8NargYjTk3x+h93k1pkAWeMtVf17mXv1JJecJDBzRP+pUBwY8n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749638082; c=relaxed/simple;
	bh=cXATu5WHYSddNew6hPBjs/f3aIkMJ3j64KCP2miazbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZRw5TN8kX+ntNUKEX7Dy5TjKD6FjZMrCnXJQ4BN2iL/zUYsY5K9bXDqigdnMibWRYMBuFVbxWwZFup3QmezkrDmDxtPfBS4Iep4KH9+QZiVxnuzaHwsDibDfmWJti7/iLwuUzeXY7K4I9YKbp0lHBBnplvDYh44K4/jk8H65wc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M50ui/yX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M50ui/yX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4587C4CEF1;
	Wed, 11 Jun 2025 10:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749638081;
	bh=cXATu5WHYSddNew6hPBjs/f3aIkMJ3j64KCP2miazbo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M50ui/yXjAWeqdhPtiRb5YNgR5csZZbU0dMbAf1SpZQLgRRYnrdJmgmchbRqy90EB
	 DcrthmNCiS488fnCof9yiZ340e4+lvhHeWsiSxlNO5AWo7G9pSYAfILd00pXuh7URX
	 ddsaYwzBvuZblZF7l8ms5jrTnUwt3t8fElD6PayX6NJKS1MquCu4cQj5CFfpNNP8vN
	 vdEudbPaO3I9zBVmd1Y1k5dkzB6pWgEiZcRYp9DmNA2l0l5/VrcO4YMk/NupqABOH9
	 dDBQ1zSu0NLy6ESqdUcWznTMGW5h9C/qi1n/Yfi2zEHhsHTyS0OdxhjGn6l6BhO/fS
	 aS1wEUUOmU+FQ==
From: Alexey Gladkov <legion@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>,
	Alexey Gladkov <legion@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org,
	Khalid Aziz <khalid@gonehiking.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: [PATCH 1/3] scsi: Always define blogic_pci_tbl structure
Date: Wed, 11 Jun 2025 12:34:29 +0200
Message-ID: <e9225a5e06b2590ff73ef7b7355e3163517c900a.1749637146.git.legion@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749637146.git.legion@kernel.org>
References: <20250606041029.614348-1-masahiroy@kernel.org> <cover.1749637146.git.legion@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The blogic_pci_tbl structure is used by the MODULE_DEVICE_TABLE macro.
There is no longer a need to protect it with the MODULE condition, since
this no longer causes the compiler to warn about an unused variable.

Cc: Khalid Aziz <khalid@gonehiking.org>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Suggested-by: James Bottomley <James.Bottomley@HansenPartnership.com>
Signed-off-by: Alexey Gladkov <legion@kernel.org>
---
 drivers/scsi/BusLogic.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/scsi/BusLogic.c b/drivers/scsi/BusLogic.c
index 1f100270cd38..08e12a3d6703 100644
--- a/drivers/scsi/BusLogic.c
+++ b/drivers/scsi/BusLogic.c
@@ -3715,7 +3715,6 @@ static void __exit blogic_exit(void)
 
 __setup("BusLogic=", blogic_setup);
 
-#ifdef MODULE
 /*static const struct pci_device_id blogic_pci_tbl[] = {
 	{ PCI_VENDOR_ID_BUSLOGIC, PCI_DEVICE_ID_BUSLOGIC_MULTIMASTER,
 	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
@@ -3731,7 +3730,6 @@ static const struct pci_device_id blogic_pci_tbl[] = {
 	{PCI_DEVICE(PCI_VENDOR_ID_BUSLOGIC, PCI_DEVICE_ID_BUSLOGIC_FLASHPOINT)},
 	{0, },
 };
-#endif
 MODULE_DEVICE_TABLE(pci, blogic_pci_tbl);
 
 module_init(blogic_init);
-- 
2.49.0

