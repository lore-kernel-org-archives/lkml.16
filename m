Received: from out.smtpout.orange.fr (out-16.smtpout.orange.fr [193.252.22.16])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E8B14EC73
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 06:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744439684; cv=none; b=Cagu2Gl4t7a0YZOW1uZQnKna12DWkKHfbViElD9DvMgrLhNQ/5E6Dt2buHZTs1g8ZhvnTpSV1NH1ptkHm9ANz6w0Oql9fLyxl4prTbMJg5Tfrc8a8gnJPLDHYWhg0a+CMrPM5U+LBeAQojV5ahU8SdpouE3arBqnOzAA8aWyZmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744439684; c=relaxed/simple;
	bh=LZ03fjekvVWXEAMSKHSwO5p1QE9Copk4oc6W9a9wg3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Galwn+OYvSKFXFQoONbqKILwGq7Fzfldfx5ECKkB6n5njFuLOyRRN4v8OvwGo/ErRCYc0qdQHri3Ds1hF5v3QvLRtZ1hcVnoAz5Aq55s9Yp7wumsNRrCuHm0qBrepjNkmReh/fs9TE2iKgywE7YjMNyEJf7rlknEmxJgFrrmigM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr; spf=pass smtp.mailfrom=orange.fr; dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b=SCYmuN19; arc=none smtp.client-ip=193.252.22.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orange.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b="SCYmuN19"
Received: from cyber-villager.csun.edu ([130.166.192.226])
	by smtp.orange.fr with ESMTPA
	id 3URhuYTtAiSFB3URkuke9C; Sat, 12 Apr 2025 08:34:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
	s=t20230301; t=1744439675;
	bh=ViZkdHUhRet3So6CMJzrcaKkByL778r7/I6kMxf+EB8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=SCYmuN191ZLdWQkC3jFqJ9dZS9Y25Kat+LSiyihk3h1bhQOQBnJG3FfZnZ66U0K++
	 byE8w6XTmao3DdbRQ/ydNjHUQybD2mE3mLPOqi1h2vMAd64pnZ9zEt9g7PagV75rLw
	 tSuu2Btj3JN2PX9A0hV0o3DaBImgA8oB6/Uv3cHvvHkRIc9XtJJ5orOR77TG+RTFWj
	 VnKF/ZmI7G7p+Q+s0q2fLIx5ekL6Q43Boqde3mTS5qGUum4Mj/4h9YxTXRh6fPx39c
	 ThTGQL4kpj8cVpqQhJ8kh4afi2CHos36wFzvTSxmpPmM9w1DiHE/u/8XKyMb+8i7OD
	 NwC363eGLAsCA==
X-ME-Helo: cyber-villager.csun.edu
X-ME-Auth: cGF1bC5yZXRvdXJuZUBvcmFuZ2UuZnI=
X-ME-Date: Sat, 12 Apr 2025 08:34:35 +0200
X-ME-IP: 130.166.192.226
From: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/16] staging: gpib: gpio: fixes multiline comments style
Date: Fri, 11 Apr 2025 23:34:25 -0700
Message-ID: <44c064ed914fef384800e94ac99d00af5ff5f13b.1744438358.git.paul.retourne@orange.fr>
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
 drivers/staging/gpib/gpio/gpib_bitbang.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 86bdd381472a..97ae80e8ee3b 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -32,7 +32,8 @@
 #define ENABLE_IRQ(IRQ, TYPE) irq_set_irq_type(IRQ, TYPE)
 #define DISABLE_IRQ(IRQ) irq_set_irq_type(IRQ, IRQ_TYPE_NONE)
 
-/* Debug print levels:
+/*
+ * Debug print levels:
  *  0 = load/unload info and errors that make the driver fail;
  *  1 = + warnings for unforeseen events that may break the current
  *	 operation and lead to a timeout, but do not affect the
@@ -1256,7 +1257,8 @@ static int bb_attach(struct gpib_board *board, const gpib_board_config_t *config
 	if (allocate_gpios(board))
 		goto bb_attach_fail;
 
-/* Configure SN7516X control lines.
+/*
+ * Configure SN7516X control lines.
  * drive ATN, IFC and REN as outputs only when master
  * i.e. system controller. In this mode can only be the CIC
  * When not master then enable device mode ATN, IFC & REN as inputs
-- 
2.49.0

