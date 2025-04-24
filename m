Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8252CA8;
	Thu, 24 Apr 2025 00:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745453834; cv=none; b=Ldt355qhURPtFagqVPcm5r1wPY29c35WBGM092ZnwGplKAqw3fEeKZELacvdRJX58DNlZYp/U7uy2nBHWlPy6JssBMD76LER4QzgyloYGTxupCotETECN3iRaaAleUwkjEovzBQwcdgTL8oyKU17P7hgLOrim4XgkjOXRZr401g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745453834; c=relaxed/simple;
	bh=BsaZ64PVzTBAzYDESPUe/sVzLjn1bK7hyZzbcqqS2b0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WrTsETHQmncSAa572LcAGrEouaV5oAjcHsn8lOQ8lWJwJSPZog5pPG9AM7fBjMmldNVKpZv6Ht0tdFrvrxKzeX6KQQURQhh8UaqUrexhkscIh9EPFndREBY6Sa9LfCSa+KI1JVxlqiNypLQVTVmX86Waf1Ko/pMPuLuBpNWzOh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QLO5xxzd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QLO5xxzd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B410EC4CEE2;
	Thu, 24 Apr 2025 00:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745453833;
	bh=BsaZ64PVzTBAzYDESPUe/sVzLjn1bK7hyZzbcqqS2b0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QLO5xxzd9NkoVmYoxxpYGBLOYZCqFUpaLUC00lSTjs2jMzxoXqn8cVfy3aZifVQuc
	 GT+ynAAgoUPKEEDu+e6VeRdOneBnRkClpl6/iRPRgHFyrxDm7B3/MAtfZgzgfgY46Z
	 /meXSWkrGGcq1yYGnMyOPm/+hRFcEFChl+b10HiwUUWQh5zh9G1k2YHJRE3J3epqYA
	 pMeQb57GAvxDRwn/2FKd+PAPaiYZU7gyfAo37hgu6WY9RQv9oG+xfxbc8rsmmv97rX
	 Y9+FzHqm8WZvaCTzlFr199vb/LZsOw9R28u764zRxiJLPQnOKH1GpW1faVqZAx5OP+
	 nI2Ul6B7PLXhA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u7kH5-0000000049T-1zSl;
	Thu, 24 Apr 2025 08:17:07 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v4 1/4] docs: Makefile: get rid of KERNELDOC_CONF env variable
Date: Thu, 24 Apr 2025 08:16:21 +0800
Message-ID: <88be0fc288598c30fbedb9cc230b2a7ed28225a2.1745453655.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745453655.git.mchehab+huawei@kernel.org>
References: <cover.1745453655.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

Despite its name, what's there is a set of Sphinx arguments that
are passed to sphinx/kerneldoc.py:

- kerneldoc_srctree: location of the source tree;
- kerneldoc_bin: external script to excecute kernel-doc

Drop it, and just place the values at the already-existing
ALLSPHINXOPTS variable.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Tested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 Documentation/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index c022b97c487e..a006c7681412 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -61,8 +61,8 @@ endif #HAVE_LATEXMK
 PAPEROPT_a4     = -D latex_paper_size=a4
 PAPEROPT_letter = -D latex_paper_size=letter
 KERNELDOC       = $(srctree)/scripts/kernel-doc.py
-KERNELDOC_CONF  = -D kerneldoc_srctree=$(srctree) -D kerneldoc_bin=$(KERNELDOC)
-ALLSPHINXOPTS   =  $(KERNELDOC_CONF) $(PAPEROPT_$(PAPER)) $(SPHINXOPTS)
+ALLSPHINXOPTS   = -D kerneldoc_srctree=$(srctree) -D kerneldoc_bin=$(KERNELDOC)
+ALLSPHINXOPTS   += $(PAPEROPT_$(PAPER)) $(SPHINXOPTS)
 ifneq ($(wildcard $(srctree)/.config),)
 ifeq ($(CONFIG_RUST),y)
 	# Let Sphinx know we will include rustdoc
-- 
2.49.0

