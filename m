Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AF5253B66
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 13:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744031595; cv=none; b=UHBuCOnHpfoWmmWZr6gfd+d3p2/mRjzpsRmSabd1NuLTyAEhXdMpmLWkTcx8AKlxUsmIuq/grxrVLwR8Gg49haC+5vSEHQdLL8ofzEv/AKjiF7imFOLGMgVv3+ZRHnG9dkAv6heyl/WsRWzpQenglOuh7hSn4cSD9wTshOblrPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744031595; c=relaxed/simple;
	bh=7eX6vU70kWv6aUWi8R4b9wN+zN2bOhSNdyX7zLBgvhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=cOxL9CNFYCfm37OC+8aTwPJ/IyHKGuSH1c8pO+6bsyPPvXFypPwRpo2sthG8U5eBOW9chXF/B8IGmv5X/X2leBr5+07KsXVpJbf5xWb/KIx+m6vUyg0CLYVdwV9hwExxJhYGCBy4dgdtVJtsxfNlHEw7iZkmkiHABaBJS1uoIyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CekVyWKt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CekVyWKt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744031592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a9lCnalV/KwjMC4bFuYLU7hw0fDsHdehp4fkHlEXRtM=;
	b=CekVyWKtuvvZVrWMgmkuP2OJBFh+qfeqKP9eAIUZqEV7XKobZXQHpa6M3gHOF2s7ccwaq7
	LtJ3J4O/gaQptHH0XTVB0Hm27JPxHtAiv8phd0MlytOcbld0vbaM3I314oq49RcFVQia6m
	N67u1LzibzWbbh1lgxJGgdbGvO6VVXA=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-L5D9ijeBOQagyAzHG11eTA-1; Mon, 07 Apr 2025 09:13:11 -0400
X-MC-Unique: L5D9ijeBOQagyAzHG11eTA-1
X-Mimecast-MFC-AGG-ID: L5D9ijeBOQagyAzHG11eTA_1744031591
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6ece036a581so86450556d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 06:13:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744031591; x=1744636391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9lCnalV/KwjMC4bFuYLU7hw0fDsHdehp4fkHlEXRtM=;
        b=Te2uNHlWH4O+VXxOj7m0BZo3muA/jfa/q0FXoGXvYQD3QpP8jOEQIaJWkyFB8VlKai
         BFd9yJBlHr9SMSULPbulbGpXfpWVzzAqeSaDYdsGUBZadzepF8dSYLLJB9BcUYrUxP6P
         AkiDC7gdjt+PzigK+ZsrA2Nn4vflEU+yBoXVUEd7pYvUD4rWABIfA5WI/akkbhgmqYca
         zcInh7dxdBNpYwAFXeK9m32DlM/H/SQ3U71ccLi5ZDrftp4PlJbm+5cSfvH/TSIsSbJ5
         yqhApDofzQAdW0ItgWpyIRM8yy+u86kVSguxdw6+5WYS5cNR3590/Ndfl/35mPYvC6c4
         qwTw==
X-Forwarded-Encrypted: i=1; AJvYcCWeCYwfqnOwwCBdVQ7Qv1I5MwlKebxGUScVqRuRo8dhngOLGqebFRV/LCUA6lWt+QRN5bq28OwTKc0QYTE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs7cSoZz1nTJ2IUCcCP5UqRu0QrB4YzPZT9A4Lyy4QsLjYgGfv
	ixAhy9sqvZ5b7aBGGqoD8of5lP0xXANRU3Qgy2o2FXspeoJ5DKhNadhqSEI2J2yd/ctmU/Hv6id
	z2Kiu0/gGBHMuxoADGPy7TB5hjJ0DbHLh2jvsFdirfi1rn8ABa2IrvmhJIRoqwA==
X-Gm-Gg: ASbGncuKamGiKG7qJf4bXlTkR1tHIBlqioCFaNMnDooueGZWbAzvonFcIZDfaX/s8Yh
	PmysWz95TFnLxEzRWxBZpE2lg1V4EL2mZTcZKsWYGGP3lY641R1Y4qtyeszd+MnCJYoFaLR7roD
	PGYwEN6kbewTLXa8a981vlTxudrijJHOb/O3uPAE1Zk1Y7F3r2QSea1BU30tu4/xlxWZgqiShCJ
	CM42tLgvPCHM8Adlw+ou2eXL4xBcnlBBcY72j4Ww1aytjR3wWF2lKcNs50QwoPPFlFjdMLl9Pem
	4r7GtuOzvRz+uF22MqPkD2lWiOVKR24GofDkEgk51A==
X-Received: by 2002:ad4:5f4a:0:b0:6ef:3de:5ff7 with SMTP id 6a1803df08f44-6f00deb6471mr216309756d6.15.1744031590768;
        Mon, 07 Apr 2025 06:13:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJVA5cdvPfMT1cbbV0KBVMgtp43I7rMfUHFXHZZtE9t1ke1BHH9yVmlIS35qB8irghkIqLjQ==
X-Received: by 2002:ad4:5f4a:0:b0:6ef:3de:5ff7 with SMTP id 6a1803df08f44-6f00deb6471mr216309396d6.15.1744031590508;
        Mon, 07 Apr 2025 06:13:10 -0700 (PDT)
Received: from x1.. (c-98-219-206-88.hsd1.pa.comcast.net. [98.219.206.88])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f138e15sm57662556d6.82.2025.04.07.06.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 06:13:09 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: sboyd@kernel.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mripard@redhat.com
Subject: [PATCH 1/8] clk: test: introduce a few specific rate constants for mock testing
Date: Mon,  7 Apr 2025 09:12:51 -0400
Message-ID: <20250407131258.70638-2-bmasney@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407131258.70638-1-bmasney@redhat.com>
References: <20250407131258.70638-1-bmasney@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

Some of the mock tests care about the relationship between two
different rates, and the specific numbers are important, such as for
mocking a divider.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index f08feeaa3750..1b34d54ec9c6 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -24,6 +24,10 @@ static const struct clk_ops empty_clk_ops = { };
 #define DUMMY_CLOCK_INIT_RATE	(42 * 1000 * 1000)
 #define DUMMY_CLOCK_RATE_1	(142 * 1000 * 1000)
 #define DUMMY_CLOCK_RATE_2	(242 * 1000 * 1000)
+#define DUMMY_CLOCK_RATE_6_MHZ	(6 * 1000 * 1000)
+#define DUMMY_CLOCK_RATE_16_MHZ	(16 * 1000 * 1000)
+#define DUMMY_CLOCK_RATE_24_MHZ	(24 * 1000 * 1000)
+#define DUMMY_CLOCK_RATE_48_MHZ	(48 * 1000 * 1000)
 
 struct clk_dummy_context {
 	struct clk_hw hw;
-- 
2.49.0

