Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB568BFF
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 23:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749425897; cv=none; b=ZYKkuYkw/D2TTpan67GYYNcUkHYsmtftyKDKCcxT2FrNbwTweNIZ39dhzp6hkxTQjfndRocUmj2F3t/u9myOe2803styUxfkgLAvmosUNO01OLiPWAxdGxKd/3l2weMD5nhNAzwIh/IrEPccCkt/2mvw9Jorad4ecbACD94NCXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749425897; c=relaxed/simple;
	bh=cEu9CCcX778eVSqvJkvGz139e4Hply15sFkCs/JuvpE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GFktfbVtAZrCINZIZSxHhHQHkYMKviEb84XDm4V0UtM5TJslkLlJjEWswH9JszyBQ1dLdfqXVW48Kq4IHCJc3dcq/As7OFLRge/TLDmpGvgKUoEp85IcwxVRGzTavzu1cBvaSGpi5a9FAuMPIAOEZraAE/T0zaRsRekgRaPS/cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=kxE+RtcK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WAir7bk4; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="kxE+RtcK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WAir7bk4"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id A4A4E1140155;
	Sun,  8 Jun 2025 19:38:13 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sun, 08 Jun 2025 19:38:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1749425893; x=1749512293; bh=asezo7wgD0
	P09a8YPAx032aUXq2d/5SDAKgsL4qpYEk=; b=kxE+RtcK97ujbPllUahf0y0/gr
	GGVX4rc3y21KqCpSJnbstL8pLGYMAMV7GYvTf+IeftJhoDFUb5ozSvuAQ0mQyOQD
	Ow2kVHSQcU2tal3Zt36ESO8GQ4ogtJx5pjwx313u9jwL4WlUaZMDck0nK+c/fHkn
	fi4sgnEkDVcbGh2tKKUPKeWkOpUybYZZDqUBzuOudfOwfbClYj/tU/VOgG1/5r0W
	0MEyUd+0b/7uCP+lH/WyN5PHxZbn5XwcEtb/xeDD+gOz/Sjg3IXBXgwIwxLD0v+d
	6FD6f9ebRLerk4wJtnVM0Dn0jCyXHMMCPI15rXw+QT2N+k6y3JDqhY16Y+bQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1749425893; x=1749512293; bh=asezo7wgD0P09a8YPAx032aUXq2d/5SDAKg
	sL4qpYEk=; b=WAir7bk4KhcidaUg8WjAIUKJ/yf3xNgPHugJOYNRctPxGx5pVvM
	L1zkvk+Ss+9DSnJldO+9r+s8JTUXAzkpaLRkc4flelB09xmkNAskvG1SkqYM7aCU
	HQgNf7XJ8DO4bBrJQEGvUknAWD1CR2f9pmlH7iD+dL4mnK5SR2EHlmMnH1m9Hkfx
	+YfGh4kwHA4924MNN/6MDx2Fpd1LxTjg1YIBFn8Vz6h8rXjrEVVaqc0H3ixkQeHH
	x1HD9KCNy2PoHSLrcWqLePZGP5qfSU6LzQtTmlU9bx+fLf3IUg9S/T7G7uCzfL+r
	4flBi75jP09tH7proNDVeUlWKvG5SbPyhXA==
X-ME-Sender: <xms:5R5GaPSCOJYN777DjSHv0RsiP-Pk0Rf8bhzh-C5agCd_-PtMPbaPlQ>
    <xme:5R5GaAwWnVQFs6CMP5hueE-F2R4u6T0JVMueyx8mg4THH0lAcPQPWmqMqxwakZ4iW
    nkgCQakoJCYbUoDMj0>
X-ME-Received: <xmr:5R5GaE2DIdsl-CiMBE0QsJTjgcJ8h3JvpK2DPWi2Hi2rKP1NQ4-oV_gKio4A7x_hzKEiY0yRAOYErNMH6MfufeFkNg2B9mFL0je8SkRNS05rKUg>
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
X-ME-Proxy: <xmx:5R5GaPCBG38vlIUK7hUS7GZp8lDi0z9_rztHSFZN8IkyVSpng7OY_Q>
    <xmx:5R5GaIi39_q3D5D12jiZEQOK8yODFvtI7i_CEfBM1P6XpEsn6eEylw>
    <xmx:5R5GaDrxowyjaW86XagxknqUJidQ3EIjGbf5uHep28m6lIu8VBFf3Q>
    <xmx:5R5GaDhjncyNmZ3n65JmFJ8Krq8mrHF68orDvJGIsLemKnToVqd4XA>
    <xmx:5R5GaLVdlzjt2VW7Bfc4-ffIQEO6swehJJwdG_9vj-lLZUOm94r7sVKp>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Jun 2025 19:38:12 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] firewire: ohci: correct code comments about bus_reset tasklet
Date: Mon,  9 Jun 2025 08:38:06 +0900
Message-ID: <20250608233808.202355-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tasklet for bus reset event has been replaced with work item, while
some code comments still address to the tasklet.

This commit corrects them.

Fixes: 2d7a36e23300 ("firewire: ohci: Move code from the bus reset tasklet into a workqueue")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/ohci.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/firewire/ohci.c b/drivers/firewire/ohci.c
index edaedd156a6d..27e3e998e6fc 100644
--- a/drivers/firewire/ohci.c
+++ b/drivers/firewire/ohci.c
@@ -2528,7 +2528,7 @@ static int ohci_enable(struct fw_card *card,
 	 * They shouldn't do that in this initial case where the link
 	 * isn't enabled.  This means we have to use the same
 	 * workaround here, setting the bus header to 0 and then write
-	 * the right values in the bus reset tasklet.
+	 * the right values in the bus reset work item.
 	 */
 
 	if (config_rom) {
@@ -2617,7 +2617,7 @@ static int ohci_set_config_rom(struct fw_card *card,
 	 * during the atomic update, even on little endian
 	 * architectures.  The workaround we use is to put a 0 in the
 	 * header quadlet; 0 is endian agnostic and means that the
-	 * config rom isn't ready yet.  In the bus reset tasklet we
+	 * config rom isn't ready yet.  In the bus reset work item we
 	 * then set up the real values for the two registers.
 	 *
 	 * We use ohci->lock to avoid racing with the code that sets
@@ -2659,7 +2659,7 @@ static int ohci_set_config_rom(struct fw_card *card,
 	/*
 	 * Now initiate a bus reset to have the changes take
 	 * effect. We clean up the old config rom memory and DMA
-	 * mappings in the bus reset tasklet, since the OHCI
+	 * mappings in the bus reset work item, since the OHCI
 	 * controller could need to access it before the bus reset
 	 * takes effect.
 	 */
-- 
2.48.1

