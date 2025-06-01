Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213D6199E8D;
	Sun,  1 Jun 2025 16:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748796155; cv=none; b=fgBUGPpx1yT4+XuQ7dnObfWY/G01RlmiRjc8ZZFBZCkqjcAjf8Wwkf3CxepnFOH1w91wFXOx8KtfN1gs/PqC0CmPKh3ECLMTpGtKeiyTrOSNzPGHzne0GzlxM2Sxezh82tbj1XVAj0AmGEhN/58+IWWndXNmQX1B3e9Xy9yID1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748796155; c=relaxed/simple;
	bh=IO9YWh+s7Jh/P8OXgcwMFXV/qCnvM0P7RaQ63NcKF90=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type; b=ieazZlWhhBm+bxDuIyHsGuw3/SwNqrwSXyj83e8Pt4QUGm2BRkMXXgoU6H53SpXJ+A37hqT/Kw5zn1jSxONJKbo4pGrNZLceixHFJJlWQU/6P7ysmv2a1nGDypzVK7pCMZbte0wm5L9cauM9n6AvVcXiaivvZdNKGfB48IHUrlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dmeh.net; spf=pass smtp.mailfrom=dmeh.net; dkim=pass (2048-bit key) header.d=dmeh.net header.i=@dmeh.net header.b=Qgn2G3WX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XOrEa/cm; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dmeh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dmeh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dmeh.net header.i=@dmeh.net header.b="Qgn2G3WX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XOrEa/cm"
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id F320D114007C;
	Sun,  1 Jun 2025 12:42:31 -0400 (EDT)
Received: from phl-imap-04 ([10.202.2.82])
  by phl-compute-02.internal (MEProxy); Sun, 01 Jun 2025 12:42:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dmeh.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1748796151; x=1748882551; bh=Ko
	S6dWu8Azs2CNZsjoC+TDSrU+83nlganqaQ/svEQ3Y=; b=Qgn2G3WXzYzNP7pe6+
	QSrn2vUhVzlJ4E5kE3StMbwuikYgtqSk9phBe/hyHQMmWurDJ61k1x186SumytEI
	rftxzvtdnVdROTwcFbNIdf03KDcL/4TznAMo4R+uY8P62XV1T3IhKBA5/oecBR1V
	ar3Sy75QlrSP509TM2zMcDYYRyk2OVpI3Xc1TS+o7hsymMWeLFynNNH2uyb9VTJX
	OyaKDdvFrg0820QA9eQ3mF8ejYXv5kqR9jDAMORv5OJOANF3CNAj/1QViunEqwf9
	HBQjdVFbiGNJf5EyGcCGlRZlYQTuSPxjhpddPjGaPpUw73iUTJ8R6A23K6QOnraU
	iVAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1748796151; x=1748882551; bh=KoS6dWu8Azs2CNZsjoC+TDSrU+83
	nlganqaQ/svEQ3Y=; b=XOrEa/cmeyX8X+dNImoV2VjF/7JIfsLa1SZTPVObn5QW
	nI073UeBpwezIVBMWHaeVWCpCvJhf5mTP158rdBtRvOXzy9d2L162wviXqF4XYkR
	TuXXdhqhai0PFCh+uaYQQtlIcj2ikZ62i7e9OKvZG7JgvWh+pW/uJLTuTD61Qu/e
	Q5nXBn/yayhLnbx0/tec23ZABOCjP7o9zSeI4ZxmDQyjDnLajyIJZ3GUfKoW6Sov
	xGQKz5k7fvtVOvlSRRDeJ/YGX+LQbY7RqhGu213aWNnEnyk8rXXD1sofSEwZpYr6
	92tcLNrJdfPfXN2wrikIff1q/M5Pt0NQaSxuQbxIDA==
X-ME-Sender: <xms:94I8aKTc1jvWa6-2ggVw7P8qn1JNnepRCUOF3NBx2Sms-OPhh3v36g>
    <xme:94I8aPxl3Wvu3gUqlu82uUqJtiwX64lrx05L55rlt-oq9SbuFRLmwV_XnxIopBBWA
    kN_N05yc30JcEY0PkM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefheeftdculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecunecujfgurhepofggfffhvfevkffutgfgsehtjeertdertddtnecuhfhrohhmpedf
    ffgrvhhiugcujfgvihhmrghnnhdfuceougesughmvghhrdhnvghtqeenucggtffrrghtth
    gvrhhnpeegvefhiefgleelgffhtedtueelhfdvuefgleekleetheehgefhgeduueeftdej
    heenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguse
    gumhgvhhdrnhgvthdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtohepphgvrhgvgiesphgvrhgvgidrtgiipdhrtghpthhtohepthhifigrihessh
    hushgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqshhouhhnugesvhhgvghrrdhkvg
    hrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:94I8aH0slVpzCWFz6J-M6k4aRq3m80Wn656BRcSt_XNaG1FVVhiD1w>
    <xmx:94I8aGCrm0XeKE8OXDUQVWwXY_eWWhf3fiSmoUd3eEm4KDmrTHUw9g>
    <xmx:94I8aDj8A_gexkw3cNOzwgOzBFaRvdV0lJfokdcUOk0YKC6DiH6uSQ>
    <xmx:94I8aCpQ08II0vu6Jy2I_mY8e1V6roKTVzPdKrkENV7yk42o_92oCw>
    <xmx:94I8aPQDme2mueU3V7WafeLY28oZMpEoVARjvoLan1Q1AVtDtNEEn0fp>
Feedback-ID: i0351446a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2885CB6005F; Sun,  1 Jun 2025 12:42:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Jun 2025 12:41:16 -0400
From: "David Heimann" <d@dmeh.net>
To: tiwai@suse.com
Cc: perex@perex.cz, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <084dc88c-1193-4a94-a002-5599adff936c@app.fastmail.com>
Subject: [PATCH] ALSA: usb-audio: Add implicit feedback quirk for RODE AI-1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The RODE AI-1 audio interface requires implicit feedback sync between playback endpoint 0x03 and feedback endpoint 0x84 on interface 3, but doesn't advertise this in its USB descriptors.

Without this quirk, the device receives audio data but produces no output.

Signed-off-by: David Heimann <d@dmeh.net>
---
Tested using module parameter:
  options snd-usb-audio implicit_fb=1:19f7:000a

This device previously worked but stopped producing audio output (possibly after a kernel or audio subsystem update). This quirk restores functionality.

This resolves audio output on the RODE AI-1 which otherwise receives audio data but produces no sound.

 sound/usb/implicit.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/usb/implicit.c b/sound/usb/implicit.c
index 4727043fd7..77f06da931 100644
--- a/sound/usb/implicit.c
+++ b/sound/usb/implicit.c
@@ -57,6 +57,7 @@ static const struct snd_usb_implicit_fb_match playback_implicit_fb_quirks[] = {
 	IMPLICIT_FB_FIXED_DEV(0x31e9, 0x0002, 0x81, 2), /* Solid State Logic SSL2+ */
 	IMPLICIT_FB_FIXED_DEV(0x0499, 0x172f, 0x81, 2), /* Steinberg UR22C */
 	IMPLICIT_FB_FIXED_DEV(0x0d9a, 0x00df, 0x81, 2), /* RTX6001 */
+	IMPLICIT_FB_FIXED_DEV(0x19f7, 0x000a, 0x84, 3), /* RODE AI-1 */
 	IMPLICIT_FB_FIXED_DEV(0x22f0, 0x0006, 0x81, 3), /* Allen&Heath Qu-16 */
 	IMPLICIT_FB_FIXED_DEV(0x1686, 0xf029, 0x82, 2), /* Zoom UAC-2 */
 	IMPLICIT_FB_FIXED_DEV(0x2466, 0x8003, 0x86, 2), /* Fractal Audio Axe-Fx II */
-- 
2.49.0
