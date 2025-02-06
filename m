Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760081AB6C8
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864362; cv=none; b=FHrtnGIXE9A4K7a3J0lXrhLz7KSWst9mHqGHRscw2hhIBfQvP+N5kTatuqxdRg4KeWKJP17cDmzqB7diGHv59vQP7OVsEhqoq6KVxCiq7ywCPjnj3yGsWaDX6g/gm73WpMgtYshvUJ0OLlqsbAQJN63C+UVX2G41v9euFMCP70s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864362; c=relaxed/simple;
	bh=1XhyyCCvHVGrgc2qZtzstVFnnuc2NyPCbJs6DX26leU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aU0KaBbiuX745gQlSMeSsfjsw2H5Qy9vKuLnTe2B53GTQy1lqb66ovhoE7Szl5x1BON1iOC7cqVH9DCuRZfoFOEiwZtEpu8dxknUIhLOAYgbIZpzXOtYxCMrwBjeuu325j20AVKGy6DPh9Dmj4N+HlRU9cqMQguX74Od9ICfrso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=gcR7aD4V; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="gcR7aD4V"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Ypl7C6MgkzlgTv6;
	Thu,  6 Feb 2025 17:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1738864354; x=1741456355; bh=3R22f
	ZRWf9R9uo/otMDq30qkrxjKCLk2WY+RvkyRibQ=; b=gcR7aD4VrhcP29h+PeFOw
	1l71lAnu1nJfTTo+6nwdgwU8ISKksf+iViGKN7TwQAiccCXijZEFtf1o3+zPXX7j
	QdJ8uyIHcKjD2KBD2YzXRW9HFSeBEes1+bY81I7zU29ojLBf0656X9eLk5jW/APF
	kYKCz7QUe6Kl4f6gnnE7r+YXle7tv5vw9WLejDrup2BYAye1/6qt0mpT34R3tsIa
	chohLkhs1bCZ0rEEtfpyMP4LMxE9yiCfVyJHT7rSOCGaBlV2aPpMmK4OphWXdRSV
	EAu4srlQSo0cxORfS/6EtMBbE5xoBhr/etOw4FMDa1GvaN1igXBiKmDnhev0tdqS
	w==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id NbPqWYJZofjK; Thu,  6 Feb 2025 17:52:34 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Ypl742vPTzlgTxr;
	Thu,  6 Feb 2025 17:52:32 +0000 (UTC)
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
	Leo Yang <Leo-Yang@quantatw.com>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH RFC 26/33] mctp i3c: Fix locking in error paths
Date: Thu,  6 Feb 2025 09:51:07 -0800
Message-ID: <20250206175114.1974171-27-bvanassche@acm.org>
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

Only unlock mi->lock if it is locked. This bug has been detected by the C=
lang
thread-safety analyzer.

Cc: Leo Yang <Leo-Yang@quantatw.com>
Cc: Paolo Abeni <pabeni@redhat.com>
Fixes: 2d2d4f60ed26 ("mctp i3c: fix MCTP I3C driver multi-thread issue")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/net/mctp/mctp-i3c.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/mctp/mctp-i3c.c b/drivers/net/mctp/mctp-i3c.c
index d247fe483c58..360eb6490483 100644
--- a/drivers/net/mctp/mctp-i3c.c
+++ b/drivers/net/mctp/mctp-i3c.c
@@ -112,7 +112,7 @@ static int mctp_i3c_read(struct mctp_i3c_device *mi)
 	if (!skb) {
 		stats->rx_dropped++;
 		rc =3D -ENOMEM;
-		goto err;
+		goto free_skb;
 	}
=20
 	skb->protocol =3D htons(ETH_P_MCTP);
@@ -170,8 +170,11 @@ static int mctp_i3c_read(struct mctp_i3c_device *mi)
=20
 	mutex_unlock(&mi->lock);
 	return 0;
+
 err:
 	mutex_unlock(&mi->lock);
+
+free_skb:
 	kfree_skb(skb);
 	return rc;
 }
