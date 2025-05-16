Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F3625D20E
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 03:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747364753; cv=none; b=qv754a567EUCi83YLSfaNo9koDxCqreXFfvktZikLiBkAhnRINTFnWjZ9ewiP3Rx0Ld+Ki16fkJjDpBHQ2murDbgTt1umzudDlDM7YvPz52iyGa8Xgfw0Yk4DjHo5Do8zFNB8mc5lJjCRkqEbrwx70HIoAmAzKamVVZbWTUhA+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747364753; c=relaxed/simple;
	bh=WuywEUgD6lUv/g4w4ipAXm3mdMwnrw6kFyN1PZoHZqs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uS3rDhJvBE94Arl0E2QnraUjAsmguy8qa0Mtj3xAclT2Bw4Liib8ESUUgzPUvbP7S8dfbzhnfuDFbTE26FJcot9BgUVYg4h5/U+PTmKztrwNr0K8+j9zWExOkDpCRQeCOpuhBNehFI6vJYWliWtr6UjZY590RAnMsP7AHzRWxhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=fSlZEVLa; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="fSlZEVLa"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22e331215dbso20328255ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 20:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747364751; x=1747969551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z7pOHXSYxsUxaKbFAq5uwqDuSfbReGsHyjruZTLt0/4=;
        b=fSlZEVLaS38f52GTEGqV7csENO+rvA58jM8hwYn6EvNZ0Y+QK2hKFZz18f8Y4Vfe6s
         1NAGeeXudnoykcaBFee+VLAVIJYu5IbNWUOT6LL6MmliL2lr9LiXmELfL4nJSgUmC+hA
         4aUkxe/k12F6lpUm0nUSM/f05AVHjWzHZ9IKAwSe/0kNV43UyakhEyraqEfqZFl7u5Oq
         Ye3MkhEpdRmIndV2TBmLjQWXWbRHfWolLS7jb+UM+MocS7oaIxYOcH4VM1mK47seO13X
         YX4Q+4tqPWOnqAeisPxYsmvs+bSmEaR7Vnfkh+ZilEKKhtdLmvO6uoD8gKV373wMTNCi
         DEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747364751; x=1747969551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z7pOHXSYxsUxaKbFAq5uwqDuSfbReGsHyjruZTLt0/4=;
        b=qL+NJTJzJw9oGslO9CGjIA5NxLG+gKXh2fIjZCq2QgBRMa4hZU8NaoTHPPFzX1jC3K
         753ZZEhWRNgoOr2s94SA+kKF0oUFnD1uLM/BpIbeYdpSKdpNNW2qrHeuBhk9ChWmtHpx
         bjaOYDPWb9mFqYWCry0v67EtIG4z2TbyPqBzvTpagZ09sZoPmJzmjzmFUGcQfY1ibmI0
         dSEx4QxUdX5pLxLuQx1kp+gjRM+QqWRZlp3U8/8FdHKuBRe0L1ASHxvhPTxgASPJyJ2H
         loTciD2L88MtTHctzYIGtXeAx3rZXfbFdFOY+FpPHy4tO05WTRVrJ9mzZamOcHPGoTna
         2lZg==
X-Forwarded-Encrypted: i=1; AJvYcCWcaD6XfmiRnUOccWOWzYGkkZQq8TS4/7XiOrlCGw97ukGcVt2Oi3dwJMYsf6gTwxkskZvfLug5XDVUn9k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVR3RJhje6a7DrKBeJdXw6GZm2EvJuS2+O3D/ZDideo0D2yzyD
	pWIEaBrDygsuKESEk6ArZtT9qBFwmCC/lx4RmfeLMhHRW/QMkiQ1+0tb/ZngVSEnGcI=
X-Gm-Gg: ASbGncumExaF6zuCoQg7kp8U8qsMZvVdtztyD1fOfPGrvtdi+ExRKGG+NFQ6ODotHD9
	yozHSpdMqFuTZmqlvBeaL6k7A5dPPiZc3LJ6A5b8yuFqRox5PNTWmIpg1axXsYWmniuBznHcbLK
	QjsC0rJ9fhGPGOG3XvQ8XscikH/KCGX4vFmKNJdlOKslyiSjhD8CGSfKHKLNhwoEttpODL7y2K3
	DyIIx9isoHQmNanhMWse5SSyXwyFFSxQA3vQEyvly+EiN3qb08Sx3mMM/pnPOV+9x5QYUaXOleP
	wXHcIFQVAEdCSxLQTDJYD3EOTdseDDH/7VyIH0jJFaECe9Q4E/L7CJo4mpDFJJwCL+TRUab3mH3
	g+jyc4cuSGw0=
X-Google-Smtp-Source: AGHT+IGSGQ1o4EfU6jvKJyK0KdV9naUkb1bONkc5+6ZtJl7+1gHYypaxCkXBkgWg6FreBtNlhcplKg==
X-Received: by 2002:a17:902:ccca:b0:221:751f:cfbe with SMTP id d9443c01a7336-231d4e64450mr21068285ad.19.1747364751569;
        Thu, 15 May 2025 20:05:51 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb084sm4804405ad.201.2025.05.15.20.05.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 May 2025 20:05:50 -0700 (PDT)
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
	Cyan Yang <cyan.yang@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 05/12] dt-bindings: riscv: Add xsfvfnrclipxfqf ISA extension description
Date: Fri, 16 May 2025 11:03:03 +0800
Message-Id: <20250516030310.16950-6-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250516030310.16950-1-cyan.yang@sifive.com>
References: <20250516030310.16950-1-cyan.yang@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "xsfvfnrclipxfqf" ISA extension which is provided by SiFive for
FP32-to-int8 ranged clip instructions support.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index d36e7c68d69a..be203df29eb8 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -675,6 +675,12 @@ properties:
             See more details in
             https://www.sifive.com/document-file/sifive-int8-matrix-multiplication-extensions-specification
 
+        - const: xsfvfnrclipxfqf
+          description:
+            SiFive FP32-to-int8 Ranged Clip Instructions Extensions Specification.
+            See more details in
+            https://www.sifive.com/document-file/fp32-to-int8-ranged-clip-instructions
+
         # T-HEAD
         - const: xtheadvector
           description:
-- 
2.39.5 (Apple Git-154)

