Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFEA1B3952
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 14:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747232389; cv=none; b=rWj2YzVHbRZqhSyphh4t60a3uL2T+q6pLnz5YXY72CYeitDj0liLFYnvO5mdP0vurPfF4/UD7DkZk1kDVqaFrrB6ua3I1I+Lzfq8wi3/kSWzZKIXOLDpHYfmuY5zLsA69oVQLIeHhePsAk3jfqxxmtZinCh7JjNwMQFJxV+sYIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747232389; c=relaxed/simple;
	bh=5Sj5KzI/F46StOB82OyP21k7diNVwpEzL2KwJR5OdEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NpdoT+IXoQvYkIee2V2KMH9TW6sYGnQB+SG969wziYVi6UITIdLAwi/KkryNdzO1ts3Wid+mLKbiSiYi+DfyhwKiZXPeEDGTsnaugUIcDJ+OvygHYulOcmoivIJK3EfEUFlwXT4NdIdFcZaGkIo2EnrxnQYJzODP3hOz1R23XwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RsgLmJUq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RsgLmJUq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747232387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Zvmt/u8Of+L1THnq1idxvoVHR9sJvksCbQhIaqH1ko=;
	b=RsgLmJUqx2Jye3nWFC/liW9hAgF2raciqJz/WvwXogsCQrYLTfJNqZZ1q/q8BPtScIJX3k
	6O/YLNKCujOGlXXkEbsNuuVkabrMBFxjHG9TEvodCMHW4/f1PYNA+/hiL8NnKHNOpCaYB0
	PfkObO15UwbAvsui2SIP1T98CV6wD9s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-pQChAy8wOoC1f-1tUszhxA-1; Wed, 14 May 2025 10:19:45 -0400
X-MC-Unique: pQChAy8wOoC1f-1tUszhxA-1
X-Mimecast-MFC-AGG-ID: pQChAy8wOoC1f-1tUszhxA_1747232385
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a0b7120290so3177834f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747232384; x=1747837184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Zvmt/u8Of+L1THnq1idxvoVHR9sJvksCbQhIaqH1ko=;
        b=d2uL9XdZnMbvNCfQOcWf9ZzK4o8Di3XOHfiQi5j/5V8oj8XdeORehUNq0i+zQ+5GdA
         wYSsTL7Ze+71ErC6ZRcR6/zOQjiHW07XrdAhRg/va3J8EpFpqsUmIuShGUaMwwpVxWIf
         EQnDN7KhmZFlXjFuZMcQDpIUshPXZw3kH5Ncvq7d2vYObTjomBGEOSIjtknO2rg8fHlF
         bINj4us+pQ36hwDDA33+z3Lzz7PqdQC5PmzWfMqGfXV4FR6/QlvVj9RJg0lvqE9TKxNp
         hvwd/s1HSeNw/D6Lx4e0oHPPYbmMEazUmkbnUreuUMXa0UOqk37pc3Xbw5Qb2eu3oMyr
         RWcg==
X-Forwarded-Encrypted: i=1; AJvYcCV/yZZf6YF2lmqC7o56JHL9EmohI1Ymxifh6c6TsZQ7bpOA0UQ972gpTXmQTScH0ptXIsEtqtJp5NrOFO4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2Vi+vUgwC8pT1jLu7P/Qu0VweSjvk8x2QHSCbezfLd+3FbD9S
	IQFrNNSUWrcMppWwu05gtGaFCtavSWE06QiRSpVtFeErPvQfQjnQUAOj2wQqw2a5jUiYG8H52qV
	swqfdg23xvgu87eB8KIc1Rcl5RJnAC5IKWS/6joHiEwN6VhHvWlP1AUsjFCHExw==
X-Gm-Gg: ASbGnctoQjQ+xGAPYYrHDAihWn+ZGoPKLnfeqgtFaPpWjUEWOf3QgQcqRZAFX3LWzwU
	reQfnNvxrI8wI8oT2RUJ1dhHhlqhg8xNs9fBotPmlZuvc//tlysh1xuKkgSvV1i7Pfe/+vkFFsB
	OZxQk1PyWoLM5dyrfoRRKiPqk6JQsjJDS+oKAdA1MNUyJHwO6/vt3QDo4wUcYXp/2PbH9hN94Ej
	3NFcew+fQz0DXEHkM4DqDbWVkYM8xLWnO2QsS5sMizOhcd2kVJKK+Eua/uLrfPpLlDm5Ko2mps9
	ksEXcNY12DDEqOJ8Yw==
X-Received: by 2002:a05:6000:2011:b0:3a1:fcd9:f2ff with SMTP id ffacd0b85a97d-3a349694e9fmr2882893f8f.12.1747232384550;
        Wed, 14 May 2025 07:19:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlD0Y36veSQX0bZUBU4CJr9Oc/mcPJK9k57/34jB6gCQcLqBmTZi0wMgJYerwAAhbWQRLHsQ==
X-Received: by 2002:a05:6000:2011:b0:3a1:fcd9:f2ff with SMTP id ffacd0b85a97d-3a349694e9fmr2882865f8f.12.1747232384019;
        Wed, 14 May 2025 07:19:44 -0700 (PDT)
Received: from stex1.redhat.com ([193.207.203.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f28f7sm19625694f8f.41.2025.05.14.07.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 07:19:43 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Cc: virtualization@lists.linux.dev,
	Stefano Garzarella <sgarzare@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 2/3] vsock/test: retry send() to avoid occasional failure in sigpipe test
Date: Wed, 14 May 2025 16:19:26 +0200
Message-ID: <20250514141927.159456-3-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514141927.159456-1-sgarzare@redhat.com>
References: <20250514141927.159456-1-sgarzare@redhat.com>
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

Sleep a little before trying again to avoid flooding the other peer
and filling its receive buffer, causing false-negative.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v2:
- add little sleep [Paolo]
---
 tools/testing/vsock/vsock_test.c | 38 +++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/tools/testing/vsock/vsock_test.c b/tools/testing/vsock/vsock_test.c
index d0f6d253ac72..68f425af00cc 100644
--- a/tools/testing/vsock/vsock_test.c
+++ b/tools/testing/vsock/vsock_test.c
@@ -1058,17 +1058,34 @@ static void sigpipe(int signo)
 	have_sigpipe = 1;
 }
 
+#define SEND_SLEEP_USEC (10 * 1000)
+
 static void test_stream_check_sigpipe(int fd)
 {
 	ssize_t res;
 
 	have_sigpipe = 0;
 
-	res = send(fd, "A", 1, 0);
-	if (res != -1) {
-		fprintf(stderr, "expected send(2) failure, got %zi\n", res);
-		exit(EXIT_FAILURE);
+	/* When the other peer calls shutdown(SHUT_RD), there is a chance that
+	 * the send() call could occur before the message carrying the close
+	 * information arrives over the transport. In such cases, the send()
+	 * might still succeed. To avoid this race, let's retry the send() call
+	 * a few times, ensuring the test is more reliable.
+	 */
+	timeout_begin(TIMEOUT);
+	while(1) {
+		res = send(fd, "A", 1, 0);
+		if (res == -1)
+			break;
+
+		/* Sleep a little before trying again to avoid flooding the
+		 * other peer and filling its receive buffer, causing
+		 * false-negative.
+		 */
+		timeout_usleep(SEND_SLEEP_USEC);
+		timeout_check("send");
 	}
+	timeout_end();
 
 	if (!have_sigpipe) {
 		fprintf(stderr, "SIGPIPE expected\n");
@@ -1077,11 +1094,16 @@ static void test_stream_check_sigpipe(int fd)
 
 	have_sigpipe = 0;
 
-	res = send(fd, "A", 1, MSG_NOSIGNAL);
-	if (res != -1) {
-		fprintf(stderr, "expected send(2) failure, got %zi\n", res);
-		exit(EXIT_FAILURE);
+	timeout_begin(TIMEOUT);
+	while(1) {
+		res = send(fd, "A", 1, MSG_NOSIGNAL);
+		if (res == -1)
+			break;
+
+		timeout_usleep(SEND_SLEEP_USEC);
+		timeout_check("send");
 	}
+	timeout_end();
 
 	if (have_sigpipe) {
 		fprintf(stderr, "SIGPIPE not expected\n");
-- 
2.49.0

