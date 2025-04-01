Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D98B224240
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 16:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743523949; cv=none; b=AtjJVBgaMuiFjp4LvP9SbsVD28Ls000NrktMxgYxY8U2Amas3JCXeIlFqkYdiyvkHMd5ampTB1CmaNM/OhJ5HhOtRTdLpopuLm34y+wGb6I9bm51YKoWJw/NqczS7seKp5o2qCAjy6cQqLOaojs/2VmvcjIuvuP1iB3USFUigVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743523949; c=relaxed/simple;
	bh=7h29/HU5sdApjkYIeGF2/5ZLb/HC0XBAWZ+vi6Cv12I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sTY8q0SNDWckkYqqDafREyFra/4n+mA6IR3TrDVrweb6c7igg2tsbyAnntL00LkcSUgtFn2+FBlfPl3xOnMTS7lh0Efnw4EZ04QI0yxk67SHY3+iKexAg6WXUvfRzb+Sz2wl/XqlQi+EuxxOIM8GW7gQE+BxgNb/E1eB9eJ5lK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bEoFSHjk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bEoFSHjk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743523946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Za9UhBdtRl20IVd/exE7AzVdA7LtofpEuC+6DQ+7Q1I=;
	b=bEoFSHjkUKo+Y8QWRGVzO4tCShDz4UVZXB9vk6E0bisSB4i3TtYElCMgUcOXzJ9b+OZQSV
	f41n89zrSkx/64Ltoj7Kieyo2zi2CV6ntN3EnkvEYarXJE4ou/r6vT/1X1Udd3cvEEMc/t
	XrY1YhlFXBZR3z3oLg/lydXSgGhhpB0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-h9dia9GOOZWt1kJyWt3xsA-1; Tue, 01 Apr 2025 12:12:25 -0400
X-MC-Unique: h9dia9GOOZWt1kJyWt3xsA-1
X-Mimecast-MFC-AGG-ID: h9dia9GOOZWt1kJyWt3xsA_1743523945
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43ceeaf1524so30161155e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 09:12:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743523943; x=1744128743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Za9UhBdtRl20IVd/exE7AzVdA7LtofpEuC+6DQ+7Q1I=;
        b=JO5cXAHX6ulZtWUWY8gYlUFnQciryExhXxwIgnFJy/bD94AYE1GKQPN/AhvbwOR9Y6
         c/0gTY0PGhBaCLc39frtaalm/Ml190nhlB1vl9IVDQ/a4cSCyMKF92LTe/Gt279RMAaS
         Xe8Ne6vZ33vsbUBAH9hgFG4yHRX860b4dgNQ1Vy8A4nPfST7ShrLbLGo3fXaBOHN9HO5
         Cvg9ucUMJP6qPcocKyf+mrioPk4n3wuB8TfDtTVyxiqkiO8bHCL+50ltktwddudAPdUQ
         3uVaCQgxFhaCVgyckldvMy3bMwGct1bJlBz9fU3FwfwhRWoBwKgthC/RxP77cvSzpkmz
         UOpw==
X-Gm-Message-State: AOJu0YxG1WDlBHKEWw6qLWs9X9RXCY914qzsSs9+rQyNnBDUYFUVlhSw
	DkqS5LIDRxoVgtJ9Ze6n7fzRuISxb1mymlAQzn5r7sRLnalfxCWc8QU3oC7WEmXEDyfVcWMihom
	fYTsXULIM0guNCM88jtn71+vd82LplKW3B+vTnI/JQlp74GlhAaNzw1ILWCdNlBAqwgIVny88zA
	JF3OONBoMJAJvE1Mmx9x6sfxIJjkJ258VvKaium5/QfJBSsg==
X-Gm-Gg: ASbGncvbqZ/cKm8aaJh11+htH0+ZovVvt3DuI29ywN/swt+rlpdJBFYzAMQXCcJ5ov2
	mi+6Nd5StbedK7BOYpP6+YiDv5V3hOUGDXFgCQcBdyAEsN93A5bs5tHZe1eLI1Ns+ZrzGFFSHfh
	WqmrLvizZuqKqA6ErB7HNgeOMmEh1hexutXYTycNMbyhIYr+X3Hrou0kZjb28Cqwn9Y+ALAJRHH
	j68gBmWQf53PM2ElHMY06oAigF0sbRV8wUUxdCgZLJWMlvp+f6IgfLhhPY2IbAZTvxdYqRB2UCp
	DXcF6o7Hg7cvUhnaHfEnsg==
X-Received: by 2002:a05:600c:198e:b0:43c:f3e1:a729 with SMTP id 5b1f17b1804b1-43eb05bd475mr6791875e9.12.1743523943510;
        Tue, 01 Apr 2025 09:12:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgj2ZbCQGfmVhz6lrnJ+5wyjIJ9OaWTHSb2mNQbdBcNI3fX/rNQGWp16Y3i8t/HcaXbmtslA==
X-Received: by 2002:a05:600c:198e:b0:43c:f3e1:a729 with SMTP id 5b1f17b1804b1-43eb05bd475mr6791375e9.12.1743523943004;
        Tue, 01 Apr 2025 09:12:23 -0700 (PDT)
Received: from [192.168.10.48] ([176.206.111.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b6588dbsm14265870f8f.2.2025.04.01.09.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:12:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: roy.hopkins@suse.com,
	seanjc@google.com,
	thomas.lendacky@amd.com,
	ashish.kalra@amd.com,
	michael.roth@amd.com,
	jroedel@suse.de,
	nsaenz@amazon.com,
	anelkz@amazon.de,
	James.Bottomley@HansenPartnership.com
Subject: [PATCH 27/29] selftests: kvm: introduce basic test for VM planes
Date: Tue,  1 Apr 2025 18:11:04 +0200
Message-ID: <20250401161106.790710-28-pbonzini@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401161106.790710-1-pbonzini@redhat.com>
References: <20250401161106.790710-1-pbonzini@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check a few error cases and ensure that a vCPU can have a second plane
added to it.  For now, all interactions happen through the bare
__vm_ioctl() interface or even directly through the ioctl() system
call.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tools/testing/selftests/kvm/Makefile.kvm |   1 +
 tools/testing/selftests/kvm/plane_test.c | 108 +++++++++++++++++++++++
 2 files changed, 109 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/plane_test.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index f62b0a5aba35..b1d0b410cc03 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -57,6 +57,7 @@ TEST_GEN_PROGS_COMMON += guest_print_test
 TEST_GEN_PROGS_COMMON += kvm_binary_stats_test
 TEST_GEN_PROGS_COMMON += kvm_create_max_vcpus
 TEST_GEN_PROGS_COMMON += kvm_page_table_test
+TEST_GEN_PROGS_COMMON += plane_test
 TEST_GEN_PROGS_COMMON += set_memory_region_test
 
 # Compiled test targets
diff --git a/tools/testing/selftests/kvm/plane_test.c b/tools/testing/selftests/kvm/plane_test.c
new file mode 100644
index 000000000000..43c8de13490a
--- /dev/null
+++ b/tools/testing/selftests/kvm/plane_test.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 Red Hat, Inc.
+ *
+ * Test for architecture-neutral VM plane functionality
+ */
+#include <fcntl.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+
+#include "test_util.h"
+
+#include "kvm_util.h"
+#include "asm/kvm.h"
+#include "linux/kvm.h"
+
+void test_create_plane_errors(int max_planes)
+{
+	struct kvm_vm *vm;
+	struct kvm_vcpu *vcpu;
+	int planefd, plane_vcpufd;
+
+	vm = vm_create_barebones();
+	vcpu = __vm_vcpu_add(vm, 0);
+
+	planefd = __vm_ioctl(vm, KVM_CREATE_PLANE, (void *)(unsigned long)0);
+	TEST_ASSERT(planefd == -1 && errno == EEXIST,
+		    "Creating existing plane, expecting EEXIST. ret: %d, errno: %d",
+		    planefd, errno);
+
+	planefd = __vm_ioctl(vm, KVM_CREATE_PLANE, (void *)(unsigned long)max_planes);
+	TEST_ASSERT(planefd == -1 && errno == EINVAL,
+		    "Creating plane %d, expecting EINVAL. ret: %d, errno: %d",
+		    max_planes, planefd, errno);
+
+	plane_vcpufd = __vm_ioctl(vm, KVM_CREATE_VCPU_PLANE, (void *)(unsigned long)vcpu->fd);
+	TEST_ASSERT(plane_vcpufd == -1 && errno == ENOTTY,
+		    "Creating vCPU for plane 0, expecting ENOTTY. ret: %d, errno: %d",
+		    plane_vcpufd, errno);
+
+	kvm_vm_free(vm);
+	ksft_test_result_pass("error conditions\n");
+}
+
+void test_create_plane(void)
+{
+	struct kvm_vm *vm;
+	struct kvm_vcpu *vcpu;
+	int r, planefd, plane_vcpufd;
+
+	vm = vm_create_barebones();
+	vcpu = __vm_vcpu_add(vm, 0);
+
+	planefd = __vm_ioctl(vm, KVM_CREATE_PLANE, (void *)(unsigned long)1);
+	TEST_ASSERT(planefd >= 0, "Creating new plane, got error: %d",
+		    errno);
+
+	r = ioctl(planefd, KVM_CHECK_EXTENSION, KVM_CAP_PLANES);
+	TEST_ASSERT(r == 0,
+		    "Checking KVM_CHECK_EXTENSION(KVM_CAP_PLANES). ret: %d", r);
+
+	r = ioctl(planefd, KVM_CHECK_EXTENSION, KVM_CAP_CHECK_EXTENSION_VM);
+	TEST_ASSERT(r == 1,
+		    "Checking KVM_CHECK_EXTENSION(KVM_CAP_CHECK_EXTENSION_VM). ret: %d", r);
+
+	r = __vm_ioctl(vm, KVM_CREATE_PLANE, (void *)(unsigned long)1);
+	TEST_ASSERT(r == -1 && errno == EEXIST,
+		    "Creating existing plane, expecting EEXIST. ret: %d, errno: %d",
+		    r, errno);
+
+	plane_vcpufd = ioctl(planefd, KVM_CREATE_VCPU_PLANE, (void *)(unsigned long)vcpu->fd);
+	TEST_ASSERT(plane_vcpufd >= 0, "Creating vCPU for plane 1, got error: %d", errno);
+
+	r = ioctl(planefd, KVM_CREATE_VCPU_PLANE, (void *)(unsigned long)vcpu->fd);
+	TEST_ASSERT(r == -1 && errno == EEXIST,
+		    "Creating vCPU again for plane 1. ret: %d, errno: %d",
+		    r, errno);
+
+	r = ioctl(planefd, KVM_RUN, (void *)(unsigned long)0);
+	TEST_ASSERT(r == -1 && errno == ENOTTY,
+		    "Running plane vCPU again for plane 1. ret: %d, errno: %d",
+		    r, errno);
+
+	close(plane_vcpufd);
+	close(planefd);
+
+	kvm_vm_free(vm);
+	ksft_test_result_pass("basic planefd and plane_vcpufd operation\n");
+}
+
+int main(int argc, char *argv[])
+{
+	int cap_planes = kvm_check_cap(KVM_CAP_PLANES);
+	TEST_REQUIRE(cap_planes);
+
+	ksft_print_header();
+	ksft_set_plan(2);
+
+	pr_info("# KVM_CAP_PLANES: %d\n", cap_planes);
+
+	test_create_plane_errors(cap_planes);
+
+	if (cap_planes > 1)
+		test_create_plane();
+
+	ksft_finished();
+}
-- 
2.49.0

