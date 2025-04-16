Received: from mail-yw1-f228.google.com (mail-yw1-f228.google.com [209.85.128.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19924191
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744819706; cv=none; b=gkurU1+/WZ8kf0y+HuZSdNACYnjBhWgKdWRLsN/WcluBwqGnVwB4j9jTC/YBth6KPdQYCthoycn32lWuzwuTuzgzFOrCdUGezKWu/6QPhMMFV2InvZnafAxKblxr4ccjEeZB9S6clJ8QlJJVtSBuGQKCwKVCTSJxJt439Z24VJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744819706; c=relaxed/simple;
	bh=CBsDig6F9DsAhiYnyv8L2iByhzO/LcGrzhJqjFrLOb0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p/NxYyMToSIiRDHmQiShv4RgpR+Wl9yq9SqnWE+Vu1/lxTsiFH+iP6TS+9k9MO4BjL97W9PL9VUQ1YO3GwJaxyxa+XqLwXvvOZ7Tf3r7z7FFlP6SN0cdMK3N3pp08yd0t75HjHrpz0tOC3+3WA7qCeOu93BNi3cvVYA7dBvNROY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=fFnsEQgg; arc=none smtp.client-ip=209.85.128.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="fFnsEQgg"
Received: by mail-yw1-f228.google.com with SMTP id 00721157ae682-70253b9b144so1935547b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1744819703; x=1745424503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7k4WygtbOq9V/TUXra9P9LV10YW1W6+zkPqQlC9hmIc=;
        b=fFnsEQggGtfmzefHplkoucwJa9Hyok1JnN/mEKzOILrJa++o49/BxPvnT2CE1DQstg
         MgeNPyKUt4Z0LBmTWvA+4Rsl9FD2DzWfGomwNRjV/lwWbbnpcmzIJqNvaxkTBXaAONk1
         RgrnsMxau9yjWU8LHZEZuY01yLSirI8/AIuP5k5uCqPXmEHVZ0fitmqXsEvzaDsubNMk
         QZMwx2kgs915Wee95OTsJ9ykOHWsmntCqPKQKihot0otroBVG+d8Rk278d0J7t16f9Cx
         uExIMCvcrw/OJBLLpv/yw2PpMA8nhm4fb3ZAVYVoEeVDrwoe6PH73+EY0ZkwbKNIBynU
         oQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744819703; x=1745424503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7k4WygtbOq9V/TUXra9P9LV10YW1W6+zkPqQlC9hmIc=;
        b=odecHJgGoEY8LjgygNDmXlSukFRk/W0aqx3ZPUA2PNiKJbrGNbpgg26FeMyfjI+qMj
         xy1QllnI9/Yk7zwh5FwrqUlRcDJRfaV/ugkHZBTJ1Po9+YPm3pK0N1N1jet4UVf4ZG2m
         nDecFhpvkOxVTEBQjGC7oFbQUwCmAs3Zy4KplX6YE2bj5QxJFsq+zP0s27Hihm6Z1+Za
         E9QWunuk9FzE3uBgWUlIVAn19SaHQZVZ4q2cTCfW6bylAPTvUb4arqRwyEL+P+kuuTD4
         pk+w4/KhRYWkG+4Ykd5ygxs1f+jKKNP0WjBAuKbpT7I36+hiTHwx9espIal5BHZBtA11
         qLWA==
X-Forwarded-Encrypted: i=1; AJvYcCVNnE4pjaITZDVCWLSFiWSSo9tnwmcF9Qsmc/a6FeXkRLsLaNgWrAGBpT6ATkOJKb4UAfWm4DEhvf19C00=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqzPvRMPFCOpZOKJmyQUiYRNYzLdn58JxuElvdYItkGGYomaKY
	4MBXJBhoJgzdlMPdKRKdd29fYKLhtNfuF3bUGkf2WQy/eGmy8/hZY3gV/D6hof0leOwvyxHT8W7
	PxHoG9meAQ9EdRKgUHnUV98+fhEroqEde
X-Gm-Gg: ASbGncu91vVNYCUiaAbyQAN8hfJgF2I6XKsYP98IFXLtOTsenfg5Sxtnin0fqovJz4g
	qgsfMr4beVvgUvUKcIbTKckrwERbSJFLDuedyvqWMH4jcUHDasjw1WqcjYtXijhDvU8t0FwWxP4
	Xtm24Uf4aEzCk7lWukeQ8F3Z43iToeWc7RCPXO6xIWc4pXmMLti4fTs1CIEEOy1ck+3Ft5l+OYw
	hGT5NBM/EZTGn4CMA1AAQbJZh6kGzumFj9qpVGIj64y9dBY00MI26QTvqtqcHt7J5wuXkqmLkcF
	dDYjbfW0UaAH7+GkFgaWQ6Ar9e4PDnIes6XKeowiNlFp
X-Google-Smtp-Source: AGHT+IHruA+h68cgYDaioq+gzj1KJHDh5bJmz+QV0BmrVPaqXLWxXSqCMRnBziGF+k21bIDTpr0Ffxe+9IHr
X-Received: by 2002:a05:690c:399:b0:6f9:558d:538e with SMTP id 00721157ae682-706bb933e6bmr1448397b3.5.1744819702792;
        Wed, 16 Apr 2025 09:08:22 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-7053e174f86sm11698467b3.36.2025.04.16.09.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 09:08:22 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (unknown [IPv6:2620:125:9007:640:ffff::418a])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id E7038340237;
	Wed, 16 Apr 2025 10:08:21 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id DA7FDE4186F; Wed, 16 Apr 2025 10:08:21 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org,
	linux-block@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] scatterlist: inline sg_next()
Date: Wed, 16 Apr 2025 10:06:13 -0600
Message-ID: <20250416160615.3571958-1-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sg_next() is a short function called frequently in I/O paths. Define it
in the header file so it can be inlined into its callers.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
Is it a concern that this would break kernel modules built against old headers?
If so, I could update the patch to continue compiling and exporting sg_next() in
scatterlist.c.

 include/linux/scatterlist.h | 23 ++++++++++++++++++++++-
 lib/scatterlist.c           | 23 -----------------------
 2 files changed, 22 insertions(+), 24 deletions(-)

diff --git a/include/linux/scatterlist.h b/include/linux/scatterlist.h
index 138e2f1bd08f..0cdbfc42f153 100644
--- a/include/linux/scatterlist.h
+++ b/include/linux/scatterlist.h
@@ -92,10 +92,32 @@ static inline bool sg_is_chain(struct scatterlist *sg)
 static inline bool sg_is_last(struct scatterlist *sg)
 {
 	return __sg_flags(sg) & SG_END;
 }
 
+/**
+ * sg_next - return the next scatterlist entry in a list
+ * @sg:		The current sg entry
+ *
+ * Description:
+ *   Usually the next entry will be @sg@ + 1, but if this sg element is part
+ *   of a chained scatterlist, it could jump to the start of a new
+ *   scatterlist array.
+ *
+ **/
+static inline struct scatterlist *sg_next(struct scatterlist *sg)
+{
+	if (sg_is_last(sg))
+		return NULL;
+
+	sg++;
+	if (unlikely(sg_is_chain(sg)))
+		sg = sg_chain_ptr(sg);
+
+	return sg;
+}
+
 /**
  * sg_assign_page - Assign a given page to an SG entry
  * @sg:		    SG entry
  * @page:	    The page
  *
@@ -416,11 +438,10 @@ static inline void sg_init_marker(struct scatterlist *sgl,
 	sg_mark_end(&sgl[nents - 1]);
 }
 
 int sg_nents(struct scatterlist *sg);
 int sg_nents_for_len(struct scatterlist *sg, u64 len);
-struct scatterlist *sg_next(struct scatterlist *);
 struct scatterlist *sg_last(struct scatterlist *s, unsigned int);
 void sg_init_table(struct scatterlist *, unsigned int);
 void sg_init_one(struct scatterlist *, const void *, unsigned int);
 int sg_split(struct scatterlist *in, const int in_mapped_nents,
 	     const off_t skip, const int nb_splits,
diff --git a/lib/scatterlist.c b/lib/scatterlist.c
index b58d5ef1a34b..7582dfab7fe3 100644
--- a/lib/scatterlist.c
+++ b/lib/scatterlist.c
@@ -11,33 +11,10 @@
 #include <linux/kmemleak.h>
 #include <linux/bvec.h>
 #include <linux/uio.h>
 #include <linux/folio_queue.h>
 
-/**
- * sg_next - return the next scatterlist entry in a list
- * @sg:		The current sg entry
- *
- * Description:
- *   Usually the next entry will be @sg@ + 1, but if this sg element is part
- *   of a chained scatterlist, it could jump to the start of a new
- *   scatterlist array.
- *
- **/
-struct scatterlist *sg_next(struct scatterlist *sg)
-{
-	if (sg_is_last(sg))
-		return NULL;
-
-	sg++;
-	if (unlikely(sg_is_chain(sg)))
-		sg = sg_chain_ptr(sg);
-
-	return sg;
-}
-EXPORT_SYMBOL(sg_next);
-
 /**
  * sg_nents - return total count of entries in scatterlist
  * @sg:		The scatterlist
  *
  * Description:
-- 
2.45.2

