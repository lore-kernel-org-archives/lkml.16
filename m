Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D63202987
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 12:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748263912; cv=none; b=i5OidRz3F8uFaE3nNU9aVeCMeY5TfMCBNDmGv3IIG0SNQJLas2mM8kCWJC0IectPr1ZUukPhTV9vzpASligVy6yoiSGME7wCc4/nG7Bs6QkdynChMa8AxjD9K+W5nlpY9QJJstHX1OJD+DV1XXD71B0HHozfb1e2Nn9klauD9no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748263912; c=relaxed/simple;
	bh=xGtgOVGl/7+FDUtfK4xwWE1CZC1f6N33ajHG2jCeSsU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=orj/MBSiGVVRlMIuZn1gXf8dP6MculZ1dvNhAeiPtYJ8OFEYIMxmglXuVsUP/1zKYXPdlVB3BykhSp5Zgbo3XMXzCLFEftJBdSm+3YxJdAJFKBXnOP1x57JPlDxodEM6799xGawIBOOrZTE2QlOdjYleP4aVrKm72iYQ7j2r8B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cnFqwu23; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cnFqwu23"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748263909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5h5iun9WeuvV4gJlQiA1mE7zK3XNw6p2G6AruARxVOU=;
	b=cnFqwu23iW0paQrGc/xvzZZDMwyaHqFd3ju6QonvMBD/D/y6klkb3H7AoQ9+aMlR7rrV8+
	yhbzjAsBzy98PgDRaG4+ScufqwV59nFF4TzEnSuHdmQWEC6J1ZN40sa2hS+cXvj/d1r4w3
	6TMr9O3y++k2xuoSsre0htBYJ15lRbk=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-210-dKitLjHiNyCUZM204QDmjA-1; Mon, 26 May 2025 08:51:48 -0400
X-MC-Unique: dKitLjHiNyCUZM204QDmjA-1
X-Mimecast-MFC-AGG-ID: dKitLjHiNyCUZM204QDmjA_1748263907
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-55324f4e56dso274746e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 05:51:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748263906; x=1748868706;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5h5iun9WeuvV4gJlQiA1mE7zK3XNw6p2G6AruARxVOU=;
        b=AyCGE6qRcUOYz7Or0osOGTgsK40TNiVt4pnJlgIN2CFaFjq5XBkXxdLoh9H4MyzSyc
         Mgdq+QiNEiPK1Fy0LEWol+Ybm+EpI1DsTBbwvngm1Ir6zGrazmAYi3mmImtIOwCoxuaJ
         52V2zzJq2SuW3lVqXQkb3E67WCQF4bHxb34yaFNRea7mEHYsIHnVoPMm2mYp8s/XPeqZ
         /AlqgSIMeqNntcOhq+x+9FM+uumQLDeowWp/T2ayde95vHhQfcOpcJSzmtOk6XREKe2r
         aqGAqRZ16RuTwIluEM4gvqwcrLileGMtBy2r4YUHRj1gL+i8UA/XMWu5O5tevDXKG/5R
         pA+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV3ANhfJSsIL8bBMHk1OGrIEkCst2Y2ZTjGO05S/IV0s5HU3nc4qftqw0dn81YpGksuPSI20L5fl3v5gu8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt/0Pp2MZMfOsV+VXRAxF8lmXjAEEpFr9V59QIp/hKy68rxvh5
	Mtr4pfjjsDQ2J7EvBVbAZKLDgz3AAy0vGks/HM2fPfmWn4JWI2hl3+qn4CYkiIZ04KrdaiR6RJH
	ZEIAsqDGNmF9q5zuBVbwwtr9FEeTnjy/QfTqLJorT1Y/8OgOOPpzOaelw0R66BaFfnzGeRgNoww
	==
X-Gm-Gg: ASbGncvACnQvfE8mXNVd6cXX6YLi1AMhcpVRl4NycS/jiIhJ4WU4nyhoYbT3l9Zue/A
	5P+fOaQm8zMIKJrU0KUK5I+Fb9mTqrJMjXAVjmScDFowH3vAe+cJpkpELE8rAKxHqmTvpYXeVzr
	kxOn3OY4ab4oSKdlG4dwjajJTDujjmFT0/2zWLLe7wH+AiWdb17eKdg9re9ef94FBbMjJFYCDxU
	wOGNste2cmLEeUzqoQSBXfgLiRlO1ce9zhR3Ut9wfDWVaUKB3aQ47NFfS9FcewLWNEzjOVhH7YO
	U0FP439V
X-Received: by 2002:a05:6512:4147:b0:553:25e9:7f3a with SMTP id 2adb3069b0e04-55325e97fbdmr160067e87.36.1748263906262;
        Mon, 26 May 2025 05:51:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbUYYwfzZb+OGN39N2NMQpTC1fcBTwawJZeg/s6ljgk9Apq9BdD2PbfjdkZ+T1CNXKmlehQQ==
X-Received: by 2002:a05:6512:4147:b0:553:25e9:7f3a with SMTP id 2adb3069b0e04-55325e97fbdmr160062e87.36.1748263905761;
        Mon, 26 May 2025 05:51:45 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702f1desm5129402e87.208.2025.05.26.05.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 05:51:45 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 427701AA3F2A; Mon, 26 May 2025 14:51:44 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: Jesper Dangaard Brouer <hawk@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>, Mina Almasry <almasrymina@google.com>
Subject: Re: [PATCH RFC net-next v2] page_pool: import Jesper's page_pool
 benchmark
In-Reply-To: <20250525034354.258247-1-almasrymina@google.com>
References: <20250525034354.258247-1-almasrymina@google.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Mon, 26 May 2025 14:51:44 +0200
Message-ID: <87iklna61r.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Mina Almasry <almasrymina@google.com> writes:

> From: Jesper Dangaard Brouer <hawk@kernel.org>
>
> We frequently consult with Jesper's out-of-tree page_pool benchmark to
> evaluate page_pool changes.
>
> Import the benchmark into the upstream linux kernel tree so that (a)
> we're all running the same version, (b) pave the way for shared
> improvements, and (c) maybe one day integrate it with nipa, if possible.
>
> Import bench_page_pool_simple from commit 35b1716d0c30 ("Add
> page_bench06_walk_all"), from this repository:
> https://github.com/netoptimizer/prototype-kernel.git
>
> Changes done during upstreaming:
> - Fix checkpatch issues.
> - Remove the tasklet logic not needed.
> - Move under tools/testing
> - Create ksft for the benchmark.
> - Changed slightly how the benchmark gets build. Out of tree, time_bench
>   is built as an independent .ko. Here it is included in
>   bench_page_pool.ko
>
> Steps to run:
>
> ```
> mkdir -p /tmp/run-pp-bench
> make -C ./tools/testing/selftests/net/bench
> make -C ./tools/testing/selftests/net/bench install INSTALL_PATH=3D/tmp/r=
un-pp-bench
> rsync --delete -avz --progress /tmp/run-pp-bench mina@$SERVER:~/
> ssh mina@$SERVER << EOF
>   cd ~/run-pp-bench && sudo ./test_bench_page_pool.sh
> EOF
> ```
>
> Output:
>
> ```
> (benchmrk dmesg logs)
>
> Fast path results:
> no-softirq-page_pool01 Per elem: 11 cycles(tsc) 4.368 ns
>
> ptr_ring results:
> no-softirq-page_pool02 Per elem: 527 cycles(tsc) 195.187 ns
>
> slow path results:
> no-softirq-page_pool03 Per elem: 549 cycles(tsc) 203.466 ns
> ```
>
> Cc: Jesper Dangaard Brouer <hawk@kernel.org>
> Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke.dk>
>
> Signed-off-by: Mina Almasry <almasrymina@google.com>

Back when you posted the first RFC, Jesper and I chatted about ways to
avoid the ugly "load module and read the output from dmesg" interface to
the test.

One idea we came up with was to make the module include only the "inner"
functions for the benchmark, and expose those to BPF as kfuncs. Then the
test runner can be a BPF program that runs the tests, collects the data
and passes it to userspace via maps or a ringbuffer or something. That's
a nicer and more customisable interface than the printk output. And if
they're small enough, maybe we could even include the functions into the
page_pool code itself, instead of in a separate benchmark module?

WDYT of that idea? :)

-Toke

