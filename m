Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57BE27BF91
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 19:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744399301; cv=none; b=cdEtj2/4bKBPvhGjy4iyP0q2sio+R/eQ1gGYime5yz/WJAK7qjM9gzx/lXlPOOpbiYiioR4vzpdJMkcwRYNolAvxPvqei373FXf/zvTWgFFooie4zDsBNx3UkV+Y0deFNSykIfNrtZ+DC4JvBkYwZZp3k13AiKf5crKuEt8gvIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744399301; c=relaxed/simple;
	bh=u+iuOJrnEcrXULnJfyz5zwvDPUArh6DoiEAQ1lEyT/U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OQFLg11EPt2LYR7LUA3CDN8OdLB8bt02ueSP7WlGpArbmQn9iiuYvERGzy+UAcSlGWiIhkQac9lynQ5OCr5vjiqYdIn3ULg4jTfnCT1TBCLWLyk1u314i+8e4PUy/zCrC4fXjXlIJcV01hTkNXdTf2LZgEqnxxd5gFPCZTO0pHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=l9ZzEtMX; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="l9ZzEtMX"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744399296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XOWnKA6+QUzwNDYys8gNgQ6iU2SGzJ/WFzhT3qfkey0=;
	b=l9ZzEtMX781X/NJmZC7P3wyfxp4V3A2kERY+bmcEFN/vAxXGip+vhHPkm9A+HnYiTYQ5kB
	QwWgIz7/VBh0VLDj9fq6ne2qBGPLxrwav6kWen0w2z3A7G66cjDT/DdaXlKxiExytQbz6l
	VRjiMhl1r++y2yZo9smCr2W0s/krS3k=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Biggers <ebiggers@google.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: skcipher - Realign struct skcipher_walk to save 8 bytes
Date: Fri, 11 Apr 2025 21:20:51 +0200
Message-ID: <20250411192053.461263-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Reduce skcipher_walk's struct size by 8 bytes by realigning its members.

pahole output before:

  /* size: 120, cachelines: 2, members: 13 */
  /* sum members: 108, holes: 2, sum holes: 8 */
  /* padding: 4 */
  /* last cacheline: 56 bytes */

and after:

  /* size: 112, cachelines: 2, members: 13 */
  /* padding: 4 */
  /* last cacheline: 48 bytes */

No functional changes intended.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 include/crypto/internal/skcipher.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/crypto/internal/skcipher.h b/include/crypto/internal/skcipher.h
index a958ab0636ad..0cad8e7364c8 100644
--- a/include/crypto/internal/skcipher.h
+++ b/include/crypto/internal/skcipher.h
@@ -67,8 +67,6 @@ struct skcipher_walk {
 		struct scatter_walk in;
 	};
 
-	unsigned int nbytes;
-
 	union {
 		/* Virtual address of the destination. */
 		struct {
@@ -81,6 +79,7 @@ struct skcipher_walk {
 		struct scatter_walk out;
 	};
 
+	unsigned int nbytes;
 	unsigned int total;
 
 	u8 *page;
-- 
2.49.0

