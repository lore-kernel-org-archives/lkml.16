Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A5027AC34
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 08:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751878125; cv=none; b=F40OStQxAfuFoC4VPWZJiPeirYyy3U8XnJBXgjpPfJP1t64EBIksFh/30ZBz+rmrbnHuv8FlhtNMAudz0GDFpu2L1d917gmT6+3s1qxP50X1zXCLC/X1BUIu7DsZUFQr+eAPZKgCdg0KZDQynKizrJwee/JgnLpoaF5PuU/iXGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751878125; c=relaxed/simple;
	bh=uiIk70uCYwETE2dDCVRHrmM+gZH1tMbl0071RZi0VdY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P+8QbycQ9Vxk7J6I5LCW5pBV6xscF7NiNcXv/97nPJVWnvxpljq95TYTFdxcd/lshltc2mB956uQrO+h+2FH6GwkAn5nla0TOHJPoY7f0lD8w6x6MtRh4D7uyAkqn6IdBBYiPOsSTtwfMV7h9/MyP3nJ5FXVsCvmzHyc9l20vFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KcI49CtW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KcI49CtW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2713C4CEF6;
	Mon,  7 Jul 2025 08:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751878124;
	bh=uiIk70uCYwETE2dDCVRHrmM+gZH1tMbl0071RZi0VdY=;
	h=From:To:Cc:Subject:Date:From;
	b=KcI49CtWXHDjyhTOkMyYB2HvRWc/FzkQodgzcKnxVdaVM2fbDwc9UR/E9g83ZN7r8
	 iI9X85SdKziFouceKFOXI6rp7yglcHiar5ngNx2JAIpG0FMuO97j+8ZSvNKjUPHrat
	 hHnfJBU4lEnCaV+ayx5jMJ4WSbM/cKbG6JZH331Is5/2aHR2rTH0zKrPpcwuCLfwEX
	 7aglVQt7oU1+XOItw7jyxMhn7SxbPmEkbcr73suL0l1r0j0ldU3cknTKwSfMHK52XO
	 KO2pc1gGnNQ6Nb959SpfDB8lMBzKxZKz7OATN9JLarOmwFxgIrBIKfcFAl8fFleoZs
	 PaaS2IbtX2+JA==
From: Chao Yu <chao@kernel.org>
To: xiang@kernel.org
Cc: linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Yue Hu <zbestahu@gmail.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Sandeep Dhavale <dhavale@google.com>,
	Hongbo Li <lihongbo22@huawei.com>,
	Chao Yu <chao@kernel.org>
Subject: [PATCH] erofs: fix to add missing tracepoint in erofs_readahead()
Date: Mon,  7 Jul 2025 16:48:32 +0800
Message-ID: <20250707084832.2725677-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 771c994ea51f ("erofs: convert all uncompressed cases to iomap")
converts to use iomap interface, it removed trace_erofs_readahead()
tracepoint in the meantime, let's add it back.

Fixes: 771c994ea51f ("erofs: convert all uncompressed cases to iomap")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/erofs/data.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/erofs/data.c b/fs/erofs/data.c
index 6a329c329f43..534ac359976e 100644
--- a/fs/erofs/data.c
+++ b/fs/erofs/data.c
@@ -356,6 +356,9 @@ static int erofs_read_folio(struct file *file, struct folio *folio)
 
 static void erofs_readahead(struct readahead_control *rac)
 {
+	trace_erofs_readahead(rac->mapping->host, readahead_index(rac),
+					readahead_count(rac), true);
+
 	return iomap_readahead(rac, &erofs_iomap_ops);
 }
 
-- 
2.49.0

