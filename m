Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D9627584E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744701032; cv=none; b=fih9iahWjXfOKwsfSUnV456GNUPsb8hFhGUjC255H312sDLrVUiQsCZZ8MUsSGaomK0v15zeZo9n5TL8AKD5NzZs9Nok5ojD6fqkrVCOfn2RV6LohJhSZDVcLGWXeZrNtITjhzdziKRYlnMP+e28LOMAvTt/DtLuwzpJPYHKp5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744701032; c=relaxed/simple;
	bh=RTyV6CuY1ILJEHa4mBQoCKQeLLKta6AOsqk80g5KMLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fvXF0j59+odk5aBR3sAK6UleQiM0HNWJ8tE4tKpd+FewzlK8Z2i0dTPkz5ZADzuttGZbUu5808Nlp3EWdOyjYkxMGwTkoUI/vwmkw+6WHCXefeXBhBW2WSgoBpN1DcFxGTbU/8BpDqYfF+nbvWybakEX4oFpXi2ZLUoSs4IBoeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=I9aZj3y3; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="I9aZj3y3"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-736c277331eso5662934b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 00:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744701030; x=1745305830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYejmGyG0ZZvUYJF2X4xi2wGhXKVNeVaxdRV2uzAA3M=;
        b=I9aZj3y3cHEMUBty5lq8ODSUowbmadboLJpqx0MYGvLD40Ou9C03HcsLz1KMiAQfXw
         d2PofoGIX07HrE55tF1ciTkF/lgX+/ns0f2OHIE4jaa4qsuY4/jhMgBHYvZ71+640iCI
         xluaTlHOtrSjcIPVJ51u1X50jPFilW0hIQV0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744701030; x=1745305830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYejmGyG0ZZvUYJF2X4xi2wGhXKVNeVaxdRV2uzAA3M=;
        b=RfCcpYPO/fzXt6FdDgFKN/phzuNYLEKaO1MgyZDKwCfU2C8EJNTdl/2qdGbfPWtQS9
         F/WJWJJojuR8oTEL5v79pZLyRXzd8W/zwsk04KMudFqrnZ4iUgeNg4dVkwSB7S/pj/0N
         nn9Czh3jkR4Il4+KycJVsYOFd0LfaKzMGRJ+Lbud/GQKbtNEuE/P6L17SuxphSKaPnXc
         WCDY9WVmD+oj1Iwl3Xj4eThe77QiaP68tUyAPVNZKbTDL2plodX/64bOrR4pF1ZUWsIL
         7V0OOF7/SaogvAZ8JlmBooZ3V62tLQmlmYq1H7JR9ZkYqqdt/HYXinO3N6Lk9trxc+gc
         reHg==
X-Forwarded-Encrypted: i=1; AJvYcCVc9gDYRYhB94Oq/aFrnM+gKstR3/mhoid30TYFLTUA1bwtkExF7Pawp4mhbNbI/N8n3VMqYlAdWNEddJ4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE/4Rsnb5miCyKfoMdlrAChC5hhFFLW3+PTLgMZBeoVzkv03X1
	m3FVvTGdNE/aG5l0Dbok72/1eDMVqzqnnvI0tbVU6KbkrSn8VDSPDEYz8TiZeA==
X-Gm-Gg: ASbGncvIv1J9vunxprNkBNZWKbxGJBloknvaKy7WSJJZrhMXVSC2rVy2n+JiuI+NJyv
	JeTLF7SAHcmstetnluXtx6Z3O2BN4L+tauGkm8Y0ol5/3sEa2FrhUn9rAaIcOLuDnUHZVdtSPXT
	P+MYBS56Rlcr4zdDfptGeN9sXU4iQGeHsLxxKmgOoZBGybscrRgyFz7BLkUCS2XxzaBPueWX4iC
	eX5RsqPIZyPWAAV1TGwkT+ZFr/H2L0100ZtQxR0wxJXue49xBht3fjR2BxOS8nq6PHpxxlA7TtA
	1KRA9K5d6CvvFq3Ml9L03IssLz8Lxgwcr2+hP1vqB6opZCUen7qgswOIBXXrsXbQNhAkJZSFacA
	74yPndAgvj+cQFAfGALdorCjX1UM+sSA3
X-Google-Smtp-Source: AGHT+IGWTN2yQeSDJJtvSK1ZNh/SieezMonVkazgrlx4GpaEw0oeWFpAkP6J3Bf+UHyZnh1uBjuWfw==
X-Received: by 2002:a05:6a21:7a41:b0:1f3:2fde:8a6c with SMTP id adf61e73a8af0-20398df77b1mr3778675637.4.1744701029869;
        Tue, 15 Apr 2025 00:10:29 -0700 (PDT)
Received: from li-cloudtop.c.googlers.com.com (132.197.125.34.bc.googleusercontent.com. [34.125.197.132])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a2d3a250sm8659543a12.62.2025.04.15.00.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 00:10:29 -0700 (PDT)
From: Li Li <dualli@chromium.org>
To: dualli@google.com,
	corbet@lwn.net,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	donald.hunter@gmail.com,
	gregkh@linuxfoundation.org,
	arve@android.com,
	tkjos@android.com,
	maco@android.com,
	joel@joelfernandes.org,
	brauner@kernel.org,
	cmllamas@google.com,
	surenb@google.com,
	omosnace@redhat.com,
	shuah@kernel.org,
	arnd@arndb.de,
	masahiroy@kernel.org,
	bagasdotme@gmail.com,
	horms@kernel.org,
	tweek@google.com,
	paul@paul-moore.com,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	netdev@vger.kernel.org,
	selinux@vger.kernel.org,
	hridya@google.com
Cc: smoreland@google.com,
	ynaffit@google.com,
	kernel-team@android.com
Subject: [PATCH v17 1/3] lsm, selinux: Add setup_report permission to binder
Date: Tue, 15 Apr 2025 00:10:15 -0700
Message-ID: <20250415071017.3261009-2-dualli@chromium.org>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
In-Reply-To: <20250415071017.3261009-1-dualli@chromium.org>
References: <20250415071017.3261009-1-dualli@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Thiébaud Weksteen <tweek@google.com>

Introduce a new permission "setup_report" to the "binder" class.
This persmission controls the ability to set up the binder generic
netlink driver to report certain binder transactions.

Signed-off-by: Thiébaud Weksteen <tweek@google.com>
Signed-off-by: Li Li <dualli@google.com>
---
 include/linux/lsm_hook_defs.h       |  1 +
 include/linux/security.h            |  6 ++++++
 security/security.c                 | 13 +++++++++++++
 security/selinux/hooks.c            |  7 +++++++
 security/selinux/include/classmap.h |  3 ++-
 5 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
index bf3bbac4e02a..795a507db537 100644
--- a/include/linux/lsm_hook_defs.h
+++ b/include/linux/lsm_hook_defs.h
@@ -33,6 +33,7 @@ LSM_HOOK(int, 0, binder_transfer_binder, const struct cred *from,
 	 const struct cred *to)
 LSM_HOOK(int, 0, binder_transfer_file, const struct cred *from,
 	 const struct cred *to, const struct file *file)
+LSM_HOOK(int, 0, binder_setup_report, const struct cred *to)
 LSM_HOOK(int, 0, ptrace_access_check, struct task_struct *child,
 	 unsigned int mode)
 LSM_HOOK(int, 0, ptrace_traceme, struct task_struct *parent)
diff --git a/include/linux/security.h b/include/linux/security.h
index cc9b54d95d22..fe600fb37c98 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -338,6 +338,7 @@ int security_binder_transfer_binder(const struct cred *from,
 				    const struct cred *to);
 int security_binder_transfer_file(const struct cred *from,
 				  const struct cred *to, const struct file *file);
+int security_binder_setup_report(const struct cred *to);
 int security_ptrace_access_check(struct task_struct *child, unsigned int mode);
 int security_ptrace_traceme(struct task_struct *parent);
 int security_capget(const struct task_struct *target,
@@ -657,6 +658,11 @@ static inline int security_binder_transfer_file(const struct cred *from,
 	return 0;
 }
 
+static inline int security_binder_setup_report(const struct cred *to)
+{
+	return 0;
+}
+
 static inline int security_ptrace_access_check(struct task_struct *child,
 					     unsigned int mode)
 {
diff --git a/security/security.c b/security/security.c
index fb57e8fddd91..5acf364e610f 100644
--- a/security/security.c
+++ b/security/security.c
@@ -1043,6 +1043,19 @@ int security_binder_transfer_file(const struct cred *from,
 	return call_int_hook(binder_transfer_file, from, to, file);
 }
 
+/**
+ * security_binder_setup_report() - Check if binder report is allowed
+ * @to: receiving process
+ *
+ * Check whether @to is allowed to set up binder reports.
+ *
+ * Return: Returns 0 if permission is granted.
+ */
+int security_binder_setup_report(const struct cred *to)
+{
+	return call_int_hook(binder_setup_report, to);
+}
+
 /**
  * security_ptrace_access_check() - Check if tracing is allowed
  * @child: target process
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 595ceb314aeb..f02249345c4b 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -2103,6 +2103,12 @@ static int selinux_binder_transfer_file(const struct cred *from,
 			    &ad);
 }
 
+static int selinux_binder_setup_report(const struct cred *to)
+{
+	return avc_has_perm(current_sid(), cred_sid(to), SECCLASS_BINDER,
+			    BINDER__SETUP_REPORT, NULL);
+}
+
 static int selinux_ptrace_access_check(struct task_struct *child,
 				       unsigned int mode)
 {
@@ -7295,6 +7301,7 @@ static struct security_hook_list selinux_hooks[] __ro_after_init = {
 	LSM_HOOK_INIT(binder_transaction, selinux_binder_transaction),
 	LSM_HOOK_INIT(binder_transfer_binder, selinux_binder_transfer_binder),
 	LSM_HOOK_INIT(binder_transfer_file, selinux_binder_transfer_file),
+	LSM_HOOK_INIT(binder_setup_report, selinux_binder_setup_report),
 
 	LSM_HOOK_INIT(ptrace_access_check, selinux_ptrace_access_check),
 	LSM_HOOK_INIT(ptrace_traceme, selinux_ptrace_traceme),
diff --git a/security/selinux/include/classmap.h b/security/selinux/include/classmap.h
index 5665aa5e7853..de7e28572fda 100644
--- a/security/selinux/include/classmap.h
+++ b/security/selinux/include/classmap.h
@@ -133,7 +133,8 @@ const struct security_class_mapping secclass_map[] = {
 	{ "kernel_service", { "use_as_override", "create_files_as", NULL } },
 	{ "tun_socket", { COMMON_SOCK_PERMS, "attach_queue", NULL } },
 	{ "binder",
-	  { "impersonate", "call", "set_context_mgr", "transfer", NULL } },
+	  { "impersonate", "call", "set_context_mgr", "transfer",
+	    "setup_report", NULL } },
 	{ "cap_userns", { COMMON_CAP_PERMS, NULL } },
 	{ "cap2_userns", { COMMON_CAP2_PERMS, NULL } },
 	{ "sctp_socket",
-- 
2.49.0.604.gff1f9ca942-goog

