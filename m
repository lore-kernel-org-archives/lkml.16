Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65AC846F
	for <linux-kernel@vger.kernel.org>; Sun, 23 Feb 2025 20:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740343615; cv=none; b=IYd9uarTIATPyEfiaEQEdtAbAXe6G8xTEeExfRVvDBNmJ7otOXwMulN3XKTMpzugH9VscYiAkw5TzcNJZYKcUzWNgdJo8t3lerNyKts91bKFGhFwOJ6uyX7vZV9qp3tVTiwlABJzt2fD++9DSdupRwHj8JXb9BvXImSr5nCj/fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740343615; c=relaxed/simple;
	bh=yiBlED7Er+79WUdSAwX3nMETMxNgXccfcRJLbl9a+3U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rsxlmNnfc3n2BGI7Y4lK4kG35EaKlXRIvJbxqQxaGnPrhjOW2ypbZ46cA/PTlYdKjy4ZKjSTHs5FbClGM3xuUYuVzRJwMO3UdDoKU7+b/WXYO8SNLat5EGrzPc8HW4IrbL5LB5qWPGW39spZLl9bjUhAkxJU7wtfTzJfSghzw8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZcqU6b25; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZcqU6b25"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740343601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=08QzHP3bP7KO+u09LJ+0D9dSqxkLj1k8AYQJMF6TyWY=;
	b=ZcqU6b25GdDRR4L8CfFzuPIVYtHztbmotSU/lX9mDicghWIXYEZfd9mipMGjO1gE10uoTW
	B/b1H3xvPaJ4lt7VWdHDq4QDKB16AAVOs/lhi6nL/6P0kLCXHZX0H/DaTYGVt37NYEsHRu
	q8ayk9YW2SajD7rhuhOiI4xgTTM9g/Q=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Xin Long <lucien.xin@gmail.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Kees Cook <kees@kernel.org>,
	linux-sctp@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] sctp: Remove unused payload from sctp_idatahdr
Date: Sun, 23 Feb 2025 21:45:07 +0100
Message-ID: <20250223204505.2499-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove the unused payload array from the struct sctp_idatahdr.

Cc: Kees Cook <kees@kernel.org>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 include/linux/sctp.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/sctp.h b/include/linux/sctp.h
index 836a7e200f39..0b0228578153 100644
--- a/include/linux/sctp.h
+++ b/include/linux/sctp.h
@@ -239,7 +239,6 @@ struct sctp_idatahdr {
 		__u32 ppid;
 		__be32 fsn;
 	};
-	__u8 payload[0];
 };
 
 struct sctp_idata_chunk {
-- 
2.48.1

