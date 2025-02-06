Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651451990D8
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864341; cv=none; b=iWW4FrRL+TDtHYFxDzQV+WGB2naG75/7qD1ADWG2EpePJcxMmhAY4eyHdbcfZWWNx6b+gGCeshrX8CyLMTCL2id3oram2ftmuDmNC+hVwh4Dv9FGXYRIT+l465J6Fy8fU/Erf3k8ysQN+BdyO6/hxkzZAztVKzbBH7VlWRwKd24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864341; c=relaxed/simple;
	bh=RNAqustES4OK6p5oN/Vmu6avKZrUeLUvSGhGpBh5hbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AVWCRHvEqS++7zin4gD81zvrMSUbnrtpI9wePZXn4tToiDsUnm0mPdIKdCNz1xfVnFGGwRara0iXkw5jECxmYNitxQEyyDR6FyVpvcadpKbTTHt3sPo9+cvnlYQBBSMx9zGP0p2gBhxnaMxwXrsDa55IUIIBT5b2FbNt2bB7PYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=jL1ziJa9; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="jL1ziJa9"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Ypl6p6JzqzlgTtq;
	Thu,  6 Feb 2025 17:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1738864331; x=1741456332; bh=V9yWL
	LcSqRHRnbYyCxjqer5jNNS7tSduS4eAGnoACHM=; b=jL1ziJa968JPaFM7T7OzN
	Oj+dKrik6T5SCSLPr9wFqGpJwq/c746S0eRJ7R0fUoDg6OoVsnYI08BgOFBI02ys
	X1+ULKoLrfYa8GwFjydy/lavwogE3/BlN69vc4eHATJiqOeAHptWpPAweEcyrRS3
	RAtaF5gsKVLTRRZzrL/ScUt18w9enzjV21Vrjb91qmJhfogXYIIJucfMhvCocm7l
	0asdDHNg8cU+yrE6X9XnSXKFWfu6I/I2+bFn7UhuB9PbKuvSx+/+jrjdcGpnEj1S
	w5U4bpPJ1OnY0vWenKh2sM0A6pPxtOSpCkcKmiIcjxVw05JCySuLh/8R+etbSSbA
	A==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id qal9tX9QDsiV; Thu,  6 Feb 2025 17:52:11 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Ypl6c5zkdzlgTxg;
	Thu,  6 Feb 2025 17:52:08 +0000 (UTC)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH RFC 18/33] misc: nsm: Fix a locking bug in an error path
Date: Thu,  6 Feb 2025 09:50:59 -0800
Message-ID: <20250206175114.1974171-19-bvanassche@acm.org>
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

If nsm->lock has not been locked, do not unlock it from any error path.
This bug has been detected by the Clang thread-safety analyzer.

Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/misc/nsm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/nsm.c b/drivers/misc/nsm.c
index ef7b32742340..185900cdad4a 100644
--- a/drivers/misc/nsm.c
+++ b/drivers/misc/nsm.c
@@ -367,7 +367,7 @@ static long nsm_dev_ioctl(struct file *file, unsigned=
 int cmd,
 	/* Copy user argument struct to kernel argument struct */
 	r =3D -EFAULT;
 	if (copy_from_user(&raw, argp, _IOC_SIZE(cmd)))
-		goto out;
+		return r;
=20
 	mutex_lock(&nsm->lock);
=20
