Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2DA226D16
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 14:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746801217; cv=none; b=s5mFFHEMLkWVXZEHc9/+gFR1j8lTrxto2sLGolvES5KG6lDSdk4k8J9LAgXuMuuJBmJJDhsNRplt1CJhS/PNiy83M31+skDYU7b9oEi0Pv6KoTg6eM88Lw5adWH9RXlzq0T+9Mdyy0Av8Yr8XQDralk4HhCiKtL6W3ZNoCl5zis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746801217; c=relaxed/simple;
	bh=VzQyPkruYWrDZAOkmL/UT3N0xShjKnGR9pQJo0jQ/Qk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SmlMhwTPuF0+mdhRaPyU1VF/z6OQwSoqO521GhN40QcC3yhg6ZmcpgqEuvjiWevBHS4Ns12uVUrEvGuJ7EY5Uv3lR5g/z6xTMjLj5BqZlh7Ihpl+8zg9VXuVN/VoOWxP4XJKTy/H7KInEQ9BeyKozUkVNP1pDr5Q2+2Qb1EOWsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KLrNuHzh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KLrNuHzh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746801215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AdRsO2Uefrz8JMO751IFZEkS7KH/EcFqwNDUBdHYAOY=;
	b=KLrNuHzhP6SjJINNdYXQc3Rp+0TXJBemQvCxvhtl2aULaHsBN+hPNCizKnk0ewcGsbJ7mf
	82BP3i05u2hIXAfZ28Vzkz7eGLxnw34oPT6aO6Srqdiapgio1wTHCZMm0kEJuawAmuAgs6
	60fOTF/UuiKv/TVmetzAu9mjVdmICSI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-_pbh8pkMM8OGlaELteebLw-1; Fri, 09 May 2025 10:33:29 -0400
X-MC-Unique: _pbh8pkMM8OGlaELteebLw-1
X-Mimecast-MFC-AGG-ID: _pbh8pkMM8OGlaELteebLw_1746801208
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-442ccf0eb4eso16756365e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 07:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746801208; x=1747406008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AdRsO2Uefrz8JMO751IFZEkS7KH/EcFqwNDUBdHYAOY=;
        b=bPADFP0MaJjLHs0d+szU+WUl+LEwa8kstm227AtVr5FTptEbDHl05sR3oUMYPvjBdn
         oNAiSYWM+fSNQL68/xQjpgSLOlTe/NimVGAGTTzUZz4htOgEW49MGiJo7rE5t3saKl5L
         Uu9+6yuJYy/aonJ/Ey+36ShK2W9XsAkXqpQoDASeQx3InEbsRIuKqwlbF+8c7GyCG25M
         gwg6qgGorW3p+cBa9Dz751FH8E4btmj4936y21EATe7+tgFnf+G/T8+i9hljyBW/mDHb
         CXOz99Q5EqH5FJdNeYSSUEPQ9BboEEYwDh/+nEViLQHH6IUQZvLVfppfNVtj7/gBGsJf
         HdkA==
X-Forwarded-Encrypted: i=1; AJvYcCViRbz8eqIRKjpCs2jNEcOJ0TEJ35vW5r0egpkSOMkMtkPoc/93yyyA+YPW5E0DP+9Y1z9lj7wkuxSlMuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNykkvcQTuzcQv5QbkTNwIlCg7Xq0p5Z3mWn3gpEfY4toMETW9
	YxjlH+4Y++rBxB+q0bMbjDhCRP9Oy5RUHY4VxGf/RP4U4qOUzgIK527jzAbVaS7hraIiNYf1RGE
	ERVW1ehRO2WoQfI4GN/85PdaGzPtr+B2w/BWpb6Bs2E2UlRRzWmQvwprERIJlmg==
X-Gm-Gg: ASbGncsdJH9vFC2GP0aPbYCpLoPbk20pMPJQMp/0z9AS4ymmXbCJKIgEC750pMQrjmd
	oMcf/A23xYvzArl9YOFB8oHsMnpeaFyAhA4xCk02O8fhCL2BpFfHsdr3YLhgCAG9/IKQbrv9g9O
	4KYNSsHu9E07UVh3UTDz6fRxLpDUJrCBkFDYSddFrz2P8mv4U1L1yyOuRWYMyFNb2+7yxaLjvQt
	g7/HsYZQf7G3P8adUPl+Rmo2rGoAT6w5+CyOUeUq2Dx/L/ffk3b2tUh7z0JlA9sDKGqDCt3wAHf
	ZCOD0zn+iLppfRDfFDhOX8+j/k2+AbZ0WZOqVbv7fioRZdi0gZAQA3XCRVKjemHzT3x8cw5hYNA
	=
X-Received: by 2002:a05:600c:83ca:b0:43c:fb95:c752 with SMTP id 5b1f17b1804b1-442d6d18b68mr35853845e9.3.1746801207829;
        Fri, 09 May 2025 07:33:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHm9MkDy/quubUQsSnalTOipje79m4aFFrG3Bj/W0QEAlm0r1Z0dt5gqWlFblcQZwsloaT3Fw==
X-Received: by 2002:a05:600c:83ca:b0:43c:fb95:c752 with SMTP id 5b1f17b1804b1-442d6d18b68mr35853555e9.3.1746801207515;
        Fri, 09 May 2025 07:33:27 -0700 (PDT)
Received: from rh.redhat.com (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67d5c7bsm32150775e9.4.2025.05.09.07.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 07:33:27 -0700 (PDT)
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
Subject: [PATCH 1/3] KVM: arm64: selftests: fix help text for arch_timer_edge_cases
Date: Fri,  9 May 2025 16:33:10 +0200
Message-ID: <20250509143312.34224-2-sebott@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250509143312.34224-1-sebott@redhat.com>
References: <20250509143312.34224-1-sebott@redhat.com>
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

