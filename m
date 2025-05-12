Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA46296D01
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 17:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747070373; cv=none; b=uW07QzbNNeBOuuCGPPko5Ybj2FR42dG3eHvJSSfvXGM2SzXbBw0ebRmKwnRdjOYhpO9bClxPfEVINzQXev1i0/isdFSzSa9mvCDXM8aq2t6rrI4H/P0IGTyPuuLHyOY9G9O+jwmSS54NFHvMqlYQ1Zip+i2RQL3M+99Wwxph/pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747070373; c=relaxed/simple;
	bh=6jrxi2OgPIlVyLawUTKOAWprABtCqGgriEH2/6Se5Qs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HUWaYuy1xWfmmgHB6H5/saHwYh6Z1WCAAUFKh/N70CMgug4jIdLhSDUomdYqvBCscNROppogeBBFaEKxXc/aTfsrk9l2NeCKE7nWlp/+B5J3j65oFZhIlPcoLGGy1bE2IK3DzDarUVEJGMzeuv8Eb5q84g0PZHjeIjUANbm/uAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bSmyzx4O; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bSmyzx4O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747070370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CWI3XlZ8DiHOSNmvwLFcrT7CheTTJj0Amd4kgoFoUz8=;
	b=bSmyzx4Oa8I+ciQK/3Eldx49dfhPVvvXiN8KKgMo8Zzo8AMZ1PmIKhFZL9EqeomzKxgise
	1VPNrmp0V3c/tl2UA2OZsN5w+NsKxv7A/rmqR3kRkD5TUz+8/90p+TfjgsodOThaBmipBv
	nsNc7Rwr0Vo3XI1XgGSW4ZugH2nHiU8=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-100-KzGpfKyZMSODyfiD7TOmmQ-1; Mon, 12 May 2025 13:19:29 -0400
X-MC-Unique: KzGpfKyZMSODyfiD7TOmmQ-1
X-Mimecast-MFC-AGG-ID: KzGpfKyZMSODyfiD7TOmmQ_1747070368
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5e28d0cc0so770717685a.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 10:19:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747070368; x=1747675168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CWI3XlZ8DiHOSNmvwLFcrT7CheTTJj0Amd4kgoFoUz8=;
        b=e1I0HVQwMUVzLF6rtnjaTT6FatlRXBX6aOQT9YvsKgxqBa2LDMVsIkTWqD7dZ1xLyv
         tIAG9VGUh8ILAMAS0g1dcSJOzilNzvIqybNksipiqMi8uOFCWfkcoAwgdCBMWE0BLDhx
         1UZCi5f0R0igIXCLTAtFaHkDYrPgrm+aZEh9ohfc8960ojvKrofoPOHIR7SHYIuzE0br
         J4UTphdBqDUTlduh0ViTKPc61eKhP7L58eNrZvDGJmRgxlIv7SlAHELuaqk8w4Y4CIOl
         t0/k8P0OtnOi5Z4gHHJCdaSh9Jqm5DVMpqQy9eBE/0A6YE6mCP5+DSPvURQ9q23QjQI8
         ztEw==
X-Gm-Message-State: AOJu0YxqNZ7RlyqZamwRX0bJSibQxphT3efJcQeAkbktzu/BFcIYFFGJ
	qir92wfN0XzEOiEUiJ+1Qz2AorioA+nq4bqJqyxSZeRWCmF/8W8sOcb7mEhbtF6O1QSJlj/27mm
	LWmt8PV9OSwP2DbhFM87dUrBvtloe7T5zzppfY6Xk4fMDCsJesvcE34Js+j1gSw==
X-Gm-Gg: ASbGncszPohWDddkkG2qR3Ej47v0lqaJ0p+b6tZ0dWKuNk1Bd2DKzlECxycJsDi+fxA
	TIGsyIi2AnYcv5wou5F44F7GBIILW+20+MB4zFqAPn3w8zlLGNcH5ylJaec+xiOM0k8gw5GAna8
	V87RCf1cRpTa92edQnM6CzFXMwY3WByD3NNW5Gv/C+d57ONR3nUtzfAuGpd++Z+iK/aZr/owvht
	Glct0IRp09+tif8dnE4VAdc19rWhkPYm09Ze7WCjNi67C1Igl+WPz4MthCQgmS7ktvn7C/0+K7B
X-Received: by 2002:a05:620a:2488:b0:7c7:6543:2018 with SMTP id af79cd13be357-7cd010f42d8mr2542746585a.7.1747070368504;
        Mon, 12 May 2025 10:19:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFE7u5GopyAen1aodLf0OH/i6/dXL0hCylOx/TfWNJi6vpOxB0Aqq+17CE6uEEEKzezAlrWdQ==
X-Received: by 2002:a05:620a:2488:b0:7c7:6543:2018 with SMTP id af79cd13be357-7cd010f42d8mr2542743885a.7.1747070368188;
        Mon, 12 May 2025 10:19:28 -0700 (PDT)
Received: from x1.com ([85.131.185.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd00fde7c9sm574237485a.75.2025.05.12.10.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 10:19:27 -0700 (PDT)
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
Subject: [PATCH 2/2] UFFDIO_API.2const: Add an entry for UFFDIO_MOVE
Date: Mon, 12 May 2025 13:19:22 -0400
Message-ID: <20250512171922.356408-3-peterx@redhat.com>
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

Add the entry for UFFDIO_MOVE in UFFDIO_API.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 man/man2const/UFFDIO_API.2const | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/man/man2const/UFFDIO_API.2const b/man/man2const/UFFDIO_API.2const
index 1c554107a..17ea6f905 100644
--- a/man/man2const/UFFDIO_API.2const
+++ b/man/man2const/UFFDIO_API.2const
@@ -204,6 +204,12 @@ ioctl.
 If this feature bit is set,
 the write protection faults would be asynchronously resolved
 by the kernel.
+.TP
+.BR UFFD_FEATURE_MOVE " (since Linux 6.8)"
+If this feature bit is set,
+the kernel supports resolving faults with the
+.B UFFDIO_MOVE
+ioctl.
 .P
 The returned
 .I argp->ioctls
-- 
2.49.0

