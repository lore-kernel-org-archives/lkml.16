Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B65220689
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 18:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747680943; cv=none; b=OEqUN6mfb2fTb272T7jD890dkh0CGsnCSVl59lK/tj2gEOWRYsuqTYp24kxM6hrCDNc1yWDDQUhsneyv+K8VMfzlp8hLhau8egIS/A5c6SkDiZj+zshLouuxiKbw/Nrpk9ZRdHEodvXB6c24EVioGQ868CRqDrxg2QGiCWilVgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747680943; c=relaxed/simple;
	bh=aQcu4y4UtLWz9/5R61mPVfQF3kh3SVAwkRKMIhfaWQo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ajgsN0UofNK4SfTroCXOeLWWIJeOvMo0MfBptdKM6FWxQAlhMZhoOJfixmyFCrZ/SJds2Nc7UnFd2fD9jCjQlmMBoc1Su2nccsAAgCGL3al4sylqD9ItowJbsMik6tHJhifJkHAMdaAZEFSXa57exZ1pD3kJ6O5B+FROrsKEcZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Yj+7c6W8; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Yj+7c6W8"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-af5310c1ac1so2833036a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 11:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747680940; x=1748285740; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=epd5QhukG4RMUXX9jB19LOAHKrcbjUAqfegEAiRpQQ4=;
        b=Yj+7c6W8sPAiigXNDZ6EdH9W9/2pvWeSx9479WJiEwJH9SEHVcm5edkxOYVc7ajijT
         jAK3U/tjeLjJfslI7RRhZDTh99pFh16OJwJkaYbdED/AegdTMyN8YPXFGAV05F7KvEka
         M+JyZAKVMbS6MIw2+ioCqaIlk5mJ9C6cfXovKpYDvN/UWpDA20JirpLueLbJVdOZsDw/
         GiuVGwGriiCt2w+e3LzrAZqrm1eHIAmBtfvAlzJwTLXL0DjDZFvlH8HOStmq7BYejX9M
         XHF7H5TRG4Psig9pJ/gHRIkp1V2vN9x3UUI3t9OnI84tUQ8Om+yNNuTrAjKerHx6idbu
         K7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747680940; x=1748285740;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=epd5QhukG4RMUXX9jB19LOAHKrcbjUAqfegEAiRpQQ4=;
        b=o5I7BHFPDDIiH6KsKyQRarsMdRFv26OKukURkt0XQ7jrz7mLAW5Ma/axUzNyTvgmSH
         3ypz90jRtAQdgPNwe7zvJ+mMQWIZFsSsfUEWPzVMpnpSa1rEs/tJXBdHOPXjGrlIx632
         f9Fbg1jZWq/tHBu1e+Igf6n+PkdOgjiWNus6zTOuAVHeR2xWF6mCDed3wpmIEj+jmBwr
         EU2l/KYOf+ekAVwsveGNaz9b+MieWQ3HgG3rFVv2c5Cg/HqnSQKYPf0QMRMvtzM7LK0e
         Ph2swDoxFO/2L/7FCT82kaQAIzE4IlMMcxdYeSDJ8u7YquOIvjtDQDgAb5tO7QEGHItp
         vnOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVo4V6pgCFuwXOLCDuY4Oje5FxWe9rq1OV8PeiSLfqKLR+cqUK/SHBVOdi2H7+m3AQtC2lsrk6fLENRFjY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdiJ/lxYBi/n9dqXp4Qq8FDMfd4XmGT8YeZh4XjDG/zHGkBAct
	z4PSckd2u3UG9OnSj94NHfXrQEnvFFZFMzxWhog0T01TXKIBYXxmrbScmSXoWQh7Szc+Mzm7RzQ
	IXqONIQ==
X-Google-Smtp-Source: AGHT+IGBgkTOOJjqrOCr7f/TpoYr6FJS7i8wklMdXOmCklTJv4b98ohj2f5O8xsS1rt/iLaAKTKHNpn9mBQ=
X-Received: from pjbdy14.prod.google.com ([2002:a17:90b:6ce:b0:2fc:1356:bcc3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:33c2:b0:2fe:afa7:eaf8
 with SMTP id 98e67ed59e1d1-30e7d50b040mr21142830a91.13.1747680939950; Mon, 19
 May 2025 11:55:39 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 19 May 2025 11:55:14 -0700
In-Reply-To: <20250519185514.2678456-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250519185514.2678456-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250519185514.2678456-13-seanjc@google.com>
Subject: [PATCH v2 12/12] KVM: selftests: Add a KVM_IRQFD test to verify
 uniqueness requirements
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	K Prateek Nayak <kprateek.nayak@amd.com>, David Matlack <dmatlack@google.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"

Add a selftest to verify that eventfd+irqfd bindings are globally unique,
i.e. that KVM doesn't allow multiple irqfds to bind to a single eventfd,
even across VMs.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/Makefile.kvm |   1 +
 tools/testing/selftests/kvm/irqfd_test.c | 130 +++++++++++++++++++++++
 2 files changed, 131 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/irqfd_test.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 307ef31d3557..d118b86f6acf 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -55,6 +55,7 @@ TEST_PROGS_x86 += x86/nx_huge_pages_test.sh
 TEST_GEN_PROGS_COMMON = demand_paging_test
 TEST_GEN_PROGS_COMMON += dirty_log_test
 TEST_GEN_PROGS_COMMON += guest_print_test
+TEST_GEN_PROGS_COMMON += irqfd_test
 TEST_GEN_PROGS_COMMON += kvm_binary_stats_test
 TEST_GEN_PROGS_COMMON += kvm_create_max_vcpus
 TEST_GEN_PROGS_COMMON += kvm_page_table_test
diff --git a/tools/testing/selftests/kvm/irqfd_test.c b/tools/testing/selftests/kvm/irqfd_test.c
new file mode 100644
index 000000000000..286f2b15fde6
--- /dev/null
+++ b/tools/testing/selftests/kvm/irqfd_test.c
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <errno.h>
+#include <pthread.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <signal.h>
+#include <stdint.h>
+#include <sys/sysinfo.h>
+
+#include "kvm_util.h"
+
+static struct kvm_vm *vm1;
+static struct kvm_vm *vm2;
+static int __eventfd;
+static bool done;
+
+/*
+ * KVM de-assigns based on eventfd *and* GSI, but requires unique eventfds when
+ * assigning (the API isn't symmetrical).  Abuse the oddity and use a per-task
+ * GSI base to avoid false failures due to cross-task de-assign, i.e. so that
+ * the secondary doesn't de-assign the primary's eventfd and cause assign to
+ * unexpectedly succeed on the primary.
+ */
+#define GSI_BASE_PRIMARY	0x20
+#define GSI_BASE_SECONDARY	0x30
+
+static void juggle_eventfd_secondary(struct kvm_vm *vm, int eventfd)
+{
+	int r, i;
+
+	/*
+	 * The secondary task can encounter EBADF since the primary can close
+	 * the eventfd at any time.  And because the primary can recreate the
+	 * eventfd, at the safe fd in the file table, the secondary can also
+	 * encounter "unexpected" success, e.g. if the close+recreate happens
+	 * between the first and second assignments.  The secondary's role is
+	 * mostly to antagonize KVM, not to detect bugs.
+	 */
+	for (i = 0; i < 2; i++) {
+		r = __kvm_irqfd(vm, GSI_BASE_SECONDARY, eventfd, 0);
+		TEST_ASSERT(!r || errno == EBUSY || errno == EBADF,
+			    "Wanted success, EBUSY, or EBADF, r = %d, errno = %d",
+			    r, errno);
+
+		/* De-assign should succeed unless the eventfd was closed. */
+		r = __kvm_irqfd(vm, GSI_BASE_SECONDARY + i, eventfd, KVM_IRQFD_FLAG_DEASSIGN);
+		TEST_ASSERT(!r || errno == EBADF,
+			    "De-assign should succeed unless the fd was closed");
+	}
+}
+
+static void *secondary_irqfd_juggler(void *ign)
+{
+	while (!READ_ONCE(done)) {
+		juggle_eventfd_secondary(vm1, READ_ONCE(__eventfd));
+		juggle_eventfd_secondary(vm2, READ_ONCE(__eventfd));
+	}
+
+	return NULL;
+}
+
+static void juggle_eventfd_primary(struct kvm_vm *vm, int eventfd)
+{
+	int r1, r2;
+
+	/*
+	 * At least one of the assigns should fail.  KVM disallows assigning a
+	 * single eventfd to multiple GSIs (or VMs), so it's possible that both
+	 * assignments can fail, too.
+	 */
+	r1 = __kvm_irqfd(vm, GSI_BASE_PRIMARY, eventfd, 0);
+	TEST_ASSERT(!r1 || errno == EBUSY,
+		    "Wanted success or EBUSY, r = %d, errno = %d", r1, errno);
+
+	r2 = __kvm_irqfd(vm, GSI_BASE_PRIMARY + 1, eventfd, 0);
+	TEST_ASSERT(r1 || (r2 && errno == EBUSY),
+		    "Wanted failure (EBUSY), r1 = %d, r2 = %d, errno = %d",
+		    r1, r2, errno);
+
+	/*
+	 * De-assign should always succeed, even if the corresponding assign
+	 * failed.
+	 */
+	kvm_irqfd(vm, GSI_BASE_PRIMARY, eventfd, KVM_IRQFD_FLAG_DEASSIGN);
+	kvm_irqfd(vm, GSI_BASE_PRIMARY + 1, eventfd, KVM_IRQFD_FLAG_DEASSIGN);
+}
+
+int main(int argc, char *argv[])
+{
+	pthread_t racing_thread;
+	int r, i;
+
+	/* Create "full" VMs, as KVM_IRQFD requires an in-kernel IRQ chip. */
+	vm1 = vm_create(1);
+	vm2 = vm_create(1);
+
+	WRITE_ONCE(__eventfd, kvm_new_eventfd());
+
+	kvm_irqfd(vm1, 10, __eventfd, 0);
+
+	r = __kvm_irqfd(vm1, 11, __eventfd, 0);
+	TEST_ASSERT(r && errno == EBUSY,
+		    "Wanted EBUSY, r = %d, errno = %d", r, errno);
+
+	r = __kvm_irqfd(vm2, 12, __eventfd, 0);
+	TEST_ASSERT(r && errno == EBUSY,
+		    "Wanted EBUSY, r = %d, errno = %d", r, errno);
+
+	kvm_irqfd(vm1, 11, READ_ONCE(__eventfd), KVM_IRQFD_FLAG_DEASSIGN);
+	kvm_irqfd(vm1, 12, READ_ONCE(__eventfd), KVM_IRQFD_FLAG_DEASSIGN);
+	kvm_irqfd(vm1, 13, READ_ONCE(__eventfd), KVM_IRQFD_FLAG_DEASSIGN);
+	kvm_irqfd(vm1, 14, READ_ONCE(__eventfd), KVM_IRQFD_FLAG_DEASSIGN);
+	kvm_irqfd(vm1, 10, READ_ONCE(__eventfd), KVM_IRQFD_FLAG_DEASSIGN);
+
+	close(__eventfd);
+
+	pthread_create(&racing_thread, NULL, secondary_irqfd_juggler, vm2);
+
+	for (i = 0; i < 10000; i++) {
+		WRITE_ONCE(__eventfd, kvm_new_eventfd());
+
+		juggle_eventfd_primary(vm1, __eventfd);
+		juggle_eventfd_primary(vm2, __eventfd);
+		close(__eventfd);
+	}
+
+	WRITE_ONCE(done, true);
+	pthread_join(racing_thread, NULL);
+}
-- 
2.49.0.1101.gccaa498523-goog

