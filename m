Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0012C2356C7
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745491028; cv=none; b=a3NdBxDDS/+i/aC1z9JmvSFtOw5S9Bi3MQVq2WWPkfejBKmQLcdUo+xB5BeghHjg0JCiwiULGlk2yaog52zhBV/yOHWgCEHcmj4lu9m8J92+ckSV+uCeTFHkfSdXYXeisVNHeKJ0nk9v95ekUlxNsmhVIezpODGLhhGC8wNdo8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745491028; c=relaxed/simple;
	bh=TmyMfVSZePGbf+pWUXHYOQIK/ZRvODD/YG8yNgg3Q9M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fXdtSZtMOCZJD4WzhOE46/s2UA6K2AtCNGff4jEMz2BA5GgV6yqVGy0srw0BNMmqsKoThaaZ2bnFiDk1nZX/ANbBkff/DfmcF6F/c6CZJ5WEcBVnuMXLxme4D1a5dWRyBxNlOVe2eXAxX9WjCa7VwpsMXOyjwkZXZHfjSzh537Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cp5Y7h2G; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cp5Y7h2G"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-301302a328bso1144121a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 03:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745491025; x=1746095825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vb0kshWFEdfqSwCojCAxnGSpz+cJLNiZV1M7W+IRDC4=;
        b=Cp5Y7h2GxkpjrgXRzFMOBTzp1lSRycew8uUsbpHj1B3ROGv4lV/ncm3TL0hv+5o0BE
         ymGlHI3Ikm6WseiGvuUFyJV3Tw3qfQrXDuc0NqM9LI6LN/o1zP5zxnlmmJHdEbbh8mpe
         6PzWVq3uIn3pTtC+BTpoekbgINR2fBToumDdEI1QvhaLNoA/0MrH6KNK8DN/3E17ZRro
         RuOAIKRtFFNrXDV0WCfAxXpzmyuHooJyQt4hWFpRVZ2k0yDRpvG5x8f2iaT6kYjqbDyL
         donVxSG3DCxO/9w3VWS16bCuEiCE9I9cQYjxFCyl4U5SQ+LbGD59sabuYDFnIzrlQwuj
         qndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745491025; x=1746095825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vb0kshWFEdfqSwCojCAxnGSpz+cJLNiZV1M7W+IRDC4=;
        b=O/xdvBEqosbI8Ztz34Svyzth618PlHUOp9+/uUWSCLFVfYklRw01UmLPfPL+PcEbbi
         Nwx/vtGmm6eufUNMsPTM9xhKpSEL9ooBRhM4aWV73bon6K8qO4sXm7qX6PeM6CDqfKGY
         RTND/yu8ahFoIxi+sJhe3PN4mclpw5DKOvQOTlyfBuIKmXv18YOsV3FNS/kJPbYf2tiu
         eK+m7wHDDUeEIZZ3j48OfRHagIxhnN04ybaPkauy05i+Tjh20km4DkK8m3G/Csa2sLZ0
         /mqoHzNJpTJk9YJg5m7fKJrT6AvTlSq2XfYNlDgYc2sHk5Km9FpDXBZAkNRL+LrXG6P9
         Z9xQ==
X-Forwarded-Encrypted: i=1; AJvYcCWt8WUU/yIcpAMBgIVrjYGIO2TOc5s2EbHd3iOm/qKSrQ2kfBfTCp0a9mk5V/bow2WNIhaW+zDK03efJno=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDbCPQ7LyD0BEbMR7vfHNrv+CsnUK/92Q1keQQch3m8zThod9w
	Q8qT1dhWebR8m2aDmrcexPFA/ynQFeZz8jdVDfu1mZQQ+w6OYNh9/zyiYIgc4A4=
X-Gm-Gg: ASbGncsG286XtKFaBz2WKBP5a8ZgRcZV56asHY8V0PHXbKY/lUkQTvmn3CiQXGKHk5k
	gBgcKKWpyrogDp6R1VL5k2YlrDtD9+CxwivOpOXxPAOFXhjdiWZENvt1Gpt75BuhJ2MC8TAP0EW
	V3pp28EtCCdn7LSrRMcbrYqjKRQ+mhJjEPqzvQC71iUVDXiYFhb+JtQADBjdw1ZOUyvAQsJL9mZ
	5tZkYqToC7h4uXXN1OAhW9PCqLV7DSm5g01UJTER/TRgC6QdxtL27O0fEzPEV3aSBxy8Gj/PktG
	nxMh48YYdUVHnuJhMQUakw7MhlRpKK3BdP6WewLN1w==
X-Google-Smtp-Source: AGHT+IFZZsVLcW4BUe+ZrSM6uW6Wa2ikYA0R9RA3RPc1tiMPNWk4codtXgnN6tMcSgjrfAqGLXPdIA==
X-Received: by 2002:a17:90a:f945:b0:2f6:be57:49d2 with SMTP id 98e67ed59e1d1-309ed29c8d8mr3487943a91.17.1745491025233;
        Thu, 24 Apr 2025 03:37:05 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef0d5c72sm987560a91.43.2025.04.24.03.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:37:04 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] OPP: Remove _get_opp_table_kref()
Date: Thu, 24 Apr 2025 16:06:44 +0530
Message-Id: <4cb1383f9522a3d2f5e26b70688417187c7d48e4.1745490980.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1745490980.git.viresh.kumar@linaro.org>
References: <cover.1745490980.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use dev_pm_opp_get_opp_table_ref() directly instead.

No intentional functional impact.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/opp/core.c | 9 ++-------
 drivers/opp/of.c   | 6 +++---
 drivers/opp/opp.h  | 1 -
 3 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 73e9a3b2f29b..e63a9b009df1 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -59,7 +59,7 @@ static struct opp_table *_find_opp_table_unlocked(struct device *dev)
 
 	list_for_each_entry(opp_table, &opp_tables, node) {
 		if (_find_opp_dev(dev, opp_table)) {
-			_get_opp_table_kref(opp_table);
+			dev_pm_opp_get_opp_table_ref(opp_table);
 			return opp_table;
 		}
 	}
@@ -1688,14 +1688,9 @@ static void _opp_table_kref_release(struct kref *kref)
 	kfree(opp_table);
 }
 
-void _get_opp_table_kref(struct opp_table *opp_table)
-{
-	kref_get(&opp_table->kref);
-}
-
 void dev_pm_opp_get_opp_table_ref(struct opp_table *opp_table)
 {
-	_get_opp_table_kref(opp_table);
+	kref_get(&opp_table->kref);
 }
 EXPORT_SYMBOL_GPL(dev_pm_opp_get_opp_table_ref);
 
diff --git a/drivers/opp/of.c b/drivers/opp/of.c
index a24f76f5fd01..87cb6aeb49ed 100644
--- a/drivers/opp/of.c
+++ b/drivers/opp/of.c
@@ -61,7 +61,7 @@ struct opp_table *_managed_opp(struct device *dev, int index)
 			 * OPP table contains a "opp-shared" property.
 			 */
 			if (opp_table->shared_opp == OPP_TABLE_ACCESS_SHARED) {
-				_get_opp_table_kref(opp_table);
+				dev_pm_opp_get_opp_table_ref(opp_table);
 				managed_table = opp_table;
 			}
 
@@ -117,7 +117,7 @@ static struct opp_table *_find_table_of_opp_np(struct device_node *opp_np)
 	mutex_lock(&opp_table_lock);
 	list_for_each_entry(opp_table, &opp_tables, node) {
 		if (opp_table_np == opp_table->np) {
-			_get_opp_table_kref(opp_table);
+			dev_pm_opp_get_opp_table_ref(opp_table);
 			mutex_unlock(&opp_table_lock);
 			return opp_table;
 		}
@@ -406,7 +406,7 @@ static void lazy_link_required_opp_table(struct opp_table *new_table)
 			}
 
 			required_opp_tables[i] = new_table;
-			_get_opp_table_kref(new_table);
+			dev_pm_opp_get_opp_table_ref(new_table);
 
 			/* Link OPPs now */
 			ret = lazy_link_required_opps(opp_table, new_table, i);
diff --git a/drivers/opp/opp.h b/drivers/opp/opp.h
index 5c7c81190e41..9eba63e01a9e 100644
--- a/drivers/opp/opp.h
+++ b/drivers/opp/opp.h
@@ -251,7 +251,6 @@ struct opp_table {
 
 /* Routines internal to opp core */
 bool _opp_remove_all_static(struct opp_table *opp_table);
-void _get_opp_table_kref(struct opp_table *opp_table);
 int _get_opp_count(struct opp_table *opp_table);
 struct opp_table *_find_opp_table(struct device *dev);
 struct opp_device *_add_opp_dev(const struct device *dev, struct opp_table *opp_table);
-- 
2.31.1.272.g89b43f80a514

