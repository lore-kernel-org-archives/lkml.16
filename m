Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DC4286433
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749544693; cv=none; b=VaTXldWz0ku7f2Txdobv0xEGrqUez2Yfr3xjqfFcAE3ULN9KNfuRflYfH7QeDjP339U8bTchMEoh4xFBVBpjO980RWe7T75wEc3reNedps1oI2nOCU3lhqX7iDnNlbVQJY1PaTqvxJCfadOHTDcsnwAZJlpuOY0IKs+tswffUWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749544693; c=relaxed/simple;
	bh=9uSj8nECHdGEcQVH+g+bWqSf1bY6OlgEhrntxwaC7vw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=oruq4sUairtxZSwT+VRUW5T6aDa9T592I3eOEp0gs4rmY/PfjOyfXlQo//3uyO4KpRPYiq7k8lvNE54Wus+dB0ntxfl8qpCODvKsFnm6qAhgHEb5DOPIJXMoIsQiqB+OSCKH+UHd5wb3qfdcLAX6oYWTGUMzdIzD0VTOdljThls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=a8IAz6yb; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="a8IAz6yb"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749544688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=q5HeugkHcjUwf4mk/XUNlpjUL6kKhDq/9U6Y9Vd4dl4=;
	b=a8IAz6ybvG8uIiSxJDIUclktJubKEE4rGGhYGbGGM5R9No+9Cr1bGMQzp7hn39Zb32ck1f
	iwDxenlzf+k7MxolScB0OCodyDaTXE0kMqUt9ZjQ1kp9fgtv/bbJK1OAwkSw1xxftuN827
	J3TUNEiyxSG4SiIp6Xw2lAdpIwP5lGg=
From: Ye Liu <ye.liu@linux.dev>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Ye Liu <liuye@kylinos.cn>
Subject: [PATCH v2] mm/memfd: Clarify error handling labels in memfd_create()
Date: Tue, 10 Jun 2025 16:37:30 +0800
Message-Id: <20250610083730.527619-1-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Ye Liu <liuye@kylinos.cn>

err_name --> err_free_name (fd failure case)
err_fd --> err_free_fd (file failure case)

Signed-off-by: Ye Liu <liuye@kylinos.cn>

Changes in v2:
- Rename Subject.
- Use "err_free_name" and "err_free_fd".
- Link to v1:https://lore.kernel.org/all/20250609031858.73415-1-ye.liu@linux.dev/
---
 mm/memfd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/memfd.c b/mm/memfd.c
index ab367e61553d..4fc98abe6627 100644
--- a/mm/memfd.c
+++ b/mm/memfd.c
@@ -475,22 +475,22 @@ SYSCALL_DEFINE2(memfd_create,
 	fd = get_unused_fd_flags((flags & MFD_CLOEXEC) ? O_CLOEXEC : 0);
 	if (fd < 0) {
 		error = fd;
-		goto err_name;
+		goto err_free_name;
 	}
 
 	file = alloc_file(name, flags);
 	if (IS_ERR(file)) {
 		error = PTR_ERR(file);
-		goto err_fd;
+		goto err_free_fd;
 	}
 
 	fd_install(fd, file);
 	kfree(name);
 	return fd;
 
-err_fd:
+err_free_fd:
 	put_unused_fd(fd);
-err_name:
+err_free_name:
 	kfree(name);
 	return error;
 }
-- 
2.25.1

