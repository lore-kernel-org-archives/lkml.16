Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092A21E1C22
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 18:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743187161; cv=none; b=UbW5YqPIsdp16Q7pAtXM8RpOcR/mPaazmq0Id9R+DUFIWozj5CkmShWlU8t9tDyx63ksEsT2UVJNW6vo0hxdpgiZZc2zuK+pZ3//xn5jdcEpKtzPYoq3HTTE8NVXXIwZj9hVR5at7gK7Xj0h+q14vs83mLPFihysRBaOgCEJ/HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743187161; c=relaxed/simple;
	bh=SjUd/DHv6IJbZYAKa4kbQGHpPKnU7bcD2xgafz1puzc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=fbwacAbBg902USegITBJtCgFoyPcbCjHr4h1d73w2QSEfjKK9xzT+jDDyzyKCQMzU5nFFHNphAL+GD734Q4QuibCSNj8MeoWxfE4hnZYkqKiPb8pcqFKAo+9I37bKOllZKQrvM63ynJgVs8aCvtFzFzmwcQNPNtrxIMLwWuwpk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i1QI9GMP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i1QI9GMP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743187159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sEZCJqR/jQLNoKJzMVKt342vfkUnaXZ6aAgblV+pWSw=;
	b=i1QI9GMPzqvdysIpZCvH6fOjnprC1nYm3NjGQRANBf8clr3FPU0aPjanSI44ltWhcvMolb
	YCswolcp6ncAA6LrJMgmeokuCoDFURPVOL+sbnXNHKzyTz1pXxiU0wb9MMYhveX6L3auNK
	AZN2IeT0lkGkpMWtivek6U2+o2DvPZ0=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-b1_e-ZbpOae-e-_OAfHirQ-1; Fri, 28 Mar 2025 14:39:18 -0400
X-MC-Unique: b1_e-ZbpOae-e-_OAfHirQ-1
X-Mimecast-MFC-AGG-ID: b1_e-ZbpOae-e-_OAfHirQ_1743187157
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6eada773c0eso73302146d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 11:39:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743187156; x=1743791956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sEZCJqR/jQLNoKJzMVKt342vfkUnaXZ6aAgblV+pWSw=;
        b=TTm6eNeZtgz8rQmUbos6hEd5bPWJjTaOfueXH1s5CytWJ+B5qyVpQcp474msBSmfAE
         EFQ1YAJ9v37S7fU82Uzv5ABrW56/aY0hZAwIiaPqxJK+Ap7MXdKprJ9L39GCM7A3q711
         yrtVB4UiqtuhD1IRop3wGLOylraIAQiN3bsY6ppE3hB9uFOK5S86ylc1OZQ1KkallZo6
         eYGwp/Kix3YQJ+UBO5v2E+xh1Qom5KcMOrGPb5bq4jSTgBb51QLF91R6JVD3jpoWIwzo
         ev19J+IR1VLZp36/MBcpQJXmcsi+ZGWk24E7TxRq4tgGVQoHNSAU052p8t3v6MJ2h6wt
         5rSg==
X-Gm-Message-State: AOJu0YznrQfhZazIV2rWFqHuTsLwQ46AkLdX2qIRlKbJswtDCzH8BPk4
	oh1No+2m5nuEjfiZlBTUhnKftYponvjK4vXy9Yz3LQJyTaemD58FIEbFBjTCCXWyx1rvkDDP1Us
	ijH8dh6vAk4DQyLMqv2PFVYdfthdGB+cNIIYdpc8hdaHixsW1YNcRsZJZ/dp0Pa8BkHwI5XY6
X-Gm-Gg: ASbGncsE1h+B0wQJIDiWff6rfpBP777Ur4DWuBIiuVrMpQ7ttk8BignDq09Gagd56b7
	IUHfR8eLz2BXTJR0rRZZUeJjcaRreX++dxTqyDrBgaKQyPWCutzG2w3MT3NpohxPXO/Fz7gsDpk
	HKRBLvBfDoiO5PuRrsh+5a8R8U3APftSj9GdnPhs4FxeqzEsrL4XLsoes6Euq60tGP3VIfbJID2
	Z3urD/HnBCNoY9jQZ3ne8Ro6Q4D10wLVg8ynabXNz6cPPQrLA+NXc47tt5c70TqwfXxMvInNdLS
	p/dMbsQfbm7KoNCp6Gb6QS68NmXQUTSPyGUlHpho8A==
X-Received: by 2002:a05:6214:2aa5:b0:6d4:dae:6250 with SMTP id 6a1803df08f44-6eed61e5cffmr1949076d6.34.1743187156451;
        Fri, 28 Mar 2025 11:39:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvqjKJXLG7j0auQtxO9l/y2W+hwFCUPX7pKk+CbqE7ARoNxdWNI+aRfGqS7ZOfaDY+ILj1VQ==
X-Received: by 2002:a05:6214:2aa5:b0:6d4:dae:6250 with SMTP id 6a1803df08f44-6eed61e5cffmr1948696d6.34.1743187156087;
        Fri, 28 Mar 2025 11:39:16 -0700 (PDT)
Received: from x1.. (c-98-219-206-88.hsd1.pa.comcast.net. [98.219.206.88])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec964649fsm14276836d6.40.2025.03.28.11.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 11:39:13 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: mhiramat@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	aruiz@redhat.com
Subject: [PATCH 2/2] tools/bootconfig: specify LDFLAGS as an argument to CC
Date: Fri, 28 Mar 2025 14:38:58 -0400
Message-ID: <20250328183858.1417835-3-bmasney@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250328183858.1417835-1-bmasney@redhat.com>
References: <20250328183858.1417835-1-bmasney@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

Explicitly specify LDFLAGS as an argument to CC so that this can be
overridden by the user.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 tools/bootconfig/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/bootconfig/Makefile b/tools/bootconfig/Makefile
index d2713902ca5c..90eb47c9d8de 100644
--- a/tools/bootconfig/Makefile
+++ b/tools/bootconfig/Makefile
@@ -18,7 +18,7 @@ ALL_PROGRAMS := $(patsubst %,$(OUTPUT)%,$(ALL_TARGETS))
 all: $(ALL_PROGRAMS) test
 
 $(OUTPUT)bootconfig: main.c include/linux/bootconfig.h $(LIBSRC)
-	$(CC) $(filter %.c,$^) $(CFLAGS) -o $@
+	$(CC) $(filter %.c,$^) $(CFLAGS) $(LDFLAGS) -o $@
 
 test: $(ALL_PROGRAMS) test-bootconfig.sh
 	./test-bootconfig.sh $(OUTPUT)
-- 
2.47.0

