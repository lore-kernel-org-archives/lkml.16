Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D8C218AD7;
	Thu, 15 May 2025 15:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323114; cv=none; b=e9WG7m8JuWhx0phZrL1GXOae2d/SfYQvCNAL+SXcm0Mko5ANSU0WrhK86uFX6kY86bWSo+gt7tLo/WrhmBIeNilisCsBGNSNxYVV586bn0oxoTv2wyd4mU3UFyN1cmpobEnW0D0HAdyx088QFWUb2817tG4KcP8ATpR9/VT82+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323114; c=relaxed/simple;
	bh=1tSHlI+nBci4m0RN/w9tw57gf3bV63lMA4x/xrf1GSs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m1C8zD3mSqWs2vX8Ru+a1QFvTquqhvjpJ6G90CndeZLZJyQEOvcpvEFdWvPHgt/rl7UB5Lr8KXFVfmYNePA5VIRFqhphMvIG5dOTj1k2suPWLp/MpC3R423eK2mLXTLBjB6sDjMRkcT+AXFpU5Th9KCSX9V94PGwUVJBYiEK194=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYepqzXz; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYepqzXz"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a0bdcd7357so909106f8f.1;
        Thu, 15 May 2025 08:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747323110; x=1747927910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UE3pPQa7RYxSqG0xcc+yUD/C1a5whAflL40nHxeJ4Tw=;
        b=ZYepqzXz14Z1BxCnmMwkE5DueISqbdrxhnhoVqhY8drADmFV6RZPqQX8cQ2RoR9EVw
         0Hyhk4P7e3icS2ety8/u6hmcA0ExiWjy47OaA3BXgNZd1q1r50KDDrVXqKPVwo2pFuui
         iwsEZlGla8M3K0RrPkvkJjbVNi3mZRhtEF7SE3MwVZsWWNuGuYbUCgcFh8tMVwdwjdkI
         GDuBHGzDPBrkhUrAoXpTN5b+FVGfjIJFB4elDBUf0tpr8dhBVeqgJOf8E0fLnr3os1Kp
         Oi5MULz3GXAcZm4IK10Ic70eRosbZD3GqCteP20PE3laxFWw/m+RPnVDEV+TIm88+dI/
         9//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323110; x=1747927910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UE3pPQa7RYxSqG0xcc+yUD/C1a5whAflL40nHxeJ4Tw=;
        b=FrKbPAkdRnzgtqWG6el/ZcwSRqCI70GofebgaSbpZlxsCKW0nlXCWST/Pn7IpYLyqA
         AXdyuV0wba0ZWcAmAbhB7HbMm9vWdylAfgab/NY+rsdMsDopY8vWEvENvG2UvZdvWTRq
         UwLhb/zBdcgQo70f25An22D5a4B/jIlGouY4l7XhnKJYpHYgRFAcm3IhRreTGYholef7
         cnc2JyYqp0HXTYL0xAYctmCnv6ulAQDcKizesYbgsXYRRfYEirIGP+5rDn+cMRz8K/7I
         hUjT7TT5YFIO3ZcJJuaTQlIzrlBd4peChYsNNHQeEmgNjw04AZ1UVpBmt/szQfNtL28v
         eWXg==
X-Forwarded-Encrypted: i=1; AJvYcCWVXorWBH5f2L4JYEe1pDLRpNIiI4nd44gIg8RE5osNBuoMoxKhCeXz5cPrLgHx8AgMJ+KyYPeDGC+S6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoqmwiVyzHMMb3zlIQ0dPcsvxuijkyjqzzI/n4rxS26/rGXwKe
	tWGRPC5Mj16pN+sKR+vkH6Ek7cayq+T+VEugbtY70nGKM3qhcSq8nBy4
X-Gm-Gg: ASbGncuEynzYgx8h1WoFQXey150IZm7gdgmrIq12d197Wj/d8z7eNZT67biuXr3kUYk
	N1OEoGYs8UYktC2A+StvPlmkza/HRrg91U/5oASjf0vAoQaxMOJBIpd1ef1WcvZ00H5WAV3S2sr
	0vgLmrvyXRgE0dYYIzSj8mcd7EGMzy8GrOPi3EbsOAQPkOwoGvZ4Lbve9Xpm8VtK1I+WthTqH99
	8ub03nwDYN51qj7Uvg7dF5ex36/hTVIbot7mmhUs9RJMBGgphDgSV2qBuaxieab1YYeLABpsvuX
	EbA+BGRv38S0DEkOyST/YhSb4EFvk8zG5JoLD3mB+p+7+101K4bfJvMBemZeY1QbJSL8nOp2mPC
	8pn3ZzzSC5+9gyIZrYOonOvM=
X-Google-Smtp-Source: AGHT+IHjZCDZ6X7uCXmCTwKcA3S9L8UAxdVvJv9GcjufeKxyXRw+jZM3Rrul+srFFu3g+04o590O1g==
X-Received: by 2002:a05:6000:2af:b0:3a0:ad55:c9f2 with SMTP id ffacd0b85a97d-3a35c808d10mr301467f8f.1.1747323109660;
        Thu, 15 May 2025 08:31:49 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddfd6sm22617986f8f.4.2025.05.15.08.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 08:31:49 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH RFC 3/3] ASoC: generic: add more sample DTSIs for audio-graph-card2
Date: Thu, 15 May 2025 11:31:28 -0400
Message-Id: <20250515153128.147457-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250515153128.147457-1-laurentiumihalcea111@gmail.com>
References: <20250515153128.147457-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add some more audio-graph-card2 sample DTSIs meant to aid in testing
the driver's capability to parse explicitly disabled links. To conclude
that the feature works correctly, all audio-graph-card2 samples need to
work as expected. This includes the custom ones:

	1) audio-graph-card2-custom-sample1.dtsi
	2) audio-graph-card2-custom-sample2.dtsi

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../generic/audio-graph-card2-sample1.dtsi    | 278 ++++++
 .../generic/audio-graph-card2-sample2.dtsi    | 878 ++++++++++++++++++
 .../generic/audio-graph-card2-sample3.dtsi    | 486 ++++++++++
 3 files changed, 1642 insertions(+)
 create mode 100644 sound/soc/generic/audio-graph-card2-sample1.dtsi
 create mode 100644 sound/soc/generic/audio-graph-card2-sample2.dtsi
 create mode 100644 sound/soc/generic/audio-graph-card2-sample3.dtsi

diff --git a/sound/soc/generic/audio-graph-card2-sample1.dtsi b/sound/soc/generic/audio-graph-card2-sample1.dtsi
new file mode 100644
index 000000000000..ce0098a160a6
--- /dev/null
+++ b/sound/soc/generic/audio-graph-card2-sample1.dtsi
@@ -0,0 +1,278 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 NXP
+ *
+ * audio-graph-card2 simple link test scenarios
+ *
+ * IMPORTANT:
+ *
+ *	1) DO NOT use this alongside the other test scenarios as the
+ *	node names are not unique across test DTSIs.
+ */
+
+/ {
+	/*
+	 * Testcase 00
+	 *
+	 * DESCRIPTION: test simple CPU-CODEC with no routing specified. Each
+	 * endpoint device has only one available port.
+	 *
+	 * TOPOLOGY:
+	 *
+	 *	CPU0 <---@----> CODEC0
+	 *	CPU1 <---@----> CODEC1
+	 *	CPU2 <---@----> CODEC2
+	 *
+	 *	CPU0 => ENABLED
+	 *	CPU1 => DISABLED
+	 *	CPU2 => ENABLED
+	 *	CODEC0 => ENABLED
+	 *	CODEC1 => ENABLED
+	 *	CODEC2 => DISABLED
+	 *
+	 * RESULT:
+	 *	- sound card creation should succeed with 2 explicitly disabled links.
+	 */
+	test-case-00 {
+		compatible = "audio-graph-card2";
+		label = "test-case-00";
+		links = <&simple_cpu0_port>,
+			<&simple_cpu1_port>,
+			<&simple_cpu2_port>;
+	};
+
+	test-cpu0 {
+		compatible = "test-cpu";
+
+		simple_cpu0_port: port {
+			biclock-master;
+			frame-master;
+
+			test_cpu_0_ep: endpoint {
+				remote-endpoint = <&test_codec_0_ep>;
+			};
+		};
+	};
+
+	test-cpu1 {
+		compatible = "test-cpu";
+		status = "disabled";
+
+		simple_cpu1_port: port {
+			biclock-master;
+			frame-master;
+
+			test_cpu_1_ep: endpoint {
+				remote-endpoint = <&test_codec_1_ep>;
+			};
+		};
+	};
+
+	test-cpu2 {
+		compatible = "test-cpu";
+
+		simple_cpu2_port: port {
+			bitclock-master;
+			frame-master;
+
+			test_cpu_2_ep: endpoint {
+				remote-endpoint = <&test_codec_2_ep>;
+			};
+		};
+	};
+
+	test-codec0 {
+		compatible = "test-codec";
+
+		port {
+			test_codec_0_ep: endpoint {
+				remote-endpoint = <&test_cpu_0_ep>;
+			};
+		};
+	};
+
+	test-codec1 {
+		compatible = "test-codec";
+
+		port {
+			test_codec_1_ep: endpoint {
+				remote-endpoint = <&test_cpu_1_ep>;
+			};
+		};
+	};
+
+	test-codec2 {
+		compatible = "test-codec";
+		status = "disabled";
+
+		port {
+			test_codec_2_ep: endpoint {
+				remote-endpoint = <&test_cpu_2_ep>;
+			};
+		};
+	};
+
+	/*
+	 * Testcase 01
+	 *
+	 * DESCRIPTION: test simple CPU-CODEC with no routing specified. Each
+	 * endpoint device has one or more available ports.
+	 *
+	 * TOPOLOGY:
+	 *
+	 *	CPU3/P0 <---@----> CODEC3
+	 *	CPU3/P1 <---@----> CODEC4
+	 *	CPU4    <---@----> CODEC5/P0
+	 *	CPU3/P2 <---@----> CODEC5/P1
+	 *
+	 *	CPU3 => ENABLED
+	 *	CPU4 => DISABLED
+	 *	CODEC3 => ENABLED
+	 *	CODEC4 => DISABLED
+	 *
+	 * RESULT:
+	 *	- sound card creation should succeed with 2 explicitly disabled links
+	 */
+	test-case-01 {
+		compatible = "audio-graph-card2";
+		label = "test-case-01";
+		links = <&test_cpu3_port0>,
+			<&test_cpu3_port1>,
+			<&test_cpu4_port>,
+			<&test_cpu3_port2>;
+	};
+
+	test-cpu3 {
+		compatible = "test-cpu";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			test_cpu3_port0: port@0 {
+				reg = <0>;
+
+				test_cpu3_p0_ep: endpoint {
+					remote-endpoint = <&test_codec3_ep>;
+				};
+			};
+
+			test_cpu3_port1: port@1 {
+				reg = <1>;
+
+				test_cpu3_p1_ep: endpoint {
+					remote-endpoint = <&test_codec4_ep>;
+				};
+			};
+
+			test_cpu3_port2: port@2 {
+				reg = <2>;
+
+				test_cpu3_p2_ep: endpoint {
+					remote-endpoint = <&test_codec5_p1_ep>;
+				};
+			};
+		};
+	};
+
+	test-cpu4 {
+		compatible = "test-cpu";
+		status = "disabled";
+
+		test_cpu4_port: port {
+			test_cpu4_ep: endpoint {
+				remote-endpoint = <&test_codec5_p0_ep>;
+			};
+		};
+	};
+
+	test-codec3 {
+		compatible = "test-codec";
+
+		port {
+			test_codec3_ep: endpoint {
+				remote-endpoint = <&test_cpu3_p0_ep>;
+			};
+		};
+	};
+
+	test-codec4 {
+		compatible = "test-codec";
+		status = "disabled";
+
+		port {
+			test_codec4_ep: endpoint {
+				remote-endpoint = <&test_cpu3_p1_ep>;
+			};
+		};
+	};
+
+	test-codec5 {
+		compatible = "test-codec";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			test_codec5_port0: port@0 {
+				reg = <0>;
+
+				test_codec5_p0_ep: endpoint {
+					remote-endpoint = <&test_cpu4_ep>;
+				};
+			};
+
+			test_codec5_port1: port@1 {
+				reg = <1>;
+
+				test_codec5_p1_ep: endpoint {
+					remote-endpoint = <&test_cpu3_p2_ep>;
+				};
+			};
+		};
+	};
+
+	/*
+	 * Testcase 02
+	 *
+	 * DESCRIPTION: test simple CPU-CODEC with no routing specified. The
+	 * CPU-CODEC link is disabled.
+	 *
+	 * TOPOLOGY:
+	 *
+	 *	CPU5 <---@-----> CODEC6
+	 *
+	 *	CPU5 => DISABLED
+	 *	CODEC6 => ENABLED
+	 *
+	 * RESULT:
+	 *	- sound card creation should fail since all of its links are
+	 *	explicitly disabled.
+	 */
+	test-case-02 {
+		compatible = "audio-graph-card2";
+		label = "test-case-02";
+		links = <&test_cpu5_port>;
+	};
+
+	test-cpu5 {
+		compatible = "test-cpu";
+		status = "disabled";
+
+		test_cpu5_port: port {
+			test_cpu5_port_ep: endpoint {
+				remote-endpoint = <&test_codec6_port_ep>;
+			};
+		};
+	};
+
+	test-codec6 {
+		compatible = "test-codec";
+
+		port {
+			test_codec6_port_ep: endpoint {
+				remote-endpoint = <&test_cpu5_port_ep>;
+			};
+		};
+	};
+};
diff --git a/sound/soc/generic/audio-graph-card2-sample2.dtsi b/sound/soc/generic/audio-graph-card2-sample2.dtsi
new file mode 100644
index 000000000000..0bcbf2a46b79
--- /dev/null
+++ b/sound/soc/generic/audio-graph-card2-sample2.dtsi
@@ -0,0 +1,878 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 NXP
+ *
+ * audio-graph-card2 multi link test scenarios
+ *
+ * IMPORTANT:
+ *
+ *	1) DO NOT use this alongside the other test scenarios as the
+ *	node names are not unique across test DTSIs.
+ *
+ *	2) The test topologies used here are adapted from
+ *	"audio-graph-card2-custom-sample1.dtsi".
+ */
+
+/ {
+	/*
+	 * Testcase 00
+	 *
+	 * DESCRIPTION: test disabled semi-multi link
+	 *
+	 * TOPOLOGY:
+	 *
+	 *	                          +-+
+	 *      TEST_CPU0/P0 <-@--------> | |-> TEST_CODEC0/P0
+	 *                                | |-> TEST_CODEC0/P1
+	 *                                +-+
+	 *
+	 *	TEST_CODEC0 => DISABLED
+	 *	TEST_CPU0 => ENABLED
+	 *
+	 *
+	 * RESULT:
+	 *	- sound card creation should fail as all of its links are
+	 *	explicitly disabled.
+	 */
+	test-case-00 {
+		compatible = "audio-graph-card2";
+		label = "test-case-00";
+		links = <&cpu0_port0>;
+
+		multi {
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				/* SM link port */
+				port@0 {
+					reg = <0>;
+
+					smcodec0_port0_ep: endpoint {
+						remote-endpoint = <&cpu0_port0_ep>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					smcodec0_port1_ep: endpoint {
+						remote-endpoint = <&codec0_port0_ep>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					smcodec0_port2_ep: endpoint {
+						remote-endpoint = <&codec0_port1_ep>;
+					};
+				};
+			};
+		};
+	};
+
+	test-cpu0 {
+		compatible = "test-cpu";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cpu0_port0: port@0 {
+				reg = <0>;
+
+				cpu0_port0_ep: endpoint {
+					remote-endpoint = <&smcodec0_port0_ep>;
+				};
+			};
+		};
+	};
+
+	test-codec0 {
+		compatible = "test-codec";
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				codec0_port0_ep: endpoint {
+					remote-endpoint = <&smcodec0_port1_ep>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				codec0_port1_ep: endpoint {
+					remote-endpoint = <&smcodec0_port2_ep>;
+				};
+			};
+		};
+	};
+
+	/*
+	 * Testcase 01
+	 *
+	 * DESCRIPTION: test semi-multi link with explicitly disabled CPU.
+	 *
+	 * TOPOLOGY:
+	 *
+	 *	                       +-+
+	 *      TEST_CPU1 <-@--------> | |-> TEST_CODEC1/P0
+	 *                             | |-> TEST_CODEC1/P1
+	 *                             +-+
+	 *
+	 *      TEST_CPU2 <---@----> TEST_CODEC2 (ACTIVE)
+	 *
+	 *
+	 *	TEST_CPU1 => DISABLED
+	 *	TEST_CPU2 => ENABLED
+	 *	TEST_CODEC1 => ENABLED
+	 *	TEST_CODEC2 => ENABLED
+	 *
+	 * RESULT:
+	 *	- sound card creation should succeed with 1 explicitly disabled link.
+	 */
+	 test-case-01 {
+		compatible = "audio-graph-card2";
+		label = "test-case-01";
+		links = <&cpu1_port>, <&cpu2_port>;
+
+		multi {
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				/* SM link port */
+				port@0 {
+					reg = <0>;
+
+					smcodec1_port0_ep: endpoint {
+						remote-endpoint = <&cpu1_port_ep>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					smcodec1_port1_ep: endpoint {
+						remote-endpoint = <&codec1_port0_ep>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					smcodec1_port2_ep: endpoint {
+						remote-endpoint = <&codec1_port1_ep>;
+					};
+				};
+			};
+		};
+	 };
+
+	test-cpu1 {
+		compatible = "test-cpu";
+		status = "disabled";
+
+		cpu1_port: port {
+			cpu1_port_ep: endpoint {
+				remote-endpoint = <&smcodec1_port0_ep>;
+			};
+		};
+	};
+
+	test-cpu2 {
+		compatible = "test-cpu";
+
+		cpu2_port: port {
+			cpu2_port_ep: endpoint {
+				remote-endpoint = <&codec2_port_ep>;
+			};
+		};
+	};
+
+	test-codec1 {
+		compatible = "test-codec";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				codec1_port0_ep: endpoint {
+					remote-endpoint = <&smcodec1_port1_ep>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				codec1_port1_ep: endpoint {
+					remote-endpoint = <&smcodec1_port2_ep>;
+				};
+			};
+		};
+	};
+
+	test-codec2 {
+		compatible = "test-codec";
+
+		port {
+			codec2_port_ep: endpoint {
+				remote-endpoint = <&cpu2_port_ep>;
+			};
+		};
+	};
+
+	/*
+	 * Testcase 02
+	 *
+	 * DESCRIPTION: test semi-multi link with one explicitly disabled codec.
+	 *
+	 * TOPOLOGY:
+	 *
+	 *	                       +-+
+	 *      TEST_CPU3 <-@--------> | |-> TEST_CODEC3 (ACTIVE)
+	 *       (ACTIVE)              | |-> TEST_CODEC4 (DISABLED)
+	 *                             +-+
+	 *
+	 *      TEST_CPU4 <---@----> TEST_CODEC5 (ACTIVE)
+	 *       (ACTIVE)
+	 *
+	 *
+	 *	TEST_CPU3 => ENABLED
+	 *	TEST_CPU4 => ENABLED
+	 *	TEST_CODEC3 => ENABLED
+	 *	TEST_CODEC4 => DISABLED
+	 *	TEST_CODEC5 => ENABLED
+	 *
+	 * RESULT:
+	 *	- sound card creation should succeed with 1 explicitly disabled link.
+	 */
+	 test-case-02 {
+		compatible = "audio-graph-card2";
+		label = "test-case-02";
+		links = <&cpu3_port>, <&cpu4_port>;
+
+		multi {
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				/* SM link port */
+				port@0 {
+					reg = <0>;
+
+					smcodec2_port0_ep: endpoint {
+						remote-endpoint = <&cpu3_port_ep>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					smcodec2_port1_ep: endpoint {
+						remote-endpoint = <&codec3_port_ep>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					smcodec2_port2_ep: endpoint {
+						remote-endpoint = <&codec4_port_ep>;
+					};
+				};
+			};
+		};
+	 };
+
+	test-cpu3 {
+		compatible = "test-cpu";
+
+		cpu3_port: port {
+			cpu3_port_ep: endpoint {
+				remote-endpoint = <&smcodec2_port0_ep>;
+			};
+		};
+	};
+
+	test-cpu4 {
+		compatible = "test-cpu";
+
+		cpu4_port: port {
+			cpu4_port_ep: endpoint {
+				remote-endpoint = <&codec5_port_ep>;
+			};
+		};
+	};
+
+	test-codec3 {
+		compatible = "test-codec";
+
+		port {
+			codec3_port_ep: endpoint {
+				remote-endpoint = <&smcodec2_port1_ep>;
+			};
+		};
+	};
+
+	test-codec4 {
+		compatible = "test-codec";
+		status = "disabled";
+
+		port {
+			codec4_port_ep: endpoint {
+				remote-endpoint = <&smcodec2_port2_ep>;
+			};
+		};
+	};
+
+	test-codec5 {
+		compatible = "test-codec";
+
+		port {
+			codec5_port_ep: endpoint {
+				remote-endpoint = <&cpu4_port_ep>;
+			};
+		};
+	};
+
+	/*
+	 * Testcase 03
+	 *
+	 * DESCRIPTION: test disabled multi link.
+	 *
+	 * TOPOLOGY:
+	 *                      +---+            +---+
+	 *      TEST_CPU5/P0 <- |   | <---@----> |   | -> TEST_CODEC6/P0
+	 *      TEST_CPU5/P1 <- |   |            |   | -> TEST_CODEC6/P1
+	 *                      +---+            +---+
+	 *
+	 *
+	 *	TEST_CPU5 => DISABLED
+	 *	TEST_CODEC6 => ENABLED
+	 *
+	 * RESULT:
+	 *	- sound card creation should fail since all of its links are
+	 *	explicitly disabled.
+	 */
+	test-case-03 {
+		compatible = "audio-graph-card2";
+		label = "test-case-03";
+		links = <&multi0_cpu_port0>;
+
+		multi {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			ports@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				multi0_cpu_port0: port@0 {
+					reg = <0>;
+
+					multi0_cpu_port0_ep: endpoint {
+						remote-endpoint = <&multi0_codec_port0_ep>;
+					};
+				};
+
+				multi0_cpu_port1: port@1 {
+					reg = <1>;
+
+					multi0_cpu_port1_ep: endpoint {
+						remote-endpoint = <&cpu6_port0_ep>;
+					};
+				};
+
+				multi0_cpu_port2: port@2 {
+					reg = <2>;
+
+					multi0_cpu_port2_ep: endpoint {
+						remote-endpoint = <&cpu6_port1_ep>;
+					};
+				};
+			};
+
+			ports@1 {
+				reg = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				multi0_codec_port0: port@0 {
+					reg = <0>;
+
+					multi0_codec_port0_ep: endpoint {
+						remote-endpoint = <&multi0_cpu_port0_ep>;
+					};
+				};
+
+				multi0_codec_port1: port@1 {
+					reg = <1>;
+
+					multi0_codec_port1_ep: endpoint {
+						remote-endpoint = <&codec6_port0_ep>;
+					};
+				};
+
+				multi0_codec_port2: port@2 {
+					reg = <2>;
+
+					multi0_codec_port2_ep: endpoint {
+						remote-endpoint = <&codec6_port1_ep>;
+					};
+				};
+			};
+		};
+	};
+
+	test-cpu5 {
+		compatible = "test-cpu";
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cpu6_port0: port@0 {
+				reg = <0>;
+
+				cpu6_port0_ep: endpoint {
+					remote-endpoint = <&multi0_cpu_port1_ep>;
+				};
+			};
+
+			cpu6_port1: port@1 {
+				reg = <1>;
+
+				cpu6_port1_ep: endpoint {
+					remote-endpoint = <&multi0_cpu_port2_ep>;
+				};
+			};
+		};
+	};
+
+	test-codec6 {
+		compatible = "test-codec";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			codec6_port0: port@0 {
+				reg = <0>;
+
+				codec6_port0_ep: endpoint {
+					remote-endpoint = <&multi0_codec_port1_ep>;
+				};
+			};
+
+			codec6_port1: port@1 {
+				reg = <1>;
+
+				codec6_port1_ep: endpoint {
+					remote-endpoint = <&multi0_codec_port2_ep>;
+				};
+			};
+		};
+	};
+
+	/*
+	 * Testcase 04
+	 *
+	 * DESCRIPTION: test multi link with disabled CPU.
+	 *
+	 * TOPOLOGY:
+	 *                      +---+            +---+
+	 *      TEST_CPU7/P0 <- |   | <---@----> |   | -> TEST_CODEC8/P0
+	 *      TEST_CPU7/P1 <- |   |            |   | -> TEST_CODEC8/P1
+	 *                      +---+            +---+
+	 *
+	 *      TEST_CPU6 <---@-----> TEST_CODEC7
+	 *
+	 *
+	 *	TEST_CPU6 => ENABLED
+	 *	TEST_CPU7 => DISABLED
+	 *	TEST_CODEC7 => ENABLED
+	 *	TEST_CODEC8 => ENABLED
+	 *
+	 * RESULT:
+	 *	- sound card creation should succeed with 1 explicitly disabled link.
+	 */
+	test-case-04 {
+		compatible = "audio-graph-card2";
+		label = "test-case-04";
+		links = <&cpu6_port>, <&multi1_cpu_port0>;
+
+		multi {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			ports@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				multi1_cpu_port0: port@0 {
+					reg = <0>;
+
+					multi1_cpu_port0_ep: endpoint {
+						remote-endpoint = <&multi1_codec_port0_ep>;
+					};
+				};
+
+				multi1_cpu_port1: port@1 {
+					reg = <1>;
+
+					multi1_cpu_port1_ep: endpoint {
+						remote-endpoint = <&cpu7_port0_ep>;
+					};
+				};
+
+				multi1_cpu_port2: port@2 {
+					reg = <2>;
+
+					multi1_cpu_port2_ep: endpoint {
+						remote-endpoint = <&cpu7_port1_ep>;
+					};
+				};
+			};
+
+			ports@1 {
+				reg = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				multi1_codec_port0: port@0 {
+					reg = <0>;
+
+					multi1_codec_port0_ep: endpoint {
+						remote-endpoint = <&multi1_cpu_port0_ep>;
+					};
+				};
+
+				multi1_codec_port1: port@1 {
+					reg = <1>;
+
+					multi1_codec_port1_ep: endpoint {
+						remote-endpoint = <&codec8_port0_ep>;
+					};
+				};
+
+				multi1_codec_port2: port@2 {
+					reg = <2>;
+
+					multi1_codec_port2_ep: endpoint {
+						remote-endpoint = <&codec8_port1_ep>;
+					};
+				};
+			};
+		};
+	};
+
+	test-cpu6 {
+		compatible = "test-cpu";
+
+		cpu6_port: port {
+			cpu6_port_ep: endpoint {
+				remote-endpoint = <&codec7_port_ep>;
+			};
+		};
+	};
+
+	test-cpu7 {
+		compatible = "test-cpu";
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cpu7_port0: port@0 {
+				reg = <0>;
+
+				cpu7_port0_ep: endpoint {
+					remote-endpoint = <&multi1_cpu_port1_ep>;
+				};
+			};
+
+			cpu7_port1: port@1 {
+				reg = <1>;
+
+				cpu7_port1_ep: endpoint {
+					remote-endpoint = <&multi1_cpu_port2_ep>;
+				};
+			};
+		};
+	};
+
+	test-codec7 {
+		compatible = "test-codec";
+
+		port {
+			codec7_port_ep: endpoint {
+				remote-endpoint = <&cpu6_port_ep>;
+			};
+		};
+	};
+
+	test-codec8 {
+		compatible = "test-codec";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			codec8_port0: port@0 {
+				reg = <0>;
+
+				codec8_port0_ep: endpoint {
+					remote-endpoint = <&multi1_codec_port1_ep>;
+				};
+			};
+
+			codec8_port1: port@1 {
+				reg = <1>;
+
+				codec8_port1_ep: endpoint {
+					remote-endpoint = <&multi1_codec_port2_ep>;
+				};
+			};
+		};
+	};
+
+	/*
+	 * Testcase 05
+	 *
+	 * DESCRIPTION: test N:M (CPUS:CODECS), N < M multi link with disabled codec.
+	 *
+	 * TOPOLOGY:
+	 *
+	 *			+---+            +---+
+	 *                      |   | <---@----> |   |
+	 *                      |   |            |   |
+	 *      TEST_CPU8/P0 <- |   | <--------> |   | -> TEST_CODEC9/P0
+	 *      TEST_CPU8/P1 <- |   | <---+----> |   | -> TEST_CODEC9/P1
+	 *                      |   |     \----> |   | -> TEST_CODEC9/P2
+	 *                      +---+            +---+
+	 *
+	 *
+	 *	TEST_CPU9 <---@----> TEST_CODEC10
+	 *
+	 *      TEST_CPU8 => ENABLED
+	 *      TEST_CODEC9 => DISABLED
+	 *	TEST_CPU9 => ENABLED
+	 *	TEST_CODEC10 => ENABLED
+	 *
+	 * RESULT:
+	 *	- sound card creation should succeed with 1 disabled link.
+	 */
+	test-case-05 {
+		compatible = "audio-graph-card2";
+		label = "test-case-05";
+		links = <&multi2_cpu_port0>, <&cpu9_port>;
+
+		multi {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			ports@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				multi2_cpu_port0: port@0 {
+					reg = <0>;
+
+					multi2_cpu_port0_ep: endpoint {
+						remote-endpoint = <&multi2_codec_port0_ep>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					multi2_cpu_port1_ep0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&cpu8_port0_ep>;
+					};
+
+					multi2_cpu_port1_ep1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&multi2_codec_port1_ep1>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					multi2_cpu_port2_ep0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&cpu8_port1_ep>;
+					};
+
+					multi2_cpu_port2_ep1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&multi2_codec_port2_ep1>;
+					};
+
+					multi2_cpu_port2_ep2: endpoint@2 {
+						reg = <2>;
+						remote-endpoint = <&multi2_codec_port3_ep1>;
+					};
+				};
+			};
+
+			ports@1 {
+				reg = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					multi2_codec_port0_ep: endpoint {
+						remote-endpoint = <&multi2_cpu_port0_ep>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					multi2_codec_port1_ep0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&codec9_port0_ep>;
+					};
+
+					multi2_codec_port1_ep1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&multi2_cpu_port1_ep1>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					multi2_codec_port2_ep0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&codec9_port1_ep>;
+					};
+
+					multi2_codec_port2_ep1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&multi2_cpu_port2_ep1>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					multi2_codec_port3_ep0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&codec9_port2_ep>;
+					};
+
+					multi2_codec_port3_ep1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&multi2_cpu_port2_ep2>;
+					};
+				};
+			};
+		};
+	};
+
+	test-cpu8 {
+		compatible = "test-cpu";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				cpu8_port0_ep: endpoint {
+					remote-endpoint = <&multi2_cpu_port1_ep0>;
+				};
+			};
+
+			port@1 {
+				cpu8_port1_ep: endpoint {
+					remote-endpoint = <&multi2_cpu_port2_ep0>;
+				};
+			};
+		};
+	};
+
+	test-cpu9 {
+		compatible = "test-cpu";
+
+		cpu9_port: port {
+			cpu9_port_ep: endpoint {
+				remote-endpoint = <&codec10_port_ep>;
+			};
+		};
+	};
+
+	test-codec9 {
+		compatible = "test-codec";
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				codec9_port0_ep: endpoint {
+					remote-endpoint = <&multi2_codec_port1_ep0>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				codec9_port1_ep: endpoint {
+					remote-endpoint = <&multi2_codec_port2_ep0>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				codec9_port2_ep: endpoint {
+					remote-endpoint = <&multi2_codec_port3_ep0>;
+				};
+			};
+		};
+	};
+
+	test-codec10 {
+		compatible = "test-codec";
+
+		port {
+			codec10_port_ep: endpoint {
+				remote-endpoint = <&cpu9_port_ep>;
+			};
+		};
+	};
+};
diff --git a/sound/soc/generic/audio-graph-card2-sample3.dtsi b/sound/soc/generic/audio-graph-card2-sample3.dtsi
new file mode 100644
index 000000000000..b96da5b5d6d3
--- /dev/null
+++ b/sound/soc/generic/audio-graph-card2-sample3.dtsi
@@ -0,0 +1,486 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2025 NXP
+ *
+ * audio-graph-card2 DPCM/C2C link test scenarios
+ *
+ * IMPORTANT:
+ *
+ *	1) DO NOT use this alongside the other test scenarios as the
+ *	node names are not unique across test DTSIs.
+ *
+ *	2) The test topologies used here are adapted from
+ *	"audio-graph-card2-custom-sample2.dtsi"
+ */
+
+/ {
+	/*
+	 * Testcase 00:
+	 *
+	 * DESCRIPTION: test DPCM links with CODEC disabled.
+	 *
+	 * TOPOLOGY:
+	 *
+	 *			      ****
+	 *	TEST_CPU0/P0 <---@----*  * ----@---> TEST_CODEC0
+	 *	TEST_CPU0/P1 <---@----*  *
+	 *                            ****
+	 *
+	 *	TEST_CPU0 => ENABLED
+	 *	TEST_CODEC0 => DISABLED
+	 *
+	 * RESULT:
+	 *	- sound card creation should succeed with only the FEs being
+	 *	created. Attempting to play a song on any of the FEs should
+	 *	result in an error since there's no BE attached.
+	 */
+	test-case-00 {
+		compatible = "audio-graph-card2";
+		label = "test-case-00";
+		links = <&fe0_port0>, <&fe0_port1>, <&be0_port0>;
+		routing = "TC DAI0 Playback", "DAI0 Playback",
+			  "TC DAI0 Playback", "DAI1 Playback",
+			  "DAI0 Capture",     "TC DAI0 Capture",
+			  "DAI1 Capture",     "TC DAI0 Capture";
+
+		dpcm {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* FEs */
+			ports@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fe0_port0: port@0 {
+					reg = <0>;
+
+					fe0_port0_ep: endpoint {
+						remote-endpoint = <&cpu0_port0_ep>;
+					};
+				};
+
+				fe0_port1: port@1 {
+					reg = <1>;
+
+					fe0_port1_ep: endpoint {
+						remote-endpoint = <&cpu0_port1_ep>;
+					};
+				};
+			};
+
+			/* BEs */
+			ports@1 {
+				reg = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				be0_port0: port@0 {
+					reg = <0>;
+
+					be0_port0_ep: endpoint {
+						remote-endpoint = <&codec0_port_ep>;
+					};
+				};
+			};
+		};
+	};
+
+	test-cpu0 {
+		compatible = "test-cpu";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				cpu0_port0_ep: endpoint {
+					remote-endpoint = <&fe0_port0_ep>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				cpu0_port1_ep: endpoint {
+					remote-endpoint = <&fe0_port1_ep>;
+				};
+			};
+		};
+	};
+
+	test-codec0 {
+		compatible = "test-codec";
+		status = "disabled";
+
+		port {
+			prefix = "TC";
+
+			codec0_port_ep: endpoint {
+				remote-endpoint = <&be0_port0_ep>;
+			};
+		};
+	};
+
+	/*
+	 * Testcase 01:
+	 *
+	 * DESCRIPTION: test DPCM links with CPU disabled.
+	 *
+	 * TOPOLOGY:
+	 *
+	 *			      ****
+	 *	TEST_CPU1/P0 <---@----*  * ----@---> TEST_CODEC1
+	 *	TEST_CPU1/P1 <---@----*  *
+	 *                            ****
+	 *
+	 *	TEST_CPU0 => DISABLED
+	 *	TEST_CODEC0 => ENABLED
+	 *
+	 * RESULT:
+	 *	- sound card creation should succeed with only the BE
+	 *	being created.
+	 */
+	test-case-01 {
+		compatible = "audio-graph-card2";
+		label = "test-case-01";
+		links = <&fe1_port0>, <&fe1_port1>, <&be1_port0>;
+		routing = "TC DAI0 Playback", "DAI0 Playback",
+			  "TC DAI0 Playback", "DAI1 Playback",
+			  "DAI0 Capture",     "TC DAI0 Capture",
+			  "DAI1 Capture",     "TC DAI0 Capture";
+
+		dpcm {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* FEs */
+			ports@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fe1_port0: port@0 {
+					reg = <0>;
+
+					fe1_port0_ep: endpoint {
+						remote-endpoint = <&cpu1_port0_ep>;
+					};
+				};
+
+				fe1_port1: port@1 {
+					reg = <1>;
+
+					fe1_port1_ep: endpoint {
+						remote-endpoint = <&cpu1_port1_ep>;
+					};
+				};
+			};
+
+			/* BEs */
+			ports@1 {
+				reg = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				be1_port0: port@0 {
+					reg = <0>;
+
+					be1_port0_ep: endpoint {
+						remote-endpoint = <&codec1_port_ep>;
+					};
+				};
+			};
+		};
+	};
+
+	test-cpu1 {
+		compatible = "test-cpu";
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				cpu1_port0_ep: endpoint {
+					remote-endpoint = <&fe1_port0_ep>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				cpu1_port1_ep: endpoint {
+					remote-endpoint = <&fe1_port1_ep>;
+				};
+			};
+		};
+	};
+
+	test-codec1 {
+		compatible = "test-codec";
+
+		port {
+			prefix = "TC";
+
+			codec1_port_ep: endpoint {
+				remote-endpoint = <&be1_port0_ep>;
+			};
+		};
+	};
+
+	/*
+	 * Testcase 02
+	 *
+	 * DESCRIPTION: test DPCM links with multi BE with CODEC disabled.
+	 *
+	 * TOPOLOGY:
+	 *
+	 *			      ****           +---+
+	 *	TEST_CPU2/P0 <---@----*  * ----@---> |   | -> TEST_CODEC2/P0
+	 *	TEST_CPU2/P1 <---@----*  *           |   | -> TEST_CODEC2/P1
+	 *                            ****           +---+
+	 *
+	 *	TEST_CPU2 => ENABLED
+	 *	TEST_CODEC2 => DISABLED
+	 *
+	 * RESULT:
+	 *	- sound card creation should succeed with only the FEs being
+	 *	created.
+	 */
+	test-case-02 {
+		compatible = "audio-graph-card2";
+		label = "test-case-02";
+		links = <&fe2_port0>, <&fe2_port1>, <&multi0_be_port0>;
+
+		dpcm {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* FEs */
+			ports@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fe2_port0: port@0 {
+					reg = <0>;
+
+					fe2_port0_ep: endpoint {
+						remote-endpoint = <&cpu2_port0_ep>;
+					};
+				};
+
+				fe2_port1: port@1 {
+					reg = <1>;
+
+					fe2_port1_ep: endpoint {
+						remote-endpoint = <&cpu2_port1_ep>;
+					};
+				};
+			};
+
+			/* BEs */
+			ports@1 {
+				reg = <1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				multi0_be_port0: port@0 {
+					reg = <0>;
+
+					multi0_be_port0_ep: endpoint {
+						remote-endpoint = <&multi0_codec_port0_ep>;
+					};
+				};
+			};
+		};
+
+		multi {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			ports@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					multi0_codec_port0_ep: endpoint {
+						remote-endpoint = <&multi0_be_port0_ep>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					multi0_codec_port1_ep: endpoint {
+						remote-endpoint = <&codec2_port0_ep>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					multi0_codec_port2_ep: endpoint {
+						remote-endpoint = <&codec2_port1_ep>;
+					};
+				};
+			};
+		};
+	};
+
+	test-cpu2 {
+		compatible = "test-cpu";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				cpu2_port0_ep: endpoint {
+					remote-endpoint = <&fe2_port0_ep>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				cpu2_port1_ep: endpoint {
+					remote-endpoint = <&fe2_port1_ep>;
+				};
+			};
+		};
+	};
+
+	test-codec2 {
+		compatible = "test-codec";
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				codec2_port0_ep: endpoint {
+					remote-endpoint = <&multi0_codec_port1_ep>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				codec2_port1_ep: endpoint {
+					remote-endpoint = <&multi0_codec_port2_ep>;
+				};
+			};
+		};
+	};
+
+	/*
+	 * Testcase 03
+	 *
+	 * DESCRIPTION: test C2C links with codec disabled
+	 *
+	 * TOPOLOGY:
+	 *
+	 *	+---@----> TEST_CODEC3/P0
+	 *	|
+	 *	+--------> TEST_CODEC3/P1
+	 *
+	 *	TEST_CPU3 <---@----> TEST_CODEC4
+	 *
+	 *	TEST_CPU3 => ENABLED
+	 *	TEST_CODEC3 => DISABLED
+	 *	TEST_CODEC4 => ENABLED
+	 *
+	 * RESULT:
+	 *	- sound card creation should succeed with 1 disabled link.
+	 */
+	test-case-03 {
+		compatible = "audio-graph-card2";
+		label = "test-case-03";
+		links = <&c2c0_port0>, <&cpu3_port>;
+
+		codec2codec {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			ports@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				c2c0_port0: port@0 {
+					reg = <0>;
+
+					c2c0_port0_ep: endpoint {
+						remote-endpoint = <&codec3_port0_ep>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					c2c0_port1_ep: endpoint {
+						remote-endpoint = <&codec3_port1_ep>;
+					};
+				};
+			};
+		};
+	};
+
+	test-cpu3 {
+		compatible = "test-cpu";
+
+		cpu3_port: port {
+			cpu3_port_ep: endpoint {
+				remote-endpoint = <&codec4_port_ep>;
+			};
+		};
+	};
+
+	test-codec3 {
+		compatible = "test-codec";
+		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				codec3_port0_ep: endpoint {
+					remote-endpoint = <&c2c0_port0_ep>;
+				};
+			};
+
+			port@1 {
+				codec3_port1_ep: endpoint {
+					remote-endpoint = <&c2c0_port1_ep>;
+				};
+			};
+		};
+	};
+
+	test-codec4 {
+		compatible = "test-codec";
+
+		port {
+			codec4_port_ep: endpoint {
+				remote-endpoint = <&cpu3_port_ep>;
+			};
+		};
+	};
+};
-- 
2.34.1

