Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0986222584
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 23:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748041544; cv=none; b=Ma+EUaXHoI/iZIwulB0aMK0GLFgEeqgRvhiUXpgcKA3Y/mOvA1psAGJVT+SH2KcSC9T0moQibMgmJztrodU+zek+atY5egpitSXycwIvW6b7kKoBAsJ3eUFx3+JIVIdkTDi7ZrkVLOvK5G56KjIK4RPk38ONj+Fun5tX1uYu/zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748041544; c=relaxed/simple;
	bh=0JqtZHm1FjwTp/r9FfFXp2DhxiRW0Bdbv5viNa2gMfU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=F0WfqBD4HsX5FtijjTLYU+HRiCxt2eRc1sra6jxO5y8Tu0cUvXhFi/vRLuk3wY3GvdjEr/PS6FMOgFkMO5achsif2hexmTusIGZEvKOyJMjdqpiF7v8t2yF36QhdgNEwOCN6NMc7URfPFsHn6pe9MhsBoP54gQD//RyPqIzvDq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R6iUBZ+9; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R6iUBZ+9"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-231e76f6eafso3017245ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 16:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748041542; x=1748646342; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=g9027k/STZBsLuLsL7i9IP6pBTVAG0SO2AdEyoxFagU=;
        b=R6iUBZ+9HVQ0voT5m+RPF6iohB8uARMGrHOt/QAtNhActs24wu0LUZpv9rmD9UQPKA
         7yYVB/6ZynPCnYCMgYYLn7Xzb3f30iagRVmduoJ/cbrN1WfKN6CkmHINV1xcKHUGHUox
         HBVz2TmIHqHoxG+JSj+2OjffHWR/6+UjiYQBBuQ8wsQEXGPQ4tMjaGP3Gj87Fy0P+its
         okRYfbq0gQwBQGOd2rlYAORqCZ2N0mphubNEDbvd+q4ILWY2+28rW6kBOMMWlFAfo/vi
         B+rahlr0S9MvwlbDetoKWBFcCIX3X191jA+N7EFGLwDkhVO/pYUi6lRRcSH+MT65me9b
         BFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748041542; x=1748646342;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g9027k/STZBsLuLsL7i9IP6pBTVAG0SO2AdEyoxFagU=;
        b=TT79nwAZOFgmLmmwXcXJh0nXIETHxEMuqd2DtV9SZHHKfyeCzNBBW7xwLny2yqe8Ae
         brmB+VGgnGmaMODdhGkGcZvE8N5h5Q/BRZNz+BM1nGwRseKm88a4oiFaKHJsbZ+gOech
         Tazc6tIx2NeIpJ77LvXy/MmUuq3+Cy6TXeq4jyhOAzngTIgwAcZouyH1JexpNNnkbuct
         yPT8sswURDROPBpxOP/zA6p2g4Gia01iyGBaT87gRZ6t9OnNlW0ZhqNadxzQQFl7iNvK
         U5vvRVJUf3hl3EyYHxD59tGvpsWAeTuCB/XTiiyjzTNwX0G4R1l2pUQXmsZzSJ7v1Ti0
         l/PA==
X-Forwarded-Encrypted: i=1; AJvYcCXddKXofCCH8OP6c6sPcT07vKGk9nYAZ09wnaSctKhrtI9E6eHFRuePXR37vbqxIoi92fNV6ThgRg2eP0Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPa/tSngWKeoT5mnNsjvg1tQjlXB5esw2HJ531Iz+ioDkFBOGY
	qo/vtF9npm3Jke26Kgbby2yqZv2Gzn2DFl29B7UzcV8z5cnVttYHAtqy7vJYs19aSYdtjw1eke8
	Lt8gCmZndoERDOGuZ7MnUT9PaLQ==
X-Google-Smtp-Source: AGHT+IHn8TkCdj+ni+aC/DsrAqi9Ur2+n79I6LNfYvaRRRjb46r0pJxbHJPzmzbCwlmXoCzWPkQvZhUhuI8g+DiH4A==
X-Received: from plbms3.prod.google.com ([2002:a17:903:ac3:b0:223:294f:455a])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ebc6:b0:224:2175:b0cd with SMTP id d9443c01a7336-23414f689ddmr16906845ad.26.1748041542350;
 Fri, 23 May 2025 16:05:42 -0700 (PDT)
Date: Fri, 23 May 2025 23:05:24 +0000
In-Reply-To: <20250523230524.1107879-1-almasrymina@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250523230524.1107879-1-almasrymina@google.com>
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250523230524.1107879-9-almasrymina@google.com>
Subject: [PATCH net-next v2 8/8] net: devmem: ncdevmem: remove unused variable
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@amazon.com>, David Ahern <dsahern@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, sdf@fomichev.me, 
	ap420073@gmail.com, praan@google.com, shivajikant@google.com
Content-Type: text/plain; charset="UTF-8"

This variable is unused and can be removed.

Signed-off-by: Mina Almasry <almasrymina@google.com>
Acked-by: Stanislav Fomichev <sdf@fomichev.me>
---
 tools/testing/selftests/drivers/net/hw/ncdevmem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/net/hw/ncdevmem.c b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
index 3c7529de8d48..03f0498cdffb 100644
--- a/tools/testing/selftests/drivers/net/hw/ncdevmem.c
+++ b/tools/testing/selftests/drivers/net/hw/ncdevmem.c
@@ -537,7 +537,6 @@ static struct netdev_queue_id *create_queues(void)
 static int do_server(struct memory_buffer *mem)
 {
 	char ctrl_data[sizeof(int) * 20000];
-	struct netdev_queue_id *queues;
 	size_t non_page_aligned_frags = 0;
 	struct sockaddr_in6 client_addr;
 	struct sockaddr_in6 server_sin;
-- 
2.49.0.1151.ga128411c76-goog

