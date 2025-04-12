Received: from out.smtpout.orange.fr (out-69.smtpout.orange.fr [193.252.22.69])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E8F18DF89
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 06:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744439154; cv=none; b=T3K+XH63XHsS1FusW1+amrcJw29uMIC7GooUAxDEkSQFkjQilQYfm24bwpKGLlDohg1T0Vgj29Y+9wugzBUssNfEeAEnfyRwvrsRUnX+cf/iqm4Y7weEJoMXRyR5mLsig8g6A+RKUbCWC1L2BJ4bNVSHu3SRsq+XWnVtH7vOADA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744439154; c=relaxed/simple;
	bh=IAhsLA0/zEXzdcdk/cSylhKBYULt1RUYWwFyvQ5umJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kGNdaZOM9QbDaG/Oc46G0/uwtQOFxU53BFoTJOxuPUSIH8CSJlSRxapp4oZ4ZZrG3S1LUdX8YbHQLeHTwJHsLXJqf58sgCIzqwYRkqPuVrqi1mHRmbVeTUK5FVHOk1r/++NmKftQD7fya6rolQvrH57C85TAHhBoGT6r5wCWKNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr; spf=pass smtp.mailfrom=orange.fr; dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b=PyDDP8rz; arc=none smtp.client-ip=193.252.22.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orange.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b="PyDDP8rz"
Received: from cyber-villager.csun.edu ([130.166.192.226])
	by smtp.orange.fr with ESMTPA
	id 3UI4u7H5JdZ1m3UIAuov3C; Sat, 12 Apr 2025 08:24:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
	s=t20230301; t=1744439080;
	bh=UnY0gEG4q5ZXAVNgAZAHVIFGiZ9UkuNh2cMWLSm9czA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=PyDDP8rzMRfP2vu3JelU3kP4tIXDwXENsRYxI6MS/o1rFPlqOKjK/Er+YnPOscps0
	 xRupHwb/SDdPOjK/i9cONT60qHflTeKcX3oFHs+g7tfL5qXvhfsTbtTQfzx/oID+e4
	 v6BwaR/cJ0z2auv39qnUNlAK+sIbbB0/TSj3vnh5NI5AWBZPvCiC9OAvlI1E2lbMZA
	 IQ4IZXln+xft+8sQtdcmWwOHnA463fm0anwJ1PWOgeOMtePmLWw4GEHLl9ikgMzodP
	 W/KRNKqzfZR+M6KNpXlyJtzLN8Kz3KbeN9VJ63piz76iKR2TdkylcLysgEooUP+LYY
	 OZhCUthi0FIpA==
X-ME-Helo: cyber-villager.csun.edu
X-ME-Auth: cGF1bC5yZXRvdXJuZUBvcmFuZ2UuZnI=
X-ME-Date: Sat, 12 Apr 2025 08:24:40 +0200
X-ME-IP: 130.166.192.226
From: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/16] staging: gpib: agilent_82357a: fixes multiline comments style
Date: Fri, 11 Apr 2025 23:21:53 -0700
Message-ID: <3ecb8bc6701ce7b3e5d098c10c2a2b75c9f155f0.1744438358.git.paul.retourne@orange.fr>
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
 .../staging/gpib/agilent_82357a/agilent_82357a.c   | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index da229965d98e..2275d8ac8d30 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -524,9 +524,10 @@ static int agilent_82357a_read(struct gpib_board *board, uint8_t *buffer, size_t
 	}
 	kfree(in_data);
 
-	/* Fix for a bug in 9914A that does not return the contents of ADSR
-	 *  when the board is in listener active state and ATN is not asserted.
-	 *  Set ATN here to obtain a valid board level ibsta
+	/*
+	 * Fix for a bug in 9914A that does not return the contents of ADSR
+	 * when the board is in listener active state and ATN is not asserted.
+	 * Set ATN here to obtain a valid board level ibsta
 	 */
 	agilent_82357a_take_control_internal(board, 0);
 
@@ -715,9 +716,10 @@ static int agilent_82357a_take_control(struct gpib_board *board, int synchronous
 	if (!a_priv->bus_interface)
 		return -ENODEV;
 
-/* It looks like the 9914 does not handle tcs properly.
- *  See comment above tms9914_take_control_workaround() in
- *  drivers/gpib/tms9914/tms9914_aux.c
+/*
+ * It looks like the 9914 does not handle tcs properly.
+ * See comment above tms9914_take_control_workaround() in
+ * drivers/gpib/tms9914/tms9914_aux.c
  */
 	if (synchronous)
 		return -ETIMEDOUT;
-- 
2.49.0

