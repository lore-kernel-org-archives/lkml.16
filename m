Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB8E1E883E;
	Tue, 11 Feb 2025 06:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739256756; cv=none; b=jwGPGjifj711Uc5MFVSYvGJUM24Dz60Ajpn2v4f9oc4/dgUmQ2xmhARqMJ7CdgIFx4nXhkPjnAvFgNZK6CQVZ36zVxjk/GbE4r/6UYakM+HakxPs3jHo3TxNG0acy2rkK/ID8L5n6foxkjbquHQ/jVbU165tYDJh/k0uAdlRwQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739256756; c=relaxed/simple;
	bh=6Nnpo/wyqDm7AnIKoOm4JPNVZ5n7R6N3ycKxmow5nJs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qnXYYvoW/ZsV/e4lLTwenIp1NdY8tv2/zfxomr+rb+Tdl8yt99XGZw7v/U/iUp7P99NfFkIHh259UeLVMqrVBtN9qGtk0n2tbE5Gkbpz7Yy/v+2VjCGR4ZQCbZbY/KG28y8OeYdSy+7PZ+tmuFuecxjByeZSXoOsgMLrWkijaac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=VmQ9o9xY; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="VmQ9o9xY"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 60BFD1487190;
	Tue, 11 Feb 2025 07:52:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1739256751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mJiswliuC8yJUwUEEk+zWNkofLRfEQuTytGzzJetlvI=;
	b=VmQ9o9xYAgNrT+nU8eBegHtGR8nBQlz3zDcxlT7SvS+Q1fNzgj+bt7raCaHVaG6fH3/47f
	lDGAAnSm9LiotxkTQfrEt5sx6wh2aVYFuOZT43NdGjW2bnGWrnUPVcmdfZLlRI0aPnap7m
	REPJqrhwawW67j+lfDn0Q6keJ889Wv1C+r2HGne/vQA3YMKaF4RCvbofyFKnXyrq54MIh8
	Eau6kAidC43rG4o0GoDR/hql3mSwPTRq+RcHe9WjXAGZk23Zb1mUGX8u45SFextzXNBbVH
	ETEyYnlIx61LMyv/MFA7v3ED9uPfdNX3vXtLwTX+yZUitF5d3+7NCLqlNRozMw==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 12/16] ARM: dts: microchip: sama7g5: Add OTPC clocks
Date: Tue, 11 Feb 2025 07:52:23 +0100
Message-Id: <20250211065223.4831-3-ada@thorsis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211065223.4831-1-ada@thorsis.com>
References: <20250210164506.495747-1-ada@thorsis.com>
 <20250211065223.4831-1-ada@thorsis.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

These clocks should be enabled, datasheet says:

> The OTPC is clocked through the Power Management Controller (PMC).
> The user must power on the main RC oscillator and enable the
> peripheral clock of the OTPC prior to reading or writing the OTP
> memory.

Earlier discussions suggest, MCK0 must be enabled, too.  MCK0 is parent
of peripheral otpc_clk, so this is done implicitly.

Link: https://lore.kernel.org/linux-clk/ec34efc2-2051-4b8a-b5d8-6e2fd5e08c28@microchip.com/T/#u
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v2:
    - new patch, not present in v1

 arch/arm/boot/dts/microchip/sama7g5.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/microchip/sama7g5.dtsi b/arch/arm/boot/dts/microchip/sama7g5.dtsi
index f68c2eb8edd54..b33204688b90c 100644
--- a/arch/arm/boot/dts/microchip/sama7g5.dtsi
+++ b/arch/arm/boot/dts/microchip/sama7g5.dtsi
@@ -1023,6 +1023,8 @@ otpc: efuse@e8c00000 {
 			reg = <0xe8c00000 0x100>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+			clocks = <&pmc PMC_TYPE_CORE SAMA7G5_PMC_MAIN_RC>, <&pmc PMC_TYPE_PERIPHERAL 67>;
+			clock-names = "main_rc_osc", "otpc_clk";
 
 			temperature_calib: calib@1 {
 				reg = <OTP_PKT(1) 76>;
-- 
2.39.5

