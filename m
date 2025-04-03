Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399C22CA6;
	Thu,  3 Apr 2025 04:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743653368; cv=none; b=FSmWhHxGZ20M9lIe0j7it1hGKI7Z629ywx+Idvp6i923qSxE8BUm5PzQX1FTGSeQnusVe6IFWqMukIwFesAMHilvfuXFgW4c8prwSU1eBJHHIfZ4Dto9ZBpAhMYb/onoQh69lO90Ov0KHPMFetG4NCRdoGcdfxm9IrLnAkBtwAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743653368; c=relaxed/simple;
	bh=c2RkKwq3/C/0PD/gh+liCMQ5jVdJrrvUA8Of0RdApvA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=chI0rLTNlQ5vR3EIVvun620t7vqKjAaIxfVWBNj7yxNXi1yFBuAbNwpgUqNnCOWaB7eopcELp0Wm+Yc4fy9iMauyItAFizec+awZtHUxcZfktiFy/F1UFq3Hkeb5A+ycEZZVkFKuasvgApXQ+ybYNjzSGPGC0zWyAsGaRjfGer4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arp242.net; spf=pass smtp.mailfrom=arp242.net; dkim=pass (2048-bit key) header.d=arp242.net header.i=@arp242.net header.b=LwBKeQUV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=xgiUBazu; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=arp242.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arp242.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arp242.net header.i=@arp242.net header.b="LwBKeQUV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="xgiUBazu"
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1AF0111401D9;
	Thu,  3 Apr 2025 00:09:24 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Thu, 03 Apr 2025 00:09:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arp242.net; h=cc
	:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1743653364; x=1743739764; bh=ObwGaDyomkVUjntLDINpY
	n/EaMWFq6k3+MIClMLrR24=; b=LwBKeQUVXQG1C7A8On7rdlGjAvMH9Djxt9j/d
	GpVx+F+muL+aSiQHJHhFbmzSLssFr6aOp8VegxJZF8J7jQiRYr8FpNxwPK+q74Q4
	th0CcCF/k/JhKjSkHY8vbnxmRYxEv6OoVn/WopBu7tZdwSGJnGPVyxOzwfjz3591
	dRAWRkdRbZpCWne44UJvsFbuX/PwU86gpSWIPoq1jXwZFZANr4JbvQEyfRyYr9i9
	HT5B5tgVfa4jJLy7X34V9jGxeL1xLo5roiCvtAhMTEXxFfv7sV/aSv1CCDjyBdBj
	zezarRNagZpzfsYNzZLWSxa2dEBks1yVyGE5rQMvmhy724hJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:date:feedback-id:feedback-id:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1743653364; x=1743739764; bh=ObwGaDyomkVUjntLDINpYn/EaMWFq6k3+MI
	ClMLrR24=; b=xgiUBazuCL6ORVu0QyjEE3G5qmOfWSI9a/PUryaCN1/wNjFWemz
	k9IABBknS7lTJEF6mp8OnrXdR+jtcyC75bx5KQqbgwYiK0LFrU3SoZtdh5hN9fTB
	nw9QqEzCvyJcK/oV5M0fe6CKDs7+yT2KVE8Qos0Rcw4f+/6zPInP3i0W/xtNAYsJ
	ZH8hfwTrBJSbAIKdVjcEpNBH2ICnSH0LlaZmrpUT6h5tQDaJS7Hje5Ky29UrjpIi
	cA9Wj13ysRFbPEXLFZ90/jeIpA5ES+U8yCATrP89eYXMNpbFlqODABAnE4uTtbEp
	QXIrzZu0o9RWyjimoLYrrvgJsu60Q2Rhzmg==
X-ME-Sender: <xms:8wnuZ9NfAHHXVmcV9tkCnmhrVUKfIAPaQuXT7ye_aYb4Bi8RHCUU1A>
    <xme:8wnuZ_96ugsLu4IjL9htLucRm5l-kq2IHyC2LLZ9L1QvRV0FbRvSqAo6z2WCC0NBh
    dVR2GosXVDPMzjvlg>
X-ME-Received: <xmr:8wnuZ8TQWwUbzHIAr4USOY5JsSHxgkw0XnfGHeHLlAwUGhQuu_sHTQEqq7s2wQosbayqAM1uY4bBcGWCNFgF5M-PthrCCb0NHiBIgBRwJwpc-OH35wRIGEoKK3vleKn->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeejheeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvufffkffoggfgsedtkeertdertddtnecu
    hfhrohhmpeforghrthhinhcuvfhouhhrnhhoihhjuceomhgrrhhtihhnsegrrhhpvdegvd
    drnhgvtheqnecuggftrfgrthhtvghrnheptdehteekieeffefhjedvteeffeevleekhefh
    veettdeufffhfeeuvdehtdfguddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepmhgrrhhtihhnsegrrhhpvdegvddrnhgvthdpnhgspghrtghp
    thhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhgrrhhtihhnsegrrh
    hpvdegvddrnhgvthdprhgtphhtthhopehhmhhhsehhmhhhrdgvnhhgrdgsrhdprhgtphht
    thhopehhuggvghhovgguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtohepihhlphhord
    hjrghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehisghm
    qdgrtghpihdquggvvhgvlheslhhishhtshdrshhouhhrtggvfhhorhhgvgdrnhgvthdprh
    gtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhn
    vghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrh
    hnvghlrdhorhhg
X-ME-Proxy: <xmx:8wnuZ5tnO3evJPBjdPWIeXSzuwmSgGlgvjY91zuZwmE4hagw43q3PA>
    <xmx:8wnuZ1cjiEyBf8gvGTU_Ji41CJhKotAkncuZK6VQjDF2JvR8zovA1g>
    <xmx:8wnuZ13S0WzAbwdPfC6bCthplg_yZ3X5spepJvOyOjH-Nez1T_WwPQ>
    <xmx:8wnuZx-xr94YlQJKcOcj0y1F9iHhNySz252z2JiNRS_CTi6X8rWDIw>
    <xmx:9AnuZz7WiTNm0trX80mv8-A-E_bsVuhfxes_LCp9PjHOd0NWYqGMnYKR>
Feedback-ID: i27f8409c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Apr 2025 00:09:22 -0400 (EDT)
From: Martin Tournoij <martin@arp242.net>
To: Martin Tournoij <martin@arp242.net>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: thinkpad_acpi: Add charging indicator to the list of safe LEDs
Date: Thu,  3 Apr 2025 05:08:46 +0100
Message-ID: <20250403040846.7834-1-martin@arp242.net>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "tpacpi:orange:batt" and "tpacpi:green:batt" to the list of safe
LEDs. These LEDs are next to the charging port and indicate the status:
"tpacpi:orange:batt" when charging the battery, and "tpacpi:green:batt"
when it's near full (typically white these days, not green).

I don't see why it would be unsafe to enable/disable these LEDs: the
only thing you lose is a LED telling you if the battery is charging or
full. These indicators are informational and not critical

I got a new x13 a few months ago; on my old x280 the firmware would
automatically turn off the light once charging stopped, but on more
recent models it always stays on unless I disable it. I need to compile
a custom kernel now just for that, which is rather a pain. So I would
like to propose to expose these options.

Tested on my x280 and x13 Gen 4 AMD.

Signed-off-by: Martin Tournoij <martin@arp242.net>
---
 drivers/platform/x86/thinkpad_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 0384cf311878..edf7c97aeef9 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -5518,7 +5518,7 @@ static const char * const tpacpi_led_names[TPACPI_LED_NUMLEDS] = {
 	"tpacpi::unknown_led3",
 	"tpacpi::thinkvantage",
 };
-#define TPACPI_SAFE_LEDS	0x1481U
+#define TPACPI_SAFE_LEDS	0x1487U
 
 static inline bool tpacpi_is_led_restricted(const unsigned int led)
 {
-- 
2.49.0

