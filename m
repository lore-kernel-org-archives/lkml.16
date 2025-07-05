Received: from smtp.smtpout.orange.fr (smtp-66.smtpout.orange.fr [80.12.242.66])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530B07E107;
	Sat,  5 Jul 2025 09:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751709162; cv=none; b=pgDDl68gylDpHgQbwU2V5QnmGZjrJ0lBOOfaZtAPx8ZBzw9WuIpkyM1/oS6TKf+PMjdulJxA9qoy7uBe2H+Yxb+jPvpj3HBiWo+aeiYzUphke9cQEk659eQkcecqc8/6UDH5Z8V/sCYpaeILI/wdrBanUByzSRyRacRsjXtr0dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751709162; c=relaxed/simple;
	bh=CzpSSXYyPsaC6/NztURQQO+AIJKD/8vk/v9dURRN1Mo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KaKsoVxJSlVxFYNgVDX8pRfE6r6AcsSR1Qr+i7aXIsXkpRNEtqkyi7ewLF61x3kLyt0vahRR8QsnHtcNz3eolzuQF8iMwyalCaZr5GTqqGyOFiMqrSXRPGDhtG9o2ez3wqTLd3s2o2AffkicpTUPZPmUOOKvgpYvo5/2LXrZEtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=o0aRe66F; arc=none smtp.client-ip=80.12.242.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="o0aRe66F"
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id XzZUu6PDV2WitXzZVuS5Rk; Sat, 05 Jul 2025 11:52:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1751709157;
	bh=QnR8CnrbOwzo9XNZ3DaMPvu0/VthNa4EH5qhRRM7rUU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=o0aRe66F6iWBDR3tENSXH1o+Dej7rmmQ2d2cKqzJNmGX1y09amkeOSSs4V0spgVHf
	 KK2RjAqC9E3JJ36mMYhN17DaT+aCD+5QQM2fJuVRTA0FPOk9k1U+qTfZnxQuAgMLZA
	 eYdOZ8zQ5VAZ+l/aZBSvbEjXYjn8vi4e1xMwj//BKJ7A69Vtvkie07t/lWj+Bqbv9C
	 s1jsoduyj+GctuKSsNR/Gao1lUP7YOa/WquFSAdYgUHHpwZGaDBHKqEVWoLyRN+evz
	 cT4GJEcNPgSFyEt4NcnGiylRWVHStRASSIdScuRpIZRH8aSdVSF0GOrAHRulPj5FfE
	 ECwV7FsX8e+qA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 05 Jul 2025 11:52:37 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: thomas.richard@bootlin.com,
	Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-staging@lists.linux.dev
Subject: [PATCH v2] staging: gpib: Fix error handling paths in cb_gpib_probe()
Date: Sat,  5 Jul 2025 11:52:33 +0200
Message-ID: <bf89d6f2f8b8c680720d02061fc4ebdd805deca8.1751709098.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If cb_gpib_config() fails, 'info' needs to be freed, as already done in the
remove function.

While at it, remove a pointless comment related to gpib_attach().

Fixes: e9dc69956d4d ("staging: gpib: Add Computer Boards GPIB driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Changes in v2:
  - Fix the Fixes tag   [Thomas Richard]
  - Synch with latest -next
  - no compile tested. I think, thanks to commit 79d2e1919a27
    ("staging: gpib: fix Makefiles")

v1: https://lore.kernel.org/all/459c267de8c9bf48fcb555364930ae7e3cdc798b.1729940596.git.christophe.jaillet@wanadoo.fr/

Compile tested only.
---
 drivers/staging/gpib/cb7210/cb7210.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
index 298ed306189d..3e2397898a9b 100644
--- a/drivers/staging/gpib/cb7210/cb7210.c
+++ b/drivers/staging/gpib/cb7210/cb7210.c
@@ -1184,8 +1184,7 @@ struct local_info {
 static int cb_gpib_probe(struct pcmcia_device *link)
 {
 	struct local_info *info;
-
-//	int ret, i;
+	int ret;
 
 	/* Allocate space for private device-specific data */
 	info = kzalloc(sizeof(*info), GFP_KERNEL);
@@ -1211,8 +1210,16 @@ static int cb_gpib_probe(struct pcmcia_device *link)
 
 	/* Register with Card Services */
 	curr_dev = link;
-	return cb_gpib_config(link);
-} /* gpib_attach */
+	ret = cb_gpib_config(link);
+	if (ret)
+		goto free_info;
+
+	return 0;
+
+free_info:
+	kfree(info);
+	return ret;
+}
 
 /*
  *   This deletes a driver "instance".  The device is de-registered
-- 
2.50.0

