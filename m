Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2C322F3A4
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 21:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739134857; cv=none; b=pjDKdR7c3jJ64TiZCxpJSaTF+IPvpTmYh809fvy0cAO1vs3gELv/Feij0aHWC7BXy3VYc+oaSuql9Be4vDcPg8R8AFA3vVsRb9GcJEdsSKxDYmqbvUEx0Krk4kwXlC/xLYISRNBEItCEularJNpJlWRD3JlV+/co0FfhMEfIcO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739134857; c=relaxed/simple;
	bh=NHnejRiD4F+bD2f1fFm4I4nrdOgw35XCjt6JvGxyuYo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aAUyfRGEm7BQdiQLm2b3K3c3BOewyj7ckmEdAGqLlS/m9+xoyjwniq+If4hhamAdN7ZNn15OesMBO3wyYOxggBadLGzmkyzfjKW2SSyAYM/eYqGH5IxTu7E1Ta76nGUme5wgrMULheWix5+5S5CYOQGH5fhr2wPsPt2bCItYpG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=inIYdf6P; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="inIYdf6P"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739134852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qIkHZdlJgBI8XSQLEeTxcPGCocchQWHaTTHt7yTbJBA=;
	b=inIYdf6PGGNyyYc8JDFhCUMXsCOokl5OQY/wOPwXtl9PAEhzMjAwpudEuHKasw5jHL/G7T
	Ns2pEW/ls6A4R+0mvhYYoe7vlXBPcQmN7ZLvftQf0R4IUGjKUEIb/9Y3pUDoYiiDWZWCFa
	4e0T404PNDip4xkvhP6tMez7zCxiFtA=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Xin Long <lucien.xin@gmail.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-sctp@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] sctp: Remove commented out code
Date: Sun,  9 Feb 2025 22:00:24 +0100
Message-ID: <20250209210024.5413-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove commented out code.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 include/linux/sctp.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/sctp.h b/include/linux/sctp.h
index 836a7e200f39..812011d8b67e 100644
--- a/include/linux/sctp.h
+++ b/include/linux/sctp.h
@@ -222,7 +222,6 @@ struct sctp_datahdr {
 	__be16 stream;
 	__be16 ssn;
 	__u32 ppid;
-	/* __u8  payload[]; */
 };
 
 struct sctp_data_chunk {
-- 
2.48.1

