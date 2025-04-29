Received: from spam.asrmicro.com (asrmicro.com [210.13.118.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EB3127E18
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.13.118.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745913056; cv=none; b=d5uW6DbyXDvk2CMcXRah3+8QL9aSeA57PYFMdOSv+hH2+NWu5OI1pFumwxyYzI+914gKgBY+N1lj0UvbZmFhcqceKd+JHyriaihPBIz68N68nI8tjIh6SWtt8R9q5g5VwQYP5bPUkTlRRTBrqQK2kP8D+jOIgeMX/ioKBGKN5RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745913056; c=relaxed/simple;
	bh=Nvb2gPai4A+s/3qme+cxcbZehIbNW24hp2k44LYLMts=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dN/c+BnBLA1HrTrTtBdRdTn4qldLvaeDnYk0Dq/yntkpA90r4Tt2qkQ26xOf2WbFf9AxaucEucgL1hDFTlLCVpGLv79wB5e1v2Xh8oERdCVzRPma0G46fiBd8q+8UzgBXQOKoM7dlvurrQAguWWFRRBS0PRs35aAilm7LeDpFEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asrmicro.com; spf=pass smtp.mailfrom=asrmicro.com; arc=none smtp.client-ip=210.13.118.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asrmicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asrmicro.com
Received: from exch03.asrmicro.com (exch03.asrmicro.com [10.1.24.118])
	by spam.asrmicro.com with ESMTPS id 53T7oTFd037789
	(version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Tue, 29 Apr 2025 15:50:29 +0800 (GMT-8)
	(envelope-from zhengyan@asrmicro.com)
Received: from localhost (10.1.170.252) by exch03.asrmicro.com (10.1.24.118)
 with Microsoft SMTP Server (TLS) id 15.0.847.32; Tue, 29 Apr 2025 15:50:32
 +0800
From: zhengyan <zhengyan@asrmicro.com>
To: <gregkh@linuxfoundation.org>
CC: <arve@android.com>, <tkjos@android.com>, <maco@android.com>,
        <joel@joelfernandes.org>, <brauner@kernel.org>, <cmllamas@google.com>,
        <surenb@google.com>, <linux-kernel@vger.kernel.org>,
        zhengyan
	<zhengyan@asrmicro.com>
Subject: [PATCH] binder: skip dead binder_proc during binder_open
Date: Tue, 29 Apr 2025 07:50:30 +0000
Message-ID: <20250429075030.305-1-zhengyan@asrmicro.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:spam.asrmicro.com 53T7oTFd037789

During binder_open, the binder_proc list is travesed to check
for the existing binder_proc instances. binder_proc objects
are async released in a deferred work after binder_release,
and may remain temporarily on the binder_procs list even after
being marked as dead.

Without checking the flag, binder_open may face a crash as
"Unable to handle kernel paging request at virtual address
dead000000000140"

Signed-off-by: zhengyan <zhengyan@asrmicro.com>
---
 drivers/android/binder.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 76052006bd87..43ab4350e589 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -6041,6 +6041,8 @@ static int binder_open(struct inode *nodp, struct file *filp)
 
 	mutex_lock(&binder_procs_lock);
 	hlist_for_each_entry(itr, &binder_procs, proc_node) {
+		if (itr->is_dead)
+			continue;
 		if (itr->pid == proc->pid) {
 			existing_pid = true;
 			break;
-- 
2.25.1

