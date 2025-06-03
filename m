Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC07189F20
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 15:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748965546; cv=none; b=iqZrprqBF0gusE6A6Jlnq6uwCjI7gEkSHoy24dlDw60uJtgzY+cwMktCloMo7fT8zq8N+Ax8p6cwOmBj4uK80eBNMnUzHCjnHwSLWftPilvI9dAjfbmTb4cgIC655xoeSH/DqzuX78feRuBgcA4aX3V7x3bKcJ5OMf2IMHtM4nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748965546; c=relaxed/simple;
	bh=eGLBU5Crh+XobfNjtR640S9EorM9CF+b4a8zt0WCYFY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Sl7GayOKVG4fplaig9/jaW4dxrRBtKN3cMM8xAw35Qt3hlr5mH9Hd+MXLSFGeh40vFd4Lclghfgv3OevxeIWaqDL1AjJ2t0/zkPrutjp32cribOm1eYHPbAo2y770sN9l68hAbaFku5PWkaERZ4P+h1eCwOQhHK3nmUwlFxnhtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Sk3m2LWv; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Sk3m2LWv"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-450cfb6a794so36311815e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 08:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748965542; x=1749570342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aYCUJ5XErr9UBRSuF7B/2bm/XCId19PjW+/NwwVgzs8=;
        b=Sk3m2LWvtzjHBuZtvhbOFHLA1HN96iu/McHNU13zZbnbnpWjhObmJbXyESGutN6+1y
         QKL+cI+F2OCRPppxqkoz04/prSgYGjv74Tk31yEOA6bXh5EUAEfvTmdWRtzvb7RgYakI
         QV49ceEd6767GZC39YQaA8ha70NPFYiCG3Y+weQcZI3hygJnDWOtMVPY7Ps0hACuSEkI
         V7phIvqZWtSsYVLwp+z2l61BallDPIfMJ1wef8wIYRpa9wF8A4oNHJfOUpmYYHuryaPS
         iFQsemKjktQHxQd/qoSCQ+2CySjieBaoE34QmXTBbMlxKc2cfkFU0Vv3+DTnc+dOX3dK
         ktCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748965542; x=1749570342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aYCUJ5XErr9UBRSuF7B/2bm/XCId19PjW+/NwwVgzs8=;
        b=kj55jv0qsAVyu0yFKfrKmIX4NmI4xI41ERwAKKcnPlPEKzKq1BmAclo1Bs1qxte8AQ
         kd22Gbdebh9vXDH12U13tsRlswZUQOOnzZHJWMAu5xZstbmEXC/iXbifN49IM2fdsPzg
         7+iWdP9zdpXoVD6kkxxxoPQr1xWDb7D8AH/ajyo7ZLdAjiHIBfhFPiU3FkA+DfulVR+O
         wQ+XO5r/BIF/8P5sBNApvkHJlv48iYMoCoo1gXbzzqzpiggge58wpCHDr0WjfAMguoXu
         gt1SyycpOxmQH0O0oOpOMGeCe3s8KgEKEeC5XZ/2L09EeLqs4DMZ9N9hgnhwOGHjbaWi
         Y3Eg==
X-Forwarded-Encrypted: i=1; AJvYcCXbVKXTZBuGEdkHNRhpZRvGWRgD+8s1rvlVu/3D46nEkYAsQFqMDmzGF9/SFEyh+dswDMlUqrrMfonnrqA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxRzKlDp3sof2qPiRS8AGhfgzRuhqyTCrlxwvgq5wLtyAzRnqn
	8G6PGb28bWHYZ0qykPv9fBl0Qg5VxkDpHQ8dQ1hjid4KXz/yzihpMaEUvbOgLBrqSJQ=
X-Gm-Gg: ASbGncuLR5sMZyP7ncsN0/5rbZAunO/RmtZqAw6JF5XICeP+0ZypaiB4omuk37AEyap
	ku+NZomu0QYkO8kU4S84oqgwS3Fad6O4N/l0nFGPgHxsqqLWDCMsRxUCAc0Rt7y22O8G0Wu0OFF
	gGqQlrJT2TEMf5ujiU6zLw93kQqnCDJSeWRkNIGCV5az/0Fzk19ptZ36Wsv4A/Dks/RiaAcXWzo
	VqTVsIPiIghSQ7R8oaIX97hajKWwfK7B+A1yYDv7lhp5WVoaB6jEDeQcI7a0hO3/0zBVI9+GL1o
	HDyep5PFziomlPy7Ktte8AOLtHLPiI4ki3ulKMEeVltu8UMi+2EF0w==
X-Google-Smtp-Source: AGHT+IFbA0YnJHJhQOXozYnQDP6QUHiCWnvi883uqWMIH3Z9yWJVTCPbll5VydzvLsFF5Sn0ybR3oQ==
X-Received: by 2002:a05:600c:3b8e:b0:450:c210:a01b with SMTP id 5b1f17b1804b1-450d6504a0cmr182782255e9.17.1748965542562;
        Tue, 03 Jun 2025 08:45:42 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450dcc18a80sm160128875e9.38.2025.06.03.08.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 08:45:42 -0700 (PDT)
From: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
To: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>
Subject: [PATCH] cgroup: Drop sock_cgroup_classid() dummy implementation
Date: Tue,  3 Jun 2025 17:45:27 +0200
Message-ID: <20250603154528.807949-1-mkoutny@suse.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The semantic of returning 0 is unclear when !CONFIG_CGROUP_NET_CLASSID.
Since there are no callers of sock_cgroup_classid() with that config
anymore we can undefine the helper at all and enforce all (future)
callers to handle cases when !CONFIG_CGROUP_NET_CLASSID.

Signed-off-by: Michal Koutný <mkoutny@suse.com>
Link: https://lore.kernel.org/r/Z_52r_v9-3JUzDT7@calendula/
Acked-by: Tejun Heo <tj@kernel.org>
---
 include/linux/cgroup-defs.h | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/include/linux/cgroup-defs.h b/include/linux/cgroup-defs.h
index e61687d5e496d..cd7f093e34cd7 100644
--- a/include/linux/cgroup-defs.h
+++ b/include/linux/cgroup-defs.h
@@ -898,14 +898,12 @@ static inline u16 sock_cgroup_prioidx(const struct sock_cgroup_data *skcd)
 #endif
 }
 
+#ifdef CONFIG_CGROUP_NET_CLASSID
 static inline u32 sock_cgroup_classid(const struct sock_cgroup_data *skcd)
 {
-#ifdef CONFIG_CGROUP_NET_CLASSID
 	return READ_ONCE(skcd->classid);
-#else
-	return 0;
-#endif
 }
+#endif
 
 static inline void sock_cgroup_set_prioidx(struct sock_cgroup_data *skcd,
 					   u16 prioidx)
@@ -915,13 +913,13 @@ static inline void sock_cgroup_set_prioidx(struct sock_cgroup_data *skcd,
 #endif
 }
 
+#ifdef CONFIG_CGROUP_NET_CLASSID
 static inline void sock_cgroup_set_classid(struct sock_cgroup_data *skcd,
 					   u32 classid)
 {
-#ifdef CONFIG_CGROUP_NET_CLASSID
 	WRITE_ONCE(skcd->classid, classid);
-#endif
 }
+#endif
 
 #else	/* CONFIG_SOCK_CGROUP_DATA */
 

base-commit: cd2e103d57e5615f9bb027d772f93b9efd567224
-- 
2.49.0

