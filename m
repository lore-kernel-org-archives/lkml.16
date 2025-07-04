Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B8F101FF
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 00:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751590401; cv=none; b=uGDelnaaWb2zlf0u1PK5RLvMndbetN+9e8+Y9J6LnJzDFIYnJU3U+GjPumnt3DbKr/3Bo7hj6X3Qfl2VC8y+oQKzRlhberJnfPE96CioxraRyEc85XCxJetsAdrv16h8sqB9eTuM0sUqnn8FJo2tjEAf19Vktk6ZUxGc4U7DFdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751590401; c=relaxed/simple;
	bh=/uh/kY9f63FFoWCRFO7wD3jUeZn7lzI7W8ly2efSafw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=naWYJg+P2yhRBIoXrCTXvx73owcdY0i+DyBnebekE+Qfj7OI1X/MoyWfwFew2kkv3F4p2dTJvkUDYefmahoFz8/bSC1Tt9indfR6g17mURasJAonKDpTMmoJ5RECu9LpO4VLCxKM9uZ9Atr0hmJGDXyFbL4L1sZ4Emdt4B7C3ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DLVJZSW/; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DLVJZSW/"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751590396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JSu8rsxK4BAk8jXC2ShdBMCyiCvqbyzaWdfyeOxP/PI=;
	b=DLVJZSW/tNUGvpDdRHirTPp4JjnoQHm1KdSBttHwjJwLwiWZbh8LoqHUlDp/LidCyrrsbd
	6AgHSibkSpKt2Hh73Q0uRA85JZyynAMBzbn89h6urOV0Cxaklrr8WUQUbc+uhWFEo1lWZg
	cvESIbuoAVVHoCF1V6V6oqmMyrYLxUg=
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: mrpre@163.com,
	Jiayuan Chen <jiayuan.chen@linux.dev>,
	syzbot+de6565462ab540f50e47@syzkaller.appspotmail.com,
	Eric Dumazet <edumazet@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Howells <dhowells@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3] tcp: Correct signedness in skb remaining spac calculation
Date: Fri,  4 Jul 2025 08:52:52 +0800
Message-ID: <20250704005252.21744-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Syzkaller reported a bug [1] where sk->sk_forward_alloc can overflow.

When we send data, if an skb exists at the tail of the write queue, the
kernel will attempt to append the new data to that skb. However, the code
that checks for available space in the skb is flawed:
'''
copy = size_goal - skb->len
'''

The types of the variables involved are:
'''
copy: ssize_t (s64 on 64-bit systems)
size_goal: int
skb->len: unsigned int
'''

Due to C's type promotion rules, the signed size_goal is converted to an
unsigned int to match skb->len before the subtraction. The result is an
unsigned int.

When this unsigned int result is then assigned to the s64 copy variable,
it is zero-extended, preserving its non-negative value. Consequently, copy
is always >= 0.

Assume we are sending 2GB of data and size_goal has been adjusted to a
value smaller than skb->len. The subtraction will result in copy holding a
very large positive integer. In the subsequent logic, this large value is
used to update sk->sk_forward_alloc, which can easily cause it to overflow.

The syzkaller reproducer uses TCP_REPAIR to reliably create this
condition. However, this can also occur in real-world scenarios. The
tcp_bound_to_half_wnd() function can also reduce size_goal to a small
value. This would cause the subsequent tcp_wmem_schedule() to set
sk->sk_forward_alloc to a value close to INT_MAX. Further memory
allocation requests would then cause sk_forward_alloc to wrap around and
become negative.

[1]: https://syzkaller.appspot.com/bug?extid=de6565462ab540f50e47

Reported-by: syzbot+de6565462ab540f50e47@syzkaller.appspotmail.com
Fixes: 270a1c3de47e ("tcp: Support MSG_SPLICE_PAGES")
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>

---
v2 -> v3: Use correct syzkaller link
v1 -> v2: Added more commit message
https://lore.kernel.org/netdev/20250702110039.15038-1-jiayuan.chen@linux.dev/
---
 net/ipv4/tcp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 8a3c99246d2e..803a419f4ea0 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -1176,7 +1176,7 @@ int tcp_sendmsg_locked(struct sock *sk, struct msghdr *msg, size_t size)
 		goto do_error;
 
 	while (msg_data_left(msg)) {
-		ssize_t copy = 0;
+		int copy = 0;
 
 		skb = tcp_write_queue_tail(sk);
 		if (skb)
-- 
2.47.1

