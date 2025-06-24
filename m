Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A102E6D3F
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 18:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750788829; cv=none; b=FNR8C+NGT02rl3jd/7dh2j1tj/tiZegKtdJ9hInk8xoHJvxFhrQ/EV9LZknG33I5c+TjyTgvLu4xMMvTmZMF2dK0xU4pJdrhN9KMwRj7IGjjkLFADcXzPtJgO4OlsX1/x887oI70todWBLXJdz21VE96ocCHfBidiSGMPluPIS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750788829; c=relaxed/simple;
	bh=x7bIFuSH0bmY2kRsFSxdIiraxlTD0X4bjQj1Tx6kolA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Xul2n5yPmCKSQ1MkREOIgUarIw0cq95EFsFdN16O5pcOFhpNiFd7193dc+832zGkVb8abMU4I2IAzHvlHlmyUV6FmbwtkhUQI2C+c+rE4q1nv4D/8Yhgh9oHTUtNHDwb9aApYWqbafEKZACxtxue/c8B7mTUPEY3EItFo+1lIlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VPpnXkIb; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VPpnXkIb"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7d402c901cbso62017085a.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 11:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750788826; x=1751393626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2BDuY3TQuMxlT97CpLHc0HQj9uQaoAWTaiKt1gOmVfg=;
        b=VPpnXkIbU7r8Bj9WWKL663Mrh9skcapHbkuVomOdhZN2kRy6Ib2LHfgl4sIcd+uYHD
         IBAdgFTmBo2dhpWscTPpOkVKbqW3p0WjwpFuNyKtAnIvMXKQTWcM6QxYSunQuRJ2A2Fz
         cTJS1MpO+lPsV3o7ZFmLrlai77NxsJkPZfkg23ES04pTbjTu6gOse2m75mXEc+jNLvjP
         TObvAGsmkIKhAk/0GJ+g8ZIdmAT88GNlv+DeF/Dlaee/SEiR8mMPB5kpMLcYDrfjxiyH
         QkSkdBmJXLXwPic6op0v25HLOoRUyvKEKylHUBEsjrtOG99RIFghtgws7cbTpaMISD8o
         OpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750788826; x=1751393626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2BDuY3TQuMxlT97CpLHc0HQj9uQaoAWTaiKt1gOmVfg=;
        b=UqRbEe+eurvz+Ta16BEBCIuu4vPuUmzV6iXJuLSh0G775/gTjBuzufeiVodZHhBAmy
         fx5HWjPCUVzumhl4EHdQDJ1kdTDtk4wV5wjCY6NrPOTlFKh4ebdfOZjX2LfMBwDfC21z
         iG0OpjcdpfMZR4a4iYpFsi32/KsGDCbJ0fDXUm5AN9jp3THcEM6y5SrDgK89dwJ3XA+N
         oc9g7d1lXxN5c5E+fasEmQ7fU+VgAmFY/G+412rUVuNUNHL79cuEZCtO49EMhfh8YiYC
         WefWKfuGqkpYX7WSlinZZzLrUsn9KIqAduQPKRkRT5m8PjX24Bg+LW0hcwtOyE4v7na3
         JHOA==
X-Forwarded-Encrypted: i=1; AJvYcCUyMfNBj1SgOKPouhgKHqG+uJ5rJZWqszMwQ2ZYc+mZx2963OdBzMdeGH2zjeX3dWm5cOn24V3ff7Pg/qM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo187zoGbi/ZyI/0CPTEKoS0AcY7iFjbQipaPquxN0uFyg4IUI
	GAoTxFo0NprDfapPz7gtD8N3OfcT0R9TL3LEqUQWQqlpb1rFsqLAzzquON67d4Wf/sJAgGb3LGn
	WREhI
X-Gm-Gg: ASbGnct/bsbCkSmsdMh65J4kgiXfgDZ5J4ujC2Ycknx1+n8Dztq4ClPuN8QIh0n/xJ2
	kErRhwPLcV6AoHjRZlzLteT7pFb0Az9QCMJD4WLhTwE/Fy1MT0znQgd207el3vL9FDzh/vwMxxe
	ZfUdYyPyTammEuCtGcb332fvFxeJMp2NoSvzyDtyE9Uz2z9a3ICCAVZQVec70HTXReXYI4KgPR1
	nWt9DtKcCMaG63xkpHljHAhEr28gB/vRe1amcHX8UgkC7lHaOtg5x5k2SMG5oPZi8o8gt25M5Rp
	E3dJ/6aw2aAsRqNITAcLUyhvfF70HGchSQJQv2IeYSZo91BpIuLUyRu/K9PC/9JEG/oLBFJnxZo
	JTvaU4uRDvS5j9zXeOrFN0ND29cH+MooxKTBQXvIhw3GftfM=
X-Google-Smtp-Source: AGHT+IGEQFq2JZkm7FgnV5H0r5TnpBmsM7o039o22X/+KPEHEtXzg0gc6VA/MUCWCOdeOhY8v66+Jw==
X-Received: by 2002:a05:620a:3186:b0:7d2:26e8:d186 with SMTP id af79cd13be357-7d42971d918mr5458785a.36.1750788826137;
        Tue, 24 Jun 2025 11:13:46 -0700 (PDT)
Received: from ubuntu.localdomain (173-206-114-64.cpe.distributel.net. [173.206.114.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f999c1b6sm532161885a.6.2025.06.24.11.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 11:13:45 -0700 (PDT)
From: Raymond Mao <raymond.mao@linaro.org>
To: linux-doc@vger.kernel.org
Cc: Raymond Mao <raymond.mao@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: devicetree: overlay-notes: recommend top-level compatible in DTSO
Date: Tue, 24 Jun 2025 11:13:20 -0700
Message-Id: <20250624181320.2810521-1-raymond.mao@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When managing multiple base device trees and overlays in a structured
way (e.g. bundled in firmware or tools), it is helpful to identify the
intended target base DT for each overlay, which can be done via a
top-level compatible string in the overlay.

This patch updates the document with a note and example for this
practice.

Signed-off-by: Raymond Mao <raymond.mao@linaro.org>
---
 Documentation/devicetree/overlay-notes.rst | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/overlay-notes.rst b/Documentation/devicetree/overlay-notes.rst
index 35e79242af9a..30b142d1b2ee 100644
--- a/Documentation/devicetree/overlay-notes.rst
+++ b/Documentation/devicetree/overlay-notes.rst
@@ -103,6 +103,34 @@ The above bar.dtso example modified to use target path syntax is::
     ---- bar.dtso --------------------------------------------------------------
 
 
+Overlay identification
+----------------------
+
+When managing overlays dynamically or bundling multiple base device trees
+and overlays in a single system (e.g., in firmware, initramfs, or user-space
+tools), it becomes important to associate each overlay with its intended
+target base DT.
+
+To support this, overlays should include the top-level compatible string
+from its base DT.
+This enables higher-level software or firmware to identify which base DT
+an overlay is compatible with and apply it accordingly.
+
+Example usage::
+
+    ---- bar.dtso - overlay with top-level compatible string -------------------
+	/dts-v1/;
+	/plugin/;
+	compatible = "corp,foo";
+
+	...
+    ---- bar.dtso --------------------------------------------------------------
+
+This top-level compatible string is not required by the kernel overlay
+mechanism itself, but it is strongly recommended for managing overlays in
+scalable systems.
+
+
 Overlay in-kernel API
 --------------------------------
 
-- 
2.25.1

