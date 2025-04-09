Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AA8244195;
	Wed,  9 Apr 2025 11:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744197293; cv=none; b=g0MY8BXfZWQKmkapCloczoFYxcHcbi172jCI32kGqxt5Kna9kMpocqgMB/u8kT2QZbIyrXUChQW6MQudIvvwyaL2PFk166p2hgUVhbnEN2VjTB4XsrW24LSvTbTRTnxb66Qi6+QbpkjBONQXcV7rtYHiL63FSHfEW2Sz5xSAtsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744197293; c=relaxed/simple;
	bh=a9lK8VdvqOtBFO3ODsNbqDc9C+7lO8OKBZUDoX95WFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TZmkLqci4J2DMDRBam7WqgeoNpIzy/sPLaAv5H+BiCc1NB8qJSP91hJjigoUpcAk13PWCO4W5NrLiIO5XG3/2LpJ8hdSF8SUNh/Cp4LHK1l9su9kQ9F8Q660ndDl+CVFnImFdzxvyflmeb7g74qF9AvcXrKaheYQzOoXYblgk0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=kJXQAzS7; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="kJXQAzS7"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id ACD5440E019F;
	Wed,  9 Apr 2025 11:14:48 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id IImL80wJA-vE; Wed,  9 Apr 2025 11:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1744197284; bh=peoSFiJkAsoO+J13UefVVumC5Q00DxuTbuSr+yd1g6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kJXQAzS7/sEtfrZLxfvEWhx+ZdfIeTthY70QQq4A1f1PkD9RBPpM/0Wn8n4NRxwrY
	 nJYphysn4I08ewXza4ksHOa6FZCocSFwNEBgIXgMvPokXJbQ1RptKBajWlD0Q/4lpC
	 xqyrdxzKe1aZySXijidyEfl9+JzU3NG8u2P9Wjfz2H29KZLBV0LJthtCDuER6c7/gG
	 SzJFoJAX9UzXyMsByVR5ybu3IKb2/eii52Tz2KCuMvmElXNbZQyToUdVhwTMBo7eIV
	 hQP8hIWz3o+Vgaidhm2BxhNx/jbYhxz+brJ80r38L75dK7DZSYNe/NSSFrkCtOP+v1
	 H0mf5rtVcw5Hak/1aaOUpY3+fKdqA9V/jgh+Ewj2Sub+kVVVKEf3Gh/aJGHZEmGCUW
	 hdanYZrS9jKXDrqdDcX599ZR3uWhgQCDO7HVhWBORTjZuPMQvr/5LeJZ9uhNTUNrpK
	 Td2YEAmxsORplD+pimE6xfqryeF4sjEoMOva0zcwf+8YInrDY2RCf61wSScVzQKb0U
	 A57EAu1NRFTjuc+73rg5O8cJ2OHzUoxyJVy6/r7phpDwG5OEeT7Y6ymPJB07AYaMLy
	 U+mh9xKugXMwtQ9qoJLckI1tf/FGBw8NpU7Qxa/VaZdXYwxJcT9sMbRDJrh3qRMchd
	 UHEKvCWE3nOOmsPotK+Z9S2s=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9113A40E01A3;
	Wed,  9 Apr 2025 11:14:36 +0000 (UTC)
Date: Wed, 9 Apr 2025 13:14:35 +0200
From: Borislav Petkov <bp@alien8.de>
To: Naveen N Rao <naveen@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>, x86@kernel.org
Subject: [PATCH 2/2] Documentation/x86: Zap the subsection letters
Message-ID: <20250409111435.GEZ_ZWmz3_lkP8S9Lb@fat_crate.local>
References: <20250403094308.2297617-1-naveen@kernel.org>
 <20250403121727.GFZ-58VzYwaTBv4rbu@fat_crate.local>
 <4uxkf5riuv66kdxa7zteubdfsjy4vac6td5z6cckilyiqjceft@zk3mzmfv3lgk>
 <20250403132121.GJZ-6LUVmn5S2BMF-A@fat_crate.local>
 <en5nisgiq2in7sjj2ysovxrqcuqh6ruhi32nsfrwamrt6odftc@jehodnirqa64>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <en5nisgiq2in7sjj2ysovxrqcuqh6ruhi32nsfrwamrt6odftc@jehodnirqa64>

From: "Borislav Petkov (AMD)" <bp@alien8.de>
Date: Wed, 9 Apr 2025 12:45:58 +0200

The subsections already have numbering - no need for the letters too.

Zap the latter.

Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
---
 Documentation/arch/x86/cpuinfo.rst | 51 +++++++++++++++++-------------
 1 file changed, 29 insertions(+), 22 deletions(-)

diff --git a/Documentation/arch/x86/cpuinfo.rst b/Documentation/arch/x86/cpuinfo.rst
index 7114f34ba3e6..f80e2a558d2a 100644
--- a/Documentation/arch/x86/cpuinfo.rst
+++ b/Documentation/arch/x86/cpuinfo.rst
@@ -79,8 +79,9 @@ feature flags.
 How are feature flags created?
 ==============================
 
-a: Feature flags can be derived from the contents of CPUID leaves.
-------------------------------------------------------------------
+Feature flags can be derived from the contents of CPUID leaves
+--------------------------------------------------------------
+
 These feature definitions are organized mirroring the layout of CPUID
 leaves and grouped in words with offsets as mapped in enum cpuid_leafs
 in cpufeatures.h (see arch/x86/include/asm/cpufeatures.h for details).
@@ -89,8 +90,9 @@ cpufeatures.h, and if it is detected at run time, the flags will be
 displayed accordingly in /proc/cpuinfo. For example, the flag "avx2"
 comes from X86_FEATURE_AVX2 in cpufeatures.h.
 
-b: Flags can be from scattered CPUID-based features.
-----------------------------------------------------
+Flags can be from scattered CPUID-based features
+------------------------------------------------
+
 Hardware features enumerated in sparsely populated CPUID leaves get
 software-defined values. Still, CPUID needs to be queried to determine
 if a given feature is present. This is done in init_scattered_cpuid_features().
@@ -104,8 +106,9 @@ has only one feature and would waste 31 bits of space in the x86_capability[]
 array. Since there is a struct cpuinfo_x86 for each possible CPU, the wasted
 memory is not trivial.
 
-c: Flags can be created synthetically under certain conditions for hardware features.
--------------------------------------------------------------------------------------
+Flags can be created synthetically under certain conditions for hardware features
+---------------------------------------------------------------------------------
+
 Examples of conditions include whether certain features are present in
 MSR_IA32_CORE_CAPS or specific CPU models are identified. If the needed
 conditions are met, the features are enabled by the set_cpu_cap or
@@ -114,8 +117,8 @@ the feature X86_FEATURE_SPLIT_LOCK_DETECT will be enabled and
 "split_lock_detect" will be displayed. The flag "ring3mwait" will be
 displayed only when running on INTEL_XEON_PHI_[KNL|KNM] processors.
 
-d: Flags can represent purely software features.
-------------------------------------------------
+Flags can represent purely software features
+--------------------------------------------
 These flags do not represent hardware features. Instead, they represent a
 software feature implemented in the kernel. For example, Kernel Page Table
 Isolation is purely software feature and its feature flag X86_FEATURE_PTI is
@@ -130,8 +133,8 @@ x86_cap/bug_flags[] arrays in kernel/cpu/capflags.c. The names in the
 resulting x86_cap/bug_flags[] are used to populate /proc/cpuinfo. The naming
 of flags in the x86_cap/bug_flags[] are as follows:
 
-a: Flags do not appear by default in /proc/cpuinfo
---------------------------------------------------
+Flags do not appear by default in /proc/cpuinfo
+-----------------------------------------------
 
 Feature flags are omitted by default from /proc/cpuinfo as it does not make
 sense for the feature to be exposed to userspace in most cases. For example,
@@ -139,8 +142,8 @@ X86_FEATURE_ALWAYS is defined in cpufeatures.h but that flag is an internal
 kernel feature used in the alternative runtime patching functionality. So the
 flag does not appear in /proc/cpuinfo.
 
-b: Specify a flag name if absolutely needed
--------------------------------------------
+Specify a flag name if absolutely needed
+----------------------------------------
 
 If the comment on the line for the #define X86_FEATURE_* starts with a
 double-quote character (""), the string inside the double-quote characters
@@ -155,25 +158,28 @@ shall override the new naming with the name already used in /proc/cpuinfo.
 Flags are missing when one or more of these happen
 ==================================================
 
-a: The hardware does not enumerate support for it.
---------------------------------------------------
+The hardware does not enumerate support for it
+----------------------------------------------
+
 For example, when a new kernel is running on old hardware or the feature is
 not enabled by boot firmware. Even if the hardware is new, there might be a
 problem enabling the feature at run time, the flag will not be displayed.
 
-b: The kernel does not know about the flag.
--------------------------------------------
+The kernel does not know about the flag
+---------------------------------------
+
 For example, when an old kernel is running on new hardware.
 
-c: The kernel disabled support for it at compile-time.
-------------------------------------------------------
+The kernel disabled support for it at compile-time
+--------------------------------------------------
+
 For example, if 5-level-paging is not enabled when building (i.e.,
 CONFIG_X86_5LEVEL is not selected) the flag "la57" will not show up [#f1]_.
 Even though the feature will still be detected via CPUID, the kernel disables
 it by clearing via setup_clear_cpu_cap(X86_FEATURE_LA57).
 
-d: The feature is disabled at boot-time.
-----------------------------------------
+The feature is disabled at boot-time
+------------------------------------
 A feature can be disabled either using a command-line parameter or because
 it failed to be enabled. The command-line parameter clearcpuid= can be used
 to disable features using the feature number as defined in
@@ -186,8 +192,9 @@ disable specific features. The list of parameters includes, but is not limited
 to, nofsgsbase, nosgx, noxsave, etc. 5-level paging can also be disabled using
 "no5lvl".
 
-e: The feature was known to be non-functional.
-----------------------------------------------
+The feature was known to be non-functional
+------------------------------------------
+
 The feature was known to be non-functional because a dependency was
 missing at runtime. For example, AVX flags will not show up if XSAVE feature
 is disabled since they depend on XSAVE feature. Another example would be broken
-- 
2.43.0


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
