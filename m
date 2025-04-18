Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BA72528EA;
	Fri, 18 Apr 2025 23:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745020223; cv=none; b=LhjyCGS/1zBU09NzGM73cdkQcR3gUm0LJCmEp6iBFWWf1UUgNsVJ+M61B5xIqIf2ej+qKRHTx4FXPN+U6sFtAL2WBvtdQAP6Til5iJMw62Iq/mAdrG0NXOyYWMy3YxpbIl/Ertqp7r+y/QCHfQuoGmgZUdrY1IpBgWSf6bTjAWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745020223; c=relaxed/simple;
	bh=gsQIM27TkZ1MNIKEbPH6FoFNDf1xvq/nh8YFql//+iw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KRUOcrkCrgDAfhmyUSI2DCSRlg9e0Rme9tBMAlRzfWyYhThJpvTrkUqx9cl5x6We+BxjkGdM94Bhr9dmOmrFSMAA6/4QjxFP1NpggX+7liNijgAyYZybnXmwp2d4vt0wsRfh3PmP36EaIyrfCBWnI+Z8/dwRgLyWKuAqfXHbrcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ClLA8TDR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ClLA8TDR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42F2FC4CEE2;
	Fri, 18 Apr 2025 23:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745020223;
	bh=gsQIM27TkZ1MNIKEbPH6FoFNDf1xvq/nh8YFql//+iw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ClLA8TDRpxYThdkU+Ojsv+UTtg9zckmiu4Lg2of/0OyFfMxOH+cBknVwL1cW7Bs2K
	 qNpPWrpI3Gs3rA9VJWv5bp1EZLKsH8zyeVpSRQmcrrG7X/wuSARiD9bSwieJtNIFnz
	 C4gpqu22ufjb1L6fmi1hFBLJzIDNlMs6fGBYqy2ihIRm7/2fyjauHdSnGt7RXzUy9W
	 VbtxVFQwDdfqL+KpiytMqhpEf+vWnuAEVz0UdOje6CE6kREDIs28tE+56tIzkd5kGO
	 TsS/3HtSP9ffpAzhncJDlm67GgF/Pq/caCaJMbK5QZ0SGc0hFI2Cw64vR/YUPEP/wQ
	 BiXSQtsFaprAg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u5vTL-00000003KF8-3C5C;
	Sat, 19 Apr 2025 07:50:15 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] docs: Makefile: get rid of KERNELDOC_CONF env variable
Date: Sat, 19 Apr 2025 07:50:02 +0800
Message-ID: <e5710e43ab5b6ec30ff3d2a27f6de400883b095c.1745019660.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745019660.git.mchehab+huawei@kernel.org>
References: <cover.1745019660.git.mchehab+huawei@kernel.org>
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

