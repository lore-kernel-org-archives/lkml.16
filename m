Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C0213B7AE
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 18:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749235754; cv=none; b=gBFlc653l8UHBhVRZ2QMHkKD5tgyBn4puebKdufBbuGqbl23iERFmcNgy2n897/tfMPXPRQwb0upGKNWOm/SVeW/jM0ihxscWUwtY5Y//1o7RKE3WQBG+rHCLE7R4cUAfSLQ5KeAPT0iiWWejUVGboNhBWDgXfd8Sqd3W/Vagnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749235754; c=relaxed/simple;
	bh=NJL/HvFCP8LBdaOE52nI1PwCHmXJzBz3A4hZd6HeOQw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K8Ef25XBaG5BLEhgz1jT/m+vuP05+W3Lr0S2TEsT1ymlk+Icc3whsnTnD4ObNn4wFK6VuvO621UmKjecz24+8GD6UOvrTmb5KEf2NCNr7FGMCTNR+YufFgBhRoyfHBauOAMnlocOVfwspJcMVuEpZnf9fJ1eJ93OFrcg/Q/d0TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+lp/Ql7; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+lp/Ql7"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-235a3dd4f0dso17732995ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 11:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749235752; x=1749840552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VVl18CkOJ15003GjsMWz0RG+tHCTImFD4CbpZhIBGrg=;
        b=H+lp/Ql7+eksoCmuZFqA3YzNfu6skZ34typkEEE8pberD1r83/7uuISxCBvJgIsQFB
         smY0k/xuQeRutL0VmpIkaeb07RWwK9IyW8MmcFtqfOHDN8xyS/YDx5jShJwpyPV0UyT7
         Pn7v/B0f7ZzSOyW/yfjE7/q3HMhE3DxXmBgvgFF2kP/q9wSChhP4GG/DNIC6QN3WdK0d
         yy0nALJvT5IJLAJdyPEph2XVY/za2jBGoVYqxrVe+RvdoOP+lQgqDbCYOQr0y1myMLWT
         luMszPzq1iql7u7T5HdgAzeZGFXGAXT3kfAIeaExPmD2hx2J7TpkGCYnuOMHqtS7AR5R
         +PQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749235752; x=1749840552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VVl18CkOJ15003GjsMWz0RG+tHCTImFD4CbpZhIBGrg=;
        b=cE0IVqPVIn6pyQ6/BATcOmFQ/xPpESkSsvmBL8xZ4mQs0+ALa9DqvcttP+XhHigTnq
         lDPF2EhyIDbnpmsHA5XRHu+FzmUCAWOpX5h+m66vFfKkkJEoMrstW4cRKHsWNASsGjw2
         EiMD+umZWJT/aH+DD6LnN8ixR4xd8Ueq1Rp2ABWT5AkGl3yiCevKl8sybMTHU7dzLi8R
         xlznaJiU/vau15x6lKqZ6zeO4kJrUdS5dIeWGbJpbGKS6wUdYF7rTt3iv/DKw+liKY3r
         uTAKxnbT5HlMO9/8lc3+mXRU4nM5vxWhjl+IRe2t6IKQEaDIL9kYw7At7ykRCQDxHA4V
         GxMQ==
X-Gm-Message-State: AOJu0YwoY7QNov/jsPcKDdf0qEw91CFrIRuOH18P8zZx0GgQx850UQNQ
	J8XMGelwtu/PGLsY7wDK1AQmFXWvo8huT3Dww2cgN6i3HXpT+kq3ycqzyJnj0A==
X-Gm-Gg: ASbGncsTSTKbYTvy4uIlLBvk3vDWEYz+DwE+lyYtxw10mojFtemjt6uYV476YLuhkRo
	nPT88iSr4v049qcYZDcIVrf/38u/yFGhNZzwZFX+EJv+TBVqeOBJ4Y0CrYt72FYF2UZqNUFlY9R
	ayqPwwsaMiubC2z3sleZA0Q4rLKkgTQb7gZl9pGg53B7e5WeJaUHTLZUiQdoli/eC/DhriTY0Dg
	I2DKooYqbTpgk9EDb1PDvUIBAoGr0+N4URXWsfi7bqMdrye+3DXkZNG860nnA4oE7YZSnUkS4/V
	PJu5rDwgca+91M2bU7VS7RH0mcmpNK2FsIqTPteCrUgYnbZ0LobxASL4jI+niBfvvydxPmQLyx1
	+cNkdSlX3a9tAY69vglqIO2mzI3t/+vUH6Le1vAR+Yg==
X-Google-Smtp-Source: AGHT+IG118EXQa+ckUV2izSwGgtCI5B5Q2LLS0l1xjh5vEqVA/gR2EMnnsTOfduFFZxs+B8gErHwzQ==
X-Received: by 2002:a17:903:3c63:b0:234:d2fb:2d28 with SMTP id d9443c01a7336-23601e21c05mr63997405ad.2.1749235751894;
        Fri, 06 Jun 2025 11:49:11 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com ([2a00:79e0:2e14:7:d02c:e22:e5a4:2f84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603078d7bsm15542505ad.2.2025.06.06.11.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 11:49:11 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>,
	Chao Yu <chao@kernel.org>
Subject: [PATCH v2] f2fs: turn off one_time when forcibly set to foreground GC
Date: Fri,  6 Jun 2025 11:49:04 -0700
Message-ID: <20250606184904.224811-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daeho Jeong <daehojeong@google.com>

one_time mode is only for background GC. So, we need to set it back to
false when foreground GC is enforced.

Fixes: 9748c2ddea4a ("f2fs: do FG_GC when GC boosting is required for zoned devices")
Signed-off-by: Daeho Jeong <daehojeong@google.com>
Reviewed-by: Chao Yu <chao@kernel.org>
---
v2: move the position of Fixes.
---
 fs/f2fs/gc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 2b8f9239bede..f752dec71e45 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1893,6 +1893,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 	/* Let's run FG_GC, if we don't have enough space. */
 	if (has_not_enough_free_secs(sbi, 0, 0)) {
 		gc_type = FG_GC;
+		gc_control->one_time = false;
 
 		/*
 		 * For example, if there are many prefree_segments below given
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog

