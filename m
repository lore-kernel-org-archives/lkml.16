Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF2F2C9A
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 13:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738415457; cv=none; b=bnJvN0D4LQQLkBZTMO7o8Ryn2aSzabbinGlnuj9U3fisV04hDK8de8x8Q7ynBF5kf3IxAKk5I26jWwsxqYqEIhEnmxQkjMVCSCGX9J/eS8/5fBNgN4jsK3p3gf2i5YZ7m8GCmRLA0dBkIHzPr7GlfwWzzolUO3aOTBAhRnSDgtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738415457; c=relaxed/simple;
	bh=GSPMiHQFLRn1sykkExmdsR/H1Kz10nJiE0JQc3sH3Sc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DsTe/Xy9h+vFX38Ffqr0+lXmJtJrC22E+3aqKhzr+Q5vJhr9+XTXzSi3N1ZCOlRi/4HMg6hqu8ZUteZRnxscfjvA5ZEQ9FqkEXReN5vio0qSMu+DYSvrYnxQWbzz3JlHipEriKnkV5RcAviHcYMXncCQc6AHo0dG10Gydn4MgD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=H1m0riW+; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="H1m0riW+"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738415452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kVADjHQ66+lD5ys/3mo3OSZ7YIMndlbjWLQRpPJ33bs=;
	b=H1m0riW++oKDVG7BT05ZJ5aO5ByYeqFi15tZ4j6sfZDLeItCDHGMPurN2SR0tNFOQIGsU8
	0sbk1apg7E/z6yXo9o2zKrgkn7MmmuNiOYR2kUczgQu+iZ6RMb8LIos6QSk3XEtZRYpq0Q
	NXYrtrpNt4UajSgv6jwDnn2a7TqrmfQ=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Yazen Ghannam <yazen.ghannam@amd.com>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	James Morse <james.morse@arm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Robert Richter <rric@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] EDAC: Simplify return statement in dct_ecc_enabled()
Date: Sat,  1 Feb 2025 14:09:54 +0100
Message-ID: <20250201130953.1377-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Simplify the return statement to improve the code's readability.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/edac/amd64_edac.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index 8414ceb43e4a..1f106b4fafdf 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -3355,10 +3355,7 @@ static bool dct_ecc_enabled(struct amd64_pvt *pvt)
 
 	edac_dbg(3, "Node %d: DRAM ECC %s.\n", nid, (ecc_en ? "enabled" : "disabled"));
 
-	if (!ecc_en || !nb_mce_en)
-		return false;
-	else
-		return true;
+	return ecc_en && nb_mce_en;
 }
 
 static bool umc_ecc_enabled(struct amd64_pvt *pvt)
-- 
2.48.1

