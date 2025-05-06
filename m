Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B635A288CA0
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 16:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746550128; cv=none; b=fHpUmdN4LHf8wp6G1LbHWacg16FmsN9Pd4LPU5WHu2Xzagb5bVziy77We9nv6km/vemQnGNC62MrUYqH+hy3Wh6UqElgGSXgxsUYMwNSVgOtkgB6G5tQLb9RPSwxE14MuJETgqCagddS8b39MGwGybkuT2CPtttlsgeUNMtU8nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746550128; c=relaxed/simple;
	bh=l3cyRuYF81wunoJ7TifMvH83r4i55FQixMLbcy3lwME=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ono2+NjSnqKyHdlLaC/EEg7RTlE/1vkCMe3dvHkNcR+PlVCWt1TKTxlFI3zGtmjBENrK9D5hX/mp6egH2rjIYCRBuBHa3gvvOYHxewPdZ/lhynF8H6898rMkaJ/gSppTDjkNuK8QY7UOrY8os7UtWihuQuCZZpsD9VhbylftX+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RE/y0T3O; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RE/y0T3O"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-39141ffa913so2911726f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 09:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746550125; x=1747154925; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ulR0t05oQC1aYq/PHkhH5FZiwJoFyTXIHcnk/CuN1Ys=;
        b=RE/y0T3OQ/eziv7mmJ0MwguaDxQ6HlPabzAzPBhc2ofZynkJWaWPnyApioLxuzTf8T
         FHorYK9j5HiZX1ibqzQKHABbWiUsAYChHQ84bl/otbUKlZN1GxaYx2/JSKCrjDtKMHe8
         //2rO8mbarHzUK9DkvjsrZFUu/7mdq8tqQDBq+oQcvdLrT1hlxGFKxb0+uXeQuYWDuTx
         P2eQXDbveBtGY2HeIxkOxWayG+0ZjwxmJjgaPz+QeIfP+vCuYZPj05hQgRmmPTP+ud62
         Kp+ai53MleOXaxnkT6Xp1XoFkV3jTcghvjEToPAbMZg1kdzVpwR4fuZKhIRwR9e3JnHX
         kNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550125; x=1747154925;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ulR0t05oQC1aYq/PHkhH5FZiwJoFyTXIHcnk/CuN1Ys=;
        b=ZkHamGYcyfBdX768mJm6yDXK420kB98TLY2ceROcl6vUGHhUmW/C55r5wvJXmJ9Cvg
         hssh3lC/nhBPLuIeQlTLsuHyJBilt5bx/QM3DbyJXsuTeIhcpRBw71iMbxPmwpdUmv2m
         G+5Ot/NyHNOkHBQWXJD/feW4DWppsM2UPKZL3LAzHNHjm5BzcWFtPnzxhb1hiqWX8e6b
         DqX0Rc3+do7tLKJf6T3I28LCPiQjXNth0uhE06l9dRrxtrj+sEpAKEO8QXB93WERzIOG
         Ej7GRj4aW4nwZoPGriiW9c6itoy6FYVvYOaRfCttLJMMM7cjbjsjsusKJy+AKLWNci6+
         aLyA==
X-Forwarded-Encrypted: i=1; AJvYcCUemyzDCbNcsdvZv2YrGuPBxRwkxhIBZp5xm+/w43iV6bm5qmalfVylkVAjDyEgt5HOswdbsdDknsVfxMY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcCzEU7wpRORjzmOyd60X51C0PCqHUlK4gexgX2QdBKK4InvjO
	f528mWXRiqkiU6uIu0RKkVMaJCRz945BDQCv6X34YtwS5x6aUR/cJOEm8Cnpgd+jK0bCsb6T5lM
	HtBoKfkfe8CMwNVeDjQ==
X-Google-Smtp-Source: AGHT+IG1v09/s12usa8mhNe5u/61861N0/kCY4NkyY380pXa7lF6ETtkjTMmugXHCVnG7wZDISxXe9P8kKhSjb56
X-Received: from wrbbs23.prod.google.com ([2002:a05:6000:717:b0:3a0:90bc:bf72])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:47c7:0:b0:3a0:8352:775a with SMTP id ffacd0b85a97d-3a0b49b5e48mr195832f8f.34.1746550125284;
 Tue, 06 May 2025 09:48:45 -0700 (PDT)
Date: Tue,  6 May 2025 17:48:00 +0100
In-Reply-To: <20250506164820.515876-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250506164820.515876-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250506164820.515876-5-vdonnefort@google.com>
Subject: [PATCH v4 04/24] tracing: Add init callback to trace remotes
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Add a .init call back so the trace remote callers can add entries to the
tracefs directory.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/include/linux/trace_remote.h b/include/linux/trace_remote.h
index 1aa99da3c96a..82d26d97a536 100644
--- a/include/linux/trace_remote.h
+++ b/include/linux/trace_remote.h
@@ -3,9 +3,11 @@
 #ifndef _LINUX_TRACE_REMOTE_H
 #define _LINUX_TRACE_REMOTE_H
 
+#include <linux/dcache.h>
 #include <linux/ring_buffer.h>
 
 struct trace_remote_callbacks {
+	int	(*init)(struct dentry *d, void *priv);
 	struct trace_buffer_desc *
 		(*load_trace_buffer)(unsigned long size, void *priv);
 	void	(*unload_trace_buffer)(struct trace_buffer_desc *desc, void *priv);
diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
index 2221705f65f4..6f4b921f6955 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -479,6 +479,7 @@ static int trace_remote_init_tracefs(const char *name, struct trace_remote *remo
 int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs, void *priv)
 {
 	struct trace_remote *remote;
+	int ret;
 
 	remote = kzalloc(sizeof(*remote), GFP_KERNEL);
 	if (!remote)
@@ -495,7 +496,11 @@ int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs,
 		return -ENOMEM;
 	}
 
-	return 0;
+	ret = cbs->init ? cbs->init(remote->dentry, priv) : 0;
+	if (ret)
+		pr_err("Init failed for trace remote '%s' (%d)\n", name, ret);
+
+	return ret;
 }
 
 void trace_remote_free_buffer(struct trace_buffer_desc *desc)
-- 
2.49.0.967.g6a0df3ecc3-goog

