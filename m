Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F80283FE2
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 16:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746549623; cv=none; b=BrIJZKyMxF/wnVcb+D61aSK4F4HJLKHYGDG+DwECCoVcFo+TzUS1OYIGNZePylM/qbun0r0uvjSQ8SNSY9lLRmlzsjSnXvu1wYjr+jZxRvDkh4mtJKic+T4btQ+MfBBdWNI31+9VS938Lsjboqcj5sRfATu+1bgQqbOohkEX19E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746549623; c=relaxed/simple;
	bh=sKS+oajAdKrkXbW05N59mQE2XpopEuyeq8HD25s1BU4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OU5Bt9ASPOezivqcCWTnShmsr1TrH0bLcO/pVSr5qlG1F1BZhU3GV2FTJHcSlN6hdCIEgMSK10KQhmvJxXcTRCGrwK2gCw14GFPogzMgGo1EXR0/52j0VsUE1W4sCAvu5oEtIwD/eZTiTLJjXs4/APPwXABn/OSBebit5SQEPQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=UQhR01uv; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="UQhR01uv"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43d0782d787so37487235e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 09:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1746549619; x=1747154419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YDxac0WTKpNYAqKy6qqh/ldgoTgxO9yAZvAySkLr8eQ=;
        b=UQhR01uvJwThy6Nb8BCxBoNpbYsV0uJEhIo0WoHo7Shgrvl7oDnDpmp27mVxmuwGdp
         gxscuitKteaTUpR7AwhULI9ZTqWXYrgzz41QbCU5c2h45pR7FY1WqeL2I+7kQ3OesOQt
         GrW2NuiiFzlpMDUwpw/AkY3waUhkFoHHLsFjB4ZKbttXYbT3WoNqVsiyoE4D6H8S/A/H
         QsVGxe2CNP4hUIZEzuTNQ6+giT4p609hEEqRPIFB+rFrXJDm+/Rq5f6l4cugFBts81Ui
         T1RpLyazsmQvC+8uEUAre978NytXH8ts+g/yu87FsX50Rrx8UuMi5QgOy77rtpbqj2oD
         Oj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746549619; x=1747154419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YDxac0WTKpNYAqKy6qqh/ldgoTgxO9yAZvAySkLr8eQ=;
        b=rICWqj0n6rcyNs/xe1fcqKzZo8tuFBkouI4LeLQaHu4zNG2duA3i6ikSxNA+yY1Xt2
         50OsuY5nPrFH5VkI3iamxJbeaBSymZf1kaOLSExAdJv88weKKjeFHj4jtdCl0YRi63R+
         rKKKqqEnBwUQZ92092hXlF3cSrTionn+6SLZ7dRuNxs4fHuY2XrdNtoYCf8Csqt0pUqK
         KAdmiBwbkrCgLa2xkr//pzj3qCmdL7TEsu9VmSDstJkI/AWHddrbdh9AKrIE7IB9SmBz
         hXN30JKXGcgonKZoTJ6z51XoVyi6MOirs2CJxyCvI6aAMuqGT38KhFOVO20NJZrYao46
         2+SA==
X-Forwarded-Encrypted: i=1; AJvYcCW7OD8SIH8CfhPRqx8PlfSSNmT2sEFONtal+vtkCaUzay0duMFz7qKMl2I/tgHpxMeGnkT5DKTrn+Gib/o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp24o4lijBWeqrZYzbjqlpkMKeOHVNTAEIEKW0ix3BD3t2XRjB
	fjQiFSPtFin1xkF8Xi7l0skV34Qo5MV7+mTle6cVbiQzs/g/WwJI/CZQKhEHwYmtg7WO86eu+9S
	6Uug=
X-Gm-Gg: ASbGnctfrYWUsKoplJMwQvT7xg9KpVqsBWoldYtBIXmNANp64VMdZHOfIVopD89RE7B
	maKOgPN8aJgB99onOJAc+eWLotFKHHG6N19DGlpxJFWJlUXxqVb8wO+5sCE0RifPn6bIPF4A9ZQ
	YG8FtAEdByncbZ+Q0rCf715mI4EwlB2GcBAfc7nTEh3ieBeuwlRTmylY1YrXU2KRW5/LIyFo9uo
	hmT6dKbe36p5NQvqC9n1CCtx0mzwElipqa923yokcDz1reqJ3gcZyJ8RTutylvn327Pr14yG5bt
	P12gJBIdU4Z5B8gkTJNiowusenEhU1zwooM6bDBihPHqUOs+8XdNoqJk0WzP1v9bK4MSzdwu9yQ
	LT+IroZyM7dHS0UmQ9Q0Ol8Zdss9BCZyZJTHWAAId
X-Google-Smtp-Source: AGHT+IE6JlF6LcWEHOve+lS51YR1l5bhOAPO1WVtAJ57rwt/OA8Oq/W9Y5e0xEcHuMEp8U1hdl0uDg==
X-Received: by 2002:a05:600c:1e09:b0:43c:f895:cb4e with SMTP id 5b1f17b1804b1-441cb49494cmr81944285e9.17.1746549619147;
        Tue, 06 May 2025 09:40:19 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f46c100023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f46:c100:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a285c2sm174555925e9.32.2025.05.06.09.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 09:40:18 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: gregkh@linuxfoundation.org,
	tj@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH] fs/kernfs: implement STATX_BTIME
Date: Tue,  6 May 2025 18:40:17 +0200
Message-ID: <20250506164017.249149-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows finding out when an inode was initially created, for
example:

- when was a device plugged in (and its node in sysfs was created)?
- when was a cgroup created?

kernfs currently only implements `atime`, `mtime` and `ctime`.  All of
these are volatile (`mtime` and `ctime` get updated automatically, and
`atime` can be mainpulated using utime()).  Therefore, I suggest
implementing STATX_BTIME to have a reliable birth time in userspace.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 fs/kernfs/dir.c        | 2 ++
 fs/kernfs/inode.c      | 6 ++++++
 include/linux/kernfs.h | 7 +++++++
 3 files changed, 15 insertions(+)

diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
index fc70d72c3fe8..9a6857f2f3d7 100644
--- a/fs/kernfs/dir.c
+++ b/fs/kernfs/dir.c
@@ -678,6 +678,8 @@ static struct kernfs_node *__kernfs_new_node(struct kernfs_root *root,
 			goto err_out3;
 	}
 
+	ktime_get_real_ts64(&kn->btime);
+
 	return kn;
 
  err_out3:
diff --git a/fs/kernfs/inode.c b/fs/kernfs/inode.c
index b83054da68b3..1ff2ee62bfe6 100644
--- a/fs/kernfs/inode.c
+++ b/fs/kernfs/inode.c
@@ -189,6 +189,12 @@ int kernfs_iop_getattr(struct mnt_idmap *idmap,
 	struct kernfs_root *root = kernfs_root(kn);
 
 	down_read(&root->kernfs_iattr_rwsem);
+
+	if (request_mask & STATX_BTIME) {
+		stat->result_mask |= STATX_BTIME;
+		stat->btime = kn->btime;
+	}
+
 	kernfs_refresh_inode(kn, inode);
 	generic_fillattr(&nop_mnt_idmap, request_mask, inode, stat);
 	up_read(&root->kernfs_iattr_rwsem);
diff --git a/include/linux/kernfs.h b/include/linux/kernfs.h
index b5a5f32fdfd1..9332aadf4b48 100644
--- a/include/linux/kernfs.h
+++ b/include/linux/kernfs.h
@@ -229,6 +229,13 @@ struct kernfs_node {
 	void			*priv;
 	struct kernfs_iattrs	*iattr;
 
+	/*
+	 * The birth time (for STATX_BTIME).  It lives here and not in
+	 * struct kernfs_iattrs because the latter is only created on
+	 * demand, not at actual node birth time.
+	 */
+	struct timespec64	btime;
+
 	struct rcu_head		rcu;
 };
 
-- 
2.47.2

