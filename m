Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCF0211299
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 20:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743539341; cv=none; b=o5cbo8VRHY3jgV+cYFdel+86EMu1AwaOqykEIvx0aNZp2B/QJkgMru5tUN9XGa/LtO3CTgJpH4lFTTQw7W5ao0tIAe+GTujBypzDkbM+pKFH5H6HNGr6iTyliSYJck1RfgdD1olU5NSlPUeQp6uGQ6eysBazCPfznxgPVKAGumM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743539341; c=relaxed/simple;
	bh=TDQGYHYzTXG72qqa+FOFZk8SvqywdenK5AAn0IsR/bs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=gCyodp87FvoZYOE36sUZb0LmDNY73SSTnd2Sl8nT7ytE2HVa9Yj8G3IP8FJrk4TmIwcAbewvxGp16nxm0Fkk02x5g5ze9f9IubF0GJbqnfu/lKI235a2SpldqJCGDC7pJGrRbuVdgHt6OC9yTNunGTy3YIK3X4JtkUeHkaQnwSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ynaffit.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cLhQmB52; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ynaffit.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cLhQmB52"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-22410b910b0so86802855ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 13:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743539339; x=1744144139; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zj3tU7hEK8R3guZHUC3J4JBA+NmfHHOtD45E8t6ZNdM=;
        b=cLhQmB52MlK7fBVIJrdI631OgtvlGvwQ7alIVcfK23a6p2vEYdavs4hEoCH/7cmCBU
         yCL+wcuFkTZWoyVbWmQQh6gfnUcpWmEEpi10LFa1yLe0vRtDwr0idxgOu2E16v+MOeDW
         XiXD2yeVFazahNvdRGssIlYskwgGYEyZZ5zrPKAdw9aMw+QIXapzKcplBBCo2VZZx4Kk
         FT8rv7mZHoT2HEMmLzjLEUc1ZtP514Pdr3FTCv06E27DBjKWXlbWlprPWeHc2WnsNVW3
         e1wVpaDnFpbHYKLBq1uFyBXqx4yhcpd3sr6DXwErxKvooCBDOFew+skdSgf6U9MWnpG6
         cFRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743539339; x=1744144139;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zj3tU7hEK8R3guZHUC3J4JBA+NmfHHOtD45E8t6ZNdM=;
        b=fYFqGpGTYRWLPensgSIeQ2uMHTYmzWpNjOJ9iHtNGpZCwD4DTPKtIh+4MDB/cRz7bj
         hN+Y/EPBzfk6uMZzGQJuvMxZ88tjo/dryUl3tWk2ZrKpZCiz0whF/JYuzdCRMwkUxWxg
         KMnx9v6xOG0P1gSKdmSVPHhv7bfz7W+nSA7j8djl8o2aioWbDL6yNDZuukuCw9ZTXS4k
         8O7Ot8D1+fRYkcZR+z27Z++sgFfXzzjgVcsF18MPMyskgbgl739d10lPnpLn34o3CFkX
         TIccByii3LDwcbxoqyougtudtBPu+a2YQ88/PEkPVslvHHagE8Gk4X2fibWYMfUqg9bJ
         Ipog==
X-Gm-Message-State: AOJu0Yxo26qkG+6hZmUhKXtHZYWAxWqlJOP7N3ZCmFFRkksE4iNi86IP
	5SfXEFhKPxYaPzYHa0R06NH7fLfsnfJcYxfkzZkQZ7gq6T1uT4VPzXMJNiUXy3OL17l3KOLhfIl
	iYmTvJQ==
X-Google-Smtp-Source: AGHT+IEzplZtwSprqpxxDIWfAcjWWNicwtbmwc4UJrb1Vkh7U1dTlw9w8CTM4B67Uz8PVGHSVKLvadxdvxK4
X-Received: from plvx10.prod.google.com ([2002:a17:902:9a4a:b0:223:6c8e:eaf1])
 (user=ynaffit job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e887:b0:223:f408:c3f8
 with SMTP id d9443c01a7336-2292f960348mr239426295ad.14.1743539339374; Tue, 01
 Apr 2025 13:28:59 -0700 (PDT)
Date: Tue,  1 Apr 2025 20:28:46 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250401202846.3510162-2-ynaffit@google.com>
Subject: [PATCH v4] binder: use buffer offsets in debug logs
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

V3 -> V4: Replace alloc.buffer with alloc.vm_start
V2 -> V3: Drop transaction data addresses
V1 -> V2: Resend to mailing lists

 drivers/android/binder.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 5fc2c8ee61b1..91adf18675a1 100644
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
+						(unsigned long)data_ptr - proc->alloc.vm_start);
 				} else {
 					binder_user_error(
-						"%d:%d BC_FREE_BUFFER u%016llx no match\n",
+						"%d:%d BC_FREE_BUFFER no match for buffer at offset %lx\n",
 						proc->pid, thread->pid,
-						(u64)data_ptr);
+						(unsigned long)data_ptr - proc->alloc.vm_start);
 				}
 				break;
 			}
 			binder_debug(BINDER_DEBUG_FREE_BUFFER,
-				     "%d:%d BC_FREE_BUFFER u%016llx found buffer %d for %s transaction\n",
-				     proc->pid, thread->pid, (u64)data_ptr,
+				     "%d:%d BC_FREE_BUFFER at offset %lx found buffer %d for %s transaction\n",
+				     proc->pid, thread->pid,
+				     (unsigned long)data_ptr - proc->alloc.vm_start,
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
2.49.0.504.g3bcea36a83-goog

