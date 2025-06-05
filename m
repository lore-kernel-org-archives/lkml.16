Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E267F214A6A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 10:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749119824; cv=none; b=suR8Xf3XyStYwibuaZKubKEnilimgZ4QgbOprHXqv0SLmrcaFur3yfgP7zAmpxGn/ELiug2K7HvARTYhYw561mSErL7CeL/1SC5oF0euRIkgmPb3VfTcGbp3dVPUF2fUh9tJ/tQa2UfIE5dxipaA7WoSkYpUXaGJwdMMbOyBpQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749119824; c=relaxed/simple;
	bh=VzQyPkruYWrDZAOkmL/UT3N0xShjKnGR9pQJo0jQ/Qk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XHxHaQsOWrsQGWNdDLRKZVnk6pbD1H1s/JYYDvhj6Pw3DQnsO2T2xWsikP2IHw4caUERlkyA+i4+kb1EIzXZMRWnAlgtIiSvxO0mRggOptGWOH1cBfcs8/4UGwMb1RBCd4GnYH6CTbv5V3KWXSfzSMSRgHiZhRierG58SqTj/tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ee8JtKn4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ee8JtKn4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749119822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AdRsO2Uefrz8JMO751IFZEkS7KH/EcFqwNDUBdHYAOY=;
	b=ee8JtKn4AK3np+rN8KwUSKsDtvZ4n0cUbu6EkFo9f9JMejYicFwKZwksgstAW2nsQzpIlv
	qi6NVSIJIqO9GG1AYSxM6dk0D2GWZ16rYyGTXVB4J5A2OnYgJfkkunHFSf3EGvE9I7WmXT
	bytrwgoQtbPXpFtO1jtcNnL8utdoIF4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-qkn5NuUpNQK7BXdY3qLUrA-1; Thu, 05 Jun 2025 06:37:00 -0400
X-MC-Unique: qkn5NuUpNQK7BXdY3qLUrA-1
X-Mimecast-MFC-AGG-ID: qkn5NuUpNQK7BXdY3qLUrA_1749119819
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a5232c6ae8so357040f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 03:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749119819; x=1749724619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AdRsO2Uefrz8JMO751IFZEkS7KH/EcFqwNDUBdHYAOY=;
        b=byKDplDRCkGGoo+8PjOp6+bI2MZySKulJdud90sa2K+dO4YUW4T+5e/6y7P2KY3rIk
         tdGO1aNxga/26DxRxvgsHqIlZK/nMwIKMyWQMtGZD1QDBXqBTn34ARuHFY6nVCCD5rf2
         yBchnGCW28Kea8X4llycoeEYpcSKMgf6cg5BhX8eL3T/EidbDfx5ed0sTJ+Pr+Q8cU69
         T5YGBtINoBpJLrwIgG5QVr2IqrY8VV9lkA4iaUExfQk+FzE0cPDt1oIDcuLrsnfs2rfe
         hacTfYMNjKPzW9uIXjteyCNeA9EBbskItL6E6xH3YgXV1elpH6ArdiRt+06kg8aO1F7L
         a2mg==
X-Forwarded-Encrypted: i=1; AJvYcCUHFn4u2H8BoyC8RaI5EqPQFWRlGLVZN/17vOxtldzbxfFSJgTNq+NED1DrTfu2GzaNlvhoeIF0u/KlMAk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY/tzI89joSYkcC6yz/bKTAeGqQrdXSqoGfni0wfC/IZxlvf/6
	Ch1PW7mqDdl+tadnVITkUsl8nGY8tkx+lnYIUdoIgIAWE8y+2jvpQe+BBHP8GIP3SwEHxlf7T2P
	40fM5Z44ub9akztAQbbMTp8NYITIAbgrbdbEDG23or4Qb/onYFeR3DUxJ5WnxbqUklQ==
X-Gm-Gg: ASbGncs0J7Y1AQMnsdL0hgtRjbHicveaFAOTksMZ2yTz5cNSsjDrZaC7J7LR0F9goI2
	6x+MhVlH0Gcny3cTGNCDls+lJryywLJQwHxQPx54owJ7umHH/hsV1oK0UND/GNpCenP/OSxQN9y
	YW3hBnKjO48vlgiso1fM/vZ2foOvbjaGiU0TtbUlExnB0u16cazNA5bygRX1unIr7kx/GLkTGvc
	bAldVmBaTGwXgIOYIalW/EjheyBQ0xS0KkD0QB1kJezA2n6HyR87QcdmC5aYYuf+ZnMuZa+H/F/
	GjnEa9QD7y6P49lkroufHdID8/1/m4YK5LI8mwY5C1F+jCGzmRS52J3G5SjaJ1S0s5I5bYt1eA=
	=
X-Received: by 2002:a05:6000:144e:b0:3a3:ec58:ebf2 with SMTP id ffacd0b85a97d-3a51d8f6a68mr5594158f8f.7.1749119819359;
        Thu, 05 Jun 2025 03:36:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRjZpPO2+0jMcuZP9CR9nsUnOUJ7V0YuUBqF23a88OV3aPhw4HnJ7EZRrzi+l8ZxUNJutO1Q==
X-Received: by 2002:a05:6000:144e:b0:3a3:ec58:ebf2 with SMTP id ffacd0b85a97d-3a51d8f6a68mr5594137f8f.7.1749119819002;
        Thu, 05 Jun 2025 03:36:59 -0700 (PDT)
Received: from rh.fritz.box (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f8311ae6sm14105175e9.2.2025.06.05.03.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 03:36:58 -0700 (PDT)
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
Subject: [PATCH v3 1/4] KVM: arm64: selftests: fix help text for arch_timer_edge_cases
Date: Thu,  5 Jun 2025 12:36:10 +0200
Message-ID: <20250605103613.14544-2-sebott@redhat.com>
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

