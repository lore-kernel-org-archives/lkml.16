Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3576226CE5
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 18:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743531960; cv=none; b=h7dExHxDe6yuTgHLbenCOqWkoDXE5Ate5tToLXiMBXLZ3rJeYndxETOZU24b1n4BX9+LgLTcBwZrSSEju4ioJVa0CCRzhm/Glrn91uhozQtxjRvYOrTTGTjJKTKOMqQjQbJLCNBhkIJEuwTiT0fJFL56otVAcmUCbTLZ2rX7dY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743531960; c=relaxed/simple;
	bh=W6yinm4HkHn1me23Ec0J0FcyIK2+wzf4A7dc5FyKbDc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=tIs89N45dSD5isnP1wYF3MhOEZaAZkL2EhtMETDiXzy93RE/Iv6EbqbNIBNUN4FQ4/NjEUVtnkP4dzghzyGEqpeCt9TnP0TwyK2XWXYZm885LzVEdNbTf4+FPgCiJ6Em6+9qNu1BcuZTfrv95rqGq/dLG56BmD+iTu0zC//Juxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A/zpJM4v; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A/zpJM4v"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2240c997059so134742865ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 11:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743531958; x=1744136758; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C5U3R/UrwewYisfEOqePuN2BIRCQ22drd6rnFQ3244c=;
        b=A/zpJM4v7ol28qip48DatWK6Dp4l9JzoVHrlhT0+D24iABis88HOG/Dg509G7NigA6
         O6T0k7tLJGJf0Ws8naJkhWobbfIcuABLMYciaamuSpjM52cxwlfoPfXGxvV9N/g1dwHe
         JudXWochbLXaqt1MKheBUJtCk6MCAVBJA/8dn1TS7xsrNi4tqZm6ptnm4KK/AcpDz+Lt
         fxTtc+HAXB0zyC1ufVG0NrLT2FDOQ/1iuGWeT88IzDZKN0p2upgZr83XNuHna7CejvDy
         lLwK8ABQvORjJHJCa8zI2oVBB8e3JAjDQMWCME9gFFglKjIpOSclyCZnd7YUZWNdy+Oi
         +53Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743531958; x=1744136758;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C5U3R/UrwewYisfEOqePuN2BIRCQ22drd6rnFQ3244c=;
        b=GXaSugwt3xOVjy2FF+Qwwwwh/Luat3B3J5jFpJ5InCeoatxVevX0Tdl/51elqajJSh
         7vz1+9nFWwWPC9WA1gxjvgghULDV7nGSoIeUqMzDiU/8SgFDd6gjlp2D4zPWC8K1vWnM
         8/ASd/Qt1mNSt9PAmBZElh316WD7I0jHS9E2Hv+uv9Y6O5hWjZZEDsXcZYQZ/sFiOBPx
         dzPNNXaREuCAGMiSiBfceOpxXBaKkVD+sbv3peJVlC6SvMl82vOMN3Gd/E+bQVXjwuE+
         TMgNBXHaeIk6vY1dOEaJNw24mON+z9nqnKXh3BoPSpptZCHfPoYimFb9p/WsGgmg7vjI
         cgPw==
X-Forwarded-Encrypted: i=1; AJvYcCW77bRj9g0h3boKpeoaS9efGOH2ieqlz55NAiguffxAXadkrs8BKOmwV8zJHHEQ80SrE8Fc/fdnL2ewt+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEwRUZvXHnLDrng959Df8ALrPQgtqdzioMHWgVuYq1rlpbCvf6
	NoTAaXd4mKLIj3AIXi+5LyVLM8I/RYs+DxL8PjAOxiTuubUefGyW+z56h4pRigWMJtZ6kkbElSf
	9+Idi9Q==
X-Google-Smtp-Source: AGHT+IGqboy2GJ8KcKXgHvINA6kBdII8ptQNXP56vNZrZaxnHdkJFqlrjLnbAqPsXDoTdL86TSRYYNPIfspz
X-Received: from pfbho20.prod.google.com ([2002:a05:6a00:8814:b0:736:af6b:e58d])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:aa7:8890:0:b0:736:52d7:daca
 with SMTP id d2e1a72fcca58-7398042a376mr23457517b3a.18.1743531957749; Tue, 01
 Apr 2025 11:25:57 -0700 (PDT)
Date: Tue,  1 Apr 2025 11:23:38 -0700
In-Reply-To: <20250401182347.3422199-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250401182347.3422199-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250401182347.3422199-41-irogers@google.com>
Subject: [PATCH v1 40/48] perf list: Silence -Wshorten-64-to-32 warnings
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
 tools/perf/builtin-list.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/builtin-list.c b/tools/perf/builtin-list.c
index fed482adb039..ffe2e972e3f2 100644
--- a/tools/perf/builtin-list.c
+++ b/tools/perf/builtin-list.c
@@ -93,7 +93,7 @@ static void wordwrap(FILE *fp, const char *s, int start, int max, int corr)
 	bool comma = false;
 
 	while (*s) {
-		int wlen = strcspn(s, " ,\t\n");
+		int wlen = (int)strcspn(s, " ,\t\n");
 		const char *sep = comma ? "," : " ";
 
 		if ((column + wlen >= max && column > start) || saw_newline) {
@@ -171,7 +171,7 @@ static void default_print_event(void *ps, const char *topic, const char *pmu_nam
 		int desc_len = -1;
 
 		if (pmu_name && strcmp(pmu_name, "default_core")) {
-			desc_len = strlen(desc);
+			desc_len = (int)strlen(desc);
 			desc_len = asprintf(&desc_with_unit,
 					    desc_len > 0 && desc[desc_len - 1] != '.'
 					      ? "%s. Unit: %s" : "%s Unit: %s",
-- 
2.49.0.504.g3bcea36a83-goog

