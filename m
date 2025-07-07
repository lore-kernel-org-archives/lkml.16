Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9222A1BA
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 09:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751879676; cv=none; b=OQg0UtzuucP6my/N+v5SMd1sfwM3r+qlAXedaTTXhezCtwC+72I71cfaooUxZX2YuJwrzJxqG4jS6x7RBWrpjjnLogf6Q4EaR1dAGJ0Vw0oQ+r8Cn4Xptmn9Cf7mPJkw59gw2eVZKcnaTuUF+fPBTz7TLpzcMj8U0mUMU5pdD/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751879676; c=relaxed/simple;
	bh=ex4SPnAb6HCw9NhyhoJLWmK5w4pipS97JitJ4f9BcIE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iMz0NN1jPU4rOQX3CgVHsuBm5EjwHwTN3+Eg8T/Hw0tObBffiGnvuhCcix/i25c+q6ahDcZRGcP073s+tlxoZOVJSLFkd2pC9mtJdFWmGBUPChPo9R/avcHFNf/oeyQInJG1EC3zbiRUkfkancq/oxLHOr23Aj/KIgvWSUvbgfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=star-ark.net; spf=pass smtp.mailfrom=star-ark.net; dkim=pass (2048-bit key) header.d=star-ark.net header.i=@star-ark.net header.b=JJs/dNfd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=clt8VSbM; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=star-ark.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=star-ark.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=star-ark.net header.i=@star-ark.net header.b="JJs/dNfd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="clt8VSbM"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 16DB51D0020F;
	Mon,  7 Jul 2025 05:14:33 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Mon, 07 Jul 2025 05:14:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=star-ark.net; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1751879672; x=1751966072; bh=8OU9JLUQVNpyIawvwzcaS
	lN+OGH36SoBp7glceAW72k=; b=JJs/dNfd33xcpuJU1exkG6BfJSZOFibFfghh5
	KXR9/vfZVfYa8lhshiFUszqr+8iQ+c3qMWOSY6+DZ5bQGr/6iZU2/jXFezCsQs2q
	qJ74JGiL6S9cifev2316BLZMg7kcqmK/MeCf4inaiNpTi1EUyZIR0cphQnjG5Cwd
	I0a9kVxvcyhLyh7q4D3R5hfY+OKYRhpqcES1mNlyzq2BZKa15AQN0BKKMjX0qZh1
	cm4+ZO6A8pI6tX0X6P0dpiMLjRa8RVIr5pa5iuGhmE1S/Z0uHwkOTn5XEGZTqVKj
	I/X1s8xx9RALKl7618bSnsrESDNlXsE9TeBJGa7bvWug8F6Pw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1751879672; x=1751966072; bh=8OU9JLUQVNpyIawvwzcaSlN+OGH36SoBp7g
	lceAW72k=; b=clt8VSbMStR0xqaiUsXwLAYtFYbv77RhflgJyiMFZufZ5hmJnJI
	x0a6oxTDlX9HRYg7lF6pTlfFDbvN92bKZRQssw6O2GoYKzxR+3cRF4zC5mZjsh83
	oUb7+eOOLiUzLRIV9p5PrpEYjboXwB+hIcVFyOBE6LRzsO1pNCHCVNBFNlU4zjLV
	WirIraPBJJLOeF6sHCS5eYc2UV9+wH3acobmmiNsguqWW8P1KWp263mvcg53mwpZ
	MEeMwspOG6we1YzPGMEeWRWDX71wN178aOFmdRav/vl2kqyt5rtgwQv0WLjJMRH/
	sz+feQo3Wcl3tUyTG2cu9a8luoSHzjBSLbA==
X-ME-Sender: <xms:-I9raAZvi4EEwgf73ilxmkRTk3VJBWggRBHJT6Lyz52T4aXCltzw6A>
    <xme:-I9raAy9kIP6PWBLjEk9cftUdM_dMroxr2WWtCfccCNcJbqBJ7zKfukafIilNtGVt
    uS2GwObZPDuV2tv0B4>
X-ME-Received: <xmr:-I9raLIstthY4FlL_RwCL9Ez3VX-fzt7CPhbVuy0xT5EN3_VwE2JLOMDKIBZ2k_9bA4DU-1Z3diDuks7KTe42oBSLJzd8I8a71bFnPX0Jf5ys36dFTKoDA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefudegudcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:-I9raKqG4ySIk1Vhz5Uwf9WIa_bCLFUVNG-K0MxuY8sN7_2IqNXFIA>
    <xmx:-I9raKI8NjbJ8AM5ahY5yNsSKX_O1eUrS-3lB6G_sJoElbbTYj7vTg>
    <xmx:-I9raPQZ_2U8cnt8NfrFI-4nlX261tgGDWN2DZ-MCxYZPQQ0glt-tg>
    <xmx:-I9raJue2ydiKzFkeAKekTVSmnfy1lqi0rytO0MRG9x5Tu5XihA5zw>
    <xmx:-I9raKa5o_sEgoJ-3DaDJGlUT6eY0qWPtUBPfiKvo8taOtTtohIRfpeT>
Feedback-ID: i8db94900:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Jul 2025 05:14:31 -0400 (EDT)
From: Lillian Berry <lillian@star-ark.net>
To: linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	viro@zeniv.linux.org.uk,
	Lillian Berry <lillian@star-ark.net>
Subject: [PATCH v3] init/main.c: add warning when file specified in rdinit is inaccessible
Date: Mon,  7 Jul 2025 09:14:11 +0000
Message-ID: <20250707091411.1412681-1-lillian@star-ark.net>
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
 init/main.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/init/main.c b/init/main.c
index 225a58279acd..e47984871775 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1592,7 +1592,11 @@ static noinline void __init kernel_init_freeable(void)
 	 * check if there is an early userspace init.  If yes, let it do all
 	 * the work
 	 */
-	if (init_eaccess(ramdisk_execute_command) != 0) {
+	int ramdisk_command_access;
+	ramdisk_command_access = init_eaccess(ramdisk_execute_command);
+	if (ramdisk_command_access != 0) {
+		pr_warn("check access for rdinit=%s failed: %i, ignoring\n",
+			ramdisk_execute_command, ramdisk_command_access);
 		ramdisk_execute_command = NULL;
 		prepare_namespace();
 	}
-- 
2.48.1

