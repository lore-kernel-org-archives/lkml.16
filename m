Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2EF1E7C03
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 23:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743549015; cv=none; b=ecH2J1rPh0RIhS+w1VbUUCcG4qHis2TvcU2fPlz4Hq20yX0n/zRLfoTK6ZDYqe5WvPw1MxsI5vWVNERcWBLhVR7wiC9BO7Istzv00JwX4znAtyjLTtt9YaXsMzYzDlr7S6b/bCZMhTfYmXbtSI4vCaOvpQ0DphzVi3LrOC2Q8z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743549015; c=relaxed/simple;
	bh=ArgquqCkjTlx8ZEocnVlllQn0k30tEKp0YZkXXMU5Gg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kKJ8vHPQkgvO3WT8vNWg1VjFf3X+2Nr03QQOTeTu/vta3MliHu7pHWdAlHF9+urpAOP4EySWkru4Sicy+x00WGvyLJutL2h32LNUnVfWJAi4UHKGVeK/hmx7OpMkpLuIizZFxOf7XXP4/RxItQ4DwiiA6FX+qzC+O9189+M0zp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com; spf=none smtp.mailfrom=wkennington.com; dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b=YM4XhsGl; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b="YM4XhsGl"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22622ddcc35so47472625ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 16:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1743549010; x=1744153810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HJoGY0zt2NxjVkfzNkoD0uw5cIldUNLmTUrnr2dqKdI=;
        b=YM4XhsGl5ojT8060Pjb4hlvOT8urcdXU97N2ktfMwmhUHrtJVT1vVZ+NLTc6gkwnia
         aow23akao8z9lx2X01DCznb1Z4eaFwetgMdUrs03OAcQ/etvX8uI896DWclFj1PQl++X
         mVduauIZgSOLIWPaKkGa4sKBPTk2kgjf+BedrclNNTjMZ7RFlTMWsKFf6rjpqN/EzmGd
         q3km5tpwbRXKxidcN9i5DIs5U5+Pb6elAwGcE4RX7tfjoV7PThXH6Bj6bnXjMMOnQZoV
         0YJ2bnLSj/jxda2R3RIBh4OS1rAxvn4/ynexf9Bj9kkZZrhUj8AjrmUFxBe4ew1IA/4w
         mabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743549010; x=1744153810;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJoGY0zt2NxjVkfzNkoD0uw5cIldUNLmTUrnr2dqKdI=;
        b=k6QpuIZ7lwqzxuBSrdEV5C9grtkn3nOhW/gmSlTwOPxl88pUg3U+fs+/R3GoCjkanF
         dvLUHZIqTHzHacrmKa++/wNacXYndxi+7xvSyZCZisvbCEGYjmHSkigWmV+W/thdKADj
         5vuWRnjsQdMgJLHmebvRotdKzwGjWeB7GQph7rQJ1jK8tPQ5KXmMGiSKURdmV0XyS2PZ
         Owiy84KLAj9HyKKFohondfHPO1fm/K5viTeJN6aMGgDXuheWdhPZMx2AUzPDYDO9FzSs
         lvZZBuv6ep44BNf7YeNos9LBQqSDNjqm93ulcO3W4r7LaZAR/NoawtEZTDEcxuVbpUbn
         3D/w==
X-Forwarded-Encrypted: i=1; AJvYcCVpAZ6dMC5jp2mGt71ZyUg3WGgWfEghneUHLO9wBd5glBa0z8JuIWjzjH2OdnK71c3F2YFtryqT4Ss10oU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Owtlv5spPDnMEP/Z4iPAoSW3hfA2uh9mX9SHVjYCJ2wl1/XX
	1M+0bc1TyFoinVe3hxeDnmqZEWfGxQNS7PpibDpvRwregGGHMQH7Br3nlR1aNB4=
X-Gm-Gg: ASbGncvN2qH+O1pA5UlJ2NULAVqRw+dS6nFyncV9/jJ42m6A6gT9PgYr8/glcAZ8G6X
	Gmv5iebnfUpcVG0dgcNa4mixiAfK24DF9q6qrjeV5bF19BHvWMTeGUxn4hdcXZ09aIgS8KVgaZw
	+MFa2sKVeZEqx9xFEtvrUWPRldRvXCXLycdOlnAyPvN/eoExRRg90w9op+X7LZchgqUwIU1c5S+
	9BDOvwmWDd8lbvVQrQcnvjC5vjgBSsY5yr34mgRJJkuC2K/TmhmWff6/q6uy0jPLzvhw23OZMQ3
	5BdixPKo6ByDzFWOs16gWuKuBEHNwkKSjKqHuMrvvTeFuIEwGwq9g4Uepx7pMm4vJFRZZ8Yddjl
	N280ge+i0EX0nbJOw/gyqFsccfSTpwn8=
X-Google-Smtp-Source: AGHT+IG/6yrvEy0DucEk+7yGDoGxvKtVhd6CgHHuqZC1H0LHR/81r26V6cKIRQYMnCllxZ56ye797g==
X-Received: by 2002:a17:902:db0d:b0:224:b60:3ce0 with SMTP id d9443c01a7336-2296c603927mr2757295ad.5.1743549010472;
        Tue, 01 Apr 2025 16:10:10 -0700 (PDT)
Received: from wak-linux.svl.corp.google.com ([2a00:79e0:2e5b:9:895:611e:1a61:85c1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cf170sm95176925ad.148.2025.04.01.16.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 16:10:10 -0700 (PDT)
From: "William A. Kennington III" <william@wkennington.com>
To: Tomer Maimon <tmaimon77@gmail.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH v2] ARM: dts nuvoton: Add EDAC node
Date: Tue,  1 Apr 2025 16:10:01 -0700
Message-ID: <20250401231001.3202669-1-william@wkennington.com>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Reply-To: 20240930214659.193376-1-william@wkennington.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have the driver support code, now we just need to expose the device
node which can export the EDAC properties for the system memory
controller. Tested on real hardware to verify that error counters show
up.

Signed-off-by: William A. Kennington III <william@wkennington.com>
---
V1 -> V2: Fixed compatible string that got truncated

 arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
index 868454ae6bde..c7880126cc78 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
@@ -122,6 +122,13 @@ clk: clock-controller@f0801000 {
 			clocks = <&clk_refclk>, <&clk_sysbypck>, <&clk_mcbypck>;
 		};
 
+		mc: memory-controller@f0824000 {
+			compatible = "nuvoton,npcm750-memory-controller";
+			reg = <0xf0824000 0x1000>;
+			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		gmac0: eth@f0802000 {
 			device_type = "network";
 			compatible = "snps,dwmac";
-- 
2.49.0.472.ge94155a9ec-goog

