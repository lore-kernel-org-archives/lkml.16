Received: from mailgate01.uberspace.is (mailgate01.uberspace.is [95.143.172.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDFD34A32
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 00:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.143.172.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751157605; cv=none; b=NK0KbwsSNgQZlQLLVvcrtjq5mKTN+me0Qd6+TTjekXh6jvioE7s4Q38cKyRuh6SR4lc95fKIEmXPZvxeALsoqDTLtjhgkLjl6awJnTEXmNxX3exLQqj9N3q7v2v1tqr3o6+XWjFMytRt8zxkeshCsNRX4JEHrAbGvDJ786303g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751157605; c=relaxed/simple;
	bh=QnHTevfYAc1Ghk0Aknd/fmYNxq8NR8a6sznBdkS3OKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ljTqxqauo1ORng7kBy5OovFux+C87mhHySkfPPIYKzzZybHKrLdVeKq86bAcbxcbFDUIiIPzaZPnKyMvw2YZ3tqRdNjpCu+zaB7NDRtZ0fcT0D8aIEkkFvUvGIqvbAqP5N8+MTiEEovqGeysGTx2pr0Ku8GvOV0HU0s/MpCy5C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yshyn.com; spf=pass smtp.mailfrom=yshyn.com; dkim=pass (2048-bit key) header.d=yshyn.com header.i=@yshyn.com header.b=UnXSVCY7; arc=none smtp.client-ip=95.143.172.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yshyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yshyn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yshyn.com header.i=@yshyn.com header.b="UnXSVCY7"
Received: from phoenix.uberspace.de (phoenix.uberspace.de [95.143.172.135])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id EF6C360A07
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 02:39:53 +0200 (CEST)
Received: (qmail 20283 invoked by uid 988); 29 Jun 2025 00:39:53 -0000
Authentication-Results: phoenix.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by phoenix.uberspace.de (Haraka/3.0.1) with ESMTPSA; Sun, 29 Jun 2025 02:39:53 +0200
From: Illia Ostapyshyn <illia@yshyn.com>
To: linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jan Kara <jack@suse.cz>,
	Christian Brauner <brauner@kernel.org>,
	Illia Ostapyshyn <illia@yshyn.com>
Subject: [PATCH] scripts: gdb: vfs: Support external dentry names
Date: Sun, 29 Jun 2025 02:38:11 +0200
Message-ID: <20250629003811.2420418-1-illia@yshyn.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: -
X-Rspamd-Report: MID_CONTAINS_FROM(1) BAYES_HAM(-2.99877) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -1.59877
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=yshyn.com; s=uberspace;
	h=from:to:cc:subject:date;
	bh=QnHTevfYAc1Ghk0Aknd/fmYNxq8NR8a6sznBdkS3OKA=;
	b=UnXSVCY7X0Rj+ELxqWIr5yBTGR0L/kbqcFusrllVLknh2UcQlCvfyZTrMuQq26zYn1/PFLV+a4
	pjoUcTGSDmI43/MwR1fty5zBaU4nQnFzNV1XWFXlvD2KBU7DWPFDBioG7uo4cJmKOTJBKyLkW+x4
	XJjmfrDuevDsJBwYUI/9sxc8tfarJDkKTWH6wczeeooNy+OH0usFMVlL8EZ4NezqM2gCp5cyjagP
	qPfet5v9OZkJxTiSaa8YYjgSpHHZ9h9NDniXyqC3XQCz758abx8lE3V2+mbBWF/iCLBDw8VFVCPu
	4+MmV69A3a63Kf/Xcd/DZYFmfEvfoJy+Ugqe5Ksg==

d_shortname of struct dentry only reserves D_NAME_INLINE_LEN characters
and contains garbage for longer names.  Use d_name instead, which always
references the valid name.

Link: https://lore.kernel.org/all/20250525213709.878287-2-illia@yshyn.com/
Fixes: 79300ac805b672a84b64 ("scripts/gdb: fix dentry_name() lookup")
Signed-off-by: Illia Ostapyshyn <illia@yshyn.com>
---
 scripts/gdb/linux/vfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/gdb/linux/vfs.py b/scripts/gdb/linux/vfs.py
index b5fbb18ccb77..9e921b645a68 100644
--- a/scripts/gdb/linux/vfs.py
+++ b/scripts/gdb/linux/vfs.py
@@ -22,7 +22,7 @@ def dentry_name(d):
     if parent == d or parent == 0:
         return ""
     p = dentry_name(d['d_parent']) + "/"
-    return p + d['d_shortname']['string'].string()
+    return p + d['d_name']['name'].string()
 
 class DentryName(gdb.Function):
     """Return string of the full path of a dentry.

base-commit: dfba48a70cb68888efb494c9642502efe73614ed
-- 
2.49.0

