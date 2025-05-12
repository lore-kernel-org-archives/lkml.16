Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66CE295DA9
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 17:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747070372; cv=none; b=lHl9iefn0aAxT9KkCSQbDV2cDIREF7rTlkuTHmAqXTKfNFPZJlM3/gX1qdzbwqp2EB99nybZFNPWAlteApYHYfkvgmk06jJEBwC7bmnX23DZ2K555Ujg+JWsHx3iSqiBWIWo4kzKRupWcvsf4hcyWpm/O6jM8eccuYSrl9JCZiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747070372; c=relaxed/simple;
	bh=RNW2KeimRQOcvFcw/i3cv8RxlurLx/D1s5LYekc162I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qnEzkQQuljgFm9Vll3ypDl2ysxdNTKqfNqIt5n+obhyxs8lf+l0uZU4lmAGUEP1AK39x8p3/UHfzGAmfHJCNIy/lgXeqTJimI9WfeSbJpGcKvM8QbyNrU2Q20DsmrGTFXJuxugLpJwWCBeWLd2i2p/7Mttf3nS9wirz1lm0KbRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dGff3/ex; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dGff3/ex"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747070369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GkyjsEBVXZql//c31Uv3m9eI0pp2by/4V63M4hl5UAI=;
	b=dGff3/exv3QiXEdlBVs1kbwI0YACOcOI+3ZjR/lQRJiRrenp0T5yZ9jLJtaMTnaGQBppR2
	0cccCbb9ZH1mq+5K9NigQAKFZM7CxjiOwlhG7iOzpnV5EEqIENp2nKFJwu/1abWp+wBzhr
	URj0GoAZIRm+Q72q/fV7yoTsCtEP0qQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-03KZGTXsPnmqEJRQRaGviw-1; Mon, 12 May 2025 13:19:28 -0400
X-MC-Unique: 03KZGTXsPnmqEJRQRaGviw-1
X-Mimecast-MFC-AGG-ID: 03KZGTXsPnmqEJRQRaGviw_1747070367
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7caef20a527so1277837185a.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 10:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747070367; x=1747675167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GkyjsEBVXZql//c31Uv3m9eI0pp2by/4V63M4hl5UAI=;
        b=N+bTbVDDCLWwnFpDEX6CeNNpGqiEp9LoirOABO/9ojge8jUuhjCNRCce8UKHz/PmdL
         +jQynK1GZG+Wbtfzi+cAjBBYwXD+8ZqZWDQHPx6KCjK5mBgUlJK+1Nm0PYMKVK3i9+X9
         XrZE+0x7Op1XyURyQ+ddQxLR2xng2QwRLmCC4f8zH5xlhcMjJKnKQ3XUU41lRTE5XtnK
         RUTsdUQ841GLQ9+T2Zc5ofuWhnS7gzSY6af+h0V/WZdpcTHfe+3jz7IbXiHs443peXvz
         xeBMYfbGGHUfZmOsXsIqZ8Myx8s6vPWPTzmffNBJXhm8XWEPTsdqD2MVWWqREA7weZzB
         sYZQ==
X-Gm-Message-State: AOJu0Yzdn5hbybW84KhXTtLKale/BwpIQ8NUdaHZKtzO4kMIbGUTGFfp
	26DlH/+pTd2uC0NnYiwEiW1LhD1dlXWn9Jry89paEGeD1rgLlpQQMHUwZ47ej8OKgCNgNwfnJR0
	Y/vf2O+zGEQ7vMXdWcsfMA104Xo0aNsFbl9TGrw/9CYa10eA6UuEyia9vCyrVkA==
X-Gm-Gg: ASbGncuSRJFOYKIKTLzkrFNHvCzoG9MLXrcMgZP7DNWa0v88gkQPU0HByrK1edurmj5
	TMWTgrEwrRzrqSomsxwMa/1fPq03HT9opxK1FA1jyc/aEKUG2tKz+wkVmiW8UqoZ6lWdHLTdKh/
	nW4PamY9LDeyVeYb3gL57tlEpyk1NUkx8fbzQO8bl+DHdFFf0Pkrzm75kM15FmeYMm4PwaXNwg3
	7+l6scpYHmY6rbG011QCCXcVuo6yyMBjeY0J0uwZ8NVxcU4KUXpYUPmo06PwCkqHsnuWhSzuQBj
X-Received: by 2002:a05:620a:2690:b0:7c5:49e8:993b with SMTP id af79cd13be357-7cd0117903amr2600637685a.56.1747070367662;
        Mon, 12 May 2025 10:19:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhXHfrlA0sTV0PHOWBuw1s2FByKk5Y/Ebo9kg3frdH6FoHXH39u54Ko2H7v00+/RU+D2wJOA==
X-Received: by 2002:a05:620a:2690:b0:7c5:49e8:993b with SMTP id af79cd13be357-7cd0117903amr2600632085a.56.1747070367162;
        Mon, 12 May 2025 10:19:27 -0700 (PDT)
Received: from x1.com ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd00fde7c9sm574237485a.75.2025.05.12.10.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 10:19:26 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: Alejandro Colomar <alx@kernel.org>,
	linux-man@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Andrea Arcangeli <aarcange@redhat.com>,
	Mike Rapoport <rppt@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Kyle Huey <me@kylehuey.com>,
	linux-mm@kvack.org,
	peterx@redhat.com,
	Robert O'Callahan <robert@ocallahan.org>,
	Suren Baghdasaryan <surenb@google.com>
Subject: [PATCH 1/2] UFFDIO_API.2const: Update userfaultfd handshake and feature probe
Date: Mon, 12 May 2025 13:19:21 -0400
Message-ID: <20250512171922.356408-2-peterx@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512171922.356408-1-peterx@redhat.com>
References: <20250512171922.356408-1-peterx@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's a confusing paragraph in the man page on two-steps handshake for
userfaultfd UFFDIO_API ioctl.  In reality, after a successful UFFDIO_API
ioctl, the userfaultfd will be locked up on the features and any further
UFFDIO_API on top of an initialized userfaultfd would fail.

Modify the UFFDIO_API(2const) man page to reflect the reality.  Instead,
add a paragraph explaining the right way to probe userfaultfd features.
Add that only after the "Before Linux 4.11" paragraph, as the old kernel
doesn't support any feature anyway.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 man/man2const/UFFDIO_API.2const | 43 ++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/man/man2const/UFFDIO_API.2const b/man/man2const/UFFDIO_API.2const
index 54b34a1bc..1c554107a 100644
--- a/man/man2const/UFFDIO_API.2const
+++ b/man/man2const/UFFDIO_API.2const
@@ -42,25 +42,6 @@ fields to bit masks representing all the available features and the generic
 .BR ioctl (2)
 operations available.
 .P
-Since Linux 4.11,
-applications should use the
-.I features
-field to perform a two-step handshake.
-First,
-.B UFFDIO_API
-is called with the
-.I features
-field set to zero.
-The kernel responds by setting all supported feature bits.
-.P
-Applications which do not require any specific features
-can begin using the userfaultfd immediately.
-Applications which do need specific features
-should call
-.B UFFDIO_API
-again with a subset of the reported feature bits set
-to enable those features.
-.P
 Before Linux 4.11, the
 .I features
 field must be initialized to zero before the call to
@@ -70,6 +51,30 @@ and zero (i.e., no feature bits) is placed in the
 field by the kernel upon return from
 .BR ioctl (2).
 .P
+Since Linux 4.11,
+userfaultfd supports features that need to be enabled explicitly.
+To enable any of the features,
+one needs to set the corresponding feature bits in
+.I features
+when issuing the
+.B UFFDIO_API
+ioctl.
+.P
+For historical reasons,
+a temporary userfaultfd is needed to probe
+what userfaultfd features the kernel supports.
+The application needs to create a temporary userfaultfd,
+issue an
+.B UFFDIO_API
+ioctl with
+.I features
+set to 0. After the
+.B UFFDIO_API
+ioctl returns successfully,
+.I features
+should contain all the userfaultfd features that the kernel supports.
+The temporary userfaultfd can be safely closed after the probe.
+.P
 If the application sets unsupported feature bits,
 the kernel will zero out the returned
 .I uffdio_api
-- 
2.49.0

