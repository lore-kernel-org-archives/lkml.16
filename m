Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A79269D0A
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 03:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747364766; cv=none; b=PRvnYxcryVLAcL9RzIHuFnQOJJr/8SDbjRoYmUJZEp9Gi5uxRnxIRzONNXVUEdyCDNFocx6srjvbCccOb9y2eKUsPXhlm5AZ1iM1EFOCKZc9dedMkzjo+F2Hx2e2nGFfRKXL55a2ZO5aFGeZDkZwhh+yc+f3IFtqE5rzpGotrCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747364766; c=relaxed/simple;
	bh=bhQWzwzdrX7ubPUq5r19cW3FDkwf3YUojySLLaA/ijI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VL2+Z78UpCFl8UUunN4/G72bQUYKK9Dp6meWq8DWaXujXOTn5E+w2lw6guyS5W+lNk3sgUECbKu0SaxC7XMklsRRieNEbToRxExfAK8F6sVZ2dWV8cPktVqfc/Th9lvnKSS3PO0NHyQoZv97LSbHcfGejiY0oqMstdikRCzU8jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=UijzKf/V; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="UijzKf/V"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-231e21d3b63so1659945ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 20:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747364763; x=1747969563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=weomedr6rI+xMErQTjwbgFjghxDoWxu8k2ihmuNB5oM=;
        b=UijzKf/VcEfqbeXlziOtxoPFpRU9y5goOesPHRnvr8/Nf0uSf8MHpGWgxVV+EFkD6+
         797+ODpV+7Sonuv5d+WPahftrIidp5aO/I0YHy8Bi3p5BOb5y4ssmtV+SW6SG3b30T8r
         k0eFHHDG0Q55iq76n/P6qDlT1YrgO/+iy9iIevCmO9gyrUuaTDaE2ju1wUKucgC5X7NI
         xttcaBERMz4S251AFKW1F6fPMO+aRobhh4ytPNKIOFnvhDKJsZA6diE4CsR1wdzo10wL
         17kneljzMRgJA6A3p1p2lbRQDRqqW4BOqclwplwQhn9nn7Jb7wgvxL8NYCQCBScczrqG
         w9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747364763; x=1747969563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=weomedr6rI+xMErQTjwbgFjghxDoWxu8k2ihmuNB5oM=;
        b=CK/T548/lkriWkdH9Fl2vj4Lj/ptU9bS8HirXCXewK7lGho0ACLP0UgEZQiRLkOAdA
         373/LrXoazcFHJrryKrtURNtwQD5YLCglg8a7u9f5C+cTIO27zSPM7q0ozztGPiH9XSR
         ELlyl8z3nAyd14N+Wxp6SLfvFzdvcgzXOgY6gHYHEAkKz6VuEyiJYq6rlgX4VeypgrpN
         jRyFQDK/WIovv9iqB64YBDoAQhatzpYSMXiWQbAPgTXqrYGbnQV4qCEvsERY2+FS3fWW
         9F5Q501oRkaeQvysjaw+J2/tlh/xp4LbnVnqnjWtkXKpqesd2rBo2IRw8Kz6bohEonRJ
         0mGg==
X-Forwarded-Encrypted: i=1; AJvYcCV/7XYpnJufV/MSPTdljT/lkkmaB4QPOi0liPey/d7qlRFASjUAcLTHiKZTqySlFwh9XNe+RTFAIt4gE8I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUI87uzfyA5LhOTXGKiH/vhIouSqwkS3wldTROvOEWKJdA+bZD
	FUUuh+n+erq3eK94jqfZKitEq1z9qIod1AzahmHPRsnrIzNOGAub+0b4xW4smpa5hUw=
X-Gm-Gg: ASbGncv7p3EqUSoBS6QjmzXVaAfMpTraEqLLfcC1ykmTMIYQ1W3JVEbZ/MOEaIDm8XW
	JZR6O9LCdx2cgK0NXVB18llcrvLAtKpyZlwfjypSUgy5lq6aHoIIFxe5sA3pXqiBaHbe5W74Ape
	WfBKeatoGYESxTBGVGs+QSnYAyeAobyLt1ZtURLtWErRQ6MIrgGEIUUw84PQkouPs54smOEm9mh
	GA2HDjcXYKJr86kEUNyAK2B01OzN71Proe4dykg7NRMZjcAoWms/qvViH9W336QJ/PfSPcfK40/
	zzIJnoAgIvi1V7wjZoT3Gs7LPm5hoRcQRO7cAwTzN0X392qlupfUsu2ejLqKMMCWk2tuSlxZ/fn
	n3TmNa4Laves=
X-Google-Smtp-Source: AGHT+IFhBAB1eXwbz44Tr8KVKAa/EYR58v7s/kJ7HdKTeaGSBrcNqWOoBWoIKH0YeOJevu/4lqzf3A==
X-Received: by 2002:a17:903:46d0:b0:21f:f3d:d533 with SMTP id d9443c01a7336-231de351537mr10196975ad.2.1747364763529;
        Thu, 15 May 2025 20:06:03 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb084sm4804405ad.201.2025.05.15.20.06.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 May 2025 20:06:03 -0700 (PDT)
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
Subject: [PATCH v2 09/12] dt-bindings: riscv: Add xsfvfwmaccqqq ISA extension description
Date: Fri, 16 May 2025 11:03:07 +0800
Message-Id: <20250516030310.16950-10-cyan.yang@sifive.com>
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

Add "xsfvfwmaccqqq" ISA extension which is provided by SiFive for
matrix multiply accumulate instructions support.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
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

