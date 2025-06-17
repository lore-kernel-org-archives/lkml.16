Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60ADF220F47
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 11:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750159170; cv=none; b=lCOZOBH9d7XG9c1I8YaBR4XF8sBS+8cyx0ai8uy8tqb8hJl4JSUHv3SYAKZyNHUjGvlTw42pEBKzvOCeYV834ffcyJYDK3eIHLnZ0Xp5+clYGnTi6YuueGrcXpmO/jtBgWG5XdpdD4yPvxelA5/d4atKnvXs+646z0igZ0bMLs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750159170; c=relaxed/simple;
	bh=yKMNo20wGtG8swo9mIbbV4pAGur42BWT6KCNt0VlPtU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W+oIw6hO1jjU35w4C3IIFf7DYzHxf+b4bNVdiDOAxTB9h8Ge6YWcWdTTM/gxCo/WMfCG1gG7122iuAwZErb+2u3vUk33V9Dq6VfEdXxnagNafmo+ox+xu+x2gwD1vBMdqY8alyDgyRamFWtxncmu1ecRchQnViAB6/4cd0+9E2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=HPQfMHe4; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="HPQfMHe4"
Received: from localhost.localdomain (unknown [178.69.224.101])
	by mail.ispras.ru (Postfix) with ESMTPSA id 2A064401014B;
	Tue, 17 Jun 2025 11:19:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 2A064401014B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1750159159;
	bh=Qv0/40tdPeceV308WPXjp/y7gd2dyE1vetqgtodqT74=;
	h=From:To:Cc:Subject:Date:From;
	b=HPQfMHe4KdvAeHfLTbcjfZRhYcrbrpDuX7RuOu9h/bN09DbC7LHO+irnekkYUHBHL
	 xIjoMEd9vmspbswknFVNuWjhE7r+bxRYRO4PedYJNPiTcozES4oJvlpeL2CccnpvEn
	 JKAjSilgSOdasFK4cxTjVBfE2MY3bStw3II2q9Q0=
From: Artem Sadovnikov <a.sadovnikov@ispras.ru>
To: linux-kernel@vger.kernel.org
Cc: Artem Sadovnikov <a.sadovnikov@ispras.ru>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	lvc-project@linuxtesting.org
Subject: [PATCH] function_graph: Fix off-by-one error in buffer size
Date: Tue, 17 Jun 2025 11:19:06 +0000
Message-ID: <20250617111907.1579-1-a.sadovnikov@ispras.ru>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment above buffer mentions sign, 10 bytes width for number and null
terminator, but buffer itself isn't large enough to hold that much data.

This is a cosmetic change, since PID cannot be negative, other than -1.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Artem Sadovnikov <a.sadovnikov@ispras.ru>
---
 kernel/trace/trace_functions_graph.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/trace_functions_graph.c b/kernel/trace/trace_functions_graph.c
index a8c1f56340680..d789d308ab1de 100644
--- a/kernel/trace/trace_functions_graph.c
+++ b/kernel/trace/trace_functions_graph.c
@@ -344,7 +344,7 @@ static void print_graph_proc(struct trace_seq *s, pid_t pid)
 {
 	char comm[TASK_COMM_LEN];
 	/* sign + log10(MAX_INT) + '\0' */
-	char pid_str[11];
+	char pid_str[12];
 	int spaces = 0;
 	int len;
 	int i;
-- 
2.43.0

