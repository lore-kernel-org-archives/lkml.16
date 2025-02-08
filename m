Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7C319AD8D
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 04:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738989839; cv=none; b=TvnOYIKrrq1CZZGD805HDvuKTrQn9FEG0pBv+1YyoGYBR5B/+b1GNRZJ5Zk/ufmPsDnlckeIpyteskEPjAiHw3dlfCyIHScAs6InA2SHf7WMkSmJOf0ZAZWRq0PaEfOfy0c5p9S+UfkMfpLsPR2F96mI2YxZFBdQbqJfCR1Xxks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738989839; c=relaxed/simple;
	bh=RAIW+iDs9zxVkhD6+sbiBMYg9qCvDbxk2xSHgtPz88w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YTcmIQU9VmJJzsHNY2nuso9oMbG6t8QPnP/J5ka9zpxfxqUjY+k8mVFiWz9f2N+olx3unOOa+qktXmPQiDkViLcazFSNUnYryA3XK3sKGPGHGD7XVD5ov8yflY9shnrYGRZI9DHPtpbTAA42cStMxsIH38hxVjbCTaXAtwVuBb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=IAMqBFE3; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="IAMqBFE3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Ayvo8/vLDNT6Ec5BLLSC1kVt5dkPixmTlkh7aMaGK80=; b=IAMqBFE3rVM1gneyTfiNhkbLQ5
	mFubTkjU6YdVUtTXVnGHNTA5OlmcSfGF0umKB6I3D2YV6EsVW2limym+2Elfn3s1lE8ZPQtjzMSCw
	zs5tSfcltymw6I4xOr9jz5Ul3wVYOTtzsAt4PW9BQbzHzOEsuKrqOYJwUE6lCLX+29y3r0rpU30C5
	OUJe6R0lAS7SPdhNywIBiEnEyK6peuKRFGxXzO0gfj+oLtxFFtrpeVBsyLRyrS0qBxmvjQg7h8g4C
	RrtcXwzCsQGKoA6vC5CFF2YdHx6EwVJUkoCD7aDvES8Oh7Gz/6rc3gaarLWzj59m5gQXH3ng1U932
	3YY+88OQ==;
Received: from [106.101.136.205] (helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tgcgz-006GAG-CU; Sat, 08 Feb 2025 05:43:51 +0100
From: Changwoo Min <changwoo@igalia.com>
To: tj@kernel.org,
	void@manifault.com,
	arighi@nvidia.com
Cc: kernel-dev@igalia.com,
	linux-kernel@vger.kernel.org,
	Changwoo Min <changwoo@igalia.com>
Subject: [PATCH 2/4] sched_ext: Include enum_defs.autogen.h from common/common.bpf.h
Date: Sat,  8 Feb 2025 13:43:30 +0900
Message-ID: <20250208044332.492494-3-changwoo@igalia.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250208044332.492494-1-changwoo@igalia.com>
References: <20250208044332.492494-1-changwoo@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update common.h and common.bpf.h to include enum_defs.autogen.h,
so C and BPF code can use HAVE_{enum name} macros.

Signed-off-by: Changwoo Min <changwoo@igalia.com>
---
 tools/sched_ext/include/scx/common.bpf.h | 1 +
 tools/sched_ext/include/scx/common.h     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tools/sched_ext/include/scx/common.bpf.h b/tools/sched_ext/include/scx/common.bpf.h
index ae717f4d6ede..f1caf9fc8f8c 100644
--- a/tools/sched_ext/include/scx/common.bpf.h
+++ b/tools/sched_ext/include/scx/common.bpf.h
@@ -18,6 +18,7 @@
 #include <bpf/bpf_tracing.h>
 #include <asm-generic/errno.h>
 #include "user_exit_info.h"
+#include "enum_defs.autogen.h"
 
 #define PF_WQ_WORKER			0x00000020	/* I'm a workqueue worker */
 #define PF_KTHREAD			0x00200000	/* I am a kernel thread */
diff --git a/tools/sched_ext/include/scx/common.h b/tools/sched_ext/include/scx/common.h
index dc18b99e55cd..1dc76bd84296 100644
--- a/tools/sched_ext/include/scx/common.h
+++ b/tools/sched_ext/include/scx/common.h
@@ -16,6 +16,7 @@
 #include <stdlib.h>
 #include <stdint.h>
 #include <errno.h>
+#include "enum_defs.autogen.h"
 
 typedef uint8_t u8;
 typedef uint16_t u16;
-- 
2.48.1

