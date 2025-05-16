Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BAE25EF83
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 03:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747364759; cv=none; b=aD9tYeNmeuZajgTTUv9M9NjpP6/fvpF6/0c77Ljd1V7HBtoCT5Qxe482/O6iIT3VWSg1lP5MUiMZ2sIfAuFfodnUq+c9nEZ99EfNHC54MQbvrOm42A3ucZt+E/GtVMg+AKXHAdnqQ5F66QB6jROC8UyPFI8B8rV5WQ98IkszZ7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747364759; c=relaxed/simple;
	bh=nsgtSaTn5UMmzY8W/ttdkLr3ZbgDZmLHCd+an0LcguI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lz5Rw579YAuK3CnpVMcsLgjvsMV8EAqbE8EwWZ64LvYKlzsHNSkzRQ+zJLwBR0F7M7aO5gy3pTKx/U8OHGrlp2KAxM64a0/JBtkJ/FWXMf3qCtd7nHQ+D29cFG8MkB+yqe+OGlMQ1Ng4F36fGmPdQqVTziHu95iO3FQsmMamMmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=mKIIiEd0; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="mKIIiEd0"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22fa47d6578so15163525ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 20:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747364757; x=1747969557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5/PDhz3AlgX3PPZzfN/Kg9kUFezGYCGeqp5UVya4gU=;
        b=mKIIiEd0a3CbzOyO8COl1IW0UTYIjEpHMEEtPc7QZJ6obtCDhwHqtD2+LOx5OhrDJs
         t4HXaKg2CCltjRxMebVVEWkIsZrRARVuHdxiE8djAGWrjccR09Nmsr4AFMtsAARbK1BL
         eePmHp8BYmQX/cDigy8YCsBiA9W+gyOL/Bijv97oXk2idx5LvFii8LjuRBeFWNldHoog
         AjPPN+gqqS0YjnBDICT66T0pywZSSfAQX6m8t7dtmGxgdDRDAncA6Gz3n2C+sfmMe20S
         Cafyer2EyFzBGeBzJCzk0a0B/fQx08Je38Rgr5gMfanlSG7cjIxACl//EVPDug35uGdy
         BGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747364757; x=1747969557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a5/PDhz3AlgX3PPZzfN/Kg9kUFezGYCGeqp5UVya4gU=;
        b=djqJGDPvN4msvhB145rSqcw6vizTT6UeNgdzATKEg2B4AYmu/UZvPfeFgdAn4UcuHn
         5zBGPsVNKpfTmE4KWL6Eah3YwHc+cAqmOEZMobeGJ3n7bgXYo2Ta/evnKSnj/N2lQiO5
         Wga+xKGa2m4bbma+umFIv4UCGcFULmxN57waWl1UtDRWjZdSCtqLpi7mAIY5zJlxRtsk
         mJVmNDbVv7N9sO/RGrjWByO9180mU8D3ppqTU732aakfe3OEDf+Jxxve8tU7tDWw+h31
         5yrULm6fPtfc4r/GbcKxnVWalbPZIQIMI7JOsROsauH8oO3eSQVctJeZhw6hkDC4/IF0
         7PHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEs/99Zy/SsQbY+P4Gd2TrRPhs83DAEvgzyrvWBJvCT+f63ku9kj6OlJQIskA/mvLVfMRrtoh0rfu7lkI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3CQrjuDg0wGImfwbjVUMzcWI7PlnH/983wvUB81ZbrxzZvaf1
	Ec2VRLUf149sC6dTopWGXKFIp30XpPE1MWsJWxJQQuuO2S+3Xteaco0XK8aZy8M9h1k=
X-Gm-Gg: ASbGncuW+rfe1SgtcZb8q+8UdtFSLL3UBJ6Oos1de1nprnkWW3zcRtyxEEpL6dAVIW7
	rifxwYNeP86fDEJmYIlr+1yapNuD+G/BV7zKZqMK2jp8GYnVmQTkEEkDd/mHv1ns8pnQbDXtiHy
	Eokc4bneDJ2XN+hKCnPVaPBLLgfE119Nbj9O1OKQNWIgS8G9FarpZp9KA/AAfZYdYx2+rdhghPq
	vYjxJxjFer6V0H7PBae5PaT4LQ3EKqDN5ATJOQbpuiIZgpmjoK5A11zbUDMMtewkELm5/QvFwLZ
	xRA5Aj9GBJxjgFqDsS82bWZhpsyWiKbccSSSoaCYuJ9OUAm8o/b+2c55/uYlbjdZdEp5DNuDXqT
	a7cXSVEGU2IE=
X-Google-Smtp-Source: AGHT+IFJbPUK4tMDRuGc+co241YfBHz7E/gRc2tzvQ+RafzudJUC0EH4MsxgVnUHPIA3yanX+bcZ3A==
X-Received: by 2002:a17:903:2306:b0:223:5124:a16e with SMTP id d9443c01a7336-231d438a1c6mr23919555ad.5.1747364757539;
        Thu, 15 May 2025 20:05:57 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb084sm4804405ad.201.2025.05.15.20.05.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 15 May 2025 20:05:56 -0700 (PDT)
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
Subject: [PATCH v2 07/12] riscv: hwprobe: Document SiFive xsfvfnrclipxfqf vendor extension
Date: Fri, 16 May 2025 11:03:05 +0800
Message-Id: <20250516030310.16950-8-cyan.yang@sifive.com>
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

Document the support for SiFive vendor extensions for
FP32-to-int8 Ranged Clip Instructions using
RISCV_HWPROBE_VENDOR_EXT_XSFVFNRCLIPXFQF.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 Documentation/arch/riscv/hwprobe.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 16085b2ee64e..e15405e12239 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -349,3 +349,7 @@ The following keys are defined:
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCQOQ`: The Xsfqmaccqoq vendor
         extension is supported in version 1.1 of SiFive Int8 Matrix Multiplication
 	Instruction Extensions Specification.
+
+    * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFNRCLIPXFQF`: The Xsfvfnrclipxfqf
+        vendor extension is supported in version 1.0 of SiFive FP32-to-int8 Ranged
+	Clip Instructions Extensions Specification.
-- 
2.39.5 (Apple Git-154)

