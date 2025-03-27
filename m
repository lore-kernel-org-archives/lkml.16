Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D3054782
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 23:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743117459; cv=none; b=PEYglLl8JNxOqrXWZAodCLVyjZXYHiQuyB5SpF7Lh52nbLc4PSUiMEofbkNz50a46tf7hLBAXQCWJ9Qn9bmxRkYTjxrsr3mcMvoLoEfPqQYFBYrUCmmO3Z0pHJP99H9D+hrjfmUHGB3Jd+ovvVn6KKTT6uXjn+0hzvYTzWVMkN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743117459; c=relaxed/simple;
	bh=6fpIqC+wJTmPu0qVKaCvz89Za+htRQAlZ9Mb5bskWzw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=mXkpoKjHEdxGNt0BLt4kudPGWEniD7DjxJtzwO3OGy1LrsHiO6RVI/8Qa6pTJBSSaJkVPUvGUSUUBqqP80m8YHKhplJO9qWUrraQAYXLJS33ItagklNZyQpPw9EEJ5vmFmj5sVW3jvtoi9lkHXH+D6idOJFOSaEwmUonNIhj2Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ynaffit.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L51zn0nJ; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ynaffit.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L51zn0nJ"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-223f3357064so25355745ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 16:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743117457; x=1743722257; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HFAuVNpglgdR3WlNclVPb9DHztwQePbBVl9n65mX/Bs=;
        b=L51zn0nJkW30NVINEBDyVNVfOMgmn0DZ9Ix/t8cShFKD2qh37NDxNUIBDoyAHFkQ/C
         1uuMeWeaI5n1f0pFOwFVz5Ewo07+Iq3Dk2MUEYhseeZfdydoOz5sLRqhku3ZqsLrlvWg
         nZc64+fQkjYGRKRsh41a8sOwpV5213tu+GhCEboaszTWzHtRDXoWe09WZW6ZRLYZ91+l
         GNfSj3sA/cKiTfc2cXImlADuRNQdVWNAvkyBf6qYHbEMwOFBpuP1UPdBp7Mjsqk1i3So
         aaLXTkwGJw/fwp6jUQ6Ld3Wr2jjekV0MRj+/B41qURMjigklK94d5pfJBvReskLzTUKr
         U2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743117457; x=1743722257;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HFAuVNpglgdR3WlNclVPb9DHztwQePbBVl9n65mX/Bs=;
        b=M41X4AsT2wc43YISfp8GvHbzdT78Qoag35JNHiemNCkHNjtfjEA9DzIJwChHpF0bpt
         +wwrl3Y/YDKiJ010gHiSKBAo/WQmASYnk+sHXCAELykn+wYoVx3w0aHlHrhA5f5M8Yj4
         wBdd3vM/IMDfkaIrLIcSx4f3vJUmRmEniMP1Gfl5JMQ8W49SdNc64aPXkC1Z40sJDL8M
         UjuMCSKOLVsnUjsGNZjFSw6as0UTJTdzUL7bQc0lx8Fgh5TWPtWXmZNsR1eGmpU5ih3t
         4PPUUf+iv9vs4R0n4fq53cU9Pee7T2w459pvzh5+9G7gwsyUg+f4Wunj4eTWgF0hJ1mn
         j/Jg==
X-Gm-Message-State: AOJu0YyrjpatQA5+YpDUMW+rf1iN5zMeZeCv5/mUaucofnf8GI9KGVM/
	bgkN7m7c/JuRiiQixHHGdZiI8uUkxhLqAwgyrVvSXJtXay/6ue2ndMqkpenEXhLEMA2mE5JAfwN
	jklnZXg==
X-Google-Smtp-Source: AGHT+IHvF8GmxmVaonYf041Tn0ZoKzMpMHG/SNrE5HBF+kt3m1DsLA1c/xcce2xvYeJ51D9hr9GE6BHeBvOJ
X-Received: from plqt10.prod.google.com ([2002:a17:902:a5ca:b0:223:6458:d313])
 (user=ynaffit job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ce06:b0:223:54aa:6d15
 with SMTP id d9443c01a7336-22804850b72mr103348805ad.12.1743117457382; Thu, 27
 Mar 2025 16:17:37 -0700 (PDT)
Date: Thu, 27 Mar 2025 23:17:09 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250327231722.3204898-2-ynaffit@google.com>
Subject: [PATCH v3] binder: use buffer offsets in debug logs
From: "Tiffany Y. Yang" <ynaffit@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com, 
	"Tiffany Y. Yang" <ynaffit@google.com>
Content-Type: text/plain; charset="UTF-8"

Identify buffer addresses using vma offsets instead of full user
addresses in debug logs or drop them if they are not useful.

Signed-off-by: Tiffany Y. Yang <ynaffit@google.com>
---
V2 -> V3: Drop transaction data addresses
V1 -> V2: Resend to mailing lists

 drivers/android/binder.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 744cd7aa79c3..603667ac5050 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -3261,20 +3261,16 @@ static void binder_transaction(struct binder_proc *proc,
 
 	if (reply)
 		binder_debug(BINDER_DEBUG_TRANSACTION,
-			     "%d:%d BC_REPLY %d -> %d:%d, data %016llx-%016llx size %lld-%lld-%lld\n",
+			     "%d:%d BC_REPLY %d -> %d:%d, data size %lld-%lld-%lld\n",
 			     proc->pid, thread->pid, t->debug_id,
 			     target_proc->pid, target_thread->pid,
-			     (u64)tr->data.ptr.buffer,
-			     (u64)tr->data.ptr.offsets,
 			     (u64)tr->data_size, (u64)tr->offsets_size,
 			     (u64)extra_buffers_size);
 	else
 		binder_debug(BINDER_DEBUG_TRANSACTION,
-			     "%d:%d BC_TRANSACTION %d -> %d - node %d, data %016llx-%016llx size %lld-%lld-%lld\n",
+			     "%d:%d BC_TRANSACTION %d -> %d - node %d, data size %lld-%lld-%lld\n",
 			     proc->pid, thread->pid, t->debug_id,
 			     target_proc->pid, target_node->debug_id,
-			     (u64)tr->data.ptr.buffer,
-			     (u64)tr->data.ptr.offsets,
 			     (u64)tr->data_size, (u64)tr->offsets_size,
 			     (u64)extra_buffers_size);
 
@@ -4223,20 +4219,21 @@ static int binder_thread_write(struct binder_proc *proc,
 			if (IS_ERR_OR_NULL(buffer)) {
 				if (PTR_ERR(buffer) == -EPERM) {
 					binder_user_error(
-						"%d:%d BC_FREE_BUFFER u%016llx matched unreturned or currently freeing buffer\n",
+						"%d:%d BC_FREE_BUFFER matched unreturned or currently freeing buffer at offset %lx\n",
 						proc->pid, thread->pid,
-						(u64)data_ptr);
+						(unsigned long)data_ptr - proc->alloc.buffer);
 				} else {
 					binder_user_error(
-						"%d:%d BC_FREE_BUFFER u%016llx no match\n",
+						"%d:%d BC_FREE_BUFFER no match for buffer at offset %lx\n",
 						proc->pid, thread->pid,
-						(u64)data_ptr);
+						(unsigned long)data_ptr - proc->alloc.buffer);
 				}
 				break;
 			}
 			binder_debug(BINDER_DEBUG_FREE_BUFFER,
-				     "%d:%d BC_FREE_BUFFER u%016llx found buffer %d for %s transaction\n",
-				     proc->pid, thread->pid, (u64)data_ptr,
+				     "%d:%d BC_FREE_BUFFER at offset %lx found buffer %d for %s transaction\n",
+				     proc->pid, thread->pid,
+				     (unsigned long)data_ptr - proc->alloc.buffer,
 				     buffer->debug_id,
 				     buffer->transaction ? "active" : "finished");
 			binder_free_buf(proc, thread, buffer, false);
@@ -5053,16 +5050,14 @@ static int binder_thread_read(struct binder_proc *proc,
 		trace_binder_transaction_received(t);
 		binder_stat_br(proc, thread, cmd);
 		binder_debug(BINDER_DEBUG_TRANSACTION,
-			     "%d:%d %s %d %d:%d, cmd %u size %zd-%zd ptr %016llx-%016llx\n",
+			     "%d:%d %s %d %d:%d, cmd %u size %zd-%zd\n",
 			     proc->pid, thread->pid,
 			     (cmd == BR_TRANSACTION) ? "BR_TRANSACTION" :
 				(cmd == BR_TRANSACTION_SEC_CTX) ?
 				     "BR_TRANSACTION_SEC_CTX" : "BR_REPLY",
 			     t->debug_id, t_from ? t_from->proc->pid : 0,
 			     t_from ? t_from->pid : 0, cmd,
-			     t->buffer->data_size, t->buffer->offsets_size,
-			     (u64)trd->data.ptr.buffer,
-			     (u64)trd->data.ptr.offsets);
+			     t->buffer->data_size, t->buffer->offsets_size);
 
 		if (t_from)
 			binder_thread_dec_tmpref(t_from);
-- 
2.49.0.472.ge94155a9ec-goog

