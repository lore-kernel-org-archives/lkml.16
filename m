Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68D02989AC
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 17:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746035544; cv=none; b=K7rO/ads4z+k/nnKlMbqpnaeUxqG9XqXRVkXLcdEA4AdRPGBfVyQC57m/euco6QErdAash4LFUV5W8vcstqJszXO7ADp0rrcyGWogMUUXow5IJwHopydeaTYLnYCOx1/qm1HR07QloOsOZuonlHBVEUPRYsrrV7O4su0hP2Z7t4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746035544; c=relaxed/simple;
	bh=8xk6c6XVrGf8DBibt8WgV9cuw6KjrbvUvvlMxNIw7J4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IS4cUQzHgJolAWOO74imqzzoiN6i33vx6TtVSPooqNSYwfRYVYx+T/Vk4h5m8qVZyLiyuxcihZlWDYV25qzgiZUuny8njN24k8kksQdJPfT5YL7xtKTgxCdrwCohhEQzxXRGV89pcvExKh6Caw1IhHREo8i5s2nK5qOrwAzGGRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gCs+cw/S; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gCs+cw/S"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-30828f9af10so202967a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746035542; x=1746640342; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BfYoNaqxvhQ9eTV8t6yeDJ1HU1t4q/f6AZhR7HYRkks=;
        b=gCs+cw/S/LjBdV1VhN+YxtTZ2vqZwADnyvHqjhBDC6+hqSjth0/EIZbPnoAPbtFZga
         pKGiuw4/z2BgVllcFbJbsrmE++PjNkITswoS9qUEZz39KDxHWrpEcmlOxk4nJgdlILKa
         J2Jp0TpX3ukN7gmznXHnP7EGyVfaKBBYnOc/9+sPRmaESBtJtMRn1CmnaRF7mQsR9zVb
         jBS65zK3m2K8DUjVLlgwACLk3DkaOfTlcfKWLiW775ekTq9+sDqkqlCVD+oPTWzHX9vM
         q1n7Q8mobt7XfCLbjUEm4FYHfmElP90O4/0DD0nt6TRMibC+kfzKYWMKCwoxx7NVmPG8
         g7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746035542; x=1746640342;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BfYoNaqxvhQ9eTV8t6yeDJ1HU1t4q/f6AZhR7HYRkks=;
        b=Z4m/kbFhRwAEWw0NTAQsVPI9bwTAqn+WKiAk/y/bztxuOryYlUuOxPBx5Itceq3aR/
         GnU9/14qkIb5GZePo6eELCKYjjYbgkYeJaJMwmobgndquyHxdH10KaHJ3DkM12/UEeK+
         PVov/YPdOuPbeXFHNNdmZIyl9Fr894IhU2DOWAZ/gz9iZPPcWsHQLXT9tuOaWhuQu150
         LGxx+/3mn0vbGaqn7ySQ2pDfhmsR4hNKT15ilVfVsUieX/cqXJyhmLT5L3XwzDURZz+c
         TXCJAJ00uFOg+a7YPdMsiAUvmG8p/dcMoHcUvzrbuEgR/ecWApmQVwinGlupNHRBDfk/
         zhTA==
X-Forwarded-Encrypted: i=1; AJvYcCWy1j8JTQKLDPlu5W5qDXpZOCTbzmSssXaRd8uAhTN6NBAj4K9JrQMM3TNWZR+qdElU36m5vZ6DzR4Ut4Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2zXBEhjYyq1JTNRBEY0w0Z6qDmgYZ24v7o3Q9/uRTD9K8Becs
	LNwZE+bmcbWHpQgs00As2zH1actr7nbusnNnVTOhzqR77iM1DwwIeGVhM/4LhFEC+KOawCY3iq+
	EED1Ajg==
X-Google-Smtp-Source: AGHT+IGE6ShT5AKZEjfO76Ud9wq255vjvupnoQSaA/IRCz6DrEQ38RNaMX6Vlst1q29yf69v7lZZ4wLh25wT
X-Received: from pjbpl2.prod.google.com ([2002:a17:90b:2682:b0:2fc:d77:541])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4cce:b0:2ee:df70:1ff3
 with SMTP id 98e67ed59e1d1-30a342f5554mr6408540a91.0.1746035542002; Wed, 30
 Apr 2025 10:52:22 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:50:30 -0700
In-Reply-To: <20250430175036.184610-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250430175036.184610-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250430175036.184610-43-irogers@google.com>
Subject: [PATCH v2 42/47] perf daemon: Silence -Wshorten-64-to-32 warnings
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Thomas Gleixner <tglx@linutronix.de>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
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
	Li Huafei <lihuafei1@huawei.com>, "Steinar H. Gunderson" <sesse@google.com>, 
	Levi Yun <yeoreum.yun@arm.com>, Weilin Wang <weilin.wang@intel.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Thomas Richter <tmricht@linux.ibm.com>, 
	Andrew Kreimer <algonell@gmail.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Jean-Philippe Romain <jean-philippe.romain@foss.st.com>, Junhao He <hejunhao3@huawei.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Xu Yang <xu.yang_2@nxp.com>, 
	Steve Clevenger <scclevenger@os.amperecomputing.com>, Zixian Cai <fzczx123@gmail.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Yujie Liu <yujie.liu@intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Cc: Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

The clang warning -Wshorten-64-to-32 can be useful to catch
inadvertent truncation. In some instances this truncation can lead to
changing the sign of a result, for example, truncation to return an
int to fit a sort routine. Silence the warning by making the implicit
truncation explicit.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-daemon.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/perf/builtin-daemon.c b/tools/perf/builtin-daemon.c
index f0568431fbd5..640ba8191083 100644
--- a/tools/perf/builtin-daemon.c
+++ b/tools/perf/builtin-daemon.c
@@ -514,7 +514,8 @@ static int daemon_session__control(struct daemon_session *session,
 	struct pollfd pollfd = { .events = POLLIN, };
 	char control_path[PATH_MAX];
 	char ack_path[PATH_MAX];
-	int control, ack = -1, len;
+	int control, ack = -1;
+	size_t len;
 	char buf[20];
 	int ret = -1;
 	ssize_t err;
@@ -543,7 +544,7 @@ static int daemon_session__control(struct daemon_session *session,
 	len = strlen(msg);
 
 	err = writen(control, msg, len);
-	if (err != len) {
+	if (err != (ssize_t)len) {
 		pr_err("failed: write to control pipe: %d (%s)\n",
 		       errno, control_path);
 		goto out;
-- 
2.49.0.906.g1f30a19c02-goog

