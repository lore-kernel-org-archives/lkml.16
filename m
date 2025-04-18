Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66001268FF4
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 05:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744954484; cv=none; b=CZl3sUsyZea9MZ5PXusAvUjutoCz2fbBvNWTyPQo/bjljHmmZYUK3JvG+LsSbBJEqPnZlwLVjIhIDID+DFQ9ydmmPKzZdmlImO7JmMQS4Uv5YLoiFgUJDiUAxZpV/i/WUfUJ9Ygocr41+6Wl2nz7onlgEvEkgV/11DH3OyT1wG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744954484; c=relaxed/simple;
	bh=rf7VTAibhA1rsd++vGyUgsQGxAKMW4BWzucsOsuCqgw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FxMuwLBGe7zf2QGiwhP4wdxqWSH8Unk1bLcW0/aQ7/2GlpmUqE1ORuVy4hManwE8s/qG7vBD5XujDQs/yTIEoJhQCByVyuCn7EVNkLbFFoC98dFMeNTPPIk1MC5LByn8UJtx09+0iTEWnfNc0Beg8Wzz8rFWi8k6jthWJ8tnyts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=mg+puudG; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="mg+puudG"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7398d65476eso1311788b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 22:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744954483; x=1745559283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAvviClstwfzUPfEFvJI1cAxXcDrrh9fZc4W+cMV6/0=;
        b=mg+puudGqP9gb8norwO7n6fmFMcDMyBUzYUBl59uqxm48tUKaZpL6yuQJSdWWy/bq1
         stbi1O6irdsdaPhbHHwKByjAmy1EK3KG0pLm5JIthG/QLdYwKm6we4pGB8uiiRSPE0d3
         whYHfFF9vhj9jFoo8LU+bidCnDCoBuCQteQXD5JcqGnJoZgTcKBb7mCIluS1rkfNvGgV
         PLnmq1VEUNTvRd2q95WByHcu7NPVyOTVVTm9PLJWXJigfG9t+iMHlmTWvzVdGtNotY7u
         bZSDnfCx9etagvozMEWDxeATHX61ZKVUO2S79S0aFk5q58yx4Zv3oAgYXR7FgsdFgasG
         9BtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744954483; x=1745559283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XAvviClstwfzUPfEFvJI1cAxXcDrrh9fZc4W+cMV6/0=;
        b=CDcC0M3oDH93Qh/aYfNGEXFXqqbOF6ejrbrEx9g05vt4uziHDofuFTfQ/LQzXwNZB5
         NiTLHkzHdtWohdUgkj6oglVElNuSWV3CnMVc7rg2tu5BjfkZoT6WThhZrgYSKqjK9ove
         kiN7vv0Yk3U9ZjoGmDOBv0ovAXEnQxBgFaRM0JvlWEoa/OD3LuriZxhbHkiV97IuwQIG
         UlQaMNpcvJ7vKtJQEE2KZO+1F+UnJsexvoQbhBWmq4UzOocEcdHfHjzjbqXFF1hIvh+g
         AF6z05AMsyQkIepMOcEaS+LTHYnadc3CD/3NPkdhpdShTFe2MK41L1sqXygevZ0ZCi9c
         7alA==
X-Forwarded-Encrypted: i=1; AJvYcCWTAcG6S8JDbkqT5Tdc1INML07d07IW5UPLZwGFsT02TajeYF/eJTj9wpHgosF5SAT53jYkVto3dUeMxJo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS0ERWCG9R4vR/eEGC5MJk8jQiegYK18YR1q54cJienR55S1NW
	Fa25muw65FJ3vEe9MsaKi24sDkHhjFpqCv27w+NGTWa2Kpklm/4PNexp89wh2co=
X-Gm-Gg: ASbGncuVi7ec+fIyVv017oGyvX80XkJGvxXb5CWUY6HZukCUMfu7o9qT7n/hd/ASBHx
	4yJT1+lgR96G6SIDTImEvEE3iDQEtldwOp95Ajr2IS9zORpBcpV4UNRBCNHJt+QzDYzEtldQqL1
	1YHXig+CK6zRTY+PEjMlBTgMfLp2iWQJzw/ACjtSlN6aMtLGKDNjSQ5oSs4syh0LYEV+WErgMT0
	DIgZJkIrEynPP3jaagm5HAdYtTgLpMrQ5ovGwiXky0e5x1wzxCMMqxmXp1AcC9Eb/8+q8uCQtAW
	M5JddtWp3nBP7r+nY7kzVbT69PRVuNyseQlIcS1/bs+42WZ0A508qLPX/dL9SjXxioXBZKCiafN
	d
X-Google-Smtp-Source: AGHT+IHQM1ft6hjpNMobm2/YoeNnotmxkTudlzgz2ZgJSZr49UA1a3+mNT2Kn2UrRzZ6aASVjmqjaA==
X-Received: by 2002:a05:6a00:1788:b0:736:3ea8:4813 with SMTP id d2e1a72fcca58-73dc17f7db4mr2280418b3a.2.1744954482861;
        Thu, 17 Apr 2025 22:34:42 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaed86csm834555b3a.180.2025.04.17.22.34.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Apr 2025 22:34:42 -0700 (PDT)
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
Subject: [PATCH 11/12] riscv: hwprobe: Document SiFive xsfvfwmaccqqq vendor extension
Date: Fri, 18 Apr 2025 13:32:38 +0800
Message-Id: <20250418053239.4351-12-cyan.yang@sifive.com>
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

Document the support for matrix multiply accumulate instruction
from SiFive using RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 Documentation/arch/riscv/hwprobe.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index e15405e12239..7c11351b1383 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -353,3 +353,7 @@ The following keys are defined:
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFNRCLIPXFQF`: The Xsfvfnrclipxfqf
         vendor extension is supported in version 1.0 of SiFive FP32-to-int8 Ranged
 	Clip Instructions Extensions Specification.
+
+    * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ`: The Xsfvfwmaccqqq
+        vendor extension is supported in version 1.0 of Matrix Multiply Accumulate
+	Instruction Extensions Specification.
\ No newline at end of file
-- 
2.39.5 (Apple Git-154)

