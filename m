Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F2F26A0A8
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 05:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744954480; cv=none; b=LyFdvqLakRd3kiFSFCdB7L5smUQohKtR5QrM/VI8swiRZoNRKtkm/0R1zAT/5BJl5fL4jhQoGylm2N/aPIzF4vcA2kmYHGg4So+wt4dKTEhwAxJo+wBw/ac0KwI81L6VXVzNmNmiRGi9/Vdib53BVmTRgg7+VUaXyBUY4Z7M0iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744954480; c=relaxed/simple;
	bh=0PmG2kUAxX1zAG7LTb6UrEUX0BYnTCe+djPTnhPh/Q0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oOnO1Z1KAzz9bwv+kt/B3qmTa9mjkWxkHc+/ozwfoo5OF1SYrl8ujLlHJeRweZTeoWKVihHXp7P9NQu49eigWlaQ33G/8WrFsWC7D/lYGDkGU4U+KZ27eDq6DvyiOa1dwXNnE8dH+oES6m0787UHQJP0NRnAEo7YV7dXbxZ+TFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=dupRp4Dp; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="dupRp4Dp"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-736b350a22cso1329422b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 22:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744954477; x=1745559277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeXD1vINQRN3QewI2Od8Ka4QLQVzf/gksNoTw/gr9eg=;
        b=dupRp4Dp/izT3JKvMItQnGhedTDPWL7iOMtYJ3YZKJhYwvBJGznn4FwrygBZCxvNF8
         kYaKHFH7z4CNETZn0FzoQgsVyDkZSC5AT9PdyfC6q6F0h0hbCYQ4AeD9ckccMHfSj9i2
         lLMuGDgcbiPx82G+filKuICaSW7PlrmaO+HbI/8zGgWGlnyH/awi0+6c3aNcjTDB28ly
         nFUho6+Qt8tWx0CdvS7JNzMQy47uKYm2ardbLnINMJhNJ51xlDCp7LJIunK2L11WIqYR
         MrBMqovj4np92Yvl4KmxtlgCycbpgx59bo0ILJqpFEchH+bwgxQQD+4WRUAFnTuU6iZG
         LeZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744954477; x=1745559277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HeXD1vINQRN3QewI2Od8Ka4QLQVzf/gksNoTw/gr9eg=;
        b=M79essKVgbn1DqRGIYiM9dU6inTJkSAo7zVOJICa5X6rG8mYD6mb1dBI/OB4rpVRJM
         EbtXEVrRUNt27hchpYAXI5cSBCt86QAMdx915okK1Mj03KCmqozfV3/0ob8z7Oo7rNmg
         zDqp7eLa4XD065pKgxnCcu8pVa1zF8EXvVTIGf9B37z8wBLDBLnhxP2Q+R8cq4t+WSQS
         xbOerJslhkx83aEhJHvmrMi1+3m8leDE79FvFo1Nz9ZvpCTK+If1dmW3b0UQ9UCaEj7N
         Vzh0KFsGCw9vSsEAMb7HLmuLL5hQLs3+cPtTvHxjdPUDjZoE7X7C/Xcj1MlPvUowcVdQ
         8MTg==
X-Forwarded-Encrypted: i=1; AJvYcCXqGzpHqQqUCmgbU5jXy5v3tN/ccbpXd0miEzxxH6K4tJktRVc/gpM9QmcaxEVBv2/pD/ERgqs/yBJpUV8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9mR8aM1mAe1/zF6Uw+ruddpscRf16tkP74kihlabBfbWOyfVX
	YbU/JklaKPyjmB0V7DxZZKFGIrN7JNdiPDtAOaVUYD7NDVn2SprE7rPnPIS0+Q8=
X-Gm-Gg: ASbGncu/l2QX1NnWNIcNH0imYcsg/dr2AJRuiC65Vq9LgPeAdSCBMtuKgRkuapYfeTi
	4+8VRLzo4zyEPv7AuCaerwM5EctqpCUWiMNxagiNFhTs/ebnlQBU8SMEUIkya/yaEcyZoNAnnqS
	DtWvfkZe/uXKgTU13E8rxpCf1yRJWSvkMqW6uFT1nxFEiZ3UDviYFB8G6fn7C9V7utatPVnGdpW
	OSEDa/A4hNF/hXesSQ+A3XIyWEWa6rFBHyBgJ2uKfcOef2sVROV3ux5QclF2BaEUdcYfAhsjXE8
	1IVBIUGM16ph+H43isSVZIdJpefFE2kfSokGOYQ7OlEnoZbCgmpEe+XNXXpWD9zH8EKmepUQfRE
	u
X-Google-Smtp-Source: AGHT+IGAIspWR8mvsi/9VEF9Vbfa7oFNnK4tZiRAuDzjqr+y7NEoN7U5AOdZ+OKJal+M1UQ/wWk0dA==
X-Received: by 2002:a05:6a00:4608:b0:730:4c55:4fdf with SMTP id d2e1a72fcca58-73dc14a8851mr2022503b3a.7.1744954476983;
        Thu, 17 Apr 2025 22:34:36 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaed86csm834555b3a.180.2025.04.17.22.34.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Apr 2025 22:34:36 -0700 (PDT)
From: Cyan Yang <cyan.yang@sifive.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com
Cc: linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cyan Yang <cyan.yang@sifive.com>
Subject: [PATCH 09/12] dt-bindings: riscv: Add xsfvfwmaccqqq ISA extension description
Date: Fri, 18 Apr 2025 13:32:36 +0800
Message-Id: <20250418053239.4351-10-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250418053239.4351-1-cyan.yang@sifive.com>
References: <20250418053239.4351-1-cyan.yang@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "xsfvfwmaccqqq" ISA extension which is provided by SiFive for
matrix multiply accumulate instructions support.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index be203df29eb8..ede6a58ccf53 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -681,6 +681,12 @@ properties:
             See more details in
             https://www.sifive.com/document-file/fp32-to-int8-ranged-clip-instructions
 
+        - const: xsfvfwmaccqqq
+          description:
+            SiFive Matrix Multiply Accumulate Instruction Extensions Specification.
+            See more details in
+            https://www.sifive.com/document-file/matrix-multiply-accumulate-instruction
+
         # T-HEAD
         - const: xtheadvector
           description:
-- 
2.39.5 (Apple Git-154)

