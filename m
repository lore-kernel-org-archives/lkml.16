Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE9F1D47A6;
	Tue, 11 Feb 2025 05:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739252692; cv=none; b=qok6JFO1WHFJokj6HZp8bVO8338IDfBSMMFetR61MhAbok1LxxoDR0snvMeN+RHglmxn69J5cdTQHiaPYw99gnWvJHi4wQPOCw1adZRAwwr0gGAZmk3b+DKB30lVs+1nFtUkfd5h2myI7tZ/cr9Yq7CRJDfBRbVZtRY5Tcp6ST4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739252692; c=relaxed/simple;
	bh=/5PBuukv+5I1jsUQu1hfqYRBmz7kHMOokwD4BwMfYnI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qRTXUdagykOVxGV0JBnsp+XIrvPbLHLQCaReFf2iSCQSZHq0UesL148hy5bX+/OT52tJOfqVq7PsIeaVfXrtYDO/9zudd1ElbGPsgtQ6RAoCSVdDhcEU48WOUZJG2ff2Nu3fxeEJPHEPH39UG5XENWCvmWZme0F5rb3LpWOwglw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SQyn+laG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SQyn+laG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A8BFC4CEDD;
	Tue, 11 Feb 2025 05:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739252692;
	bh=/5PBuukv+5I1jsUQu1hfqYRBmz7kHMOokwD4BwMfYnI=;
	h=From:To:Cc:Subject:Date:From;
	b=SQyn+laGzDljprxvKeghKMEPmkfwtzJgjtsIMdNqkZ4dIFkUYzUKfFlJmfKCBI68B
	 T+yfJMrR33EJtRkRIR/pXdmNNRDG8b4SAHlUc7Va2OFaz9OXMB1ZELYUSaDk/XCCTa
	 DTXuXF5hLYH6tU8BdODhMLV9P1HchkuabbGx2o3frtKTTaagiL95lxOo4+KVYUNgTj
	 cTUtmP6h12kswZQh5rktzDdfxHmjNdchv2yVwr601eopEuS8y4aWa/9/b6+RUAX3h/
	 3cx1xB5w6A+tKOrSKDJBrK9J1+uFd/KBDULiGxSyUSn9khkCKT5whfkSbWvr8fLop9
	 dkJFT5LxVTSBg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1thj4j-000000079u8-44GD;
	Tue, 11 Feb 2025 06:44:49 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] docs: Makefile: use the new script to check for bad ABI references
Date: Tue, 11 Feb 2025 06:44:06 +0100
Message-ID: <20250211054446.1696826-1-mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The get_abi.pl script was replaced by get_abi.py. Update it at docs
makefile.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202502110736.ZGWaWsep-lkp@intel.com/
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index 52c6c5a3efa9..63094646df28 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -12,7 +12,7 @@ endif
 
 # Check for broken ABI files
 ifeq ($(CONFIG_WARN_ABI_ERRORS),y)
-$(shell $(srctree)/scripts/get_abi.pl validate --dir $(srctree)/Documentation/ABI)
+$(shell $(srctree)/scripts/get_abi.py --dir $(srctree)/Documentation/ABI validate)
 endif
 
 # You can set these variables from the command line.
-- 
2.48.1

