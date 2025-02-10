Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC4D2505A2
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 20:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739219209; cv=none; b=CuXsQ5adI+LgaWMgLF4ECTqTLP4bm3NdgtENC9V3+Q143GrHi/C9m9HQH62/agdwmPjctKJgf8N1ONxbvUt/Y//8EjVyLENjF8Quxi93Zsw+lHTaTp0/SqSgm4MxEOke9ZYUkSbBZsyr4GPQ3wYb94gJ77189otFWDSXYxLNDBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739219209; c=relaxed/simple;
	bh=DjlSjyKZg5L1RJtFrw9Awsbe+InTSaQHdJt80sHp1pA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bIPmfLP5zOtNLUmkBVKM6ehMxs5RoQFugAWV1Z/RSpaSAfBRgqCNDIceayqTvqG2+FWzaNWfMw6Fc0JVSbnIqPItKZhvCmEMVLdru930OoCwtr5zyqtruIPyxL2CUcAK0VvvaYws54QnBHbtn62vLVZL91rgXJWySm4MD144fqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=hNzYN8Ij; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="hNzYN8Ij"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21f78b1fb7dso30616505ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 12:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739219207; x=1739824007; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kHEXIimjUTXAyC0fOzh8XAkym19Q72QcmDI6hc+cq4k=;
        b=hNzYN8Ij6heIG7PbOVHPJU2y7awRw5Xrn9nqukeLQXCcQAPvDh1EIhE6r/QcxCJlqS
         GGvE5O8yh+ei1E5IsYc1C21EZ9ou78ojYNzhBwZW+v6lWBjPj7BYx0sXmuQ14Ha7TqOW
         xBp+bdnYsVmeUYUIyabNFaIbroqqFZHQQN7OjSWmInclr3HXmVWytgcqAW1ti0vyvYaR
         wzUtujcu3iFervm0c//2zJRrTn/JjZy9QpwLSFsr7Z06NKzLptyYI6xFrRkNykGBGBP7
         mAAJdpdD/U6IJO2Byl0/7c3ztA/3EgsmqCJL5k7y1z8MoxXxPAUg3XNQP9PLuatDl+3P
         oDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739219207; x=1739824007;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHEXIimjUTXAyC0fOzh8XAkym19Q72QcmDI6hc+cq4k=;
        b=O4yp3JqsX1anvvWzIpIZ+Gb4w5UqgrYw/MWnUXUKoZZXg2w8Y81OOrxrRbYXWygH5t
         a8t8Zrw45hHlQz9VHvab01ERjhOzM8Kb8DzAafO96Tykew3332eHF/V7wp0IBy4y+pdW
         GdGZSbCVFvN+ANuYdO8TqiQb2gMTcrietR+Lm5QK55sPHpiEVsQxHBF49pZIee7+F6gz
         cgddBcj5h597x5zI/1+UZJbdkRL4MT7TD75qqrya82gk0qRjCvfVIweEe08khG2xrDdF
         /DBY18q97J84qfNSNRwSnyaMkO7KyLuPepzM522fS3XMl/B/1efmQ28oBJeZ33dnOG1F
         z9Zg==
X-Gm-Message-State: AOJu0YwuTq4qSWXZUbE9LottiIQxK8VJbjJPvK9h6jBnJbtykxQgmkc8
	G5sxvZEkilUGv64sAoySr1dJ++2M0rAhbY7S+4dTvZfJ9iLlGqrXSpRDKQkGiRQ=
X-Gm-Gg: ASbGncsvk1g+SWE8TcyC3fE+3pOrPkZ4dWmbb3KSUHz0rk+VsKu0sHBYFinVwxcapCf
	WAmFp2xTgiOBacT1JCEcXFl516zdd7VjiDYkJ/AsWTQ3bcndn9LdqL9TkkoWbAMbMzHV6KxpI4E
	AqKc/hTPAIxEp7rUJ9UpxAWQOGxzxMT0p1SgCz4uzNIeFg8SjBfBe1mrOG2qmGnqZGPiZWAK/OI
	4ivguumspI5ItZ+jajLkrNQDj4lS3muk2+aHe6IHL5B+n6uyR3Gyf7/5ykvKFOMgk7PZokkfjZh
	zkOE3R5WJzYdCGINJ/rSIxp4qA==
X-Google-Smtp-Source: AGHT+IGXqRpNguUrMSnJHDFrz3qQhRvvMy95jaGz8XHpdEECN7AcOh1dWxqC1mHx3x1SCoyBHua2rw==
X-Received: by 2002:a17:902:db0b:b0:21f:169d:9f39 with SMTP id d9443c01a7336-21f4e779cc3mr280440675ad.46.1739219206908;
        Mon, 10 Feb 2025 12:26:46 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c187sm83711555ad.168.2025.02.10.12.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:26:46 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Feb 2025 12:26:35 -0800
Subject: [PATCH v10 02/27] dt-bindings: riscv: zicfilp and zicfiss in
 dt-bindings (extensions.yaml)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-v5_user_cfi_series-v10-2-163dcfa31c60@rivosinc.com>
References: <20250210-v5_user_cfi_series-v10-0-163dcfa31c60@rivosinc.com>
In-Reply-To: <20250210-v5_user_cfi_series-v10-0-163dcfa31c60@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0

Make an entry for cfi extensions in extensions.yaml.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index a63b994e0763..9b9024dbc8d2 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -426,6 +426,20 @@ properties:
             The standard Zicboz extension for cache-block zeroing as ratified
             in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
 
+        - const: zicfilp
+          description: |
+            The standard Zicfilp extension for enforcing forward edge
+            control-flow integrity as ratified in commit 3f8e450 ("merge
+            pull request #227 from ved-rivos/0709") of riscv-cfi
+            github repo.
+
+        - const: zicfiss
+          description: |
+            The standard Zicfiss extension for enforcing backward edge
+            control-flow integrity as ratified in commit 3f8e450 ("merge
+            pull request #227 from ved-rivos/0709") of riscv-cfi
+            github repo.
+
         - const: zicntr
           description:
             The standard Zicntr extension for base counters and timers, as

-- 
2.34.1

