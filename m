Received: from out203-205-221-239.mail.qq.com (out203-205-221-239.mail.qq.com [203.205.221.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F5933DF;
	Tue, 15 Apr 2025 14:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744726569; cv=none; b=JT/Dd1eX/HkQgz5Ou+5eRKeVtOzk4c3tJsTU1alo0+71s8VQySJRqT/g0OhxePS/1gQyk8I3ccKxOAUsSK57YP5Amy6Evg9SBITKRq3AXHYos+C0R3q66bpA/8+0rKFp2hjvIEq2qMyOyxd0fgzdBbFzglmnJoHVWWNj7dArs/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744726569; c=relaxed/simple;
	bh=YajqJaU+cdevNobpRRwoU0DM5ACvTlKj0Vk4kI7vuaA=;
	h=Message-ID:From:Date:Subject:MIME-Version:Content-Type:To:Cc; b=ao7haT0xjqHV5GL4Nm0BvdbJHbHztV+i9C8DMbQTd8MjEs5YJ3xeMn3A5VHhNhVO982VQy8zeaxFssl8ysaSRSGKOFBjXI+igWyqQTV/EGc8altUqRljwXLo0E0bV+9hW3UJRQMswnTZUkJtGRbuGpg+JaTBrkjVrdbenmTYavc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=YBOd96xh; arc=none smtp.client-ip=203.205.221.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="YBOd96xh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1744726255; bh=rBJo6st9z2yzfDHSl0qbQgIY7HkO12X5NQA4RWLYm1k=;
	h=From:Date:Subject:To:Cc;
	b=YBOd96xhqcLZgifby9dpZDOtoqCg3n8YVpgJyubx9zsqTNEka53N/Zjd4HKZwJdBQ
	 ZT3IFIK8Ofm4pErd9uVCyR2wXsTBMRqerUGUhW2WurIzHbLV3RtctZJdYVeoN+T9aq
	 oDVCNeH91Zu3oUqNNhTLEOJLyL9g6jtkP9q35WqA=
Received: from [127.0.1.1] ([112.48.46.45])
	by newxmesmtplogicsvrszc11-0.qq.com (NewEsmtp) with SMTP
	id 2B59F4B2; Tue, 15 Apr 2025 22:10:53 +0800
X-QQ-mid: xmsmtpt1744726253tc7gykvuz
Message-ID: <tencent_FFC8E7A5A76050982D28F811C81F936D9205@qq.com>
X-QQ-XMAILINFO: MqG4KXyEKpQynimtTjnsfWKU/iNyybHLWdjy5ge0jzsMhX/7Zzy40x5wTiOhtT
	 kTbYc11mO6zcZj8MSuG7IG4HX7f8gJVDt8ndZWXXJBuGf3HdbLsROiEgoTdfQZ9yyZIXZ+OzjZot
	 u4dNjWPrhODE2SmuowqgdLEXNX/Agv6UreQamdxIm9u0C7JHOL2qDMFN+NRRaY93lTENoRCXyaQ0
	 o9BX39TKYMGRg9ehkbyyyK/LZBfLZut/SgNJvJT18MlwNbKc0PmzTXf+diOwQJZe7JSWAqCaOcZ3
	 466VunPqAtCWHb5MzC4DoFgfKHLR2aRrNqXDeVTKb7Q7eAuaO0YUCmOXwZ3wh1hO9+DM5atZDfHR
	 mcHslDEadDVzCoT7QgrpUq5gE1MgWyUx1QNukmKBghKH27gbGRj2jYCI4fUMsiqo6D/aylwZZ0TH
	 Z1wkE7wg1RRi2qBDm2VFnYjO7Q9bUm8LpBXkqB5TKXWVgks38rA4DG+jzuScJBdtPiKoxugD1+Ip
	 +xk41bCQWzEPh2tRm0VymZ3Piq06vRujXbFyacIZm/ELrr0Popj6KezrwlWUA+pDi3bZfkB6mGSQ
	 B42EbFz0JXcra4bTnQO+68NAkEY8WWCHvxFlNl2ePPf4FhAHVRXGLBYBb3zfSxs0NwUGvQcwEGNF
	 FRUQiEANupNMyjGxz+vWRULdAqLYowuvXlBsFWFmqH1CRAHI7UJnhs6eNaIlcWVdovZQVCjXydJk
	 9VgQdNeTbF+C/viHmz1Y7z+FelOBaXr2/s/lZ0ERoDnkzEnV2LssDnCMkvubDNf3DlY+5oRkY0ak
	 n5g1anG/de6tvbfLRdThLkJm0lhLJvUA0yWej/yMdHzwGufJi4Qg7EE6+hhsXSdhFOJu8MoF92T7
	 1cgPIyoxSQVA5vshVc2o03RRuG7OFKphiPtyGtRNPzXF/nefbzjC5Atnny7AGcrD/4fEwVgjJT/+
	 XQdBjf4RH47a3BV+b6bXv6hqTts3MKiV1ciPSX49eEsjpgOF1h8DA2iLtn7xNZcWWLKZwpvkrdSz
	 lrMjOryS8TC4TG4oGV2Bl8mxXyqGb10u7bO9+EhkLZ44kYBdXJosEOUVeYEUGo2C05JNw35g==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: Liya Huang <1425075683@qq.com>
Date: Tue, 15 Apr 2025 22:10:40 +0800
Subject: [PATCH] of: reserved-mem: Warn for missing initfn in
 __reservedmem_of_table
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OQ-MSGID: <20250415-__reserved_mem_init_node-v1-1-2e48f58311b3@qq.com>
X-B4-Tracking: v=1; b=H4sIAN9o/mcC/x3M0QpAMBSH8VfRubZCm/Aq0ontj3NhtElK3t1y+
 V38vocigiBSlz0UcEmU3aco84zsOvoFSlxqqorKFLo0ijkgmQuON2wsXk72u4Oqm9ZOaJ3RVlP
 iR8As97/uh/f9AJ+lNpRqAAAA
X-Change-ID: 20250415-__reserved_mem_init_node-689cbe9d54c4
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Liya Huang <1425075683@qq.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744726254; l=1774;
 i=1425075683@qq.com; s=20250415; h=from:subject:message-id;
 bh=YajqJaU+cdevNobpRRwoU0DM5ACvTlKj0Vk4kI7vuaA=;
 b=9o2Fq5RQqe5zg02Foh10Qq5KYRisrT4mOL8ynZbzn5qaLFSMWjEk30XBTyUxSye8bd5lvg0u4
 t2SFHQgPmF8AaDTn+A4/OOUFHnfN9MhiwSkdI5as6tV5bmqcrrk4JI0
X-Developer-Key: i=1425075683@qq.com; a=ed25519;
 pk=nSnzeGGcMXBimuyIWYIZpZRN8DboZqwr67IqWALwrGs=

For the data in __reservedmem_of_table, its function pointer initfn might
be NULL. However, __reserved_mem_init_node() only considers non-NULL cases
and ignores NULL function pointers.

Therefore, a check for the possibility of initfn being NULL has been added
here, along with skipping the initfn() and issuing a warning.

To: Rob Herring <robh@kernel.org>
To: Saravana Kannan <saravanak@google.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Liya Huang <1425075683@qq.com>
---
For the data in __reservedmem_of_table, its function pointer initfn might 
be NULL. However, __reserved_mem_init_node() only considers non-NULL cases
and ignores NULL function pointers.

Therefore, a check for the possibility of initfn being NULL has been added
here, along with skipping the initfn() and issuing a warning.
---
 drivers/of/of_reserved_mem.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index ee2e31522d7ef69d816127a9003c423d5fb4023d..0a7cc599c0ca68001b2395759310f3585f247db9 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -496,6 +496,11 @@ static int __init __reserved_mem_init_node(struct reserved_mem *rmem)
 		if (!of_flat_dt_is_compatible(rmem->fdt_node, compat))
 			continue;
 
+		if (!initfn) {
+			pr_warn("no init function for %s\n", rmem->name);
+			continue;
+		}
+
 		ret = initfn(rmem);
 		if (ret == 0) {
 			pr_info("initialized node %s, compatible id %s\n",

---
base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
change-id: 20250415-__reserved_mem_init_node-689cbe9d54c4

Best regards,
-- 
Liya Huang <1425075683@qq.com>

