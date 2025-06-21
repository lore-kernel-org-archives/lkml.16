Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E656526FA4C;
	Sat, 21 Jun 2025 19:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750535761; cv=none; b=C/ezq5Vmgj54mU3Fj/GcFqQQdRTa9m5iejYHtz+c49WOC3fwmcjmKpZE/1KJ4HczS1dIFOsP9MorQMoy/uiIoWGNxgwUL/viSH43L75UV8diLuwrKgL3dLVAfECq6NH9nmoXjQDebaMTUZG0AdK6bX5tWzNMQ002GQV123XUIeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750535761; c=relaxed/simple;
	bh=9sv3o8O8M0IyOR5wJkoSEusaPecRlQcEL5SoMo0iJ7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A6fPriBHR4MiOXCPWlsJdgd4ehsdA0D8KBtSIb8rdXKyTPFbq4rM0nNxSNN9BA+158Sa+S7cS7c2OQ9473SFI/Qbk5oTFTHxVNl48RBtCY8d0Ur4aAclfq1bxGg23GDRIKsMTQGGzJ5rd4QSG3h8VtcSfcTxJqFi04R0hVU4MDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hdy63fv+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hdy63fv+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CE8EC4CEF2;
	Sat, 21 Jun 2025 19:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750535760;
	bh=9sv3o8O8M0IyOR5wJkoSEusaPecRlQcEL5SoMo0iJ7A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hdy63fv+uBZEkzeaRx7QEBWeREgt6HEubqnd8S7382ZCpNHgZU+n7MRc1S9pmuJsh
	 /UQ+n0h+QGJWkeB5vDrjHcYCHFt+LSF8CfcZ4CQePWPtTb2amytfhVCx/XnSd4JfRk
	 A19cROT4weSGVyDTs3MQ6VaGRgJzyOLHPearF6J3rU7ySWqAdrPX+0DomYy2SJwfG8
	 8r7IEmnkDBr1yhu8S//asWe7CEX32aBt/P/ad0wCO7LUaoV0BKFKFaUS2nLhtQUf49
	 NW42sOl/NCkyLV/Gc7V4xdF8bPKKsvzIMRxkKY1N2p3y0i9KR4QfciXmf2nLtTTVh6
	 VdVfdTNdXYaZg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uT4Ji-00000000e3g-2Upc;
	Sat, 21 Jun 2025 21:55:58 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Breno Leitao <leitao@debian.org>,
	Donald Hunter <donald.hunter@gmail.com>
Subject: [PATCH v2 02/15] docs: Makefile: disable check rules on make cleandocs
Date: Sat, 21 Jun 2025 21:55:41 +0200
Message-ID: <e4ad47a238cffc8659786bcfdba4126f08522035.1750535171.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750535171.git.mchehab+huawei@kernel.org>
References: <cover.1750535171.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

It doesn't make sense to check for missing ABI and documents
when cleaning the tree.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Breno Leitao <leitao@debian.org>
Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
---
 Documentation/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index d30d66ddf1ad..b98477df5ddf 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -5,6 +5,7 @@
 # for cleaning
 subdir- := devicetree/bindings
 
+ifneq ($(MAKECMDGOALS),cleandocs)
 # Check for broken documentation file references
 ifeq ($(CONFIG_WARN_MISSING_DOCUMENTS),y)
 $(shell $(srctree)/scripts/documentation-file-ref-check --warn)
@@ -14,6 +15,7 @@ endif
 ifeq ($(CONFIG_WARN_ABI_ERRORS),y)
 $(shell $(srctree)/scripts/get_abi.py --dir $(srctree)/Documentation/ABI validate)
 endif
+endif
 
 # You can set these variables from the command line.
 SPHINXBUILD   = sphinx-build
-- 
2.49.0

