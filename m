Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257C42AC17
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 11:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747655796; cv=none; b=I38KptjTvN2hcCdCXX99uGQYgN1Gqda7F6mQrUi5qyKYrxd74bc8hMzn/GGcXAXBxkWferN/m17ovxCKKSkEp2tNIlgqeraIiEbPqMlxKUOy3xTV4doxnUyhTkH25xdxl2H2LPuBfXAaF9pyPr3nPgiBNoilJaiSRL9dgioUGTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747655796; c=relaxed/simple;
	bh=0n2JWhGyhvYwDbFac0GD4XIJ4ADLblcQohaWbwHNxUo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hGINlk2RTNLk9X15OMxDLGXRzrMz18ax1U/BIZgvGXbvXfpVG11eFcDBuJ8vCL87PQcjZmLfzARNRP+cLfz+Y6R5jKObu7IhBrNdkJaQp9ZxHOiRcF7eHUDOGpurJAIfiR9b30atnao+B5UPQbQ5SaI3jemL8BE0sZ+yhZpGRyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4b1GJx0XJNz2CdWW;
	Mon, 19 May 2025 19:52:49 +0800 (CST)
Received: from kwepemk100018.china.huawei.com (unknown [7.202.194.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 1597D1A016C;
	Mon, 19 May 2025 19:56:30 +0800 (CST)
Received: from huawei.com (10.175.104.170) by kwepemk100018.china.huawei.com
 (7.202.194.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 19 May
 2025 19:56:29 +0800
From: Fei Lang <langfei@huawei.com>
To: <peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<namhyung@kernel.org>
CC: <mark.rutland@arm.com>, <alexander.shishkin@linux.intel.com>,
	<jolsa@kernel.org>, <irogers@google.com>, <adrian.hunter@intel.com>,
	<kan.liang@linux.intel.com>, <james.clark@linaro.org>,
	<linux-kernel@vger.kernel.org>, <hewenliang4@huawei.com>,
	<liuchao173@huawei.com>, <laihangliang1@huawei.com>
Subject: [PATCH] perf comm str: Fix perf top coredump due to concurrent read and write
Date: Mon, 19 May 2025 19:48:36 +0800
Message-ID: <20250519114836.611110-1-langfei@huawei.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk100018.china.huawei.com (7.202.194.66)

(gdb) bt
    __strcmp_evex () at ../sysdeps/x86_64/multiarch/strcmp-evex.S:314
    sort.comm_collapse () at util/sort.c:202
    hist_entry__collapse at util/hist.c:1312
    hists__collapse_insert_entry at util/hist.c:1620
    hists__collapse_resort at util/hist.c:1704
    perf_top__resort_hists at builtin-top.c:303
    perf_top__print_sym_table at builtin-top.c:350
    display_thread at builtin-top.c:700

Link:https://bugzilla.kernel.org/show_bug.cgi?id=220096

Fixes: <3178f58b9894> ("perf comm str: Avoid sort during insert")
Signed-off-by: Fei Lang <langfei@huawei.com>
---
 tools/perf/util/comm.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/comm.c b/tools/perf/util/comm.c
index 8aa456d7c2cd..0438870d31d2 100644
--- a/tools/perf/util/comm.c
+++ b/tools/perf/util/comm.c
@@ -209,13 +209,16 @@ struct comm *comm__new(const char *str, u64 timestamp, bool exec)
 int comm__override(struct comm *comm, const char *str, u64 timestamp, bool exec)
 {
 	struct comm_str *new, *old = comm->comm_str;
+	struct comm_strs *comm_strs = comm_strs__get();
 
 	new = comm_strs__findnew(str);
 	if (!new)
 		return -ENOMEM;
 
+	down_write(&comm_strs->lock);
 	comm_str__put(old);
 	comm->comm_str = new;
+	up_write(&comm_strs->lock);
 	comm->start = timestamp;
 	if (exec)
 		comm->exec = true;
@@ -225,11 +228,22 @@ int comm__override(struct comm *comm, const char *str, u64 timestamp, bool exec)
 
 void comm__free(struct comm *comm)
 {
+	struct comm_strs *comm_strs = comm_strs__get();
+
+	down_write(&comm_strs->lock);
 	comm_str__put(comm->comm_str);
 	free(comm);
+	up_write(&comm_strs->lock);
 }
 
 const char *comm__str(const struct comm *comm)
 {
-	return comm_str__str(comm->comm_str);
+	struct comm_strs *comm_strs = comm_strs__get();
+	char *p;
+
+	down_read(&comm_strs->lock);
+	p = comm_str__str(comm->comm_str);
+	up_read(&comm_strs->lock);
+
+	return p;
 }
-- 
2.33.0

