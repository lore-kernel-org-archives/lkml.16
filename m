Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A180A268C62
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 05:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744954453; cv=none; b=LPTUfq14gvkVvlBhfgFrKh5/oXd49Ss1D0qWOyidfItBN07BGTwfbTDMZ4gKSigxKd27OHoaICXbx6mtYiuwPBqm99RhK1v4DutTZlXyWc7D1z96a/1yoQA77t75jyQZ47b36Hc9ooBnmzhgv/owcUr8foA8OT5Gi1WCY590TOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744954453; c=relaxed/simple;
	bh=DX8ANuBD37AaCsG4m/4Vvl9WpEL+PaWaTmB70vSnpr4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=makYlRkphKApnu58UuXwzCINs2xRQxlmhIAPgurbKvIKBgnnqo9HtidA5NaToUkR8c7zNPRDJY0cA+nqDL8a3HiMzxD56tm5wItTuVnsEaXmI1FMsfFiR1PL7aUUcltDahYqcKZDFvhfdUeCVK+i7dVDrXKXtiTGRSLEPXZU8b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=AQiGBQ0k; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="AQiGBQ0k"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-736e52948ebso1804879b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 22:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744954451; x=1745559251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/1Q/grKIHBXXJrclQRt4Hnq6m7fwFMEX/d1aTuTzzM=;
        b=AQiGBQ0kCPt0Qp3IPPKlu00o/HxfnUr6+LAof1E0efavpl7+uqvojGdSKcK66lWrEm
         Qj2q93lt+e1c/5gJAufbgy2r/F3zh3MX4fPqUXINJEXc5FveffPJv40SCZDcv3s3g0B0
         PpLxsz/9aOroI8C+TOsKAMNb6BEMSaIAe29JquKdfnE/mr/exHdpPGWh/Um6G1ceoHF3
         +3wuAhOqtmCQh9idBM0z5PXyttnCqpUNt888jvuQFl56f8CpgfjKk0a6c9sPhET1EXsm
         lk91fA++e9vw14Y+yPmR3GQM8IqhbdsbD5DeGmaX6t8Pi8bZ71+HvA35SU0JYEv+QnmS
         BdbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744954451; x=1745559251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s/1Q/grKIHBXXJrclQRt4Hnq6m7fwFMEX/d1aTuTzzM=;
        b=Fwe5id4ML6ieItlG986hFMpmDvvkhI8yVyZvSYACpxDPss2yfUZOtcFzZDF+rZtxtj
         tumzKZr0gnH2gzAFsMe6A6weqlpniBqCCp9X+iC2aJb8cZdKqKk14jtHJ1ChGNg3Jfrm
         5OrsAjsBb06RjKAyUABw6hjg0ys5hJBTs/5dSaJa+7jIwKKdu3m7sS+mkqQft+NZtnKQ
         tmZAmRxto+2Nvc4OFFAhEYeKYVezIIgJThsZwc7xHqgmfkW0JWTOZ6uRVgbAuPTaxQBo
         L2LQVoOaQ8jKF7IqeZeaFIoflnTNn8zgTVWtbEj/ZBPAeUUgQ9o5vzjYNQE66FT8JgrB
         fXDA==
X-Forwarded-Encrypted: i=1; AJvYcCWWkAIUBRl0K3wptV/GpLKBwp9vX79ZWQzPLCQfHvI5A/IvngAIPTOdauk5bVx4tdeNgKVOA6t3/Rii5wQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya3ZH6wJy0VDQGfFpk/c4k4WeqlMoLMdfeF87cN9yYTvU+crYR
	5/HiwkXsVA8NumypdjDos9xeXaV7A6buOdnTy+OWpK6lCsfuEVsSmcWW8KLFXBE=
X-Gm-Gg: ASbGncvmX2inbdt4XZmLRWZEls2kExCHfsAiuITRjF1wgn89Ze1tN1kX4ref/HdhJqt
	7eELk9F+TdAW+IbXKkdB5RZIMVwf9b7BQwmkSLi3mGel9VnEOxcZSUIKnXzqHT5IxNblE7+v+GH
	Pd4BYHnE59biMK3q8jpcULaycq1T4+FszxTq1mDNsuUEYmap7dhEIIBLyeCQic3Z5c33qnQuc/V
	3OmaG360oedfKfCy7eIJOj8eF4bAxUw4cYsFCWiWKfLVVzcLYHMxAnET4xwzYYjoPnWYmwHzCKw
	GWwuCb2xVAtx/kmdMK9DKE/3wk88I0MvBOntR0lFpY748KJmz5YyppKE6nvaqRy8yZOEH6F507V
	K
X-Google-Smtp-Source: AGHT+IGMRejlAoVBLGVcqScGqmbNq0551GAav/cav6iV405yVX72VUMx1OuS9YTxF9TkwljSuS7HEg==
X-Received: by 2002:a05:6a00:39a7:b0:736:73ad:365b with SMTP id d2e1a72fcca58-73dc14cca6bmr2149155b3a.14.1744954450904;
        Thu, 17 Apr 2025 22:34:10 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaed86csm834555b3a.180.2025.04.17.22.34.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Apr 2025 22:34:08 -0700 (PDT)
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
Subject: [PATCH 01/12] dt-bindings: riscv: Add xsfvqmaccdod and xsfvqmaccqoq ISA extension description
Date: Fri, 18 Apr 2025 13:32:28 +0800
Message-Id: <20250418053239.4351-2-cyan.yang@sifive.com>
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

Add "xsfvqmaccdod" and "xsfvqmaccqoq" ISA extensions which are provided by
SiFive for int8 matrix multiplication instructions support.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 .../devicetree/bindings/riscv/extensions.yaml       | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index bcab59e0cc2e..d36e7c68d69a 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -662,6 +662,19 @@ properties:
             Registers in the AX45MP datasheet.
             https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
 
+        # SiFive
+        - const: xsfvqmaccdod
+          description:
+            SiFive Int8 Matrix Multiplication Extensions Specification.
+            See more details in
+            https://www.sifive.com/document-file/sifive-int8-matrix-multiplication-extensions-specification
+
+        - const: xsfvqmaccqoq
+          description:
+            SiFive Int8 Matrix Multiplication Extensions Specification.
+            See more details in
+            https://www.sifive.com/document-file/sifive-int8-matrix-multiplication-extensions-specification
+
         # T-HEAD
         - const: xtheadvector
           description:
-- 
2.39.5 (Apple Git-154)

