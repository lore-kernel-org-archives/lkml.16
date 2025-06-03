Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9ACB27F195
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 07:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748937239; cv=none; b=S/Qu28vTGewSNP8NO2JpXKAPAtWMLODi79XFo8lnrN64kuVBa4HpW8XOIyBa9X3A3iYNPLRNDckYACJRcgjxWeEt3TI8r4me2UtXcgpi9xznfKJWFj9rl/k3kwu9BnGsfOAbYtFthBpR+5HrafIbms0DZkc2GDXAZYoxd9P7yJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748937239; c=relaxed/simple;
	bh=ZCQqiA2PVTAcFSU8RIxSlOzKCai7Hr/vyfTn0gjEBAw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nZlYXUkDZnq2wQs7A6eEE0EfXLF39pb9O4guWAVsiXnmSkA7VmUTD0zoX7uq3XZsPJQvUnFhhhdI2CHQntjUxfKBMHpHu442XjqxmEmAE+P1/qouwcRpEld8+vQry0jXsmt8thIOf8d6GEpflJ9HIAgEcglZ16qMlrLWaL4KTX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dE0h0uzC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dE0h0uzC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5044BC4CEEE;
	Tue,  3 Jun 2025 07:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748937238;
	bh=ZCQqiA2PVTAcFSU8RIxSlOzKCai7Hr/vyfTn0gjEBAw=;
	h=From:To:Cc:Subject:Date:From;
	b=dE0h0uzCSZ5WChgu8B5IkcGge4aPWN/Hzli6cI8mEmupF1I8vf3+lQ7EeLptooAn5
	 8OgzY4nfDs2jIW6C6yJ7TdIU5Pb4CZC1Z87o6XVtsJZa2+2xnUVXKEgdUoM4j/kRBe
	 0Qp4W1U3aw3bNWG60sxsGqZBnvCQBWyoDyLTuZKJUDN3WEVklYjgzgdqbB/RgY4MCr
	 W2xp7fd1da09MSCKaXCSvvC8xeOajxqsq3/KkPE3vZC8eBzUr5c9odiK/LwsI+SM41
	 K4y0puiBrUAO6iu0vJF2FN3Amj52tlWSJtKN+kgceTmh2bnUCa1cX3X1OzoWREjVXz
	 vmZoqFMVllx3g==
From: Arnd Bergmann <arnd@kernel.org>
To: Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Sabyrzhan Tasbolatov <snovitoll@gmail.com>,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kmsan: test: add module description
Date: Tue,  3 Jun 2025 09:53:07 +0200
Message-Id: <20250603075323.1839608-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Every module should have a description, and kbuild now warns for those
that don't.

WARNING: modpost: missing MODULE_DESCRIPTION() in mm/kmsan/kmsan_test.o

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 mm/kmsan/kmsan_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/kmsan/kmsan_test.c b/mm/kmsan/kmsan_test.c
index 9733a22c46c1..c6c5b2bbede0 100644
--- a/mm/kmsan/kmsan_test.c
+++ b/mm/kmsan/kmsan_test.c
@@ -732,3 +732,4 @@ kunit_test_suites(&kmsan_test_suite);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Alexander Potapenko <glider@google.com>");
+MODULE_DESCRIPTION("Test cases for KMSAN");
-- 
2.39.5

