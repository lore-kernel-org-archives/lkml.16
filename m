Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13FF3596B
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739176555; cv=none; b=SVejoSyXj4tJ2KZyjwPzR//NbNCqOPV3kYIlu1RbpllNMv9QCXRgEec2zhkt+NfdfD7zLprK2JSBt5GLTnutVSTLQYgoHh9vHUQIdHSyb8+GfSLnShhOns6FRGGwXoxlrU2XCFlhk1aSSF+r+8QtI7RmCeQc1PzkOlc1GX6fQHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739176555; c=relaxed/simple;
	bh=OXLN5OQbpzpnQxYs9ab14uPghB/MyFQXUtPfHnzndis=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZNaXCF81lTOttZcJF16IP7Nkpum8CmiNU9mUUwpc5a9XvCfD5zhhs/+plTYl7k6iJv0RoBSUM4F0ZZyp/cwKeoUH4fMpd04V2nARWt1v7+jNcPn3AL8NlSgHj/VDTFLin0Upxi32UabzzjsQWBoMiL3o5Xt1MFIO7/zOZjY75sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/Mt/nnc; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/Mt/nnc"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21f44e7eae4so61115995ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 00:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739176553; x=1739781353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yEgYNCSdq6WKd+60zP458jWGuq44OxO28Xoq9wCvIbM=;
        b=l/Mt/nncuPhyyH2BW1GqG4Bcg4BNFSfenjpTvXQogvCfI+wocIAuixwxxsCvtrKQ0V
         Hm2tbpVeG0b/FovJmV+vKJx6bsfnPnoiQw0yxEi19OC/o8yTsT4P2nAQZU49uPQFUL2k
         WaACpOPlvlepJiGCABfBO1ExYJ2DFBD5826Ruh07I0XHxSCg7pa1iKz9Klav3FKym4j7
         bzAEg0xw02gRXeeL9XAZhHAB1xnwiLxDCjH1QHM7TC4gRvj54qLia+AuJIaFxr3TaQhG
         IZBdIZMK144P81bFgY1f6vdtbNidEkuMhu4cKQD00MAR051yGDMInHLAzSNHIwk/MdNp
         vXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739176553; x=1739781353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yEgYNCSdq6WKd+60zP458jWGuq44OxO28Xoq9wCvIbM=;
        b=elK+ay6DRjGphG6WnQ5kAIMp0dm/H9mFbKe9Vu0fjwbLIew58j1KwFjMGSeLuPMtEW
         6e0Qe8nC3A62KU+pde3KEwcMZGfy3+6KSTparpKIUrdc8uA+6u/bPv6R6iUqOcuaXYj0
         3U5A1WYQk2pgJ1bbsLi83QaxKL7OAlLOlf1YJ1iK4cul7h8/P/vJBU9IzhEyO5bJkUqQ
         ZI2q4VEezjb6bqdbVRFMTRvw/sk1pe/oB/PsYb9Ytd31I8zlFk9XnlYGdsKNvyD9v9hC
         Pu/1/SCax2AUsWwj4rQ8lKbsL2IONgnqTo0ie7+TDDMO39WGpuWsT5Vqc0iRwrger0LL
         rcRQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2zhFHY7JR1SRj114MLhxCxlGyp24EYnuzEXkBmOuJvLGCmrdpGNdQQ4xGH1L/9k+dhAesOcB6iuE7z+c=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzq7KGLCoIQeNLhaFSPpYO7xbWmrccn0vKUIIpDslykFyMC2xS
	iXuH1OYtpr0jFxMVI5harmOmycFDBLKUtC6Fo3mfUlPihVsFIcZV
X-Gm-Gg: ASbGncslFwhzo5kKUOWgSNUDL/p2uZi3Nklqij/4WiBWmVf7v92zw9MFFey81ItXQgl
	C4ZjSym7h/k62d4TpDhi5DpJVlKkDczLsXZFxTbyt1FXfOO28i//WkrsB1CEWIH1f3Nm6ZstPf3
	SHech9U4OU0DywULGveQbygeRjz6xp/lhp3gTjfJEMQygV93AV954t2IXgBti8pf/zrHDTvCg7u
	37OzEWAHezute7ufPwKWYJuLBolJSjXcDAxTUd5vtAX68dfXg0AinvNzru4QpLMclFGzEfEjGjo
	trjaifcdB2/vl75TgJ3KINRXTJOJ/L+PeTnotE+W8B7q
X-Google-Smtp-Source: AGHT+IGfssx8hA+7Ss+gH+glTzMWe0Bkr9bXf8ZoLMrQsWAeNJXYUC0Hw/7zOcKM2DDyRQPDjA3W+Q==
X-Received: by 2002:a17:90b:38c3:b0:2f7:e201:a8cc with SMTP id 98e67ed59e1d1-2fa2416703fmr23162171a91.18.1739176552748;
        Mon, 10 Feb 2025 00:35:52 -0800 (PST)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:7bd6:1a4:1a70:d836])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c555sm73036965ad.182.2025.02.10.00.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 00:35:52 -0800 (PST)
From: I Hsin Cheng <richard120310@gmail.com>
To: Liam.Howlett@oracle.com
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	maple-tree@lists.infradead.org,
	linux-mm@kvack.org,
	jserv@ccns.ncku.edu.tw,
	skhan@linuxfoundation.org,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH] maple_tree: Remove redundant mte_to_node() in mte_dead_node()
Date: Mon, 10 Feb 2025 16:35:26 +0800
Message-ID: <20250210083526.252955-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In mte_dead_node(), it already assign "node" as "mte_to_node(enode)" in
the first place, calling "mte_parent(enode)" will result in the same
"mte_to_node(enode)" again which is redundant.

Refactor mte_dead_node() and utilize ma_dead_node() to perform the
parent check without the redundant "mte_to_node()".

Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 lib/maple_tree.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index f7153ade1be5..362f85c62678 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -584,13 +584,10 @@ static __always_inline bool ma_dead_node(const struct maple_node *node)
  */
 static __always_inline bool mte_dead_node(const struct maple_enode *enode)
 {
-	struct maple_node *parent, *node;
+	struct maple_node *node;
 
 	node = mte_to_node(enode);
-	/* Do not reorder reads from the node prior to the parent check */
-	smp_rmb();
-	parent = mte_parent(enode);
-	return (parent == node);
+	return ma_dead_node(node);
 }
 
 /*
-- 
2.43.0

