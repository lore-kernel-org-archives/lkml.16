Received: from pv50p00im-zteg10011501.me.com (pv50p00im-zteg10011501.me.com [17.58.6.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375EF22E41C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 11:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.6.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744026283; cv=none; b=CWlBYkvbBhVHoxHLmH3mZkzFQ1JvGlcwnhTA8MaqKhNG5fizAD6A+YEqCH2dCIXEtn51GwhJ74ERr1tsRjAEJhse/xDI8Xu4m4Igcay4SZyPeJXF+fW71EsrHwWGHWfFScgdr+Yy92p7rGXHihbKqcH6IrEyujjh313vT79FqeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744026283; c=relaxed/simple;
	bh=D/CPT8XmvB9FAoPbJ9+WEUlE3u6NN/jBQGueVWn0J4E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cxR6tT98NxOwU+8SBd7WbcdcdwlKhNtIUDxuHacJtRJrLvlz3SqgGgAIHbVvmX8A5MSTCpteDngFFDczXgau5sNhBWYDZGdHRC3xoKx98By/JxKsnHpxKs4nVogDSFE7nu07GWb5aRsYgeoV/GADskwjW6jace4cNPdruJ/aHeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=VieeDlsn; arc=none smtp.client-ip=17.58.6.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="VieeDlsn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=yrxNiCLMqXjwK0WgtiD+xkdaChkkYlw7s+yydgfpWMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme;
	b=VieeDlsnnzEmC3kKJuvw6j2GtjJ7uh0gVhtB09REbS+ed5OupvxTEG4xe2edk9K9s
	 OaN5YBG0fa4+99K3htWKiPMa9Ip/6n/nGM1GyHr2Lr1gm4sKtvCiQ40Q64ZwTMfH29
	 BNqSop8wh1lPyZP+Gwt+wUk+JO3E8MTTe9uP400eSv5oDmuMFRumrZc5KuAsQwWDz9
	 nHrcWftK1SsgqAud/ri3bHPhzirQa4xR5mDyL8ctjFyWWkYingisVnzAtLSmfWDvQn
	 3wNOrZ2qXvuyIcZWUN2Egj35ENLd8xz2CX8PlcCWyIlrq1NzC5ywRLId2NXTdHCAQ5
	 T22jLDOAdNdpw==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-zteg10011501.me.com (Postfix) with ESMTPSA id 2E3044A0007;
	Mon,  7 Apr 2025 11:44:36 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Mon, 07 Apr 2025 19:44:16 +0800
Subject: [PATCH] errseq: Eliminate special limitation for macro MAX_ERRNO
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-improve_errseq-v1-1-7b27cbeb8298@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAI+682cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEwNz3czcgqL8stT41KKi4tRCXYvktERDU2PLNMtUSyWgpoKi1LTMCrC
 B0bG1tQBCYJudYAAAAA==
X-Change-ID: 20250407-improve_errseq-8cfa1539f9e9
To: Andrew Morton <akpm@linux-foundation.org>, 
 Jeff Layton <jlayton@kernel.org>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-kernel@vger.kernel.org, 
 Zijun Hu <quic_zijuhu@quicinc.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 3C_ZYFR2-74dNmgEHkSlXOGaBBQl0hQx
X-Proofpoint-ORIG-GUID: 3C_ZYFR2-74dNmgEHkSlXOGaBBQl0hQx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_03,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 clxscore=1011
 suspectscore=0 malwarescore=0 mlxlogscore=779 phishscore=0 mlxscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2504070084
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8

From: Zijun Hu <quic_zijuhu@quicinc.com>

Current errseq implementation depends on a very special precondition
that macro MAX_ERRNO must be (2^n - 1).

Eliminate the limitation by
- redefine macro ERRSEQ_SHIFT.
- define a new macro ERRNO_MASK instead of MAX_ERRNO for errno mask.

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 lib/errseq.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/lib/errseq.c b/lib/errseq.c
index 93e9b94358dc63dcc911fd45a01ccf38d2104ecf..13a2581c5a878445f8a089d0d34e901f77a9e074 100644
--- a/lib/errseq.c
+++ b/lib/errseq.c
@@ -34,11 +34,14 @@
  */
 
 /* The low bits are designated for error code (max of MAX_ERRNO) */
-#define ERRSEQ_SHIFT		ilog2(MAX_ERRNO + 1)
+#define ERRSEQ_SHIFT		(ilog2(MAX_ERRNO) + 1)
 
 /* This bit is used as a flag to indicate whether the value has been seen */
 #define ERRSEQ_SEEN		(1 << ERRSEQ_SHIFT)
 
+/* Leverage macro ERRSEQ_SEEN to define errno mask macro here */
+#define ERRNO_MASK		(ERRSEQ_SEEN - 1)
+
 /* The lowest bit of the counter */
 #define ERRSEQ_CTR_INC		(1 << (ERRSEQ_SHIFT + 1))
 
@@ -60,8 +63,6 @@ errseq_t errseq_set(errseq_t *eseq, int err)
 {
 	errseq_t cur, old;
 
-	/* MAX_ERRNO must be able to serve as a mask */
-	BUILD_BUG_ON_NOT_POWER_OF_2(MAX_ERRNO + 1);
 
 	/*
 	 * Ensure the error code actually fits where we want it to go. If it
@@ -79,7 +80,7 @@ errseq_t errseq_set(errseq_t *eseq, int err)
 		errseq_t new;
 
 		/* Clear out error bits and set new error */
-		new = (old & ~(MAX_ERRNO|ERRSEQ_SEEN)) | -err;
+		new = (old & ~(ERRNO_MASK | ERRSEQ_SEEN)) | -err;
 
 		/* Only increment if someone has looked at it */
 		if (old & ERRSEQ_SEEN)
@@ -148,7 +149,7 @@ int errseq_check(errseq_t *eseq, errseq_t since)
 
 	if (likely(cur == since))
 		return 0;
-	return -(cur & MAX_ERRNO);
+	return -(cur & ERRNO_MASK);
 }
 EXPORT_SYMBOL(errseq_check);
 
@@ -200,7 +201,7 @@ int errseq_check_and_advance(errseq_t *eseq, errseq_t *since)
 		if (new != old)
 			cmpxchg(eseq, old, new);
 		*since = new;
-		err = -(new & MAX_ERRNO);
+		err = -(new & ERRNO_MASK);
 	}
 	return err;
 }

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250407-improve_errseq-8cfa1539f9e9

Best regards,
-- 
Zijun Hu <quic_zijuhu@quicinc.com>

