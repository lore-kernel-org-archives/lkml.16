Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65789202960;
	Mon, 19 May 2025 22:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747692258; cv=none; b=L1FzR2ZB9NT6ByT6mJg4EbyCzt014Ih5bKNNQ4r8NE5GaY1g8svWMnTlj2Kq58hmErUbcbqbU/S85ZNUoncI0ifnL7jlzhaoKF3oZ3SXvrPDdfOZn4BY8N3mUOPQwVHIB28//gFdzTQC//SdILaFkNX9e8hypaoG/Y4DjJ+QSkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747692258; c=relaxed/simple;
	bh=fNEPkugJnkOMsZLUJmv/uGZXGBvNd1qRIe6WHZesVrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b7A+2v0mORua6uS4n50TkogV4wlABUVqDxd9xFha0u2IjchoOkHt8Yuc0UPw8E4wQDVYFkrb9Zd/hxrrHBtCqkgxt8P6S3xyzHPWUH4nrYx5dry+UsnPwIOPVrj97iAmRAQEmpbnXlin2pxFshd5JNZ8QS6+B2U9mroS2rWQyB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ydQaGazt; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ydQaGazt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=DyTNpfQ6hy+fO6GdbJjeMiXT9JtjdP9culqvMbs7IlU=; b=ydQaGaztCGgHtoGF84j9XDnoeX
	ILUrIwYm60dJnYAOxQU/DbMFShDMkl7Usd5bN+LNclA8gzVSoZ32Hh+3dvajhGFQHUiwquAEU8KU4
	yTjLsTmod+0r34H/yuD/mO83YfErMF3FGwnqSW7j+gdCq0OvAnYoQUa3G3QdEmth6p33zMiR+qQlI
	3eNWWzNuE8wLrV2kLNPlRA+7KeR3DcBoo3k083pEyY48QyXE1wEZ847LguEheq/azbnl8zZfaQwmQ
	x1jO6UzqFsjnjyuzeJ1P+AiYuDgRMk7MyFT8n8sRCw45lLsyG2lUuAnBQpPktSF5uHzhWCXQCCmGJ
	45wpYFvw==;
Received: from [50.53.25.54] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH8aj-0000000AhIF-4BC6;
	Mon, 19 May 2025 22:04:14 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] Docs: doc-guide: update sphinx.rst Sphinx version number
Date: Mon, 19 May 2025 15:04:13 -0700
Message-ID: <20250519220413.2914890-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the minimum version number to match both
Documentation/Changes and Documentation/conf.py.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 Documentation/doc-guide/sphinx.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20250516.orig/Documentation/doc-guide/sphinx.rst
+++ linux-next-20250516/Documentation/doc-guide/sphinx.rst
@@ -28,7 +28,7 @@ Sphinx Install
 ==============
 
 The ReST markups currently used by the Documentation/ files are meant to be
-built with ``Sphinx`` version 2.4.4 or higher.
+built with ``Sphinx`` version 3.4.3 or higher.
 
 There's a script that checks for the Sphinx requirements. Please see
 :ref:`sphinx-pre-install` for further details.
