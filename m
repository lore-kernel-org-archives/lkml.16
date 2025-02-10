Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9234419993D
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739172159; cv=none; b=njycbYE4/iUZMa2G7h2AUcNrHwob/pXTS5eLOhJRX4Xcm0pRRc+SQJcNeMTiLwxAapXZQzNt9KOdyU5l+CZHmzimeOs/+Tn0RZocOM8N/T1vnUGTkVIjLx0lg3CqY4sgHuSmfRLjxOVrwTZA5ZE5nqpaywVk8xDhL8rYVbaa46E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739172159; c=relaxed/simple;
	bh=Fq7AOqywtozLGyzDhVRKESkoXd49xTjrcIyMW3nGG/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C2v8ZuMl6n7tiv/GkXjQ49RSPMH5jht3oN9UrUD2gspYPkf83EUZQSqBXQGKM2zY1Np11Dm+Vec4AVxg2hRR6yINWq73wHOpKU5uQH9R5C54y17efaLMKzwqRcrjEWlYK2lGQbif4X0vD5gwrXA/863Tr4iORCee37OQKdL73ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=W8drf9h4; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="W8drf9h4"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c0506ec9b3so180286485a.1
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 23:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1739172155; x=1739776955; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2eifM2TJgSxcTeM2vc1cnmxmV71PALyO8f+gK0jI++w=;
        b=W8drf9h4j2l7W+FWvCLfUTf9EGst8FOk5l/3T+J6ICTl3A45vdlVbpEp3RznvCA6Rc
         DijWqsFFhngXXyZ0skLOGCsEniR6ag99tIihIdA6rM8VSqRQUw9nzffzGQFWVFcd8O+Z
         7z0iLWkeMN8McnOALFs5ymYnCPMIqjfOpK2i18a6YAykyfslgI7GVD+NgPnq+lZfrH34
         Qk/dxATBaGY90WLbdRB3otqVD2rqSuhZlhoLeG92FWS/e2STbA3bcAujJ9gdgFP28Gwd
         QWkS+CeVJ1W0AZ5u2NgNoX7Rg/gDz516oGIz+hxo3XrpQ9MdYPoiPphhboQeHFmRYCMw
         EHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739172155; x=1739776955;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2eifM2TJgSxcTeM2vc1cnmxmV71PALyO8f+gK0jI++w=;
        b=XM0RKhC+V6LqHRmLH4J6NdLaajTU2FuLIh2vql+LkULCaOtVoIyOLAMxrb6p6GC5K5
         jBBI8O07J+PP7/kK1ppo2ZCv3SBmX5+ff/wvSE61Wo9unpEbopvvJt1yWs40SSYPImOx
         4Pp1mdi7M/twl0N7gLZWYGV9goYYE+tBw2ajQGlAKpuCZZAhUHzmp3e/JWTJCwg7aaiR
         qwKcCVMDH99F4CJjGJbiiByGFwT5hKJD3SCXhCo+jwxeKnTycq1CuHQePYkOxAInMCQD
         HAitCcBKfTqh3RvP65A3XZdsOdJFl6KfdpYqU29sMe2QoxtWgS0RjfDmvYgw0NSb1fET
         k33g==
X-Forwarded-Encrypted: i=1; AJvYcCVyZCSd0v5fI0bHoSACtD0wiDvb6OTP8codhymjphIRIC8VH4cgvupNSUBbkgx3lPMH8A+OnRTddWez7eU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoHkBTG+odo2H/1JMhip4emQQpVkuA8KCG177YbErV9hPAEEzR
	/cXeLnxSGpjgsrZAiVjwuAOsEhFjXXZnF6IO/98QdpIm9avr2FrvdZkeZjErdVc=
X-Gm-Gg: ASbGnctOLyN7t10MXUQ1XwHnY6nPcJSu/SiSI/9uqjy3CQxKJtDzqm1xFwCn0SDhNNm
	CYZcsRSQAmPB2MmwfeI5AGPlRpU2eapT5y/vRVJ6vvqRwOCDKRo8qimjUBOnrFfUCpmX5+e0ywA
	j4CtDRHap9CuxSOKojTYUYLiIut184U7+bzaAYstSnuIxdRPiElCblqTILpRyxjSN3vSDLXMBD6
	8ZCl96XxgCzNDe1BsrJQgPTSwb1EiPUeABfHbKq6l3pPnGCbp3y37J3oNoZPTl0CsHXxJPbGUWZ
	WXbK
X-Google-Smtp-Source: AGHT+IFqoVnPbfDlA0I7Lpzq5OYGCiuDOBCLRt/SyBPdEZ3hBHFAoO/pSle/c5P109+yMKGpe128IQ==
X-Received: by 2002:a05:620a:390e:b0:7b7:142d:53a4 with SMTP id af79cd13be357-7c047ca7edamr1803066785a.51.1739172155488;
        Sun, 09 Feb 2025 23:22:35 -0800 (PST)
Received: from debian.debian ([2a09:bac5:79dd:f9b::18e:183])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c041dec31dsm499971685a.1.2025.02.09.23.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 23:22:34 -0800 (PST)
Date: Sun, 9 Feb 2025 23:22:31 -0800
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
Subject: [PATCH v3 bpf 0/2] bpf: skip non exist keys in
 generic_map_lookup_batch
Message-ID: <cover.1739171594.git.yan@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The generic_map_lookup_batch currently returns EINTR if it fails with
ENOENT and retries several times on bpf_map_copy_value. The next batch
would start from the same location, presuming it's a transient issue.
This is incorrect if a map can actually have "holes", i.e.
"get_next_key" can return a key that does not point to a valid value. At
least the array of maps type may contain such holes legitly. Right now
these holes show up, generic batch lookup cannot proceed any more. It
will always fail with EINTR errors.

This patch fixes this behavior by skipping the non-existing key, and
does not return EINTR any more.

V2->V3: deleted a unused macro
V1->V2: split the fix and selftests; fixed a few selftests issues.

V2: https://lore.kernel.org/bpf/cover.1738905497.git.yan@cloudflare.com/
V1: https://lore.kernel.org/bpf/Z6OYbS4WqQnmzi2z@debian.debian/

Yan Zhai (2):
  bpf: skip non exist keys in generic_map_lookup_batch
  selftests: bpf: test batch lookup on array of maps with holes

 kernel/bpf/syscall.c                          | 18 ++----
 .../bpf/map_tests/map_in_map_batch_ops.c      | 62 +++++++++++++------
 2 files changed, 49 insertions(+), 31 deletions(-)

-- 
2.39.5


