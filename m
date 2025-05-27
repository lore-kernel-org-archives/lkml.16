Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A8F2797B8
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 14:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748355891; cv=none; b=F2M0RyfPeh/QYuwxQ9FBqq6e+YFkMq+P5rfl/6emjWtCkjrKmgcm96uw3yAt+wPnRsUxJlH52YY/K9cyrYdkrD9bVu2alZmxODk5a26ni0aPgeaidcAElnqWDISnu5WapZZOGZikXo6q4SSiABwcPK4auxZIFXcWpl5B2pgS6RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748355891; c=relaxed/simple;
	bh=cOsu4Qrb+3bx73g5aMRxtPG7+Gkx5amoz9G8WVXNU9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ka2R2JhMqC2lOKJ85mUaY9gJlieHsURJp3WiRcYTs2L4Gs4mlVxvtCNn8lqelwa7kV7dfIzPk2SJagk9Wvk4ZpJ4kRQH/DbOR4oh4/UaOaqYyVXM8pypDpdZQOTe+YYt1BHKRK4Q037HBmeSPP0jrk1tRaNKKRD3A5ZtbBgN6NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WDD7bW9l; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WDD7bW9l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748355888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HiFig5XrzaKxrne/VffAS5Dccms79XHv1+bktez4Dgg=;
	b=WDD7bW9l27QRMMxEkn+2O5SeONz9lkBJzDxV6MFyhvabS/lsD0tbIBU/VAF2T2ZXbAsTVA
	6ArA1DRH8PsE2VRGobrbsy3XZFVWGYlwwrgHa9qYISNy89Q08X/I1rTEL5P/ms/nSneLEc
	6Wlclr3ttp/bWNG6LCEMktB6IerLQLE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-6HzxuXsUMJuAzH9yZl1D2w-1; Tue, 27 May 2025 10:24:47 -0400
X-MC-Unique: 6HzxuXsUMJuAzH9yZl1D2w-1
X-Mimecast-MFC-AGG-ID: 6HzxuXsUMJuAzH9yZl1D2w_1748355886
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43efa869b19so22072495e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 07:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748355886; x=1748960686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HiFig5XrzaKxrne/VffAS5Dccms79XHv1+bktez4Dgg=;
        b=fgD42zSu1nShwfpa7RkwDyFFVdk2O/KtoO2RTAur1DXH/sRV1yPk4T1zBr+fGo2rHT
         bOiQ84y8tNUrNCRa42h2xzDtASdIXfHVo10qfr9/LAhbOwdaASsH5ahYvuY5+ml5qMR0
         zie8rzIiKoBrg4quE9tJ/Ldzs9dHLA6Ca7H5BZiJJtN5e3tfTLt+5ipAjUdsAAetzbXi
         TxLN2FHhJ8Pd5ALhT1yqmooOXg75OFoPVtUpqUkqA0LPNYJU8GtzYxmQ9XUPC7wEy4ya
         q0hQZS7ancMYgLtvH04XIUVfGtZYpsoxqsdF3zeOtNb2ox4wGRj0NP8zPtQ+nMzUsLXu
         sjlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYsjiCdetHC5nWaJ9x65WLjMUQ+DgX8blwETAOiwnwDp1q5W7aQZMNvK1zPUAUpFdJ8vSjdGnbjGXjpqE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIFeT+oTWYWEeqVDwx/pHnpv9pHOis3wast6EMNqheFs4Dy380
	Phc2DUy0EnILqU8mhHHTcUXwsaDEFAzkxBf3gTRaI8qZHflBu3Khk/sSAgFzpaH/mQ0WJ+L9549
	IT9FHYKGMhdFJ9NAL6Js1+W7SpJKm9jkIcO844NEEIrARDF/e0k5vKgjKuf4Zi5BPlg==
X-Gm-Gg: ASbGnctFdn+tJsqeuTr1WQbR+nxVUELb7Uaezl4O6/GpkN+ilOtR5a/atATgAMZ6w7A
	OALyyMziCw+oiCbhNp6BoXFyclsCBL3W8NlBs4VLUcRFFoNdnx2VvjquPVmNnAcWEdzfC8XFflr
	ZYoY0Fu5BRSiEM98c3Vojr/Y4NAy+lgjFrLP6HU1s9DRgGzUGtA/SbsxUAN55+fpWtwX1sjhNFa
	Z+DULV60zrAXzoAO3ZoCe2sFF8mPTnSk+vAaKGgr7gBFsjmgtJh1kVJBg4ImJp3OAfqLdqgBz4h
	sCm1LwGjzeSWmwgYOahIHGCfRMw+JOve084e5sh/vjRf2Gxx5NVeHJ/Aj9kx1ao1+pQj5BMWew=
	=
X-Received: by 2002:a05:600c:5120:b0:43d:683:8cb2 with SMTP id 5b1f17b1804b1-44c94374ed0mr124870035e9.14.1748355886251;
        Tue, 27 May 2025 07:24:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELzaCUvaTNc9Adiu9Az9zHtuATeQC88HKSvkrZ4YDOc4EmiLqQ4b0pQxQ8ybi5Fu++RvO9Hg==
X-Received: by 2002:a05:600c:5120:b0:43d:683:8cb2 with SMTP id 5b1f17b1804b1-44c94374ed0mr124869595e9.14.1748355885791;
        Tue, 27 May 2025 07:24:45 -0700 (PDT)
Received: from rh.fritz.box (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d3edcsm278766415e9.20.2025.05.27.07.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 07:24:45 -0700 (PDT)
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
Subject: [PATCH v2 2/3] KVM: arm64: selftests: fix thread migration in arch_timer_edge_cases
Date: Tue, 27 May 2025 16:24:33 +0200
Message-ID: <20250527142434.25209-3-sebott@redhat.com>
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

