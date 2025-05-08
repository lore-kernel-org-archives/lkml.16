Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A812253EE
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746714027; cv=none; b=H/tJvDZqwljjrHV28G3pDnNwjJGOJvfkNkqDcEoipFu45i2XZSRFQ530zU42ROaUTyOuM6cmYqPHEXv2ZkTCW8yBZHP8uQqpOoRpZMZI7nF/37UJX0Ye2VPvK9b+8ARsXL3GqZ6SgCDpk8LV9A7MgFuCurSSCMoTgUEl0UCisLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746714027; c=relaxed/simple;
	bh=YvRNLSi/VrpoieogGKGsgCKAlWpBPuTAmyy56vB3yh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RoyRixdUtg8tYXz25UCilszdPZTxXmmyfMgcLMC1NtTxMmYFtawjhjvf/4ONqzuZ0Ylyw5IJIap57JFvJhnTEuLtRNtEGiDu4bhqaoLRKd1jj3kfZu1WXHMX44KfIoifNVs394oCJlwMTWFePht7S0rnJ5aURh1zhhQnctbLBkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YP0DPSGY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YP0DPSGY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746714024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p/inhQIAJVDlclzovizj1G424bvRWbJSy56O+ePhgtM=;
	b=YP0DPSGYq4TQlEjuIxYFBhPTNtVOArmcBGdc4aepgWbKmIu+gi3j9XRPqkXhA89GHd3Xj4
	T1z2mVv4JBjFySGBc/pUcJJpzMz11Fk1lotA9x/QyIauFqhhPZLG+Ps4gtDHlr93dkxzne
	FHAIMKj9Jgix3kbTVFv0rOgQ2GBKGq8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-BXxLdWG8Na6y6MitNaGL8w-1; Thu, 08 May 2025 10:20:23 -0400
X-MC-Unique: BXxLdWG8Na6y6MitNaGL8w-1
X-Mimecast-MFC-AGG-ID: BXxLdWG8Na6y6MitNaGL8w_1746714022
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac710ace217so82847466b.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 07:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746714022; x=1747318822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/inhQIAJVDlclzovizj1G424bvRWbJSy56O+ePhgtM=;
        b=W4hfx751YiI3MswnFiiJ9VRhLBiH8o8GN0jqSYT64GZjuc942g5KUyIoWWaw+Ha+9D
         1Bv8lkizWgcE0tLPj773KErKHrgipWyzEOjmSsqw+W8/f3lMlw+zuB4aTlP5YBPy46xI
         ElZi8tHpVZ6sNyhwJdav5u2qhnR30Zq12OpOVcwLakbwPzPj6kPv1f+6rc93TvBbLZeR
         RVz6UHoSIi5jYt9HFtbqDDmdpYWNWZFMGplkXjg2O6aYMvHfuSCiDx7K8mIazaNN1vLd
         3rLqAc1Jc7FotccCaGdkpp8JdpZtT9Y2yPxZ9+wFrA7RbNCHjbGuXY72baOc/6d2z/Jw
         6PZA==
X-Gm-Message-State: AOJu0YyLecss5glxa+FpnOJGQq0WD/guEBxQqONE1w/STtsaVWJP+I6x
	u3mnFXe8Ds2MI2biMloisVZFtOTPAqDQKMjzZLhqquOKF1+DclKHosskG18WMW30qWiGhsYMBWB
	Y7cyKCGh+j4toaqJeEvnkZmQNrRiijn26O49xwJJIKCnr2aWlXXBKPznqIQAVOA==
X-Gm-Gg: ASbGncsfERLRx3LCAzHDfRpEkAlgD1y1cQ/+OOSEOHatW+m6oP11miwh4I61/2GMmx4
	6XWwBpTtZi1pr8bEvC/wpUb6AFeKQJel8xBUwxgshg0JIu2hzvId3qtqsN4z9hKcFiYcj3wnrWn
	7q8GZ9HtYBIOrGU1N90RybX50upLns3QC+sLlGvB+H2QoqNUJGZCkcYqFyvO/f8hJ/laJUvhvAo
	00cmN3qgv747XhPS5YPi0q92KfNbaJxqBkk/+ZyqJHBdGjLGp31cRZ97843FAS9H/Zv4U+X5IA2
	JQa+87zCPKR13HVku710Me0Z+A==
X-Received: by 2002:a17:907:96a7:b0:ac7:b368:b193 with SMTP id a640c23a62f3a-ad1fe6f68b4mr342644366b.27.1746714022433;
        Thu, 08 May 2025 07:20:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRTgUh6IEfYQONbpJtEOHpIxAXun5putCZzRRkLB2V22yE0BXo1RjIX+rhP121YMlrUvpBiQ==
X-Received: by 2002:a17:907:96a7:b0:ac7:b368:b193 with SMTP id a640c23a62f3a-ad1fe6f68b4mr342639966b.27.1746714021843;
        Thu, 08 May 2025 07:20:21 -0700 (PDT)
Received: from localhost.localdomain ([193.207.221.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189540d5bsm1096012366b.176.2025.05.08.07.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 07:20:21 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Stefano Garzarella <sgarzare@redhat.com>,
	virtualization@lists.linux.dev
Subject: [PATCH net-next 1/2] vsock/test: retry send() to avoid occasional failure in sigpipe test
Date: Thu,  8 May 2025 16:20:04 +0200
Message-ID: <20250508142005.135857-2-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250508142005.135857-1-sgarzare@redhat.com>
References: <20250508142005.135857-1-sgarzare@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Garzarella <sgarzare@redhat.com>

When the other peer calls shutdown(SHUT_RD), there is a chance that
the send() call could occur before the message carrying the close
information arrives over the transport. In such cases, the send()
might still succeed. To avoid this race, let's retry the send() call
a few times, ensuring the test is more reliable.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 tools/testing/vsock/vsock_test.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/tools/testing/vsock/vsock_test.c b/tools/testing/vsock/vsock_test.c
index d0f6d253ac72..7de870dee1cf 100644
--- a/tools/testing/vsock/vsock_test.c
+++ b/tools/testing/vsock/vsock_test.c
@@ -1064,11 +1064,18 @@ static void test_stream_check_sigpipe(int fd)
 
 	have_sigpipe = 0;
 
-	res = send(fd, "A", 1, 0);
-	if (res != -1) {
-		fprintf(stderr, "expected send(2) failure, got %zi\n", res);
-		exit(EXIT_FAILURE);
-	}
+	/* When the other peer calls shutdown(SHUT_RD), there is a chance that
+	 * the send() call could occur before the message carrying the close
+	 * information arrives over the transport. In such cases, the send()
+	 * might still succeed. To avoid this race, let's retry the send() call
+	 * a few times, ensuring the test is more reliable.
+	 */
+	timeout_begin(TIMEOUT);
+	do {
+		res = send(fd, "A", 1, 0);
+		timeout_check("send");
+	} while (res != -1);
+	timeout_end();
 
 	if (!have_sigpipe) {
 		fprintf(stderr, "SIGPIPE expected\n");
@@ -1077,11 +1084,12 @@ static void test_stream_check_sigpipe(int fd)
 
 	have_sigpipe = 0;
 
-	res = send(fd, "A", 1, MSG_NOSIGNAL);
-	if (res != -1) {
-		fprintf(stderr, "expected send(2) failure, got %zi\n", res);
-		exit(EXIT_FAILURE);
-	}
+	timeout_begin(TIMEOUT);
+	do {
+		res = send(fd, "A", 1, MSG_NOSIGNAL);
+		timeout_check("send");
+	} while (res != -1);
+	timeout_end();
 
 	if (have_sigpipe) {
 		fprintf(stderr, "SIGPIPE not expected\n");
-- 
2.49.0

