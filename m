Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFECA2940B
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 03:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747108791; cv=none; b=Xw//f1jVHcAwjcCY22JrCZgMfmjh0oLfPExvjz0OwFfgBIyv2JJXhPAgil0Tuj8e9PU1jUVdh1zi8l9RM3v7/U5rGb8lP68lg/MYMHZ47bVnBkfav5oxjvW5yAfTT9xGIgQ8vSvw5aJnn7a2yCgj20YOQG51pZGFJPMxAPZ+UMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747108791; c=relaxed/simple;
	bh=QnQqSoXATJrUxjQ3vTBObMrtyyWeaNvT5HtiijsqwTE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=clz/Dj9Paole6y1+0mQ0hI2mzwqXYq4Wllwi3yVDkpEDVJz4jcLYOiXLjbn8FCtcJA0oVHqdHy6Pj3oPYAkRHCgkW+jEKOqMDBg/NwjWinFI/RO2ghFw4GF9H7Ys+3LOIiztoP6eQf65lSvHbKORkkeInRD01H6LjdBUYl6Ckj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FZ5XqqRm; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FZ5XqqRm"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747108777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bTrApBCfAtNOn7G4PV6x4MGAB2aB1hPcPAcj3rINtJ8=;
	b=FZ5XqqRmGN4U9VMQ2L09IalSHN1MukaHQDbHazBeea0Egn5JZYwuyjpot1m8lZRzjri0LU
	HUb1xXiqt98LcEYDZgYN/xXBj0KrTjsXLZxCju+FtTuxp/mn1ZEzrN/yFelWypRoiwETrq
	OeVn8NaxY2UECW7Qmjmv4ZhElpFZLAk=
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: bpf@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Quentin Monnet <qmo@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v1] bpftool: Add support for custom BTF path in prog load/loadall
Date: Tue, 13 May 2025 11:58:53 +0800
Message-ID: <20250513035853.75820-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This patch exposes the btf_custom_path feature to bpftool, allowing users
to specify a custom BTF file when loading BPF programs using prog load or
prog loadall commands. This feature is already supported by libbpf, and
this patch makes it accessible through the bpftool command-line interface.

Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 tools/bpf/bpftool/prog.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tools/bpf/bpftool/prog.c b/tools/bpf/bpftool/prog.c
index f010295350be..63f84e765b34 100644
--- a/tools/bpf/bpftool/prog.c
+++ b/tools/bpf/bpftool/prog.c
@@ -1681,8 +1681,17 @@ static int load_with_options(int argc, char **argv, bool first_prog_only)
 		} else if (is_prefix(*argv, "autoattach")) {
 			auto_attach = true;
 			NEXT_ARG();
+		} else if (is_prefix(*argv, "custom_btf")) {
+			NEXT_ARG();
+
+			if (!REQ_ARGS(1))
+				goto err_free_reuse_maps;
+
+			open_opts.btf_custom_path = GET_ARG();
 		} else {
-			p_err("expected no more arguments, 'type', 'map' or 'dev', got: '%s'?",
+			p_err("expected no more arguments, "
+			      "'type', 'map', 'dev', 'offload_dev', 'xdpmeta_dev', 'pinmaps', "
+			      "'autoattach', or 'custom_btf', got: '%s'?",
 			      *argv);
 			goto err_free_reuse_maps;
 		}
-- 
2.47.1

