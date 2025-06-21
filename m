Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BAE4C79
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 14:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750515599; cv=none; b=JgNaC8ekD6sB0JbkeIIulXG01L5qZCcHlxgPXizHIMEP96QU+SRq/GXBSjSRnJ9iNxqWvMtfSJ23iWDntfAfIBuYc6Cl/tnE9TqxMc8GW0jpLBKjq80NTv+7PchQrjXflqE7Sd9ZKxMcl0eLVqbrZYTm4SMusRpCaTeiHMBCBYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750515599; c=relaxed/simple;
	bh=Btgowm4DfwFbL1sKcNqd+24mOU/mroGzsGGaPWgg0Yk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j8d0Oq35uaSL5BLAn0Mk+IeMHtvOzRMAOjC/ibvlv5T/XL4waBoYpYKo/ucnenaEKjl7IsnPQ8V80RmIqaq87XOJ50p9IGRRf/tzEmi9qpunQ+xZQ5jXRajuCjWRWrC50K1iFF3aCUvCts0dDHAF1suxvwdOxsS95bvwykYNiCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=apx06ZmW; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="apx06ZmW"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-235f9e87f78so29173465ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 07:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750515597; x=1751120397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A2EOkS40yZmiudRVhcn3rZbBNM2mQ4lq1wq8cSmwsTY=;
        b=apx06ZmWe6irLa4mlO9mAlnX+406by3SXSGvK3EKh4Rv1qlXbLujaqyUxhckocPQr7
         SHPKBdrXii7KWMDK5ha+uHMTQpyeQh8BU+7+HKyYpTc0peUD9VZzIoRwGEo/d6RT3X3B
         2taoHhqPgtmnfN177hY5O3dPxqBhLySJdtzptvAzqcFnTkLKUuGIL+lFbn+LytyjZ8wb
         XDq6PzwgWigEyTqgDHUVejPIZ9z/eDKo4xVBa8kOQhwExE8dvfOybgWq11N+8/vZ7BUa
         02LD0QdLs2H2I9kKEy4LKvqTnAVjIGIBlO6Q7ZbAdMnzVwOKptXCrvWr8NBXhqekspc2
         pASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750515597; x=1751120397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A2EOkS40yZmiudRVhcn3rZbBNM2mQ4lq1wq8cSmwsTY=;
        b=hew88XDaIRC7xRZ7uSUqBz2jtqcoQEwpdQAWNwGaE97p7mddioBauwtF70dt5CToiK
         1UZyNFRcbSTfWANbdz//WcZul2XXFArsZveRnecH6zTngNH3cK107PTME3wJYQkn32f2
         91ZeFfZ/xGIR8/Jd4oPjoHheCuue7eImSKXwB558k7JmO+euCl2o9lP8V9vxvG1LQA7A
         Ud0Li5zzNJhq6xhJA77o4G6aZsWmM8xaESLeFDAMgfUp8Ld8+y4iWtr01qbNE/tpHPGp
         1pprxlOTKIaVufu4xpVj72CRQProY6es2gPypOKhR4DAgpeeUfoKws7LRR7oX174KogY
         hvTw==
X-Gm-Message-State: AOJu0YyGSNfkP0fydKx6BbfTXP2rIV0IV1ElcjdxUZRPoQPoi6rTqJfh
	YRODGJayY7gPas3f45jt751w5yh2CXywD16vorXxqQD45kOZ80u36MBTn8h7bw==
X-Gm-Gg: ASbGnct5xW1VHVjM/yzdCovL11JLm/8QxW/LDgJtrKOQpCXVinKU+VBCtAWa8odr6Yo
	NmtxP8zUCYSqG8RqDXvms102Tl21XaAtiMCGYSmsKUTA6WQ+n9LiEJ5KUdW/GEIY0moi82bsDzq
	62UoXp1NUhF4TB2Z+TngCW7XHOu8gBcpsUBngrCqLWRWmK++mbqiTMT9fiWv9DqGmwoRf/dOyOD
	Kf+YmtXpMj0ddLAj6yx5Dcgmsr+dmsbMsFSIAssnfJNRjJEbkKIOV3Vkb3NjZ1TgijHnNmj9AjV
	Ks0zYTU0KVGBiXpCZPcc6GxYQLuMZRjAM1NW1EoSApxCfSEsY9LVMtTCnAxJYA==
X-Google-Smtp-Source: AGHT+IF3Tn2/UVrOS7Z6pQDeQucDqcwMyShYWeo3y4qXl5cV7apZiEp3wpgmO+8ZjKEIyHDqKn/u/A==
X-Received: by 2002:a17:903:22cb:b0:234:df51:d16c with SMTP id d9443c01a7336-237d9badd36mr103673495ad.45.1750515597010;
        Sat, 21 Jun 2025 07:19:57 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8706922sm41059745ad.228.2025.06.21.07.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 07:19:56 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kees Cook <kees@kernel.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH] nodemask: use find_next_bit_wrap() in next_node_in()
Date: Sat, 21 Jun 2025 10:19:52 -0400
Message-ID: <20250621141953.514526-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yury Norov [NVIDIA] <yury.norov@gmail.com>

The function opencodes find_next_bit_wrap(). Switch to using it.

Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
---
 include/linux/nodemask.h | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/include/linux/nodemask.h b/include/linux/nodemask.h
index f08ae71585fa..81586d24d248 100644
--- a/include/linux/nodemask.h
+++ b/include/linux/nodemask.h
@@ -266,11 +266,7 @@ static __always_inline unsigned int __next_node(int n, const nodemask_t *srcp)
 #define next_node_in(n, src) __next_node_in((n), &(src))
 static __always_inline unsigned int __next_node_in(int node, const nodemask_t *srcp)
 {
-	unsigned int ret = __next_node(node, srcp);
-
-	if (ret == MAX_NUMNODES)
-		ret = __first_node(srcp);
-	return ret;
+	return find_next_bit_wrap(srcp->bits, MAX_NUMNODES, node + 1);
 }
 
 static __always_inline void init_nodemask_of_node(nodemask_t *mask, int node)
-- 
2.43.0

