Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20424A08
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747152088; cv=none; b=uRwG8f255gwweOd2n1EAfEd4Jr14x1cvPJgJAWQH8YG/IhR1i0JcSxNnK/g3dMtZB6jeouj0fGHtUdxtSV2ILaiICn27of6oZXnr0p2tn3dcTzSe23Z7spaICWdbx50hk6pMkBnjKEdvIy+aoPIJnv/VYISw0MOarZr/rTcxiL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747152088; c=relaxed/simple;
	bh=HZEcNQuMAPc1huW5UIYtjBVUZ1oe7jH2U7IHtg+xsYA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sTLXc+V4vN57Tk29N2UWnO6n4RudVKblgbcfDvGH5bv9UxdrRbpIISjtvhNoldAFxODsUW9HN5L9BEUSdKdyzrWsrfWo7ON3IiZIDpTvHOkQe2FTaqPAeVYcsVuHKObG/QORIr7MJfLOP+zfyenv8b7leqDTIM4As+uKRyJIYto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MiCNlPR3; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MiCNlPR3"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747152084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LYd46AUjSl0YvKbfAVNA8ee8ugw4FGJfEE9ehZKCOPo=;
	b=MiCNlPR3TuxOb5AH88kG9Z2SC3BFT2uLn2w+oon20/0vjN3K+X9eW/SDUOSYLXS3DsJJKT
	IoG1vxfCoL/oO+BGC8wvWAuSbXLH6kkiTSkVNoWCuzg0WcQ6EMxc2VhKWoh3DPY2YsTR1V
	0PGerIjFbzLVNqyoEaT54hMSQT5yH7U=
From: Wen Yang <wen.yang@linux.dev>
To: Masahiro Yamada <masahiroy@kernel.org>,
	ndrew Morton <akpm@linux-foundation.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>,
	Miguel Ojeda <ojeda@kernel.org>,
	linux-kernel@vger.kernel.org,
	Wen Yang <wen.yang@linux.dev>
Subject: [PATCH] scripts: headers_install: fix a false positive
Date: Wed, 14 May 2025 00:00:56 +0800
Message-Id: <20250513160056.7576-1-wen.yang@linux.dev>
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

