Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F8D185935
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 08:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738312306; cv=none; b=GfaP+xmW604K0Kf4RJFrJpLQHmMuZFY/iNRhmRjITP8jORBFQTkspSrw00B8ShOXy6JcaabWMi+EqR+Agi/qDzO3LcMCXjlP9326LrKMYv9q18cFOJ3ERjZUWx8yh8bijzM8qbNAlQ2TU9G+MylYehwO0JeJ5NOZ51LZbSYvUf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738312306; c=relaxed/simple;
	bh=mLVZo1nn0u2stAiG+4QhFqVXxWnxquoZHj9Efr03O4g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EM1teBPpHrpnL2hKj8bqofmXzmWx6nDXD60Yx6DL8tmwQx5w/WlZUcWQx+wIWjaHoBHV+o+AY4tFcSo98TD8SOCaq0ca+v9HZbQvWeusFzEh/i5rvrYyM2cpORblw753Hfksh08citd0yVZjCeS5aykjInEieJNyiZPNI0xtDEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=GYUQwEdQ; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="GYUQwEdQ"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7b6eb531e13so93931985a.0
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 00:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1738312303; x=1738917103; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iVTB8TWnA94KcBdPT26vLjAJb4R6rb8WNvZVBBonljQ=;
        b=GYUQwEdQgTr8tG8u+EMr4mRmKtxnqu+fFp9QQoU6rgTfQQe9Fc9xPKRwcfh2WzXzAG
         AQMOODBTxzxtB0BT2CzoxO1e3vct7UcPHDrPhyvWADYVrxXto0MfahZRue+sb73bCitb
         ONBFDb7pWCijWD4t3R6/tIbciZ1h/sCg8DpBLLjPpyfyAPjbiSbw3LxrwbevE+iA3nbh
         +nFItzdYpjajpKsu9tgDcSriVwSH3sxJXDg7R+N00Kem251SJ58TQQVFz4BXqJd3NjGg
         6gXBPXw+2jrrwEkkItWq6RWhwOTB1Q61sgKxskX9rqOuiyFmbdtUT/fR8nyPGLAH0FR8
         0vtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738312303; x=1738917103;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iVTB8TWnA94KcBdPT26vLjAJb4R6rb8WNvZVBBonljQ=;
        b=HMiCpVR8qM+BO/5iTB9lxVYG0Q4XJm826ulbJ9AM80Zsx6CbZPRPT5+54ToXNArYdD
         YmIVoRQyaNOkHJlx238AJ7gKDLeCcuTVmctrjGXfE6nbULq+JGGT40d7YsvT1Hm36iiZ
         9Tybv4nVHeT2+HZCclWa/YJKNMFCzhU+DK+3Gf+Mt0OJ+2oT+84drITxVoipYDFdRJxV
         ip6IUih6WNEA7K1CwcT17twD7O9ax3a+J1Z3xw7YcVCvz+YjMhuK/sFpzWTKiN5aolSl
         gsHMlaL4NtvLA0oGYFHGsA8itNiUwgA7eETSwQaEAtrmXhAa4S61EwCQ/Jq3tpOoA42d
         UePw==
X-Forwarded-Encrypted: i=1; AJvYcCW8roFMpDKqFsoFWfXri02/B26etZuINKZjUyv8dapU73GNmJGRxhdSvGqe4IvKNPKyns9nmPvoon3qKRU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwlwzH9gsYeRmn3+pddk9zum6bqY2oTEUSL+bhcgqeiOsf/3Md
	9yHCN6qPtdoFGqgdBYvhd3+kJLjLbbNgzBEs1KCrSwtgtGo+rrxLV9osJyz3aY0=
X-Gm-Gg: ASbGncunmq9cv/Prio1fMY1Vn9W2Idwncn6vu+p/05Pvebx4xoQNH2Bi9T6Yr15izN2
	ojI59nN6zu0cFl0wOuI8IWXGUuWlBCRDcRzDSRxPvRZ/v+cwaJwUw4vAnwCO4r7u4I1gAt+BIvX
	LMS2rKMFH9JRYSWOWNoCp0wrM2qlp6WR0dZI6kKL/BXGCVk8SnO/s5XouCaqgrOvZsrKTjxpC2P
	Pj97wEEAJAQb0ChkfFB9R0S1ZLQY5mWQTkL8wrij7gMCKE75qPEBU8PbCgj7iEXJY+E3Txc8mH9
	CmE=
X-Google-Smtp-Source: AGHT+IECgy6pI27TV4mOjPfWNfcpUPo5je3fvGRUoMvMP18x9oJ1PwnxKMKsqqWESyJPQNOF9GWOug==
X-Received: by 2002:a05:620a:1911:b0:7b6:cd90:c0e1 with SMTP id af79cd13be357-7bffcd903b1mr1532377685a.37.1738312303155;
        Fri, 31 Jan 2025 00:31:43 -0800 (PST)
Received: from debian.debian ([2a09:bac5:79dd:25a5::3c0:2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e254819f92sm15782546d6.48.2025.01.31.00.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 00:31:41 -0800 (PST)
Date: Fri, 31 Jan 2025 00:31:39 -0800
From: Yan Zhai <yan@cloudflare.com>
To: netdev@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Josh Hunt <johunt@akamai.com>,
	Alexander Duyck <alexander.h.duyck@linux.intel.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kernel-team@cloudflare.com
Subject: [PATCH v3 net] udp: gso: do not drop small packets when PMTU reduces
Message-ID: <Z5yKa7gz72+JEOXr@debian.debian>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit 4094871db1d6 ("udp: only do GSO if # of segs > 1") avoided GSO
for small packets. But the kernel currently dismisses GSO requests only
after checking MTU/PMTU on gso_size. This means any packets, regardless
of their payload sizes, could be dropped when PMTU becomes smaller than
requested gso_size. We encountered this issue in production and it
caused a reliability problem that new QUIC connection cannot be
established before PMTU cache expired, while non GSO sockets still
worked fine at the same time.

Ideally, do not check any GSO related constraints when payload size is
smaller than requested gso_size, and return EMSGSIZE instead of EINVAL
on MTU/PMTU check failure to be more specific on the error cause.

Fixes: 4094871db1d6 ("udp: only do GSO if # of segs > 1")
Signed-off-by: Yan Zhai <yan@cloudflare.com>
Suggested-by: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
---
v2->v3: simplify the code; adding two test cases
v1->v2: add a missing MTU check when fall back to no GSO mode; Fixed up
commit message to be more precise.

v2: https://lore.kernel.org/netdev/Z5swit7ykNRbJFMS@debian.debian/T/#u
v1: https://lore.kernel.org/all/Z5cgWh%2F6bRQm9vVU@debian.debian/
---
 net/ipv4/udp.c                       |  4 ++--
 net/ipv6/udp.c                       |  4 ++--
 tools/testing/selftests/net/udpgso.c | 26 ++++++++++++++++++++++++++
 3 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
index c472c9a57cf6..a9bb9ce5438e 100644
--- a/net/ipv4/udp.c
+++ b/net/ipv4/udp.c
@@ -1141,9 +1141,9 @@ static int udp_send_skb(struct sk_buff *skb, struct flowi4 *fl4,
 		const int hlen = skb_network_header_len(skb) +
 				 sizeof(struct udphdr);
 
-		if (hlen + cork->gso_size > cork->fragsize) {
+		if (hlen + min(datalen, cork->gso_size) > cork->fragsize) {
 			kfree_skb(skb);
-			return -EINVAL;
+			return -EMSGSIZE;
 		}
 		if (datalen > cork->gso_size * UDP_MAX_SEGMENTS) {
 			kfree_skb(skb);
diff --git a/net/ipv6/udp.c b/net/ipv6/udp.c
index 6671daa67f4f..c6ea438b5c75 100644
--- a/net/ipv6/udp.c
+++ b/net/ipv6/udp.c
@@ -1389,9 +1389,9 @@ static int udp_v6_send_skb(struct sk_buff *skb, struct flowi6 *fl6,
 		const int hlen = skb_network_header_len(skb) +
 				 sizeof(struct udphdr);
 
-		if (hlen + cork->gso_size > cork->fragsize) {
+		if (hlen + min(datalen, cork->gso_size) > cork->fragsize) {
 			kfree_skb(skb);
-			return -EINVAL;
+			return -EMSGSIZE;
 		}
 		if (datalen > cork->gso_size * UDP_MAX_SEGMENTS) {
 			kfree_skb(skb);
diff --git a/tools/testing/selftests/net/udpgso.c b/tools/testing/selftests/net/udpgso.c
index 3f2fca02fec5..36ff28af4b19 100644
--- a/tools/testing/selftests/net/udpgso.c
+++ b/tools/testing/selftests/net/udpgso.c
@@ -102,6 +102,19 @@ struct testcase testcases_v4[] = {
 		.gso_len = CONST_MSS_V4,
 		.r_num_mss = 1,
 	},
+	{
+		/* datalen <= MSS < gso_len: will fall back to no GSO */
+		.tlen = CONST_MSS_V4,
+		.gso_len = CONST_MSS_V4 + 1,
+		.r_num_mss = 0,
+		.r_len_last = CONST_MSS_V4,
+	},
+	{
+		/* MSS < datalen < gso_len: fail */
+		.tlen = CONST_MSS_V4 + 1,
+		.gso_len = CONST_MSS_V4 + 2,
+		.tfail = true,
+	},
 	{
 		/* send a single MSS + 1B */
 		.tlen = CONST_MSS_V4 + 1,
@@ -205,6 +218,19 @@ struct testcase testcases_v6[] = {
 		.gso_len = CONST_MSS_V6,
 		.r_num_mss = 1,
 	},
+	{
+		/* datalen <= MSS < gso_len: will fall back to no GSO */
+		.tlen = CONST_MSS_V6,
+		.gso_len = CONST_MSS_V6 + 1,
+		.r_num_mss = 0,
+		.r_len_last = CONST_MSS_V6,
+	},
+	{
+		/* MSS < datalen < gso_len: fail */
+		.tlen = CONST_MSS_V6 + 1,
+		.gso_len = CONST_MSS_V6 + 2,
+		.tfail = true
+	},
 	{
 		/* send a single MSS + 1B */
 		.tlen = CONST_MSS_V6 + 1,
-- 
2.30.2


