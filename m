Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEC92288CB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744015907; cv=none; b=ashp3vcJtXBF5EzJ9P6rI0No6UIHE9UD4f10tvKHuMlrAuZXt9812tRjYKnJK+LpPGxHnqP374OFriqu2mWova/d6SjXGmGh0z9R+tNSvkmi7S/GgIxXnL/JreImYJVKCM11PuhvCkkRb4I1vxjOxQbxxJS//y3hAtW1hCDueVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744015907; c=relaxed/simple;
	bh=JzUuLgQjqzsuDFsOmyFLNHi+3ZA2NXJNSaqGAaMZIJc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b2hPR71YWR/zEMrjwA0it/73IzCOFPeFdTHVRN6P5uZIXDfbtOFQIy4qyVZbssAiqsFtY1URCNvPkgazkUrw9rQ9EfDJFDEsY+Dgcwo/UYPnN3ghtbgylQMtKDGEF8msTI2nrUh8BFw8JwmNoZH65Po24jsZgcgoW9E3DIbG29M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=hudHDkwz; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="hudHDkwz"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-af28bc68846so3628448a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 01:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744015904; x=1744620704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1uyJxUSjwirFDuWmm3Ov2pKSAd0ErZhNjYPXSZRPwMg=;
        b=hudHDkwzHMFKEzT7mdhekPHwsOQAsrP6Ny/5DVlghsRkOSCgd+KdTm8xlEVMHpA35l
         W36haTVziOQCALDdix5wP1dDRAZLH++YGAB2PVpUpxBXCH9zj+GafFSCPYUWV+RtHa1R
         8x+z41ht6Yqil3o9RLDC42HNfiHlO667FLVQFcgF+TOxW6m8KC6/tBYhtuL77nGqAH1y
         z/1EZfdPcqsqQUDnKu8k/ZyI4ujT9lM/0B++iBy5lPlzEvV2flgPJrOZrsFO4bkl0D0T
         0bd6jxcSIinf85j5ctJyPX8eb3s4jZrH2m12ebvna/fsJP9o8Ceq4GzuHSMfT0YEVPLu
         YMCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744015904; x=1744620704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1uyJxUSjwirFDuWmm3Ov2pKSAd0ErZhNjYPXSZRPwMg=;
        b=siGA7Vp93iy89l/r7UP43gXgyD7iob/eaEODO+F36bD95bpfq7C0iP0qkIcygoTCxs
         rC7i0eRr53IxIhoqse1NxIjOVG6PcpY1E2dF17vHK7w9qMgpF3TPv7cLHSXqPKKAhgJT
         yW479H5QUI8yL/uHAgB+z69iTQJ8Sl+U2mXImbP2sxKRSmiyqivzr4NKtm9EpopZa7Aa
         PdfcKLHLBYnNyxRSbbPce6Smz99uVtpUEiFuV3XmBYnYa6UCFc3tGBZY2QM0kg1RIrNk
         GKxj8h0FCfaF5PyBNlNN4fQnb5JcE5E3HyHpovdmMKB8pI/+V0NApMu9apyQ4mdntmFU
         HJPw==
X-Gm-Message-State: AOJu0YzuRbgagS5EoqnlTwBnz6pwfTb9Hs8A+/BlsrVLV0YWbsmLc1JR
	AKO/vHS8dHTq/L1Skbqk3NkCfAviX8ClVwoK1QBVfdWA9Ro8nASOmS/v2Ye07QX81vikINsahom
	L
X-Gm-Gg: ASbGncvuc+7FqHZcU2RDDIEntKYD0RfxAptjR18GK8B5g/vC52vDPz5ph0P22iiXjem
	HI4XK4e7vuVdHCjLQ9r5ZKlglMYhQV7XeDFvRibrnUEkvOBz6JXXWcReB6vmmu3gMvSsOqPKCFr
	xcv4CMgWR3rAtyBQQAHaeXBXdkNza95NkZowApvdBQmq2vutnAqgyENuVa1r5J+z+f+8srWGb2t
	0uFXs6ZCyAfAcUmfNlhR1AOwZK842GLXFTG0bLF533nl/X6UGKjfosTApkiEHyjxzcyJFWmjJcG
	N4IZo18eaoe6Zc50rntjvNaJ9/EUNxMpJz9GElLUv3fDRDc1v0aB1rZCkLqNVnHwT/w=
X-Google-Smtp-Source: AGHT+IGW7/HQcOSrWsFxMUBwQZEFvu6hcIo8WL0C16qqewIUDvPZ3V176EqIWn668YLPeuSi7WpN/A==
X-Received: by 2002:a17:902:f64d:b0:220:f87d:9d5b with SMTP id d9443c01a7336-22a8a867cfdmr200793525ad.24.1744015904387;
        Mon, 07 Apr 2025 01:51:44 -0700 (PDT)
Received: from always-zbook.bytedance.net ([61.213.176.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229787727eesm75759455ad.224.2025.04.07.01.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 01:51:44 -0700 (PDT)
From: zhenwei pi <pizhenwei@bytedance.com>
To: linux-kernel@vger.kernel.org,
	mptcp@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Cc: matttbe@kernel.org,
	martineau@kernel.org,
	geliang@kernel.org,
	viktor.soderqvist@est.tech,
	zhenwei pi <pizhenwei@bytedance.com>,
	zhenwei pi <zhenwei.pi@linux.dev>
Subject: [PATCH] selftests: mptcp: add comment for getaddrinfo
Date: Mon,  7 Apr 2025 16:51:22 +0800
Message-ID: <20250407085122.1203489-1-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mptcp_connect.c is a startup tutorial of MPTCP programming, however
there is a lack of ai_protocol(IPPROTO_MPTCP) usage. Add comment for
getaddrinfo MPTCP support.

Signed-off-by: zhenwei pi <zhenwei.pi@linux.dev>
Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 tools/testing/selftests/net/mptcp/mptcp_connect.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tools/testing/selftests/net/mptcp/mptcp_connect.c b/tools/testing/selftests/net/mptcp/mptcp_connect.c
index c83a8b47bbdf..6b9031273964 100644
--- a/tools/testing/selftests/net/mptcp/mptcp_connect.c
+++ b/tools/testing/selftests/net/mptcp/mptcp_connect.c
@@ -179,6 +179,18 @@ static void xgetnameinfo(const struct sockaddr *addr, socklen_t addrlen,
 	}
 }
 
+/* There is a lack of MPTCP support from glibc, these code leads error:
+ *	struct addrinfo hints = {
+ *		.ai_protocol = IPPROTO_MPTCP,
+ *		...
+ *	};
+ *	err = getaddrinfo(node, service, &hints, res);
+ *	...
+ * So using IPPROTO_TCP to resolve, and use TCP/MPTCP to create socket.
+ *
+ * glibc starts to support MPTCP since v2.42.
+ * Link: https://sourceware.org/git/?p=glibc.git;a=commit;h=a8e9022e0f82
+ */
 static void xgetaddrinfo(const char *node, const char *service,
 			 const struct addrinfo *hints,
 			 struct addrinfo **res)
-- 
2.34.1

