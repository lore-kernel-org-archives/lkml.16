Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80E525DB19;
	Wed,  9 Apr 2025 11:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744197246; cv=none; b=p8sxDnZSkEVCGeKZ1qn5IruOSwlYccXUPJOmSG7rkeFLtJBvLgJqsTr521KaKsxnS0t+zlOOk2rDHDfG5a4HNvKRBMW8jN+HiCo2WiNNTpjaxd7/0Cw1WeaZFe1bU/qWFCNjC69tJbW7i1xsujabEQM9uYmA+4PSegiFoVVBKOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744197246; c=relaxed/simple;
	bh=jqo5HxxGhvzTzgubMoInNzjOBMJ67bIXYB7bcU/dgHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dGusjZv7CGn/umcuvMF8JBuvkMg2DLpkKwLd+Xgx2T0mIV7uflFRU7oqrBaSr/FsLTNZ5Fj1T/btSMVzudM0Ws99dkuQkGCgk2edRAJfQOUhCXd32/INaFneSZDY8jQ5kAfRh8lLMCb6Mevpt+4m39vPVq2wC6rPDQtlhZcA8HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=M/pSLXX0; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="M/pSLXX0"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 7F3DC40E021D;
	Wed,  9 Apr 2025 11:14:00 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id h6FXT82fAaNf; Wed,  9 Apr 2025 11:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1744197235; bh=Z+kdrJw5u0x8UOKXCbftptPKteCCCY2ZN7JQDeXz64g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M/pSLXX03o7RlfCjM0a0d60z+uslg9vb2bmKjWNowzOMYOzLJK7R4FkiONPwZBKyv
	 0TK4inJABZF6pyxhwbvfLM7ppPs4ySM/vsbFnyoKrJSpgCKZt9guv7yNdYm7LNZXUH
	 TktdO4REClguIsZHEswUFuoCGAywSdsDW3OVot/HqvxPtmEf3Qad0+Yg0MgYFeTF/L
	 Fq3671G3Ab/ncJfW/l7EiB8EMlWXvRsdYsz8C2n9dKDxfB01UU3sQV+Il2ttv407iH
	 zkJ0xagCdhOkU3m+SDrDPGsE/uCrBFYGVWaIL42lSk+oj9Txgso8wO6e90V1RfISOM
	 AeR7DcdnGlJLrtYTzoRX1EkU2MURwI5i98yK1DbU27lWzTDd2E+6zMtDsE9WIHzDdi
	 RIrgtmAVHh3MMEJSbz9/ncHt0SwE0t8AS/pUTnP5OtQOQWh2kCy+ECI1Nepf1L8O/6
	 fWCRV27Iu5xdKZCfJcaz8vUmyOmESGRIFsoIIM31tQY/e2I+kAleZXHU9U2dOIhTrV
	 mtuWqkbHmMjLzpoSRoluhJuB5Nws510Ij0y3EKcmBLfKxh3IknFFv/45WqchOoX6A/
	 KvimvoI16NuUORA0upvD9qNYFX4OWqXOc2a5WWHj0CYgbavuz7vY9jEdjznBWi+h50
	 X+0hzc4+kl/ZPo11MFzpsBLA=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7366D40E01A3;
	Wed,  9 Apr 2025 11:13:47 +0000 (UTC)
Date: Wed, 9 Apr 2025 13:13:41 +0200
From: Borislav Petkov <bp@alien8.de>
To: Naveen N Rao <naveen@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>, x86@kernel.org
Subject: [PATCH 1/2] Documentation/x86: Update the naming of CPU features for
 /proc/cpuinfo
Message-ID: <20250409111341.GDZ_ZWZS4LckBcirLE@fat_crate.local>
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

From: "Naveen N Rao (AMD)" <naveen@kernel.org>
Date: Wed, 9 Apr 2025 12:42:45 +0200

Commit

  78ce84b9e0a5 ("x86/cpufeatures: Flip the /proc/cpuinfo appearance logic")

changed how CPU feature names should be specified. Update document to
reflect the same.

Signed-off-by: Naveen N Rao (AMD) <naveen@kernel.org>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
---
 Documentation/arch/x86/cpuinfo.rst | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/Documentation/arch/x86/cpuinfo.rst b/Documentation/arch/x86/cpuinfo.rst
index 6ef426a52cdc..7114f34ba3e6 100644
--- a/Documentation/arch/x86/cpuinfo.rst
+++ b/Documentation/arch/x86/cpuinfo.rst
@@ -130,14 +130,18 @@ x86_cap/bug_flags[] arrays in kernel/cpu/capflags.c. The names in the
 resulting x86_cap/bug_flags[] are used to populate /proc/cpuinfo. The naming
 of flags in the x86_cap/bug_flags[] are as follows:
 
-a: The name of the flag is from the string in X86_FEATURE_<name> by default.
-----------------------------------------------------------------------------
-By default, the flag <name> in /proc/cpuinfo is extracted from the respective
-X86_FEATURE_<name> in cpufeatures.h. For example, the flag "avx2" is from
-X86_FEATURE_AVX2.
-
-b: The naming can be overridden.
---------------------------------
+a: Flags do not appear by default in /proc/cpuinfo
+--------------------------------------------------
+
+Feature flags are omitted by default from /proc/cpuinfo as it does not make
+sense for the feature to be exposed to userspace in most cases. For example,
+X86_FEATURE_ALWAYS is defined in cpufeatures.h but that flag is an internal
+kernel feature used in the alternative runtime patching functionality. So the
+flag does not appear in /proc/cpuinfo.
+
+b: Specify a flag name if absolutely needed
+-------------------------------------------
+
 If the comment on the line for the #define X86_FEATURE_* starts with a
 double-quote character (""), the string inside the double-quote characters
 will be the name of the flags. For example, the flag "sse4_1" comes from
@@ -148,14 +152,6 @@ needed. For instance, /proc/cpuinfo is a userspace interface and must remain
 constant. If, for some reason, the naming of X86_FEATURE_<name> changes, one
 shall override the new naming with the name already used in /proc/cpuinfo.
 
-c: The naming override can be "", which means it will not appear in /proc/cpuinfo.
-----------------------------------------------------------------------------------
-The feature shall be omitted from /proc/cpuinfo if it does not make sense for
-the feature to be exposed to userspace. For example, X86_FEATURE_ALWAYS is
-defined in cpufeatures.h but that flag is an internal kernel feature used
-in the alternative runtime patching functionality. So, its name is overridden
-with "". Its flag will not appear in /proc/cpuinfo.
-
 Flags are missing when one or more of these happen
 ==================================================
 
-- 
2.43.0

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
