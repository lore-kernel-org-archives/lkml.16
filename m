Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5141C8639
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743516816; cv=none; b=rKZCxoRY6iKBgYsMJJryw1GbXqhddycoo2MX4LXh3rCgU5Rx17MvQbN7n3JTg15Bf/gjf+LXOdragLxb7/nnVMRaWmNoGw29/OGi369VSNoftHiRoQkfxEmM3EgoyK4LTukQXx69NlCAgJdCQBFC+inX8+zf8ue3HWx/LUP+WP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743516816; c=relaxed/simple;
	bh=60vth6cJit52DiML66Gu7ir02coWDnGZZIZt/BMDB6E=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=G07u3PVL9OCr/+IkXmnSAU9pltHfJS9VEpnqcjdWvpkU7MLwJZUsVOXtnmyuwFw8R8NrMRqxsNPv6FgXItWeelbFSVuhrkcqsfc3rOjqSu3VboOsFX774u7kNrIchH20fR0RmQogbRSPepSq2/PxT2srIMBY6IKyiX6H/jBSa0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RVDMfpn6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RVDMfpn6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743516813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3FUwbXFE5tYMNuex9XNn7jA/FNHhE1HOAMFzcppmAaw=;
	b=RVDMfpn61AqRSgwOmpMe6a6lwKeR8TxyAJqKTD281+Qf4evAg0hULl6Kl4fz8g8QO4AVA4
	SHHXlH4R7okUB1ANicx1MJrDvtm9JAsWUx0aglm0PFK/Tl0ohPIHyJEkov8BTsQNdPM+Q6
	e8p9IxF4NMpQDGuLUEFFYvWhKqi6Y+8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-emkxFikTMBigGoKuJTFoug-1; Tue, 01 Apr 2025 10:13:31 -0400
X-MC-Unique: emkxFikTMBigGoKuJTFoug-1
X-Mimecast-MFC-AGG-ID: emkxFikTMBigGoKuJTFoug_1743516811
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43941ad86d4so29193475e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 07:13:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743516810; x=1744121610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3FUwbXFE5tYMNuex9XNn7jA/FNHhE1HOAMFzcppmAaw=;
        b=HvziDOfleB41eoMUiK0w9LiGDbyePE6FAI+YSgif3WlEG8uRs8aytCOsqkXRkzlKDj
         vqSpJTtHVdMP4vNS1JnWw2cyWJiS6Gm9K6wj9xEopob4n5cLVUQ8TUSCsPmNuUK6BPvC
         Dxni+y1Dh+GBmOJ/o6UMZTaD/f0i7NJ4LCAWMPutJM9d1Gx2xJaUKykEZRRRGA7ktONG
         QvNp0bAjz0MmfZXqDX7CbqJNiNY3l6wfpgbhB35Bf3ktyyHaSUwvasmGtCqCrlSs2M5k
         gtyK5iaX/S/EyLeh5wSS57mlJygWaL2euoKUltNHOAmsUYmUevwOBVdZcFVNvYvbKMAt
         zo6g==
X-Gm-Message-State: AOJu0YyETJLYUBC6DGnMQugZShPvNF5IhxDQApWohkNSv5PvRKqtbuUn
	9VVoRC3vMnlvShQ7+9CKNQPTu4c/U7wotgrrO64/k9w/2m5ArenDeHHPyQuL5sw1VgymQWuw7Pw
	O4y8q75FXUzbhW6kO3J+X8xfl5D+xgGUJEEJxxoqEKSWFl/BYf2zU3j0d+dJhIzHvTazwgoVD8g
	ZTcJ/k/A1JADwGzizK58Bv69s0XP+RzG+4o6YwurBQwbnrIg==
X-Gm-Gg: ASbGnctH5AjtwuvTShlk39bOrR3AT8z2lxIkbzVPyjbgbWq1h9iDqvW0kK4CmHVtxRw
	astzamJSGkrLAVgrhMmbNODscoa0FRUCQ17uKKGWFOkXds3DoAWDM6wIWUaaeIZn2C1QeDqwWyB
	bTUOhd8bJ0W6m9zmTYNUpmyhLFuoDBi3DyMr62YPk88i5CoOmb0ptsVB1BFkcJP/zGcjJQcPKux
	u/uKWXkO5Qmklismf/nM0ZZDKhqf6+apqr5orb5Ncl1L5tdywIDisGjHvKCdBKiaycGj0xeFtto
	UnqXpmDEFey/Nq9GWObv1Q==
X-Received: by 2002:a05:600c:6748:b0:43c:eea9:f438 with SMTP id 5b1f17b1804b1-43db6247dd7mr144936215e9.15.1743516809931;
        Tue, 01 Apr 2025 07:13:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoO04bc+b5OyMs9RLOm34hPnaog2+aZZ3sv8mZSge41zqvdoDw62pEMiPrGIM5btfjBDByvA==
X-Received: by 2002:a05:600c:6748:b0:43c:eea9:f438 with SMTP id 5b1f17b1804b1-43db6247dd7mr144935685e9.15.1743516809494;
        Tue, 01 Apr 2025 07:13:29 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.111.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8f404ac3sm164856265e9.0.2025.04.01.07.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 07:13:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Subject: [PATCH] selftests: kvm: list once tests that are valid on all architectures
Date: Tue,  1 Apr 2025 16:13:27 +0200
Message-ID: <20250401141327.785520-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several tests cover infrastructure from virt/kvm/ and userspace APIs that have
only minimal requirements from architecture-specific code.  As such, they are
available on all architectures that have libkvm support, and this presumably
will apply also in the future (for example if loongarch gets selftests support).
Put them in a separate variable and list them only once.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tools/testing/selftests/kvm/Makefile.kvm | 45 ++++++++----------------
 1 file changed, 15 insertions(+), 30 deletions(-)

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index f773f8f99249..f62b0a5aba35 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -50,8 +50,18 @@ LIBKVM_riscv += lib/riscv/ucall.c
 # Non-compiled test targets
 TEST_PROGS_x86 += x86/nx_huge_pages_test.sh
 
+# Compiled test targets valid on all architectures with libkvm support
+TEST_GEN_PROGS_COMMON = demand_paging_test
+TEST_GEN_PROGS_COMMON += dirty_log_test
+TEST_GEN_PROGS_COMMON += guest_print_test
+TEST_GEN_PROGS_COMMON += kvm_binary_stats_test
+TEST_GEN_PROGS_COMMON += kvm_create_max_vcpus
+TEST_GEN_PROGS_COMMON += kvm_page_table_test
+TEST_GEN_PROGS_COMMON += set_memory_region_test
+
 # Compiled test targets
-TEST_GEN_PROGS_x86 = x86/cpuid_test
+TEST_GEN_PROGS_x86 = $(TEST_GEN_PROGS_COMMON)
+TEST_GEN_PROGS_x86 += x86/cpuid_test
 TEST_GEN_PROGS_x86 += x86/cr4_cpuid_sync_test
 TEST_GEN_PROGS_x86 += x86/dirty_log_page_splitting_test
 TEST_GEN_PROGS_x86 += x86/feature_msrs_test
@@ -119,27 +129,21 @@ TEST_GEN_PROGS_x86 += x86/triple_fault_event_test
 TEST_GEN_PROGS_x86 += x86/recalc_apic_map_test
 TEST_GEN_PROGS_x86 += access_tracking_perf_test
 TEST_GEN_PROGS_x86 += coalesced_io_test
-TEST_GEN_PROGS_x86 += demand_paging_test
-TEST_GEN_PROGS_x86 += dirty_log_test
 TEST_GEN_PROGS_x86 += dirty_log_perf_test
 TEST_GEN_PROGS_x86 += guest_memfd_test
-TEST_GEN_PROGS_x86 += guest_print_test
 TEST_GEN_PROGS_x86 += hardware_disable_test
-TEST_GEN_PROGS_x86 += kvm_create_max_vcpus
-TEST_GEN_PROGS_x86 += kvm_page_table_test
 TEST_GEN_PROGS_x86 += memslot_modification_stress_test
 TEST_GEN_PROGS_x86 += memslot_perf_test
 TEST_GEN_PROGS_x86 += mmu_stress_test
 TEST_GEN_PROGS_x86 += rseq_test
-TEST_GEN_PROGS_x86 += set_memory_region_test
 TEST_GEN_PROGS_x86 += steal_time
-TEST_GEN_PROGS_x86 += kvm_binary_stats_test
 TEST_GEN_PROGS_x86 += system_counter_offset_test
 TEST_GEN_PROGS_x86 += pre_fault_memory_test
 
 # Compiled outputs used by test targets
 TEST_GEN_PROGS_EXTENDED_x86 += x86/nx_huge_pages_test
 
+TEST_GEN_PROGS_arm64 = $(TEST_GEN_PROGS_COMMON)
 TEST_GEN_PROGS_arm64 += arm64/aarch32_id_regs
 TEST_GEN_PROGS_arm64 += arm64/arch_timer_edge_cases
 TEST_GEN_PROGS_arm64 += arm64/debug-exceptions
@@ -158,22 +162,16 @@ TEST_GEN_PROGS_arm64 += arm64/no-vgic-v3
 TEST_GEN_PROGS_arm64 += access_tracking_perf_test
 TEST_GEN_PROGS_arm64 += arch_timer
 TEST_GEN_PROGS_arm64 += coalesced_io_test
-TEST_GEN_PROGS_arm64 += demand_paging_test
-TEST_GEN_PROGS_arm64 += dirty_log_test
 TEST_GEN_PROGS_arm64 += dirty_log_perf_test
-TEST_GEN_PROGS_arm64 += guest_print_test
 TEST_GEN_PROGS_arm64 += get-reg-list
-TEST_GEN_PROGS_arm64 += kvm_create_max_vcpus
-TEST_GEN_PROGS_arm64 += kvm_page_table_test
 TEST_GEN_PROGS_arm64 += memslot_modification_stress_test
 TEST_GEN_PROGS_arm64 += memslot_perf_test
 TEST_GEN_PROGS_arm64 += mmu_stress_test
 TEST_GEN_PROGS_arm64 += rseq_test
-TEST_GEN_PROGS_arm64 += set_memory_region_test
 TEST_GEN_PROGS_arm64 += steal_time
-TEST_GEN_PROGS_arm64 += kvm_binary_stats_test
 
-TEST_GEN_PROGS_s390 = s390/memop
+TEST_GEN_PROGS_s390 = $(TEST_GEN_PROGS_COMMON)
+TEST_GEN_PROGS_s390 += s390/memop
 TEST_GEN_PROGS_s390 += s390/resets
 TEST_GEN_PROGS_s390 += s390/sync_regs_test
 TEST_GEN_PROGS_s390 += s390/tprot
@@ -182,27 +180,14 @@ TEST_GEN_PROGS_s390 += s390/debug_test
 TEST_GEN_PROGS_s390 += s390/cpumodel_subfuncs_test
 TEST_GEN_PROGS_s390 += s390/shared_zeropage_test
 TEST_GEN_PROGS_s390 += s390/ucontrol_test
-TEST_GEN_PROGS_s390 += demand_paging_test
-TEST_GEN_PROGS_s390 += dirty_log_test
-TEST_GEN_PROGS_s390 += guest_print_test
-TEST_GEN_PROGS_s390 += kvm_create_max_vcpus
-TEST_GEN_PROGS_s390 += kvm_page_table_test
 TEST_GEN_PROGS_s390 += rseq_test
-TEST_GEN_PROGS_s390 += set_memory_region_test
-TEST_GEN_PROGS_s390 += kvm_binary_stats_test
 
+TEST_GEN_PROGS_riscv = $(TEST_GEN_PROGS_COMMON)
 TEST_GEN_PROGS_riscv += riscv/sbi_pmu_test
 TEST_GEN_PROGS_riscv += riscv/ebreak_test
 TEST_GEN_PROGS_riscv += arch_timer
 TEST_GEN_PROGS_riscv += coalesced_io_test
-TEST_GEN_PROGS_riscv += demand_paging_test
-TEST_GEN_PROGS_riscv += dirty_log_test
 TEST_GEN_PROGS_riscv += get-reg-list
-TEST_GEN_PROGS_riscv += guest_print_test
-TEST_GEN_PROGS_riscv += kvm_binary_stats_test
-TEST_GEN_PROGS_riscv += kvm_create_max_vcpus
-TEST_GEN_PROGS_riscv += kvm_page_table_test
-TEST_GEN_PROGS_riscv += set_memory_region_test
 TEST_GEN_PROGS_riscv += steal_time
 
 SPLIT_TESTS += arch_timer
-- 
2.49.0

