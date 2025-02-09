Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28138248C
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 21:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739138343; cv=none; b=mEBFXgR7O4sCcbGH6rfr9Bpr6DkizdfQD4O/VbV0DGFzkxzwZsWunJKSAVUMvPDa2aVP1Uqa7pqjekTk3NYRf28QjF7u274ul6L6wkg3r+ucraElEFiPk+jya2pd/Xgkue+OLiqqRaPMRv827U3zb6v4i14wSiygNfYCl4KA/UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739138343; c=relaxed/simple;
	bh=rZZRsjlSpeAfRhzHyE/VdMTRY0VDQU8RR2sZYVcrZ+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HXPkYkV5CX9GKLF7GaXGSR9zgnXhdKyWU8/niu37jSAlfVuurp9IqH46ZTq57gPflRelIUYgWGM2TMCzb+wlvcn5C3H2G1MJ0K8opnMBLZVJhFui9EysZ1KTKptX7mU+Gkdc41d+jIybgpT/uWnFxS/0bY/78VxtzhnK/kOLwDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sn0t8fvD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sn0t8fvD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 252DAC4CEDD;
	Sun,  9 Feb 2025 21:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739138343;
	bh=rZZRsjlSpeAfRhzHyE/VdMTRY0VDQU8RR2sZYVcrZ+g=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=sn0t8fvDgnnM0G8WgbMBwfqaYq+4K+RbZ58zF6wzg7w7+HOYix29zo+HOt62dXp3P
	 MpGUmzYl4Y0DrwoZp4TM0zi0GMAt5QgqH6N0WFZB0lbo59gVmwxuShQaQsjonxvMFh
	 DMCld16GaUBJgrU1xa0+rHN4WlgBftewKmNjJuy3HdJh7ys10l/XPvZGKhS/gWET+2
	 1SANKWNxcFMZrmbg6Mt4XsITmfWH0I81xuaa6zNtiuP/93joENFG68Q39MlbeVwj+c
	 DnvlKzpCHQWHxfEMZP1vISxB4+jQM4XRC9khsO3sulxmLCgMsn8km/pH0l4bBEPL3n
	 BQ4MJQ0LOlw4w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09650C0219B;
	Sun,  9 Feb 2025 21:59:03 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sun, 09 Feb 2025 22:58:50 +0100
Subject: [PATCH] powerpc/fsl_lbc: Explicitly populate bus
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250209-localbus-v1-1-efcd780153a0@posteo.net>
X-B4-Tracking: v=1; b=H4sIABklqWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIwNL3Zz85MScpNJiXUuTRLPUpCQDk2RDIyWg8oKi1LTMCrBR0bG1tQD
 KGYEMWgAAAA==
X-Change-ID: 20250209-localbus-94a6ebb04c12
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739138342; l=2166;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=B9wRS8xBkWgNM3MVMQKFspl9gtSoxY/bCMh2+zmQDxk=;
 b=tFftKrynp3tkKOIsn1G7hLG/50HmSiZgFICzklnzo02+5OzJ4z2O3yOXtbYkOd2tIUzTztvUP
 3jBRUyGXE5fDRuAWF65KNIo8wVffEwkkRvHkDHvXqMss2mBlUNCGA2P
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

Historically, devicetree nodes representing the Freescale Enhanced
Local Bus Controller (eLBC) have compatible strings such as:

    compatible = "fsl,mpc8313-elbc", "fsl,elbc", "simple-bus";

The "simple-bus" string causes the bus to be populated, and the memory
devices contained within it to be discovered. The eLBC bus (as
represented in device trees) differs from a simple-bus in a few ways,
though:

 - Addresses are not simple/linear: The first cell of an address is a
   chip select, the second is an linear address within the space thus
   selected. Representing 1,0 as 100000000, for example, would decrease
   readability[1].
 - It is expected that the devices on a simple-bus "can be accessed
   directly without additional configuration required"[2], but the eLBC
   needs some configuration.

To accommodate devicetrees that declare an eLBC without "simple-bus",
explicitly populate the bus in the eLBC driver.

[1]: dtc makes such a suggestion opon encountering an eLBC
[2]: Quoting the Devicetree Specification Release v0.3

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/powerpc/sysdev/fsl_lbc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/sysdev/fsl_lbc.c b/arch/powerpc/sysdev/fsl_lbc.c
index 217cea150987df1e1b5c6dbf9e9a1607dd5ce49b..2007ced997fcf0c7059e5b780893b530764dc8b2 100644
--- a/arch/powerpc/sysdev/fsl_lbc.c
+++ b/arch/powerpc/sysdev/fsl_lbc.c
@@ -20,6 +20,7 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
+#include <linux/of_platform.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
 #include <linux/platform_device.h>
@@ -336,7 +337,7 @@ static int fsl_lbc_ctrl_probe(struct platform_device *dev)
 	/* Enable interrupts for any detected events */
 	out_be32(&fsl_lbc_ctrl_dev->regs->lteir, LTEIR_ENABLE);
 
-	return 0;
+	return devm_of_platform_populate(&dev->dev);
 
 err1:
 	free_irq(fsl_lbc_ctrl_dev->irq[0], fsl_lbc_ctrl_dev);

---
base-commit: 7ccde445dddcca030cd6ed66974bb80915ad9dd5
change-id: 20250209-localbus-94a6ebb04c12

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>


