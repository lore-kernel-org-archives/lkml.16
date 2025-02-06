Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0711C5F13
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864373; cv=none; b=SjYHEseqQOxOTyMvOHWXE7iDMZgunIGb87jL8Uf/hJHrFZyxre9gmGBIIbWjl+iQOXN2JJKTySkVI21Oq6hG0FldQbjiOELp9Xl+7VCWX1iqpHYcYAVZqpk9Q23Xf8CNELSUnAMW6Spq/AkIfKTAJPy7NQ9wgem2a7u9EPCKW+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864373; c=relaxed/simple;
	bh=t0BKH9JUWuwUoE0B/CSvPZGnFc9zHFuc/bDnB+UaaIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cXTUsfhJQGaRQnY012Ea5GQ4gl8aywNGRpz/N4wA0Z3O+5WOMJHl3e3t/vMZSodjCt1jDWlg9V5eGjjMcjISQIqJsCknvun16ALp0F2M9cXPEd8wmYQl1BwX/bF33yr1VXpTxzw1wlagmoVfOXP/T4T8PQuPg+YC9i2roqGP4PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=KikBZb6l; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="KikBZb6l"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Ypl7R0nD7zlgTwl;
	Thu,  6 Feb 2025 17:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1738864366; x=1741456367; bh=f2yGn
	R8ksZ8x8mQ8hGfSTPQ0nfcJ7g5t7a6KHnONuB0=; b=KikBZb6llXZlJR9dK22EA
	/SqAj9rsoL/0ZChB2lIcF4BbKSwGTcq4RDvQX2uzrntqw2+ckXTVCeOiv2v8jtTj
	d8WGMAVDAvaRMKKjwYkHhqxzKdlZU7cyit6pWxEDT3JI9SH8T/4OmUR+u4Ya7U1L
	FBoRJPDVqab8NG8ItzsSiiSHcUHqvrQe0Hymw3BjAyPcHkA4YvcvViOb/aa8fw1p
	CFEgUJUNtqkzCoxpHSMzkjloDzzZm7J9dgzVjUrtrll5Y0/QYYwGPYCLMulEXxik
	IPrMuhar1zo83CVk+AZEO6AQOaBQFGE0oIhv22GfONNMaCkFuH0LIjLxrZEYhp62
	Q==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 1KBecnOWfRL3; Thu,  6 Feb 2025 17:52:46 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Ypl7H3kK6zlgTy5;
	Thu,  6 Feb 2025 17:52:43 +0000 (UTC)
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
	Naveen Mamindlapalli <naveenm@marvell.com>,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH RFC 30/33] drivers/net/ethernet/marvell/octeontx2/nic: Fix locking in an error path
Date: Thu,  6 Feb 2025 09:51:11 -0800
Message-ID: <20250206175114.1974171-31-bvanassche@acm.org>
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

Only unlock pf->mbox.lock if it has been locked by otx2_do_set_vf_vlan().
This bug has been detected by the Clang thread-safety analyzer.

Cc: Naveen Mamindlapalli <naveenm@marvell.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Fixes: f0c2982aaf98 ("octeontx2-pf: Add support for SR-IOV management fun=
ctions")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c b/drive=
rs/net/ethernet/marvell/octeontx2/nic/otx2_pf.c
index e1dde93e8af8..6cd599e12f69 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_pf.c
@@ -2517,7 +2517,7 @@ static int otx2_do_set_vf_vlan(struct otx2_nic *pf,=
 int vf, u16 vlan, u8 qos,
 	config =3D &pf->vf_configs[vf];
=20
 	if (!vlan && !config->vlan)
-		goto out;
+		return err;
=20
 	mutex_lock(&pf->mbox.lock);
=20
