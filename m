Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F58D1B6CE9
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739172167; cv=none; b=i5cAkQvCh01DJAY1s0F9Lu1q6zyYaCjmG+Xfof8uyMA5a5eBguRlzcogh3VDL+R6S8RZydvRg2WX5U55RiF//82E+a1Ih4dX2gSP8/TOQQCT67rtY4sp36lhl4e80IQKsk5J9KXgI4CGoWNgMjyt6at/lJ+ScdZFF6zurxIgI+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739172167; c=relaxed/simple;
	bh=FkkhpQQNgHTRR+bAMkblL7lnICrRS0qX2m5AHBb6fjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iyljxTd/sXRWVRloTAWJKsXiFqEk39mX1yaCNTtal2J0LLh1cS851+Hc6mGscQEDjHBgAfQDD8ok1+YXuWsRiytb+2Pz57GfvbZN5Z4bvxeRqFRvqahsnGi7ZJ3i9I3RoATRaZsrJBqFBWv08lIwN56tFju+PjBRUBFaM4f/kbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=UsbmSFtZ; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="UsbmSFtZ"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c04df48a5bso137628185a.2
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 23:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1739172163; x=1739776963; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QRiPaDvLh0TgDzkJqtvQgteH0/7MhRxsaWow4OwTnOY=;
        b=UsbmSFtZiyHDRmcJQbLFFRx0l382lg8CNVeGD8r0CYoBkNaMvsXrBEJudDCf49AuAb
         7RM98CdkkVCBEWo7dTmbXb3luxZNYNlGrzPUlUL6VeVLp41afDzfDOXFZMSnbfPoLEfZ
         4z5xze0z42740tszzL/CAQU+UNGjpzp7t2ZGU9hPd9RwwfGoJN0qdBPbTSfohBgZQCoW
         6YsRqHidFbzC1rugTV75nnkvLDjJrPPjyICAzNcG8P92fTPEMO9G4cpDPDKS6Tjg7UWp
         FB1oRog8kJjnPsCbqSeqNtui5D5aeIVw2eyV3FVX6uEx3qE4T+UvsbearpsfizxLpXfB
         4ukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739172163; x=1739776963;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QRiPaDvLh0TgDzkJqtvQgteH0/7MhRxsaWow4OwTnOY=;
        b=UEWjeKngIt/5YSgzPab3Q4cGeOefFIkFXonxmR4fPb0HpTAn3mv8DCIeOopBUJ+c2w
         JRaCscoNvF7CsOy9T36Nms7JTZSHA1yn9CPSF3xmGLr+PjiAcZcfoTaD3Cih0mFRN5fD
         MaNbOGfivxosHvbJDm4TX8xeg4kn/OUp/ub3zCM/CSfoYgikWGgcjVA1/JSLNodNTz13
         SBROo87buBqEV62Z7rG8HbotVryD6uBMRBBnnikF93T6wuYlPEawWae7pY/zFd8SIcpH
         6qMs6YdvshSagE0pUirxx9GcYpB5RnQIjAwU8x8DSreGhIF67LBE/WeISLrSrLFjRzLQ
         jp9g==
X-Forwarded-Encrypted: i=1; AJvYcCW3hnLjJ7lS0V3iV32Trv+2J1l74Rc1XspkWiGvh70ZYLGVmeL3zsmz0/9TH75YMsHwZEm0MlQNHrVjX1s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMNRDLvmrDnlLHHGVw7l7T61X9myjurdOS3Lwvu2c3G/YHyoEp
	qCxAUlwM42nKDebMu2mkTw7LRGKHfu4Mv70Pb4k78FCtkAaDx/ZkOm/NNlgUy2U=
X-Gm-Gg: ASbGncuyC5NpS6ua2TXzc/CKLpIQNuOkQoF0RB4ll15baidPyurxFZ0aoaANAKZh3ar
	NQPlOeD+H5+YyTuB1VnmOdWsUFemvTerswMP1qjrMhYnYweJ0bOgYLN45NhQxhWWKcA3XAG1ry/
	4vuL2pg7c0LfzpqqYS4ZkdV5582M+nixFbSNSCLXrrVaLuLhbCSesWdg/zpzTuU9mTr977Nkj19
	ekqpFyhs+Z05DEUpebI0l6AkF2a2SpA/h7s3f6XE/OyGrdB8HvaMcIlt6j6IokflWYkimdwQPDE
	DAM2
X-Google-Smtp-Source: AGHT+IGqQVePZxVF5Vyx4zKG5yY/Q0jOMz9QBzyVpccdscUkIj9rn1n9yNKmtqAXJAJRezMjKRzINQ==
X-Received: by 2002:a05:620a:2485:b0:7c0:5f6c:a33f with SMTP id af79cd13be357-7c05f6ca392mr420431485a.31.1739172163524;
        Sun, 09 Feb 2025 23:22:43 -0800 (PST)
Received: from debian.debian ([2a09:bac5:79dd:f9b::18e:183])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c041e9f94csm496264385a.78.2025.02.09.23.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 23:22:42 -0800 (PST)
Date: Sun, 9 Feb 2025 23:22:39 -0800
From: Yan Zhai <yan@cloudflare.com>
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>,
	Yan Zhai <yan@cloudflare.com>, Brian Vazquez <brianvv@google.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kernel-team@cloudflare.com, Hou Tao <houtao@huaweicloud.com>
Subject: [PATCH v3 bpf 2/2] selftests: bpf: test batch lookup on array of
 maps with holes
Message-ID: <9007237b9606dc2ee44465a4447fe46e13f3bea6.1739171594.git.yan@cloudflare.com>
References: <cover.1739171594.git.yan@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1739171594.git.yan@cloudflare.com>

Iterating through array of maps may encounter non existing keys. The
batch operation should not fail on when this happens.

Signed-off-by: Yan Zhai <yan@cloudflare.com>
Acked-by: Hou Tao <houtao1@huawei.com>
---
 .../bpf/map_tests/map_in_map_batch_ops.c      | 62 +++++++++++++------
 1 file changed, 44 insertions(+), 18 deletions(-)

diff --git a/tools/testing/selftests/bpf/map_tests/map_in_map_batch_ops.c b/tools/testing/selftests/bpf/map_tests/map_in_map_batch_ops.c
index 66191ae9863c..79c3ccadb962 100644
--- a/tools/testing/selftests/bpf/map_tests/map_in_map_batch_ops.c
+++ b/tools/testing/selftests/bpf/map_tests/map_in_map_batch_ops.c
@@ -120,11 +120,12 @@ static void validate_fetch_results(int outer_map_fd,
 
 static void fetch_and_validate(int outer_map_fd,
 			       struct bpf_map_batch_opts *opts,
-			       __u32 batch_size, bool delete_entries)
+			       __u32 batch_size, bool delete_entries,
+			       bool has_holes)
 {
-	__u32 *fetched_keys, *fetched_values, total_fetched = 0;
-	__u32 batch_key = 0, fetch_count, step_size;
-	int err, max_entries = OUTER_MAP_ENTRIES;
+	int err, max_entries = OUTER_MAP_ENTRIES - !!has_holes;
+	__u32 *fetched_keys, *fetched_values, total_fetched = 0, i;
+	__u32 batch_key = 0, fetch_count, step_size = batch_size;
 	__u32 value_size = sizeof(__u32);
 
 	/* Total entries needs to be fetched */
@@ -134,9 +135,8 @@ static void fetch_and_validate(int outer_map_fd,
 	      "Memory allocation failed for fetched_keys or fetched_values",
 	      "error=%s\n", strerror(errno));
 
-	for (step_size = batch_size;
-	     step_size <= max_entries;
-	     step_size += batch_size) {
+	/* hash map may not always return full batch */
+	for (i = 0; i < OUTER_MAP_ENTRIES; i++) {
 		fetch_count = step_size;
 		err = delete_entries
 		      ? bpf_map_lookup_and_delete_batch(outer_map_fd,
@@ -155,6 +155,7 @@ static void fetch_and_validate(int outer_map_fd,
 		if (err && errno == ENOSPC) {
 			/* Fetch again with higher batch size */
 			total_fetched = 0;
+			step_size += batch_size;
 			continue;
 		}
 
@@ -184,18 +185,19 @@ static void fetch_and_validate(int outer_map_fd,
 }
 
 static void _map_in_map_batch_ops(enum bpf_map_type outer_map_type,
-				  enum bpf_map_type inner_map_type)
+				  enum bpf_map_type inner_map_type,
+				  bool has_holes)
 {
+	__u32 max_entries = OUTER_MAP_ENTRIES - !!has_holes;
 	__u32 *outer_map_keys, *inner_map_fds;
-	__u32 max_entries = OUTER_MAP_ENTRIES;
 	LIBBPF_OPTS(bpf_map_batch_opts, opts);
 	__u32 value_size = sizeof(__u32);
 	int batch_size[2] = {5, 10};
 	__u32 map_index, op_index;
 	int outer_map_fd, ret;
 
-	outer_map_keys = calloc(max_entries, value_size);
-	inner_map_fds = calloc(max_entries, value_size);
+	outer_map_keys = calloc(OUTER_MAP_ENTRIES, value_size);
+	inner_map_fds = calloc(OUTER_MAP_ENTRIES, value_size);
 	CHECK((!outer_map_keys || !inner_map_fds),
 	      "Memory allocation failed for outer_map_keys or inner_map_fds",
 	      "error=%s\n", strerror(errno));
@@ -209,6 +211,24 @@ static void _map_in_map_batch_ops(enum bpf_map_type outer_map_type,
 			((outer_map_type == BPF_MAP_TYPE_ARRAY_OF_MAPS)
 			 ? 9 : 1000) - map_index;
 
+	/* This condition is only meaningful for array of maps.
+	 *
+	 * max_entries == OUTER_MAP_ENTRIES - 1 if it is true. Say
+	 * max_entries is short for n, then outer_map_keys looks like:
+	 *
+	 *   [n, n-1, ... 2, 1]
+	 *
+	 * We change it to
+	 *
+	 *   [n, n-1, ... 2, 0]
+	 *
+	 * So it will leave key 1 as a hole. It will serve to test the
+	 * correctness when batch on an array: a "non-exist" key might be
+	 * actually allocated and returned from key iteration.
+	 */
+	if (has_holes)
+		outer_map_keys[max_entries - 1]--;
+
 	/* batch operation - map_update */
 	ret = bpf_map_update_batch(outer_map_fd, outer_map_keys,
 				   inner_map_fds, &max_entries, &opts);
@@ -219,15 +239,17 @@ static void _map_in_map_batch_ops(enum bpf_map_type outer_map_type,
 	/* batch operation - map_lookup */
 	for (op_index = 0; op_index < 2; ++op_index)
 		fetch_and_validate(outer_map_fd, &opts,
-				   batch_size[op_index], false);
+				   batch_size[op_index], false,
+				   has_holes);
 
 	/* batch operation - map_lookup_delete */
 	if (outer_map_type == BPF_MAP_TYPE_HASH_OF_MAPS)
 		fetch_and_validate(outer_map_fd, &opts,
-				   max_entries, true /*delete*/);
+				   max_entries, true /*delete*/,
+				   has_holes);
 
 	/* close all map fds */
-	for (map_index = 0; map_index < max_entries; map_index++)
+	for (map_index = 0; map_index < OUTER_MAP_ENTRIES; map_index++)
 		close(inner_map_fds[map_index]);
 	close(outer_map_fd);
 
@@ -237,16 +259,20 @@ static void _map_in_map_batch_ops(enum bpf_map_type outer_map_type,
 
 void test_map_in_map_batch_ops_array(void)
 {
-	_map_in_map_batch_ops(BPF_MAP_TYPE_ARRAY_OF_MAPS, BPF_MAP_TYPE_ARRAY);
+	_map_in_map_batch_ops(BPF_MAP_TYPE_ARRAY_OF_MAPS, BPF_MAP_TYPE_ARRAY, false);
 	printf("%s:PASS with inner ARRAY map\n", __func__);
-	_map_in_map_batch_ops(BPF_MAP_TYPE_ARRAY_OF_MAPS, BPF_MAP_TYPE_HASH);
+	_map_in_map_batch_ops(BPF_MAP_TYPE_ARRAY_OF_MAPS, BPF_MAP_TYPE_HASH, false);
 	printf("%s:PASS with inner HASH map\n", __func__);
+	_map_in_map_batch_ops(BPF_MAP_TYPE_ARRAY_OF_MAPS, BPF_MAP_TYPE_ARRAY, true);
+	printf("%s:PASS with inner ARRAY map with holes\n", __func__);
+	_map_in_map_batch_ops(BPF_MAP_TYPE_ARRAY_OF_MAPS, BPF_MAP_TYPE_HASH, true);
+	printf("%s:PASS with inner HASH map with holes\n", __func__);
 }
 
 void test_map_in_map_batch_ops_hash(void)
 {
-	_map_in_map_batch_ops(BPF_MAP_TYPE_HASH_OF_MAPS, BPF_MAP_TYPE_ARRAY);
+	_map_in_map_batch_ops(BPF_MAP_TYPE_HASH_OF_MAPS, BPF_MAP_TYPE_ARRAY, false);
 	printf("%s:PASS with inner ARRAY map\n", __func__);
-	_map_in_map_batch_ops(BPF_MAP_TYPE_HASH_OF_MAPS, BPF_MAP_TYPE_HASH);
+	_map_in_map_batch_ops(BPF_MAP_TYPE_HASH_OF_MAPS, BPF_MAP_TYPE_HASH, false);
 	printf("%s:PASS with inner HASH map\n", __func__);
 }
-- 
2.39.5


