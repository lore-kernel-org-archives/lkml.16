Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53A522DA10
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 17:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748538051; cv=none; b=umxYlFkFLL1MXG2bLQWUWHJjvi6JZ4Hm/8iz7ZRMTNNXltZ7IzUxtCuRA1wse6NDUU7KNSsVEcIIEZD3XRwdD/5JetJbBCREjpWIQUkki68m485cAt+DSsqOatqKpOX1Z+Rz7P2rEMm5PHfKNj055CPftGxe2XteylFLmOwcMwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748538051; c=relaxed/simple;
	bh=ftAe5S1eBobAmiDczo+Rhs7i2N623ddySoduRd79TKk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cMdELINMYRsMQhhltVg7X4EYO5a3BT657ka2O3seRr6fbbWVIFi5jKdBLGccorYui4hMCIxsvsJ/qHR02cZYyJdW0Jef4OwS8I9FMoQcjMGf3niXiTqqg7E8f5Z4jKOVMs5XWY9K/ueWPjguH0QTH16pVeCT0uoABI/R8olZhSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pNpNeaqA; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pNpNeaqA"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748538037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nF4/5klNQRph936DO2AGV4d8MR28RC5kMXGHw5XVWBg=;
	b=pNpNeaqA+Ns1ESM3752Og0tIpBwWLItP8IUUPJTKfuRHXTehtWmWkj5QadGbFi7dqx0s7f
	3pxw2Ey41Ex6ecCEIpDXpH+0qWDl5WSvP2vz/gOaKMgehp4sDHDO+LNYhyQWBIF9PBYHFj
	ZreUd+qIE3i9x+SkgruEaOVF2PlmfLo=
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
Subject: [PATCH bpf-next  1/3] bpf: Add cookie to raw_tp bpf_link_info
Date: Fri, 30 May 2025 00:57:57 +0800
Message-Id: <20250529165759.2536245-1-chen.dylane@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

After commit 68ca5d4eebb8 ("bpf: support BPF cookie in raw tracepoint
(raw_tp, tp_btf) programs"), we can show the cookie in bpf_link_info
like kprobe etc.

Signed-off-by: Tao Chen <chen.dylane@linux.dev>
---
 include/uapi/linux/bpf.h       | 1 +
 kernel/bpf/syscall.c           | 1 +
 tools/include/uapi/linux/bpf.h | 1 +
 3 files changed, 3 insertions(+)

diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
index 07ee73cdf9..7d0ad5c2b6 100644
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@ -6644,6 +6644,7 @@ struct bpf_link_info {
 		struct {
 			__aligned_u64 tp_name; /* in/out: tp_name buffer ptr */
 			__u32 tp_name_len;     /* in/out: tp_name buffer len */
+			__u64 cookie;
 		} raw_tracepoint;
 		struct {
 			__u32 attach_type;
diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
index 9794446bc8..1c3dbe44ac 100644
--- a/kernel/bpf/syscall.c
+++ b/kernel/bpf/syscall.c
@@ -3687,6 +3687,7 @@ static int bpf_raw_tp_link_fill_link_info(const struct bpf_link *link,
 		return -EINVAL;
 
 	info->raw_tracepoint.tp_name_len = tp_len + 1;
+	info->raw_tracepoint.cookie = raw_tp_link->cookie;
 
 	if (!ubuf)
 		return 0;
diff --git a/tools/include/uapi/linux/bpf.h b/tools/include/uapi/linux/bpf.h
index 07ee73cdf9..7d0ad5c2b6 100644
--- a/tools/include/uapi/linux/bpf.h
+++ b/tools/include/uapi/linux/bpf.h
@@ -6644,6 +6644,7 @@ struct bpf_link_info {
 		struct {
 			__aligned_u64 tp_name; /* in/out: tp_name buffer ptr */
 			__u32 tp_name_len;     /* in/out: tp_name buffer len */
+			__u64 cookie;
 		} raw_tracepoint;
 		struct {
 			__u32 attach_type;
-- 
2.43.0

