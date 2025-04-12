Received: from out.smtpout.orange.fr (out-14.smtpout.orange.fr [193.252.22.14])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A1F84037
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 06:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744440155; cv=none; b=syXOgXdOdMoWGe7wLe9oqezqlnbMvsCpDfTKOpYw+PxDuxY5CLaUn7KbfFXS2kjhNfSHUESUZYDtchDZVxdZBy/02GWzVaWdMMt+WRJFmKxKEEmeIxRNku4QGhI8hNG8WjsdFRFuN+cnNRrcP+3tY/iCpuWASSnlwyyK4dcdnDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744440155; c=relaxed/simple;
	bh=Pbg91NGVaIppdXiCQrAk27vgVtrjkiG606Woz1tENV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K1c323WQm2RqBOKip+Llr7dgvgP7dldssz9QLkHduYTC3UK0WR0ivZjRAyfKUdkEr6henT6/cUx608byoVex+jAY7ewsNnvmcnrYWUzbPwcInHIoaOyd2mo8b6OX2pfas9Lzy0u+AHCyrNgtcjSsNWxiQfwX6goCHTC9fnood+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr; spf=pass smtp.mailfrom=orange.fr; dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b=X0xjjADn; arc=none smtp.client-ip=193.252.22.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orange.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b="X0xjjADn"
Received: from cyber-villager.csun.edu ([130.166.192.226])
	by smtp.orange.fr with ESMTPA
	id 3UYwuQskrdrQ13UZ1u9Tdl; Sat, 12 Apr 2025 08:42:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
	s=t20230301; t=1744440125;
	bh=qmcOzlOI/g3RKdkTnvlzTmINQekNCm3D9C0EIorAHIE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=X0xjjADn1UsDPY3SskDqS30cuzEVbuKLhE22gn35wZGqrxLC09dIwQB5jPX3G0SF/
	 TIR9evw4kBke0nsyqQeQyaSAZEiyWb9J1QtRX50f7c22NyEgTNiQzAvjTWpHPhQ7tb
	 u0L+O+xqWIQdaJgtC4+Ymj6bsR0pJb846I8NZFSTVveQi+i0eJCm2GYGtyYRyf2j7j
	 U/BsrPzl1x0cGksPBl0rg2zUGCBoZrPlcl7ZEaqhE4R0Nn9WSToDNoitJfBecFGahg
	 rff8hSSTv0wzay8JNn8LncvrmyTPxYLNeOhvC/lG6Hgs6npHryZwQurCscp0lXAMJ1
	 Jx/doC6wiN7gQ==
X-ME-Helo: cyber-villager.csun.edu
X-ME-Auth: cGF1bC5yZXRvdXJuZUBvcmFuZ2UuZnI=
X-ME-Date: Sat, 12 Apr 2025 08:42:05 +0200
X-ME-IP: 130.166.192.226
From: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/16] staging: gpib: hp_82341: fixes multiline comments style
Date: Fri, 11 Apr 2025 23:42:14 -0700
Message-ID: <5bc4da465b2df932b7cb7783012786a7220a2e2a.1744438358.git.paul.retourne@orange.fr>
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
 drivers/staging/gpib/hp_82341/hp_82341.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/gpib/hp_82341/hp_82341.c b/drivers/staging/gpib/hp_82341/hp_82341.c
index f52e673dc869..0b1f923de24a 100644
--- a/drivers/staging/gpib/hp_82341/hp_82341.c
+++ b/drivers/staging/gpib/hp_82341/hp_82341.c
@@ -51,11 +51,12 @@ static int hp_82341_accel_read(struct gpib_board *board, uint8_t *buffer, size_t
 		return 0;
 	//disable fifo for the moment
 	outb(DIRECTION_GPIB_TO_HOST_BIT, hp_priv->iobase[3] + BUFFER_CONTROL_REG);
-	// Handle corner case of board not in holdoff and one byte has slipped in already.
-	// Also, board sometimes has problems (spurious 1 byte reads) when read fifo is
-	// started up with board in
-	// TACS under certain data holdoff conditions.  Doing a 1 byte tms9914-style
-	// read avoids these problems.
+	/*
+	 * Handle corner case of board not in holdoff and one byte has slipped in already.
+	 * Also, board sometimes has problems (spurious 1 byte reads) when read fifo is
+	 * started up with board in TACS under certain data holdoff conditions.
+	 * Doing a 1 byte tms9914-style read avoids these problems.
+	 */
 	if (/*tms_priv->holdoff_active == 0 && */length > 1) {
 		size_t num_bytes;
 
-- 
2.49.0

