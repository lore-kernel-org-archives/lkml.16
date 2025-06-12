Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD1115573F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 08:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749716698; cv=none; b=CWEKCXp1VX/l/XiSQ4am+B8f4Fh+CYKMCRE8K9HNk5mG+C43/9ibm8+nuegljxblAI6hPg3x4s6oCox4AAAx+gZT28F8Vkra8cvaDo0ov9bqPB+bEVWWJEBkDaCfS/3SgMbg2zFD8eouIspy7xKNBXAqPxsZ4T9YFhtzFZz/Mrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749716698; c=relaxed/simple;
	bh=ubbW2XTd5xPgLYD/dBYJpM4b5Yor7UVXyRQkEw+cAek=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IhuV2JX8WUFUOcXwZT+BZAM/DQKHpgeR7ldbO7Iz56KqvE4tw2/2RJmYzkzE4bLNE9YyZkFONZSMkafBabGDQqA5qhrFvVflhYVGPB9bY9GF3171010tNacVhgMf1u3IuObbQfMadq6yJ6N+UMvyrA6gjknsiBI7DdQa6R3y8Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4bHwTS3qrbz2Cdlr;
	Thu, 12 Jun 2025 16:21:00 +0800 (CST)
Received: from kwepemk200016.china.huawei.com (unknown [7.202.194.82])
	by mail.maildlp.com (Postfix) with ESMTPS id 348ED18005F;
	Thu, 12 Jun 2025 16:24:52 +0800 (CST)
Received: from huawei.com (10.67.174.78) by kwepemk200016.china.huawei.com
 (7.202.194.82) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 12 Jun
 2025 16:24:51 +0800
From: Yi Yang <yiyang13@huawei.com>
To: <jpoimboe@kernel.org>, <peterz@infradead.org>, <mbenes@suse.cz>
CC: <linux-kernel@vger.kernel.org>, <lujialin4@huawei.com>
Subject: [PATCH] objtool: Fix memleak in disas_warned_funcs() and disas_funcs()
Date: Thu, 12 Jun 2025 08:15:39 +0000
Message-ID: <20250612081539.257339-1-yiyang13@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemk200016.china.huawei.com (7.202.194.82)

Variable "cmd" and "funcs" which is allocated by malloc is not freed in
all paths, fix this by freeing them after use.

Fixes: ca653464dd09 ("objtool: Add verbose option for disassembling affected functions")
Signed-off-by: Yi Yang <yiyang13@huawei.com>
---
 tools/objtool/check.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index f23bdda737aa..1e8a14e23d0e 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -4605,10 +4605,12 @@ static void disas_funcs(const char *funcs)
 	/* real snprintf() */
 	snprintf(cmd, size, objdump_str, cross_compile, objname, funcs);
 	ret = system(cmd);
+	free(cmd);
 	if (ret) {
 		WARN("disassembly failed: %d", ret);
 		return;
 	}
+
 }
 
 static void disas_warned_funcs(struct objtool_file *file)
@@ -4629,6 +4631,7 @@ static void disas_warned_funcs(struct objtool_file *file)
 				tmp = malloc(strlen(funcs) + strlen(sym->name) + 2);
 				if (!tmp) {
 					ERROR_GLIBC("malloc");
+					free(funcs);
 					return;
 				}
 				sprintf(tmp, "%s %s", funcs, sym->name);
@@ -4638,8 +4641,10 @@ static void disas_warned_funcs(struct objtool_file *file)
 		}
 	}
 
-	if (funcs)
+	if (funcs) {
 		disas_funcs(funcs);
+		free(funcs);
+	}
 }
 
 struct insn_chunk {
-- 
2.25.1

