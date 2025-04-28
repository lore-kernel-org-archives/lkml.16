Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E0A20968E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745845916; cv=none; b=csOTiDYxU7LVMtTau702kZs4AZm9fVOAkcWRBkIp92mvPPQwyJVh7MxpM7KKU7VnNLUvtLVYINfXbt8z7/P6AyL7xQ3VlqzGxDhiQhyo23/HBo6Zakd4yD8inLf90dzuUWCJUhAE5jYbH2SJ9Yjys6MXYyifm+ALEOXBMw/Tx0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745845916; c=relaxed/simple;
	bh=vmT2BPuNeQMRR4MvPACHB6GbxLQA/K2IZKLlEqetco4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tjK8U2i73X3u2rlajA5l3UDWICvSxEuQCenDBATp7jFdlQ/0lt3UmPE7+gQ59kHsu9otpJEfSLwQFz5IugszSgcNxa2TqNlpCUD71l5ptLc9MZn4r9gJSRP2FhNoSsrS23TpkQLBNfSZ0Uujt3x7JoyAxih6656eB7/wsk2A/k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=XcCIlJRv; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="XcCIlJRv"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39ac56756f6so4832874f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 06:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1745845912; x=1746450712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4J207YyuAGkV1CbUzAQtkN//0ZWB3j4SQpv1vFi2Uk=;
        b=XcCIlJRvzgEFaTv5NCN0bG5EKOCfMVKGEJwv6uAceDzjKQusRAe0HgAe89jvS/uG2G
         NeH7go/wzkwnOhv1AyyhIy1aRFo2tN9SFW0qrrj/iZoln969PfuOIKu/Id4gGTKD4LYZ
         SIarSVFdtDohwnEt6ToHSkadMoVZats3yYCpu9IQY6DlG3jEkc+dfHFrFUBNxzK4BJT6
         1fNK9CJSR0QHKvkSAmdTdpo4CalzYG1Mes2bEP3Gyx6P3svqBH1jQSesjcVorJzj6tar
         f/elkHBclhhUb1Plz0TxlfmE8Cpuhm1PpnKnmIv+fAZDNZ2a3bHnSk/xJoEMycTxg1qO
         VSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745845912; x=1746450712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q4J207YyuAGkV1CbUzAQtkN//0ZWB3j4SQpv1vFi2Uk=;
        b=VOoA08Sc1uC8mY7QYQxzg1n4Tdlf+tx5vhEOsdoOnTM+npJ8yUNfqBUL1gQ5un+V21
         1rdjXc2FJRDBcSeyvL2YZOFOqXG2+rddCcBQo9tBB0cN64XSjMinEG0uCk4R4LIcW/K2
         DoB6ZEwHSA7jprVwG8suxiA7n008o8q2+hCcCZZwguBr0sGpqFMg2q7DRfuwg9delEa8
         nXs3/F1kpYG8QFMBCLUuOsM25SkzI04anaGU5tW30OxVfba1Ex76dMVKBth/g4B2q06y
         B/dgGZMkrn38l5eg7GzG0AKItZoAr2RU2CXeA3wU/L4bJwOkRdVP3/2F6MKs9SvUwY5Z
         /VHw==
X-Forwarded-Encrypted: i=1; AJvYcCXjZmtyCiHKkVdjiJLYuzpLXjc3fvJQNtjOybvQY3IDjIg+G1wxlt/o72xwNhVT1ZwhmcSdPpjV3lrBHtI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWx67uQR/X7BmLk+BkYz/ya45jxR3X1+SjwJUm/8LTABVY9CQ/
	a0g883Ujk4Vgz9MsY0HId/4AnZ+TCtXHtAIS/X3b+KOIDoMO70m4bYSH+6FlLHQ=
X-Gm-Gg: ASbGncvlSzZqEEXegGQ803zM2yu/mVcBvSbQgR06PtWzNlOpY+1zttGy8M9NeGou1Xd
	Mod48ewPucCmGy3Z/4wzE7js7HFNhb/BaudMENhzEfhOJ4i+oxoDvc5yoxQgHv/E4tKyAAhtvMU
	7hrPPz/wQV6lbUX3bAz4Ih+c0wHNunWbH2cyVbS5fOVjgv+3D/pfefvyA5nB3/hZcwrnD0NCBbZ
	ejTg9A40NbVUPRdIxysZ36++sgJNnz4I78S/Sm0khOv/4qhbl997LZEn3RW9YuwAPXoNg161YXO
	q99vUXMsM9M/R4apUrxPeG2VrPjfFSNDp/cyAme7Q7PruAQnIWTs14TIKnoqNcY9bqzxh1my3LF
	PtLV3MfMGPZK6erKlnyyh4xYAuCuIuntKQKLa8Lhm
X-Google-Smtp-Source: AGHT+IFeEs3neKdh4mQxt/dEhTHmRuQ9dywG7AxB1fh+tdreaTzRhkNeBWh/xRaAkPWiQL9l+gfCpw==
X-Received: by 2002:a05:6000:2405:b0:39e:cbde:8889 with SMTP id ffacd0b85a97d-3a07aa5fe38mr6168054f8f.6.1745845912502;
        Mon, 28 Apr 2025 06:11:52 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f46c100023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f46:c100:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a53031acsm122256695e9.9.2025.04.28.06.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 06:11:52 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: dhowells@redhat.com,
	netfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH] fs/netfs: remove unused netfs_io_request flags
Date: Mon, 28 Apr 2025 15:11:49 +0200
Message-ID: <20250428131149.3195399-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NETFS_RREQ_DONT_UNLOCK_FOLIOS has never been used ever since it was
added by commit 3d3c95046742 ("netfs: Provide readahead and readpage
netfs helpers").

NETFS_RREQ_BLOCKED was added by commit 016dc8516aec ("netfs: Implement
unbuffered/DIO read support") but has never been used either.  Without
NETFS_RREQ_BLOCKED, NETFS_RREQ_NONBLOCK makes no sense, and thus can
be removed as well.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 fs/netfs/direct_read.c  |  3 ---
 fs/netfs/objects.c      |  2 --
 fs/netfs/read_collect.c | 14 ++++++--------
 include/linux/netfs.h   |  3 ---
 4 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/fs/netfs/direct_read.c b/fs/netfs/direct_read.c
index 5e3f0aeb51f3..f11a89f2fdd9 100644
--- a/fs/netfs/direct_read.c
+++ b/fs/netfs/direct_read.c
@@ -106,9 +106,6 @@ static int netfs_dispatch_unbuffered_reads(struct netfs_io_request *rreq)
 			netfs_wait_for_pause(rreq);
 		if (test_bit(NETFS_RREQ_FAILED, &rreq->flags))
 			break;
-		if (test_bit(NETFS_RREQ_BLOCKED, &rreq->flags) &&
-		    test_bit(NETFS_RREQ_NONBLOCK, &rreq->flags))
-			break;
 		cond_resched();
 	} while (size > 0);
 
diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
index dc6b41ef18b0..d6f8984f9f5b 100644
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -64,8 +64,6 @@ struct netfs_io_request *netfs_alloc_request(struct address_space *mapping,
 	}
 
 	__set_bit(NETFS_RREQ_IN_PROGRESS, &rreq->flags);
-	if (file && file->f_flags & O_NONBLOCK)
-		__set_bit(NETFS_RREQ_NONBLOCK, &rreq->flags);
 	if (rreq->netfs_ops->init_request) {
 		ret = rreq->netfs_ops->init_request(rreq, file);
 		if (ret < 0) {
diff --git a/fs/netfs/read_collect.c b/fs/netfs/read_collect.c
index 23c75755ad4e..173433d61ea6 100644
--- a/fs/netfs/read_collect.c
+++ b/fs/netfs/read_collect.c
@@ -83,14 +83,12 @@ static void netfs_unlock_read_folio(struct netfs_io_request *rreq,
 	}
 
 just_unlock:
-	if (!test_bit(NETFS_RREQ_DONT_UNLOCK_FOLIOS, &rreq->flags)) {
-		if (folio->index == rreq->no_unlock_folio &&
-		    test_bit(NETFS_RREQ_NO_UNLOCK_FOLIO, &rreq->flags)) {
-			_debug("no unlock");
-		} else {
-			trace_netfs_folio(folio, netfs_folio_trace_read_unlock);
-			folio_unlock(folio);
-		}
+	if (folio->index == rreq->no_unlock_folio &&
+	    test_bit(NETFS_RREQ_NO_UNLOCK_FOLIO, &rreq->flags)) {
+		_debug("no unlock");
+	} else {
+		trace_netfs_folio(folio, netfs_folio_trace_read_unlock);
+		folio_unlock(folio);
 	}
 
 	folioq_clear(folioq, slot);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index c86a11cfc4a3..e0c3a63f4f86 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -268,13 +268,10 @@ struct netfs_io_request {
 	unsigned long		flags;
 #define NETFS_RREQ_OFFLOAD_COLLECTION	0	/* Offload collection to workqueue */
 #define NETFS_RREQ_NO_UNLOCK_FOLIO	2	/* Don't unlock no_unlock_folio on completion */
-#define NETFS_RREQ_DONT_UNLOCK_FOLIOS	3	/* Don't unlock the folios on completion */
 #define NETFS_RREQ_FAILED		4	/* The request failed */
 #define NETFS_RREQ_IN_PROGRESS		5	/* Unlocked when the request completes */
 #define NETFS_RREQ_FOLIO_COPY_TO_CACHE	6	/* Copy current folio to cache from read */
 #define NETFS_RREQ_UPLOAD_TO_SERVER	8	/* Need to write to the server */
-#define NETFS_RREQ_NONBLOCK		9	/* Don't block if possible (O_NONBLOCK) */
-#define NETFS_RREQ_BLOCKED		10	/* We blocked */
 #define NETFS_RREQ_PAUSE		11	/* Pause subrequest generation */
 #define NETFS_RREQ_USE_IO_ITER		12	/* Use ->io_iter rather than ->i_pages */
 #define NETFS_RREQ_ALL_QUEUED		13	/* All subreqs are now queued */
-- 
2.47.2

