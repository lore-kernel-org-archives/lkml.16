Received: from out.smtpout.orange.fr (out-74.smtpout.orange.fr [193.252.22.74])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221FB1A23B1
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 18:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744481471; cv=none; b=gZbssQSqHwNSS4X2A9uCpR2Vc0VpsdLP+AcW8w8SgihXN9Y3y17Z63cCCZ48cuG5Zynuijl7YMT9L/QRDfNGiqRcBGtseK7H3KbbOIQ2ctb5X8vQ2W6B4kXqCV9VwQmm8ub1ep3thvgk+20g5vitQaaweVX3CZxONAN2sXlo1j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744481471; c=relaxed/simple;
	bh=2C69E6Zwa0LwrizAy5FHjlaDU9BOYApEAc6a4ZpExZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NUTM6XbV/5Dak6TFRLRx+2ooIphEI/n9AhB1uLbfJVAmjbcpH4mStJMzqo5wyZrOQCq1DR1+YPoJpc9ZFhayZXzn724EXwxHVedyyu44VrbnA3GMJQlhb70hoAZqEi7UG6V130qe+mc6W0m6M4w+/Rj7vJzxc12IFstA+ZnO+lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr; spf=pass smtp.mailfrom=orange.fr; dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b=fje/+rDq; arc=none smtp.client-ip=193.252.22.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orange.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b="fje/+rDq"
Received: from cyber-villager.csun.edu ([130.166.192.226])
	by smtp.orange.fr with ESMTPA
	id 3fIbuBn9ASD8r3fIfu2ZfU; Sat, 12 Apr 2025 20:09:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
	s=t20230301; t=1744481395;
	bh=xgOC6c3drb1XwiKpCFrfeMke7xkgHxeZhp+Mp/LTlMc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=fje/+rDqMB9YIBoN7EoGNhlkyzG78P9Xkq+feD31ie4+SqAH170fhPg8iPFg3da5P
	 XCVCmyrpamKlKjF2++QWqvBuzTYHEPdbMeGvXKZjxx4wUnnmbPgyGRzUfg6neACN4V
	 qGYIaPyQ3nkNugenqlnwjQDM8/mlmd3Twysj9EHGulHNdrO4Q3H8DiOfKMtAmczjDD
	 VO7q2W9ePpGmSXUkHda/8yyljUqaJNKW8HCofz1yiNXK1zWNyG3jZq72dAqMtkREfC
	 MlpSZMWhdAoYyfbixMYKlMgxLZYxKoTGntUaNw0l9MNgFFCCnUvWks/bxeWFmabCQC
	 REF41GygIAy2A==
X-ME-Helo: cyber-villager.csun.edu
X-ME-Auth: cGF1bC5yZXRvdXJuZUBvcmFuZ2UuZnI=
X-ME-Date: Sat, 12 Apr 2025 20:09:55 +0200
X-ME-IP: 130.166.192.226
From: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 15/16] staging: gpib: tms9914: fixes multiline comments style
Date: Sat, 12 Apr 2025 11:09:46 -0700
Message-ID: <a05655260b082c94af71348f05dd2f4e586e2a03.1744438358.git.paul.retourne@orange.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744438358.git.paul.retourne@orange.fr>
References: <cover.1744438358.git.paul.retourne@orange.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes the style of multiline comments to comply with the linux kernel
coding style.

Signed-off-by: Paul Retourné <paul.retourne@orange.fr>
---
 drivers/staging/gpib/tms9914/tms9914.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/tms9914/tms9914.c b/drivers/staging/gpib/tms9914/tms9914.c
index 2abda9d7dfcb..edbd8ea8967c 100644
--- a/drivers/staging/gpib/tms9914/tms9914.c
+++ b/drivers/staging/gpib/tms9914/tms9914.c
@@ -53,7 +53,8 @@ int tms9914_take_control(struct gpib_board *board, struct tms9914_priv *priv, in
 }
 EXPORT_SYMBOL_GPL(tms9914_take_control);
 
-/* The agilent 82350B has a buggy implementation of tcs which interferes with the
+/*
+ * The agilent 82350B has a buggy implementation of tcs which interferes with the
  * operation of tca.  It appears to be based on the controller state machine
  * described in the TI 9900 TMS9914A data manual published in 1982.  This
  * manual describes tcs as putting the controller into a CWAS
@@ -321,7 +322,8 @@ static void update_talker_state(struct tms9914_priv *priv, unsigned int address_
 		if (address_status_bits & HR_ATN)
 			priv->talker_state = talker_addressed;
 		else
-			/* this could also be serial_poll_active, but the tms9914 provides no
+			/*
+			 * this could also be serial_poll_active, but the tms9914 provides no
 			 * way to distinguish, so we'll assume talker_active
 			 */
 			priv->talker_state = talker_active;
@@ -738,7 +740,8 @@ irqreturn_t tms9914_interrupt_have_status(struct gpib_board *board, struct tms99
 		switch (command_byte) {
 		case PPConfig:
 			priv->ppoll_configure_state = 1;
-			/* AUX_PTS generates another UNC interrupt on the next command byte
+			/*
+			 * AUX_PTS generates another UNC interrupt on the next command byte
 			 * if it is in the secondary address group (such as PPE and PPD).
 			 */
 			write_byte(priv, AUX_PTS, AUXCR);
-- 
2.49.0

