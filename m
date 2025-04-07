Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C6F1DA2E5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 14:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744035804; cv=none; b=EMLA6PIKgmUHNYd+9K+nnVWm0fTaxBAwJlso4XYPTF9eDI2f9ZpSkBAjcKvQK5SxtYsy1L+/4cZuIiwGA2CiYB6NNuqtyQbCqb2JxRZPW0JT6QQHaIcJR5Y5PDmm9rM/IzyNXzrS6ZDozFFhxI4XJPEz7kjguUcHxaJ/vcDL+dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744035804; c=relaxed/simple;
	bh=Mho1OhZMPQYWvUWnQkKuL8qqQ0XtidXWn2GdqBHMZvY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oAegYYsADoJRTDbU9dntCcqX28rIW9BFb6jygr/3eAzEELQuTvAazSicB3CCsxNMO9M2NpjiTnGbEsNb+RFCFQGC6b+3QAaqfptUWlWsvjil0FM+vSS28FQyoK5iNiQn3ffQo/XbjrlUr6MYYBgmTEB1M0ug2/eAzkHb3c7muHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cEdE/fiW; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cEdE/fiW"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744035799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=W4wct51PbY7VBGxtjbRhs1YFFpceh3G8shb37lDzbWo=;
	b=cEdE/fiWurBuimab6570vjRdY0FrgT2Aa/7nsKqs0pYFRFrKnb63sG8Nb9+acF1GnKRmnl
	oqZ9lJLAtVXFh7icMb83bpWiufZcEICFC2grkhTNjfnaq9oPAdFBvR+v+ZTkLRgGeNpDGE
	AoSFYVdpkmkrlbU48LmDiwYyj/32Li4=
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: bpf@vger.kernel.org
Cc: mrpre@163.com,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	Jakub Sitnicki <jakub@cloudflare.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next v1 0/4] bpf, sockmap: Fix data loss and panic issues
Date: Mon,  7 Apr 2025 22:21:19 +0800
Message-ID: <20250407142234.47591-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

I was writing a benchmark based on sockmap + TCP and discovered several
issues:

1. When EAGAIN occurs, the direction of skb is incorrect, causing data
   loss when retry.
2. When sending partial data, the offset is not recorded, leading to
   duplicate data being sent when retry.
3. An unexpected BUG_ON() judgment in skb_linearize is triggered.
4. The memory of psock->ingress_skb is not limited by the socket buffer
   and memcg.

Issues 1, 2, and 3 are described in each patch's commit message.

Regarding issue 4, this patchset does not cover it as it is difficult to
handle in practice, and I am still working on it.

Here is a brief description of the issue:
When using sockmap to skb/stream redirect, if the receiving end does not
perform read operations, all data will be buffered in ingress_skb.

For example:
'''
// set memory limit to 50G
cgcreate -g memory:myGroup
cgset -r memory.max="5000M" myGroup

// start benchmark and disable consumer from reading
cgexec -g "memory:myGroup" ./bench sockmap -c 2 -p 1 -a --rx-verdict-ingress --delay-consumer=-1 -d 100
Iter   0 ( 29.179us): Send Speed 2668.548 MB/s (20360.406 calls/s), ... Rcv Speed    0.000 MB/s (   0.000 calls/s)
Iter   1 ( -7.237us): Send Speed 2694.467 MB/s (20557.149 calls/s), ... Rcv Speed    0.000 MB/s (   0.000 calls/s)
Iter   2 ( -1.918us): Send Speed 2693.404 MB/s (20548.039 calls/s), ... Rcv Speed    0.000 MB/s (   0.000 calls/s)
Iter   3 ( -0.684us): Send Speed 2693.138 MB/s (20548.014 calls/s), ... Rcv Speed    0.000 MB/s (   0.000 calls/s)
Iter   4 (  7.879us): Send Speed 2698.620 MB/s (20588.838 calls/s), ... Rcv Speed    0.000 MB/s (   0.000 calls/s)
Iter   5 ( -3.224us): Send Speed 2696.553 MB/s (20573.066 calls/s), ... Rcv Speed    0.000 MB/s (   0.000 calls/s)
Iter   6 ( -5.409us): Send Speed 2699.705 MB/s (20597.111 calls/s), ... Rcv Speed    0.000 MB/s (   0.000 calls/s)
Iter   7 ( -0.439us): Send Speed 2699.691 MB/s (20597.009 calls/s), ... Rcv Speed    0.000 MB/s (   0.000 calls/s)
...

// memory usage are not limited
cat /proc/slabinfo | grep skb
skbuff_small_head   11824024 11824024    704   46    8 : tunables    0    0    0 : slabdata 257044 257044      0
skbuff_fclone_cache 11822080 11822080    512   32    4 : tunables    0    0    0 : slabdata 369440 369440      0
'''
Thus, a simple socket in a large file upload/download model can eat the
entire OS memory.

We must charge the skb memory to psock->sk, and if we do not want losing
skb, we need to feedback the error info to read_sock/read_skb when the
enqueue operation of psock->ingress_skb fails.

---
My another patch related to stability also requires maintainers to spare
some time from their busy schedules for review.
https://lore.kernel.org/bpf/20250317092257.68760-1-jiayuan.chen@linux.dev/T/#t


Jiayuan Chen (4):
  bpf, sockmap: Fix data lost during EAGAIN retries
  bpf, sockmap: fix duplicated data transmission
  bpf, sockmap: Fix panic when calling skb_linearize
  selftest/bpf/benchs: Add benchmark for sockmap usage

 net/core/skmsg.c                              |  48 +-
 tools/testing/selftests/bpf/Makefile          |   2 +
 tools/testing/selftests/bpf/bench.c           |   4 +
 .../selftests/bpf/benchs/bench_sockmap.c      | 599 ++++++++++++++++++
 .../selftests/bpf/progs/bench_sockmap_prog.c  |  65 ++
 5 files changed, 697 insertions(+), 21 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/benchs/bench_sockmap.c
 create mode 100644 tools/testing/selftests/bpf/progs/bench_sockmap_prog.c

-- 
2.47.1

