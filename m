Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC55A283154
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 19:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747769360; cv=none; b=W/cLn1+xSIAFVg6ASpYCy1hiwCpSZg47slLORIFXqRhdthNpoINrKNrvMF6Q938DT7c7kBH49GTo7H5kVqvuk0mmcN+ZXVFb3dnHjM1MWIRgdhUjkvFCSaQPrGaxe605WqBzCYGYzWMsBGNOU2v8Vp74rMUQOrHhtN2QvKZLxKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747769360; c=relaxed/simple;
	bh=qagXFyX6DO6npNhzgmzI9I31xIac0rqUc3ReIXNHMFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=dAa/mlZdA0G/+JOXlwTGQZRh1MJ1N9TIDVjU3/dpuiXT0pnrhPoazuGkuregfWY06cybSfUYxMCL4ly3MtNCiXSlWkp9k977C4WiA8F1seFoZ6nMmfrsZeKr427yAnYgVqaOpYasWVyaEtJb3N86D8hQxm8pDtfSW0Z0CidGEiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YqZI1aUy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YqZI1aUy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747769354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SaG/a22ktjUKI8Hs7U5t2PNfBfvcukOkCUv/Mno8b50=;
	b=YqZI1aUyw9Q6aReRd1FUkM6cRLwCRbDBR0r7OuPt7jP0R6mfprgtKjt420IY2CPMaQgZh0
	L561AUkYU6jAC+gleqeiBaOi0zf/vVqXUaaJZBAsMIABUG29bNv6bunKhSrCulMoFVFb4c
	m51bCaXXH7fPIX9lOpvk/q32CgfHYNg=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-dgoLrUXONaePp_dapSWEnA-1; Tue, 20 May 2025 15:29:13 -0400
X-MC-Unique: dgoLrUXONaePp_dapSWEnA-1
X-Mimecast-MFC-AGG-ID: dgoLrUXONaePp_dapSWEnA_1747769353
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8e1d900e5so30513796d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 12:29:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747769353; x=1748374153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SaG/a22ktjUKI8Hs7U5t2PNfBfvcukOkCUv/Mno8b50=;
        b=Ors2PuqykvikuCecTpsThM1I0ScmABKXFOH7xYnrDEBkUaEcjlZZo01aKqlVMEjCJE
         E0D2024Oa8IjtQJHdSUb7k8DJwqhyVTN18BRlpZRHjYPXkCoyw/7weFdqyMutc4n8ptX
         QZt8H3uRwm+KTH7b2VAa+rmFvqu592KTMuySb6OtJdyniZ/wiXpE7H46230F5k0bvV8l
         9YcQwnpao8UjdeWk2wzaxwzQD+x8nBQYguEdUgbRvKvlgCWi7GwmcRP0w+oy9cUbP4V6
         CGVBAWTZUM/z4IBbZKmuQdURpMBv2lxPxh66Qu/1vs3eckLZUA2tugwrYXeWi9dvCDH+
         IcIA==
X-Forwarded-Encrypted: i=1; AJvYcCVBBhjt8k7GWF7HZtm5rxSiEd70O2S0kJx6LicchnzLe8b5JZJAW7EJjO2MKsQMWhVEIJkBq9IH/LGTtAk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw70Vc4+J7U4+WqtczoJB5Rr8dJD60GAh+XyD73OoOzrEef2HP
	XvAXbNMX43rb5GVsx/qjv/MABSMPJfUq6ftcCY+BedAPtgd+hAyLVPWHU2ryYhJ8xwzloUY41q8
	kRNsfXdqMXc1sAPixqwUb09B5cfxKpcWecTGplknG8ocSiLBrSOPRAJny/Cz4FPlmqg==
X-Gm-Gg: ASbGnctO+kYgXXpvf7PKkaeIWLGsyTLY7gYTcNraIcYrsowpKBaor+AOiZ6/op1OTia
	BgBdymbYgoLVL3vwYbuMErm9F0whb3/XMFq6xV3H6aFqiKWvVqkQp1//N7OJJItzANTRZLnPydh
	CqwpFmxU+ZapRort/dn87ZmRdF86rYKmrur1EnO5Ce3ArqNDv/sj5k4g3UwAzmYQNLEenC8QFLG
	9ZpZnR/WEGs84CO5QINHRF4dXePgABCvnCvOdXmni7XzKXQ/vWuTLLYde2nM7DYFu5cB3wQdKq2
	3skt
X-Received: by 2002:a05:6214:20c7:b0:6d8:a7e1:e270 with SMTP id 6a1803df08f44-6f8b093931emr289978626d6.40.1747769352793;
        Tue, 20 May 2025 12:29:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbLVlWn6eZEm4rwwsdeKPX+/GO84p7UP4Xe1oM6j3/NOiH/TWKYpu6JmSovQ9dYJLVtYCUBQ==
X-Received: by 2002:a05:6214:20c7:b0:6d8:a7e1:e270 with SMTP id 6a1803df08f44-6f8b093931emr289978166d6.40.1747769352325;
        Tue, 20 May 2025 12:29:12 -0700 (PDT)
Received: from x13s.. ([2600:382:810a:a775:a7c2:b4b2:4756:68b2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b08ac502sm76018156d6.42.2025.05.20.12.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:29:11 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: sboyd@kernel.org
Cc: mturquette@baylibre.com,
	mripard@kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] clk: test: remove kunit_skip() for divider tests that have been fixed
Date: Tue, 20 May 2025 15:28:46 -0400
Message-ID: <20250520192846.9614-3-bmasney@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250520192846.9614-1-bmasney@redhat.com>
References: <20250520192846.9614-1-bmasney@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit

These issues have been fixed in the clk core, so let's remove the
kunit_skip().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index e6df1d2274b2..3f0bc44c06fd 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -788,8 +788,6 @@ static void clk_test_rate_change_sibling_div_div_2(struct kunit *test)
 	struct clk_rate_change_sibling_div_div_context *ctx = test->priv;
 	int ret;
 
-	kunit_skip(test, "This needs to be fixed in the core.");
-
 	ret = clk_set_rate(ctx->child1_clk, DUMMY_CLOCK_RATE_48_MHZ);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
@@ -808,8 +806,6 @@ static void clk_test_rate_change_sibling_div_div_3(struct kunit *test)
 	struct clk_rate_change_sibling_div_div_context *ctx = test->priv;
 	int ret;
 
-	kunit_skip(test, "This needs to be fixed in the core.");
-
 	ret = clk_set_rate(ctx->child1_clk, DUMMY_CLOCK_RATE_16_MHZ);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-- 
2.49.0

