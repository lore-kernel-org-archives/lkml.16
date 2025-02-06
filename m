Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26346192D8F
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864309; cv=none; b=R6NgG4XpZdxpXHRm7sH/+JmnHhOsL+7XDo6I8aijeVKxAMKD5ZtKg2RyzNQSmZNhiDohII8GYO3dOuiF5U3JliZKVFY5GPtXnJporbOqxrE9SwyyfvUHk6s/8Cw3vFQBwCjjXpvT8kTN59CcA0aWtpD293Vlo+WEQqxr2bKMIQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864309; c=relaxed/simple;
	bh=z8SKz3Ncd0jxvw5GN08Zck3HuR+SHjS5HGfhVoDa6UE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iFRQAX/u0y1/yQl1XGVKpC/DkHj35zgYfZyBXfQqGlmC0GckX87lvqe3+cbsZE6+Gf3ZUleXehWikfS8y1Lbfds6tMODF4uPKZY9uONenqT3Y7WFM1lXkW3tzDPVfT6oXepiUBs5k7X6TqZ9mHgK5BTqdsg+H9TrwlNicBaBvnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=rRl/GGGp; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="rRl/GGGp"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Ypl6C4N2dzlgTy0;
	Thu,  6 Feb 2025 17:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1738864302; x=1741456303; bh=Hlsbd
	pf6ay3VfkMAA1VaaCT7pd5QUDCLU9tdEKZSjBY=; b=rRl/GGGpzQxUYRwB84Hpb
	At0gMd/S1YPqV9pg3iSJktB3RqT/yhFnswWpZna6XEkXjf5/QcouSmknmZSSvY5F
	XxAZ26E+jotolr6NqU3BTbJVcxR4rb9lAWdWdjLAb29aHeHT6LwbsY+Bfs2RdVuP
	8CWbESXlzKi7FlmXlvQyAS8jXwnS85tFMrdkryZZeghuMIjCVacAHgmT7EIzrxRY
	T1erSQo7sKUOMYxjGziIF5VOj9Uyg3BObwQxfihKiZul66eGY0j/Cutv4o0nlB//
	4Ogqjz2fZgU/lBgnNT5Md4U3u6iLPldVoE6EZNTbJFJgx5WP2EjL3aUn3+BhR0y0
	Q==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id qpOLkz43XF6d; Thu,  6 Feb 2025 17:51:42 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Ypl5m453RzlgTwJ;
	Thu,  6 Feb 2025 17:51:24 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Elver <elver@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Jann Horn <jannh@google.com>,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>,
	Heiko Carstens <heiko.carstens@de.ibm.com>,
	Martin Schwidefsky <schwidefsky@de.ibm.com>
Subject: [PATCH RFC 02/33] s390: Comment out the RELEASE constant
Date: Thu,  6 Feb 2025 09:50:43 -0800
Message-ID: <20250206175114.1974171-3-bvanassche@acm.org>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
In-Reply-To: <20250206175114.1974171-1-bvanassche@acm.org>
References: <20250206175114.1974171-1-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Before introducing a new macro with the name RELEASE in include/linux/
thread_safety.h, comment out the unused RELEASE constant in tape_std.h.

Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/s390/char/tape_std.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/s390/char/tape_std.h b/drivers/s390/char/tape_std.h
index dcc63ff587f9..0e3e7afc200c 100644
--- a/drivers/s390/char/tape_std.h
+++ b/drivers/s390/char/tape_std.h
@@ -53,7 +53,9 @@
 #define READ_BLOCK_ID		0x22	/* 3420 REJECT,3480 OK */
 #define READ_BUFFER		0x12	/* 3420 REJECT,3480 OK */
 #define READ_BUFF_LOG		0x24	/* 3420 REJECT,3480 OK */
+#if 0
 #define RELEASE			0xD4	/* 3420 NOP, 3480 REJECT */
+#endif
 #define REQ_TRK_IN_ERROR	0x1B	/* 3420 NOP, 3480 REJECT */
 #define RESERVE			0xF4	/* 3420 NOP, 3480 REJECT */
 #define SENSE_GROUP_ID		0x34	/* 3420 REJECT,3480 OK */
