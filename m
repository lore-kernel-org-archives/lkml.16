Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9868F5B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750431708; cv=none; b=NWqFVXITwaKFcJPGwDRXXmzUijQrpeNGbJJVYHF6871ovu65MGOTkWpp71TLNxmPfcomNFpMxUZdAws2tHqU3u1hYodRTJ6NRhzM/6bh2D3vWUJBuFaMSufqzbDSYBfUXTBnJPxrXKCoSwsoRhoGzR2STdDLH2chKf1+TaQCTkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750431708; c=relaxed/simple;
	bh=q/aj5ksx3EnmSFVna5cf2ahuirUpTwRS4A6rWAJr+E8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aeuJKzeGrWCjT9MUkDqnmLZw9l/UKvt9IawrSVTg6OJG3841TcsyiaZJ/lCqXM/tWewOp+diK8sIt4Q1TOJvS7U1QYg5OogbL3it2Dzr47egYhxsbTGjsF7TiGMFlzKtc95ug92Iga2mvvzZ9y/vYqaexVtNa8igA4+7XL/skSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QV4qNzDK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QV4qNzDK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750431706;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7M76hqco3H5VT/KRuwIi+nGynG02bWulCQI/kQdG3h8=;
	b=QV4qNzDKt72hSVYcsiQxWIfhod4gsmz0qDmIbQuSs8eC/dboEwlDydJ0CZH8MjqZiTdmqN
	dD9Z6cLauXSGNrpBKGcUToXHBmJ1aLZYuqj+y9pJMsoxv9KroiXLhARi1HDPaE+EqXVPld
	ZAv0NsgrftOvRZj/kcCiRnkleYBPaQ0=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-t36sy_6EPi28h60ZcmmhLA-1; Fri, 20 Jun 2025 11:01:41 -0400
X-MC-Unique: t36sy_6EPi28h60ZcmmhLA-1
X-Mimecast-MFC-AGG-ID: t36sy_6EPi28h60ZcmmhLA_1750431701
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a6fb9bbbc9so67504311cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:01:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750431701; x=1751036501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7M76hqco3H5VT/KRuwIi+nGynG02bWulCQI/kQdG3h8=;
        b=dhsCM/gMe0xgYbXv00TxWSoRUufAYGlc41e4rwS6N909Fe2ICefdEp9lsFQWjl+gGA
         jscbnCfY7GYDJyh6vaQ/CQRT/g9X4HsZviFQ7liOoRWey1YODmoVx7HH4eMrDTmB253K
         dbrls833cQ2gNrpBGL6j7tfm1nLfzAaZ9Dh3rKHJXAD6YMW5vHwvF8Jownj9Ucf40Q6T
         lJuv/iL8vxcaWwnyOqD4MhtseVRpQBhNOh8zHdgZh6UDQ9p1lZqVdOyH31MbfD+qTcEI
         qqI9QjadvQNXwztTvrUV8Q5qtG0j+ST3xzu6ejZszGE+ybujNAKl0tcMokz4nMKU4hLN
         FTJg==
X-Gm-Message-State: AOJu0YwEcwRSQaUSgYpZMn9ipQhADwSS/hV/cMLo3BS9oFhFWHE+al6n
	ODeBQf5QHeruuoYsbaui73XRV5GgIiOMOxWAFYPWqXm5HVV9Iy7Wr41b7UtWxlK+AasiigpFJIj
	9iISBR9wQ+L/kqFGt5Z8tTFi0uVpUapU3sEy/ZGtg1JNmdvGPOWOFYy0p+2PrNyBKvA6OTycwqw
	eeTlSJI77Hvt4NIsUSLN6Z5qZY+hWdV6CX3/jiHV1iH+0ViGg=
X-Gm-Gg: ASbGncsW9MTPAcJKOM5ubGXGmob66X3B8Se1OmJo6maYRl8i8ITGmXWIBxOgic3TqCQ
	5waO7OYIuiCNGW3HUIRXo5xf1xZLb3h/VHyewpKltEh0xagA6tiUMxuqcm1DwsWUBkGPMy4IC6n
	r2H6yBoRl+ximMFRouW/+1/wqgwaW2J7ZrS3UeHgxSDgm2bzW3VMtbAR0YO6t8Y+bga0htXQYv2
	CfE8JEDKwacVI6V3mqhv18oWV0srl2or+1zMIQULaIx3MtbohOn9VOiKYBVkkEYMU0dEdu+oGdF
	bpz9dUGz7T8=
X-Received: by 2002:ac8:5cc5:0:b0:499:23e5:a39e with SMTP id d75a77b69052e-4a77a1d4d9bmr54074091cf.18.1750431700626;
        Fri, 20 Jun 2025 08:01:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4qEwMJ33zE9Sqd79sefUScGaIuWWM8E3d59dP7cNTO+z2hf353gSFuHf5UiYiJkG+YNg1RQ==
X-Received: by 2002:a17:90b:1b11:b0:313:5d2f:54fc with SMTP id 98e67ed59e1d1-3159d64a4c7mr4866230a91.10.1750431665061;
        Fri, 20 Jun 2025 08:01:05 -0700 (PDT)
Received: from x1.com ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8391574sm20688775ad.28.2025.06.20.08.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 08:01:04 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	peterx@redhat.com,
	Ujwal Kundur <ujwal.kundur@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	shuah@kernel.org,
	Axel Rasmussen <axelrasmussen@google.com>,
	jackmanb@google.com
Subject: [PATCH] selftests/mm: Reduce uffd-unit-test poison test to minimum
Date: Fri, 20 Jun 2025 11:00:58 -0400
Message-ID: <20250620150058.1729489-1-peterx@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The test will still generate quite some unwanted MCE error messages to
syslog.  There was old proposal ratelimiting the MCE messages from kernel,
but that has risk of hiding real useful information on production systems.

We can at least reduce the test to minimum to not over-pollute dmesg,
however trying to not lose its coverage too much.

Cc: Axel Rasmussen <axelrasmussen@google.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tools/testing/selftests/mm/uffd-unit-tests.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
index c73fd5d455c8..39b3fd1b7bf2 100644
--- a/tools/testing/selftests/mm/uffd-unit-tests.c
+++ b/tools/testing/selftests/mm/uffd-unit-tests.c
@@ -1027,6 +1027,9 @@ static void uffd_poison_handle_fault(
 		do_uffdio_poison(uffd, offset);
 }
 
+/* Make sure to cover odd/even, and minimum duplications */
+#define  UFFD_POISON_TEST_NPAGES  4
+
 static void uffd_poison_test(uffd_test_args_t *targs)
 {
 	pthread_t uffd_mon;
@@ -1034,12 +1037,17 @@ static void uffd_poison_test(uffd_test_args_t *targs)
 	struct uffd_args args = { 0 };
 	struct sigaction act = { 0 };
 	unsigned long nr_sigbus = 0;
-	unsigned long nr;
+	unsigned long nr, poison_pages = UFFD_POISON_TEST_NPAGES;
+
+	if (nr_pages < poison_pages) {
+		uffd_test_skip("Too less pages for POISON test");
+		return;
+	}
 
 	fcntl(uffd, F_SETFL, uffd_flags | O_NONBLOCK);
 
-	uffd_register_poison(uffd, area_dst, nr_pages * page_size);
-	memset(area_src, 0, nr_pages * page_size);
+	uffd_register_poison(uffd, area_dst, poison_pages * page_size);
+	memset(area_src, 0, poison_pages * page_size);
 
 	args.handle_fault = uffd_poison_handle_fault;
 	if (pthread_create(&uffd_mon, NULL, uffd_poll_thread, &args))
@@ -1051,7 +1059,7 @@ static void uffd_poison_test(uffd_test_args_t *targs)
 	if (sigaction(SIGBUS, &act, 0))
 		err("sigaction");
 
-	for (nr = 0; nr < nr_pages; ++nr) {
+	for (nr = 0; nr < poison_pages; ++nr) {
 		unsigned long offset = nr * page_size;
 		const char *bytes = (const char *) area_dst + offset;
 		const char *i;
@@ -1078,9 +1086,9 @@ static void uffd_poison_test(uffd_test_args_t *targs)
 	if (pthread_join(uffd_mon, NULL))
 		err("pthread_join()");
 
-	if (nr_sigbus != nr_pages / 2)
+	if (nr_sigbus != poison_pages / 2)
 		err("expected to receive %lu SIGBUS, actually received %lu",
-		    nr_pages / 2, nr_sigbus);
+		    poison_pages / 2, nr_sigbus);
 
 	uffd_test_pass();
 }
-- 
2.49.0

