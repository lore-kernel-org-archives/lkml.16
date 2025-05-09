Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4571E224B0B
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 14:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746801214; cv=none; b=u2hhWukd8jkWgAshlNz5Kb3D5eA6LkoBOcwpQr8LztDH5rhuyVN23Vv//ZLAIO+aNf1iwHYu0wrgZDYQH23yjPZ0cfit4QkjWmzxSGHwQCMOpBp2Cx5s0uJuVSRQW2YBV+iotvHpDDV5uLaSzyKwcExHeNB8JN3pzGlMXJyEU0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746801214; c=relaxed/simple;
	bh=cOsu4Qrb+3bx73g5aMRxtPG7+Gkx5amoz9G8WVXNU9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S8aMgZ7vbN89UFea9fbmPBnHl0FnKj/ha8/LzzpA/gd9AtT3kPm2wJvsy/9hpPRG3Zk2J/PZvNIjrHGKpwfli5JnbzGp1k/tUA4RbpYdCSi1hD1Ff7kOpzzUvvVxXNgaHoHm1liGjpcX7AAu+ZXRkXskdQ86fWibgkpMTCl7Jrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IGlukIfO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IGlukIfO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746801212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HiFig5XrzaKxrne/VffAS5Dccms79XHv1+bktez4Dgg=;
	b=IGlukIfOWG4jWktiXvat+nTsy2yoteCK5ZGWIJAMitP2ZT53TkMooBjdceroK+ZJFcrx0k
	QYmk8CivGtntH1rF0582IGsT+RuGzyG7guErGMC94rv1usyCryH1SpNY4ehzPCJfNiG7y7
	7O5/ORRecNbov7MhHxJOZrx0T0N1AeI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-Yck63TBFNh6yZ7AMYGQf0w-1; Fri, 09 May 2025 10:33:30 -0400
X-MC-Unique: Yck63TBFNh6yZ7AMYGQf0w-1
X-Mimecast-MFC-AGG-ID: Yck63TBFNh6yZ7AMYGQf0w_1746801210
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43f251dc364so13544045e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 07:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746801209; x=1747406009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HiFig5XrzaKxrne/VffAS5Dccms79XHv1+bktez4Dgg=;
        b=wQZLKhw8/x6P3Ka+MTTUytG0ABgt/bnhWFLPnHLwhZbMiaPV2uK2lS3DRB6loGbbF8
         RThsKz01flstUUYKd/Agcbl5jsOei2E3QaMFtXkjGkGD4XdprISQZe9/lvU+QiOYOdw1
         vL1TQxmZjLzvS7LfmChVLXKuSUs3Y78nD6yz/4DSAumEbva8X5KCy2lGRtaqK2Dxmapp
         WlRRWaUAi6j3tnbUZSY+aVnt+yAyLHIjZYpGnFtg2arsB3M483+oT4JVR8KsmB01pyBT
         uvvqeXRX5jwIyEKy42p/eyBLnR6j3m1WkOCZ1+55pOb72dqUcAs9IzSRHSYMRSXD2vs9
         di+A==
X-Forwarded-Encrypted: i=1; AJvYcCWgbILyGQD7TEsW6KPecgtgunCbks9FGkHKAAvrH6vVy7Sh3xzCUSErOFozyTp430lKV8RILGe7yx9OyRw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy812xpMR+xENLXqFq3m5QpzmAxhSCSFFeEkppjgjBdKWczsvH
	Y28Lgho0mmWioSHC0GfmXStp5gUnvZAdrI9nCSiMspKhMoo6Ac2YbuKeFbohafpChe4URtj6gwU
	i2/+mBkFmgYIwwXMTGg3xvxLuJyycviqZVsqCX4TDzg5aD5CW4UMMb5LxTe7NXg==
X-Gm-Gg: ASbGncsvbAFJd0ihjOe5AHDj0GVWX92LiWvAl/mxZezHYR1rz5KlsBoAFJeje4qXS81
	Jn6547z4z0hg8Q5wIhiZ5NoqD210pHXuOsHLTp5FEcy8cVyQLo+V6prIX2DATn+ToM+yTf2y/o0
	FHUaFfgnFZldq7JFjF9lHurYT7COuOmFXfPOE41CZFj22f84h31Dwf2IpO9d6s5UmPOwvNE8fEP
	z5SDH2uzTZOR+HA3ezi6zrul1VlDJnr07S+hDDnvcVTNlfRdLPGCvh/6qFnQdIpc5snW/JmRdAk
	E4gsZWWmRxSSeqdpRXl7m9SZn5pARvKBu2bbc8wgpEVNBJgz1PcXOPkqDzcq6kgtUr1Yz7Inh+Y
	=
X-Received: by 2002:a05:600c:6819:b0:442:cab1:e092 with SMTP id 5b1f17b1804b1-442d6d1fadamr28833005e9.11.1746801209573;
        Fri, 09 May 2025 07:33:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4IBkLXeH3i+YVDUJRmaB8MUsHfZ+AUrzGIQQxg7u/gveAvDEEBf8Vr8fYNwiDc753UVZiWA==
X-Received: by 2002:a05:600c:6819:b0:442:cab1:e092 with SMTP id 5b1f17b1804b1-442d6d1fadamr28832755e9.11.1746801209169;
        Fri, 09 May 2025 07:33:29 -0700 (PDT)
Received: from rh.redhat.com (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67d5c7bsm32150775e9.4.2025.05.09.07.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 07:33:28 -0700 (PDT)
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
Subject: [PATCH 2/3] KVM: arm64: selftests: fix thread migration in arch_timer_edge_cases
Date: Fri,  9 May 2025 16:33:11 +0200
Message-ID: <20250509143312.34224-3-sebott@redhat.com>
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

