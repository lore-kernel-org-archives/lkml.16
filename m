Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B6B20D50B
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 04:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745381042; cv=none; b=BOPtKIjJd3dmQRjwlSCbfhQMdzCh3FaebLVOKIpUvMDU+UGTPw8lYl6FMbO2rzF8+1gajOZfywdED1qTjDZBzKOpbL00H8rdUdo7IW2n5GbFGBejk5TbyiGTi+My4BMSxB2w2b0EdJHBGrypJhfGdT3v2+MsLJT6RC/RE+zzNYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745381042; c=relaxed/simple;
	bh=+j/hlJqo+Cr2NdAPkpmhUUZtSiMvuhpM0bAG7t2CnPM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cb+/g0SDS8bif9Q8Z74la2hD8HHW36BnL3W4do6qizJHjoMUIlpKzRvxLZNZ3xRnWZHjWsFYPpW78SAuFEUUBQat0LyDL0LALUTaAQ2adUZIrW+8Ya+xC5oxeJglmxGtHZJmn7H/LKqAzafILM9zDa4JQT4DpDi7fnzZtvAqNEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Gsjzm51o; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Gsjzm51o"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-223fd89d036so73300655ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 21:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745381040; x=1745985840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=69P3nlnxBw2v6kIwtTKkT8ULduVaYQnRi8mlA610Ew4=;
        b=Gsjzm51ortokTs6VEJXt6JT4oTxQefmZpW7PQRcejm6WFrIQThxPI/+JgkxafOK7rW
         rpWu0pDAoYUQxSyVjbXbVFsYYUtiKxUHdbPBoFNPjfkBVlgSt1uvJdGMgyxQVTFbeCfH
         cq90psBl2B8xMbu1M+2mSel+W6KRPtQIFu2GY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745381040; x=1745985840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=69P3nlnxBw2v6kIwtTKkT8ULduVaYQnRi8mlA610Ew4=;
        b=pYjvRVBDAOkn6wpDK8eDmlagNSfpAgVUk9/HTikfSJEhD93zj+I3Kk+B41bWgQ1UAw
         kRSNjgVQnjrvh1Uuw1Gj3cMf2VYr/Kg5NT38HdBmmlMl6CDQG6CxLPT/cMrUQWhClb7U
         nWubFOi3ECET0S2tAcrAHQH943tOmK89wsdZ4CVp+4KGO/PQuQwt6nMWWEkP4GdvG+hu
         wm5HuBqwhAPdnWrUXIJmc0jqSDdaVPG5ssetk+dYVeaGO0w95IF814qy6ZDyvTP1zYTk
         WFkCbStpx3pPncRm1fU8f2Bpsaj+sF/fTt062r2xThkrd7kxWgSWNrh6YNeFzDSJ/BAo
         xMIQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4SSVZ2Z/FzspVRFv2myADiPqxaRF5JHf2z+n7F7JpWml10mVVHA67sIWqpcAQhKDnrMCYb92nVGu/8SI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ0KnsG93OJvqFvFxR1Jlfas0vTzUwjovi0pmXvbfxN3aJpHI2
	tTYpLoasqKrtzxrqXmFiqkus4ZPR7BqYgcXZRse0hE43yixmf9LPNLMXmcH2qw==
X-Gm-Gg: ASbGnctnFGmz5U4XsCTOnS77j/gpq9mrjDZGcWloxE1tZhb8NQ/rep2XeV6SI5OuSaM
	JODQ6t2yPTxYG2VGUb61/LB3YdZSV8mijcsJPa4Kz69tmrGoqTZMadKOB1Sn3fcFjLv+oXhOI7S
	NWMsTIvupugrDMiL2w9LgXNS3xhrIDWB8q7U4zjX/p8/wH9KM9nlarhIDwViCLsj3KvHkrd8RNm
	Oje+QElBMi05I/55brURDxIfq8+0O8WXzuhAERfbCFEQpdJNqsSsMgjI99wLVCcHzQ2zIuzvJBT
	DQm80BTOrDKc8dyi/f5+dttatntTT4nKlAX3Ur2Fri8KPz1vopDIWychQnwbjx3/9Vl3dzzit2A
	=
X-Google-Smtp-Source: AGHT+IFs37l1XCtk6TUjNGxDgTahK0TxvEQaxIjTsLH7CENRysCfaJj2nfs1pz+8IvfdUhEasSay/g==
X-Received: by 2002:a17:903:46c8:b0:224:584:6eef with SMTP id d9443c01a7336-22c53606ee5mr301444085ad.41.1745381040103;
        Tue, 22 Apr 2025 21:04:00 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:d4b1:49c5:60dd:89a7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfa5828esm9512894b3a.112.2025.04.22.21.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 21:03:59 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Pin-yen Lin <treapking@chromium.org>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v2] arm64: dts: mt8183: Add port node to mt8183.dtsi
Date: Wed, 23 Apr 2025 12:03:39 +0800
Message-ID: <20250423040354.2847447-1-treapking@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the port node to fix the binding schema check. Also update
mt8183-kukui to reference the new port node.

Fixes: 88ec840270e6 ("arm64: dts: mt8183: Add dsi node")
Fixes: 27eaf34df364 ("arm64: dts: mt8183: config dsi node")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

Changes in v2:
- Rebase to v6.15-next/dts64

 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 10 +++-------
 arch/arm64/boot/dts/mediatek/mt8183.dtsi       |  4 ++++
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index e1495f1900a7b4..f9ca6b3720e915 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -259,14 +259,10 @@ panel_in: endpoint {
 			};
 		};
 	};
+};
 
-	ports {
-		port {
-			dsi_out: endpoint {
-				remote-endpoint = <&panel_in>;
-			};
-		};
-	};
+&dsi_out {
+	remote-endpoint = <&panel_in>;
 };
 
 &gic {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 0aa34e5bbaaa87..3c1fe80e64b9c5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1836,6 +1836,10 @@ dsi0: dsi@14014000 {
 			phys = <&mipi_tx0>;
 			phy-names = "dphy";
 			status = "disabled";
+
+			port {
+				dsi_out: endpoint { };
+			};
 		};
 
 		dpi0: dpi@14015000 {
-- 
2.49.0.805.g082f7c87e0-goog

