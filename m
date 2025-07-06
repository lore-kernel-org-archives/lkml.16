Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34832E371C
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 18:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751827909; cv=none; b=KktK7jlA9LcdcPSyuj4MUFFqEeMDuNJ6ZKS2aET/+8lSc5hBsqhDi8gZLHDZeO2ycT9LZdrYgpfS1o5d5eE5G5/gKl49gj/m+3wZmpoHi9xRshAE+35QgcYwENFKI/NDxzH7Q+KasbqBDjj5Kon2IcP+QMT43iUmk11Kcz20qRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751827909; c=relaxed/simple;
	bh=wq0uXmvP7Ute8CwPPC+XUUeee2nwq/SAWlk05DUpduY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JTOltEUo1ft4huf10tKooNHz3LNJNUeHc3VGlelNI7JTUTdfznEBK09LD/7yVXN/DFfOSmCVLA1D8a/nrrPcCkF7f7/4GN/XlWJD8aJH05drWcwu8oUEzTLncWH7WT9zFTMTMj6hqGxDsEgKPnCV5RzwrjQ3amix0iSC1dvUwDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=star-ark.net; spf=pass smtp.mailfrom=star-ark.net; dkim=pass (2048-bit key) header.d=star-ark.net header.i=@star-ark.net header.b=gxzAF12w; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TXJeaKtE; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=star-ark.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=star-ark.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=star-ark.net header.i=@star-ark.net header.b="gxzAF12w";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TXJeaKtE"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E7EDE140024B;
	Sun,  6 Jul 2025 14:51:45 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sun, 06 Jul 2025 14:51:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=star-ark.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1751827905; x=1751914305; bh=zoKk83pQqtEPFlt8ZgMuy
	dV5BjFOrVdd+cNyySAi+kQ=; b=gxzAF12waRrq3wsTlSuO4rRZfnbqg/3oX/w71
	IDX4YD+b55Js5GrNbQkqw7VgcZ5JIdwgd7SnZQdGji5L52p4hAplnOTokiXa1DdE
	h5T4xHpLnu8yOWpvgcPk5DKQUWJdoWNujaBaazwYK8sj6579HNt/5d/YfKhz2g+X
	kPZsCYqiIjiq0PwJRQcaXpOggYULmKKkv7GWJ+khS7aIdm+u3j5YOY3PNJe4mZ0r
	t8cLnJr7XFdqPCfryoafig/bRlTBcdCUqsHJvF9t/uD6oDeJP6nn/XHwCvIhLlxp
	6jZiiuvJsF45JLfF0FV6wMXkGVsacvPk6OidLOHOod5sGtf4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1751827905; x=1751914305; bh=zoKk83pQqtEPFlt8ZgMuydV5BjFOrVdd+cN
	yySAi+kQ=; b=TXJeaKtEAjhs2Cy/PnkNwgqPviHa5AWYdQMAm9SIwV5RHJ8+TiV
	WpUKvQQgouIxR8s5Lnf6ERE41C8ECl0QGK3b2gwV7GrEA+KBbJjxC46AXt6RtX0F
	cGleEZrQZw+EZdG3B3o6+fxgyTsH5Vz7rJOTOh9NgnMIiK72ZWEC1YZlciL36l1s
	/7lS/VmHd+If9gtAv8mPpDfHHNx5lIWwor/ZH9iZ60+lodFCc3ArvUMyZoPFaYRa
	zcQHflHn9wQLlqf6d77Kr0zv9+XaKy6lDGA6OjpEaZQTcLbAy7emXo5YLrKblnYK
	b4vX0B1uvMBleJjkXGJlKgiV1kI5TEffRSQ==
X-ME-Sender: <xms:wcVqaNO5LAaVauCR22kaLxLa1QPvX-_PQINnEoMNF68rlGxq2bBo0Q>
    <xme:wcVqaP_MeGBUxB8DLe6rZwXtN6UCEgLIXzKstABDRwocNxWV0LO6-LCX2vdPOU0LL
    HzfVWsV9Uut8XC-H68>
X-ME-Received: <xmr:wcVqaMS6ELCemQPhpgIHxs4FfTiMdHBfN08Ja7--IIZ1Ne6cXBA5Fu7vIVTfNRwOoTx5YfKD_fq43lw_JMYMH73P4M_6ysginQ4ZiQDeL1f8mtT1FG8SJA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvleeikecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtredttd
    enucfhrhhomhepnfhilhhlihgrnhcuuegvrhhrhicuoehlihhllhhirghnsehsthgrrhdq
    rghrkhdrnhgvtheqnecuggftrfgrthhtvghrnhepffeigeethfffvedtgfffgedvvdeivd
    ekheffveefledvuefhiedtveejtdeuffejnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomheplhhilhhlihgrnhesshhtrghrqdgrrhhkrdhnvghtpd
    hnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhn
    uhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegrkh
    hpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhilhhl
    ihgrnhesshhtrghrqdgrrhhkrdhnvght
X-ME-Proxy: <xmx:wcVqaJsJf2gflDFojqQOkIFYbvexIiEUJTa-j3adUcCK5I6qLegXsg>
    <xmx:wcVqaFcd4CGk5UzeclZDaDP8AwRH4d-_XRPs7wmSuRIQ-G71SK91fQ>
    <xmx:wcVqaF1E48XTANWtCKhJ3QEYTKcfRpPY0ew3CxAageYFUQhMqN_RsQ>
    <xmx:wcVqaB87iY8Dth1bTgXMHEgNQA8SqyOpGA9cOOAYvFWByLuy7SkZmw>
    <xmx:wcVqaHrNB1Z1MHiHDR_64OLToK0zIY_SJJeMT-sS4iwefQrygOTyD9DJ>
Feedback-ID: i8db94900:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 6 Jul 2025 14:51:44 -0400 (EDT)
From: Lillian Berry <lillian@star-ark.net>
To: linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	Lillian Berry <lillian@star-ark.net>
Subject: [PATCH] init/main.c: add warning when file specified in rdinit is inaccessible
Date: Sun,  6 Jul 2025 18:51:41 +0000
Message-ID: <20250706185142.1294007-1-lillian@star-ark.net>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid silently ignoring the initramfs when the file specified in rdinit
is not usable. This prints an error that clearly explains the issue
(file was not found, vs initramfs was not found).

Signed-off-by: Lillian Berry <lillian@star-ark.net>
---
 init/main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/init/main.c b/init/main.c
index 225a58279acd..f391f62864a6 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1593,6 +1593,8 @@ static noinline void __init kernel_init_freeable(void)
 	 * the work
 	 */
 	if (init_eaccess(ramdisk_execute_command) != 0) {
+		pr_warn("WARNING: rdinit=%s is inaccessible or not existing, ignoring\n",
+			ramdisk_execute_command);
 		ramdisk_execute_command = NULL;
 		prepare_namespace();
 	}
-- 
2.48.1

