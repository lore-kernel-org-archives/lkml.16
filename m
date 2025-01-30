Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF894431;
	Thu, 30 Jan 2025 01:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738200171; cv=none; b=hQTCoRRlTxw/EJAnK0TjDe+KW5qBOdHHN0DI9xzsFO1QmlkXxDM52jR0H7PvQ+tuKQGz5rr3oPjdZ8cfE26X2hrjvptZkBczl/pFMrKBPyMFkZZumObPyxHbdFfBe+HZomJ+IDMu8t4CwAU5qTavxMa4xVUhaFAWeNlpPqcXqz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738200171; c=relaxed/simple;
	bh=10/hjU2THJhx8Rd3H7aW/3rEfLPJdkpXhx5W+FdJZ4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Lnw1SS+Lv1SBDvoZm7lXkeE1KFv/BnYJyE3qLszEasKIBJ/2EOuaCJgymmDMS8/xVRQK+h0C/6z1lhgGp7XwUsgrNePpa55bMleBhHudgMqno3qmCPrX2eduiJehX2aRJRQCQMyGbKsQDDvR+y2RhVxonZsKkyv3fmhvzZWmHs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bYqCkaP7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bYqCkaP7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 089AEC4CED1;
	Thu, 30 Jan 2025 01:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738200170;
	bh=10/hjU2THJhx8Rd3H7aW/3rEfLPJdkpXhx5W+FdJZ4E=;
	h=From:To:Cc:Subject:Date:From;
	b=bYqCkaP7wCw+S13kpofptAUG5hpAwQK+K9cqbujGa6Jp6gRAoJQMgfXj019BQKSWQ
	 nN5ZGSXS/9pKXf3s9u2Q/BhrwACy0nlXAmObcy1CgLJtr1VtBsTpGfmawDjLUVIEhO
	 T6bO9dCzRUykfUcaba6e1DvDB5VLGH5wz9rsD7pHEV4KYKP5GW4FKKCeIhHTOa5MxZ
	 64sXbcrzOX6ryod9wEfaSJD/9EwpXEajTHBIZ1Nwa6qfsUIUwp/kf1B8ejdArgJazC
	 QD1KO0dYmC81AS5KB4iKvhqltBcF/4hBxJCK8uTsbkNnPArg8VFgumrQR4GtnPLvjf
	 l/uqWXS8bJuGQ==
From: carlos.bilbao@kernel.org
To: corbet@lwn.net,
	willy@infradead.org
Cc: akpm@linux-foundation.org,
	bilbao@vt.edu,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Carlos Bilbao <carlos.bilbao@kernel.org>
Subject: [PATCH] mailmap, MAINTAINERS, docs: Update my email address
Date: Wed, 29 Jan 2025 19:22:44 -0600
Message-ID: <20250130012248.1196208-1-carlos.bilbao@kernel.org>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Carlos Bilbao <carlos.bilbao@kernel.org>

Update .mailmap to reflect my new (and final) primary email address,
carlos.bilbao@kernel.org. Also update contact information in files
Documentation/translations/sp_SP/index.rst and MAINTAINERS.

Signed-off-by: Carlos Bilbao <carlos.bilbao@kernel.org>
---
 .mailmap                                   | 4 +++-
 Documentation/translations/sp_SP/index.rst | 2 +-
 MAINTAINERS                                | 8 ++++----
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/.mailmap b/.mailmap
index 5ff0e5d681e7..ca7946736bc0 100644
--- a/.mailmap
+++ b/.mailmap
@@ -139,7 +139,9 @@ Bryan Tan <bryan-bt.tan@broadcom.com> <bryantan@vmware.com>
 Cai Huoqing <cai.huoqing@linux.dev> <caihuoqing@baidu.com>
 Can Guo <quic_cang@quicinc.com> <cang@codeaurora.org>
 Carl Huang <quic_cjhuang@quicinc.com> <cjhuang@codeaurora.org>
-Carlos Bilbao <carlos.bilbao.osdev@gmail.com> <carlos.bilbao@amd.com>
+Carlos Bilbao <carlos.bilbao@kernel.org> <carlos.bilbao@amd.com>
+Carlos Bilbao <carlos.bilbao@kernel.org> <carlos.bilbao.osdev@gmail.com>
+Carlos Bilbao <carlos.bilbao@kernel.org> <bilbao@vt.edu>
 Changbin Du <changbin.du@intel.com> <changbin.du@gmail.com>
 Changbin Du <changbin.du@intel.com> <changbin.du@intel.com>
 Chao Yu <chao@kernel.org> <chao2.yu@samsung.com>
diff --git a/Documentation/translations/sp_SP/index.rst b/Documentation/translations/sp_SP/index.rst
index aae7018b0d1a..2b50283e1608 100644
--- a/Documentation/translations/sp_SP/index.rst
+++ b/Documentation/translations/sp_SP/index.rst
@@ -7,7 +7,7 @@ Traducción al español
 
 	\kerneldocCJKoff
 
-:maintainer: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
+:maintainer: Carlos Bilbao <carlos.bilbao@kernel.org>
 
 .. _sp_disclaimer:
 
diff --git a/MAINTAINERS b/MAINTAINERS
index 4006434e0155..0b3af06d9b56 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1077,7 +1077,7 @@ F:	drivers/video/fbdev/geode/
 
 AMD HSMP DRIVER
 M:	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
-R:	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
+R:	Carlos Bilbao <carlos.bilbao@kernel.org>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	Documentation/arch/x86/amd_hsmp.rst
@@ -5793,7 +5793,7 @@ F:	drivers/usb/atm/cxacru.c
 
 CONFIDENTIAL COMPUTING THREAT MODEL FOR X86 VIRTUALIZATION (SNP/TDX)
 M:	Elena Reshetova <elena.reshetova@intel.com>
-M:	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
+M:	Carlos Bilbao <carlos.bilbao@kernel.org>
 S:	Maintained
 F:	Documentation/security/snp-tdx-threat-model.rst
 
@@ -11228,7 +11228,7 @@ S:	Orphan
 F:	drivers/video/fbdev/imsttfb.c
 
 INDEX OF FURTHER KERNEL DOCUMENTATION
-M:	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
+M:	Carlos Bilbao <carlos.bilbao@kernel.org>
 S:	Maintained
 F:	Documentation/process/kernel-docs.rst
 
@@ -22018,7 +22018,7 @@ Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 F:	drivers/media/dvb-frontends/sp2*
 
 SPANISH DOCUMENTATION
-M:	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
+M:	Carlos Bilbao <carlos.bilbao@kernel.org>
 R:	Avadhut Naik <avadhut.naik@amd.com>
 S:	Maintained
 F:	Documentation/translations/sp_SP/
-- 
2.43.5

