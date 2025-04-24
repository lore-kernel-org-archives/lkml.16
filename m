Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55B4383
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 00:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745453583; cv=none; b=K4YXCRr7ZF+b9MoaE/unfm8gPoI4MacgjvZ0kIeVz4QbE0fkIroa/38GSyYflHXyiNCZ4fxyltqJUjVgV6y6dWv3wVvv8HwLszIMXnUrVOhuH68o3G1XehDIUorZdNHBuSNx4Q/ftRGtrPOoNjkCQaFY4sNYdLghvwcChLilmFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745453583; c=relaxed/simple;
	bh=KXVwvi4uGf7fKHoCEnFJtgiP4j/zZbTnigzekKy7y4U=;
	h=To:Cc:Message-ID:From:Subject:Date; b=Sw17vESDwxzm5EyKAlGenTjCZKcfcLZQoBX/ENA+SuuwdO/WWe5uTIGZD2wvhUAXmsCuqYXwvz5AKgSnYVq6puKSnurVMkvXmtw6at9h3iBzJHKUJbde7t1TBXC4daQOaf20lEEpxuLd6PkxLmYHKM4pKBVnQNkmVV2glYYBcJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OSBzwhXl; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OSBzwhXl"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 8551A11401E2;
	Wed, 23 Apr 2025 20:12:58 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 23 Apr 2025 20:12:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1745453578; x=1745539978; bh=v7iUFaq4E3JkL9AyU+buOcFRQq9P
	UDS9u0Co2tFiTs0=; b=OSBzwhXls1aE7sxOO4HY86Oj72/3jL+nPb0y+UXu8Rd6
	m+SnB4xSiAyH2zTTtBT9hsorkee938wLxQvrPwIHvPvlpAgQ1NQjTv3maF4aR16g
	4tv/Ry9+3KiMSllhkevtUF3XCpQ324sfqbRVhK9HlTGbMI7WZ6FDjXTF/bdK6Xqd
	jzixL+uJU1VLmYVMKH8iPnvThtbTsuxiX1CzZmMZMe3q4jhy7aQ4gmv7C1bPLEOM
	YrjTbD9sE9D4l3efT+p02Hj+wDnoHJPaUJ5jVJLODZu2BtqlScfTHTWupXtedV6Z
	8cK6nVBZDxnv+vsA1AYcYMkby5fFcJv+ugMbofAxNg==
X-ME-Sender: <xms:CYIJaL5nVooWzxU0Av2ACtrrJvJFVccn-jjavW27hlt1hK4e8K2YzQ>
    <xme:CYIJaA78HDcRRSwwrv6-hhKgHQY8NrRBXn0GG92oDRpRa_DRySDhwGgUYAzZ4U6nk
    VlbT12A-O4qUBThSo4>
X-ME-Received: <xmr:CYIJaCc-FPqihXq5l36yQiXI4lj4nY5YUIoaJg1y6Dp9Wu8sLR7UYPHISe1PsvO-fHvyZfzsxGjr7utkWgNCUlRzgq5z_2ZflgY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeektdduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepvfevkffhufffsedttdertddttddtnecuhfhr
    ohhmpefhihhnnhcuvfhhrghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorh
    hgqeenucggtffrrghtthgvrhhnpeehfffggeefveegvedtiefffeevuedtgefhueehieet
    ffejfefggeevfeeuvdduleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgpdhnsggprhgt
    phhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehgvggvrhhtsehlih
    hnuhigqdhmieekkhdrohhrghdprhgtphhtthhopehfuhhnrghhohesjhhurhgrihdrohhr
    ghdprhgtphhtthhopehlihhnuhigqdhmieekkheslhhishhtshdrlhhinhhugidqmheike
    hkrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhn
    vghlrdhorhhg
X-ME-Proxy: <xmx:CYIJaMLsTA3LztnmjIobrDfqRjuuf_MujzA7YHXbl_q4clTecXWmJw>
    <xmx:CYIJaPLekoHuVpIyuCrFZpPpi1UUZ25LqIYCubrccwC-Sq6kNC7feQ>
    <xmx:CYIJaFz11APJLZI2Z23OCx3Ag6-OmSMJIyk_tLiRKKKaNB4k_k39Iw>
    <xmx:CYIJaLKximFEV5voY5SqIZm123qV2vAtTduyFgvXXh6PjUc1_cVwxw>
    <xmx:CoIJaNBMWSWp-3u6Q9vYhqD-R9eJ7Z0TdkGR98kB6FhY1C0z4jaZ_1M6>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Apr 2025 20:12:55 -0400 (EDT)
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Joshua Thompson <funaho@jurai.org>,
    linux-m68k@lists.linux-m68k.org,
    linux-kernel@vger.kernel.org
Message-ID: <d0f30a551064ca4810b1c48d5a90954be80634a9.1745453246.git.fthain@linux-m68k.org>
From: Finn Thain <fthain@linux-m68k.org>
Subject: [PATCH] m68k/mac: Fix macintosh_config for Mac II
Date: Thu, 24 Apr 2025 10:07:26 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

When booted on my Mac II, the kernel prints this:

    Detected Macintosh model: 6
    Apple Macintosh Unknown

The catch-all entry ("Unknown") is mac_data_table[0] which is only needed
in the unlikely event that the bootinfo model ID can't be matched.
When model ID is 6, the search should begin and end at mac_data_table[1].
Fix the off-by-one error that causes this problem.

Cc: Joshua Thompson <funaho@jurai.org>
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Finn Thain <fthain@linux-m68k.org>
---
 arch/m68k/mac/config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/mac/config.c b/arch/m68k/mac/config.c
index e324410ef239..d26c7f4f8c36 100644
--- a/arch/m68k/mac/config.c
+++ b/arch/m68k/mac/config.c
@@ -793,7 +793,7 @@ static void __init mac_identify(void)
 	}
 
 	macintosh_config = mac_data_table;
-	for (m = macintosh_config; m->ident != -1; m++) {
+	for (m = &mac_data_table[1]; m->ident != -1; m++) {
 		if (m->ident == model) {
 			macintosh_config = m;
 			break;
-- 
2.45.3

