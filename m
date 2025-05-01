Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6EE1EB5FA
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 01:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746061509; cv=none; b=NaLNkY9ootgcFX/VOQNB3M4C6kacdFZfDnhNWYdN/vucU6PgZh2Dx+wdaH8MGzRfcWruXn6u2uELvnO3ljvfvVV+AG5H+sdjh7NIrkE1YAebhmXElEHYUUQSxx8+qjzKDwuuKADuzkJnkISfylBtYgRrPgXf+oWbnNOLQiu1eYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746061509; c=relaxed/simple;
	bh=Qz+FqJ8/BCWLX/x147Js0nV8H0QqmqxrG1bXp3vVvVU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kaJDM7UJf4khfekur2xmsSNQnlCmL2JtAFKepLobLA+fFJCVXjj5wExZHTJgygBfyh1eIXiM3eiDHP2NYFzxkYoe2Ecvbm0Eof0bkDt4T81RTyJMKjWX1UjQOVqnOVo+psyn0EeZ6XzIn45XSlXuxLABF6EjAbZLJ4QuSNvva7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=TGGa5h3C; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="TGGa5h3C"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=tqh/nkQtiITS5axq2YgCjKqZg6ygTRV+qeDMgtW8F+U=; b=TGGa5h3C4i85hRsU
	QsTn0RrGdU7+v9uWZq67JHu/oeBIiYAF9gdu6Kwyw5d7nnFUxgfdsB1vz3XbqEQMUM1Rt1g07UXZo
	IrZmLbMfWE3EwOimChTQgs0m7Wi9V8kyzgFbVFCRgFkyTZJ2NN918TYK2IHntuNS6ypcOHOkkgh1P
	KyctJaMH/wthFhPgPyFiHza5hEyZQRSm0WCx2Mp+fcXYPwMdVcu8rA/3LBBRNFOmXOFtRNxWHRZDf
	S2DuDHecQUWqpUo/Jfjyzz6QV4EIRcmxDbYCYBZwQAUSh2e5qwZBruv+KBe6SOnWDOlSr1UUXrBUY
	zPY/lSbwWPuV4CHjTg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uAIMJ-000ooN-1m;
	Thu, 01 May 2025 01:05:03 +0000
From: linux@treblig.org
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] lib/oid_registry.c: Remove unused sprint_OID
Date: Thu,  1 May 2025 02:05:02 +0100
Message-ID: <20250501010502.326472-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

sprint_OID() was added as part of 2012's
commit 4f73175d0375 ("X.509: Add utility functions to render OIDs as
strings")

but hasn't been used.

Remove it.

Note that there's also 'sprint_oid' (lower case) which is used
in a lot of places; that's left as is except for fixing its
case in a comment.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 include/linux/oid_registry.h |  1 -
 lib/oid_registry.c           | 25 +------------------------
 2 files changed, 1 insertion(+), 25 deletions(-)

diff --git a/include/linux/oid_registry.h b/include/linux/oid_registry.h
index 6f9242259edc..6de479ebbe5d 100644
--- a/include/linux/oid_registry.h
+++ b/include/linux/oid_registry.h
@@ -151,6 +151,5 @@ enum OID {
 extern enum OID look_up_OID(const void *data, size_t datasize);
 extern int parse_OID(const void *data, size_t datasize, enum OID *oid);
 extern int sprint_oid(const void *, size_t, char *, size_t);
-extern int sprint_OID(enum OID, char *, size_t);
 
 #endif /* _LINUX_OID_REGISTRY_H */
diff --git a/lib/oid_registry.c b/lib/oid_registry.c
index fe6705cfd780..9b757a117f09 100644
--- a/lib/oid_registry.c
+++ b/lib/oid_registry.c
@@ -117,7 +117,7 @@ int parse_OID(const void *data, size_t datasize, enum OID *oid)
 EXPORT_SYMBOL_GPL(parse_OID);
 
 /*
- * sprint_OID - Print an Object Identifier into a buffer
+ * sprint_oid - Print an Object Identifier into a buffer
  * @data: The encoded OID to print
  * @datasize: The size of the encoded OID
  * @buffer: The buffer to render into
@@ -173,26 +173,3 @@ int sprint_oid(const void *data, size_t datasize, char *buffer, size_t bufsize)
 	return -EBADMSG;
 }
 EXPORT_SYMBOL_GPL(sprint_oid);
-
-/**
- * sprint_OID - Print an Object Identifier into a buffer
- * @oid: The OID to print
- * @buffer: The buffer to render into
- * @bufsize: The size of the buffer
- *
- * The OID is rendered into the buffer in "a.b.c.d" format and the number of
- * bytes is returned.
- */
-int sprint_OID(enum OID oid, char *buffer, size_t bufsize)
-{
-	int ret;
-
-	BUG_ON(oid >= OID__NR);
-
-	ret = sprint_oid(oid_data + oid_index[oid],
-			 oid_index[oid + 1] - oid_index[oid],
-			 buffer, bufsize);
-	BUG_ON(ret == -EBADMSG);
-	return ret;
-}
-EXPORT_SYMBOL_GPL(sprint_OID);
-- 
2.49.0

