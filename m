Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345BA22068D
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 15:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751212356; cv=none; b=bnRsWEli3SZ3beyXjHceL2rcOvKINkfw7/5DtvS3JMQq7K3RZ+memNAjRu3To9grInFiiutFeZexfPSrtIaQYEOb7GbNMzWiA16eZjJKFNakwbucKPiUrTyB7yMtvpxhybswH3C2ZcAQfUjfOEk0Q4R3r0AeNveIJe8Dyqv3IMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751212356; c=relaxed/simple;
	bh=HZEcNQuMAPc1huW5UIYtjBVUZ1oe7jH2U7IHtg+xsYA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=O0OUg463Wg8Ts9XXQHhh5yOjGpTy/SsRWmbNKiDae10FvmZpu7lBL2tJDR7X8HlJis6ciRL0hogOUcD3z2nak6HCZxeOiUqeJebdbn2wGUs+wEPNCJjrqME35KYkaaFAHLGWG3k+OP5QrfIZUu1UfvB5uJOYOw3gMk+vdH3admg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=r1e1UXhT; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="r1e1UXhT"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751212353;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LYd46AUjSl0YvKbfAVNA8ee8ugw4FGJfEE9ehZKCOPo=;
	b=r1e1UXhTfFBy+rMmFU8Rm4Jq0FsdTd03qO921WCoJnvCdO0As0a/rAxAsADTHHsY+n3uLG
	MME2Q2u3C+YQ2tMGqOsXkgksRLrLQxPp+ec2NniGAAHBOIJ6m+BEFzcIN1i9Bb170WypEM
	KpCVW7bIsUlvhspqPSRw64EOEhFByMc=
From: Wen Yang <wen.yang@linux.dev>
To: Masahiro Yamada <masahiroy@kernel.org>,
	ndrew Morton <akpm@linux-foundation.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>,
	Miguel Ojeda <ojeda@kernel.org>,
	linux-kernel@vger.kernel.org,
	Wen Yang <wen.yang@linux.dev>
Subject: [PATCH RESEND] scripts: headers_install: fix a false positive
Date: Sun, 29 Jun 2025 23:52:07 +0800
Message-Id: <20250629155208.16174-1-wen.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The current implementation only handles C89 style comments (/*... */) in
the code, and there are false positives for C99 style comments (//...).

This patch fixes this issue.

Signed-off-by: Wen Yang <wen.yang@linux.dev>
---
 scripts/headers_install.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
index 6bbccb43f7e7..41722bcc8668 100755
--- a/scripts/headers_install.sh
+++ b/scripts/headers_install.sh
@@ -44,6 +44,7 @@ scripts/unifdef -U__KERNEL__ -D__EXPORTED_HEADERS__ $TMPFILE > $OUTFILE
 # Remove /* ... */ style comments, and find CONFIG_ references in code
 configs=$(sed -e '
 :comment
+	s://.*::
 	s:/\*[^*][^*]*:/*:
 	s:/\*\*\**\([^/]\):/*\1:
 	t comment
-- 
2.25.1

