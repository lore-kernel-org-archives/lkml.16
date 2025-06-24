Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B7426B740
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750755467; cv=pass; b=pORu10HDL8/3e/473PIvnw+OxeMjinYRBSMSoGJTkEimh+JEaCek80gCQBPI4tAXHsKFC5VU4mvlucteqzWlTc0SRwlYZga3jnuVgq5QovSwmfhBK6e8q3tOyBCBKhUa4FKBHf2671wwT00Rx+CCFfI3btpB9BFA+UU+8Vc1B30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750755467; c=relaxed/simple;
	bh=WG6QRLwlhkg4j4A1iyIzFmnd4twT9QfhvaT0vxJaEHw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kuIyWbY131PC9Bl6zrmsNmTBo6r2v/WaSGdHZBx8gWuxSxQnG8DpoTQdxWSVN6kZ/bKIGhNJ9v/kU6JYA6detrGGSAyVhzifoFOCjtXgoQIXxoWZ5Cv9EApvhEjYy4b5+/4gMbrG8awHrMUc5RQ0s/2fH4mbTk2hyXIUrXvRdhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty; spf=pass smtp.mailfrom=linux.beauty; dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b=MF9B5pR5; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.beauty
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b="MF9B5pR5"
ARC-Seal: i=1; a=rsa-sha256; t=1750755377; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PQKEJCWJG+0HrRclZYvDwE5WQVOIkp2oO4AfKykbpPUHXerDJSXjtF4g+545FCxbCrYdsa5qoDIhmxDJbfnZW0JBd8Fpoyt+lhzf2gInMzNN0DbnONQFdYIpHi8YhNPr9ywl6tcs1rsi789Ig74BYdbc0xfLMRs4m5r7UnYi9e8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750755377; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=0dsn2ucVT8C5oLjA0ZF1ibISznlHMPT5N6s+8AW9Sz4=; 
	b=f/smIfyv5B9SZom+STssoyIO9ZqkhVas0YqjAiMvgYcfNRKZ//oVQCkuPnl4mVUA05d66Au9PwkVVjDkmkvbSeP7N842xJMGSd9SpwMkKc1V2wkiWgSh2Tz8T4m3JqyfL5SXGvSmav2KZp/sfeVcb6uxJvY6/kL+43n99ng5Jvo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750755377;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=0dsn2ucVT8C5oLjA0ZF1ibISznlHMPT5N6s+8AW9Sz4=;
	b=MF9B5pR5YkOVeSxrjD6+vW7fQJa8RQEPJ7kHblPbJCNS0Sph4P8bNVE4DRxk+NWA
	2f+5oXT1MfuLTBeBbb8gT3MmHe7YTB3fGOyRGa4Au32Bmdw/x727FVQxl5nZEfStJfT
	YOnfKuN/8WckiNJ6fCIGcXsJGnVYNO5O1DBc3ISQ=
Received: by mx.zohomail.com with SMTPS id 1750755374157259.65646699168974;
	Tue, 24 Jun 2025 01:56:14 -0700 (PDT)
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
	Li Chen <chenl311@chinatelecom.cn>
Subject: [PATCH V2 2/2] x86/smpboot: avoid SMT domain attach/destroy if SMT is not enabled
Date: Tue, 24 Jun 2025 16:55:57 +0800
Message-ID: <20250624085559.69436-3-me@linux.beauty>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250624085559.69436-1-me@linux.beauty>
References: <20250624085559.69436-1-me@linux.beauty>
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
is just 1, it will destroy it.

On a large machine, such as one with 512 cores, this results in
512 redundant domain attach/destroy operations.

Avoid these unnecessary operations by simply checking
cpu_smt_num_threads and not inserting SMT domain into x86_topology if
the SMT domain is not enabled.

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

