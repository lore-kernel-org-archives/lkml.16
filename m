Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5654288C90
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 17:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744652454; cv=none; b=oDtuw1XA2il58Y5LY1pE6JIE3YVOLVvJ7XVYRrjokgAx+No2DyEtYThQT+6q56NBPyPpHl0fLhovgU+y2a3eIsS9ZEGayjbDfRVm4XkGPfBy3DH4Bp9+/DF+cbd6/QZppoWlqgP09NSAGohyoWToAmrdnwD9jveLFc1QbDl/uJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744652454; c=relaxed/simple;
	bh=RhuBuFuUSgwG0M2hcHNcoi4znVRnMbEzsy4MBOZpuqw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZxYlDq03xSbjgrxRIE9Q8bNdFj1o6KPeRodwgzoIppmAGuKxP5AJcrEjOftukPBD7GIRtLzw8h/17BJmlPTWfXwQ/tL5OpBNBo4p/PKexYPU12ceOnvrVBjIBXl7hBGYB5m7CEkghmj5O+nzr/SSbGgsem8y9D/1ruYXgPJE7E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=h7S8rw4L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="h7S8rw4L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06B47C4CEE2;
	Mon, 14 Apr 2025 17:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744652453;
	bh=RhuBuFuUSgwG0M2hcHNcoi4znVRnMbEzsy4MBOZpuqw=;
	h=From:To:Cc:Subject:Date:From;
	b=h7S8rw4LkSL2yZiK2Jb9RdOq9KyBiHkWAIT9ks4oablT7axSE0QG4bEzXOhZS1a+7
	 wWvnW4T8gciYm82GCGyBLS8tb+MJG2vwrkoavsAfqeUzvQfJnfGODU48THluJ9Zzb8
	 3btivrXpCTIp3/MgluFedhzlDIZbVvDen11h7zHQ=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>
Subject: [PATCH] MAINTAINERS: update the location of the driver-core git tree
Date: Mon, 14 Apr 2025 19:40:48 +0200
Message-ID: <2025041447-showbiz-other-7130@gregkh>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1733; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=RhuBuFuUSgwG0M2hcHNcoi4znVRnMbEzsy4MBOZpuqw=; b=owGbwMvMwCRo6H6F97bub03G02pJDOl/PRZcTNzwNXvtjqcH9gXVNVzXXplyWr3+6beUCau3X LWfUpch1xHLwiDIxCArpsjyZRvP0f0VhxS9DG1Pw8xhZQIZwsDFKQATsf/IMJvdrC9+b1OgwHoV t08d+7QXHvj0uJFhntWKCaf22Nj2F6eKXD65buXL9/9CjQE=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

The driver core git tree has moved, so properly document it.

Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Tejun Heo <tj@kernel.org>
Cc: Dave Ertman <david.m.ertman@intel.com>
Cc: Ira Weiny <ira.weiny@intel.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96b827049501..f19cf0443e49 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3868,7 +3868,7 @@ M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 R:	Dave Ertman <david.m.ertman@intel.com>
 R:	Ira Weiny <ira.weiny@intel.com>
 S:	Supported
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git
 F:	Documentation/driver-api/auxiliary_bus.rst
 F:	drivers/base/auxiliary.c
 F:	include/linux/auxiliary_bus.h
@@ -7225,7 +7225,7 @@ M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 M:	"Rafael J. Wysocki" <rafael@kernel.org>
 M:	Danilo Krummrich <dakr@kernel.org>
 S:	Supported
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git
 F:	Documentation/core-api/kobject.rst
 F:	drivers/base/
 F:	fs/debugfs/
@@ -13106,7 +13106,7 @@ KERNFS
 M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 M:	Tejun Heo <tj@kernel.org>
 S:	Supported
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git
 F:	fs/kernfs/
 F:	include/linux/kernfs.h
 
-- 
2.49.0

