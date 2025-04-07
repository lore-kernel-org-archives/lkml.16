Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1669222B5B8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 23:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744067889; cv=none; b=huWkm7hzmqPlzzkM6bcTNwb3Je0sf55Q7nR0lwrp8CX+5duTgwNGVy2x/DotaTDZ5vkkrQLSedYZKogidJz20IvldHuPETSvI8xcjyesDMBIfn4pzpFvsuo0SZQFIrpdPreFI/14s/ISAfW169CeKurOBgCIav3aPF4h0PUC1K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744067889; c=relaxed/simple;
	bh=f3Szwlxp0IuKaC6/PwHFJbjCl8If//ssNgmRzAR1zC8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ft++BYv6rKUkEHJW5acoKUI6CS8eQuC8dKZdkqzLOrljDCC2lz45PS+YWj3cYSYEzAtQ/hB8GWDSu9RrII3MacMo8WPq2h64XyCKmrnXoub4c0ePq+esLoweQ4XLZEVqOW5W2FqfYJsEQ3Ve60etenmY7DEc83Ksz0jGPwIU4uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TnnTd38M; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TnnTd38M"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744067886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+IMYcqlWO3catu174EvwSBwx0GimnAoT/SGwWBO8cTo=;
	b=TnnTd38M1xrDMrFE2WjAavhx1E9Y3OsSdP+tkWMkMuh8Su7IovMASDuX1XJPlNC1nvmn3V
	yzWYT2aLhfiJx/IDMhp4RXBSK/q5sfCY+y3IBIFSnEaSFetykk8nEA2zDEXBM3tj2Qn/Ob
	hdj+u6HFhgWN7uMSRxmUiKrgmlxS2UI=
From: Sean Anderson <sean.anderson@linux.dev>
To: netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-kernel@vger.kernel.org,
	upstream@airoha.com,
	Christian Marangi <ansuelsmth@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [net-next PATCH v2 04/14] scripts: kernel-doc: fix parsing function-like typedefs (again)
Date: Mon,  7 Apr 2025 19:17:35 -0400
Message-Id: <20250407231746.2316518-5-sean.anderson@linux.dev>
In-Reply-To: <20250407231746.2316518-1-sean.anderson@linux.dev>
References: <20250407231746.2316518-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Typedefs like

    typedef struct phylink_pcs *(*pcs_xlate_t)(const u64 *args);

have a typedef_type that ends with a * and therefore has no word
boundary. Add an extra clause for the final group of the typedef_type so
we only require a word boundary if we match a word.

Fixes: 7d2c6b1edf79 ("scripts: kernel-doc: fix parsing function-like typedefs")
Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---
This commit has been submitted separately as [1] and is included here
solely so CI will run.

[1] https://lore.kernel.org/all/20250407222134.2280553-1-sean.anderson@linux.dev/

Changes in v2:
- New

 scripts/kernel-doc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index af6cf408b96d..5db23cbf4eb2 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -1325,7 +1325,7 @@ sub dump_enum($$) {
     }
 }
 
-my $typedef_type = qr { ((?:\s+[\w\*]+\b){1,8})\s* }x;
+my $typedef_type = qr { ((?:\s+[\w\*]+\b){0,7}\s+(?:\w+\b|\*+))\s* }x;
 my $typedef_ident = qr { \*?\s*(\w\S+)\s* }x;
 my $typedef_args = qr { \s*\((.*)\); }x;
 
-- 
2.35.1.1320.gc452695387.dirty

