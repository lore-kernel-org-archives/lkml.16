Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DC62EA737;
	Fri, 20 Jun 2025 18:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750443090; cv=none; b=lMknaz5k6m4NDolhICQ/S4dANO9dFDSiSH2QHRTL973ThoRM/zjRHqnQz7sPsElzqY47IGQHAf7zaPZqcpv8N6j/2fpnv7yfjQi0O0gNjTVCdZOCCF0BxbnOQNO08MLycdX64/tVpOyqZbhaafziNjsXLaI5SaZ5T1a60ZpezDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750443090; c=relaxed/simple;
	bh=lSokGwWrTbP2w0Z66opvrz8zVvFcpyUebe8RxlTyZE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PmYwJ0I8ni7M6iWaMfsAQY57r9xkQino0h6K/L0YWzYhKEJpgcb0SOSkfWLGOu4E8C7RZUNQlU3BoH1esu+pQyL95gv/W2XBunoiY3RRTyIo9Vg1DPp5JcBIdD8wbzP51ZsTEnu7FtHY17idTiskLyqkF20DF8uhgTJPJoT+Tcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=gljf9ICt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pjqcciv+; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="gljf9ICt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pjqcciv+"
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 8CF3E1380452;
	Fri, 20 Jun 2025 14:11:26 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 20 Jun 2025 14:11:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1750443086; x=
	1750529486; bh=7Ykv1WdH4LN+2KFW44tucEmnHyrkAkxKCk4JhHN/PwA=; b=g
	ljf9ICtn+X+z8zxwNDRDewHfl8ECDDVBVsq43S2FcVliq8K4Z50LTYM5DuJF/q9Q
	Z5kvmjaHYd7QgWVQwev9X3blbxmtYIKSgb5sgLpQ4ccDgNHUvug+DTgpyDrrF3iP
	fVLjdEtOOED0Q8zEGx46hveht3eZK2M4DzvfG9ykLVMSJP0yUrJSB5s7hqaqzIay
	JquovmmNJwwJocdCE+p3ezpsm+5yXeMIi9VY1qOMtsXNTxqX+YneGfJ2AB3KtUYL
	RVg1vTT+5FveGGvV3Y7Vxwjwoab6TnqO/9mUPcntxo0HnAjSP7C24bkaY4cQIw80
	/3eM8IhFL4kEyGWzpn9IA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1750443086; x=1750529486; bh=7
	Ykv1WdH4LN+2KFW44tucEmnHyrkAkxKCk4JhHN/PwA=; b=pjqcciv+lBW2Htzrp
	PhK6WOlkPxS3Y+aCRwV3FE+A0anC5kWthJnQEexiAFCAnnHTrR8mcb8e7KkdaPLZ
	oG0Ucun8Gs+xF6916w7OnGuVfXXVkHsNHFHzufCVKF6u5DtAsA0P7lOngAF9kYj+
	/+KP6pXAtZ1INbYqgvO/qbo+3mPkFTl+daBTveyswVhdOKtmN8kHHg1GS3rte3eD
	4htvSsWeXa1nqtPGw5tMDQrCG2r6FYs+uPr8K1X87Z8jRhYhCEBReT0+l8LlMao4
	NwAr8TvwODvDEV9CFy2SVxPFyBLoKdfQwTTH3mJStagmatbEcDX3egFNO1o5pqds
	Nh/aQ==
X-ME-Sender: <xms:TaRVaEsWzAmJI77s8IdbqvkK1mf4a1mchrx7sUTOFCvGKVkzBD284A>
    <xme:TaRVaBf8Bmdoknykbe-Pvp4aI9bOVGG5o3FO4SwzlcMDNkL3sWOGvaXEhRH_FdWsT
    bOItwbrTH6UL6WzBko>
X-ME-Received: <xmr:TaRVaPxXCnMQlFLIzZppO7It2ZuqggJrc6ASr-jyLiGMvX2F3XgOxmOYUkfXHW0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdeltdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegoufhush
    hpvggtthffohhmrghinhculdegledmnegoteeftdduqddtudculdduhedmnecujfgurhep
    hffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrrhhkucfrvggrrh
    hsohhnuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgeqnecuggft
    rfgrthhtvghrnhepjeeltedtgeeigeekffethfduheevtdfhveejheeukeejgfdvvdevve
    egteehieeunecuffhomhgrihhnpehsohhurhgtvghfohhrghgvrdhnvghtnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhpvggrrhhsohhnqd
    hlvghnohhvohesshhquhgvsggsrdgtrgdpnhgspghrtghpthhtohepkedpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsg
    gsrdgtrgdprhgtphhtthhopehhmhhhsehhmhhhrdgvnhhgrdgsrhdprhgtphhtthhopehh
    uggvghhovgguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtohepihhlphhordhjrghrvh
    hinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehisghmqdgrtghp
    ihdquggvvhgvlheslhhishhtshdrshhouhhrtggvfhhorhhgvgdrnhgvthdprhgtphhtth
    hopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepghgurghmjhgrnhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:TaRVaHNKpy9uwYt1mSbzQ3erixZ7_DCFs0f0U5QzJHJyHVR1hroftA>
    <xmx:TaRVaE_JZS8VdoR3drAANYThAk_Tme6AnZrt1hW6wsQhuadToUHMhg>
    <xmx:TaRVaPVM7jjGF_m3UvZpsvrnO4esCddvi8bKvAVqxWpfgVLeiKPlnA>
    <xmx:TaRVaNdzFDFMbWYvh26bsrpQPvMJ3NjvsYncgmFdtAg8-btiUA_pPw>
    <xmx:TqRVaCM1BHo8XsBPrgUl0i_IgRTYo3wVf2YFlu6KrMe1a3X93Yg_V4_e>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Jun 2025 14:11:24 -0400 (EDT)
From: Mark Pearson <mpearson-lenovo@squebb.ca>
To: mpearson-lenovo@squebb.ca
Cc: hmh@hmh.eng.br,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Damjan Georgievski <gdamjan@gmail.com>
Subject: [PATCH] platform/x86: thinkpad_acpi: handle HKEY 0x1402 event
Date: Fri, 20 Jun 2025 14:11:10 -0400
Message-ID: <20250620181119.2519546-1-mpearson-lenovo@squebb.ca>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

2025 Thinkpads F11 key launch the Intel Unison app on Windows,
which does some sort of smart sharing between laptop and phone.

Map this key event to KEY_LINK_PHONE as the closest thing we have.
This prevents an error message being displayed on key press.

Reported-by: Damjan Georgievski<gdamjan@gmail.com>
Closes: https://sourceforge.net/p/ibm-acpi/mailman/message/59189556/
Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index e1c7bd06fa12..2155ec682b08 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -3295,6 +3295,7 @@ static const struct key_entry keymap_lenovo[] __initconst = {
 	 */
 	{ KE_KEY, 0x131d, { KEY_VENDOR } }, /* System debug info, similar to old ThinkPad key */
 	{ KE_KEY, 0x1320, { KEY_LINK_PHONE } },
+	{ KE_KEY, 0x1402, { KEY_LINK_PHONE } },
 	{ KE_KEY, TP_HKEY_EV_TRACK_DOUBLETAP /* 0x8036 */, { KEY_PROG4 } },
 	{ KE_END }
 };
-- 
2.43.0

