Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707ABDF59
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 03:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749439197; cv=none; b=sMW5Cp++qGUc8u+tO+DHc2pVow09BeoU99CgqTRfPrH0TkNQAHOOxfcHob8753h5sFauVhJYEHLhrlYZOiA/BchKNhnvgf/0qLnNfdooTntqd0V/QWbMTcNCZkuodpgBBwLVljPVzJ3b7H/yP9rkLyyC9Jaxj77kSiSWfcyCey4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749439197; c=relaxed/simple;
	bh=7MiFN1G2ewbQGhIlKY7kr0F5Nhr20TrQHsj7DzIl4Sg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=J1C9swBHqhHf9LcRihiRcqNBxCyFVoxka3owEbCtfRCFOSOr164LpjmtDCDCvqQaIfa93W/YQoBQLImdfGJxoYkQ6rSsGfPPfPs4/9FBRykFtj8jzT5aJjyN5FXTGNhIKWgK0T40yY0VVA7xNsHkOl3avtKWiVtkEWpLzdj0BU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TCQCoxxh; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TCQCoxxh"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749439192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3QjfSIcDDKRoeNKEr9f87nhcXeN9tmNpV8LR1Szzp14=;
	b=TCQCoxxh7vxY2MElH6C75vX3TYLBIs2LYrdeoDrUpNrtM8lfR1CiRojj/f11p8/DgARzFO
	QWmZ3+SvpMrox3grLZNLLucpF/FTgno+AZn1oTw0Y/nbrqf9t4cFHYhjGO8HEAaGowMRCi
	0fIzQLdDF/V7gG8+VIJwUadZAYsvpXM=
From: Ye Liu <ye.liu@linux.dev>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Ye Liu <liuye@kylinos.cn>
Subject: [PATCH] mm/memfd: Rename error labels for clarity
Date: Mon,  9 Jun 2025 11:18:58 +0800
Message-Id: <20250609031858.73415-1-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Ye Liu <liuye@kylinos.cn>

err_name --> err_fd (fd failure case)
err_fd --> err_file (file failure case)

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
 mm/memfd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/memfd.c b/mm/memfd.c
index ab367e61553d..628bfa5fa9da 100644
--- a/mm/memfd.c
+++ b/mm/memfd.c
@@ -475,22 +475,22 @@ SYSCALL_DEFINE2(memfd_create,
 	fd = get_unused_fd_flags((flags & MFD_CLOEXEC) ? O_CLOEXEC : 0);
 	if (fd < 0) {
 		error = fd;
-		goto err_name;
+		goto err_fd;
 	}
 
 	file = alloc_file(name, flags);
 	if (IS_ERR(file)) {
 		error = PTR_ERR(file);
-		goto err_fd;
+		goto err_file;
 	}
 
 	fd_install(fd, file);
 	kfree(name);
 	return fd;
 
-err_fd:
+err_file:
 	put_unused_fd(fd);
-err_name:
+err_fd:
 	kfree(name);
 	return error;
 }
-- 
2.25.1

