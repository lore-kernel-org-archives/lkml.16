Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE32C221567
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 17:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749662990; cv=none; b=GJAxXdZGOKq0l/paQXg+l67Vx5inkyWLYvb8/oxpxGbze1wSRC3KYPivFqHORp/zcaO/LQ+cC0rYTHEsdE/N2ZFXrJgLLfR5VVsXiFYirPNt1rYOMfRMtsv7nFnso66j9LN1HT09hxLC9QLnBcz07DhIHnQOk/vAaQewHb77rgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749662990; c=relaxed/simple;
	bh=dEpqGjT6bNIiZJ8h4oYLhbc+RWX85PqZvoydqyxIKHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WKz6Zf1t9STBXpKg0+1vdFLSy04s+Xxr8XR+rQOcvjRuW42rGGaNz4dPR7KPYsDFq7VqbopZuVsIeEiBLm0zA9geoIuWEzttEQCLqWwnHvmH4antEQ0fJQYczn9uYuFH1PDuQMpbV0uvJmCW+2AfS8xp+E35fbRwQumU+AvwoLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TAhW9bkK; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TAhW9bkK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749662989; x=1781198989;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dEpqGjT6bNIiZJ8h4oYLhbc+RWX85PqZvoydqyxIKHQ=;
  b=TAhW9bkKDFzsfvd4SKLDTStfWXZqYQU3hDV97QRzIewFKVFBJ5JWLKgM
   yzLSIRTWvkKXdwcexXmYMDERnIP89DDsz7bMMTWRzatXE9/Dn2mMA75Kv
   5Cb3ItJfHiPjj7YrMGQPc82aS43DEMm5d3AxoO/z6H+ZfG9pV8AbBw2zt
   Egn6XTppdAoZ6dX4uvWVqpUZoC/o0HkC/tUVxAblK1qoRpKIrLsDHsHlo
   HMTQFS04JDqJf2f9Van3ZEQNuBWcYxuQgczhZ4BchcKg4lZItuD6mygvT
   xtE2fVrgpMq3Zg3igyBDxasvt1CQPIXA49Su4slyhRi3SWPlmCD3pdF1f
   A==;
X-CSE-ConnectionGUID: TU9dA/6AQnmnfV/mUNlX9g==
X-CSE-MsgGUID: IZ2PcfnkT+iNBzFOCsxFxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="63163269"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="63163269"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 10:29:48 -0700
X-CSE-ConnectionGUID: spWk6ZywTUOIkxKul8vKtg==
X-CSE-MsgGUID: m4jrAQc6RiOPoWfRj5HZRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="152251776"
Received: from chhatrar-mobl.amr.corp.intel.com (HELO desk) ([10.125.146.46])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 10:29:48 -0700
Date: Wed, 11 Jun 2025 10:29:47 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: x86@kernel.org
Cc: David Kaplan <david.kaplan@amd.com>, linux-kernel@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Nikolay Borisov <nik.borisov@suse.com>
Subject: [PATCH v4 4/7] x86/its: Use switch/case to apply mitigation
Message-ID: <20250611-eibrs-fix-v4-4-5ff86cac6c61@linux.intel.com>
X-Mailer: b4 0.14.2
References: <20250611-eibrs-fix-v4-0-5ff86cac6c61@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611-eibrs-fix-v4-0-5ff86cac6c61@linux.intel.com>

Prepare to apply stuffing mitigation in its_apply_mitigation(). This is
currently only done via retbleed mitigation. Also using switch/case makes
it evident that mitigation mode like VMEXIT_ONLY doesn't need any special
handling.

Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>
Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
---
 arch/x86/kernel/cpu/bugs.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 20696abd1bef90aaf852fef1299b93d27c1f4da6..e861e8884d6b5e16f08d5bda0f47d5056d26c1f4 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -1468,15 +1468,21 @@ static void __init its_update_mitigation(void)
 
 static void __init its_apply_mitigation(void)
 {
+	switch (its_mitigation) {
+	case ITS_MITIGATION_OFF:
+	case ITS_MITIGATION_AUTO:
+	case ITS_MITIGATION_VMEXIT_ONLY:
 	/* its=stuff forces retbleed stuffing and is enabled there. */
-	if (its_mitigation != ITS_MITIGATION_ALIGNED_THUNKS)
-		return;
-
-	if (!boot_cpu_has(X86_FEATURE_RETPOLINE))
-		setup_force_cpu_cap(X86_FEATURE_INDIRECT_THUNK_ITS);
+	case ITS_MITIGATION_RETPOLINE_STUFF:
+		break;
+	case ITS_MITIGATION_ALIGNED_THUNKS:
+		if (!boot_cpu_has(X86_FEATURE_RETPOLINE))
+			setup_force_cpu_cap(X86_FEATURE_INDIRECT_THUNK_ITS);
 
-	setup_force_cpu_cap(X86_FEATURE_RETHUNK);
-	set_return_thunk(its_return_thunk);
+		setup_force_cpu_cap(X86_FEATURE_RETHUNK);
+		set_return_thunk(its_return_thunk);
+		break;
+	}
 }
 
 #undef pr_fmt

-- 
2.34.1


