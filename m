Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0D3233155;
	Fri, 20 Jun 2025 08:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750407114; cv=none; b=k1vMfgXubEGVaN+x+PC3oYJWAfgqGVQ4b76W0aFJEtY7QkK/sMgnepxAQYUgGU+RxoQzyGJ/bTUKhG8sjeXxfvmxys9uWRZ0tXvAkm6n0ODX17qgk73Z7I7+tA0ncoToGuPP0nfso2U71ugyxWna/cOzGwhe2iL2cipDGaGlsgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750407114; c=relaxed/simple;
	bh=9sv3o8O8M0IyOR5wJkoSEusaPecRlQcEL5SoMo0iJ7A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sp3xFBFPIxN3ysuUVzSkqo5j/3qNmtozaYKf1JEU7Dn/3UZzjlzjP/0LiBot+RWbqZ9mDZ57/ytvybqmhT8C2QoebnUF2uuIdWXL46QayljJyA0Rk6L6DTsqlFOfA1tW4suZlPE28pygK3szrmErxPEP7lnvPVD1VSgvcdStRIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aCHDGw9c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aCHDGw9c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C98F5C4CEF4;
	Fri, 20 Jun 2025 08:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750407113;
	bh=9sv3o8O8M0IyOR5wJkoSEusaPecRlQcEL5SoMo0iJ7A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aCHDGw9cy6UhOjC3zruGzQFc4XAmAHl+VJTOwHDTUCvwDR6mD4oySGu70XhlZuQpF
	 Q61cJvFHmCD+yf4yG6YpioNJu4LlwD+oj8msZXmvFN1c6l+ZxrF8IRZ8DaIepmx0uI
	 bNVcoNEdh0Rn4KFpIUjVmH3CxSrJs+ehA/oOIo/LT+oUgvaHErOv09FzYp+vAMyQTf
	 ucIaZPjuxKXcgGTF2ODls1d8eCla5n7+ivA0l55qwNyWhw/cvXvmutWDHK5ACgXNdj
	 b+G9WRJX6r8M3ZxwWGuiLMPjmZuO4dLBNt/Bo9jo/Bdu+VyJyDliNamVLCiLSAFkFn
	 m+vPnXDOvM81Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uSWql-00000004TWr-3SYV;
	Fri, 20 Jun 2025 10:11:51 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Breno Leitao <leitao@debian.org>,
	Donald Hunter <donald.hunter@gmail.com>
Subject: [PATCH 2/6] docs: Makefile: disable check rules on make cleandocs
Date: Fri, 20 Jun 2025 10:11:42 +0200
Message-ID: <e4ad47a238cffc8659786bcfdba4126f08522035.1750406900.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750406900.git.mchehab+huawei@kernel.org>
References: <cover.1750406900.git.mchehab+huawei@kernel.org>
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

