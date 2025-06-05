Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C372217716
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 10:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749119827; cv=none; b=s7AEzMwYaw4Ayxg4hssPlVYwD3mZZIIXe8xDBflBmvW5DBn28hGya3YMCrDYnj3YZDu75kGSGpzVvaFeUmohQQY2AgF9F2BzcbZuxU+z8A2gb2xv+gxGeY0iBNvIb/E6phLtWblLCDy3JR/Up+QSgj4bMyRNji0dsM/TSWBcQQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749119827; c=relaxed/simple;
	bh=9XeYGeARuady+jct2m+tvWS5mZLD2RXXr/jmj8/Q/5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qnBNLVdfD89+zQdUgEJdh1y4GIajJEFJ3fgF38tkK0cPegJru7H5OHYvLDIaxIRbDkIEAs+b1WPe1hUuuL4AxxpFiaT2OUNesH37wL1Dbz2H7syQoFWoIkFmT2+y7SigffaaqVA/B3rQXCj9jJYM9Nl12AtZu0MzoG5rsa9n/8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W4dWB9h2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W4dWB9h2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749119824;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0rVhjvVcIXx5T86Gzf/rZsso5uT7BOLjFW6qVNZ4D4g=;
	b=W4dWB9h2QrFUOMDRdwu7PxHz341RXpaa627mV/X4TtJO/djrYfe351gSpjFy0xUff4363+
	P3LuzxfRyWT28cSRDIjJdtKx6d7IeMChsHfskyMPcUxVaQFVnlCJiBLVGHCWng9MnVHBNG
	gAplifDAvmh6lic2WZiCAXM7rqLHD0E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-KMuclDWaPgqeSj9j4m6T6A-1; Thu, 05 Jun 2025 06:37:03 -0400
X-MC-Unique: KMuclDWaPgqeSj9j4m6T6A-1
X-Mimecast-MFC-AGG-ID: KMuclDWaPgqeSj9j4m6T6A_1749119822
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450d6768d4dso4941255e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 03:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749119822; x=1749724622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0rVhjvVcIXx5T86Gzf/rZsso5uT7BOLjFW6qVNZ4D4g=;
        b=txEKzv/dKpi1DphGgnGpXETvkXEmUI3/GRYtVTbpdeMibU+DYura1XmPUYh04v/HQO
         DN0S+H/yJ4Pyz3Idns6Ctv1pisPDl6teaBdVeEoC7mig3T0n7kNuReykHStdpRpaEGNH
         +l2MVzq/mrowMa9clcP4JBHGWXYxn4/iPvV6iI7yYLzOyyIUjevP+D3UaJh82thBQpRy
         503UX0EXwnmCflUkGJq65Num2ILfhEpnp/+C66n6dgYd8pAnJODRWRQgfvR9mWiuPeSx
         oyhje+QIMf7g/iHwsPphpt6WYtnVQf+dQrhxwYn96acRQX4uQJxbdngk7Vm8lG7xI1JP
         HpvA==
X-Forwarded-Encrypted: i=1; AJvYcCUxFNMfBhVqkc86IRl3sQxp/TYKvRoESmP3VnCXt9tmDT/a4ZWbTM//ODGnqQZHr7DP4+YCBDzS8YGZJ5U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT/Bxw11TAW6Y4foR8dDuKGa5bIaUGmkD8+vpccBANeUSYeE23
	l3fkRSTuNwulwXaE7aW/LBFZgkzsommddX/AjWMHUFdYqmXAJT/+Y+oMtx9atD9UG0DYqYKU5RL
	MCrIlo1Uka4+GFXweRaL1zQIkC086b1W80oTSmNF/XGbb33L9+DAZ/sEJmL2y7+Gcag==
X-Gm-Gg: ASbGncvWXIYLcyqxS58Wrxyd+62Ko6uZF9VNri0p973AKgkXETfelOx2bx7iFiGTuvx
	fDdejJ/X/ATHJnBxGaajEz+yG0UyBwgbXiQRcLysJHSFJOxAb9GD/IIlj7NJAbi7gjv4/dHCKxe
	34V6qoRY+dIwsSUJOAQrjVe7mThFFpOHu+n9Tdz5EH/US1agx2SWDItcPifpjLoyZW49rHZ1YBF
	w7jNMoOCJTUI3Qkdh8SLcTWFncGUz4V3BxZ+IGarzyOKN9aMsXOiEWp4SrJaVpQPTWBnevm2Vbw
	LnrF1jHVdGlWj4LaJTWEICQDp7MTMjiuWJVF53NthpgmfM4oDPrmZsBJyJrafMwPuHPEfmw+lg=
	=
X-Received: by 2002:a05:600c:46d1:b0:450:d5f6:55f5 with SMTP id 5b1f17b1804b1-451f0a6a475mr59189875e9.6.1749119821938;
        Thu, 05 Jun 2025 03:37:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGl6x7gVIPWibQhMLU8nel9VytzISKQ2PPkA0o/8Tg4UeXbk96NsVZsi/1KR13ZEgWYC/qLMQ==
X-Received: by 2002:a05:600c:46d1:b0:450:d5f6:55f5 with SMTP id 5b1f17b1804b1-451f0a6a475mr59189665e9.6.1749119821528;
        Thu, 05 Jun 2025 03:37:01 -0700 (PDT)
Received: from rh.fritz.box (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f8311ae6sm14105175e9.2.2025.06.05.03.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 03:37:00 -0700 (PDT)
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
Subject: [PATCH v3 3/4] KVM: arm64: selftests: arch_timer_edge_cases - fix xval init
Date: Thu,  5 Jun 2025 12:36:12 +0200
Message-ID: <20250605103613.14544-4-sebott@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605103613.14544-1-sebott@redhat.com>
References: <20250605103613.14544-1-sebott@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arch_timer_edge_cases hits the following assertion in < 10% of the test runs:

==== Test Assertion Failure ====
  arm64/arch_timer_edge_cases.c:490: timer_get_cntct(timer) >= DEF_CNT + (timer_get_cntfrq() * (uint64_t)(delta_2_ms) / 1000)
  pid=17110 tid=17110 errno=4 - Interrupted system call
     1  0x0000000000404ec7: test_run at arch_timer_edge_cases.c:945
     2  0x0000000000401fa3: main at arch_timer_edge_cases.c:1074
     3  0x0000ffffa774b587: ?? ??:0
     4  0x0000ffffa774b65f: ?? ??:0
     5  0x000000000040206f: _start at ??:?
  timer_get_cntct(timer) >= DEF_CNT + msec_to_cycles(delta_2_ms)

Enabling the timer without proper xval initialization in set_tval_irq()
resulted in an early interrupt during timer reprogramming. Make sure
to set the xval before setting the enable bit.

Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
 tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
index a813b4c6c817..be8bbedc933b 100644
--- a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
+++ b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
@@ -191,8 +191,8 @@ static void set_tval_irq(enum arch_timer timer, uint64_t tval_cycles,
 {
 	atomic_set(&shared_data.handled, 0);
 	atomic_set(&shared_data.spurious, 0);
-	timer_set_ctl(timer, ctl);
 	timer_set_tval(timer, tval_cycles);
+	timer_set_ctl(timer, ctl);
 }
 
 static void set_xval_irq(enum arch_timer timer, uint64_t xval, uint32_t ctl,
-- 
2.49.0

