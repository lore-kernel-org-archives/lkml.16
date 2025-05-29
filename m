Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B40422F773
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 17:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748538062; cv=none; b=iYuG0RX9E7Y8uJTkLOBLIM/fJLl/SlMN/HvB9GEmd9wYXyMeRFKeqPTgxUruSsZLG6iAYtYuXLpLXU/wlIlz5S2UdaUOKv6Pvgf/k4WNnh3S3pLqmf7uOD43Na396vGlr8EwbxYYGMfkImYqFkioALZqFwZQFWjUw1oucmh5ZMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748538062; c=relaxed/simple;
	bh=fn6Gypx0jppX4ZfV/wU6Lot+KTQW1fMN2RLSLn7ESP4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s2Do3UdZ9X1aSPmJPFW6VSUhSCynVn0yQ+oo2Y9RLlu0S1PDRpiSWwmd9hHTCWSEdcrz5/o5ngsVU3vVStV2Fjq9TZtkfUz+Sf4axE8NNzhU6XNLbMg2bApGvX4VdcrJG0JlVE8IWFyLo2ik0nfIH1oJC0h6JbgMRHQ+fFBIPmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FUuN5oX7; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FUuN5oX7"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748538058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oo40gIonSC9h0uhsHSMEjkgSCyqiY1FN2iI8Vf98Jlo=;
	b=FUuN5oX7WLfaXCWrsgrZ90DC9ZoBuCLfY279sHIiwhg++8xlm3Y4y6g0ieshIJ0EZFibE8
	CXrk0sNnqA03TNb/kCPEp1X0Y+u0vpbk7MXF49+9c/PHg42bn+Lvbo7PtIwr/viftWIji+
	JFaXhhBhy8O1BI0wOsNSg5nTct4ZR4g=
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
Subject: [PATCH bpf-next  3/3] bpftool: Display cookie for raw_tp link probe
Date: Fri, 30 May 2025 00:57:59 +0800
Message-Id: <20250529165759.2536245-3-chen.dylane@linux.dev>
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

Display cookie for raw_tp link probe, in plain mode:

 #bpftool link

22: raw_tracepoint  prog 14
        tp 'sys_enter'  cookie 23925373020405760
        pids test_progs(176)

And in json mode:

 #bpftool link -j | jq

[
  {
    "id": 47,
    "type": "raw_tracepoint",
    "prog_id": 79,
    "tp_name": "sys_enter",
    "cookie": 23925373020405760,
    "pids": [
      {
        "pid": 274,
        "comm": "test_progs"
      }
    ]
  }
]

Signed-off-by: Tao Chen <chen.dylane@linux.dev>
---
 tools/bpf/bpftool/link.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/bpf/bpftool/link.c b/tools/bpf/bpftool/link.c
index 52fd2c9fac..bd37f364be 100644
--- a/tools/bpf/bpftool/link.c
+++ b/tools/bpf/bpftool/link.c
@@ -484,6 +484,7 @@ static int show_link_close_json(int fd, struct bpf_link_info *info)
 	case BPF_LINK_TYPE_RAW_TRACEPOINT:
 		jsonw_string_field(json_wtr, "tp_name",
 				   u64_to_ptr(info->raw_tracepoint.tp_name));
+		jsonw_lluint_field(json_wtr, "cookie", info->raw_tracepoint.cookie);
 		break;
 	case BPF_LINK_TYPE_TRACING:
 		err = get_prog_info(info->prog_id, &prog_info);
@@ -876,6 +877,8 @@ static int show_link_close_plain(int fd, struct bpf_link_info *info)
 	case BPF_LINK_TYPE_RAW_TRACEPOINT:
 		printf("\n\ttp '%s'  ",
 		       (const char *)u64_to_ptr(info->raw_tracepoint.tp_name));
+		if (info->raw_tracepoint.cookie)
+			printf("cookie %llu ", info->raw_tracepoint.cookie);
 		break;
 	case BPF_LINK_TYPE_TRACING:
 		err = get_prog_info(info->prog_id, &prog_info);
-- 
2.43.0

