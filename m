Received: from mailgate02.uberspace.is (mailgate02.uberspace.is [185.26.156.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74666A33F
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 21:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.26.156.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748209177; cv=none; b=NKHABiQrJKpnavkyNNy0Za9W3zdI69gwILyxKmCJ2t9KTnI4TU72o0rqH6dauDrTk2YPu5bnxNIEQ/ivo6MrrAMzs6EPiDDMMXfDTQCy8yt0L/Uk1ZmWMC7+ThEawB/1coo/ZoaBUjvWvoz4kBPrHcjNgjk3gwXoyzDiO7Zya5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748209177; c=relaxed/simple;
	bh=16OAQKTksIsfKUoftXfNIOqVgrPPqcNOEBEmjxSzZlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iHgyiLpNRIFyrFZwb7wCwdXYCxKJ1RnVaKgRK6N2WU3RaMMKqwaBygzLAAAIkAT211796x5Vj66eir94qqWbFeP3MRjXrwE+0YmHgFX4Vv0CD4tF7Ul/+tSFYPsk4Fxfqn+Lxm+ixDO7cnMxoCZkRzS9dvtfyWUZ0xjIQz7VCaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yshyn.com; spf=pass smtp.mailfrom=yshyn.com; dkim=pass (2048-bit key) header.d=yshyn.com header.i=@yshyn.com header.b=MxmqypKs; arc=none smtp.client-ip=185.26.156.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yshyn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yshyn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yshyn.com header.i=@yshyn.com header.b="MxmqypKs"
Received: from phoenix.uberspace.de (phoenix.uberspace.de [95.143.172.135])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id 5C6E417FCDE
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 23:39:27 +0200 (CEST)
Received: (qmail 13955 invoked by uid 988); 25 May 2025 21:39:27 -0000
Authentication-Results: phoenix.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by phoenix.uberspace.de (Haraka/3.0.1) with ESMTPSA; Sun, 25 May 2025 23:39:27 +0200
From: Illia Ostapyshyn <illia@yshyn.com>
To: linux-kernel@vger.kernel.org
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Illia Ostapyshyn <illia@yshyn.com>
Subject: [PATCH RESEND] scripts/gdb: Use d_shortname instead of d_iname
Date: Sun, 25 May 2025 23:37:10 +0200
Message-ID: <20250525213709.878287-2-illia@yshyn.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: -
X-Rspamd-Report: MID_CONTAINS_FROM(1) BAYES_HAM(-2.901074) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -1.501074
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=yshyn.com; s=uberspace;
	h=from:to:cc:subject:date;
	bh=16OAQKTksIsfKUoftXfNIOqVgrPPqcNOEBEmjxSzZlQ=;
	b=MxmqypKsa4BLAKXb4P9BDGBhVjb7SckVb/TlZcNEP9M5tSZIKdpQYxK/OqVjLJYYVqIauZZ8Jn
	dzGWtsEJB4j7g32XFmHxCAkFfXa9+VUEYNBbVLVSgzc3lKPjnwkPv0eU0fQNGAJZYoMaiZFsRHC4
	MjAQpTbp8mpVEw3mnuymWdYTaMGU30YJKu8fG0q+b+nyR8CBBw9x4fTfth7pMmJWhKWQRTKXMNUM
	4qmtsiyX8jA0vcjwatfxHTlKOcyWR29OJVqAynmIKbaBa8sl8PBZSevcsJ9GU/ZYNw+yfXFvWdCG
	OD9vN/xmtgSgLHxGq9jI1/rgA8ypaAwpxJyv/YQQ==

Commit 58cf9c383c5c68666808 ("dcache: back inline names with a
struct-wrapped array of unsigned long") introduced a d_shortname union
in place of d_iname.  However, the gdb scripts for vfs still reference
the old field.  Update the scripts to reference the correct field and
union member.

Signed-off-by: Illia Ostapyshyn <illia@yshyn.com>
---
 scripts/gdb/linux/vfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/gdb/linux/vfs.py b/scripts/gdb/linux/vfs.py
index c77b9ce75f6d..b5fbb18ccb77 100644
--- a/scripts/gdb/linux/vfs.py
+++ b/scripts/gdb/linux/vfs.py
@@ -22,7 +22,7 @@ def dentry_name(d):
     if parent == d or parent == 0:
         return ""
     p = dentry_name(d['d_parent']) + "/"
-    return p + d['d_iname'].string()
+    return p + d['d_shortname']['string'].string()
 
 class DentryName(gdb.Function):
     """Return string of the full path of a dentry.
-- 
2.49.0

