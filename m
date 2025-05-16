Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F0416E863
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 13:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747402848; cv=none; b=Swt1F4Haj52EkjwxGjCVuFVNRh33vHY0eL0MtvhKaJcLxgYsvg+I2DSdU2qO+QbT2wqQ0RfwPYXgz56u62srWCj7je9tn2OV4ILx/b7cvGm609qpLitKwM4GzO3QA9w1Da+NQh80ju1UF/qFlSXgodfaZ04NP6980iw2dBSjcRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747402848; c=relaxed/simple;
	bh=iUMASGgC/AejzotR/KEheUz4s55s7PNH7xGym6+pco0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tRRqvig6ebO8ua1WhyphMo5x/BWcE8w40B7SwfRKszmTzHjWbs5Se54iu4e3el2sL0W272N12tYWNRp3oA9NXk81nxQZVqSqDj1PKx9kCXptdcdFNdqRM2RPx6VOM9I4zxyljJoLn5OKIBmQth/tvg9kxnuTbCifYmHBPefVwKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eZTuYkiF; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eZTuYkiF"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d0a037f97so11888805e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 06:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747402844; x=1748007644; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3t+9Hbrx3b4pdy+1CD6jYpc+HxoCZtIYl3kVPAq1eqM=;
        b=eZTuYkiFBfLcVdPsMsBismgiYd+czuYpuz8cERc3845YNiuXrVvgdR/8dw9k+r84on
         HbnCuyBLUteEFakV7thc3YUeT7D0lZblohjupupSa+hulKI4S6Z94YeuRI2yu68wcsOd
         07QKgnQ4e2sUasntu/i5ttEQMN3hfqtS1dfvweawtmsSh3uMHDyF/Ogdg/qweyXA+UXX
         FCf6ClhIr56GHeJfVAiGvJdLhriI1XRjRMguLUHMKd0P0AY/UB8BuZH2oQQ9I2MjKO4/
         qANpdsAuNFeybWDuoRu7Vjzz2G8PyXqfGNJM6zaF4fdRQF5eTZLpLXJfgs9stHG2uiLg
         VjBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747402844; x=1748007644;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3t+9Hbrx3b4pdy+1CD6jYpc+HxoCZtIYl3kVPAq1eqM=;
        b=B5/lTdHzl0IJ834/7LzG6ih/aeWd7nE6z2jk7ofaPzNta6Zu9Ojnbr+G05Fdwz4rfx
         EUYCBMpynjkASTjtfp7+nK99Q0XUAljCCQxPxuvdUPRGGTU5FfeK2LjkClAQJ3UBCs6t
         hazZzDEK4iD7PKSW3alRi8wCG1ftIK9B3Pqibu79C7X8GeO6ENN2y0v9al36Dp9Z40YQ
         420kHl8X3FjRS5HKZuG39aS9jqY2Nvdqyj7NnV30qLnK8hfIsE0okWRc6hlUkOhkt2nu
         4TwcQswbfq+goCNVuTndVh92jB0/Iacy1BTi9bsmf/JuiaUkN9vRLhdefD96JaI1OVru
         yikQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9uxhzxrv75Sj30T+VLDOBhRdGaYqi2JagPhtKgNmET+y63Q+LhFTX6jIk3G0uy5iTLJqvKPpFwVMR/K4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6t4M4m/SIbGU9smNilZXDoXtRG8Bq06wCx6Au5tVVEYMNuzyp
	vzJNKiGKRWv7Ku+rF6Uch9Y2ehs77TCzSCJocYbcxefoWDQqM53bRLbY5OgJYFtc/NiP+EyqFab
	viTyyyttSHlav8+4oev932Q==
X-Google-Smtp-Source: AGHT+IHBk0uTFQehW6fZF3OCY0h82+X4e1sass1zittKFrmN//RLeJcEgCwGWBGBCezpJMkuQurUbPrGR+5L4tEP
X-Received: from wmbei9.prod.google.com ([2002:a05:600c:3f09:b0:441:b607:4ec0])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:64c5:b0:43c:ea1a:720a with SMTP id 5b1f17b1804b1-442fefdad81mr26193435e9.1.1747402843791;
 Fri, 16 May 2025 06:40:43 -0700 (PDT)
Date: Fri, 16 May 2025 14:40:11 +0100
In-Reply-To: <20250516134031.661124-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250516134031.661124-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250516134031.661124-6-vdonnefort@google.com>
Subject: [PATCH v5 05/25] tracing: Add init callback to trace remotes
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
index 18b2930186cc..8f8eb1f1e889 100644
--- a/kernel/trace/trace_remote.c
+++ b/kernel/trace/trace_remote.c
@@ -482,6 +482,7 @@ static int trace_remote_init_tracefs(const char *name, struct trace_remote *remo
 int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs, void *priv)
 {
 	struct trace_remote *remote;
+	int ret;
 
 	remote = kzalloc(sizeof(*remote), GFP_KERNEL);
 	if (!remote)
@@ -498,7 +499,11 @@ int trace_remote_register(const char *name, struct trace_remote_callbacks *cbs,
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
2.49.0.1101.gccaa498523-goog

