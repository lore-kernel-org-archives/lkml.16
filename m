Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.166.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A0811713
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.166.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750817475; cv=none; b=YncQ/aC9OwNdnzfef43odjm4ztSFQXkltIxVdL8+BwM/Cqzwlpmm1gtO7GLInnzxWJW/cL/0y5nHc+eq9HLArEKVkeHlEyECCDxLhkDRkb1XFYucQG+l1dFIgJSJ4Ah/iIJ+oHc4zChXH7gxsCYdFdUk9znjvm1HvuLIwH1piVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750817475; c=relaxed/simple;
	bh=8TJwxMuB11N/SOTJWIBRWU0SEuET2n/fAMO954lf12s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uz300260PGjknPYMBLhAPFynqeZdBQ0itAySqhJ7Mw8tTLn1uF6ugOGA3xDDIejok9QaNSZwEbUjiwM41dHrjlfsIsVKVABYbPvoPO0M+mVEvjsS0QisWI3M8DwbMjofOOecRX60es3UfSX5kIycOXRh+fkwD/68QS2UdJ4o5Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Tz418cdd; arc=none smtp.client-ip=192.19.166.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Tz418cdd"
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id DF821C0000F4;
	Tue, 24 Jun 2025 19:11:12 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com DF821C0000F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1750817472;
	bh=8TJwxMuB11N/SOTJWIBRWU0SEuET2n/fAMO954lf12s=;
	h=From:To:Cc:Subject:Date:From;
	b=Tz418cddLQEsqsg0nVzNFuAORN7E97V1bcNHLkJHWtcBjAFxyrB7N5QzotN6X0LRJ
	 pspDvlF2qXpYl8m8IVysPTuxw7Rq7cnUVT50L9xA/MiQ1QHDtFpxBH2ktYdTvw7HEr
	 5HaQqO5HT97PXviWUtPCqdZoloisQBNqrhNlBei0=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id CBFF918000530;
	Tue, 24 Jun 2025 19:11:12 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2] scripts/gdb: De-reference per-CPU MCE interrupts
Date: Tue, 24 Jun 2025 19:11:08 -0700
Message-ID: <20250625021109.1057046-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The per-CPU MCE interrupts are looked up by reference and need to be
de-referenced before printing, otherwise we print the addresses of the
variables instead of their contents:

MCE: 18379471554386948492   Machine check exceptions
MCP: 18379471554386948488   Machine check polls

The corrected output looks like this instead now:

MCE:          0   Machine check exceptions
MCP:          1   Machine check polls

Fixes: b0969d7687a7 ("scripts/gdb: print interrupts")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
Changes in v2:

- explain in more details what is being fixed and how this corrects
  the output

 scripts/gdb/linux/interrupts.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/gdb/linux/interrupts.py b/scripts/gdb/linux/interrupts.py
index 492d1f1e9529..f4f715a8f0e3 100644
--- a/scripts/gdb/linux/interrupts.py
+++ b/scripts/gdb/linux/interrupts.py
@@ -110,7 +110,7 @@ def x86_show_mce(prec, var, pfx, desc):
     pvar = gdb.parse_and_eval(var)
     text = "%*s: " % (prec, pfx)
     for cpu in cpus.each_online_cpu():
-        text += "%10u " % (cpus.per_cpu(pvar, cpu))
+        text += "%10u " % (cpus.per_cpu(pvar, cpu).dereference())
     text += "  %s\n" % (desc)
     return text
 
-- 
2.43.0

