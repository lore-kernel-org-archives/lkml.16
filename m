Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76293FE7
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 01:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749863035; cv=none; b=g9A/V1g1nL5+uzDFJavU7tHZQhVcR5HVZ85t9MJQ6P9ghL70ALd9ugvdlstK4bBW+JYdQXidvDiYYRx6+sQxORNuCtfonAq/dLgMUVnrOyJNKQ95QEH7QMDDvSFmtJccnyMMIIjJ73XMpxAgSv1UKoPV1GejySB9RI8PilQk25g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749863035; c=relaxed/simple;
	bh=LfPdQlUj7TF8+sAEiZ0l0Oa6+gp97WGy8Y0Lgjta24s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tOMUhBJ2yC2R9DwMpitQRF9iQ9gwrm5wClr1H9my+0D0NimDUbegsuFsb5MOWLvETZCz7n8vdFwVeP9OpX21oie55Da1v2pYzAJ34mnNCP5A4i2mYZ+9RsuCCeQ3EpnpGJZfXETpqiUXk+iTXA3FKbE19rpkC8/8jZzAcfTVIYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=qhYykUnn; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="qhYykUnn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=r3o1i6lLmKxLGantK9331rcF+ZPQxb4Sf5yEFTSHUYM=; b=qhYykUnnbaB+ITKf
	FYjl3TFODrKwn3hmB4okYFrpRqgyol6CHlnZLsUqZNAqm+dRlnVhTooMBdmkO2FrD6l1hKa7NHEZt
	LpVF1jSt1HjSWDMrpElxtliSexfrYHFyWve1hTHU7ZhoWQLPed0KxYNNJNFwGQUDFjQAElSYRgKzV
	O4k2NIiwAu5ewjdgatw0KrTd/IX6E/CvAO/dkmEckcGb4QKSsOJ0vOJqUcOTnT726wwqXXsosR4lz
	qDWxZCi20cSYdtRoiVfrd0ausYIurwPfdmH4GhXQifzgrV9Kc9JrZbISPE0zoTb2RcLjzVhDPjDOI
	mNmMQS1FKiXvMwqNTQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uQFJF-009amM-1q;
	Sat, 14 Jun 2025 01:03:49 +0000
From: linux@treblig.org
To: bryan-bt.tan@broadcom.com,
	vishnu.dasa@broadcom.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 3/3] misc: vmw_vmci: Remove unused qpair functions
Date: Sat, 14 Jun 2025 02:03:44 +0100
Message-ID: <20250614010344.636076-4-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250614010344.636076-1-linux@treblig.org>
References: <20250614010344.636076-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

vmci_qpair_dequeue(), vmci_qpair_enqueue() and vmci_qpair_peek()
were added in 2013 by
commit 06164d2b72aa ("VMCI: queue pairs implementation.")

but have remained unused.

Remove them.

(The iov version of those functions is used)

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/misc/vmw_vmci/vmci_queue_pair.c | 133 ------------------------
 include/linux/vmw_vmci_api.h            |   6 --
 2 files changed, 139 deletions(-)

diff --git a/drivers/misc/vmw_vmci/vmci_queue_pair.c b/drivers/misc/vmw_vmci/vmci_queue_pair.c
index 73d71c4ec139..b88ac144ad32 100644
--- a/drivers/misc/vmw_vmci/vmci_queue_pair.c
+++ b/drivers/misc/vmw_vmci/vmci_queue_pair.c
@@ -3022,139 +3022,6 @@ s64 vmci_qpair_consume_buf_ready(const struct vmci_qp *qpair)
 }
 EXPORT_SYMBOL_GPL(vmci_qpair_consume_buf_ready);
 
-/*
- * vmci_qpair_enqueue() - Throw data on the queue.
- * @qpair:      Pointer to the queue pair struct.
- * @buf:        Pointer to buffer containing data
- * @buf_size:   Length of buffer.
- * @buf_type:   Buffer type (Unused).
- *
- * This is the client interface for enqueueing data into the queue.
- * Returns number of bytes enqueued or < 0 on error.
- */
-ssize_t vmci_qpair_enqueue(struct vmci_qp *qpair,
-			   const void *buf,
-			   size_t buf_size,
-			   int buf_type)
-{
-	ssize_t result;
-	struct iov_iter from;
-	struct kvec v = {.iov_base = (void *)buf, .iov_len = buf_size};
-
-	if (!qpair || !buf)
-		return VMCI_ERROR_INVALID_ARGS;
-
-	iov_iter_kvec(&from, ITER_SOURCE, &v, 1, buf_size);
-
-	qp_lock(qpair);
-
-	do {
-		result = qp_enqueue_locked(qpair->produce_q,
-					   qpair->consume_q,
-					   qpair->produce_q_size,
-					   &from);
-
-		if (result == VMCI_ERROR_QUEUEPAIR_NOT_READY &&
-		    !qp_wait_for_ready_queue(qpair))
-			result = VMCI_ERROR_WOULD_BLOCK;
-
-	} while (result == VMCI_ERROR_QUEUEPAIR_NOT_READY);
-
-	qp_unlock(qpair);
-
-	return result;
-}
-EXPORT_SYMBOL_GPL(vmci_qpair_enqueue);
-
-/*
- * vmci_qpair_dequeue() - Get data from the queue.
- * @qpair:      Pointer to the queue pair struct.
- * @buf:        Pointer to buffer for the data
- * @buf_size:   Length of buffer.
- * @buf_type:   Buffer type (Unused).
- *
- * This is the client interface for dequeueing data from the queue.
- * Returns number of bytes dequeued or < 0 on error.
- */
-ssize_t vmci_qpair_dequeue(struct vmci_qp *qpair,
-			   void *buf,
-			   size_t buf_size,
-			   int buf_type)
-{
-	ssize_t result;
-	struct iov_iter to;
-	struct kvec v = {.iov_base = buf, .iov_len = buf_size};
-
-	if (!qpair || !buf)
-		return VMCI_ERROR_INVALID_ARGS;
-
-	iov_iter_kvec(&to, ITER_DEST, &v, 1, buf_size);
-
-	qp_lock(qpair);
-
-	do {
-		result = qp_dequeue_locked(qpair->produce_q,
-					   qpair->consume_q,
-					   qpair->consume_q_size,
-					   &to, true);
-
-		if (result == VMCI_ERROR_QUEUEPAIR_NOT_READY &&
-		    !qp_wait_for_ready_queue(qpair))
-			result = VMCI_ERROR_WOULD_BLOCK;
-
-	} while (result == VMCI_ERROR_QUEUEPAIR_NOT_READY);
-
-	qp_unlock(qpair);
-
-	return result;
-}
-EXPORT_SYMBOL_GPL(vmci_qpair_dequeue);
-
-/*
- * vmci_qpair_peek() - Peek at the data in the queue.
- * @qpair:      Pointer to the queue pair struct.
- * @buf:        Pointer to buffer for the data
- * @buf_size:   Length of buffer.
- * @buf_type:   Buffer type (Unused on Linux).
- *
- * This is the client interface for peeking into a queue.  (I.e.,
- * copy data from the queue without updating the head pointer.)
- * Returns number of bytes dequeued or < 0 on error.
- */
-ssize_t vmci_qpair_peek(struct vmci_qp *qpair,
-			void *buf,
-			size_t buf_size,
-			int buf_type)
-{
-	struct iov_iter to;
-	struct kvec v = {.iov_base = buf, .iov_len = buf_size};
-	ssize_t result;
-
-	if (!qpair || !buf)
-		return VMCI_ERROR_INVALID_ARGS;
-
-	iov_iter_kvec(&to, ITER_DEST, &v, 1, buf_size);
-
-	qp_lock(qpair);
-
-	do {
-		result = qp_dequeue_locked(qpair->produce_q,
-					   qpair->consume_q,
-					   qpair->consume_q_size,
-					   &to, false);
-
-		if (result == VMCI_ERROR_QUEUEPAIR_NOT_READY &&
-		    !qp_wait_for_ready_queue(qpair))
-			result = VMCI_ERROR_WOULD_BLOCK;
-
-	} while (result == VMCI_ERROR_QUEUEPAIR_NOT_READY);
-
-	qp_unlock(qpair);
-
-	return result;
-}
-EXPORT_SYMBOL_GPL(vmci_qpair_peek);
-
 /*
  * vmci_qpair_enquev() - Throw data on the queue using iov.
  * @qpair:      Pointer to the queue pair struct.
diff --git a/include/linux/vmw_vmci_api.h b/include/linux/vmw_vmci_api.h
index 28a3b6a9e1ca..41764a684423 100644
--- a/include/linux/vmw_vmci_api.h
+++ b/include/linux/vmw_vmci_api.h
@@ -60,12 +60,6 @@ s64 vmci_qpair_produce_free_space(const struct vmci_qp *qpair);
 s64 vmci_qpair_produce_buf_ready(const struct vmci_qp *qpair);
 s64 vmci_qpair_consume_free_space(const struct vmci_qp *qpair);
 s64 vmci_qpair_consume_buf_ready(const struct vmci_qp *qpair);
-ssize_t vmci_qpair_enqueue(struct vmci_qp *qpair,
-			   const void *buf, size_t buf_size, int mode);
-ssize_t vmci_qpair_dequeue(struct vmci_qp *qpair,
-			   void *buf, size_t buf_size, int mode);
-ssize_t vmci_qpair_peek(struct vmci_qp *qpair, void *buf, size_t buf_size,
-			int mode);
 ssize_t vmci_qpair_enquev(struct vmci_qp *qpair,
 			  struct msghdr *msg, size_t iov_size, int mode);
 ssize_t vmci_qpair_dequev(struct vmci_qp *qpair,
-- 
2.49.0

