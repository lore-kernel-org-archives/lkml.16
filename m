Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2A326F478
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746714034; cv=none; b=LIOrJpxQ/yfnZay/gw1ijfTTFe+QUKll/P1NiogKDvx5hIjWo5RWCZN/BAY4e7dscajNTJ3/6uEywOCw+SSn41BC+logS+83etxutx0sO9eZBl0iNrRC8uw/M9pZfBBZ3xR/uuiu264GxlAyoLQnqJlEJLwWxSFoBvS6kZBhVj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746714034; c=relaxed/simple;
	bh=7YG192ZsD3WUn3drwZlMqsrENOopUzB5dGEgYOknoQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d4XPwHKnM1MfIkpfUtvBQtzBXZZU/pUxauyAPGSuGP57qNAGN5zV2rZR7QHTp2xDkNiSM+r2EWE394of1Ta9NHW9gjfWL59bQZXXd6NYQtsFE0Ak42giZ6Bnjfc+FvbLWLkT+mgDxZ2KLlZiMHCaeRqaOsdB1qwd2SWoj4sNcWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MX40ca2o; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MX40ca2o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746714031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Egj0FQy/riyQmvL5sll8nVIB9OlbYijgnbiGu15AMX0=;
	b=MX40ca2ooU4dW+VGU8okDD/5KC6dtIcqTdi/3lD4SPd6r9+GvCvg7Rrc09Pg6A3mZ8QSUH
	aAphQJGufRGOk/XlpjQCf6wZV2tKYDLfwNBR/49WaH1aMIWzWXqQJeBwx7rAQvmha3H0Ea
	oav4rQK9ZUKmW3iUi8r+z9IYTGsjuSk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-ghRCDbJFPk6F0lo9Gfh76A-1; Thu, 08 May 2025 10:20:30 -0400
X-MC-Unique: ghRCDbJFPk6F0lo9Gfh76A-1
X-Mimecast-MFC-AGG-ID: ghRCDbJFPk6F0lo9Gfh76A_1746714029
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5fbf91153c5so1044137a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 07:20:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746714029; x=1747318829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Egj0FQy/riyQmvL5sll8nVIB9OlbYijgnbiGu15AMX0=;
        b=Dqr4Pwji9fvmWv2wZwnoOgLedBTdFELgMBmdNBhr47rwhZBezntPMzqmECW2DDs8QT
         fLYtrN06XsFOBGBPP5n23H5QnuKHPvUnnXBmA6mTQ5uLpTMigMm5nXrix3vg6cb21tcZ
         BjkT3HyKHsqzWmsLpapC2aW/RaM67crEvcwRDVCCFz+ItMroJIbdrtX8vnAGxXLEtUuy
         fn9kHRBctEizGiUe5naVPyqb48VoitVS9g+1ue7coFp9MIekcWxq4Efsxk9kqvq6KhvK
         KiUKuOgeMVMkQj2dsSmV205ls1/Zbitro3dGaU91UimsLVpKylpOHE3qY7/gShRThw96
         2UKw==
X-Gm-Message-State: AOJu0Yx8HXWrYZxhbzbyMJjGYNXxweBaXz03ttrK5otRssEFzBsHQfNM
	J6G3PshDeMzoAwcfGH8/lrrJw/VdzbOdpZkLrOpylmQXpH3ZM/U5dA/mORQRSh4Lo3AvbJWkAC8
	yV98GP6wm85dnLiX1sOXN5BuDdRBOEqaZ45BXO1Hanr9eAIWI7RsJmMKi+wqlfw==
X-Gm-Gg: ASbGncudbhsT6rwes5094jDS8w4lFu175s74If8OAtk0bEvij2WEZOCXgLGWiWq3OeD
	WKrNWDw+OL7UUorVJhSdERZHmX3R8CeX+2yLkc8q3AZwdEab/9S1vIXUEEWgA2pkc8zAXFHZIIN
	qLROipDuYqNkZsAcrlbchJG+RMLUPa3VutLjg8nyGtWMpZGKj2q6imk9xqqLc550Q8h42qRdjxx
	HFSEXj8taYYTsaGX5pY9xOWCtMBRQJ5I0XZDEJK/IPEsWrpC08TQXp4zQh4yZ7hjdJO5HeSsMQp
	bvK3MuVYz1kRJB7QqfkYI4utUA==
X-Received: by 2002:a17:906:f10a:b0:ad2:15c9:9c73 with SMTP id a640c23a62f3a-ad215c9ade0mr24419466b.34.1746714028973;
        Thu, 08 May 2025 07:20:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/Oe8HK04stKuYdcastU9b8FffLyMB1PLqflqnugfQTg8McvY43KaFdQo960fI2h3cqw+r9g==
X-Received: by 2002:a17:906:f10a:b0:ad2:15c9:9c73 with SMTP id a640c23a62f3a-ad215c9ade0mr24416866b.34.1746714028437;
        Thu, 08 May 2025 07:20:28 -0700 (PDT)
Received: from localhost.localdomain ([193.207.221.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a3f1asm1103005766b.64.2025.05.08.07.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 07:20:27 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Stefano Garzarella <sgarzare@redhat.com>,
	virtualization@lists.linux.dev
Subject: [PATCH net-next 2/2] vsock/test: check also expected errno on sigpipe test
Date: Thu,  8 May 2025 16:20:05 +0200
Message-ID: <20250508142005.135857-3-sgarzare@redhat.com>
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

In the sigpipe test, we expect send() to fail, but we do not check if
send() fails with the errno we expect (EPIPE).

Add this check and repeat the send() in case of EINTR as we do in other
tests.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 tools/testing/vsock/vsock_test.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tools/testing/vsock/vsock_test.c b/tools/testing/vsock/vsock_test.c
index 7de870dee1cf..533d9463a297 100644
--- a/tools/testing/vsock/vsock_test.c
+++ b/tools/testing/vsock/vsock_test.c
@@ -1074,9 +1074,13 @@ static void test_stream_check_sigpipe(int fd)
 	do {
 		res = send(fd, "A", 1, 0);
 		timeout_check("send");
-	} while (res != -1);
+	} while (res != -1 && errno == EINTR);
 	timeout_end();
 
+	if (errno != EPIPE) {
+		fprintf(stderr, "unexpected send(2) errno %d\n", errno);
+		exit(EXIT_FAILURE);
+	}
 	if (!have_sigpipe) {
 		fprintf(stderr, "SIGPIPE expected\n");
 		exit(EXIT_FAILURE);
@@ -1088,9 +1092,13 @@ static void test_stream_check_sigpipe(int fd)
 	do {
 		res = send(fd, "A", 1, MSG_NOSIGNAL);
 		timeout_check("send");
-	} while (res != -1);
+	} while (res != -1 && errno == EINTR);
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

