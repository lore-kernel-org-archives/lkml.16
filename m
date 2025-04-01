Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101321EFFB9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 12:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743510559; cv=none; b=OaHsUTg1ZFUJWe3CD/uofWtZa475Xboo+mKemIXC4ncnWG06dy4DohVEuSH5q9DmWZgSGNCMyg7DDGe/sioaodXasX0ecD7Keyo8sZ98NBJnqQfvZPOt3zULe2JVejOjDNxOw5Byvr3rjuTmMYXUTzvKP+Zje3DF156zgxSfg+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743510559; c=relaxed/simple;
	bh=/TBe84Nv855DIzlqljrHMdb04swyr2W1u+PYkAygaNY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bcyv9r8Zylh20/a5ZPN1DRK3xScSlvu9ljXNzse14UEq2oWAWyoBTEHxN575bqTo9u/JWu7TAFgdjXovIfi4nw9TxzpsLEwzvj47HiOW1cCLhK0ZgIrVbNgaz3cz+HP9/oLjKMIr1HCphQpU0WuU8h91I3zvsC6B9sNZlFIZrFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W/tevygv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W/tevygv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E1FDC4CEE4;
	Tue,  1 Apr 2025 12:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743510557;
	bh=/TBe84Nv855DIzlqljrHMdb04swyr2W1u+PYkAygaNY=;
	h=From:To:Cc:Subject:Date:From;
	b=W/tevygvJ5bG54xLStdAdDvuFpP/97m62PI3/ojJ7qwadu6KUdARqryOUY2TtJpVU
	 s1oV9A3pTDEK5aQaOhYwt1rm+WZBe8nhDpR7iB0D09JGTTBcln5gXQZl6aPTURuENR
	 Xw3B6W8gNWg+Jkk1DPXO8xTdaT2UoZ5WKkI1C1ywvtVvM4Msy6BPqYMCJyWpvvKlsz
	 c4hp5JDlgEpGFVgja0LB3iwGh6BgHNcNMPohVO8mbQ2AhZJ2yr21B1Kxp1rh362kQD
	 JZr7BUskn4YrKdhYUeNrBYXjcOCRY6kUhNkw9mhRMFdXTml+hZ+6r9svf/N+WuH9HU
	 djcxUAcGZjW3g==
From: Leon Romanovsky <leon@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH next 1/2] drivers/base: Extend documentation with preferred way to use auxbus
Date: Tue,  1 Apr 2025 15:28:46 +0300
Message-ID: <206e8c249f630abd3661deb36b84b26282241040.1743510317.git.leon@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the preferred way to use auxiliary bus.

Signed-off-by: Leon Romanovsky <leon@kernel.org>
---
 drivers/base/auxiliary.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
index afa4df4c5a3f..248d3508ca0e 100644
--- a/drivers/base/auxiliary.c
+++ b/drivers/base/auxiliary.c
@@ -156,6 +156,16 @@
  *		},
  *		.ops = my_custom_ops,
  *	};
+ *
+ * Please note that such custom ops approach is valid, but it is hard to implement
+ * it right without global locks per-device to protect from auxiliary_drv removal
+ * during call to that ops. In addition, this implementation lacks proper module
+ * dependency, which causes to load/unload races between auxiliary parent and devices
+ * modules.
+ *
+ * The most easiest way to provide these ops reliably whtout need to have lock is
+ * to EXPORT_SYMBOL*() them and rely on already existing modules infrastructure for validity
+ * and correct dependencies chains.
  */
 
 static const struct auxiliary_device_id *auxiliary_match_id(const struct auxiliary_device_id *id,
-- 
2.48.1

