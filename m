Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39EC128816
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 02:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743043171; cv=none; b=NRGiqhg5ETz2WGUpHYwOZ5hKc9JeqInyaw700gc0WF5BdE4VFF23GIOMXfatal02cHLERODSG7NO/AXM95dw7IHeRI4i7oCXcb/tLM5l9Nn5GoI+y9fMbOj1h/y1oVcaQNU5+pe3mQUslBMAazmdM9BWfGdUEIxAEoushV9KE/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743043171; c=relaxed/simple;
	bh=bfZnAhWbIHetf94vPVxB6NVwMTgNEQjCKhpHr0TUlx8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mE3Vu2ZJUn9p/j4VTEi4Nz8jrS1ISU7nNCPfYKP16Z3BAzirE0U6+Sj3Ggd0Fxr8DsPmVpzu/601DJFZp8aa8GGaapDGvtCKgF6T4ulOaB1Qhv8PjATDAiCkYNn0aoTVNlTCUjL1t8fMX/dnBFWrHANPKUBbELqNiBrDif2b93o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com; spf=pass smtp.mailfrom=quanta.corp-partner.google.com; dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b=KDKEz89P; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quanta.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quanta-corp-partner-google-com.20230601.gappssmtp.com header.i=@quanta-corp-partner-google-com.20230601.gappssmtp.com header.b="KDKEz89P"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-227d6b530d8so9978175ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 19:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1743043169; x=1743647969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=khaZwp5Vq6UxSHSInGWQoaGrGmu008TcfrCzn3Sp1jE=;
        b=KDKEz89P0thsDnLniOFBXrOZVoA5byCeirEpqBin0lZYauggnLHxexSI0oXnry1ONF
         4SszpLEcjKzg33WkLlVL1V7xhmemZ+zXF9ncQ3w8ySlIKwk+3gHqyzTzB4NehR3HuY2r
         ZEJYoye3ezfj1R1f+Bteq36cFZULVG6m0AYejnHxqJetpu1H18a/nBa+LOLH7rm01iF1
         B2Irv/sEts0sm6XCfHeN/W04gNq8oMtjBRFX7bL8YcFghjVERYCCtXv20AS2WPNCTGMx
         8VAAiszQIHLncIXFj9J7G79VOtWvGUs0Snnh3MLsvPcnRjrRkVkSt30kQOOxWrUOTmRK
         YrAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743043169; x=1743647969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=khaZwp5Vq6UxSHSInGWQoaGrGmu008TcfrCzn3Sp1jE=;
        b=eHuLFm46sxmCmrU4EA10wNNQzltNYZ3UMz6y6z2zPWf474IHdmV/vPoscgekz06XXX
         ITNE5+uEwCyWxa70FjUiKneRpMPxAC9Q/DCNagw5GwHRT13T9M4FUoIYNgcx3XhJ/SW/
         J+54SIZfywW0cqMn6NlBABDgnXIp6Xw1USyqHbFEWbz9/qhPh5bssWPYc48GeHDcWFN9
         il2yBBvIaUVxgk1YwHxLKOQ6+fynMmhP5VNS/g0Ldsx1pnJtR0k/zUodLEySSuWvRDWI
         UBApTOJK6gl+4RGnkYXDHXJURFXlMHdehHGM7DzfPGoKQbyP64VqNkmfKTHC6OCdMH0o
         UkyQ==
X-Gm-Message-State: AOJu0Yx61JKziDijsEUoQBYtwpiOptRBgEkG44Y4T3qEW0rd852WrFCi
	pw2O8Kjk83SpKCYYQ10r0IBPTnG4uIG4wcTgUg8CPIvYEXhNwCXTZaQSZ0HSAuDszpU7Fa5beBh
	r
X-Gm-Gg: ASbGncvKYFkAbulemnI6pQ/kLBiXjm3ICC3GDE2PltcBCTnsLHxPkfZJz2BVTRWkQ0i
	bf9CDQgxBzO2T/eB2J5pZzw/TjQvVLXUK3DYot1PvDHrUtf4oc8i6S0OcLj4XM0mRpk3zwD2ScR
	J47IO929hcGq64kIz3v5Cosapz6vIsweCtSv8zb4dFBjvg9r7Lp+1tGlyCzaMHXgL378XEy4ylb
	NTL0ySfWRSUSEXXBvoHztwRjODKdVfum7sH8gnlNsOhyFPLjMD7v3r4VmPmGvwfpr/iVcCaviHA
	1E9ji9w9WP6Iud93E4kGeMrmfgz3emBgVnXIQJQaLTwZRHqyATDdZmWOwcql/ecgrOyLhEpBmTJ
	jbkaDizsBokXbfJruJ2FxGTAyoOUJqGnapz7MTbnafRs8oU/2jOVgfegWpOUWSlqQM/O/rKH/eK
	kKABrq
X-Google-Smtp-Source: AGHT+IHVjsfEKk7SQAq4/COA7W8hgn5DQ0NFXJ8KTp6oRzGgyMHcaaVaDn7SD+ynl26dPt1q9peR9A==
X-Received: by 2002:a05:6a00:189c:b0:736:6ecd:8e32 with SMTP id d2e1a72fcca58-739610dbcecmr2571003b3a.21.1743043168560;
        Wed, 26 Mar 2025 19:39:28 -0700 (PDT)
Received: from localhost.localdomain (2001-b400-e33a-bfe3-438c-4ad1-9019-9f7c.emome-ip6.hinet.net. [2001:b400:e33a:bfe3:438c:4ad1:9019:9f7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739061592b9sm13027897b3a.152.2025.03.26.19.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 19:39:28 -0700 (PDT)
From: Ken Lin <kenlin5@quanta.corp-partner.google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Benson Leung <bleung@chromium.org>,
	groeck@chromium.org,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	chrome-platform@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: [PATCH] UPSTREAM: media: platform: cros-ec: Add Moxie to the match table
Date: Thu, 27 Mar 2025 10:39:21 +0800
Message-Id: <20250327103918.1.I704cb6f738208386a0d431d355169c6fdf0f51bc@changeid>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Google Moxie device uses the same approach as the Google Brask
which enables the HDMI CEC via the cros-ec-cec driver.

           Hans Verkuil <hverkuil-cisco@xs4all.nl>,
           Mauro Carvalho Chehab <mchehab@kernel.org>,
           Reka Norman <rekanorman@chromium.org>,
           Stefan Adolfsson <sadolfsson@chromium.org>,

Signed-off-by: Ken Lin <kenlin5@quanta.corp-partner.google.com>
---

 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 12b73ea0f31d..1de5799a0579 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -329,6 +329,8 @@ static const struct cec_dmi_match cec_dmi_match_table[] = {
 	{ "Google", "Dexi", "0000:00:02.0", port_db_conns },
 	/* Google Dita */
 	{ "Google", "Dita", "0000:00:02.0", port_db_conns },
+	/* Google Moxie */
+	{ "Google", "Moxie", "0000:00:02.0", port_b_conns },
 };
 
 static struct device *cros_ec_cec_find_hdmi_dev(struct device *dev,
-- 
2.25.1

