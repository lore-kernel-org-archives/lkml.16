Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE7F2144CF
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 18:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743531886; cv=none; b=Kw6GBXMN//N5rbQ4MzPW8o0fK9qr0A8FJUHrJ6//lO1I6eswziOdKlrupjko3B00DfXNhLwQ0rEd2yJUWf7BFeNeOtLoyParHYlQfTiDDHvkAzI7vRoXHpmNIbXQV/75xlCPNGgWfhQvdTqKF51NlXqyBCzTCrroocgsZ+2M3pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743531886; c=relaxed/simple;
	bh=guxdRnrTDsKRPLu/puDo9eu9W2e6fcELE5Ljd2OeYKc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=L1WaMXUnZR1kcD7XlSe8dbazZFInttbTNp6h+oU06OlWS9CXK1RIL1wuPA8qrPz5rKK7LtasjfqanPkTwTbk8Wd0l2ZeyC6kzyzBr2yj25EKtRkQ7INRDpIbqwRFcl+h2Pd/do7KNzY7XBd705GO+05pssvrp1Tm/9FIeLBhX2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Zfs/So9P; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Zfs/So9P"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff82dd6de0so8326135a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 11:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743531884; x=1744136684; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b03QLZJN6J+QLgEpCYYygJKz9Mi0k6OnsOnu/XQ1qHI=;
        b=Zfs/So9Pwt5J9DeIMtZINfYpukF0HRQE18bqul7TWB+kSp/t4shlk/ZnV6wMzdw3Sq
         +Un+5zaKKP1VEhI4oWJeUpEUPTL0/wCDJ/ymzXy3nj7kSlUhy+wFu3cFNoFMscQiz/2R
         MNtsAKAdsUEKmsbFeqxDSGXAg4JLa+ZX+xBr0nodKsAzNLV38jkdQBIJ+xYCau19K/88
         G3vdCPTGxsI7aoyiwkXmiBhEPE7+7XxPfjXu7W+qi1cDRMjMeCOdimWIFtkcI8H7p2zW
         JNVXl8dlqpbdWTRV+i7yPvlzXwKQXg66/oA4BTcKlgGveg4g6dE368i2YjGDSL6wqE81
         BPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743531884; x=1744136684;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b03QLZJN6J+QLgEpCYYygJKz9Mi0k6OnsOnu/XQ1qHI=;
        b=O2hbYErcaYIWsfakt+1CjNoEZEKEhekwaz9h5zPCLuXMBEw/7K/ST5Fii2QSK9rrZa
         lKY78Y4KxG7fPRyOs+mGbgFfmYdpPhCyf5KIDVa4iN8GEjmf1ViJuyspcfBESAFl0Vg4
         rOCjLh/FZhwecVFKiYTbd0zaeUK31Tr2nUxnSaiO7fV/2QCW1bO/GRSNrfJcf3Ebedbt
         kGbxBULvI75/vW22PFU+GNb/EA5a1OjcuMs1xL+81Y53c/L706UAd3ayZFWHBsuGycv1
         bU4UvftqrTENZcfvP8vuKY6pUeBDoHhQfZf3qYo6os8s9I8JUJU+e6Ms8ZeoHpt0nlnJ
         dQhg==
X-Forwarded-Encrypted: i=1; AJvYcCVOIfbqzB1QBUb1zwJgnEet12M2qIvArEFov2jy3eCSc3jOCP26+MmIb5cHOoG09XWI3x/7w4OqmLiGhDY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yww+iz0LgWRKusYFgk3Z1BEIiuJQpatTb1z7p7FMKQqQkb5Prjz
	3uUDwTP45WarLMUzvgqlbLfrbFcgXjFd13IMtyTm28mWASiW6nmZIF52E+XmyL/n/w4EIqx8PVp
	0WQbPUg==
X-Google-Smtp-Source: AGHT+IGBA/7l2Y00mq2tKuHgsoC2Vh7DTpI1vMh/ziPIV8TEof2vJ3kfBxvx6xwbQVY5kq+NVe6D9rLs+nTL
X-Received: from pjbos13.prod.google.com ([2002:a17:90b:1ccd:b0:2ff:8471:8e53])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:51cb:b0:301:c5cb:7b13
 with SMTP id 98e67ed59e1d1-30531f7c81bmr21841967a91.3.1743531884353; Tue, 01
 Apr 2025 11:24:44 -0700 (PDT)
Date: Tue,  1 Apr 2025 11:23:02 -0700
In-Reply-To: <20250401182347.3422199-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250401182347.3422199-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250401182347.3422199-5-irogers@google.com>
Subject: [PATCH v1 04/48] x86/insn: Silence -Wshorten-64-to-32 warnings
From: Ian Rogers <irogers@google.com>
To: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Yicong Yang <yangyicong@hisilicon.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Kyle Meyer <kyle.meyer@hpe.com>, 
	Ben Gainey <ben.gainey@arm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Kajol Jain <kjain@linux.ibm.com>, Aditya Gupta <adityag@linux.ibm.com>, 
	Eder Zulian <ezulian@redhat.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Kuan-Wei Chiu <visitorckw@gmail.com>, He Zhe <zhe.he@windriver.com>, 
	Dirk Gouders <dirk@gouders.net>, Brian Geffon <bgeffon@google.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Howard Chu <howardchu95@gmail.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Colin Ian King <colin.i.king@gmail.com>, 
	Dominique Martinet <asmadeus@codewreck.org>, Jann Horn <jannh@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Yang Jihong <yangjihong@bytedance.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andi Kleen <ak@linux.intel.com>, Graham Woodward <graham.woodward@arm.com>, 
	Ilkka Koskinen <ilkka@os.amperecomputing.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Zhongqiu Han <quic_zhonhan@quicinc.com>, 
	Hao Ge <gehao@kylinos.cn>, Tengda Wu <wutengda@huaweicloud.com>, 
	Gabriele Monaco <gmonaco@redhat.com>, Chun-Tse Shao <ctshao@google.com>, 
	Casey Chen <cachen@purestorage.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Li Huafei <lihuafei1@huawei.com>, "Steinar H. Gunderson" <sesse@google.com>, Levi Yun <yeoreum.yun@arm.com>, 
	Weilin Wang <weilin.wang@intel.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Thomas Richter <tmricht@linux.ibm.com>, Andrew Kreimer <algonell@gmail.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Jean-Philippe Romain <jean-philippe.romain@foss.st.com>, Junhao He <hejunhao3@huawei.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Xu Yang <xu.yang_2@nxp.com>, 
	Steve Clevenger <scclevenger@os.amperecomputing.com>, Zixian Cai <fzczx123@gmail.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Yujie Liu <yujie.liu@intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

The clang warning -Wshorten-64-to-32 can be useful to catch
inadvertent truncation. In some instances this truncation can lead to
changing the sign of a result, for example, truncation to return an
int to fit a sort routine. Silence the warning by making the implicit
truncation explicit.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/arch/x86/lib/insn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/arch/x86/lib/insn.c b/tools/arch/x86/lib/insn.c
index e91d4c4e1c16..5fa8697498fe 100644
--- a/tools/arch/x86/lib/insn.c
+++ b/tools/arch/x86/lib/insn.c
@@ -92,7 +92,7 @@ static int __insn_get_emulate_prefix(struct insn *insn,
 			goto err_out;
 	}
 
-	insn->emulate_prefix_size = len;
+	insn->emulate_prefix_size = (int)len;
 	insn->next_byte += len;
 
 	return 1;
-- 
2.49.0.504.g3bcea36a83-goog

