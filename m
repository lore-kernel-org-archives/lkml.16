Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6C6156C6F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 02:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748917603; cv=none; b=NsI/fpT2zWLy9sf58rXi9c5rZiD1J8udI8qh9PItEm5k7IgKcPif2T2678x9jQxPNDphU50Gc2Ux4u0KyYATuKn+C6U/FC1SSKFFZFKEdEGDrQiL9j0kx9JM7EL8qyYQtJl7Zd+XEqV609MAnMsgtnV2U0rECCmSJ3eC+icYKUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748917603; c=relaxed/simple;
	bh=DJNpaCYN99DDdvRroDw++pPvD0MyuXveLEGneTy/6pg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aPdikgt08RDQE+9IBAGMSN0PhZiuV/kzJihbESoYkNUYzfDtym+i6g4xO83Q6CbI04+4x/TcjmAER0W0yt/opzPOrPGT5lYECKdiFHCMx1bVYOVOwA0Qs6pLmOrKrTrsfmxBU2m6LKV+fqY4uYwr/R12wykfv9kz2bsqYL/BmBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uzvl8BsO; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uzvl8BsO"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748917589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=n2aIttrPb9jb8L7NVw+rKsf4ICOcHaTq+bTFXuazTtY=;
	b=uzvl8BsOdgdYl/BcHMLn+gjQfXLYqPR2IVx5i63PxKVmfs6fYGrQAiS1qyW9y904cbQvHf
	S/P3hOe+qaDGc0GgQfCaHlflSX7Vh85154XQoBjl5EU2s0PBgjqtxv/E2ry0tMSSsbEmL0
	rZQzBA3Kr8ILOhFb/xboDiyUt+rqTsg=
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
Subject: [PATCH bpf-next v2 1/3] bpf: Add cookie to raw_tp bpf_link_info
Date: Tue,  3 Jun 2025 10:26:08 +0800
Message-Id: <20250603022610.3005963-1-chen.dylane@linux.dev>
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
 include/uapi/linux/bpf.h       | 2 ++
 kernel/bpf/syscall.c           | 1 +
 tools/include/uapi/linux/bpf.h | 2 ++
 3 files changed, 5 insertions(+)

Change list:
- v1 -> v2:
    - fill the hole in bpf_link_info.(Jiri)
- v1:
    https://lore.kernel.org/bpf/20250529165759.2536245-1-chen.dylane@linux.dev

diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
index 07ee73cdf9..f3e2aae302 100644
--- a/include/uapi/linux/bpf.h
+++ b/include/uapi/linux/bpf.h
@@ -6644,6 +6644,8 @@ struct bpf_link_info {
 		struct {
 			__aligned_u64 tp_name; /* in/out: tp_name buffer ptr */
 			__u32 tp_name_len;     /* in/out: tp_name buffer len */
+			__u32 reserved; /* just fill the hole */
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
index 07ee73cdf9..f3e2aae302 100644
--- a/tools/include/uapi/linux/bpf.h
+++ b/tools/include/uapi/linux/bpf.h
@@ -6644,6 +6644,8 @@ struct bpf_link_info {
 		struct {
 			__aligned_u64 tp_name; /* in/out: tp_name buffer ptr */
 			__u32 tp_name_len;     /* in/out: tp_name buffer len */
+			__u32 reserved; /* just fill the hole */
+			__u64 cookie;
 		} raw_tracepoint;
 		struct {
 			__u32 attach_type;
-- 
2.43.0

