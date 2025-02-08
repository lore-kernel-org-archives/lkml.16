Received: from mail.nfschina.com (unknown [42.101.60.213])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 3B43E26ACB;
	Sat,  8 Feb 2025 08:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739001967; cv=none; b=aU97BBAzrjrtBx+SeOHuce//mbN72Yo5L+xs0iMHIitZdN27Uh3ELscfSjBMiRx9sULfzLQcrHNsZKNTGvVPVEDcW/mxjNzc2hd6DIJFtulHQ8ec55syOjv34xrADVvJ58oEyDRI6alSaiVEBN29WPovrCynFxfCXRA9fIAefdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739001967; c=relaxed/simple;
	bh=2G7fWeJaVopSDfue7QrMwmkPKAshv+qDPcUoTNC+Ee4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=GkWvy7T8ygWUAIqPf+F62vgQQrDhlIAIkO9VwiooJOT5z1FHi/8UPTrXw7KPkviq0HcxI9N8wO+gdkHDTGYI1uw5nSFhGwU6dQDiLRx8kWcH3IaBvOK1kYZXIfbn1E2OtF7OpM+gn9TQJpEiwhqJ9Kzp3kPkcrX+wAoJEe82QU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 6926D6019A503;
	Sat,  8 Feb 2025 16:05:56 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: min.ma@amd.com,
	lizhi.hou@amd.com,
	ogabbay@kernel.org
Cc: Su Hui <suhui@nfschina.com>,
	quic_jhugo@quicinc.com,
	George.Yang@amd.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] accel/amdxdna: Add missing include linux/slab.h
Date: Sat,  8 Feb 2025 16:05:49 +0800
Message-Id: <20250208080548.1062441-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When compiling without CONFIG_IA32_EMULATION, there are some errors:

drivers/accel/amdxdna/amdxdna_mailbox.c: In function ‘mailbox_release_msg’:
drivers/accel/amdxdna/amdxdna_mailbox.c:197:2: error: implicit declaration
of function ‘kfree’.
  197 |  kfree(mb_msg);
      |  ^~~~~
drivers/accel/amdxdna/amdxdna_mailbox.c: In function ‘xdna_mailbox_send_msg’:
drivers/accel/amdxdna/amdxdna_mailbox.c:418:11: error:implicit declaration
of function ‘kzalloc’.
  418 |  mb_msg = kzalloc(sizeof(*mb_msg) + pkg_size, GFP_KERNEL);
      |           ^~~~~~~

Add the missing include.

Fixes: b87f920b9344 ("accel/amdxdna: Support hardware mailbox")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/accel/amdxdna/amdxdna_mailbox.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
index 814b16bb1953..80b4b20addd6 100644
--- a/drivers/accel/amdxdna/amdxdna_mailbox.c
+++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
@@ -12,6 +12,7 @@
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/amdxdna.h>
+#include <linux/slab.h>
 
 #include "amdxdna_mailbox.h"
 
-- 
2.30.2

