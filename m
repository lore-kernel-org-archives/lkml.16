Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFFB19343B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 15:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745855351; cv=none; b=Zc1vH/R+311buvEj0mnEYL2apRWfRe54rRKEG4Z+CXG+KO0/nwYNvhpml/cSX0mD1sqMK1Wybl7DArRcoZ1i73eXVvh+7b+K3fQZKni85BMAw7KeIsOpwFaxq5FdJYeixGwJE/b/JIvV37kcyWSQ7CtZwE7xsEvbymh2sb3zbHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745855351; c=relaxed/simple;
	bh=gFx38JwXwqiMy2Se5UXxM6fsFRHClk/f0StmadBMl0w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PC4m2lUiSSvK4GUWkDboJjmwQ720KxpLLwU0rA8XzHsqKOV4yb4D+XZaPJ1I5Yxc01N/q4ulKLQn96RHsp1EVtoM8LjPlQSwFt4cWkIHAlZpT4PzSsbgXanjqls0OXfFsFgNHyOoC0sPaEUtYb1GKV8S1GLFTfKt/vo0+19tGis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=G1Z42kTy; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="G1Z42kTy"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so44769735e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 08:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1745855346; x=1746460146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rLEi7P+6egUB8ui1Q5+fpf99XflaYLV/582Eat25fLI=;
        b=G1Z42kTyHd7F4ON2Ld8GKW0e3Wr1+w/Gr6tUTB7TMmO77n+/uABfE5tFCZQIKEWmLW
         pd8RQPKE5M6f3X5Om0uWbWqU1pxe35iaUll7XS829nWWjCK8duohlDhnbNb0xTAPIFu6
         2gZQlEFh4SW9J0sw6LqvDGBoSH1z5aQ/slIiwnhjiOuGW0+9tictdmK1G0LDyDuoUyDZ
         F5cBQLkhBoooPxeJrNlX5jLi2I4Vk/5bxA+rDHQOWDzvEjp5qcvGwbPvUh5SKUATSDrB
         KBh9AI4AY3KpJoE1z3Mc60xvAsIR1iXQjK5zst6yxsqHfa91Fy/i6nAUx/GTqVfMnp/d
         0Ewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745855346; x=1746460146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rLEi7P+6egUB8ui1Q5+fpf99XflaYLV/582Eat25fLI=;
        b=F8QCcpAfareZhbcKQkzklvK3crFweAoyfAdsGQ1ThwONNgL4qLBeRXrYsidnc/oMbO
         rWgYR0PxI7RzhuvY2opNWylhL809BgXL0xyw6pvZroU18+ag0y7/6qZ53g4GoFjMR6qB
         44thhEp1LUM+jIDKM+nKck2gOp65MW3qb7cAt8hSzqm47NQ0cBnGe9WWc5aUVUcmgKrr
         oNNZkBafyqbXXX4iAXeprBzQmRryEJf4K1zhUNUA0v50gxarXAy37rQR4PwlTqL2kv+L
         wrVhEsxMk8nI/p7TtE0NRDKfL1rMZ5n1rHWT/BWYXSTR9TBzVY/EofBtZgNfprPPq5ik
         7rww==
X-Forwarded-Encrypted: i=1; AJvYcCUd/NVPYcdLfLntszh1CtvILhRHcw/sKjOpEFWoISTqA1hzmfqme1o8+4OW+6BPJnbOxKgWScovBvpJKuA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEilWEqDkBmdZEEw+H/KbYI3q6/6A/gG0EQd2TzvRKMast+Qvw
	cpk0DwApWCv4RCRUdnvcw2GFSRvgQgl4XrZmpjjRLdDExoTMQfbRYfYH/Ci9eUw=
X-Gm-Gg: ASbGnctC9JCi7F4HBSXk3dd0EfIvltwoB2d+NsLS7m5zQPKnLfWpkl3xZqrcywTT98T
	aPiKWwSe/CbQX9PWDHXrxoOC/C4zwhRGFS2Iljf1o8DE1vBbb19mrKOghvjcpG2XrnDxauyiEq0
	+ynpxe8xQCdTHSJ6CxnLZO3xK9daK16FteOkThldOAdfoiqOFtrD0xLyoMlf9P46il8r8SRQpuu
	Dk/vqHeUlVXOTacGlIBk5qLYGVqTvtDbcPmCUt8Fb8eNn7xelQ2F40EZd+JYgqOdGOl7+a/y38T
	8VuYbshYgVZEGEj8LsbA8DpWctWi9ZdmkoDZ1sWesGHjPYprjDt2vo1gyWMkuifIg0O/jUhlSCA
	JOh9M5gaNcv7hmip4QDkFb4knMhuuNguBPRjKD2mX
X-Google-Smtp-Source: AGHT+IF+oU6dtbhSTUp35Erp4pFu9BKlgUGv7gC32SbNGmA7e0FBwp4PCzmoBwoLF5sqkEf92WCnAg==
X-Received: by 2002:a05:600c:3491:b0:43b:ce3c:19d0 with SMTP id 5b1f17b1804b1-440a66b6fb1mr108980655e9.29.1745855345747;
        Mon, 28 Apr 2025 08:49:05 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f46c100023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f46:c100:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d29ba29sm162134575e9.7.2025.04.28.08.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 08:49:05 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: dhowells@redhat.com,
	netfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH 1/4] fs/netfs: convert `netfs_io_request.error` to a `short
Date: Mon, 28 Apr 2025 17:48:56 +0200
Message-ID: <20250428154859.3228933-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `error` field only needs to be able to hold an errno integer, and
a `short` is enough for that - just like in `struct
netfs_io_subrequest`.

This shrinks the struct from 608 to 600 bytes.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 fs/netfs/main.c          | 2 +-
 fs/netfs/write_collect.c | 2 +-
 include/linux/netfs.h    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/netfs/main.c b/fs/netfs/main.c
index 70ecc8f5f210..fbb605ee0b28 100644
--- a/fs/netfs/main.c
+++ b/fs/netfs/main.c
@@ -65,7 +65,7 @@ static int netfs_requests_seq_show(struct seq_file *m, void *v)
 
 	rreq = list_entry(v, struct netfs_io_request, proc_link);
 	seq_printf(m,
-		   "%08x %s %3d %2lx %4ld %3d @%04llx %llx/%llx",
+		   "%08x %s %3d %2lx %4d %3d @%04llx %llx/%llx",
 		   rreq->debug_id,
 		   netfs_origins[rreq->origin],
 		   refcount_read(&rreq->ref),
diff --git a/fs/netfs/write_collect.c b/fs/netfs/write_collect.c
index 3fca59e6475d..b405229de787 100644
--- a/fs/netfs/write_collect.c
+++ b/fs/netfs/write_collect.c
@@ -23,7 +23,7 @@
 
 static void netfs_dump_request(const struct netfs_io_request *rreq)
 {
-	pr_err("Request R=%08x r=%d fl=%lx or=%x e=%ld\n",
+	pr_err("Request R=%08x r=%d fl=%lx or=%x e=%d\n",
 	       rreq->debug_id, refcount_read(&rreq->ref), rreq->flags,
 	       rreq->origin, rreq->error);
 	pr_err("  st=%llx tsl=%zx/%llx/%llx\n",
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index c86a11cfc4a3..da0d36615bef 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -253,7 +253,7 @@ struct netfs_io_request {
 	unsigned long long	submitted;	/* Amount submitted for I/O so far */
 	unsigned long long	len;		/* Length of the request */
 	size_t			transferred;	/* Amount to be indicated as transferred */
-	long			error;		/* 0 or error that occurred */
+	short			error;		/* 0 or error that occurred */
 	enum netfs_io_origin	origin;		/* Origin of the request */
 	bool			direct_bv_unpin; /* T if direct_bv[] must be unpinned */
 	unsigned long long	i_size;		/* Size of the file */
-- 
2.47.2

