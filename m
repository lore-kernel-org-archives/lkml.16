Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2AB146D53
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 08:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739088791; cv=none; b=Ls0/1VRJrXAD+FR53psMce4NMyAvSKsrdxxcdofFaV9/vckW1z1zn72t51GoRdNS8GIIU7ah26u5VHlWI+pk+rSrkWU1tYC2YbWGNjlEVTsTSfN4BNVz99HorOIsnQoBjTauSf+/0lWlY8TQSbCNWWu7BJ+GQpulLeun04PkKLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739088791; c=relaxed/simple;
	bh=XmJ6hFd4AqZnPTA12AytxeiboiRNcWpq+HTPWc/wvoc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TdwuGQpBplc8KZjWfclsOck8xSTysifF5JJmMJhuewpAAYbiOnPxglHRe3AQk9RVNpoTrOmfDgwjasYmIu8hhuKWxaWofcgMhhBf9pa0atmqcCzrfg7KxC++HDSzfo/kJ/sklQZ8wZpQHiZaRMJ8Wv6JYPIm5LBoHnb82t3SybU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=AWtbbvoz; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="AWtbbvoz"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739088787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=41wAe+tnVVO2C9ftsR61fEgGhOiIc0Khigau4m7DRLQ=;
	b=AWtbbvozROB/Go5n4MKKs1zFU7v1x2bNIdhq8dN8V0erAWfVO9s725Vh87LV7tbeEX4ypD
	rLT/7SRrX1wIn5+wzv+PHrfcF5snITHdprxw+MBiz4jijptI4Jl7Z1JcizIq6Vk6VtcmMP
	S1jjTEeZVvDQLzpGedK3YQc/2pCdIX8=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Kees Cook <kees@kernel.org>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] alpha: Replace one-element array with flexible array member
Date: Sun,  9 Feb 2025 09:12:57 +0100
Message-ID: <20250209081259.2460-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Replace the deprecated one-element array with a modern flexible array
member in the struct crb_struct.

Link: https://github.com/KSPP/linux/issues/79
Reviewed-by: Kees Cook <kees@kernel.org>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/alpha/include/asm/hwrpb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/hwrpb.h b/arch/alpha/include/asm/hwrpb.h
index fc76f36265ad..db831cf8de10 100644
--- a/arch/alpha/include/asm/hwrpb.h
+++ b/arch/alpha/include/asm/hwrpb.h
@@ -135,7 +135,7 @@ struct crb_struct {
 	/* virtual->physical map */
 	unsigned long map_entries;
 	unsigned long map_pages;
-	struct vf_map_struct map[1];
+	struct vf_map_struct map[];
 };
 
 struct memclust_struct {
-- 
2.48.1

