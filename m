Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED3917A318;
	Wed, 14 May 2025 14:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747231783; cv=none; b=C/rlQwKF5XispzW2DEwiIAxwBDwbeu8I77XyJcIu6oQtSiwpbLcu51J2lw79tJVw3ukc4ecCRTEJ8QB1NyFZaIPmLN76+ngxXJzorS2irqWmxpVYaI1zirF+D+oNRH/GwtqAcWDplNQraZW1/3+Z0F9Hz5/F5/CFZ5u5XxZSmJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747231783; c=relaxed/simple;
	bh=jtuwUHlX3+iG8Fi9cbmKTqWekKcTfZy7Iw99rXtY8Io=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vpd1lcNj2oV4yjOi95gKSMcDJjdaSB7ytv79Z+TFgZed7bTZu4VGMMh23XJA8PuHDg8aGIGSQaQUv8tYJ+sg/05c0UFJkd45y74hYtisnYQaXvr1iLRT5stL3CMaggnEw2qkmkWQwqGPdArJcder9B7VBrX0syGsWkBKVdZsNCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hghmHhuW; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hghmHhuW"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b24f986674fso916596a12.0;
        Wed, 14 May 2025 07:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747231781; x=1747836581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mi4Jjo5G3GnzckLRIAYTmEBkSD8of8vYNq8Vo6cNBQo=;
        b=hghmHhuWelix9B0aP5VMczFca937ZG4EyawRnwb0qM/S5FfjpPEXJfeGkP4B+HD9kq
         dHNU5OhB6kCBvRVieuJDv4jt5H7+1wKL2dLEg4yNGwFwAt9ayK1YtDOJw8HvRKmiW4uY
         MemIz3Ag9dBEXE1ZdRT3sOY57HU8dPrR5i/QHg1zMOZvJ3xXjUrl5yWO8tAk1NbzHHSZ
         Z8rJlzxtDRRNruK/TulxdVRcxSgEHRG7+BmT41spNUFHh3byV7qV10nDmMc1BbtsTamb
         P3mievNJoWAlZkaCQX7+FYTBQogbwM1ZUQdAzAQUg0A3FWyP3jBcpnvNT+i+WiV8/mD5
         NyLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747231781; x=1747836581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mi4Jjo5G3GnzckLRIAYTmEBkSD8of8vYNq8Vo6cNBQo=;
        b=NlqbERTcF5U7sqeYL+QgrMwQA6IDooXlL43K8RuUXJHaec7ifWrSDqFvt6mO0Z7LJO
         SBxOujxFQaGkwc937Huv2wEHPMEaxy5YGojc7b4fGJCIEjVGstM0VjX2lq7QONPPMtSI
         X0u96w0TfjJ8qTKJ0tV19sfES+n3K/lyAMwrqg5uJpo5uaDirfnQfXeqBwIdbefvvcFo
         k+hJoNDZ9SLyG2X4dCsMmBRJyVGV8BA2tsTseqU3dBj/HcxZ88jp/IPZDqrZxwPT9VsN
         sB7ECTFhNog79Ra54syt43Gw8K3YVqeQKLi6EC32OBzu5mVt4NTQ5B3rVgdyi631cWyx
         l7VA==
X-Forwarded-Encrypted: i=1; AJvYcCUafxrLtl2XIlbZ9ZVM14uEWEeBdSCnm3lNuB3X1XNWWL0U02fgYGGuWhPxgxuIAGNPVTshB/6415+6GPQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkgrCk4lCRXzlk7A9KGpile/PWrgO+yshVJMe+ezf8oLaWLC8G
	eTfH0jJ4IFPOg8fLhDoUzaDgsXcDWOaXBigac+Uim15ldMp9EjEVi3oDguKwlFTW9Q==
X-Gm-Gg: ASbGncu/FeeB5QTs+u8U5QEjYWEjbE+lyBt+FoQodOgkRsxXruxQv8Y4Mb1iNONZsFh
	oq52NSRWXGkkgbaVJqWqcsxqs7baP0AuSZwVEaCFpzgpKuIFG1e9bpZA8Hiu9xjBmc9JCg7QpK3
	Nr5Yd2885zVPJJFAnJG59CALmA/wqvN301HoA/DLCxmLsrq+sbBMprCa7zNMb6nEUohzAabsowi
	vgvGsiZP1xT9JrkrqtQKLYbmtKAf5PeXL+u0v0MV1o6wKtBU1iQyhcVFPZPMm2lDc2mUCxGyGiG
	lZ0u/KnC3Cqu92G6BXBBAtjxxiAPHgvFYqbavogrPk4qC55VP6kHJNnXfGbWig==
X-Google-Smtp-Source: AGHT+IFeGj2HFjh76QOSi0Fc/JuAVTbh4RgUmkQMbFSYupsEYoo5O+6KS/6gkrMF6eL36ZIM3Ny6dQ==
X-Received: by 2002:a17:903:2f88:b0:215:a56f:1e50 with SMTP id d9443c01a7336-23197f346d8mr58402225ad.8.1747231780498;
        Wed, 14 May 2025 07:09:40 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271ae0sm100407975ad.128.2025.05.14.07.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 07:09:40 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <rabenda.cn@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: riscv: add Sophgo SG2042_EVB_V1.X bindings
Date: Wed, 14 May 2025 22:08:59 +0800
Message-ID: <b538e2b24eab8b740091d80ca76b20ef6014a4e5.1747231254.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1747231254.git.rabenda.cn@gmail.com>
References: <cover.1747231254.git.rabenda.cn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT binding documentation for the Sophgo SG2042_EVB_V1.X board [1].

Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x8-EVB [1]

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 Documentation/devicetree/bindings/riscv/sophgo.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
index a14cb10ff3f0..6c82f89b56ca 100644
--- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
+++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
@@ -34,6 +34,7 @@ properties:
       - items:
           - enum:
               - milkv,pioneer
+              - sophgo,sg2042-evb-v1
           - const: sophgo,sg2042
 
 additionalProperties: true
-- 
2.47.2

