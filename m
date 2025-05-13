Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8B31A3A8D;
	Tue, 13 May 2025 20:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747168318; cv=none; b=M7FvdZJN5xQeZt0mPRYRANUC4hhhnpZHWG7RJPsIMPdk72Bmyf/qt+/wmw/UJaszAT48mOuLEYAFp2iMUQjv4UWyv/vqgxZD5E85ZtSdzL8Qa+lcYdJImDILwAUR8sITVmwYslff6+tubo1wqcazS3C6N+nxRu+R1an+4pOsRDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747168318; c=relaxed/simple;
	bh=jfRrkp9lyFao9Pp5oLQGET38LS9Y36udY/vg3tP6iQI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bj+eyHF2B6ymqxMDqhhpjxQ3U1Nj9/2XK10hrvYx3m1gtr82JfdEQifk/WGoeRgoBCDSevlF/z4JxqGaQjuGchWwTPBSDnzf44SizEsyHPbsAAFqjj5dw4wbdhB5LwYjZaW3RTxdbHVoKpnVCILPPjo0XqXt6CqJwaZsRDj8SWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XvaZGEKl; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XvaZGEKl"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ad2452e877aso556196066b.3;
        Tue, 13 May 2025 13:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747168315; x=1747773115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WCZ2i6E0I6gwRQJDyVBo1njeILo9WXLxHiX21CXlaCc=;
        b=XvaZGEKlJvy1HHULWaR5U/QXynbX+3IjkFvrPgs/f2f8JuqozR4z2uPv8B71CR357v
         OdxFZ/lhQMRVDwI7cZRtMrWF1i3Q+wUx+NbEnry0KECazC3ClvLMdgZTH+sOtukaEbFi
         TTSReEf+/tKxm4AUFs3kyzw0Ym0941GSBdBgRgMe/T85OJmLg43NY2arqLNfZ2c3di2V
         OaNKQ8QDfTg9KuFqAEfreoSjm7ipkomB9+H0SYL1lOWIBdBJFjb/sAoxGPeGoNCxVuYr
         tdAtDCAGoy05RhzaPY43bLJQkNUbfA+TD0yY38cACeDM8s+vfmiSHl85kNjK/L6rpcoy
         pHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747168315; x=1747773115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WCZ2i6E0I6gwRQJDyVBo1njeILo9WXLxHiX21CXlaCc=;
        b=Ps8ruM7wHeYmCNg+l7NvoHb2UGVKd0Idiw93fuXu8yaIrdK+a8UpkIU5ZY7eLOw3Vc
         k+NjCwhCRYKOraFfeGUXl5eWEBW7caPK68lvMBU1qN0aFXfQyCsgjGuMhsPt+wUqiGnC
         CCniJYaQTH7FsG2uBtiN6hHGzrtvcD2eJLrDNvPuG2GwM5WvyV0m7vnfUkVRV7Sj3Ad3
         9/dCa3pR9hrJnPOXHs2oVlRYADR35S/I9vj6gEnupP5/ihlwvpRTpAh5xkxBEoZ+CFHv
         xRaTSfGS8OR62H/VKAo6ETT0+Rml1G1+BIuFn7eBe4ULPqECDZFLd2/wwip5QU1CkEmf
         UWvg==
X-Forwarded-Encrypted: i=1; AJvYcCX08Vihbke2BAO28IJpEC9mPaDwhCgfLvztSa/bTqJnvaroxQWKnlYTx3Kaqrv5BSx+NKWJhxzaMS1O@vger.kernel.org, AJvYcCX3OWApLgksW/llpb7F8aieV6CospQBoFJNQwF4ZElFbC0Ss2S3zsB68W2FJljPSBMstJrrxMVNPHxy0xJ9@vger.kernel.org
X-Gm-Message-State: AOJu0YzrDIfrYK9nRuTQ/P4yycTqMzdL7FnPI+dsw1PQw1ku5eio3Ide
	swrhE6AdSU9JGVpTJdglV/Hx6E5hWwMqLX1E4ZxnvmFXujNxk8Ty
X-Gm-Gg: ASbGncvMXWx5kjtkSwNdHirXGgHQZlhVr13G/2CRk3L2unYsW2c9vuT1MlTJko6Yaj5
	qNRUDgVTF9tF8AohzDFF5OPp1TnHSp1d+VvCDIqjPm5lsR6cxlFkMtaPHJ+ynuvTPuWPHgMKKtd
	+hebmC49i4EFTqsCgsjzZIBeCadlC5oO2vftPyFpwo6MEfjZZi2S/rJjQBv4PqmyBmg+58vzWw0
	x/IUAP8oWQ1zskOj16tme1sj2JIKRK9DnM3r/PgbnxCk+2YJQ7wlQ7zff/3wjSTJZnKUVGX6uBD
	OgYs6x1RTiWas2zOBM5Pm0ufd3kX3xtGQ6qSNo00J/LKFziO+ulBVLCguDjhgQU0
X-Google-Smtp-Source: AGHT+IHjQ1dMS6usnLiHaz4sXCz7Jck/zY0kS9uEoTI505F+c6LZUIo6wME/2RdA32p259FKoLkbrQ==
X-Received: by 2002:a17:907:7d8e:b0:ad2:50ef:4930 with SMTP id a640c23a62f3a-ad4f715a442mr96322466b.33.1747168315249;
        Tue, 13 May 2025 13:31:55 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192c8508sm819349766b.9.2025.05.13.13.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 13:31:54 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	sophgo@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: sophgo: cv18xx: Add RTCSYS device node
Date: Tue, 13 May 2025 22:31:25 +0200
Message-ID: <20250513203128.620731-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the RTCSYS MFD node: in Cvitek CV18xx and its successors RTC Subsystem
is quite advanced and provides SoC power management functions as well.

The SoC family also contains DW8051 block (Intel 8051 compatible CPU core)
and an associated SRAM. The corresponding control registers are mapped into
RTCSYS address space as well.

Link: https://github.com/sophgo/sophgo-doc/tree/main/SG200X/TRM
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index ed06c3609fb2..280c45bd3b3d 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -307,5 +307,17 @@ dmac: dma-controller@4330000 {
 			snps,data-width = <2>;
 			status = "disabled";
 		};
+
+		rtc@5025000 {
+			compatible = "sophgo,cv1800b-rtc", "syscon";
+			reg = <0x5025000 0x2000>;
+			interrupts = <SOC_PERIPHERAL_IRQ(1) IRQ_TYPE_LEVEL_HIGH>,
+				     <SOC_PERIPHERAL_IRQ(2) IRQ_TYPE_LEVEL_HIGH>,
+				     <SOC_PERIPHERAL_IRQ(3) IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "alarm", "longpress", "vbat";
+			clocks = <&clk CLK_RTC_25M>,
+				 <&clk CLK_SRC_RTC_SYS_0>;
+			clock-names = "rtc", "mcu";
+		};
 	};
 };
-- 
2.49.0

