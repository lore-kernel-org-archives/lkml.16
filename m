Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB44423ED74
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745490357; cv=none; b=Aw15ZSQmo09Cfi6ZnmFqa++zFyMzoXCwN3Wzw8EgYv85pvuhRzW9LooylBxdrZXIxkCitjCnxfhHjYMlQ7qy5sBFhG8kzPjv/PW23dlPH2gub9LRYGte36eYBaXxB0IJiBnrPcpCG4on+ugCxPgvF03N8vbdaiPh3hxI3CCJZgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745490357; c=relaxed/simple;
	bh=v4fkIWZlRlBlwcudSsMGRFd1gy1KN6jxgz3zZ2PYfv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KbatVnoLPJaRxHkaigrb2lil2iMt5EOlaV+soIVWpxtbn5EM+F1K/1Uc0e+KqMUjaW9F6wR/nHglo4KFJoC3RfUHj7OfY1SbeiexqO5m3Jig+W19p6/bUZCEehaxzdTyhemyUIBAm1gu8dxnJPFr9f/PFWrwWNfUElbh1Arx+YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EL6uNv5m; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EL6uNv5m"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-227b828de00so8282915ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 03:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745490355; x=1746095155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSScOVwhUO+K0/3KqN7maXbkfUTR6/cC4fz9TlS9l30=;
        b=EL6uNv5m3QW1X/b7SX9m4M4lIslDnX9Y+xejcBfq+KqM24ImmxwfKeUABLnxl50UZF
         QZN2TR5j7p9j3XzWAJiQvxuGTjWqGiMKgMHNuKxxgwvdfBiSMN2s1ZptGv68RGvt8VcZ
         lQTp4E3fjxN//eSjSAoLN8xQJs/gSmlSDhL2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490355; x=1746095155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSScOVwhUO+K0/3KqN7maXbkfUTR6/cC4fz9TlS9l30=;
        b=gsNEOLpk4ssPl/p0DorjtpCjvAialR0zs8kkhhqIKpXtxJ5n9BzFaCiF5yNXV0kzn3
         whb7Btu1nA3H4W4FunDR2ej4yNl9xHBXl+MUBkuh+fq9hcfIzCYCCVKAG3tr3U3brsy8
         EkW6I10ws6TdHEYia6zX0J6X9qdMOAXbMwM3GjvmWL/UwkZLVncFXMAeXNTMOaojXs6C
         UlpO7M5r75st3SQRyl+WtrydJoPSSLOQAuH0WhDC2Nb9mskqV4FTODNrgF4+qmUfw5+m
         LQ1CIwHpZKx0Sp+CO3XlGBq7qeTvOSuTUCHM2XuIXT+nEA1+0oXtu6Y0GbNIiuPWn5uC
         bkoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVraBL2XOc+7WhQBZl3I3W+X08ieNufhEdDi8bb0PjrPo+4+4S5cgz0WKWW6TQ8eJ3T5+SJd42hL0LnAx8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvYN3YaLC2wDQMpkTOUGeQ5wug1niZCOs1ikCrB6UAIFt8Yq2S
	D2AcZIgxB3crZaqS1vTaRKcBfTnN5nDGcKGtQNSVB0WFWypAkx2Lav607DcV+w==
X-Gm-Gg: ASbGncs6jqHdRWZp4/8BiT+BKQnWpJnG6ZTyD9pf1+68NL1p9tg/9L71665SOoU8+iG
	96cBWeS7FK8Wu54ha7NE8QHsbi5vZo5N8PcPC0wFmXX/0+1zpWTnaAspNEuoi9gt9t+Eyty3XXi
	xMWIogl06VIv2csPs3MTb/9VAfIdfd+KdxOXoCXm0jtvIsEZpBJe2Qvjr7EG1S9HohijNlamMsu
	QnYijHtUHzwVUDzbC8WXNOpxQSzwvBPiwg00hOMieY7DHV0Y5noLMy1DsXcfNxMTS7XNYPqh3uX
	Q4xLEzNHENwJlLJDfvOFvVv6EceGSVwyshssP5Xhb8wnOqiUsbixuVmTZA==
X-Google-Smtp-Source: AGHT+IGVWgP+9f44cPO1R7mfB5z1uFUey5yQnac/oTnGNxfAaOr9FFOdDrHbUFBI3ie8mEMC8Jfp1w==
X-Received: by 2002:a17:903:17ce:b0:223:5e76:637a with SMTP id d9443c01a7336-22db3c0e722mr27960035ad.23.1745490355124;
        Thu, 24 Apr 2025 03:25:55 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fa13:e633:684b:257])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm9680305ad.104.2025.04.24.03.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:25:54 -0700 (PDT)
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
Subject: [PATCH v2 11/13] arm64: dts: mediatek: mt8183-kukui: Reserve memory for audio frontend
Date: Thu, 24 Apr 2025 18:25:05 +0800
Message-ID: <20250424102509.1083185-12-wenst@chromium.org>
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

Reserve the same size of memory on the MT8183 Kukui & Jacuzzi families
as well, to align with the other MediaTek-based ChromeOS platforms. This
also helps with memory starvation as these devices commonly end up in
low memory conditions.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 0fe9f2d1b912..00b97cfa0eec 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -85,6 +85,13 @@ reserved_memory: reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
+		afe_dma_mem: audio-dma-pool {
+			compatible = "shared-dma-pool";
+			size = <0 0x100000>;
+			alignment = <0 0x10>;
+			no-map;
+		};
+
 		scp_mem_reserved: memory@50000000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x50000000 0 0x2900000>;
@@ -198,6 +205,10 @@ tboard_thermistor2: thermal-sensor2 {
 	};
 };
 
+&afe {
+	memory-region = <&afe_dma_mem>;
+};
+
 &auxadc {
 	status = "okay";
 };
-- 
2.49.0.805.g082f7c87e0-goog

