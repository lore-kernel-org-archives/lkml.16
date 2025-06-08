Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658A17081A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 23:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749425899; cv=none; b=EBGylvj4F4YgTrwJ1gNJrA9DRPsRke9ZCZHuXnkabau+OSzsjGn8PF1TUxD1MJAeouz24GHHLsczl0fTjg4zFlqMPnLxkFN/vESzGyB5w+cRKDLnjtJ2PKHYsyNXYw0wlYAIGONijxDe28GZMFIHhMv7KtNaMdhC6I8E8M0X9bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749425899; c=relaxed/simple;
	bh=lsT/fCfjpBnItBtp+Cy/V9ovM7kes8PYz6L+AR2m0NA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MmQaFdvfDsK5c+RqWpZJ4V/eO1BU2ZlHNC5qSU0qAtU3FSg/edvLpvORctuKo53HzWrz8lFo4BdpunFlI/wq2bE0G/bna1TFnOGlzX84BEyZIj4SIOevQNKaprYUu1Fsa4bbwzJ3nZ+bm2SKAsBXE9AaR8Lfz8FIOEh0/q6CTpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=gdFrrAoF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rLPJNKoY; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="gdFrrAoF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rLPJNKoY"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 52FAC2540132;
	Sun,  8 Jun 2025 19:38:15 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sun, 08 Jun 2025 19:38:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1749425895; x=1749512295; bh=bNQm/MRDMb
	bD83iW9zl9AvGib4jDg2NSsHRm/axzsA0=; b=gdFrrAoF5yVIIfbw795hLJT3Hs
	ibVpvgZOLbINZRJjDBAfF+ptj2sBoY4+ga8QVmYwm+qncHta5+41Hb5TWtfCsb97
	HaH20u5IAvzUZwhWYNsWvRvKoApqP0jKMQVOy1NmPdgP0qIT060eqFNRvfUBrZHN
	3NzvqYYQPvets5JQbO/607FHRUvznBULbq+GWTVMB8oJCzQho8mQUdFsmjnRD7Xl
	YHz3y4r8T/4hLsEsrde6H4XyCGCLQc+ZjpqwBftRpF5498YtTJtNpHNn8OYU6xqr
	GSPlSxKwpvpzkwLY0D9Iv6qQoB+k2FJ98ZaynY/vzyzKRqE6nIIk2Pspomfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749425895; x=1749512295; bh=bNQm/MRDMbbD83iW9zl9AvGib4jDg2NSsHR
	m/axzsA0=; b=rLPJNKoYheg0S60SAEGZl4hw8c2vFPAOTFJPdq46+ejdqHZtYIZ
	BBB5ZJ7m6nZnZIr0c4evkymGv1RN37y0HCZ9hONGMFZnhUMTdhRMYPaEXBSFodwm
	f+qGr/cHYuAXMzBykhfYSgQQOmufJKnr3D80fJuog+BbVUKYmoNuWnel+o6Puh1c
	S7glnH5WU2B89IA2H92QS6AuYFzCr2RlNxebCwNNdpn+1WjZfjZe9Unk1hJ0VWBa
	Y3pXJd462tR2AwpDEa0HKFmou6OsZsnZIeHRXSLn5KGxkEpMKiVQXrEMEK/2+G4H
	fe1lZzJTWrNJ6UoHp+9+YQQQI7eJuXp1rQA==
X-ME-Sender: <xms:5h5GaLif3ExJ6XTHAAcD9wZMyS6XwUVEpHbcXqYWVqk9uCSOyf-MoA>
    <xme:5h5GaIBtBQdAaYr43aw562stCUHiLPa5a8KU83mrSFPgK78GTmO-_UJ2g5hQUAaYp
    eqmmXmuMF3_QibQMxw>
X-ME-Received: <xmr:5h5GaLH3EMeSGlTrN8uCzFqiRv9m2csD_SpCHbLsS6TIRKpnTmRRmV842F_GWtw2Wyq-sYkJM18LeY--f4wVI1pgf6GZyit3EOEzwYMq4Mb1g-g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdekhedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohht
    ohcuoehoqdhtrghkrghshhhisehsrghkrghmohgttghhihdrjhhpqeenucggtffrrghtth
    gvrhhnpeffvdeuleffveekudfhteejudffgefhtedtgfeutdfgvdfgueefudehveehveek
    keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehoqd
    htrghkrghshhhisehsrghkrghmohgttghhihdrjhhppdhnsggprhgtphhtthhopedvpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigudefleegqdguvghvvghlse
    hlihhsthhsrdhsohhurhgtvghfohhrghgvrdhnvghtpdhrtghpthhtoheplhhinhhugidq
    khgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:5x5GaITo0Rr_d0lQw0LyJXxXZZsGcmMXNFuYciqs7PANF1vuf0g6hA>
    <xmx:5x5GaIxcOhD0Tb4aJjQADjlglsEzStZ45-l0FMdg8kfjCUmggRFyzQ>
    <xmx:5x5GaO7L9ZF44cs-hafzEJs7-FSGkZEiR9a2-ZsFzqJyklAP35Aa5Q>
    <xmx:5x5GaNw55dBxc9Qs8iO7rU95cE1TAIxaq3WysIgo-yThAhHZJRwKhA>
    <xmx:5x5GaNiOR4F3pLkAHE9QglnvFDsk5tC8Pn-nI41Am9Ebj372vfkUF7nR>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Jun 2025 19:38:13 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] firewire: ohci: use from_work() macro to expand parent structure of work_struct
Date: Mon,  9 Jun 2025 08:38:07 +0900
Message-ID: <20250608233808.202355-2-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A commit 60b2ebf48526 ("workqueue: Introduce from_work() helper for cleaner
callback declarations") introduces a new macro to retrieve a poiner for the
parent structure of the work item. It is convenient to reduce input text.

This commit uses the macro in PCI driver for 1394 OHCI.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/ohci.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/firewire/ohci.c b/drivers/firewire/ohci.c
index 27e3e998e6fc..40313a3ec63e 100644
--- a/drivers/firewire/ohci.c
+++ b/drivers/firewire/ohci.c
@@ -1190,7 +1190,7 @@ static void context_tasklet(unsigned long data)
 
 static void ohci_isoc_context_work(struct work_struct *work)
 {
-	struct fw_iso_context *base = container_of(work, struct fw_iso_context, work);
+	struct fw_iso_context *base = from_work(base, work, work);
 	struct iso_context *isoc_ctx = container_of(base, struct iso_context, base);
 
 	context_retire_descriptors(&isoc_ctx->context);
@@ -2028,8 +2028,7 @@ static int find_and_insert_self_id(struct fw_ohci *ohci, int self_id_count)
 
 static void bus_reset_work(struct work_struct *work)
 {
-	struct fw_ohci *ohci =
-		container_of(work, struct fw_ohci, bus_reset_work);
+	struct fw_ohci *ohci = from_work(ohci, work, bus_reset_work);
 	int self_id_count, generation, new_generation, i, j;
 	u32 reg, quadlet;
 	void *free_rom = NULL;
-- 
2.48.1

