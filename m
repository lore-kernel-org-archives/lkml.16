Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8C9227B95
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490354; cv=none; b=FJTtbYYfKXKHquyu37/Mlhi2MtXaM6LiyHglFbXoec0w6Il957coIpE6B0AlN724exjPt3i06HFy0aQqdqK5jPEu1P2HK41n9xt9Owf+2Yskj2itcvZ1nt70vu7IKn4tLh/jmRtRxomnYKHA1ABJeXLY2nRMfHJLeasKaoRgOJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490354; c=relaxed/simple;
	bh=7YFjDN0OC4OQWm2AzcQtsFeXGcmPqh68xKdJuDgu7gc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oa3LvH1tKQhhygLhdMV8uUeAKM35uefDg120ODbI2VJGZwGFH77ioaXR+QQLeMd7AP25APXEj0WWd8p91AZu0/DVmBQseLwXQG3iba2XzNdTq7vRxE/LnGEbnSPjcAl/fbf2bwQQpSto2SSjXigGD8SqMIP/ra7WD0CwqQwXCuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=R1zBfBkK; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="R1zBfBkK"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2255003f4c6so8513355ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 03:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745490352; x=1746095152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LtKFI70vqNjYLe7XjAp0V0B8UZZFpuIExlA3OQYSr8Q=;
        b=R1zBfBkKnAYp2zb1BcfKWQHK+EMp6bydiGVi8t3/SPc8nMsCQpg+4oTI096j0dJdhU
         c5eiChZgBS+QPfZG6rDYJhbJxKnXplamaJCgUd5RGZIfNnJwbRbHLv2gSOVLlx4C/yw4
         XW09CTjAKh1yV4uX2rdoo7CXnuEkaEx905CR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490352; x=1746095152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LtKFI70vqNjYLe7XjAp0V0B8UZZFpuIExlA3OQYSr8Q=;
        b=MNfsFcWV+ZPb25VR7kKUKAn/xMCSTFs0bjj3+jAB0Ace8kD0C7eUEuO+W9RAaXPDnZ
         EOJnQwX/6qUeHaX112BqWvHAKfPWoddvjHlQxZWBbShRohUZxOC0VQ9YDqsemEcsIYgY
         brBmXnojIikWdMSPTrLwGpTyAYyb7WRw76EZm8jrLxkDUOldsGqhJZsPcX5ytXUaaotJ
         Po15MiSWQ+8PMBpUAjaPehKm47w+fTLMQ/cDqq/OvTaxOG6mfAMXgrVDnt3janQ+4scL
         nO3dKG2pGhoByKVgwZWBIRqsUtHB9rPrli5Z5nmnE+zGHyKdJcBYW9GkdOY/wK5fKLoG
         xR5w==
X-Forwarded-Encrypted: i=1; AJvYcCVo6oEastgB7osMKG61Rhk9jxbx6uM29c/pMSO79pjlWMlHwChVwjAosaJ01cfPaCvSA5r0TM04aV14u9g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuCR1rNYdEUpuxTBaaJZeEomg69pS5V8ha0dq20pT8gYcotDSw
	9V6S2UlDbaxG5vT7TsLXm2b8/iQHrPHu0xJjYRnLrjenjiIStBd1GvWE/6gNSQ==
X-Gm-Gg: ASbGncs6WIT5OleedZFiCrr1Xu1bbFaKkjdNuyx/ivdXYik1pdMIeb9Ri4aJpJDYuvA
	i18J3URg4vS/GbdGThu5tLt5XAGApnmg+m+ykosRWHNWw4ot9YWKxV7G4WHFWzb2n2cwW/qef1N
	s5IL68F7xsVCXSd+hAf2zAL3Q532q6eoc7q0R0qdL30iMOplwLrneZ8wJRxF0auH3ReTZ+TimZZ
	FvdTpAWdMVa/yvyEHjOSfPQWoTWfCx2/dBFx5V7BtkJql3P2dv02bkWwZSqBCUGldHcIvb3HMiv
	KcXKewwg7BDtkOVp9mYBq2FtMGf37VqsBGD2H/A2LubTtOpo5aBjyjK0fA==
X-Google-Smtp-Source: AGHT+IGm/ZrqIrNFBVlNQkQXFmEbsCxSPSPhkPOsiViZpp856F8SPbm8k/eEXqIbJDBfdIBpftEJlg==
X-Received: by 2002:a17:902:d48a:b0:221:78a1:27fb with SMTP id d9443c01a7336-22db3bd1a15mr27098975ad.11.1745490351983;
        Thu, 24 Apr 2025 03:25:51 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fa13:e633:684b:257])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm9680305ad.104.2025.04.24.03.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:25:51 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/13] arm64: dts: mediatek: mt8173: Reserve memory for audio frontend
Date: Thu, 24 Apr 2025 18:25:04 +0800
Message-ID: <20250424102509.1083185-11-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250424102509.1083185-1-wenst@chromium.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some MediaTek platforms already reserve a small block of memory for the
audio frontend. These platforms reserve it at a fixed address, though it
is unclear if that is due to hardware access restrictions or simply
compacting the reserved memory blocks together.

Reserve the same size of memory on the MT8173 as well, to align with the
other platforms. This also helps with memory starvation as these devices
commonly end up in low memory conditions.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 6d1d8877b43f..122a57c3780b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -318,6 +318,14 @@ reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
+
+		afe_dma_mem: audio-dma-pool {
+			compatible = "shared-dma-pool";
+			size = <0 0x100000>;
+			alignment = <0 0x10>;
+			no-map;
+		};
+
 		vpu_dma_reserved: vpu-dma-mem@b7000000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0xb7000000 0 0x500000>;
@@ -887,6 +895,7 @@ afe: audio-controller@11220000  {
 					  <&topckgen CLK_TOP_AUD_2_SEL>;
 			assigned-clock-parents = <&topckgen CLK_TOP_APLL1>,
 						 <&topckgen CLK_TOP_APLL2>;
+			memory-region = <&afe_dma_mem>;
 		};
 
 		mmc0: mmc@11230000 {
-- 
2.49.0.805.g082f7c87e0-goog

