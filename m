Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6DACA6F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 00:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750121007; cv=none; b=aQsIWlY9rixn21YrnpBivKZUM5+2xSMt9YH1n/iyNs3Z6lXXln61PJ6lBAk259yOk9dCJxnZzvDIBZtqZbZEG8HDOnf7hVKpMOdpPiJEItv3BT8Cq5LpSEa7Xi1ZEL8DQEOMqumWYQiaXusuOwLcILsvDliioRMYFtQAPAZCQVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750121007; c=relaxed/simple;
	bh=AXjANP+QTV9xJ22LxRtI6vkW085Mv49hxd2w9JLi3Ps=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=joOqxZByijSNhEJ6ZfTBc6gdGFpK3VCTclcs20Ermbs6qBVixFqRiVydwnfbg3zN71+O1jF9KSMuJZcg7hFn/MeANvI3brlnBENFjrgq0W7qfd454Pvz+J0alvJeZm2cTkcsyWLOKMH+k8GqqdPKKB+Y9Evn7kSoLgAMuDOiMW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=WIoxA9Du; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mh1V43dU; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="WIoxA9Du";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mh1V43dU"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 58AE71140120;
	Mon, 16 Jun 2025 20:43:24 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 16 Jun 2025 20:43:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1750121004; x=1750207404; bh=Pq8UPFVGwX
	JP+/8WPOkW4/7yYbQFRvJdhInZhUazx0I=; b=WIoxA9DuMw2FAi6DLzhWCUL66F
	ShE1HPKu0WazAOd0flrA56TqnG6bwi/HGm9BdIUr0kr77f5F6Oh2GXXJqy4bda8q
	Q4dAp8mF0ftrWmacVvFxKpHIO+06/Iv539vGm0GQkaDMfF72h2tmshtESR1I1rXF
	RuaYfGUSvqw5AmQP7kgQI1xEWwGcj6bynVW6ICfHp8Z+ifERWoyNb6cW7diZO7Rn
	XLJRoytI+n0oaMnPXX7T4INCPvFoxXg9QHEIyJcVemnnwiUr6FhcQsA0umfES3pD
	BKdB7cF/ZJqV6Eybk/GlVcOm73ZRLuDov2f8fnuFIlyMQJRDm7M6mLSFXbCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750121004; x=1750207404; bh=Pq8UPFVGwXJP+/8WPOkW4/7yYbQFRvJdhIn
	ZhUazx0I=; b=mh1V43dUIke6oMuiERrGUI2RoKLICzg0kwEPCwkhgVoWWg3EZ+W
	HxZzy9i8dzWkKMEwgWXpYlrIDEKYs729G1ncWa6wy8uGMlE0alZkJB+UQOMPvGAN
	2ywldmEOtuND14DgiFNBKlNvSWH493+w6w2uU9XP0E+BSa86wfJptlA0cYzUYwYt
	UfAN7gY/3Xmqn+OLcQoVJfKckBcyCS4N2qczDcKHq0zPNYE0pmujlDa1qDccWVQF
	ArDKRElejn+Nje4kUbO9Y/HgM+t/boc5xlfoE+uLuoT+GvMADAaasoOkJ5eqbNwr
	IrdlAa8Dj/0Ay2dTkl4wdt360suV5wnhXfg==
X-ME-Sender: <xms:LLpQaG17eMDAbe6eEfR1zCjg7_qEQADzJE0IiXLnW3aboXg7leX0nA>
    <xme:LLpQaJGXosj-vd4HPLxioeA10QU0ZZtJ4kMMwD8LZi6mc4BAOjZebCHAxJ9YdcnFb
    WijaZPnCsozD94dgEY>
X-ME-Received: <xmr:LLpQaO4mc_CqBcjmzmsuPrSregPmp2aIN9d1k1WeLaUdSReSXpBqBfGzCelkoCuvivmJFrboeytRK4alrdxcw_mwNy4fm6MHYwikA_ctibSC2A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvkedthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhephffvve
    fufffkofgggfestdekredtredttdenucfhrhhomhepvfgrkhgrshhhihcuufgrkhgrmhho
    thhouceoohdqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjpheqnecuggftrfgrth
    htvghrnhepffdvueelffevkeduhfetjeduffeghfettdfguedtgfdvgfeufeduheevheev
    keeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepoh
    dqthgrkhgrshhhihesshgrkhgrmhhotggthhhirdhjphdpnhgspghrtghpthhtohepvddp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugidufeelgedquggvvhgvlh
    eslhhishhtshdrshhouhhrtggvfhhorhhgvgdrnhgvthdprhgtphhtthhopehlihhnuhig
    qdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:LLpQaH3TTGK2cXigcEj2UKWMmZ256iYzHDJauWazxfvE9xHcszxUgA>
    <xmx:LLpQaJEeOHrUxE8qlwtCqi_jOioGt5-Tqovf55NlpxKFn_qeZrHK7Q>
    <xmx:LLpQaA_m7eGQCGi1WDsc3rcPt38k35XI0ftU1HWB-qVO152ZtnFblA>
    <xmx:LLpQaOn_bXkjBWhFAGCS05_q9MgOt0myGzb1HB1w6VkZnsSBqEW4VQ>
    <xmx:LLpQaPW5LTVTfmHVxGpW6-lEUBZ68ZTrJOA-8igyqV4cnVs0NG8oI1C4>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Jun 2025 20:43:23 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] firewire: core: minor code refactoring to localize table of gap count
Date: Tue, 17 Jun 2025 09:43:20 +0900
Message-ID: <20250617004320.477421-1-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The table for gap count is accessed by a single function. In this case,
it can be localized to the function.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-card.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/firewire/core-card.c b/drivers/firewire/core-card.c
index b3e48ca516fe..aae774e7a5c3 100644
--- a/drivers/firewire/core-card.c
+++ b/drivers/firewire/core-card.c
@@ -273,10 +273,6 @@ static void allocate_broadcast_channel(struct fw_card *card, int generation)
 			      fw_device_set_broadcast_channel);
 }
 
-static const char gap_count_table[] = {
-	63, 5, 7, 8, 10, 13, 16, 18, 21, 24, 26, 29, 32, 35, 37, 40
-};
-
 void fw_schedule_bm_work(struct fw_card *card, unsigned long delay)
 {
 	fw_card_get(card);
@@ -286,6 +282,9 @@ void fw_schedule_bm_work(struct fw_card *card, unsigned long delay)
 
 static void bm_work(struct work_struct *work)
 {
+	static const char gap_count_table[] = {
+		63, 5, 7, 8, 10, 13, 16, 18, 21, 24, 26, 29, 32, 35, 37, 40
+	};
 	struct fw_card *card = from_work(card, work, bm_work.work);
 	struct fw_device *root_device, *irm_device;
 	struct fw_node *root_node;

base-commit: aef6bcc0f278eba408751f8b3e0beae992e9faec
-- 
2.48.1

