Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A7C230264
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 17:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748538067; cv=none; b=sur+odXgpcK+cHeOVc88oIukfEbxex32JudQZuWh145+LE4K4HHESVfAMn92GE9xNTfxv6n4hvoC19ajbzQgyYwg7y+pLd3PbagK1DfeJFFzHZCbzO2GktLyb0Ehy6I32dzZhECi/hcJ+eO7su79SwEdRqlqRTo3q/Bta5rHFs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748538067; c=relaxed/simple;
	bh=uPum7yv/dAZtpDFCqHdVSBCWZGxdW+YMTMLQT39qaE4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bRWBMzL76M1j8h8+RrRdiX+3mYddXyoofMhw1f30VOS0kA/x95aMJGrg84skqa8f9nGjvVJF3sS9zlBKlg/2bh3EDleCEgCgl/QwhD6gVEbmzTaYOJblhouZxiehmv/+Wntg3njaavBhztXrgDNhK+DCFa6YRwOkQ+XcSnztsCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=S85SxyHK; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="S85SxyHK"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748538052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B2Db6aTs76/+FLLSB4vYJtBNL4/EggBTobsksTp3ywQ=;
	b=S85SxyHKQ8gBkcwFuzwNP9qt3xWEVGNReKP5S7NC0ua6BVQAs9DgbVQavl6/zBGnTY29WR
	tQ8aDJyMBSNn3jt5fYeWAWx4EelopbU61jDKGFrF4mI45uQzvHEzSg+0ROmSOV3HQcEycr
	R5a14Tdd3OfqvXVPygJmzQaSkuuQOKU=
From: Tao Chen <chen.dylane@linux.dev>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	qmo@kernel.org,
	jolsa@kernel.org
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tao Chen <chen.dylane@linux.dev>
Subject: [PATCH bpf-next  2/3] selftests/bpf: Add cookies check for raw_tp fill_link_info test
Date: Fri, 30 May 2025 00:57:58 +0800
Message-Id: <20250529165759.2536245-2-chen.dylane@linux.dev>
In-Reply-To: <20250529165759.2536245-1-chen.dylane@linux.dev>
References: <20250529165759.2536245-1-chen.dylane@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add tests for getting cookie with fill_link_info for raw_tp.

Signed-off-by: Tao Chen <chen.dylane@linux.dev>
---
 .../selftests/bpf/prog_tests/bpf_cookie.c     | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c b/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
index 6befa87043..0774ae6c1b 100644
--- a/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
+++ b/tools/testing/selftests/bpf/prog_tests/bpf_cookie.c
@@ -635,10 +635,29 @@ static void tp_btf_subtest(struct test_bpf_cookie *skel)
 	bpf_link__destroy(link);
 }
 
+static int verify_raw_tp_link_info(int fd, u64 cookie)
+{
+	struct bpf_link_info info;
+	int err;
+	u32 len = sizeof(info);
+
+	memset(&info, 0, sizeof(info));
+	err = bpf_link_get_info_by_fd(fd, &info, &len);
+	if (!ASSERT_OK(err, "get_link_info"))
+		return -1;
+
+	if (!ASSERT_EQ(info.type, BPF_LINK_TYPE_RAW_TRACEPOINT, "link_type"))
+		return -1;
+
+	ASSERT_EQ(info.raw_tracepoint.cookie, cookie, "raw_tp_cookie");
+
+	return 0;
+}
+
 static void raw_tp_subtest(struct test_bpf_cookie *skel)
 {
 	__u64 cookie;
-	int prog_fd, link_fd = -1;
+	int err, prog_fd, link_fd = -1;
 	struct bpf_link *link = NULL;
 	LIBBPF_OPTS(bpf_raw_tp_opts, raw_tp_opts);
 	LIBBPF_OPTS(bpf_raw_tracepoint_opts, opts);
@@ -656,6 +675,11 @@ static void raw_tp_subtest(struct test_bpf_cookie *skel)
 		goto cleanup;
 
 	usleep(1); /* trigger */
+
+	err = verify_raw_tp_link_info(link_fd, cookie);
+	if (!ASSERT_OK(err, "verify_raw_tp_link_info"))
+		goto cleanup;
+
 	close(link_fd); /* detach */
 	link_fd = -1;
 
-- 
2.43.0

