Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A3A1AA1FE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744014226; cv=none; b=tE6X7ogBSKjccQ+82EpBMSBvcX6AZ9xY3XSG1RHJwUAkNs448AM/ko7HFTIeMFFMPn5lgt7cA6W1a2qpqXECJot2/k901enXVLwbh8PHB9SMBaNMa0wfxBR2YVCyVTs7xnoVFVNXWiyb2iN71TjVBklPPlYIJS8PlmITchus1ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744014226; c=relaxed/simple;
	bh=gTK8e1XfS4BWfkRxxIpCzpIg4kO5jqWt0RsRG9KsV5M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H28eE7pdmfbYyI/FKB0FKBCoPYsVqIY7YmZqvy8v5UbLIg2pMXKXHU+GbOvxrCrGA+rrF03FT+Crt7XKBYGaQGoz3ns63xnoHzx829x+ZF1CE4jY1XY6uDLz8WjLZFF8xnMz1Ppa8F4fOoiV0ODMqIOz/Lof+KZYROBNfzFK/b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IjhwgFB5; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IjhwgFB5"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744014211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kIYcMfCxcDbgrdjbytVwAHyym3Acp6ysa9rwtkKANwA=;
	b=IjhwgFB54PY+PS45BCUrL1D/IV8HnDNgSHUvvT88n1vyka8blQldCo+BcDah5+t0Xs8HeX
	lcI5R5GowUtHc2UmdtsWqziYMHd6TZTxddLpM/6zG4m0z9YQ4ObrgMC/gZIUmISodzoH6R
	Fh3dhkI3lDQ5viRFNB4KZaJI0WGFs9c=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: David Howells <dhowells@redhat.com>,
	Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] crypto: x509 - Replace kmalloc() + NUL-termination with kzalloc()
Date: Mon,  7 Apr 2025 10:22:47 +0200
Message-ID: <20250407082247.741684-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Use kzalloc() to zero out the one-element array instead of using
kmalloc() followed by a manual NUL-termination.

No functional changes intended.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 crypto/asymmetric_keys/x509_cert_parser.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
index ee2fdab42334..2ffe4ae90bea 100644
--- a/crypto/asymmetric_keys/x509_cert_parser.c
+++ b/crypto/asymmetric_keys/x509_cert_parser.c
@@ -372,10 +372,9 @@ static int x509_fabricate_name(struct x509_parse_context *ctx, size_t hdrlen,
 
 	/* Empty name string if no material */
 	if (!ctx->cn_size && !ctx->o_size && !ctx->email_size) {
-		buffer = kmalloc(1, GFP_KERNEL);
+		buffer = kzalloc(1, GFP_KERNEL);
 		if (!buffer)
 			return -ENOMEM;
-		buffer[0] = 0;
 		goto done;
 	}
 
-- 
2.49.0

