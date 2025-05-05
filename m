Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E791C1F05
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 06:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746427204; cv=none; b=ZpP4X7ZHSZhevR/6IO6KXU1XZAw2Zvn0+yB4ntePUXpUgCAmBSOV3qDHjrWcbEcLxgX4CDKqBGqWs5Otqdx8mF0mmOeZHxObxXU1U3TXgpQi59fnHyo52w99VWL5kalk1Rx5GxYVw3wyK+/WLfHhzkMSvhcmRYok1qVC0SfDLW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746427204; c=relaxed/simple;
	bh=BzXwhpUfNn6f4eLnDujcuZfj0ErF1elnNF0U29kQwfo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uqdtb2cpaD1P9BOJq5ZY5MHot5p4QDZncinSCSuprYKBWQxsczeB3Gj8KyP8aL1OKf6+GCOTe3Er+kfT4mPS5bXcj6ywJx64hP0PY4ZalZtj6mvydzVcx7VjwzGKray6e2gTFEvhTszmaWyL2otedYLXyHOcUD4SU8PKK4yBBno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Gkluw95P; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Gkluw95P"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-af52a624283so3378430a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 23:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746427202; x=1747032002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vZIihCIcuu5AMbDW8ah1E1Hif57SVfjWhRQz55gYlZM=;
        b=Gkluw95Pce3l7ZBHaBDkgDYnrTsg2f1I8SPDgqBo2GyM8ivomY3rNn7ZIgFxDiEw5Y
         KayuwYPEyEdf9Wc/RylbPlbPapN4cCcEWxLRpciyVuDeFcY9x4wInNiA5bZmG2I+kZmF
         okQlprtevfReNKtQoHSE8c+pjmnt9SP4zw6j8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746427202; x=1747032002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vZIihCIcuu5AMbDW8ah1E1Hif57SVfjWhRQz55gYlZM=;
        b=tIEE89R1pDY1vCBuDvZA+1z0UUxabZbBlIcx0O2Vl1HILVmd3SWkHWAOLd7sSSKQOo
         3cdYWhnmcGZtJ20yzfhzUGqMgKTyAJfX0c9QtecFYCL49iD2gFP8OmCnAGy5+eiQK6+A
         KLYDzWoo9wO+BuqLfezKoJduoUb4GaT2GRmAFSpKqBx83AfIttnG0Jmxyla3ZcFLi8Pj
         jlpb/4crAZ2QSaqqLr5HlkGYHIfrW34b3CMpRmeAhvv9o3Mnm8t0FqYOc8StDxwMaIDC
         VsQxeIs/cYauC+y/nUnmYoEc5N0IWaq0OGXytOJBPztN++EToOba6dwOatrP3NpTT2Bo
         QZkw==
X-Forwarded-Encrypted: i=1; AJvYcCXX+1hH8vlEW0UobNiYJGZH2bywlHX0TAUkKWeoEzh2jm7QxhPWv7eOlaxyuXctBTJaOkb5sLFOCwDJjDs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnF0yPCNH3Dc5O0loEVr3QxqksQICT+7GSww9n1xffZCbZLw8M
	Mqtovu0nK+JuCemNUENLxK5gXcau1RvaLKuOwbtG3SuoojLiDSIgcOvKdfGNLzwhpL9Y3hm9Tkv
	f9A==
X-Gm-Gg: ASbGncuqGYcMQ6gHSS+SUSbOypnGDJ9GnHN/H05qi1UT3nm+K33IowNzFtaL8DwXwFJ
	T9qR4IrN/NgIaJP23M+NjfNbXGWxO2VThSG4wtQkO5COEf5GngD8FjXRjPpqkfL6cVAr4r6U/bV
	bOgkuLTzF3CqSETzFYKwIJpEIE1UuAwgzPoRFF4piX7hIIgzFCWQC8wsnZ7dVU3OnnL09fsC9Va
	gJPqqZvkZ4pqI95c3a9TCy8j1b6idlwc4FqQzrueYSdgVDnxWaS5TujYAaNPEkEB2k7UZZG7Oq4
	6g+yCT8YlWNo+YBJzdH1Uv64/3pNeQvFH4kwP5x/XnmGwmN9MvOQPcMCbI0ai/r726c=
X-Google-Smtp-Source: AGHT+IEnEli/LI1stPovIbi7sLoVDFcDnxEOS2ugJJweFE5zvm4Vwi5t3dop2M1JHJiXs6/Cz9v1TQ==
X-Received: by 2002:a17:902:db06:b0:215:a56f:1e50 with SMTP id d9443c01a7336-22e100505d0mr173484605ad.8.1746427201577;
        Sun, 04 May 2025 23:40:01 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:4dd5:88f9:86cd:18ef])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e150eb212sm47522725ad.38.2025.05.04.23.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 23:40:01 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>
Cc: Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH] bpf: add bpf_msleep_interruptible()
Date: Mon,  5 May 2025 15:38:59 +0900
Message-ID: <20250505063918.3320164-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bpf_msleep_interruptible() puts a calling context into an
interruptible sleep.  This function is expected to be used
for testing only (perhaps in conjunction with fault-injection)
to simulate various execution delays or timeouts.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 include/linux/bpf.h            |  1 +
 include/uapi/linux/bpf.h       |  9 +++++++++
 kernel/bpf/helpers.c           | 13 +++++++++++++
 kernel/trace/bpf_trace.c       |  2 ++
 tools/include/uapi/linux/bpf.h |  9 +++++++++
 5 files changed, 34 insertions(+)

diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 3f0cc89c0622..85bd1daaa7df 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -3392,6 +3392,7 @@ extern const struct bpf_func_proto bpf_get_retval_proto;
 extern const struct bpf_func_proto bpf_user_ringbuf_drain_proto;
 extern const struct bpf_func_proto bpf_cgrp_storage_get_proto;
 extern const struct bpf_func_proto bpf_cgrp_storage_delete_proto;
+extern const struct bpf_func_proto bpf_msleep_interruptible_proto;
 
 const struct bpf_func_proto *tracing_prog_func_proto(
   enum bpf_func_id func_id, const struct bpf_prog *prog);
diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
index 71d5ac83cf5d..cbbb6d70a7a3 100644
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@ -5814,6 +5814,14 @@ union bpf_attr {
  *		0 on success.
  *
  *		**-ENOENT** if the bpf_local_storage cannot be found.
+ *
+ * long bpf_msleep_interruptible(long timeout)
+ *	Description
+ *		Make the current task sleep until *timeout* milliseconds have
+ *		elapsed or until a signal is received.
+ *
+ *	Return
+ *		The remaining time of the sleep duration in milliseconds.
  */
 #define ___BPF_FUNC_MAPPER(FN, ctx...)			\
 	FN(unspec, 0, ##ctx)				\
@@ -6028,6 +6036,7 @@ union bpf_attr {
 	FN(user_ringbuf_drain, 209, ##ctx)		\
 	FN(cgrp_storage_get, 210, ##ctx)		\
 	FN(cgrp_storage_delete, 211, ##ctx)		\
+	FN(msleep_interruptible, 212, ##ctx)		\
 	/* This helper list is effectively frozen. If you are trying to	\
 	 * add a new helper, you should add a kfunc instead which has	\
 	 * less stability guarantees. See Documentation/bpf/kfuncs.rst	\
diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
index e3a2662f4e33..0a3449c282f2 100644
--- a/kernel/bpf/helpers.c
+++ b/kernel/bpf/helpers.c
@@ -1905,6 +1905,19 @@ static const struct bpf_func_proto bpf_dynptr_data_proto = {
 	.arg3_type	= ARG_CONST_ALLOC_SIZE_OR_ZERO,
 };
 
+BPF_CALL_1(bpf_msleep_interruptible, long, timeout)
+{
+	return msleep_interruptible(timeout);
+}
+
+const struct bpf_func_proto bpf_msleep_interruptible_proto = {
+	.func		= bpf_msleep_interruptible,
+	.gpl_only	= false,
+	.might_sleep	= true,
+	.ret_type	= RET_INTEGER,
+	.arg1_type	= ARG_ANYTHING,
+};
+
 const struct bpf_func_proto bpf_get_current_task_proto __weak;
 const struct bpf_func_proto bpf_get_current_task_btf_proto __weak;
 const struct bpf_func_proto bpf_probe_read_user_proto __weak;
diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
index 52c432a44aeb..8a0b96aed0c0 100644
--- a/kernel/trace/bpf_trace.c
+++ b/kernel/trace/bpf_trace.c
@@ -1475,6 +1475,8 @@ bpf_tracing_func_proto(enum bpf_func_id func_id, const struct bpf_prog *prog)
 		return &bpf_get_branch_snapshot_proto;
 	case BPF_FUNC_find_vma:
 		return &bpf_find_vma_proto;
+	case BPF_FUNC_msleep_interruptible:
+		return &bpf_msleep_interruptible_proto;
 	default:
 		break;
 	}
diff --git a/tools/include/uapi/linux/bpf.h b/tools/include/uapi/linux/bpf.h
index 71d5ac83cf5d..cbbb6d70a7a3 100644
--- a/tools/include/uapi/linux/bpf.h
+++ b/tools/include/uapi/linux/bpf.h
@@ -5814,6 +5814,14 @@ union bpf_attr {
  *		0 on success.
  *
  *		**-ENOENT** if the bpf_local_storage cannot be found.
+ *
+ * long bpf_msleep_interruptible(long timeout)
+ *	Description
+ *		Make the current task sleep until *timeout* milliseconds have
+ *		elapsed or until a signal is received.
+ *
+ *	Return
+ *		The remaining time of the sleep duration in milliseconds.
  */
 #define ___BPF_FUNC_MAPPER(FN, ctx...)			\
 	FN(unspec, 0, ##ctx)				\
@@ -6028,6 +6036,7 @@ union bpf_attr {
 	FN(user_ringbuf_drain, 209, ##ctx)		\
 	FN(cgrp_storage_get, 210, ##ctx)		\
 	FN(cgrp_storage_delete, 211, ##ctx)		\
+	FN(msleep_interruptible, 212, ##ctx)		\
 	/* This helper list is effectively frozen. If you are trying to	\
 	 * add a new helper, you should add a kfunc instead which has	\
 	 * less stability guarantees. See Documentation/bpf/kfuncs.rst	\
-- 
2.49.0.906.g1f30a19c02-goog

