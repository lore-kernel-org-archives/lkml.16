Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FA02045B7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 19:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744830626; cv=none; b=hrUGa6jBdu/lXu0wiyNWvnt+VzVyFcCE36aynt6geTDUc8fcWTiRgbSbPT+m/B+eBPyZWk7BNKIZwrn8YtjMPgc3bS0bN9Uh7zRMTac8WQcnaQ77+83WVnlLK2hQBHsjMI6bwv3Tbe3kvYf9mW59q1+d+WclK5k6C+v4G4k21Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744830626; c=relaxed/simple;
	bh=NYcXxrwtogTaNVEDhGFmHHFJqW4cwC8+ZiQeJ7XxKfc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L9EesJjuPCa34w0tpdjohSec/4YoEbT32qiaYrSZs397miC0AJ+PyGyuCIpbYO4Vfj9IRgNds+OxtfUBZiY6w9GG9mRyHIeF824AmliM4rjZDMgbg4EfirnjCpaRT1yRLXgLj4rCFtXQ1qbUyvP9YVHMUiO23RZKi/O3LUJubg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FTLN0vhH; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FTLN0vhH"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744830620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ah8gXRejPfDI4sv7sqjLt/LNTQ/T0TzBT0ooaVXKL8c=;
	b=FTLN0vhHYwuWObPszCflRy8pJJ3dCNL0xSurgNG/cX0OpdICaaiEHVtv/ogsMjk3i76nbu
	Dx60Gbrwp1fkKy+tlDthZXn4g8/k6XU5EyE4NMEQIH3l5J3pUAUv9HedCosrkFbNNa9NwZ
	vqoj8iWDBaTPuZHZz5c7Xn6SMGqtumE=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] nios2: Replace strcpy() with strscpy() and simplify setup_cpuinfo()
Date: Wed, 16 Apr 2025 21:09:07 +0200
Message-ID: <20250416190908.15263-2-thorsten.blum@linux.dev>
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

