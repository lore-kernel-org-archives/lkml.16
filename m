Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1AF17DFE7
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 20:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751835468; cv=none; b=hunS08fIB++UFa5jgU/jP5h7gAk5Z/xMOwV/q8ib+SjWk5neXX0tyT/sf0OtatfQ3/Bf4rzDgdVynvepKb98nnt/RDQPj36HWGYeTSHFoL+jqmfBqmnd4lh2Mlf1A6e6702FDL+hGY6ohdB7EL7HcMfq6li0BqizWSodreDaAYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751835468; c=relaxed/simple;
	bh=qkUvP2XKo+ro2LvMy+17XHKG2U7UL4WOX6oQK8prduc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VOy/sSFjTCzYk5r8A+Oe9+POXv4M/oooE1eExbVV67BpgvubhZGExFBKABtxy/ZUzRf6tZWi6MrkXTeo862vfWTswriHuuh+EGCDkDmB08HE22eHf16fLaycOWrWB2jjK6lhuip3VX90Z8hrRM2avF5Gb1XJZWXz/ZKNlAyEhwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=star-ark.net; spf=pass smtp.mailfrom=star-ark.net; dkim=pass (2048-bit key) header.d=star-ark.net header.i=@star-ark.net header.b=f8SxdsC6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SmlJRTJj; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=star-ark.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=star-ark.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=star-ark.net header.i=@star-ark.net header.b="f8SxdsC6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SmlJRTJj"
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 317C0EC045D;
	Sun,  6 Jul 2025 16:57:45 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Sun, 06 Jul 2025 16:57:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=star-ark.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1751835465; x=1751921865; bh=Mxknu4/hL25Yb0uGgL0KS
	rM9U9Bw/Mr1zz8MWqNI33A=; b=f8SxdsC6N1cGpayK6NOPiwVD2yFN46OQ4XtPC
	iKoiQOOA60HQR56v0I2kNqG4hko6rQoutRlAcocYKeji4KxodVtf6gB2C4asXjws
	s4sGR3q5POU9UB1/Fx4HVinWTAat9B7mlljODUOcgLdHgmvYOmEuAZaRy01x+Pur
	Ck18OUzfuRb4+ikn1C2SnkciCpO4fJRfJjnV6LTiCVJ+nKgKe1A1fwEoorM5tkNp
	CAyxzpZU6Apnd0JOKX76ImLf/5Sv/PLepESQtoiEF9mFVXMnTpa99K6SgdvFC+00
	wSHrn+cL5pGOFhKznqq6sGQGkw64p6/oKkqy98aUASMQdAsQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1751835465; x=1751921865; bh=Mxknu4/hL25Yb0uGgL0KSrM9U9Bw/Mr1zz8
	MWqNI33A=; b=SmlJRTJjfZ9xCUxKDuJy9rg4u1bWGIabosvABw2jgq/v5T2SGLq
	KZrwjqdxVkzhsfjMpPun0rarqBHWjCqfqQ2MA2F8Biw4iSQhWg2eYITJDlXWHMne
	esSf+bD3aYMKDlYumk6PLglSWcGPvm3OQ5fgVVPShjNpzWP84U9MLgq1VB25Os89
	ay5OM8MV7wu0dn04z+4Z1MkFpjp6AevgbfeqtpAkOztihxOE9h6G88NpnaRP8uWn
	0yTbDDxgM2gD+L3Mys0yqpx6yInPknJFN7+v7DLKPj3BkXJFu9wQGrh8ZN2xD/1A
	XmkHCiTuUqLg2iaABAjmp+Y7uqgeOngFU8A==
X-ME-Sender: <xms:SONqaIDP3dJCAILTx-ZZNppRaqqdVopOrFGs18YaK3tdjjgLOIKfgw>
    <xme:SONqaKh11KIzQQJA2wmI5qKtDy4UEitHplUj2rnAYcO2Ivw6QC0ZaYl75pLYAPz-7
    HXQUnxVI8QRB4x5NN4>
X-ME-Received: <xmr:SONqaLlga1R-yhbFdFS3J0lYaLvwiTJMpXBJexs12Jvq1tzcJjLaFZKaxBSxyrTIvEeSUU7gVqJqDGmLwAoMUJmatzQRfTc8CZ6hqOmQdR_1fZwTtgNOYA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvleelgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtredttd
    enucfhrhhomhepnfhilhhlihgrnhcuuegvrhhrhicuoehlihhllhhirghnsehsthgrrhdq
    rghrkhdrnhgvtheqnecuggftrfgrthhtvghrnhepffeigeethfffvedtgfffgedvvdeivd
    ekheffveefledvuefhiedtveejtdeuffejnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomheplhhilhhlihgrnhesshhtrghrqdgrrhhkrdhnvghtpd
    hnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhn
    uhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegrkh
    hpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepvhhirhho
    seiivghnihhvrdhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehlihhllhhirghnse
    hsthgrrhdqrghrkhdrnhgvth
X-ME-Proxy: <xmx:SONqaOzQDUii2pxPKVZSk0zmcxD8x6PQVGqz1DDpiCLojMnZmgaQrA>
    <xmx:SONqaNTAaZVe8N3Tfbj2SmYuKAFw3a-tFF97JvywrDOGwxvULwTSkw>
    <xmx:SONqaJYunL1g1fo6FJGvog8JZwEZMSoscgGJ7vaBNu5Trr3HTERkCw>
    <xmx:SONqaGQrQIbije3mChDvMOEBPdPkbEbKysL95LH4HQ10wSLGtZ2paQ>
    <xmx:SeNqaCJqDg7wiW-XzW9etXQcRM-Ud79JWAdbvBOJA9-dPNN6fulJbGPf>
Feedback-ID: i8db94900:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 6 Jul 2025 16:57:44 -0400 (EDT)
From: Lillian Berry <lillian@star-ark.net>
To: linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	viro@zeniv.linux.org.uk,
	Lillian Berry <lillian@star-ark.net>
Subject: [PATCH v2] init/main.c: add warning when file specified in rdinit is inaccessible
Date: Sun,  6 Jul 2025 20:57:38 +0000
Message-ID: <20250706205738.1312194-1-lillian@star-ark.net>
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
 init/main.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/init/main.c b/init/main.c
index 225a58279acd..84090c2099ff 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1592,7 +1592,10 @@ static noinline void __init kernel_init_freeable(void)
 	 * check if there is an early userspace init.  If yes, let it do all
 	 * the work
 	 */
-	if (init_eaccess(ramdisk_execute_command) != 0) {
+	int ramdisk_command_access = init_eaccess(ramdisk_execute_command);
+	if (ramdisk_command_access != 0) {
+		pr_warn("rdinit=%s is inaccessible or does not exist (errno %i), ignoring\n",
+			ramdisk_execute_command, ramdisk_command_access);
 		ramdisk_execute_command = NULL;
 		prepare_namespace();
 	}
-- 
2.48.1

