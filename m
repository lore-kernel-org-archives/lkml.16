Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F77253938
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 11:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751541822; cv=none; b=ZEB8VbqG7dL063ngsEM9GxYAiMf5k+8ARcWD+WsMODSg9DwIL6qwUM8IcmS7OvGUbRK3hDB7RK5Gr3wcXcVWVlwKZQKo1goL8wqoqBeolHwCDP9StQHitlXjhGhRAD+4yHNDS8hLMHng0a/4+WlBoFHvoWbqOU8IinpeIHaRA9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751541822; c=relaxed/simple;
	bh=qCJ/Od0uSXuN2KvuQPi0q2CGVCbCbEn3umxbnY7hirA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c+p1euRxrgjljkY8cSF8+g6vdfFMUXP9pIyPMtgLNAE0TIsDvWI4VmZiakx2pBghR8Q53g/DTYgvQLXx0KhLulkUnS8Vt7uXPCkyPmmg4FY0tuaqjF9w84Hq1hCkr81QDJOcG+7vfo+YBtwdLhQtwmyBzP+qvucn4VMopkzGC5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FfNKxKN0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FfNKxKN0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751541819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PIJzNJK0FfXDsC5luatCe5NaXC4y6NbBybHk8bPHUtM=;
	b=FfNKxKN0ef0t7CIT/obMjXUsQOOSgPHTG08+ziCn38mE6i4QBvvUlFsbqqmvnaRW/GSlft
	K7f8KBVYQzbmag6JsZXgegzZCdSMReDnyaWCdT/K6WFF5sCcTFpyMKYgylRsem8ehIZMPL
	HwEJDy8991CWb5tAXW5Z75CaGWTtgvU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-VnS2Pm3SOA-jEG5FJS0KVA-1; Thu, 03 Jul 2025 07:23:38 -0400
X-MC-Unique: VnS2Pm3SOA-jEG5FJS0KVA-1
X-Mimecast-MFC-AGG-ID: VnS2Pm3SOA-jEG5FJS0KVA_1751541818
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c7c30d8986so2301780885a.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 04:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751541818; x=1752146618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PIJzNJK0FfXDsC5luatCe5NaXC4y6NbBybHk8bPHUtM=;
        b=r3QenrzPtQKAsHkKZG9T4Eqs1VWllNnsvOTRWtwJuaG8BQkIXMG+XIswOTq64EXT9m
         0lDOclOkp7HxQDSoJFJEa1BMnWlAsL3o8vcbpxCe3gRtf2p0CC22xUZ2uWCCpSCVb4OH
         oz6zkDxJEpucmWI3Hi5FXfk/SQF+N36+2wNjc28cSYjiIupLVTf01bqht16h+cUkAC+T
         5WW5JTnYwDECUdBGzRci1sqIU7ldMDj+hWvNtUj0L4drvZ2HJSYFDXwz+zxFopdIOe3P
         t2/9QkZuycLAzCwb+bF/CegGHMfhF8lDS8V5cA62giXD4dXssC88yGQIFYaJ6GnShT1a
         653w==
X-Gm-Message-State: AOJu0YygmuECbCSmij55C7FCne8PvygM8hNgbpJ7JhJrKD5NOU/2YaHv
	Gwdh8lHJHMF+w09oiwLMrN/skpN2pjW2kfbcJfOHVX3xpzA9kiOAyyaKI49X3JXltnZXX5bwbYW
	XMjE/lfOGIRyynLwLo6agVgFb5O6JeB1NLD4lzxpUyyKI40YPUZlQHarLhEwI1BzVqoNHATNx2Q
	==
X-Gm-Gg: ASbGncvQb/Bc3GpKch8CZFkOdUQhycoRje6OhtZwDaeCiSKJby3l4jDkiZeS3Rfg6R8
	wQthBHD9ELjDQlhorNUROkp5ADiIDvRhFN15pKiMm0sg7jOmUb0kXs39UQeb4zSFMzqdE09JJgf
	iY/E1MCjTeUZBsGHuDHkAptlVmN0PzsXuLk0Vczv5sB5WeMDOQLQDQaLvYvauldAHeu992KOZsp
	SIX3YSlll8Xx9ok6bpZk5UT8F3ovVWOLFkvymifAWKRqRDTM1/BC7phSxkh5MbZWdnIasxlIGpW
	iztPegegQoXn2j/Pn78HKfDoO04/pw==
X-Received: by 2002:a05:620a:8389:b0:7d4:3ac2:4c4 with SMTP id af79cd13be357-7d5d14909e9mr501464485a.50.1751541817650;
        Thu, 03 Jul 2025 04:23:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIhjpqSJkjkr7yySi+zSYYPuX82fx+PYQJJ7PyIEcTrA1s0zbfEWG0IS+SDm5LkMQyKv6eIg==
X-Received: by 2002:a05:620a:8389:b0:7d4:3ac2:4c4 with SMTP id af79cd13be357-7d5d14909e9mr501460785a.50.1751541817217;
        Thu, 03 Jul 2025 04:23:37 -0700 (PDT)
Received: from stex1.redhat.com ([193.207.161.238])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44313925dsm1088725885a.24.2025.07.03.04.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 04:23:36 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Bobby Eshleman <bobby.eshleman@bytedance.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Paolo Abeni <pabeni@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	virtualization@lists.linux.dev,
	bpf@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>
Subject: [PATCH net] vsock: fix `vsock_proto` declaration
Date: Thu,  3 Jul 2025 13:23:29 +0200
Message-ID: <20250703112329.28365-1-sgarzare@redhat.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Garzarella <sgarzare@redhat.com>

From commit 634f1a7110b4 ("vsock: support sockmap"), `struct proto
vsock_proto`, defined in af_vsock.c, is not static anymore, since it's
used by vsock_bpf.c.

If CONFIG_BPF_SYSCALL is not defined, `make C=2` will print a warning:
    $ make O=build C=2 W=1 net/vmw_vsock/
      ...
      CC [M]  net/vmw_vsock/af_vsock.o
      CHECK   ../net/vmw_vsock/af_vsock.c
    ../net/vmw_vsock/af_vsock.c:123:14: warning: symbol 'vsock_proto' was not declared. Should it be static?

Declare `vsock_proto` regardless of CONFIG_BPF_SYSCALL, since it's defined
in af_vsock.c, which is built regardless of CONFIG_BPF_SYSCALL.

Fixes: 634f1a7110b4 ("vsock: support sockmap")
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 include/net/af_vsock.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
index d56e6e135158..d40e978126e3 100644
--- a/include/net/af_vsock.h
+++ b/include/net/af_vsock.h
@@ -243,8 +243,8 @@ int __vsock_dgram_recvmsg(struct socket *sock, struct msghdr *msg,
 int vsock_dgram_recvmsg(struct socket *sock, struct msghdr *msg,
 			size_t len, int flags);
 
-#ifdef CONFIG_BPF_SYSCALL
 extern struct proto vsock_proto;
+#ifdef CONFIG_BPF_SYSCALL
 int vsock_bpf_update_proto(struct sock *sk, struct sk_psock *psock, bool restore);
 void __init vsock_bpf_build_proto(void);
 #else
-- 
2.50.0

