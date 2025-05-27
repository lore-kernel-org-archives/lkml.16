Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA0527A12C
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 14:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748355896; cv=none; b=Gf8Oz+79U1IA1TDgTeTsYm7UbSYTl59rbopCelAuC9XlYE4/OYcY2tOZcwZ7LT6epKBr5KEnAlMI1+gV2+vH9zHbTxg+4on6IjwUdbilOm1TW3dLcl2ZPEzV1Pjn4LTB276HSxsXZdZ0iPJUhKB4jCAZd1TkAI5zrPOwElTeYi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748355896; c=relaxed/simple;
	bh=ocRxSy5EJXKWPp1wtDInyrXbEN2m5DHwoDq0BP3WbmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LkosekmyZKjsqSvUw8brM7MdVcFTVxQ83iJTkTX+T5dz2knWvPwm5hqksND/ZfVYzkQV9CREd37R8q4WAvVLIAcSoVN9+oUx1HWvUmPYDTp1uIrGBtIBFeNPoQKhu7OOIj/5ZuTPkWV526aHiIe0a6jbb3xtjwbcC4nofknUrlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WOH5HNPh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WOH5HNPh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748355893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=unMc8iAgdhI+llHDkqJsAFL7ZbF0O8Lqzu9ojtHqeJA=;
	b=WOH5HNPhl9KDqlcP9ut1i7i7HWalafSICdN6ycYAGLIzR55AYDMkNxOeFjoAlpHooJAT6J
	jjRSVoGOtehzFS9/rFb/3d9jpY0kgCsK1jqKEl8KOyXaaaLORZo/fFkhMY15voSREqkb9o
	BHEqJ6YzJD6erD0F3tBAxTG30Kzgwgk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-aQGG60E-MBG7TTR4Tdpy5Q-1; Tue, 27 May 2025 10:24:49 -0400
X-MC-Unique: aQGG60E-MBG7TTR4Tdpy5Q-1
X-Mimecast-MFC-AGG-ID: aQGG60E-MBG7TTR4Tdpy5Q_1748355888
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4d5e1af1fso1086378f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 07:24:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748355888; x=1748960688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=unMc8iAgdhI+llHDkqJsAFL7ZbF0O8Lqzu9ojtHqeJA=;
        b=kraPR56jOW/RvBp/gIvsOriMysIMt6WUal2BWiygAtxKHvgY7gjAr//PJV+/NidTVq
         uz3grMOLgGzbNm/eqnW7PFnNAzks1WBuWqRGLZuhGPJxHPsQ0UozH2Pa4ieMGWCGNpkl
         HTpesbdxw5O3lOyMRLETKi1g7R9bkccP5hDSj5xvGH3lmDet8RzPIephi5PRE+b/Py05
         jgtRxsAXHRTfZaYzklyjiipchwnNHVP/BNs+CxYrhdrsd0zcyRIUk0OnQK9webfYYMIX
         w4SoA5Kx+ElNdsox7vkn53bCoFqskmW6BHAhTHjcX6asnD6kG+4NGiCF0oYlK3XiM9dh
         llWg==
X-Forwarded-Encrypted: i=1; AJvYcCXPPIqpowp8IPOKNG9+KKuB9VoQtjqGyng2n2MaqBncKW7VSIUsdGxoUMhtq0LiWXBE0llQmAkjn315Zjc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAMBzNGayg4T2Om1ayChRKHQWeuAM1OqDqlTTQohXYJMt2Zw4G
	c+HhHbp5v6cMjpyVqbu0HiWw7EP0+hENKtZsP0e22D6plfRP1af010fNy2AQwIT0YFhYG720Ahs
	nDea9WWw5js5wbTPoYaMeNO555mCdk2T2bFPZR520QE3uYkcyB7q57hP9j5Ahmor2eA==
X-Gm-Gg: ASbGncvOD0H/NvfniqmkOgaTHJYtvY4lEoBJa9uTPehQQ1gx91XHrsVjRrLFB2vjEgU
	r9viCBpnfVMGuS9v6dAlvTXcaoMcLxGXqlC5gU8JGjZCtBr5uGVtge6ATFbDPoox1rK9+wlQ/CE
	rKBoDye4z2kKX/0F5wojMSvai8Izu8ilB0/kz6NEvxegVXfjQn71uOdz2VPTD4DzMz2T+wqU3mt
	pKzkxH0P78EMLNqEnBMUSKWTKiGZBYnChn4VWw6L0mPB4QxtwO+JsKpydXWs78AtE/XqexSE1mq
	BOv2XoYZYEvqieHIWW6isSVSnhZktLl7VYQUNXqUG4+kLh0LkvpQe8vpZRaBvNX+EKZh2DkyrA=
	=
X-Received: by 2002:a5d:5f55:0:b0:3a4:e1ea:3b38 with SMTP id ffacd0b85a97d-3a4e5e5d241mr1030436f8f.7.1748355887864;
        Tue, 27 May 2025 07:24:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IED6cDk0pjU6x3lxG7ezTVdoW3wzIGaXlNoiosT7cd0gwNQ04WLe8XIloW7vpZA7k37aWMp8g==
X-Received: by 2002:a5d:5f55:0:b0:3a4:e1ea:3b38 with SMTP id ffacd0b85a97d-3a4e5e5d241mr1030399f8f.7.1748355887452;
        Tue, 27 May 2025 07:24:47 -0700 (PDT)
Received: from rh.fritz.box (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d3edcsm278766415e9.20.2025.05.27.07.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 07:24:47 -0700 (PDT)
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
Subject: [PATCH v2 3/3] KVM: arm64: selftests: arch_timer_edge_cases - determine effective counter width
Date: Tue, 27 May 2025 16:24:34 +0200
Message-ID: <20250527142434.25209-4-sebott@redhat.com>
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

arch_timer_edge_cases uses ~0 as the maximum counter value, however there's
no architectural guarantee that this is valid.

Figure out the effective counter width based on the effective frequency
like it's done by the kernel.

Note that the following subtest only worked since the counter initialized
with CVAL_MAX would instantly overflow (which is no longer the case):

	test_set_cnt_after_cval_no_irq(timer, 0, DEF_CNT, CVAL_MAX, sm);

To fix this we could swap CVAL_MAX for 0 here but since that is already
done by test_move_counters_behind_timers() let's remove that subtest.

This also serves as a workaround for AC03_CPU_14 that led to the
following assertion failure on ampere-one machines:

==== Test Assertion Failure ====
  arm64/arch_timer_edge_cases.c:169: timer_condition == istatus
  pid=11236 tid=11236 errno=4 - Interrupted system call
     1  0x0000000000404ce7: test_run at arch_timer_edge_cases.c:938
     2  0x0000000000401ebb: main at arch_timer_edge_cases.c:1053
     3  0x0000ffff9fa8625b: ?? ??:0
     4  0x0000ffff9fa8633b: ?? ??:0
     5  0x0000000000401fef: _start at ??:?
  0x1 != 0x0 (timer_condition != istatus)

Link: https://lore.kernel.org/kvmarm/ac1de1d2-ef2b-d439-dc48-8615e121b07b@redhat.com
Link: https://amperecomputing.com/assets/AmpereOne_Developer_ER_v0_80_20240823_28945022f4.pdf
Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
 .../kvm/arm64/arch_timer_edge_cases.c         | 27 ++++++++++++-------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
index a813b4c6c817..1e3e36d869d4 100644
--- a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
+++ b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
@@ -22,7 +22,8 @@
 #include "gic.h"
 #include "vgic.h"
 
-static const uint64_t CVAL_MAX = ~0ULL;
+/* Depends on counter width. */
+static uint64_t CVAL_MAX;
 /* tval is a signed 32-bit int. */
 static const int32_t TVAL_MAX = INT32_MAX;
 static const int32_t TVAL_MIN = INT32_MIN;
@@ -30,8 +31,8 @@ static const int32_t TVAL_MIN = INT32_MIN;
 /* After how much time we say there is no IRQ. */
 static const uint32_t TIMEOUT_NO_IRQ_US = 50000;
 
-/* A nice counter value to use as the starting one for most tests. */
-static const uint64_t DEF_CNT = (CVAL_MAX / 2);
+/* Counter value to use as the starting one for most tests. Set to CVAL_MAX/2 */
+static uint64_t DEF_CNT;
 
 /* Number of runs. */
 static const uint32_t NR_TEST_ITERS_DEF = 5;
@@ -732,12 +733,6 @@ static void test_move_counters_ahead_of_timers(enum arch_timer timer)
 		test_set_cnt_after_tval(timer, 0, tval, (uint64_t) tval + 1,
 					wm);
 	}
-
-	for (i = 0; i < ARRAY_SIZE(sleep_method); i++) {
-		sleep_method_t sm = sleep_method[i];
-
-		test_set_cnt_after_cval_no_irq(timer, 0, DEF_CNT, CVAL_MAX, sm);
-	}
 }
 
 /*
@@ -975,6 +970,8 @@ static void test_vm_create(struct kvm_vm **vm, struct kvm_vcpu **vcpu,
 	test_init_timer_irq(*vm, *vcpu);
 	vgic_v3_setup(*vm, 1, 64);
 	sync_global_to_guest(*vm, test_args);
+	sync_global_to_guest(*vm, CVAL_MAX);
+	sync_global_to_guest(*vm, DEF_CNT);
 }
 
 static void test_print_help(char *name)
@@ -1035,6 +1032,17 @@ static bool parse_args(int argc, char *argv[])
 	return false;
 }
 
+static void set_counter_defaults(void)
+{
+	const uint64_t MIN_ROLLOVER_SECS = 40ULL * 365 * 24 * 3600;
+	uint64_t freq = read_sysreg(CNTFRQ_EL0);
+	uint64_t width = ilog2(MIN_ROLLOVER_SECS * freq);
+
+	width = clamp(width, 56, 64);
+	CVAL_MAX = GENMASK_ULL(width - 1, 0);
+	DEF_CNT = CVAL_MAX / 2;
+}
+
 int main(int argc, char *argv[])
 {
 	struct kvm_vcpu *vcpu;
@@ -1047,6 +1055,7 @@ int main(int argc, char *argv[])
 		exit(KSFT_SKIP);
 
 	sched_getaffinity(0, sizeof(default_cpuset), &default_cpuset);
+	set_counter_defaults();
 
 	if (test_args.test_virtual) {
 		test_vm_create(&vm, &vcpu, VIRTUAL);
-- 
2.49.0

