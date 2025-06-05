Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D78216E2A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 10:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749119826; cv=none; b=iV+PW561arPCOVpIjjLGoE38eF0DkXhDUg9ikFriVECHiKw0/fmjy4pOvLYDe/5xAkoPQL03wXrI8yB2FPnuK4EgB4wdtH2k2D1honmfRSMhPxyz7zh05EaTiXhPSGoqDab2rNmorn5pHLioFo/BK0DP7w+jOxErzrdvossXIPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749119826; c=relaxed/simple;
	bh=cOsu4Qrb+3bx73g5aMRxtPG7+Gkx5amoz9G8WVXNU9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RoypzZbAZO/uXrLbeXIsoVm7w6wlbAOWOKw3f2zAMJrggvTu1BSgxYN0wMCZ6ZlJq2yOZccDd6a3o7/LE6rUa/FbhKC4xs2eENu9jaHYkmSu2dXwW2OaN0yz0BGf0TflT3o3v6PwxEk2XrCOpDCA3nBCCX87R+pnl4vEMjwoj+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KfYLkCY5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KfYLkCY5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749119823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HiFig5XrzaKxrne/VffAS5Dccms79XHv1+bktez4Dgg=;
	b=KfYLkCY5Ibfns3yY5fwO0kFdujfCOVRQ+CtLu8D2PM/PFTK0SWpN/1TIGv+Gobpzh8humL
	j+SIfyVP4YtskmjMO8eoz+Z8LyAR98nmOOMGw/OGb/hqFgmatXm7e5aCMt8IBnkJZQ2nka
	+z1LU7rjg+CN4fN89F5e6oqRdk/jLIw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-mkKq6imzOzW4-EEHVEv2PA-1; Thu, 05 Jun 2025 06:37:02 -0400
X-MC-Unique: mkKq6imzOzW4-EEHVEv2PA-1
X-Mimecast-MFC-AGG-ID: mkKq6imzOzW4-EEHVEv2PA_1749119821
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450d57a0641so5613965e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 03:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749119821; x=1749724621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HiFig5XrzaKxrne/VffAS5Dccms79XHv1+bktez4Dgg=;
        b=fh8jJnA825z/zKRyISUFQs4XrGsTiez7Y2hRmfLvRlrHCCjsiLLxOK6/LMXNJBuB4E
         3Dy2Yjv9s5OnXwfsC632FhuWwWXvGwqajzNU97l7cS7Iemmx1By7pcHxWRkmmGA5qc2Z
         S/QsQ311jBQX2MILhElg3vi927G+WiCdr9CtO7U1oshJxNH9pXOMX+Mym8qlfMmM6Soe
         OSaVkG+Q9Etpn9vyAeWp9z8Az+F0dKiKVcMIuurUxx8CZ+myxmPN+BQP3qVpatwPMrXI
         6xYg/ZdU6yW2LmYEKCT3mMnz+uuoEpYoHExTalZ6L0OdlzDhW4ygzXjAn6I/0zHTR0Y4
         xZwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBaJWzAHyry/+cgUYQTQ5FDLt92jzy14yGykTsP0C/xViaclq5MTEJUgBITGI+JCWvwtPqZToRTH9JqfA=@vger.kernel.org
X-Gm-Message-State: AOJu0YySNizJCt7axt9nxuz9qKIqoIhXeW+oNN+tAbz+XRFztMeb8Rqf
	L/H0WQG/DcLzzxqnL+m6kFt7/e64z3qldUATN5nYHuGUAFO6wpQMxTQlqrdbWjBRNCHeNkU29M3
	UY0D4gybr8ZvG5R2kgs7EDkKISge91s8A0p5hEcJYdCjphGz6a4kI8z4Wa1/+fciorrBG2/cHvQ
	==
X-Gm-Gg: ASbGnctPPJws4FhcuDwOxP4B2wVBGxoI68Yz9fH3x0VVawQ2rO6yZHx+GgoCGDNl1nm
	wkRj9jLayy7KO29kqBbMsxNiXjn3OBuwDFbeDWHyAqC7i5MOFYyQMcn9YPn3HAvnctGSsnUZDpg
	6uwmdEpYPYf2PfbSNJsvO/rIUT6T8+mXouuwO7q8nFPVtkPxf8eYsWfCNwH6ba/GieMbrcrb9ey
	IS1JiEg4SMA//W76XIl6UcPFsWZRhp8A2hsErD7JzLTUyF7w8a6aC6W4An1/lAJBB4ymyh0/QBe
	cG5/rVbPW9ddpKJVWSz7nL8dxNHO0zO2cXTCIIbnoMxnDrU9notdZmky8b2ov5HT4Ii5ObM1cQ=
	=
X-Received: by 2002:a05:600c:828f:b0:43d:ac5:11e8 with SMTP id 5b1f17b1804b1-451f0b26621mr50050495e9.21.1749119820632;
        Thu, 05 Jun 2025 03:37:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFs6aFjV1ri9gglwDDly0k/rNzs1/j6SDKTIoXHxHHy0T2KK5H3bwQ524CbBRzv8yzrX28AyQ==
X-Received: by 2002:a05:600c:828f:b0:43d:ac5:11e8 with SMTP id 5b1f17b1804b1-451f0b26621mr50050275e9.21.1749119820235;
        Thu, 05 Jun 2025 03:37:00 -0700 (PDT)
Received: from rh.fritz.box (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f8311ae6sm14105175e9.2.2025.06.05.03.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 03:36:59 -0700 (PDT)
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
Subject: [PATCH v3 2/4] KVM: arm64: selftests: fix thread migration in arch_timer_edge_cases
Date: Thu,  5 Jun 2025 12:36:11 +0200
Message-ID: <20250605103613.14544-3-sebott@redhat.com>
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

arch_timer_edge_cases tries to migrate itself across host cpus. Before
the first test it migrates to cpu 0 by setting up an affinity mask with
only bit 0 set. After that it looks for the next possible cpu in the
current affinity mask which still has only bit 0 set. So there is no
migration at all.

Fix this by reading the default mask at start and use this to find
the next cpu in each iteration.

Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
 tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
index c4716e0c1438..a813b4c6c817 100644
--- a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
+++ b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
@@ -849,17 +849,17 @@ static void guest_code(enum arch_timer timer)
 	GUEST_DONE();
 }
 
+static cpu_set_t default_cpuset;
+
 static uint32_t next_pcpu(void)
 {
 	uint32_t max = get_nprocs();
 	uint32_t cur = sched_getcpu();
 	uint32_t next = cur;
-	cpu_set_t cpuset;
+	cpu_set_t cpuset = default_cpuset;
 
 	TEST_ASSERT(max > 1, "Need at least two physical cpus");
 
-	sched_getaffinity(0, sizeof(cpuset), &cpuset);
-
 	do {
 		next = (next + 1) % CPU_SETSIZE;
 	} while (!CPU_ISSET(next, &cpuset));
@@ -1046,6 +1046,8 @@ int main(int argc, char *argv[])
 	if (!parse_args(argc, argv))
 		exit(KSFT_SKIP);
 
+	sched_getaffinity(0, sizeof(default_cpuset), &default_cpuset);
+
 	if (test_args.test_virtual) {
 		test_vm_create(&vm, &vcpu, VIRTUAL);
 		test_run(vm, vcpu);
-- 
2.49.0

