Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087C722D9E0
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 08:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748681979; cv=none; b=cQhNnoVvpnMWAzGzDEKE3A2YOaGwqPB1B2mUHxkyfqwicj/FzOxaw/fKHSc/51zH20tAGrf+teQBPUht3m13LLMMtQQA4WZidMW8Hp1qB8gLD5XqGubYIiIqZ8X5esDgCyq336cJQrMTW2vCP0CtxuMvLS8c7eoAMcjvqruYPX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748681979; c=relaxed/simple;
	bh=7QsAYNa0feJJA5pQUSGqVFl/a3ERsItjJkFJ74hyHJ0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type; b=HFm2AOvxIE9o8v/jaQcktxKO6Jz0ffcDvpXKsYKWu8RC0cvJDjle8+X0zA+K21NjmY+b2pQCX5Lwx9iimLTAmLM2nDqSuvWse2f1AG/jfEJh6LocCeJTeCuzIGJ42s5c732AJ0q/isr4VoRNeLEqketN61nOKDE+KDag4DMppnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=3bWKtsEC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KkwGW0n1; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="3bWKtsEC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KkwGW0n1"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 013441380333;
	Sat, 31 May 2025 04:59:36 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Sat, 31 May 2025 04:59:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1748681975; x=1748768375; bh=p2
	OWAw12JJ0u5E469a4fqtcOE7dGCErKVTCQFCBSYSA=; b=3bWKtsECNZBBINyxHb
	Yg/af0K6EOmegEQ00ktZZ6d+Cd8S9KN6wOmQq0SZsMSbUzIWkjgSOMxDaXs8fbct
	KqbkrgugaDLcU0rBOqr8/B+Q5RnSzOXNQMfP0wOZ7Zec8nufmNMpBS23OVC8NxWL
	+4QDygZVvLjRReCRqfqddUcYR/eAHVjtvo4/pP7AJxBX+gMMnzdjFepj0Og/qgyE
	mW9pBOuSr4NE+cQwQrSnWjyy+bLyuLAbxjMsJG983dCkiGezgCoIzkVP36v/72O/
	21ugfkBmL2IQN2NToXykdep47JxI/BSpmt5vBjbyjYIvkz0aKMZz4TvOrEyyNvKR
	2jYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1748681975; x=1748768375; bh=p2OWAw12JJ0u5E469a4fqtcOE7dG
	CErKVTCQFCBSYSA=; b=KkwGW0n1jMpMmFnUOjY+0uzOUboxNjb2ruo1iPJARwwB
	V2hlovINQUzE8pcqt4KDIoHyJs/Osg3XYuM2Wrqs8s4UuHWPefewrXS+zyUTwYRI
	bYsbI5spawBiNfPOx0oMBtON4+9STpxEoFpgpGLmFJLDdwWsY4aSYtwAWQz5accd
	6EpnPWXjB0eRVAO1Qe+Ar1REsdnWfGeFHyqFgsIJcB10IS81vniGExSseMWYdMKQ
	K0UFkjfC4mc6VHzGgTgYSirpeFt4wGMB4KJZ5uN3jhjhjZ4+QUuD//0jJ7rJEutQ
	xDZzXjxaoCABu7Lv4CqWqowu+gxgf1hEkSwQTwws7Q==
X-ME-Sender: <xms:98Q6aO8_CPwKy7ijfKw5fcwP8BDfRBXoLPBSPImaUEho1ks_Dns4GQ>
    <xme:98Q6aOsOPjPqhPJ2DobMEtRLpxhGsOW1ySduX0zUYvcATZ4z-WxxOPcFIUGYiiI6a
    JmJQ2VR7DpkBXZWvd0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefudegleculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefk
    ufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoe
    grrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrhhnpeffffffheeugfefhfdu
    vefgleeijeektdfffeeijedthfevgfeiieevjeeuteefvdenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhn
    sggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtohhrvh
    grlhgusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhi
    nhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpd
    hrtghpthhtohepshhotgeslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehl
    ihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:98Q6aEDU1xSi2iUqgjUyh1SNtfZKhy5BDS5m6FnHWeICol_AGRK4VQ>
    <xmx:98Q6aGdLejjtIVQbHd0d0Xix2qtJzDwsHa8vwwBSIwMCLiCowy3pDQ>
    <xmx:98Q6aDNpCP1tVUgKZzbtgAv4Upz2kCKwkCL8bT_jlY4UgEPSYqB07g>
    <xmx:98Q6aAk5AwFW4HkJkPDX_e-Tjv6Z1vTHa6akHrCjSGlVMOXq89p_fA>
    <xmx:98Q6aHG5AhKlmrby7wrWsywVVqiGioZSh3eq7qVwbIIEKAt3GPFvU-lI>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5BB54700060; Sat, 31 May 2025 04:59:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 31 May 2025 10:59:15 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <28a4c0cf-7978-4547-bf89-42804975c848@app.fastmail.com>
Subject: [GIT PULL 0/5] soc: updates for 6.16
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

This is a fairly large update for the soc tree with 1125 patches,
mainly because a large part of the qualcomm changes came too late
last time. Other than that, there is not much interesting going
on. There are 65 new dts files for additional machines and 12 new
SoCs that are all similar to already supported ones. The sophgo
SG2044 SoC support comes in a separate branch to avoid a backmerge,
but it's also the largest one of the new chips.

The summarized dirstat is

   0.5% Documentation/devicetree/bindings/arm/
   1.6% Documentation/devicetree/bindings/
   0.4% arch/arm/boot/dts/broadcom/
   0.7% arch/arm/boot/dts/microchip/
   1.2% arch/arm/boot/dts/nvidia/
   0.7% arch/arm/boot/dts/qcom/
   0.4% arch/arm/boot/dts/renesas/
   1.3% arch/arm/boot/dts/st/
   1.2% arch/arm/boot/dts/
   1.2% arch/arm/mach-davinci/
   2.0% arch/arm64/boot/dts/allwinner/
   1.1% arch/arm64/boot/dts/amlogic/
   4.4% arch/arm64/boot/dts/exynos/
  15.7% arch/arm64/boot/dts/freescale/
   7.9% arch/arm64/boot/dts/mediatek/
   0.4% arch/arm64/boot/dts/nvidia/
  24.3% arch/arm64/boot/dts/qcom/
   2.4% arch/arm64/boot/dts/renesas/
  10.2% arch/arm64/boot/dts/rockchip/
   0.3% arch/arm64/boot/dts/st/
   6.6% arch/arm64/boot/dts/ti/
   1.2% arch/arm64/boot/dts/
   4.1% arch/riscv/boot/dts/sophgo/
   0.3% arch/
   2.6% drivers/firmware/arm_scmi/vendors/imx/
   0.7% drivers/firmware/arm_scmi/
   0.7% drivers/firmware/
   0.6% drivers/memory/
   0.5% drivers/platform/cznic/
   0.4% drivers/reset/
   0.6% drivers/soc/amlogic/
   0.6% drivers/soc/qcom/
   0.9% drivers/soc/
 939 files changed, 79999 insertions(+), 11861 deletions(-)

We had 264 contributors this time, and the most active ones
by number of patches are

     72 Krzysztof Kozlowski
     38 Dmitry Baryshkov
     30 Luca Weiss
     29 Konrad Dybcio
     24 Stephan Gerhold
     23 Wolfram Sang
     23 Neil Armstrong
     22 Heiko Stuebner
     19 Johan Hovold
     18 Rob Herring (Arm)
     17 Primoz Fiser
     16 Siddharth Vadapalli
     14 Francesco Dolcini
     14 Andre Przywara
     13 Chukun Pan
     13 Biju Das
     13 AngeloGioacchino Del Regno
     12 Judith Mendez
     12 Inochi Amaoto
     12 Dzmitry Sankouski
     12 Alexander Stein
     12 Abel Vesa
     12 Aaron Kling
     11 Adam Ford

One simple merge conflict came up in the drivers branch, where
a bunch of updates to the MAINTAINERS file clashed.

     Arnd
