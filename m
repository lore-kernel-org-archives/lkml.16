Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E96913EFE3
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 05:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738907120; cv=none; b=pTtHWlb503rQeRYpk1fxX4CQaCJfn/VH9MaNdGeJI9H5dsAXripLPvkl/Qzrb2CuOtZzqNC2mLDtyfIdvRRu3kWUpT1/vZE239O0vLpFLze3KS4fgAn3bcBFOrbtx3UWwtSGlKvp8ZNikRTf2XIhZH9S51P5bBBElAB7WCdRukg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738907120; c=relaxed/simple;
	bh=gGezzYUMXDPK6inJCR26T2eTUq46GlYyJKYRkqpWgx0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FGUC7cs+TWhRhGdoyXWXEncJnOw+cipgKDqu4AHBP2WKAnvy8Zq3/GiJ4HjpM8NsN3taMSnNz7gVYfS3KJvTiDa8mOj1MlBO8XCHVqJvVzJ7Bj6PR0TgsOmOYXz1uOl56uiC9wVOjHNdg7LB3OnXO1u/duSwlY3EPUJMib2EWio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=b1ky/Dop; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="b1ky/Dop"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7be49f6b331so160648385a.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 21:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1738907116; x=1739511916; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5IiZZm6INZur7VVU7RwSrWYWqBqXxi7mFTnqmXj0pFQ=;
        b=b1ky/Dopd3ZyYLidjqAEjjEtD/pNxHIeEP6hdmIq5KfSj4M3FKwIZFAqROusAUAi6T
         OCDHKTdMcRb8yV1XzEnzByg7XgSxdQlHKnJpokKj85X1MMPYn8sZbJbaQKyUZNgl7h7R
         gXy1uPMgVm960SeUswycb4p6U0yRjtdAWJyQ9rGyat6qdoQma4BLghkTIVUcmSCKLCFJ
         JkMPt/gjly39jtkQfkE3zeawIr2gkCCx1i9TG4ttVwSh2VRhIhs9JAgtI5J5fTiCIY2k
         RIVNlQJdD0WF6QbTWv0xU//PsKajVtHPtNPW18Pp7yFEsebp+KSE2ph9EXOQqWLkTztM
         nBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738907116; x=1739511916;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5IiZZm6INZur7VVU7RwSrWYWqBqXxi7mFTnqmXj0pFQ=;
        b=KZ5nv1uI0ggPMdRM01nRhe4m3n2M1nYgWxZym+LytfOIsH/sargpRorKQA9Qd1sPj+
         R0iwB/m+wzh/hAKf8y6hjJ5VwDMnd0mjVvF5wq2k8cJj+97tpNWE1mZKfQJF7cuLXf+q
         A/+vIndjPxd/ptuqVGXh0K1Hj+7G4Y6pwmKYDxdZvmI7p7IzpM0fy+I4Ipg6sOuYKm8e
         n/4BAX9hgEQr6+ETICUAbPEjfXIWgIGi15tMMW2ZlB2PbP/juNmPw5pPl/N5xHTUFSXC
         M0oiNcIv1n+R/9dYPR+5AH5BeRtj4KA7dYdtUIk5kBhjG6FFCoGBXKdQeX1DBb0tDwWW
         lzlQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6EzsWSzrK1tpA6onpdiEbPut/NV+3prwKo4tWNvD9C9Xw9T/ZIhOim6JrCffhMH3dxtxEsjjD5lA93B4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7jOBeolSHwtx9TtxSHiLmSPDH1z6VzRnZnnRqlyyt5qFsjoD7
	MNGQNLyE7l/7EUOAAhH5hlqHjYX8nB8072iIW++MYTkrj2LmErVJ0U7dFAC+FHU=
X-Gm-Gg: ASbGncsZW75allVB0gtbBLts8VVhQTbr6x3P196FOO5LC8ajbmmpYQgqGtkBDQiosfx
	1uqy/I5kEULGtdbs5tdpnPewC31t1/A6R9Ux3HlG+fFSWdR3HqcvHU27wV/QfHKCFXk5LTkTYsM
	efnZ8L6EchGfp1BQ7qWA+XOFFL8mO7hVHt8A/DXjw5jTrD9fQjj73kl6P2RQjf0rpIRCJ7ez1ZV
	5dH3ngEG2bxfgy/GbUTp8DW0ti/lBIYQSUOPLBFpmGwhOLBr9ztW1fOpIvdZeCBeL8fcvlt8HVQ
	Lnk=
X-Google-Smtp-Source: AGHT+IHeDFG4PsZo7iKREMUrGLF3htyuKAaLBY80zJViJUgHflhFdo3XRhrHt9jyqehSZE1DfqfxDg==
X-Received: by 2002:a05:620a:290d:b0:7be:8343:df2b with SMTP id af79cd13be357-7c047c34936mr298818285a.10.1738907116412;
        Thu, 06 Feb 2025 21:45:16 -0800 (PST)
Received: from debian.debian ([2a09:bac5:79dd:25a5::3c0:2])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c041e9f9e6sm148107685a.85.2025.02.06.21.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 21:45:14 -0800 (PST)
Date: Thu, 6 Feb 2025 21:45:11 -0800
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
Subject: [PATCH v2 bpf 0/2] bpf: skip non exist keys in
Message-ID: <cover.1738905497.git.yan@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

generic_map_lookup_batch

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

V1->V2: split the fix and selftests; fixed a few selftests issues.

V1: https://lore.kernel.org/bpf/Z6OYbS4WqQnmzi2z@debian.debian/

Yan Zhai (2):
  bpf: skip non exist keys in generic_map_lookup_batch
  selftests: bpf: test batch lookup on array of maps with holes

 kernel/bpf/syscall.c                          | 16 ++---
 .../bpf/map_tests/map_in_map_batch_ops.c      | 62 +++++++++++++------
 2 files changed, 49 insertions(+), 29 deletions(-)

-- 
2.39.5


