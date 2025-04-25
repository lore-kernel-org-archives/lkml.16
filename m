Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39B21A9B58
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 20:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745613082; cv=none; b=QAMpuaXic+ke/UW2HRljgSgu9xHGNZAaiVOnmsjrcuHgPtnhC6qc2JUTx2X7WMC+cFXkYyYExz/irerh6FXurgVKQBASJGAzEAiNehkCDBMZ4VeBHmD71hvspURXDENLevRPMrBH6ZrbHzNj2vZU7L3Owoj21sA9YFpgMYtCgrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745613082; c=relaxed/simple;
	bh=IjHSoesetz3uxvPn7iLP5qeEI8S+hsTSVRSyfU7OeSQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=if9Rf7XAAvPpLd9mN5KTnuF3JvUCAi0k6sXQUQ7quUgrqpThGFLa7wkH26fgjVsvYEKey5N2P0FCpyOWOALz+T+unb54UZGmpeUFEGrdzuifpkxdAk5ZcM+TVR8pTreSYrirbbWFCqj4yONa20BCmbdVr2gHcU1pcc96rvT9rlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=libre.computer; spf=none smtp.mailfrom=libretech.co; dkim=pass (2048-bit key) header.d=libre.computer header.i=@libre.computer header.b=W6U48iou; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=libre.computer
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=libretech.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=libre.computer header.i=@libre.computer header.b="W6U48iou"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c7913bab2cso277363985a.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 13:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1745613080; x=1746217880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GF1xjuBmQCLqhbqJW9dfNwD3/0r4qJdVkbILuVmlmn8=;
        b=W6U48iousV0gmkFDZblo4xtEbG1FhIwxfmbmczbMDw7HgqLNzzzgd7OfeQ4dOgUPdV
         NYiCIawgG7y47h/NxckyW864zJE9be9UJBWIc8C8JPNqWLP+RtlERzv2JW49EqZnfzbg
         7xXFIaC87gPVgCtpalKhznaILcR7kTvAXdK3pGstn+/vvCq83qUILFgnIbc5OcwvSHzo
         P2NzWKpLUzIxvzqR9jr1/RIRsUvPw4EnMH/17Z6M2JUI0KhaLjPFbfc1czgXNDf8n6wU
         LrRp1R1wCmx93dU6G3oO7UVdlSGdyuK7EBCevxjle/wVMWSdmueSxW1b59z/znkgYgfS
         +6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745613080; x=1746217880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GF1xjuBmQCLqhbqJW9dfNwD3/0r4qJdVkbILuVmlmn8=;
        b=onc8NL5b2D680qI6MxvgOo4ooZ2gFEZeVyvOFEwFP2SGHfEegZ0Ss5GFCMJMM2k3ot
         MWuPf99GH/WeFlRvuRUByuokZqBdE6hqdRP/frG00eSQgEJj351I5hPlog6iwA+TKR+m
         bTTjFwbcaTKUzc90vYAJO6AaWrtKrAIhwefjRh+59wjbAO817qP2kgV0OS0UwUpVU7s4
         HfaocHrpPgat33MrUggLVyrOw7WfUWJh3Q1Iz+hMDmfb1QaE2XwMI9IXyDv9EWrDc6Hp
         lY5TEQ6+pD7fDwyIMiyIIlyz6px5iKXppmamQjT/cn1gBFRK7mQtLxiX8yT6g5gMutcj
         UAFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfAYzoEVRD+uRvEDYkw9rcPhPob1HDCVuGiMXTbztDhiGqbsf1QAuXW9Cyr379kkwi0EaNrfFqIQx9T2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGoz6H41xGL0EFSlw36pJaTZWtemKLRi+OpbvKGNMCoN7BQnqc
	rQlxS0bhf07NPQ42A5p9G9DMInsPK1gD6ZO1XYBQqnJrAjZ5GTlhdsRexS17Pg==
X-Gm-Gg: ASbGncuBKG3FXa5xNC1ZZSAmEswWXOa5LsbbVFEjNPo7G5gTKUeoJvSAbDoNhUlv/T3
	daz8T14v4OrUCLXmWkfEAKn7u2KAe0BFze54OXlVdmlcXHbPjRLehyfT0NWknhkI66ua76CPH+k
	priwHsdk9OCYhcoAjYxAXCfy1o4IceY/tPb042s7Ev6m2LPUXzn7P75g3NhnSJecvRv9eMNqHRb
	YUH/Sxyf93cRFQjEZKu2qKe7KyxqlW1+4mixrEwE9hnndjmutC7GXknY/Thhps7L2E1UHnNQR1x
	zMloXaKP7Tpmhwn0dV9+ySrgiCXJEijwQFXe
X-Google-Smtp-Source: AGHT+IExy7byNjnzr61Qn1ql3vlbeCJFkmt8dfGkcDuwiloO0OM0ew357yO9XtgDpkXGc3h67FnjWA==
X-Received: by 2002:a05:620a:27d6:b0:7c5:56c0:a8 with SMTP id af79cd13be357-7c9668634b0mr182306685a.1.1745613079619;
        Fri, 25 Apr 2025 13:31:19 -0700 (PDT)
Received: from localhost ([2607:fb91:bdd9:47ad:b39:2164:cbe2:1695])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958ce4e97sm263041685a.65.2025.04.25.13.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 13:31:19 -0700 (PDT)
From: Da Xue <da@libre.computer>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Da Xue <da@libre.computer>
Subject: [PATCH] arm64: dts: amlogic: gxl: set i2c bias to pull-up
Date: Fri, 25 Apr 2025 16:31:18 -0400
Message-Id: <20250425203118.1444481-1-da@libre.computer>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GXL I2C pins need internal pull-up enabled to operate if there
is no external resistor. The pull-up is 60kohms per the datasheet.

We should set the bias when i2c pinmux is enabled.

Signed-off-by: Da Xue <da@libre.computer>
---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 2dc2fdaecf9f..aed8dbfbb64d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -214,7 +214,7 @@ mux {
 				groups = "i2c_sck_ao",
 				       "i2c_sda_ao";
 				function = "i2c_ao";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
@@ -576,7 +576,7 @@ mux {
 				groups = "i2c_sck_a",
 				     "i2c_sda_a";
 				function = "i2c_a";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
@@ -585,7 +585,7 @@ mux {
 				groups = "i2c_sck_b",
 				      "i2c_sda_b";
 				function = "i2c_b";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
@@ -594,7 +594,7 @@ mux {
 				groups = "i2c_sck_c",
 				      "i2c_sda_c";
 				function = "i2c_c";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
@@ -603,7 +603,7 @@ mux {
 				groups = "i2c_sck_c_dv19",
 				      "i2c_sda_c_dv18";
 				function = "i2c_c";
-				bias-disable;
+				bias-pull-up;
 			};
 		};
 
-- 
2.39.5

