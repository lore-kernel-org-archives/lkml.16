Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280F535972
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 14:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743171344; cv=none; b=bii+ItFkjPXAfDs3Lo6PQZa6O8tiGz4WefC2MFpNFqQqfCcygXxZIulfa5cY/emW68617bBbcJ8z1gIe69Cilv+ZZs95+nvCG3MZY+0OFWO2fJaklVs4Ixa3jqvFcbofmALLKwJXUNm9IYii7r//cqgXTStl8/KlxK5NRxkk/Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743171344; c=relaxed/simple;
	bh=FRgwR9NVLePyoA/jx/Us5P4QY3HAIJ4YkA7LAoces9w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EWYdYfK0JO+1NVXnlk8paYGPHxAi5xhEWU9clytniLAW/pzHnIB70BMI79dCNQrOvKWwVIIiJ/xycXFYME0BENyT4M0Th4M2x/04SRv9sTfbNK1qSHVesmv7EjpQ9p4qRvu+whkX+OuN/DjtafM2GdAT0LGkxKJGQ9QaAlwz0e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OKj4dMHQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OKj4dMHQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743171341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xooqL8JNylDfTCuXDGiM3ZS3m3cKnxP7jiQvva2sy6M=;
	b=OKj4dMHQSdJUFLov+LRpTk6q8lQi9MquPc3on0NMVWEGZL46H16Itoqz+fYhUyPOB29Fmd
	tAsa5Dn4ZIC9bIeW6bINc3sm4PBt6MrhiXWhMEUPj6GX/aLGu78hxbuFezGBlpQo73WMk4
	Jtr3EUkha21ysJqZiGH4kdR6SKEZjPw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-qa3c_mVQMMeokaw_pqvN9A-1; Fri, 28 Mar 2025 10:15:40 -0400
X-MC-Unique: qa3c_mVQMMeokaw_pqvN9A-1
X-Mimecast-MFC-AGG-ID: qa3c_mVQMMeokaw_pqvN9A_1743171339
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac2bb3ac7edso62633566b.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 07:15:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743171339; x=1743776139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xooqL8JNylDfTCuXDGiM3ZS3m3cKnxP7jiQvva2sy6M=;
        b=EgqMOWqtl686myNfz3CDWHmQ8IgctjfPpnP73dVVUaTd3GUprsclGOXzgCgqbrk7NO
         ZrZkkelyPMHRrlNuNTD9Nm6joUMF36rGH06Bn3ndpCr5R84G/PIPzDPsxIBGKLuZQfZd
         5q2VjWfkfYoww2aZ3v1tynsfyZiBxmhfQCelxIx7xKhxQh+YUiWZPkNmOVDnR35ws1Jk
         nsi9rk/uAg5cVJi/WUXsrlP398zkbmmVObQ/AXoNzKaWs5U8/89y8+g6cQeT3qSuEIWP
         8YGT+ftJsxvBCjbPo63tW4TN+yTWic2tt4/wSxrlU8QXW091R6SezQpAJgMW6Vi2oO00
         Z16g==
X-Forwarded-Encrypted: i=1; AJvYcCW0f2mbOip4sNHnFBQ9nhLyuPO0ZbAfa2NYSMaPz3k+En/5SMp/tIitUtTj11pWv5n8mtTeuR3ZAaQzi7A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG4iGiuNbwtdId5qjwde43jfakIwYNVGqjI688kj3BNBSyGlqX
	lsVy8Hej/s2xs9arbFRfI+6risFqaDMuwVKIc7XAbEVt72mp8XvraIcm170idoZK9NYn8+IIP2s
	vNWgOq75tnHD7qEXruB/WVti9GBgXxUVVb6fSfs+SkBFbwU0wouEEfVS0uvi3uQ==
X-Gm-Gg: ASbGncviTuSg7mCDWJiBMMjWeRJH9BX4Z1WxOLlNbSXWPFjq/V4llSitSxFkz6heRuz
	nLXNpb+BoL5i72Kk6xqGC7wToO0iGnikA5iDlsRCLJbmZoZlnZIVq+osR01w7SY/6l7qkGPbDpH
	BHmPvseC8Tp2d+TI8Ba8qlyR8+Ht26j6Yk6dlnvkYFmFKL5hPRHgoILMqnoW0RcWs4O3ERsT7FT
	KOppicPZi2yXgauhCT8V15Rw5f4satNNSSDpCVoSNmMoF11JMur0ihreJZDFQCa8SnmeiMXpzR2
	rRRaKgrOW87Pjnr1BWveHG9sv3sw8yrEpQT2MRtyOdPPUePAvzAMU9t/kDA3pXxS/R8cU/oi
X-Received: by 2002:a17:907:6091:b0:abf:750b:93b8 with SMTP id a640c23a62f3a-ac6faeb60camr729516166b.22.1743171338908;
        Fri, 28 Mar 2025 07:15:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHF1MvdaI0gZUTJ8fsf5IgoIHUlwoojKm+uMy9J1qv93tB206JFCOV8hdYvaYSnFXxyhmZ7Zg==
X-Received: by 2002:a17:907:6091:b0:abf:750b:93b8 with SMTP id a640c23a62f3a-ac6faeb60camr729508066b.22.1743171338172;
        Fri, 28 Mar 2025 07:15:38 -0700 (PDT)
Received: from localhost.localdomain (host-87-12-25-55.business.telecomitalia.it. [87.12.25.55])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71961f8fbsm166142266b.107.2025.03.28.07.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 07:15:37 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Cc: Michal Luczaj <mhal@rbox.co>,
	Paolo Abeni <pabeni@redhat.com>,
	George Zhang <georgezhang@vmware.com>,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andy King <acking@vmware.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Dmitry Torokhov <dtor@vmware.com>,
	Simon Horman <horms@kernel.org>,
	Luigi Leonardi <leonardi@redhat.com>
Subject: [PATCH net] vsock: avoid timeout during connect() if the socket is closing
Date: Fri, 28 Mar 2025 15:15:28 +0100
Message-ID: <20250328141528.420719-1-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Garzarella <sgarzare@redhat.com>

When a peer attempts to establish a connection, vsock_connect() contains
a loop that waits for the state to be TCP_ESTABLISHED. However, the
other peer can be fast enough to accept the connection and close it
immediately, thus moving the state to TCP_CLOSING.

When this happens, the peer in the vsock_connect() is properly woken up,
but since the state is not TCP_ESTABLISHED, it goes back to sleep
until the timeout expires, returning -ETIMEDOUT.

If the socket state is TCP_CLOSING, waiting for the timeout is pointless.
vsock_connect() can return immediately without errors or delay since the
connection actually happened. The socket will be in a closing state,
but this is not an issue, and subsequent calls will fail as expected.

We discovered this issue while developing a test that accepts and
immediately closes connections to stress the transport switch between
two connect() calls, where the first one was interrupted by a signal
(see Closes link).

Reported-by: Luigi Leonardi <leonardi@redhat.com>
Closes: https://lore.kernel.org/virtualization/bq6hxrolno2vmtqwcvb5bljfpb7mvwb3kohrvaed6auz5vxrfv@ijmd2f3grobn/
Fixes: d021c344051a ("VSOCK: Introduce VM Sockets")
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 net/vmw_vsock/af_vsock.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index 7e3db87ae433..fc6afbc8d680 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -1551,7 +1551,11 @@ static int vsock_connect(struct socket *sock, struct sockaddr *addr,
 	timeout = vsk->connect_timeout;
 	prepare_to_wait(sk_sleep(sk), &wait, TASK_INTERRUPTIBLE);
 
-	while (sk->sk_state != TCP_ESTABLISHED && sk->sk_err == 0) {
+	/* If the socket is already closing or it is in an error state, there
+	 * is no point in waiting.
+	 */
+	while (sk->sk_state != TCP_ESTABLISHED &&
+	       sk->sk_state != TCP_CLOSING && sk->sk_err == 0) {
 		if (flags & O_NONBLOCK) {
 			/* If we're not going to block, we schedule a timeout
 			 * function to generate a timeout on the connection
-- 
2.49.0

