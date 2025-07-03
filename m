Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A221289E23
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 17:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751563263; cv=none; b=oTXrGRinr1Njqpyk0lcyTVWz9q+U1Jr/fQxMkl3VNGl88eQzAlsroQgZauNDdGriOlmdZb+qIQqwRktxQhKJM5gxbeqR9pfSflSaD1VCKOrujqTusBpvXg1whJm1w/skQ/Twc3WbVU9+7igvDWW81AsMfkw1bhUoM0136joyF9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751563263; c=relaxed/simple;
	bh=vPDISl6g5NAEE77KMXZjR8RjrfgvmCsHGDrvYGyHqjo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NlG37Ud8K/W2Bxo+e0X5m5uffpzqoIwux5PPrYThlC3SAHkx2F6gZ/Z34u1IVWxsaFPylBPs4YQzcFiVUIGukcZdrO/HBCeEvchAarKugabA7CDU+YtD9vWyfMDxggf0ZAn99c829FwDM1aYntnBXVNXlJ6R5mekwfZ7WrVBwmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=he8awb9p; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="he8awb9p"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751563249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rBaauVU/2eqVg/IBff0Zf0cOYUFCWODEuFnTMq8cS+Q=;
	b=he8awb9plbq9DFTpyr14nwlbX5WEp2zlR5FdoAVvjO8oTV+9deiVZpszeN3Jo5B7eUsr71
	5KC5jP7TrP0eTfnydp/z691c6B2T9ccxDtBS1fiG/goVl3P45469tzlVxuShl7GWOM08FJ
	wj37Y+m8bkD0SRcoAgr8SKTwRUgDWkU=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nick Terrell <terrelln@fb.com>,
	David Sterba <dsterba@suse.com>
Cc: linux-hardening@vger.kernel.org,
	Thorsten Blum <thorsten.blum@linux.dev>,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: zstd - replace zero-length array with flexible array member
Date: Thu,  3 Jul 2025 19:19:34 +0200
Message-ID: <20250703171933.253654-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Replace the deprecated zero-length array with a modern flexible array
member in the struct zstd_ctx.

No functional changes intended.

Link: https://github.com/KSPP/linux/issues/78
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 crypto/zstd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/zstd.c b/crypto/zstd.c
index 657e0cf7b952..c489976c3e8b 100644
--- a/crypto/zstd.c
+++ b/crypto/zstd.c
@@ -25,7 +25,7 @@ struct zstd_ctx {
 	zstd_dctx *dctx;
 	size_t wksp_size;
 	zstd_parameters params;
-	u8 wksp[0] __aligned(8);
+	u8 wksp[] __aligned(8);
 };
 
 static DEFINE_MUTEX(zstd_stream_lock);
-- 
2.50.0

