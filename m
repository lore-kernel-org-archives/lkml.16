Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC4C1F91E3;
	Mon, 10 Feb 2025 12:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739190731; cv=none; b=BaLc73Ow68nBwErfpCf6qo5ZQkV1yt8OdTZVn+kv7kbsvSl4gZ9OcKMsC7kufwfgQ/SL9fQPwjG0VyuES5Hxit9pgnFGViCBH2h8eYJ2KSwWFZyevWJCjAyj5BIFiNohZKsrAND6cJqVMA7eNximZX/4cIzOH6LWbSZxuBBdJ24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739190731; c=relaxed/simple;
	bh=IEsbCFgROILrbDSaADKH0YKTsviSwI21TCaR17hgP54=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ayrTCqPqB9mV+eaRMi8dwY45wNWtBOXb8aMVWu7OIA1ePYvQWLBraYAg8whupbENIC2OkpTE8BUhP1ZUIeMOgu/UB7JL3ziEAJboZpcHvBsnS4Rz4cUhE8tTd1LOXwsrLbgqlMd7KMMrQnw9rl3+4KfIhfG7+d3TKHxHF933jAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=beims.me; spf=pass smtp.mailfrom=beims.me; dkim=pass (2048-bit key) header.d=beims.me header.i=@beims.me header.b=yJxl5Qlv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=a2g21fzl; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=beims.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=beims.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beims.me header.i=@beims.me header.b="yJxl5Qlv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="a2g21fzl"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 24567114010D;
	Mon, 10 Feb 2025 07:32:07 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 10 Feb 2025 07:32:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=beims.me; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1739190726; x=1739277126; bh=BCAhY1yiejemwSW6GsSgy
	gTIkhjWjlTqnboSBf1Neag=; b=yJxl5Qlv7HVphjeZ+GqVFIoL0RViBODDwai0u
	cHXDx8uVPbM9c/l18RaKpgRaxfVcVX3dwpL3xWCg1syue8UGPWbWSwXDGCzuOvPM
	MqCMm1I+oFvxO72qx95G9V5xEO9ngphuHWG7HVKoWNSwHMA1ZL+2sJc3KIIxkUMK
	Dw6aRvNAUowRiHS8uYT3S+RA9gGnF19uBXyHTca3CrTCt1fdM6N05tBhiXj8G/cW
	8Orf++ASv9HjZOQbIz6cn4ge4x2+D2qLldH5Q5bTIrscw1sLTf1fMH3KWNPxlAkx
	G3FZTg3yL7AqarKYuDbWiLW6PFP0uLf/Gn+SPTOxTOwBUXfuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1739190726; x=1739277126; bh=BCAhY1yiejemwSW6GsSgygTIkhjWjlTqnbo
	SBf1Neag=; b=a2g21fzlFUhBoaJdFfkgcPF4yg/+rUn1Ubkqvr7FFSngvwhjoPg
	0/rIwP3R65uWJpSbNSEybBxyM0e+GHnPw6CJqUi9oJd4YcXFjMa2qwtMFxZHznDe
	3V9SRbXkHoMAPy6MWeV4oAO+OaGgK76wXw6gNV/lFFZT07h4tNSHJePIXYsDDgfo
	EgoCQU+grKGV8SL2IpABZbMr3vKGyeLDUcvpDXgbxh1ccMY7EgT8WLnPUxBk1mC2
	HWSLY5SlFfWZo32DWWQAJ6fdIOPZtFANzUa6j++w/2hLpECovjiPV/7/JQvl6ThT
	s7JnpYVL0VB9pnEqTAZOWT4Xju30TWIFIcA==
X-ME-Sender: <xms:xvGpZ2BFyywVJDj9F1-E573XV-lMQLFtM3r5mJ9s8pbuyDlH6FL3LQ>
    <xme:xvGpZwjmVi-SQ6XgFHuCM8srfRHay6GO7oWXoDQkiyO4mXNZ3ygXwWGwMBp43wR5v
    mS3AqSuh9CpQ7inIa0>
X-ME-Received: <xmr:xvGpZ5l5azEMmjml4gCSUklyi655F6GzHbJdtACeu2gEBq8ZIbERkJ2jk9QfHVPiRTG2aIhtGOE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefkedtjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecu
    hfhrohhmpehrrghfrggvlhessggvihhmshdrmhgvnecuggftrfgrthhtvghrnhepfeekke
    fgvdehhfefgfeltefhudduueffjeevvdekhffghfeljeegleekhedttdeinecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhgrfhgrvghlsegsvg
    himhhsrdhmvgdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodguth
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgv
    rhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmh
    esghhmrghilhdrtghomhdprhgtphhtthhopehrrghfrggvlhdrsggvihhmshesthhorhgr
    uggvgidrtghomhdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:xvGpZ0yo8aUNVviiyyyb89vc0k4kZds1RsMbSG4mIxJVcPX4FHlFCw>
    <xmx:xvGpZ7S0bA8HTG3FgvR125kUE4EyVGyTMD3gFjY0YVLbxBDrEgiGzA>
    <xmx:xvGpZ_ZEeWoXoHSHf_unSxF-XC1D5rNHXaKHea5dRaBro0O6tHSs2g>
    <xmx:xvGpZ0Ty_KKur6FQR4v1upwT1iID9H8lhxlqH_bfUZe_JLE1wOkssg>
    <xmx:xvGpZ5D7w1zgVZcKanuoJnD3FQaymBW7fMiLO7dnrmb-C-IPK8OIlRoV>
Feedback-ID: idc214666:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Feb 2025 07:32:03 -0500 (EST)
From: rafael@beims.me
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Rafael Beims <rafael.beims@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rafael@beims.me
Subject: [PATCH] arm64: dts: colibri-imx8x: Add missing gpio-line-names
Date: Mon, 10 Feb 2025 09:30:50 -0300
Message-ID: <20250210123134.1659719-1-rafael@beims.me>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rafael Beims <rafael.beims@toradex.com>

Add missing gpio-line-names for SODIMM_79 and SODIMM_97

Signed-off-by: Rafael Beims <rafael.beims@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
index d5abfdb8ede2..ecb35c6b67f5 100644
--- a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
@@ -295,8 +295,8 @@ &lsio_gpio0 {
 			  "",
 			  "SODIMM_61",
 			  "SODIMM_103",
-			  "",
-			  "",
+			  "SODIMM_79",
+			  "SODIMM_97",
 			  "",
 			  "SODIMM_25",
 			  "SODIMM_27",
-- 
2.47.2

