Received: from mail-qk1-f228.google.com (mail-qk1-f228.google.com [209.85.222.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025E222A4D2
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 22:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746053568; cv=none; b=Q7qCrXbDRWduvCDQdtcOZB6QmzuCvbgBjkBB8Ee6t/0rArmU4DOi6F955fypSfFZYiubnN+Msmkw4LJ4+rlKk+yPBP7beMUxUj8Utpn3IDi/9cM8PdJvnfV0nEReJZ9ASrxPiu+P4ai3LRjCWuUfVypt/ioPQraIRkp8irigIQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746053568; c=relaxed/simple;
	bh=F6TrVYt+JwOsXBAgbGtX1BWO86E1YJzrFqpSLPyvwJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fuiYFfPZM0BWkmNWEx7eUtLbOPKgrtEcU4QgCGlvAUQxJRGResdu7ACdGqUaFjnwBK5E17FaAuMeqWil//ztvYbvXpUSKwh/xqftBhKpkY1eLTjeDlhgtBUlHI6imlpO8ANd0qmsYwYtdFR+D0dgfB2ei90I5UDN7cbBU2iYw/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=OTDFzYU1; arc=none smtp.client-ip=209.85.222.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="OTDFzYU1"
Received: by mail-qk1-f228.google.com with SMTP id af79cd13be357-7c7a5ee85dcso5020785a.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 15:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1746053565; x=1746658365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8PACZ6LLP08wO4kGq3k+wfqco1Md1ULnOwjRouABJg=;
        b=OTDFzYU1ejV2oaShYfccBzFH4HLqt2QgXpv/uoIa2bvS3V6fhL/Hkzxquv7B35DzEX
         dyzQG6A6AlDf2Tp0Wkf1za/6xbvWzU9d596UkcVCgBh1vwxUqXkwTCJC1Ccx8Uu+awwY
         kcXxyYjea9PMcywZ2+voMK8oC7OEHPsW3r6x1M+piblMSKJbwowAr0dl19b9j8q9WO0p
         +17vtpaHqBsihqQ0Ba8OVsLC9e8jEaYcbv+vwg+WCWURuWix7mUJ67/mEZMJU303VO3U
         4EH3D8HMblSlAHB8MQMSrZJJleDjvRLmtflh3DAPSi2welHl12wi3jyCDlp0sL97E5c3
         s1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746053565; x=1746658365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8PACZ6LLP08wO4kGq3k+wfqco1Md1ULnOwjRouABJg=;
        b=nN1t00Om8DntN23eAY3w0FOm5iML78LSmkhlfjVWtEZGr8Hiwjm2uwfMCBXY/w7qLm
         Fq12fiuUAzREI2BY1ScH6oSMQm7JWB0VVe6+xAU03qsWN9bT8VLXJebSvkDMbdjfrxYi
         xhykOiWgC9HR0+aCFdp1NEfXMLUQtJjBoetEhSnYEUHC3W8Fty95yhPnSsE0rf6HYSUO
         SAVS9C0mhP6GUyqrfdiZuvk8NpPmpM6eHEM+K4HoeriY624XWxDyFdV4eQxF3x9cTpBO
         bkfGXjK+zGCDRJXj/MhZFJbWLmMYUE7FhDQtBliFxk+aOws7z5u9bbZRGA4GpKjLsSo9
         9B1w==
X-Forwarded-Encrypted: i=1; AJvYcCXeWXCBOT+hq53TUiUzEzytPcsgaf6QWoAnDDJR/Pkv90KimLcHQCNKPFG9jCdiH606vICdjs97cIvcPIs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdsH3Xkh/AAQ9SuJFgRMVjbl1eJQDlsnCspFyIYc1Iy+Mnm35j
	p6GiHW+5d5ZCdDXCGX7M2BDdsEF3VTxDoT7wpEtNCjoqWzgv8KarPCiXjmazyt93Xlc/wX06cJJ
	iHB0Iwd03i9Z/xWFHsnleXPp+ilH2nzC2
X-Gm-Gg: ASbGnctMAwyFFIKgEWKUOCN1Ocu2Cv9QK9fL9Qv7DvnLnPh9Z4uXBKlEWEx+up7AunF
	WIIl0Y/t2pSxrdWxjLlaxixum+ug8fF9fCay94hzpGaf71pFddlzjEypwE7OZpTZNC2MlW2W5UF
	NsoxQRSthZ0HLGugPo04SwRHlq6pB3IFj2Vu7s8eF9rJ8zIiwjsZvQt9y8PCGQsUNmVPENoc5Rq
	nJVVT3/gKLhpc4zyXjngMVq9QHepxFRZUxIim7o42VRoM45CDeUm1KrwYg2LeIGIcnkMujS+Px8
	3+y1hxw9/k+beHuFWCZJH3BEYTO3nv1gByPWOcYwLKHC
X-Google-Smtp-Source: AGHT+IH7rEYnM3RyaHx0cZHBylp50xHUVBApawghs582YsWIGA4OsSEDMnx3ZL4L0oNlsK/S/bXrrAAeAoZR
X-Received: by 2002:a05:622a:188b:b0:471:f5a4:546 with SMTP id d75a77b69052e-489e43b3bf9mr27214501cf.3.1746053564787;
        Wed, 30 Apr 2025 15:52:44 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-48b06518ffesm126911cf.7.2025.04.30.15.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 15:52:44 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-csander.dev.purestorage.com (dev-csander.dev.purestorage.com [10.7.70.37])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 20A1B340199;
	Wed, 30 Apr 2025 16:52:44 -0600 (MDT)
Received: by dev-csander.dev.purestorage.com (Postfix, from userid 1557716354)
	id 1EC37E41CC0; Wed, 30 Apr 2025 16:52:44 -0600 (MDT)
From: Caleb Sander Mateos <csander@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>,
	Jens Axboe <axboe@kernel.dk>
Cc: Uday Shankar <ushankar@purestorage.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Sander Mateos <csander@purestorage.com>
Subject: [PATCH v2 4/9] ublk: take const ubq pointer in ublk_get_iod()
Date: Wed, 30 Apr 2025 16:52:29 -0600
Message-ID: <20250430225234.2676781-5-csander@purestorage.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250430225234.2676781-1-csander@purestorage.com>
References: <20250430225234.2676781-1-csander@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ublk_get_iod() doesn't modify the struct ublk_queue it is passed.
Clarify that by making the argument a const pointer.

Move the function definition earlier in the file so it doesn't need a
forward declaration.

Signed-off-by: Caleb Sander Mateos <csander@purestorage.com>
---
 drivers/block/ublk_drv.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index 4967a5d72029..f4c1db2e7f54 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -203,12 +203,17 @@ struct ublk_params_header {
 static void ublk_stop_dev_unlocked(struct ublk_device *ub);
 static void ublk_abort_queue(struct ublk_device *ub, struct ublk_queue *ubq);
 static inline struct request *__ublk_check_and_get_req(struct ublk_device *ub,
 		struct ublk_queue *ubq, int tag, size_t offset);
 static inline unsigned int ublk_req_build_flags(struct request *req);
-static inline struct ublksrv_io_desc *ublk_get_iod(struct ublk_queue *ubq,
-						   int tag);
+
+static inline struct ublksrv_io_desc *
+ublk_get_iod(const struct ublk_queue *ubq, unsigned tag)
+{
+	return &ubq->io_cmd_buf[tag];
+}
+
 static inline bool ublk_dev_is_user_copy(const struct ublk_device *ub)
 {
 	return ub->dev_info.flags & (UBLK_F_USER_COPY | UBLK_F_SUPPORT_ZERO_COPY);
 }
 
@@ -692,16 +697,10 @@ static inline struct ublk_queue *ublk_get_queue(struct ublk_device *dev,
 static inline bool ublk_rq_has_data(const struct request *rq)
 {
 	return bio_has_data(rq->bio);
 }
 
-static inline struct ublksrv_io_desc *ublk_get_iod(struct ublk_queue *ubq,
-		int tag)
-{
-	return &ubq->io_cmd_buf[tag];
-}
-
 static inline struct ublksrv_io_desc *
 ublk_queue_cmd_buf(struct ublk_device *ub, int q_id)
 {
 	return ublk_get_queue(ub, q_id)->io_cmd_buf;
 }
-- 
2.45.2

