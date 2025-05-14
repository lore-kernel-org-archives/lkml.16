Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D791A0BFD
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 14:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747232397; cv=none; b=dPac2NgQayeqGo9FXlNlz2WMMVH71OK34XOeNFETnOJDQmrK2gLq4WbxkTr+Z/rW+UlfAAI1ptNc232IXLFipHk12rzibL2Z7ldU2cdABXzzn4dDwHKuDq3+YXPz7B1kkPduLrEU4BFWMTlk/AGSJ6umCEC6v7qf92Q/LEoqjrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747232397; c=relaxed/simple;
	bh=CcrER2Exd8xwndgBuv285nkTGJ5VgH5wjXS9fED1jP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FjUbDWReEeEvWUzDQoWDYLCvXLvQSDaFHvaSNcRdFF5QaGIteB0KveO9kEG09Vb8+xB+5Wu0UH+sC2HvIzZ/xgfnmw7frs89tlWlGKuPBRTP2VkBkHaxn5k+4MSm2fKHugx2U55FeQGBMDFDZMqzZyrUkFQUvp/8kzS8bdbjWtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aOQc/k2c; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aOQc/k2c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747232394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cDm7nJrRE59Z0WBLF69Q9FPldj2cPZK9AVpQiRbnwXM=;
	b=aOQc/k2cfY8v1T+jYzUZ4S9ib8pa8CwPrBdycKhazp9LYGUqeq/HmTptVYsVIHDpaNd/Qg
	YZIkH3vtFUFKJnT95VxCTUezY4meK0gpRG0u5Yg9y3qEVVSX85Kt1bZa2V57x6zm6uekYv
	XqdAgJF/sf4BpOfYFF3Lcpl+ZSy/LaI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-sEDdvhGxOuGi171SWig03g-1; Wed, 14 May 2025 10:19:53 -0400
X-MC-Unique: sEDdvhGxOuGi171SWig03g-1
X-Mimecast-MFC-AGG-ID: sEDdvhGxOuGi171SWig03g_1747232391
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a0b2e56da1so2799566f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747232390; x=1747837190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cDm7nJrRE59Z0WBLF69Q9FPldj2cPZK9AVpQiRbnwXM=;
        b=Gtf/+InGM9ugoNm/FONVv3GNH6pKdTyvAyfRvvpcTzj68Bn4WhfErygyRSh5zoi18h
         8SMbwW4czQO4jfEw7b+Qyn9eJ9s4QGaBaNXMeg6wa2ktv+lmnoMdf9sL5uinTGosMNp5
         djdk7mEquVWABSsPy+qaXrYxMwCWzO60lnj6SmaWcVIPLA5rGsUw3/Rfvk6BafVKsPjn
         tvQ/Z8nGo0QlfIuRyCgZe/lOoX6OL7yuO3jQqb9ag7OM5cUVIG66I2UhaNk3nz0NwNhI
         WU2MJ9pyLtfFLtVZ4Ka/3Y9uXKo62ILFr7lfphqAkuh4JNgC+3cay1jxeWzW38n126BX
         3TsA==
X-Forwarded-Encrypted: i=1; AJvYcCWnZ+ig6xzn4O6MTUYnkkc+OXyRzELHyytCl+wGwzgnZ9rDCahlBD7xaITcWgi/tadqrIzY8iZAmfakdnk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAOdfwwkRykemJMIFSoSBrJhHAp7PfoIPQn1McYG25GrXDiVeY
	0O4WZiC/a3ZHYbZKl2jF7z6R6i+EWMLEebEhMx0BWtpAzKquDiL1IF1iyf8TkqDBba3jGCIc3rx
	HkC73Mz44v4cUJPN0o4SIpy6qWLC23GhYTFawmLQG35inSniIcBd+okoAjT/TVVj/VuvJDg==
X-Gm-Gg: ASbGncvGGGJN6eH+Mew/FdcuQBYAQWbltWJs+4AvCZ7PUfo6qAuImfa8wIpMLv1WXkS
	KprRFAy1pdHmaLKGEaBW7bGMidfhPbRkOXAFG2hD262JSjvN59kN4zfO2y+5xdKHCKgW2D8hkOh
	zK+rKb5VXksp68VNhZzGLczTUVmMtywCXsD2l9rei2djYDTHxbZZLO6jedDCTu6iJGfY0dedvJL
	AV6sej2A8Xl+M+PVSVwmfKfPsq401fucjbG9YpaYskJXHPNb3KHifVxOy1cpCdiZfwc+KM++xXD
	oh+qMxGKtOg8Jw1eMw==
X-Received: by 2002:a05:6000:144e:b0:3a1:fcd4:eada with SMTP id ffacd0b85a97d-3a34969acb4mr3222048f8f.4.1747232390286;
        Wed, 14 May 2025 07:19:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG75RsnzyRLR1LhB+z1tdqBl/h6dNHdHAx2k1Nlw/1mOd/47oPLqRJ7tYPfYXaURS4y1kTd7A==
X-Received: by 2002:a05:6000:144e:b0:3a1:fcd4:eada with SMTP id ffacd0b85a97d-3a34969acb4mr3222017f8f.4.1747232389836;
        Wed, 14 May 2025 07:19:49 -0700 (PDT)
Received: from stex1.redhat.com ([193.207.203.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4cc2esm20351768f8f.90.2025.05.14.07.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 07:19:48 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Cc: virtualization@lists.linux.dev,
	Stefano Garzarella <sgarzare@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 3/3] vsock/test: check also expected errno on sigpipe test
Date: Wed, 14 May 2025 16:19:27 +0200
Message-ID: <20250514141927.159456-4-sgarzare@redhat.com>
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

In the sigpipe test, we expect send() to fail, but we do not check if
send() fails with the errno we expect (EPIPE).

Add this check and repeat the send() in case of EINTR as we do in other
tests.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v2:
- fixed loop exit condition [Paolo]
  note: the code changed a bit from v1, but this time I checked it
  better!
---
 tools/testing/vsock/vsock_test.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tools/testing/vsock/vsock_test.c b/tools/testing/vsock/vsock_test.c
index 68f425af00cc..082c5dd6e8f5 100644
--- a/tools/testing/vsock/vsock_test.c
+++ b/tools/testing/vsock/vsock_test.c
@@ -1075,7 +1075,7 @@ static void test_stream_check_sigpipe(int fd)
 	timeout_begin(TIMEOUT);
 	while(1) {
 		res = send(fd, "A", 1, 0);
-		if (res == -1)
+		if (res == -1 && errno != EINTR)
 			break;
 
 		/* Sleep a little before trying again to avoid flooding the
@@ -1087,6 +1087,10 @@ static void test_stream_check_sigpipe(int fd)
 	}
 	timeout_end();
 
+	if (errno != EPIPE) {
+		fprintf(stderr, "unexpected send(2) errno %d\n", errno);
+		exit(EXIT_FAILURE);
+	}
 	if (!have_sigpipe) {
 		fprintf(stderr, "SIGPIPE expected\n");
 		exit(EXIT_FAILURE);
@@ -1097,7 +1101,7 @@ static void test_stream_check_sigpipe(int fd)
 	timeout_begin(TIMEOUT);
 	while(1) {
 		res = send(fd, "A", 1, MSG_NOSIGNAL);
-		if (res == -1)
+		if (res == -1 && errno != EINTR)
 			break;
 
 		timeout_usleep(SEND_SLEEP_USEC);
@@ -1105,6 +1109,10 @@ static void test_stream_check_sigpipe(int fd)
 	}
 	timeout_end();
 
+	if (errno != EPIPE) {
+		fprintf(stderr, "unexpected send(2) errno %d\n", errno);
+		exit(EXIT_FAILURE);
+	}
 	if (have_sigpipe) {
 		fprintf(stderr, "SIGPIPE not expected\n");
 		exit(EXIT_FAILURE);
-- 
2.49.0

