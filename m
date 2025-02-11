Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7BC1D63F7
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 07:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739258338; cv=none; b=JbEZlAj5vvyxeQHuyJqBeadahp54BCtZcJbMcErEy8tiyFGBDSxMmqFZ51eGN1Su0ERd4QD3QE7//mlUs74jEGMQt/6xpUdXRyAEe6qqwwo7phsBA0kL7c/BwbBBQFCZJHF0kN+tE5xVcfGzf1t9HT8DHpQeZjl1FssVL28C3UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739258338; c=relaxed/simple;
	bh=7NfcOqFZGK1kZz7kRa0NgzIR4vEU9ryr0UGe0EW/pDY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mAGu2O6sHb4IOxOE+mi6gaSGx392k7VfHVXI29gBY6ULIOMxveGEQCMqeHPws0RZgHtRfv1tl1r1c6V5pcFTxi4rok6xuxTVi5AH6BClGuWozVuR7rfwfKSIzpjRUiam76tmGSBN8boThjd23yVf4WH+GNWl/XJ2nS7+42p8Eew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UwGTVa3X; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UwGTVa3X"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21f2f386cbeso96111645ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 23:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739258336; x=1739863136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RYIuOa9dqsRGqun2oyNyTclGTHpk0ZUat26hN8Dfo1c=;
        b=UwGTVa3XlKqZUBDLTABK6vu/UUk1mwB8mgGrgY+rmi0wFKN89xtEA9IRIZavUxPLgX
         mqBW40dy4TPKI7Ug9gCFMoHsWFijo1O4UGYvVt91nsu47wfbs+Taxe2aNaDrwIe/y1Xt
         Ea6EAo5X0aqPNcXSklvYrF9ECv0GNzQqG+rWvFozk/zPArDDOehYWcgf3eDI58UjXHTW
         GgeXaM7ciwpl26490ZS/qYd1ur0xXlAKZRuEF5WXJd2JRgJMI7AHtxNgCZfiePSurlQJ
         3ZUhJvq7tZdm+3g7ltiCZOmFWu8iI7GLFXbE+Nwyqiyb0XIdO6fO4xbSk/Uvz1xjnlmh
         a/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739258336; x=1739863136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RYIuOa9dqsRGqun2oyNyTclGTHpk0ZUat26hN8Dfo1c=;
        b=bHDNPx+Y/4yF+d4Y74J7ZxBsVMaB6/L6szGwyipkj6+GdG+TrtBOhHbfwr+KWTVum7
         U+gVT2EYOE75/Cog+tV9U24zoV7bhoeu2BRCV1M/yopeS+hWtwyYoA/cxs6X6G+ddTxn
         kyD/J2Ku5qSVpI2odrij0fDtNI+pF2XnySOi66QeUC6qmfxZYB4sQjzECEl13wfo9st+
         SMcGRQJLpjagJz4acTPpagaHyAova9YJCCXrvt6cJM5Y0Mxw5V/ZFguQQu9xQ+fiitba
         IwmlRz3MzFqbue4wrKdDss1bDsuaZj3xgld42mmBb4QrnFnyql2082EcvYvBgUBbmVgl
         s7yw==
X-Forwarded-Encrypted: i=1; AJvYcCVXAmoD/n32p2SDxM67M79lbNnrEPgVA17LbxEsALSBaaCFvV7BSpyd1p/1wPIbIIIieIdkjWqkO3ITpHU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIhYbqm6aBJh7SSofHrSMaWs08CcIjNmmFqlKjKSw083lfem3z
	dCgI+sfLFhzNb0suWpL/LPHkihF9rDdLADbUMGYp7QjUQYjaIz1k
X-Gm-Gg: ASbGnctAb+A/KK9cja9v4qvP1jDCuIGFHxK4nn2uX6O2FvVjWQ+EQhY6MSqUi0f56dK
	Y7kyZ00Qfwh8GpRjyM0wMXGSS+GU6WSrVG9/dyMo2GHLjmLsQwstKDdAjok5GLM5/6h6waQh7vK
	P0XRVvu8ZK6l90JYdolNO4PHmPOA+T80/vy83uIEyCI2d0nktiLLrOqTJDw00tB4zgLi/e3eRR0
	ia+qYlQD3FaAJ8ceVlnpmP0I/BjRYBvZKE9n1IFV532+xYqozRMnTNlFEpHwSUSb+5DfVu7ESi1
	SMfJbLmrxsfCGr22z8ApRTnuEKqL+lRWKY9HKKvrzrWn
X-Google-Smtp-Source: AGHT+IF0ydpppEAfyPHKzMpn7qxef6C5oYr4TVcYF7SqOYFHr3+ny2ddWrDpeyb3q0l5yWKD6uo6Hg==
X-Received: by 2002:a17:902:f68b:b0:21f:6584:2085 with SMTP id d9443c01a7336-21f6584234cmr203461715ad.42.1739258336517;
        Mon, 10 Feb 2025 23:18:56 -0800 (PST)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:a0f4:120:366c:bbc8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f368ab20esm89822065ad.224.2025.02.10.23.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 23:18:55 -0800 (PST)
From: I Hsin Cheng <richard120310@gmail.com>
To: Liam.Howlett@oracle.com
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	maple-tree@lists.infradead.org,
	linux-mm@kvack.org,
	jserv@ccns.ncku.edu.tw,
	skhan@linuxfoundation.org,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH] maple_tree: Use ma_dead_node() in mte_dead_node()
Date: Tue, 11 Feb 2025 15:18:50 +0800
Message-ID: <20250211071850.330632-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Utilize ma_dead_node() in mte_dead_node(). It can prevent decoding the
maple enode for a second time. Use the "node" to find parent for
comparison.

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

