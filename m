Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B426D2F5C4E;
	Wed,  2 Jul 2025 20:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751487245; cv=none; b=HlcKLWiUQ6fb2xRonRzJ+kUCS6vgOtfro1OD73Qdk5XUgwYLFU+4ADKDDT2Q0wv6Au2oc5Drw3yVr9wjfiMpLRuuLwz+iz3U5a0JcBI1O06vOD8LjAujBwCM4BROl3Dfset11nj47c4A5Vcaa7ePEv9GAXntwpJ4CfZGqDsaP4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751487245; c=relaxed/simple;
	bh=m6rwVvWQAPY0xwQVg9qv36a7gw0jGxN4YhIiDoRIEz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FY1OnGDvYwk5J0eCAJIqNFvXJ+fmLHo1h2lTCSmxxKCDmZgxSVWAG7JWtA/18yMoA2xl8R+i51qNauJqhWiZQsIpxbH1FjD8RRNz5cqAq6hBDFvHPFNg4o7WThHPys/VCG3/m1+Wc912IP5A5q2ptca5QGmNfMQ9vBaz1AhNICY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VYI38FoL; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VYI38FoL"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-710bbd7a9e2so50866147b3.0;
        Wed, 02 Jul 2025 13:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751487243; x=1752092043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8vdOdUxNKsgfVTSqDg8R0nof5JK9i0IVO2A48aHJBQ=;
        b=VYI38FoL39PRC6DFh8BVg5u+5yiY1r8ehCmVd9tX9IQMcDtOduZiPgU6aziDSPVdr6
         EgHWGDYngoD4iLrhdI8cV1jSPx6pD/GXiRyklOET+nLOk5yYf+7TJUsaz9yZORwR+Ob6
         qfnKQbDLths1Duz4daoEXYAqHDyvHXfN9lGqBajIiAAIjhSXMqYdujDeZnjrDcpFktJ3
         zPVXzDWMGjr5IxkEqxLyO6x0i0tp1Grvu/iRLncOsHryIZnCuO+VFReSk7IfVqTYyYyD
         Tn8pKSm3yaylqdW3K69VE2owiIujGnj8f2lMwbiYNCkO4e3csHwyuw0lKdiLaFr+FxH5
         2h8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751487243; x=1752092043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X8vdOdUxNKsgfVTSqDg8R0nof5JK9i0IVO2A48aHJBQ=;
        b=bLiW7mECYsUHyVmQ4214+uraBCzRpKpIxVlwea10w2qoD52Hm8u4lBQ3X+y9VSgiSD
         5d/lyM1SfbDPJbTtRMq7K1tzURvHhW2ZJaGgS7vfQyCwU6rIbXhNfIJRbNH0IqOs2j59
         0fEYTSeO/wpECcrMLX1C8OoHNbSZXRux6o24uU6bdB3wvlt6oqEiLnkHtiCZpT8J51dM
         Sr+rCQQIOW3svKRuiSedbnvyCRXBS1XXzHa2mCZDy7k8EbelmRneIxExtBmrA3z1tA6D
         kXmWL9GibV+3eclAsuj+JuZAe/6lBP73ehK7KCZTOIfyJGVGnhQ6zLKDblxhPD9UzsUV
         S2wg==
X-Forwarded-Encrypted: i=1; AJvYcCUS4X8QlD9nkVs6lWE08ljQsNW17PwC8Krtr6n/CbLmk+pWpNmnmZlOdQylcuCyILCkz6EeULr6Hl/R1ei5@vger.kernel.org, AJvYcCX47nI9YPeQWFoQ8XC1xSQuKnAtWjMbxjvw+2NjQ2p+fKyvqLuQoIjQIYmy6OewKFqzCwVuXjcUmes=@vger.kernel.org
X-Gm-Message-State: AOJu0Yycqe1/tEiHrAErMKeLXOHam05h7B682WbbSVLewF5RlwoECVLw
	rv6LLPCLoKxwNSETYXaRLx4kLpZGp6yAZHLumwY0gI8URv52NMFFKUzU
X-Gm-Gg: ASbGncvYB2Uspm0iRml8awI1SSG0Twy0lhbglCd6IkPZOPLGwXKTirbtHYfrz0OlFio
	8dHwDFBg6c+8jROQm59x/BN9gYWL2lpYvHtoy6Yg/WcQDZgt9LFQ2A+BNwgDCT3R7MQ+zD4/Uar
	8ep5t7GWWjJ214ZK+P/2pjxoKAaT1TtruBVmWoV0N3lAVyiIMcTeDN/gYLxj3mW6cTXDG5aHpuw
	aha20uVCmxGES2DXUIkn6nvV0qswMoQFILSteboXLdRemirHlsrZ9bPrbE8YWWo/okmOJbhaJ+V
	/yA2ByzZZ9s7yd/EVoLD4ZcjyJuL/3EkhHcjtAPR+K39I//160zpOdvJLkNjwci4dWJ7cxICwlb
	iqAOJw1c=
X-Google-Smtp-Source: AGHT+IF/ow1/EWp39STigJig6Khl9tOyh6FQqrPjVZfUunx/eZoW/FNYghundzTyg76yYxu9pfn8Ew==
X-Received: by 2002:a05:690c:f8b:b0:70c:bb54:cd05 with SMTP id 00721157ae682-7164d40a246mr62055307b3.19.1751487242197;
        Wed, 02 Jul 2025 13:14:02 -0700 (PDT)
Received: from bijan-laptop.attlocal.net ([2600:1700:680e:c000:873e:8f35:7cd8:3fe3])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71515cb4347sm26124157b3.83.2025.07.02.13.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 13:14:01 -0700 (PDT)
From: Bijan Tabatabai <bijan311@gmail.com>
To: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sj@kernel.org,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	joshua.hahnjy@gmail.com,
	bijantabatab@micron.com,
	venkataravis@micron.com,
	emirakhur@micron.com,
	ajayjoshi@micron.com,
	vtavarespetr@micron.com
Subject: [RFC PATCH v3 01/13] mm/damon: add struct damos_migrate_dests
Date: Wed,  2 Jul 2025 15:13:24 -0500
Message-ID: <20250702201337.5780-2-bijan311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702201337.5780-1-bijan311@gmail.com>
References: <20250702201337.5780-1-bijan311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: SeongJae Park <sj@kernel.org>

Introduce a new struct, namely damos_migrate_dests, for specifying
multiple DAMOS' migration destination nodes and their weights.

Signed-off-by: SeongJae Park <sj@kernel.org>
Signed-off-by: Bijan Tabatabai <bijantabatab@micron.com>
---
 include/linux/damon.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/damon.h b/include/linux/damon.h
index bb58e36f019e..24d387a972dd 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -447,6 +447,22 @@ struct damos_access_pattern {
 	unsigned int max_age_region;
 };
 
+/**
+ * struct damos_migrate_dests - Migration destination nodes and their weights.
+ * @node_id_arr:	Array of migration destination node ids.
+ * @weight_arr:		Array of migration weights for @node_id_arr.
+ * @nr_dests:		Length of the @node_id_arr and @weight_arr arrays.
+ *
+ * @node_id_arr is an array of the ids of migration destination nodes.
+ * @weight_arr is an array of the weights for those.  The weights in
+ * @weight_arr are for nodes in @node_id_arr of same array index.
+ */
+struct damos_migrate_dests {
+	unsigned int *node_id_arr;
+	unsigned int *weight_arr;
+	size_t nr_dests;
+};
+
 /**
  * struct damos - Represents a Data Access Monitoring-based Operation Scheme.
  * @pattern:		Access pattern of target regions.
-- 
2.43.5

