Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A27021ABA2;
	Mon, 16 Jun 2025 21:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750108943; cv=none; b=KOEkXJ0qGfLXwPiDmV2/mXInIL6uGrglRsY7d/vSVx1u0i5aJedvCK0Zkn0jCQNf+6aRwzFZ6W94d9RzUzeQT4oG3z/ZmLD36GB+RdPI3JvKDIr7o21MrKxaI+IjzLrhyCMtp2WaAppR4YV83gkZki3rEAy9FCUcmg6NAjA/kaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750108943; c=relaxed/simple;
	bh=a2Zp4b78rGMBJSjIOifJJ51hx+TLzbnCibIgu8JxHwM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=j4GFZeNlufcBkg8TYPt1n27ALgDaXFlGU2KnM/eJqQzA2BDsqPeLKUQJtwG7OFVNG9J/l+XIn16gNaDhpK0RtO8kQBC3WlKDlRUiGN1BtmT/7NQA5/Hm8dNaXYowS4Vov0cl80xs2MHzPvcaaMQR2n3tcjlkiVAzHrRrN7vpd+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JNAhD7Qh; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JNAhD7Qh"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-70e5d953c0bso52310457b3.1;
        Mon, 16 Jun 2025 14:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750108940; x=1750713740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ESidNUnPun/hd2HxPwnnanB3kSNyrGFR0AtYUeuLpCU=;
        b=JNAhD7QhVsbQNzc83Iq4s7HYTsEXYhUDoiag4bxR8/omnxsloyYe/ONreF/smo7JKr
         MVdD9lFStp7O4PN1ySp4fnygTF+B2DPMQNn4E1nWbIANvjgclDCiUC0zFSQPzRP1nNll
         0u7U68RJvFbb54HgwC6e3eoS7dEv1FDdLEJj8zGHTpKFtlHLPGtO0HH+6ZJaLhLe9G8i
         hXkU6s1UOFReYI134gLbDOdbmO7GV6aGoJtYweZ3i6rnuPOy6G2DNUHu5LvNZsmAJBmH
         DB/3wIY0p9owvMCJuupQJpJkYQFN7b623stdSjZ2i7gQ5IWoyaG7DNUN7FXi1Vo/yIv3
         0+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750108940; x=1750713740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ESidNUnPun/hd2HxPwnnanB3kSNyrGFR0AtYUeuLpCU=;
        b=IxZfgUSfP+tfBV14ltH9UVCaA/woOjc35twfdqu36m0vX/cEoFC1A+wPCFOybb3s/I
         FqJnJ2r3RKtxIOdmNDWkFCWyNGN445cn6xKUgrEd2PFLUzrC0VkbspahyJaqrefXEVUB
         QJ070YjfzZ1eDT+0Z29fvC/DT1TTOv5AanVY1QUHcx3kTvfkqEWINbrcREdyoJsq6vNE
         iZoZtJpNAuu4jFQMEZCHtupWFKtTeVWWcydC4j49aYc4zB0jT2gQ4uxO7ACHoBoXVJlp
         6Xm7TayWOuZAAbt+qwIcnH5mLwfu7B/jzLpDeqLqA8NyXzZcpoJV5RVcnPzvJbJZiVZs
         AAUA==
X-Forwarded-Encrypted: i=1; AJvYcCU0WKn4UV6sR7E32naVyOsn6TlQ/qFgkClf52AD2Jwjr279J0BH9sRf1b94P+CDXQcmQHVIFgeJz8iwk/a+@vger.kernel.org, AJvYcCXWcXWihjybAkNLvC59skuEefbE4qZEK0X1TnZN1FmiVeWmM5wDEMiquoTkC590cwyiJI4RupA2C86h@vger.kernel.org
X-Gm-Message-State: AOJu0YwdbVPGQ/VeCIURbgdV35Ux1NN7fPxpDqKvDJL2Y9aurvhKFjFQ
	41K6/BrDnSATDFCcVmCgaXWFy7vtOBeUzJOU1mLd24EeRjAv9HaqFbFr
X-Gm-Gg: ASbGncujWKZrvx+/4gKLAJFLuLdtOZw3aShHwQq5Vd4nAgoAtiutRbNIcBSkcZQzI11
	dnQiqWfk0ZV3u7bmYLI0iDWKvzPIgMTptmcvDO4ULUIU0+svrU0MA8HfO99tLor3YSmgiPMZzFK
	eamvOitE0aDvZKukL9dTa7Ln56xpZlLks/6Jww5qGQJrXPtFsqbLuqV7PnqCq+sRn4mTeOLNmgE
	H2tlWOpF6V2NkhtD6D80XPb1nTT+RGw+wCq7sgggWLKs4hK/vM25cTiJs6Ldah6OZO/cg6nqgYJ
	ze1vkRM7HldrzzTNAMdZyjrRXoSqsFtmChBRJ5Xtla45/bCm2Mh7aAxtn0KxNyvQYqibC2k=
X-Google-Smtp-Source: AGHT+IFTpaVK314wZKQhYhkRdFu1fTZs9zVmbqcOWMBnqY8mNxCxaKhIMQ8jPwrYsXsHzyL8/a4zxg==
X-Received: by 2002:a05:690c:17:b0:70e:1d14:2b76 with SMTP id 00721157ae682-711754df796mr137346247b3.23.1750108940011;
        Mon, 16 Jun 2025 14:22:20 -0700 (PDT)
Received: from localhost.localdomain ([192.34.165.40])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7117bc177d3sm10418837b3.44.2025.06.16.14.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 14:22:19 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Clark <inindev@gmail.com>
Subject: [PATCH v1 0/2] Add FriendlyElec NanoPi M5 support for Rockchip RK3576
Date: Mon, 16 Jun 2025 17:22:12 -0400
Message-Id: <20250616212214.139585-1-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds device tree support for the FriendlyElec NanoPi M5 board,
powered by the Rockchip RK3576 SoC (4x Cortex-A72, 4x Cortex-A53, Mali-G52
MC3 GPU, 6 TOPS NPU). The patches enable basic booting and connectivity,
including dual 1Gbps Ethernet, USB 3.2, microSD, M.2 PCIe NVMe, and HDMI.

Patch 1 updates the DT bindings in rockchip.yaml.
Patch 2 adds the NanoPi M5 device tree and Makefile entry.

No MAINTAINERS update is needed, as the new file is covered by the existing
ARM/Rockchip SoC entry.

Tested on NanoPi M5 with successful boot and feature validation.

Signed-off-by: John Clark <inindev@gmail.com>
---
John Clark (2):
  dt-bindings: arm: rockchip: add FriendlyElec NanoPi M5 board
  arm64: dts: rockchip: Add FriendlyElec NanoPi M5 support

 .../devicetree/bindings/arm/rockchip.yaml     |   6 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3576-nanopi-m5.dts    | 969 ++++++++++++++++++
 3 files changed, 976 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts

-- 
2.39.5

