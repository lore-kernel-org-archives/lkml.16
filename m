Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04F2235059
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746808733; cv=none; b=o9+ydr48vOmqqFkyhOrmRSRpBAHUrjH1RIkqUgbvmnvrq+p6KptDS9SBR1OcJPxfL18r7Gj6ssbJTQurCQGJjnMx6V+uk3kluCof1w3oNFGQMjXXDNVE03jcaibyHPVqjwY5kkviBXdMiEpnLClFVcRWNPFbJBNk2bQmfcnyeIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746808733; c=relaxed/simple;
	bh=9Iop83tVkN6TLPTJ48kV73FWPiLDox8v+XHK5UmF86Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=idpr9gmahN6MGHj9CPqeUF04lTwJfoDZNjsx6bWJYuqUi4sSPn/SMXieHstgGoelIUreuXozGRPPF2JhiZ0ADarto0uPa14T8p3nbbVbrUhPR20GI/6E5/PFc8+I9cyg2leXvG6Nx1YGv3Y2gvCFBJ5NSrNARDdv7vuLx0PlkSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cxs8fDwy; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cxs8fDwy"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746808729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kM5Cn6zHq5ti+9ezEeBk+ms6OE/NRCXX5zfHP0XAkh8=;
	b=cxs8fDwyHGlZq892v+nWpGGWWwGEXLmeXP4/bozufOjUc2gtGUGb6SYJcTwouaKZPisffB
	57NwERaRVIcRUYkD3DeRF/Ot83sh30hAzPB8phyXflmAmZ/WDYK2T1GO3iUkFfuxjzL1F3
	ykIAEYbapW1BpPgBA42aZXwXNdv+Hhk=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-hardening@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] nios2: Replace strcpy() with strscpy() and simplify setup_cpuinfo()
Date: Fri,  9 May 2025 18:38:37 +0200
Message-ID: <20250509163840.171521-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

strcpy() is deprecated; use strscpy() instead.

Since the destination buffer has a fixed length, strscpy() automatically
determines its size using sizeof() when the size argument is omitted.
This makes the explicit size argument unnecessary - remove it.

Now, combine both if-else branches using strscpy() and the same buffer
into a single statement to simplify the code.

No functional changes intended.

Link: https://github.com/KSPP/linux/issues/88
Cc: linux-hardening@vger.kernel.org
Reviewed-by: Kees Cook <kees@kernel.org>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/nios2/kernel/cpuinfo.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/nios2/kernel/cpuinfo.c b/arch/nios2/kernel/cpuinfo.c
index 7b1e8f9128e9..55882feb6249 100644
--- a/arch/nios2/kernel/cpuinfo.c
+++ b/arch/nios2/kernel/cpuinfo.c
@@ -46,10 +46,7 @@ void __init setup_cpuinfo(void)
 	cpuinfo.cpu_clock_freq = fcpu(cpu, "clock-frequency");
 
 	str = of_get_property(cpu, "altr,implementation", &len);
-	if (str)
-		strscpy(cpuinfo.cpu_impl, str, sizeof(cpuinfo.cpu_impl));
-	else
-		strcpy(cpuinfo.cpu_impl, "<unknown>");
+	strscpy(cpuinfo.cpu_impl, str ?: "<unknown>");
 
 	cpuinfo.has_div = of_property_read_bool(cpu, "altr,has-div");
 	cpuinfo.has_mul = of_property_read_bool(cpu, "altr,has-mul");
-- 
2.49.0

