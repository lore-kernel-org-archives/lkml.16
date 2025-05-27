Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4538F27876E
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 14:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748355887; cv=none; b=lYS6H6ZOXmQL4USJ+yZmoQhgHg35YjlRUozzQMeyd8I60atGiiIsPp6U1Fg/yno8pDdFUHQHTqFl0upyr9T5QA4YYyH9HtOk9m2Dbotq43yDZlpFHh2l8AGn1w9JdcQFDg8afAhk8L/SVyFyc+8LEQx4qXijY8i8C7uZk1w5lgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748355887; c=relaxed/simple;
	bh=+SSxOMMFNEUYqXyhOMZxzDFcaBj3MIuICtYi5zenoUk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KURnFdMOIsdDzTA3kTfPucvtTa/A/824FRz+S3hGLrfOUds96nhIXg09xaSYb7IXY5BpRC7ouA5RSJWsvVTdIXZcGOwUQhi4c0QnFilL/CUD7LjthqA/u5HzZPBchB7iCrCRds+YZ+b08J6EUMwHgnkUF3LJ39F+L+ZWU0o8kiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PIadMwCr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PIadMwCr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748355885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+M4G1HOIYzO3zH6634YUQensr31XqNL9E1Ubp3gcMeM=;
	b=PIadMwCroN4I5ZpYD/FMKQ3Qa383bHOvIOvwrWKzPHx8uVBY6Ndt8/yD5RWfyLGMaf8IB8
	oTotT9ve9BqgZWz9jNjGVekbZbqiWgD/Qjy6ofH6b+F4ZzxP9ClVNpDFmkgAzsjwNEsON5
	L6Z4qDPNCda/J+esoBn1AdWL62GI2Ns=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-ehx7C9IJNmm4g9XchLr9yQ-1; Tue, 27 May 2025 10:24:43 -0400
X-MC-Unique: ehx7C9IJNmm4g9XchLr9yQ-1
X-Mimecast-MFC-AGG-ID: ehx7C9IJNmm4g9XchLr9yQ_1748355883
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-442f4a3851fso25272675e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 07:24:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748355883; x=1748960683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+M4G1HOIYzO3zH6634YUQensr31XqNL9E1Ubp3gcMeM=;
        b=t54GXpKgs1x2KN+ndtwgnCoZ/g60dN/M61SJ270lW7a3jkae6ofWtvC8bPxTBzJCje
         KxPdqw5bC6Y9W0mb88/+NCpf886es36bVyz1XoxJxk4fVTZKuyyjnoy5FGDD6eHDV1lS
         z5uiQi+VERCa8aaFBNWRn+pWYXnzTnv38ONj/pmCtOYGret/VdoWxVRn+Jciv+CK2lED
         n3BlVGR/PzfdVZ+88d6HB4B87xWLe1HnpxwdiLhIvw1MblrmdiIrd8Fn4IAw57ATLFoF
         Rt+IdVnB9445fZkUeDkL2RQMBy8pXHwWR4p/jnY+zA8Xu4PJD3mc8TIX8vEE2ZJ2jbyc
         ZdpA==
X-Forwarded-Encrypted: i=1; AJvYcCUVHwTHDlkLiF2jxv/NTaySi1HqUYt8lCUfYx0Ga6tlX6cHvHTo6fMwXHxmX4Xdk9Ke/NzRrPpQ9eFD7g0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb3DUSlYwPaB4qbBEZFpLLVmEqJQ10GTs3AROnvK/Td83h8cxU
	6ftDla2rzp+h57G9mNX1jGikjsj+aupqZYHdtQeV9/91++X6WdeAsB9Z1AI7WywJBFnOvHID8Lu
	uZd7c/uKJ3IosYVZiy0M5XqaZnHxtRCTzZl66QKOlj9UcUQObuuqFif9n6fE8KJQwyQ==
X-Gm-Gg: ASbGnctDwFMSZk7N6GaGoW9VURSPAwA2pI3Sphnql9jVN0BJuSS2CZtuO/0TwF3p8HF
	WVKsIWV/6LUmopHoyYhmSC5HnpZbgY+olcCasq9lLd7b90loU2WKOGZ8Ke1vXMNnkH+3UE2AzGR
	CSFSRSUXXibjkl5+EZwJfL636E/gNCiWCeDB1kRiN38HqZFPVftomeOPaKJTT0x2/CBnxoa1hu+
	oaFNwO2SkvrZIcYI4InMaSR7glE1o22qlLuSWXnKGb9n7xCCsXZXn4qkn6PWUERXDPS7AWSEonb
	jtam6wC6gTEcaGMja/DODF6uMRPPuyd4bFblQJHN8+CHqOKoG/NxVu8CGxc0dJpw27rqGQ95Cg=
	=
X-Received: by 2002:a05:600c:3ca6:b0:44a:b478:1387 with SMTP id 5b1f17b1804b1-44c9465c97cmr126923845e9.17.1748355882717;
        Tue, 27 May 2025 07:24:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2Y1uyM7+4XnYXdfaOr89AGuzVgzEd4y5M+LgOhzm3Rp5mg6OEofI/yliTAkfcRwsyfx9W9g==
X-Received: by 2002:a05:600c:3ca6:b0:44a:b478:1387 with SMTP id 5b1f17b1804b1-44c9465c97cmr126923535e9.17.1748355882319;
        Tue, 27 May 2025 07:24:42 -0700 (PDT)
Received: from rh.fritz.box (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d3edcsm278766415e9.20.2025.05.27.07.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 07:24:42 -0700 (PDT)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Cc: Colton Lewis <coltonlewis@google.com>,
	Ricardo Koller <ricarkol@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Sebastian Ott <sebott@redhat.com>
Subject: [PATCH v2 0/3] KVM: arm64: selftests: arch_timer_edge_cases fixes
Date: Tue, 27 May 2025 16:24:31 +0200
Message-ID: <20250527142434.25209-1-sebott@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some small fixes for arch_timer_edge_cases that I stumbled upon
while debugging failures for this selftest on ampere-one.

Changes since v1: modified patch 3 based on suggestions from Marc.

I've done some tests with this on various machines - seems to be all
good, however on ampere-one I now hit this in 10% of the runs:
==== Test Assertion Failure ====
  arm64/arch_timer_edge_cases.c:481: timer_get_cntct(timer) >= DEF_CNT + (timer_get_cntfrq() * (uint64_t)(delta_2_ms) / 1000)
  pid=166657 tid=166657 errno=4 - Interrupted system call
     1  0x0000000000404db3: test_run at arch_timer_edge_cases.c:933
     2  0x0000000000401f9f: main at arch_timer_edge_cases.c:1062
     3  0x0000ffffaedd625b: ?? ??:0
     4  0x0000ffffaedd633b: ?? ??:0
     5  0x00000000004020af: _start at ??:?
  timer_get_cntct(timer) >= DEF_CNT + msec_to_cycles(delta_2_ms)

This is not new, it was just hidden behind the other failure. I'll
try to figure out what this is about (seems to be independent of
the wait time)..


Sebastian Ott (3):
  KVM: arm64: selftests: fix help text for arch_timer_edge_cases
  KVM: arm64: selftests: fix thread migration in arch_timer_edge_cases
  KVM: arm64: selftests: arch_timer_edge_cases - determine effective counter width

 .../kvm/arm64/arch_timer_edge_cases.c         | 37 ++++++++++++-------
 1 file changed, 24 insertions(+), 13 deletions(-)


base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
-- 
2.49.0

