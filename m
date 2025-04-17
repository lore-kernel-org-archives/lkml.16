Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A5C33FD
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744881355; cv=none; b=O818yVzQdRKpdmkqgL+QNaqxqJpkO55umKKJdjEFDSrMWcwaO+Savs3g9e7Q8achxNiPoFpkJkcHNvOnR9Zam1dk4dpNcFhfp6vAXweyolrORWvTFyJddRaPuWkYdivzl6uzVdh9IZfYyQwxaUTyWIE72juFRm+WZrYTsz9rCg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744881355; c=relaxed/simple;
	bh=N2GIHgSzgrWo+dQiMNnEPz/L9JLvGId7elPUFX5HPu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A2CMQI5csXPTWsToWEtnXMB3MBaDvA2l1YBJMHXymyICDqS1ac87LA2ecKXCacpW66c63Kwdxb5hjmXJngTo0iCd14lcODnylk1N+U+qr5nXAIXzqlzWyUN181IWoWf9HYrdFvCX5kiUuQ5sBiY21QY00qv/z0QGGy1M/0+IdGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Msw8esWK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Msw8esWK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 714A4C4CEEA;
	Thu, 17 Apr 2025 09:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744881353;
	bh=N2GIHgSzgrWo+dQiMNnEPz/L9JLvGId7elPUFX5HPu4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Msw8esWKUx1w9zLIgmimm+oYQn0xqSPH66gdKQoZo57HNAKqQDyywjpmB8hvMx1eX
	 xhb7nG/VazxdPufKNAqhqetIknc0DTDODLN5dItYOx0wSPHskzmzQxbXVkjkXzIVp9
	 nCN3PT3z7lyFuQHi9z2/mvWfEpA1UXqLRM1/KBf+2ZY123O4mWZZ5BxsQIYoOJX7eu
	 GIVcBTtGwcJmqeE7nnGuJsVL9MAJxeeGi4mKqXIfU3+Zx/sayRbiUt2Tnc9aO1h/sm
	 NFd4TT2ZzQCbxw0Z5o2Re462fgcy6qmN+BmXb+GaSqahEJS5H+LP4vxbiyluVILzGq
	 ONhVXor7oLcsg==
From: Philipp Stanner <phasta@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Stanner <phasta@kernel.org>,
	Desnes Nunes <desnesn@redhat.com>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] misc: cardreader: Return -EBUSY if regions are busy
Date: Thu, 17 Apr 2025 11:15:33 +0200
Message-ID: <20250417091532.26520-3-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250417091532.26520-2-phasta@kernel.org>
References: <20250417091532.26520-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cardreader returns -ENOMEM if a PCI region is currently in use
("requested") by another driver. The proper return code for this is
-EBUSY.

Replace -ENOMEM with -EBUSY.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/misc/cardreader/alcor_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/cardreader/alcor_pci.c b/drivers/misc/cardreader/alcor_pci.c
index 43f08b0db742..8e7ea2c9142d 100644
--- a/drivers/misc/cardreader/alcor_pci.c
+++ b/drivers/misc/cardreader/alcor_pci.c
@@ -124,7 +124,7 @@ static int alcor_pci_probe(struct pci_dev *pdev,
 	ret = pcim_request_all_regions(pdev, DRV_NAME_ALCOR_PCI);
 	if (ret) {
 		dev_err(&pdev->dev, "Cannot request region\n");
-		ret = -ENOMEM;
+		ret = -EBUSY;
 		goto error_free_ida;
 	}
 
-- 
2.48.1

