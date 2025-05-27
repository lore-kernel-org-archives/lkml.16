Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0362798EA
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 14:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748355892; cv=none; b=V3dEOUCT6cxxj5Taiu4dgx7lgn367QU7EbbSo4Lh2pD+IXD4zK+voqTtjx1m12hh6RbTEFLJFen3/zG2L295ks7COwE873E5W5P/8+Libghk8sgzMlxyMsLyPBwq5w6a/kLpzvWG8uWNpjRn3PYhL4/i8nrH0PRPMNowgi+MB68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748355892; c=relaxed/simple;
	bh=VzQyPkruYWrDZAOkmL/UT3N0xShjKnGR9pQJo0jQ/Qk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ebsgMFyyFqrhEb+3dW+EOfLsn03asjk8QmV71MeUi169m+tP9f3Lhcetf2QC2US0+h0mE8KR+wRSNzOFar+vKVpmwCtyri2TB34U5byUfwO17HENWnn3Lc6POhGWpCBYE75V6C3jfKYxxa0DUI6KJa+KV/XzJWbX8KAqsI6PSj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=isNa4KZP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="isNa4KZP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748355890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AdRsO2Uefrz8JMO751IFZEkS7KH/EcFqwNDUBdHYAOY=;
	b=isNa4KZPJ+VcGx5frg6XDT2aeQuCkcjf7q/qz7kVN7I5Rnqwb5LCSvTVCsD/0WbRHj4KFH
	EzeohJ4+ScecvrX8JENo1MQjKYEv8sUFOBlPg4jBcehzlz1QjAHc0HSE5p3+bBAEMm+QYB
	eBue7dM1Lb6STGcDg+2eGcy4LB6SYDI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-bSzCGlofNZWSY0a_gsoM7A-1; Tue, 27 May 2025 10:24:45 -0400
X-MC-Unique: bSzCGlofNZWSY0a_gsoM7A-1
X-Mimecast-MFC-AGG-ID: bSzCGlofNZWSY0a_gsoM7A_1748355885
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43eed325461so22322205e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 07:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748355884; x=1748960684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AdRsO2Uefrz8JMO751IFZEkS7KH/EcFqwNDUBdHYAOY=;
        b=rFk1xQbwHjETWg5oAsV4cEzB8mzydhAAdAuXtyg4/DK/8mKd1TeVKum9wjzvFcwFp1
         XWRJ14dXW6OozhBaW3W06rlseGy0MeU64OLlXiq1mOWtACYPVLZUEtOfvP2XAKuWIeWI
         e2hTaqwvI5JQEfww3uvItv5z3kcZ8qSbLOKlapttr/ih0QGsej/d5zsH4sSqgxGhq5na
         LDTqx1HITyCpNpSHd3AwJjs0A2KuRWoE7gZpYERZLrYPp5Czmmgr7KI6CURmJyG2BfKL
         me3vNylLiqeZbyhFo9xn4ozRSz9Q714TkgK/Qx4ZvoWSL74wBi2QCXiTjOmfizsF2Jfm
         Okfw==
X-Forwarded-Encrypted: i=1; AJvYcCWdnwSaQbUIw/c9/qzhusYYPL93QhdbZ5tvOf7Nixt5Fr0/D+l5pZnxk58NrGYk0ED+0HwbDDPM6+cV7Xw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcU+jcaZbIGjMEOurzmAktc30vywClUqnRxzp1ieKa1tOs4xYO
	Caifc3N/Q5LsPNvESf/0eOATUEmTXhwxCHIKidMvaO7lpNQX++L9voGT4k+MfFqwrFg6EX8henA
	0XFevT6aWIqHK63s/2AsoV6ORJjdIauaIcScubFnNQddQf0PS7COkGDFCUTftF0eMUQ==
X-Gm-Gg: ASbGnctCXxX5U0GrtPjLWvWVveCNmsCg19F5RVdiYrTcpqqxBaHHZBGkHLAYigyRWps
	QlKxSGmhraaCiXS8pp7KVPbvUlSXaWmoQSRs7NI608D0ivh6vKKpNUyKY/zz1B/Fru8kceNe8kj
	eXv/5QjeKEyBfX22Kn5klejpGmsDG+iBfJYQymatQfHk9ck9UfY0N2CLHqNhTW1tnEHysdXPCnP
	lgKWrT/V5cVXFA2oYjcEF6PxjpMRymQxDBGzwy9Dt3UPKD6AnyCo/yZZkmZmy6b1RePzEvzt2I0
	ukBwPaAk7uY18VHtF5obq1+l+INN5wM6LJ9ryLsFn7rMX+Jz3oNnGtoCW/Fw8ZzzaTWi4Ikzhg=
	=
X-Received: by 2002:a05:600c:35d3:b0:43d:4e9:27ff with SMTP id 5b1f17b1804b1-44c93016587mr106055835e9.7.1748355884572;
        Tue, 27 May 2025 07:24:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGA8HR0A+QTW5CLIzzWpCQrdDEVxcSOCyoGFkafJofsp5nJGXbEA7AFPSlzJnet1RbsnO2sOA==
X-Received: by 2002:a05:600c:35d3:b0:43d:4e9:27ff with SMTP id 5b1f17b1804b1-44c93016587mr106055565e9.7.1748355884133;
        Tue, 27 May 2025 07:24:44 -0700 (PDT)
Received: from rh.fritz.box (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d3edcsm278766415e9.20.2025.05.27.07.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 07:24:43 -0700 (PDT)
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
Subject: [PATCH v2 1/3] KVM: arm64: selftests: fix help text for arch_timer_edge_cases
Date: Tue, 27 May 2025 16:24:32 +0200
Message-ID: <20250527142434.25209-2-sebott@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250527142434.25209-1-sebott@redhat.com>
References: <20250527142434.25209-1-sebott@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the help text for arch_timer_edge_cases to show the correct
option for setting the wait time.

Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
 tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
index a36a7e2db434..c4716e0c1438 100644
--- a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
+++ b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
@@ -986,7 +986,7 @@ static void test_print_help(char *name)
 	pr_info("\t-b: Test both physical and virtual timers (default: true)\n");
 	pr_info("\t-l: Delta (in ms) used for long wait time test (default: %u)\n",
 	     LONG_WAIT_TEST_MS);
-	pr_info("\t-l: Delta (in ms) used for wait times (default: %u)\n",
+	pr_info("\t-w: Delta (in ms) used for wait times (default: %u)\n",
 		WAIT_TEST_MS);
 	pr_info("\t-p: Test physical timer (default: true)\n");
 	pr_info("\t-v: Test virtual timer (default: true)\n");
-- 
2.49.0

