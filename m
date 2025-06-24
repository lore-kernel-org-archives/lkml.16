Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F712248F64
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750752613; cv=pass; b=AfXfXBYlhvCoxYLA+OdoD1LSp2ogzI0IGoMosBVrFof5Eci2KfD5eVPwfLaI73M5v34tFeJW+9Ms1+sk/sTAl+DbbzUZ6WSTMAZCpZGnMmzPxEpvEZUCpiW9G3I9H93UjQKHelkU9Z5tf3pxjE34UPw8DeOeWMyCClWyRhjgM0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750752613; c=relaxed/simple;
	bh=QTbRXBTaq/jCZ/lInb8FzNkFUx23kzVe0jdYEFxEBio=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O32oDCPBU6xHvpiKs2ZOUmMKv9Ja9deoLd3nQd6qnhVkr4SEFiRJihRhRkBMlvt6sF8BM3cVTK/IY+3pYNutwtLM5HAWvTcawE1ZIyhchukkyvD0fX6z9RPo1elXU4ogDJyRoteFiQpgdVmR+2LQl/HC4Hsg35VDfLDaTBgJsYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty; spf=pass smtp.mailfrom=linux.beauty; dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b=F/G1w55I; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.beauty
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b="F/G1w55I"
ARC-Seal: i=1; a=rsa-sha256; t=1750752516; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BIjHfJB/0UYt/JbQELm0MK2S/9P20W1fHhYUiDjs0eHJS8oT6ZxRIFHDVWf+LtRMhB+eCHYzxJIwQG5qA/lybQZ1oPuNKvSkbr/AXNqb6OIc6kDtVfZqUByZ6jrzqNM0MRA8vUXSHfahQYjUgPJrqWVgI9oNQTM9niRxfGQAnho=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750752516; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=FKN1YEUyRRyyaJ4NQRmw+DP7WVbSHZzD+nJqHkMmIP8=; 
	b=IbTB3j+6c0D1Vx6UoEXxI7d0ywpyrl4W2U6NeMX2D8Mdif4BjC4IWDuiKJTGONOej5A3irfWEXSc6H+FI6FgLxRQOeiQgZN9aFNWPIm5kBjrZPwSobp6YvQsXKxcsEEwWhYIALQRTNTOjJ1a4aQ7jwHCZ+0zT4xW8MTNKU56sq0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750752516;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=FKN1YEUyRRyyaJ4NQRmw+DP7WVbSHZzD+nJqHkMmIP8=;
	b=F/G1w55IDpTjPMHG5VW/AxuptPKLyytCWHyBIK1N7F3j159YZNMvLcpit+6xvxgm
	KaXCaHBCo0zoe3VSsBl4O63bZOMOatAsaC/BqQDXpAAeSBYDYE8xaebnazjFHjGX7vr
	+aE84IfMyU1WxI9l/lx5jDDBcSnMVqsYxkQBHRTc=
Received: by mx.zohomail.com with SMTPS id 1750752513528856.0116755516766;
	Tue, 24 Jun 2025 01:08:33 -0700 (PDT)
From: Li Chen <me@linux.beauty>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	Brian Gerst <brgerst@gmail.com>,
	Patryk Wlazlyn <patryk.wlazlyn@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Li Chen <chenl311@chinatelecom.cn>
Subject: [PATCH 2/2] x86/smpboot: avoid SMT domain attach/destroy if SMT is not enabled
Date: Tue, 24 Jun 2025 16:08:08 +0800
Message-ID: <20250624080810.66821-3-me@linux.beauty>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250624080810.66821-1-me@linux.beauty>
References: <20250624080810.66821-1-me@linux.beauty>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Li Chen <chenl311@chinatelecom.cn>

Currently, the SMT domain is added into sched_domain_topology
by default if CONFIG_SCHED_SMT is enabled.

If cpu_attach_domain finds that the CPU SMT domain’s cpumask_weight
is just 1, it will destroy_sched_domain it.

On a large machine, such as one with 512 cores, this results in
512 redundant domain attach/destroy operations.

We can avoid these unnecessary operations by simply checking
cpu_smt_num_threads and not inserting SMT domain into x86_topology if SMT
is not enabled.

Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
---
 arch/x86/kernel/smpboot.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 7d202f9785362..9ff8b10715cc1 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -492,8 +492,24 @@ static struct sched_domain_topology_level x86_topology[] = {
 	{ NULL },
 };
 
+static void __init maybe_remove_smt_level(void)
+{
+	if (cpu_smt_num_threads <= 1) {
+		/*
+		 * SMT level is x86_topology[0].  Shift the array left by one,
+		 * keep the sentinel { NULL } at the end.
+		 */
+		memmove(&x86_topology[0], &x86_topology[1],
+			sizeof(x86_topology) - sizeof(x86_topology[0]));
+		memset(&x86_topology[ARRAY_SIZE(x86_topology) - 1], 0,
+		       sizeof(x86_topology[0]));
+	}
+}
+
 static void __init build_sched_topology(void)
 {
+	maybe_remove_smt_level();
+
 	/*
 	 * When there is NUMA topology inside the package invalidate the
 	 * PKG domain since the NUMA domains will auto-magically create the
-- 
2.49.0

