Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1CB26982A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 05:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744954466; cv=none; b=r3hzVHfy9pyusCMSIW5uppt1bMfNofMfFtKAegGM6WeODhDhsgFfqUXJ/8MY4B6WMaFhXsIg80xo1ug0EHF3WCMXxDCiy338mlopVK4KwyhldWr8eaAR/2983zC93E+kPoR/MDDstzKzSu0f81e+6kiBKzTnF/QIEeN1E0OMfPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744954466; c=relaxed/simple;
	bh=iNvtmhIIdE2E+xRjc7orMQlXMujypCVr1/7GWwD+Wzc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m4uahVUFRi6FX/FYY6GJTcBGjcrnCJAQ2FJk9RnG56higWae6beAbbZgw1A5q0xjjpVBXQfX3GhKakzinBVqfkNacoXzVYTBVARbgxmNpBIcKjGsQJWikgxY4RlHPRw/QfsabzyuEr2HjXXWzq350PXP9AbFBOXqB2LVa9pl0/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=GPcXYGaN; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="GPcXYGaN"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-73bb647eb23so1370313b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 22:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744954465; x=1745559265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQs7uzZ6Onwkx41wDcc5ghYmXoSRb5gM/5WF7cFYuB0=;
        b=GPcXYGaNYoB80blbfSFnf/p2fhAS4CEex7JOsmlQjiOPEt1R/luOvKmZ1IadudkGyk
         xf4gXuCcUSTgfBcGYQop0Bj0JJtjI11KoaiKyoWryqpxqNxx2oZ9486COgxCn4NYFJQt
         cVWuuvnMlQbg8zHX0pj1TxMULsxxveZr+eSsTUF+uELpTuxtUx97y4UFGkZ6bKT+Wwyb
         VCFgtBanebl6ghRGIFC6NTrkbJ9t+EHitQszoOPRn3ZGqmpxpJ3GFAe4pPDLq8fOuPnp
         zOMX56yVwL0lBtreu0KrXKWf8WnAVu0ss2+IP/hoNupuuGroHPySDi+5GQgm/ItkqmFh
         wpYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744954465; x=1745559265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BQs7uzZ6Onwkx41wDcc5ghYmXoSRb5gM/5WF7cFYuB0=;
        b=GdRrDZiaU8h/Tv9a+zSnd6UBE8FdQuTG9l2G8fqQ5CLCmzJZttgIodzOmtrFFnRxoj
         nOtaa3b7DYS/9o2Nv4+uXykjabi8GvO10RVZUNHlib5l6Qmaw29TI3CterBnOgMS8LaB
         HALrPIodx4THrXwjIoaJXgPCFZYWaRLsusRFpapJ6OY1BVw8X9SO1ZN7zyg4hWTPrRVv
         lnACEjCJELnUmlXT5onf9cr7V/fC6p8WSaasM0Unm0QDvlKNZ+K7vVP2fm27tRLHuyXq
         jhJ8ipfoJjOa/WSAfz+l8EhuxlonQjvQeq+FEIKYVxoZeJwAi4GfOD5tdCd+F5snsOkR
         KReg==
X-Forwarded-Encrypted: i=1; AJvYcCVSxyv9sexnYYsluKBP0A6KUyrZTKcPMpWBMmKXwZM8ZMf5jG1/69B10tnu9bSN3XdjW3SYQU3lwGAlTuw=@vger.kernel.org
X-Gm-Message-State: AOJu0YykS+iQ0N4WWCpD+pv6OVYs/w9P/6vrJyp4j74554Hx2xCPNvqE
	MhH0VD+c8YEIRyA+dd93Mv7Fxe+bWxeMRUiLIiZsDbLhoTBp1OxFDm+sCkNvMSA=
X-Gm-Gg: ASbGncukP8P2Vr/G9BhIkYOAQwbm9OFKBSA6icb4/gpPPBirRL9TGmXSCd8Y0g9dSxy
	M99kiUYOfaGjf8z01rgrMLXeSNGvEL8AOzO93r62P7nEVG+DIY1Z/Bh4ZaH4YTdA1dZZ6qhfNDk
	0a8MexwvQI/DHKJKKExpBm7JYaW0Z2eRU0+SNYA1XoZsuVLh1xsrM+WQUtJ1j92L6Q7KovmN0CV
	cXC3fkQirO7ETtw9no9K1kiKDd5YSqP87wrjWsESjRJlt/s+Tj+FtfqhARgnJfOXKnt1SktngYx
	q3Z+ui/TZQ8U/uTy84TpCeT4P+DUYnzXZ1HUQBW27KHlSfWCVICaCkY+EODBdWzMukdqKzX/e4w
	C
X-Google-Smtp-Source: AGHT+IF2DvMayvvtqWjev5K9y4IkVU3547WcTSfffFPt6RiuPH7JdExs6M3EHo0S62GLsq0ai7FbqQ==
X-Received: by 2002:a05:6a00:3a18:b0:736:62a8:e52d with SMTP id d2e1a72fcca58-73dc14c7d0dmr1797266b3a.12.1744954464653;
        Thu, 17 Apr 2025 22:34:24 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaed86csm834555b3a.180.2025.04.17.22.34.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Apr 2025 22:34:24 -0700 (PDT)
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
Subject: [PATCH 05/12] dt-bindings: riscv: Add xsfvfnrclipxfqf ISA extension description
Date: Fri, 18 Apr 2025 13:32:32 +0800
Message-Id: <20250418053239.4351-6-cyan.yang@sifive.com>
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

Add "xsfvfnrclipxfqf" ISA extension which is provided by SiFive for
FP32-to-int8 ranged clip instructions support.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
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

