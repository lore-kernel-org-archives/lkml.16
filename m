Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F92728BA9E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 12:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744721428; cv=none; b=SsrBpvlZ7xSHUNi0ujoe52MzeFei9ApjhZpQX4xR3Qt+sW6PCs41qApYwy/xJl1j3QZ8SX0v2jC0xxn0qYPWHF3WmTP8bpFX5WwxLhQzEiLuMSNN5JMqekf6+FM9yhpnOOFFmSa4ZrKOR4FuM0T7ZGdi1OgPa1ve0YkrTHu5sSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744721428; c=relaxed/simple;
	bh=V9vK8U8fUyE0Dss2b5y1iyHCHzhDzIhiDMn7LUIYcI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RVWnT+dMwTLBKlXA0ECWirxHbxRhzcqX/YTyMyrATqn6os5cQ8QqP4BS+KOz7ClGhn3n0ctm/omNzNvZFRs2Hjrc0GxcVMgisM67QbiMPkffMZPgFq1bN6Y41pKqgNtQmZI4THrS+EkFJD1d++2u1dAmzzegrPyYDis2yH8qNZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M1fzDNrD; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M1fzDNrD"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22548a28d0cso78599075ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 05:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744721427; x=1745326227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pQX25r3cP5vInY6BKMoSQyqGe6xp0jOOEenD38OtaQ=;
        b=M1fzDNrD3kNxjQzgjYVgiiekkGGEwIR9vXmnN+8vJFgQ+m39XJNzo38IVkmGMtthz6
         /7z8vPLlSKkPmcOm6TbaBav/hG0/LpNRwUI0sPdcJpR58SM+7fu34JlZWVBqVj3BU56I
         BgdM5srmeUUhmqk4H+R1Rq6qO0O5z2X43drWGbd7L5nW2lMQfCETIw4xq3QeqcrAqAEA
         q0CiwRSvnzEUksxHFEuUMGSlzHE7KHYVj1jVabTl/zlrzfRy3x8maKaedYOU/xFGYDih
         fEw+LY03s/OY4UbrVJDbPjC/tNF9olk6AMjJNzdYNhjW0Rtzo9ji2TNGQh6LAqSxPUNF
         8Ycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744721427; x=1745326227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6pQX25r3cP5vInY6BKMoSQyqGe6xp0jOOEenD38OtaQ=;
        b=dsG1MSjsm4vSw39Njrbf5RDv+6RGcQ4hGG2EOmjA1eHPG5fZnLkWcEErpgBvFS8P6g
         IJjUvSSm8dSIPp52BEXUT2snErYRUu1b/kUusuQiOJE64Kw9+Z9BP5sYkdf0lSAuxX6y
         1VZ9+KosgzTB7bi+zjsrnyJ5SKtwew/KOGd/rzRf6MrLXTSfiXaI5/e/r3/03ntPYLFj
         MHfBnMCKupUqxNpjfvFTZ7LJO1OnxXUeuaIiQMkPHULK2mzmosh2v35fg0CB7ViJbHxR
         KROzumCVyLDXI7WFURULC58XWG9G6nr7gyslPx77gMMCDTlOIDnj7p1YpE5TBtsF7R7s
         2DbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFqcA4Hp28Qxrf9Zaii7IEnfzTw4fXpWlnoXGy4X0JNb5aBVe0r1JVZQvm8MFfqDqNgB0aElaL7uA90Cc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLOWKYBkDa5lqau3+woCKKM00ETZkJU2JKvaL4WMs6/iAnk/+z
	dU/16Ydg7b+YGkpw/AOo8qz9Xnv3eUirAXb87HsQMGf5k4ZwcOPA
X-Gm-Gg: ASbGncvDVgtkyyfQ6h+fdmLrQk29ZxZJB+DjPKCwoyGinchN9dZ78akz+w0ruy4fQbZ
	cwMbhJxV6sts2RWzwMw6RUPLBLKHRB1F03lnhqpySTGkeuhi+vD0QYqU/CpsDC6O6PxgmAvBmSL
	XZmqZCGlg7DeEQ0M7YRS8aDQSu0gOFXPjDOlGVXu9y881Nyer3+sMspLNF20wB+xAJf9UOMLncY
	U3nFofJpsZYaSZpimXbxg0T3HjTVVIGCe/oR7eU30KyUWwriLMnJbi5HyScjOXqkBgaErTS07AI
	mcXN5bjIvSYOJqww47t3O+dgiA/8J4fIlUGdEbxoRavs5sTvafUC+Hoo5iuedwMLVkL4Hfx/sIV
	Kd7xXo71dsLGDb7TA0VEXinPYZKmn9vsOcG4T6DF9ZUk=
X-Google-Smtp-Source: AGHT+IFPM+3Ep+WLluJh/45+YAO4V5MwSCLZD7ya2PMOqU89aHl8bWoaZFhJERvQXwb9CpY6hbaKsg==
X-Received: by 2002:a17:902:d4c2:b0:223:2aab:4626 with SMTP id d9443c01a7336-22bea4952cdmr212817465ad.11.1744721426638;
        Tue, 15 Apr 2025 05:50:26 -0700 (PDT)
Received: from charlie-msi.tail804eb6.ts.net (122-121-134-63.dynamic-ip.hinet.net. [122.121.134.63])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b62842sm116146165ad.21.2025.04.15.05.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 05:50:26 -0700 (PDT)
From: Po-Ying Chiu <charlie910417@gmail.com>
To: dsterba@suse.cz
Cc: beckerlee3@gmail.com,
	charlie910417@gmail.com,
	dsterba@suse.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	mhiramat@kernel.org,
	peterz@infradead.org,
	wqu@suse.com
Subject: [PATCH v2] rbtree: Fix typo in header comment
Date: Tue, 15 Apr 2025 20:49:28 +0800
Message-ID: <20250415124928.14372-1-charlie910417@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250414084324.GA16750@suse.cz>
References: <20250414084324.GA16750@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "drammatically" to "dramatically" in the rbtree.h header comment.
This improves the readability of the header comment.

Signed-off-by: Po-Ying Chiu <charlie910417@gmail.com>
---
Changes since v1:
* Rephrased the whole paragraph to imporve readability.

 include/linux/rbtree.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/rbtree.h b/include/linux/rbtree.h
index 8d2ba3749866..02b6733cce55 100644
--- a/include/linux/rbtree.h
+++ b/include/linux/rbtree.h
@@ -6,10 +6,10 @@
 
   linux/include/linux/rbtree.h
 
-  To use rbtrees you'll have to implement your own insert and search cores.
-  This will avoid us to use callbacks and to drop drammatically performances.
-  I know it's not the cleaner way,  but in C (not in C++) to get
-  performances and genericity...
+  To use rbtrees, you'll have to implement your own insert and search cores.
+  This avoids the need for callbacks, which would otherwise significantly reduce performance.
+  It may not be the cleanest approach, but in C (as opposed to C++), it is often
+  necessary to achieve both performance and genericity.
 
   See Documentation/core-api/rbtree.rst for documentation and samples.
 */
-- 
2.43.0

