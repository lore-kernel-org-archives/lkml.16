Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F3023F295
	for <linux-kernel@vger.kernel.org>; Tue, 11 Mar 2025 11:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741691165; cv=none; b=J1Lguq1552bxlqRvdxN7MeMIP4LrmO2rPtkSCHlsjHrmb0qT958LuNAa3EMg34Ufuc1wkHsh8zYeS0FdPl38UcHdk1iR1xABooO6jtviEu5HwiNSOO1otnYpR9zRB3kpA26lPnd/G0sAWV78+AEoHS8kxUQipLwOlNgOyOZEAhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741691165; c=relaxed/simple;
	bh=OCK7hwzzWPGxtPztmUpXo8Qw8E0tjJ/UxVW5B4dwt5o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s8AHtAEevrHnJExzDPAIoppNyZu9TY0mOhvSf5QCM7zg2P+vEaLSpt1xB6d7X0+QqzkQxyK+QI1UAa4SBntZY46cpd7AhezfUy/L8jqdgBAsdtZXj0ncyf8UD+rG+KnOVNEVQ8cVcXDg3KUv+OvBDomnTZoex4DL8o8kWUntLwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cQNwnPSX; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cQNwnPSX"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741691159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=M2psLgsJ4algSAue7O4ZSsNUwcf2SUWe6woc6MfNSnQ=;
	b=cQNwnPSXYvBBdm4tbNOaw/ThRynFK/DH1pdoCrg/6C5cBw1/qrKjjuC8xggU7HCpMEX5x/
	3mO2QN3PfyIzEC7qWP5z7YWqmpXFT9PZVsS9jRwbhdYD8m7Ujwh6RLEaKiqp18bzLqHVRo
	b4HU3VvCX1uR9rDA6SnNWBHjV06cLhs=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Christian Brauner <brauner@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@Oracle.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Wei Yang <richard.weiyang@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Al Viro <viro@zeniv.linux.org.uk>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] fork: Remove unnecessary size argument when calling strscpy()
Date: Tue, 11 Mar 2025 12:05:39 +0100
Message-ID: <20250311110542.495630-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The size parameter is optional and strscpy() automatically determines
the length of the destination buffer using sizeof() if the argument is
omitted. This makes the explicit sizeof() unnecessary. Remove it to
simplify the code.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 kernel/fork.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index 735405a9c5f3..81eef131e23c 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -2248,7 +2248,7 @@ __latent_entropy struct task_struct *copy_process(
 		p->flags |= PF_IO_WORKER;
 
 	if (args->name)
-		strscpy_pad(p->comm, args->name, sizeof(p->comm));
+		strscpy_pad(p->comm, args->name);
 
 	p->set_child_tid = (clone_flags & CLONE_CHILD_SETTID) ? args->child_tid : NULL;
 	/*
-- 
2.48.1

