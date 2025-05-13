Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC3920FABC
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 11:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747137566; cv=none; b=jNaNZwyZ9iwpdwRoeYXPma1/koTCVTjGAWjpSvfGZxjEPt0JdSfSE3fJ3XywuHmUjVNMdo22ef4h7fF0ElS/UGM4tNGMlHdqKAZ6SWCcQVU8B2YKHr+ErW/n5RmaOTsLRRahwvuCLv7540u1JMV/Wma3hv9I5Sz7pBkPIJa1iI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747137566; c=relaxed/simple;
	bh=bNSaCglnd4X2ssNmU/HaxigKBDQNwZLnBxOwgL0sDL0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C7VV6FbtjvrqLgAib7HQ6MoLPC7vJy5X4jz6+DnIiV6VpUD6p5YvZ2zu+uMDrmSDSWnCYZGU4vbm+tTCosXR4QOMoLwQWumTLzUL7zMfjpgAh1vmYUZxSteYYbIxqv692MCWOyvY5prGopqWqbhRXv7NcjHlRVsgXpcmOBs3+gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WuPnQoH3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WuPnQoH3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747137562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zU2PQq21PEnWsoVgVp+BUqHaY/oV4JipjjIe8LD2CsU=;
	b=WuPnQoH3uyyOiMmqJk8sIzeWqLOzJZSR/ye2gp4YmCFgBgcivJCBqb7e4HYWLUlj64WIav
	vT3tUL1KUqFLp5sfjMwgcs/SPJmwDYC9ZYDWKyBlr7rlD7TIuDHRAeXpHZB/UGghmD/l/6
	0HqQrue5gy9oR0GvuOwE34nVdSw2hYA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-oDrnVCRLOKmp_Iioq_m4oQ-1; Tue, 13 May 2025 07:59:20 -0400
X-MC-Unique: oDrnVCRLOKmp_Iioq_m4oQ-1
X-Mimecast-MFC-AGG-ID: oDrnVCRLOKmp_Iioq_m4oQ_1747137560
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a206f05150so1465359f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 04:59:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747137559; x=1747742359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zU2PQq21PEnWsoVgVp+BUqHaY/oV4JipjjIe8LD2CsU=;
        b=O/1TnkJce/EVB6SNzMXkUyLS5+08hj2kFIDyeFWI/5dLpdNxE0fjTEkgH8HGNkQxdr
         eQxUUzi2RR0jxQEb67CYjtaTO4T/wQa/Ue7n0T37/mn0ytedEGwniD9MNvMKjJQ0z/Bg
         okO1doDvI8b0+AkrcHJ+VeVeaLicq6jebiwdsOYq1Fc4FEZQKXbJ7BxCL7RKmPotG/zV
         dfKh1z9jnk9oQLk4mMlpt/lnMavq2ST6K+pph+NPnXZC5tIT2IcqUp1lSsJ6RoqijBt0
         7jfj3zg63SH36wFXR5JWOqfpL+x5JeVCRaVhhRIDRbbahcdvk/6Qmllpm7hYOZt/yjz1
         aDkg==
X-Forwarded-Encrypted: i=1; AJvYcCW1iROMTs4K7qsvPndeOpmdelrg02K6amXH/cxjnpqC8jIJ/VlFSigtt5pKs0QO+SsxaO1meKAnZ+ywPVg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjMxDiFDZP08UkuQirHfwJQNG2mMFvLHSw7QbAFRL5eJQEOw0E
	QpOrkLzOmpqE2VCnO4ox4XTQHcbsIaWgmxu05vnH7kV3suL0Fbv60jCdux4wOQjjriGi0wV+H4f
	XW1hUDKxE2lEoFRF52CwQfkefnzYDC/cRrPlCYCPhpSzwlMODR07m2VKOb/LInw==
X-Gm-Gg: ASbGncvieyfUaOrJXS++RVWx2hRdoroqwNoTVp/9MCou7x+K6joH14/KTh61OI/vJbv
	hhLevrLqwXCQ9S/Upz+cgfWiBFJ5LEy1vsdFqAA+G4bdA1gLtUE+4dxCX/qvJu8oGVf3Xp7SpsQ
	0Am3nOVNQWZ/NjxDuMfohxv1HLtMiZGF5FK3tJqnTbNVoZg2YWhZgSTiNpWAdIWHzgfu1VZpBZ8
	J6K9mZ8SJV60/FyFZ+GmGXJVDrJbm8hPzWLoDcFud1O1NVOFTn1/qflgTMYVNPGqmO5OknN3UlT
	DRiU02bGKk0zNyxdTaRlyuGIsAIcnXIkKeE/gQw0Wz9hV9uan2t5sJiQDw==
X-Received: by 2002:a05:6000:2903:b0:399:6dc0:f134 with SMTP id ffacd0b85a97d-3a1f64c0c3emr14151669f8f.51.1747137559436;
        Tue, 13 May 2025 04:59:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGD+VRmAl8xhvctpk0KACAJv4fTi55qR6cu5mt+DKoLssil6IujR93myWjsN2VdSH8QlVVGAQ==
X-Received: by 2002:a05:6000:2903:b0:399:6dc0:f134 with SMTP id ffacd0b85a97d-3a1f64c0c3emr14151634f8f.51.1747137558886;
        Tue, 13 May 2025 04:59:18 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecccbsm16069904f8f.32.2025.05.13.04.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 04:59:18 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-spdx@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] LICENSES: add CC0-1.0 license text
Date: Tue, 13 May 2025 13:59:12 +0200
Message-ID: <20250513115912.303082-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit cbbd847d107f ("tools/x86/kcpuid: Introduce a complete cpuid
bitfields CSV file") turns the tools/arch/x86/kcpuid/cpuid.csv to be an
auto-generated file from an input file maintained at x86-cpuid.org project.
The x86-cpuid.org project clearly states that the auto-generated file is to
be licensed with CC0-1.0 (see Link below). So, the SPDX-License-Identifier
CC0-1.0 in the file is correct as intended.

The spdxcheck.py script reports that tools/arch/x86/kcpuid/cpuid.csv uses
an Invalid License ID: CC0-1.0, though, as the LICENSES directory in the
kernel tree does not contain a file with license information for CC0-1.0.

Add a suitable CC0-1.0 file with the license text into LICENSES/deprecated
to make spdxcheck.py happy.

The directory deprecated is the best fit, by exclusion of the
alternatives. CC0-1.0 should not be considered among the preferred licenses
in the kernel, nor is it a license exception case or intended for
dual-licensing some copyrighted material. So, deprecated is the best fit
here, even if the license and its use is fine and it does not suggest to
actually deprecate use of this license.

The license text for the CC0-1.0 file was obtained from the spdx
license-list-data git repository (see Link below).

Link: https://gitlab.com/x86-cpuid.org/x86-cpuid-db/-/blob/v2.4/LICENSE.rst
Link: https://github.com/spdx/license-list-data/blob/main/text/CC0-1.0.txt

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 LICENSES/deprecated/CC0-1.0 | 129 ++++++++++++++++++++++++++++++++++++
 1 file changed, 129 insertions(+)
 create mode 100644 LICENSES/deprecated/CC0-1.0

diff --git a/LICENSES/deprecated/CC0-1.0 b/LICENSES/deprecated/CC0-1.0
new file mode 100644
index 000000000000..d6054d574d50
--- /dev/null
+++ b/LICENSES/deprecated/CC0-1.0
@@ -0,0 +1,129 @@
+Valid-License-Identifier: CC0-1.0
+SPDX-URL: https://spdx.org/licenses/CC0-1.0.html
+Usage-Guide:
+  To use the Creative Commons Zero v1.0 Universal License put the
+  following SPDX tag/value pair into a comment according to the
+  placement guidelines in the licensing rules documentation:
+    SPDX-License-Identifier: CC0-1.0
+License-Text:
+Creative Commons Legal Code
+
+CC0 1.0 Universal
+
+    CREATIVE COMMONS CORPORATION IS NOT A LAW FIRM AND DOES NOT PROVIDE
+    LEGAL SERVICES. DISTRIBUTION OF THIS DOCUMENT DOES NOT CREATE AN
+    ATTORNEY-CLIENT RELATIONSHIP. CREATIVE COMMONS PROVIDES THIS
+    INFORMATION ON AN "AS-IS" BASIS. CREATIVE COMMONS MAKES NO WARRANTIES
+    REGARDING THE USE OF THIS DOCUMENT OR THE INFORMATION OR WORKS
+    PROVIDED HEREUNDER, AND DISCLAIMS LIABILITY FOR DAMAGES RESULTING FROM
+    THE USE OF THIS DOCUMENT OR THE INFORMATION OR WORKS PROVIDED
+    HEREUNDER.
+
+Statement of Purpose
+
+The laws of most jurisdictions throughout the world automatically confer
+exclusive Copyright and Related Rights (defined below) upon the creator
+and subsequent owner(s) (each and all, an "owner") of an original work of
+authorship and/or a database (each, a "Work").
+
+Certain owners wish to permanently relinquish those rights to a Work for
+the purpose of contributing to a commons of creative, cultural and
+scientific works ("Commons") that the public can reliably and without fear
+of later claims of infringement build upon, modify, incorporate in other
+works, reuse and redistribute as freely as possible in any form whatsoever
+and for any purposes, including without limitation commercial purposes.
+These owners may contribute to the Commons to promote the ideal of a free
+culture and the further production of creative, cultural and scientific
+works, or to gain reputation or greater distribution for their Work in
+part through the use and efforts of others.
+
+For these and/or other purposes and motivations, and without any
+expectation of additional consideration or compensation, the person
+associating CC0 with a Work (the "Affirmer"), to the extent that he or she
+is an owner of Copyright and Related Rights in the Work, voluntarily
+elects to apply CC0 to the Work and publicly distribute the Work under its
+terms, with knowledge of his or her Copyright and Related Rights in the
+Work and the meaning and intended legal effect of CC0 on those rights.
+
+1. Copyright and Related Rights. A Work made available under CC0 may be
+protected by copyright and related or neighboring rights ("Copyright and
+Related Rights"). Copyright and Related Rights include, but are not
+limited to, the following:
+
+  i. the right to reproduce, adapt, distribute, perform, display,
+     communicate, and translate a Work;
+ ii. moral rights retained by the original author(s) and/or performer(s);
+iii. publicity and privacy rights pertaining to a person's image or
+     likeness depicted in a Work;
+ iv. rights protecting against unfair competition in regards to a Work,
+     subject to the limitations in paragraph 4(a), below;
+  v. rights protecting the extraction, dissemination, use and reuse of data
+     in a Work;
+ vi. database rights (such as those arising under Directive 96/9/EC of the
+     European Parliament and of the Council of 11 March 1996 on the legal
+     protection of databases, and under any national implementation
+     thereof, including any amended or successor version of such
+     directive); and
+vii. other similar, equivalent or corresponding rights throughout the
+     world based on applicable law or treaty, and any national
+     implementations thereof.
+
+2. Waiver. To the greatest extent permitted by, but not in contravention
+of, applicable law, Affirmer hereby overtly, fully, permanently,
+irrevocably and unconditionally waives, abandons, and surrenders all of
+Affirmer's Copyright and Related Rights and associated claims and causes
+of action, whether now known or unknown (including existing as well as
+future claims and causes of action), in the Work (i) in all territories
+worldwide, (ii) for the maximum duration provided by applicable law or
+treaty (including future time extensions), (iii) in any current or future
+medium and for any number of copies, and (iv) for any purpose whatsoever,
+including without limitation commercial, advertising or promotional
+purposes (the "Waiver"). Affirmer makes the Waiver for the benefit of each
+member of the public at large and to the detriment of Affirmer's heirs and
+successors, fully intending that such Waiver shall not be subject to
+revocation, rescission, cancellation, termination, or any other legal or
+equitable action to disrupt the quiet enjoyment of the Work by the public
+as contemplated by Affirmer's express Statement of Purpose.
+
+3. Public License Fallback. Should any part of the Waiver for any reason
+be judged legally invalid or ineffective under applicable law, then the
+Waiver shall be preserved to the maximum extent permitted taking into
+account Affirmer's express Statement of Purpose. In addition, to the
+extent the Waiver is so judged Affirmer hereby grants to each affected
+person a royalty-free, non transferable, non sublicensable, non exclusive,
+irrevocable and unconditional license to exercise Affirmer's Copyright and
+Related Rights in the Work (i) in all territories worldwide, (ii) for the
+maximum duration provided by applicable law or treaty (including future
+time extensions), (iii) in any current or future medium and for any number
+of copies, and (iv) for any purpose whatsoever, including without
+limitation commercial, advertising or promotional purposes (the
+"License"). The License shall be deemed effective as of the date CC0 was
+applied by Affirmer to the Work. Should any part of the License for any
+reason be judged legally invalid or ineffective under applicable law, such
+partial invalidity or ineffectiveness shall not invalidate the remainder
+of the License, and in such case Affirmer hereby affirms that he or she
+will not (i) exercise any of his or her remaining Copyright and Related
+Rights in the Work or (ii) assert any associated claims and causes of
+action with respect to the Work, in either case contrary to Affirmer's
+express Statement of Purpose.
+
+4. Limitations and Disclaimers.
+
+ a. No trademark or patent rights held by Affirmer are waived, abandoned,
+    surrendered, licensed or otherwise affected by this document.
+ b. Affirmer offers the Work as-is and makes no representations or
+    warranties of any kind concerning the Work, express, implied,
+    statutory or otherwise, including without limitation warranties of
+    title, merchantability, fitness for a particular purpose, non
+    infringement, or the absence of latent or other defects, accuracy, or
+    the present or absence of errors, whether or not discoverable, all to
+    the greatest extent permissible under applicable law.
+ c. Affirmer disclaims responsibility for clearing rights of other persons
+    that may apply to the Work or any use thereof, including without
+    limitation any person's Copyright and Related Rights in the Work.
+    Further, Affirmer disclaims responsibility for obtaining any necessary
+    consents, permissions or other rights required for any use of the
+    Work.
+ d. Affirmer understands and acknowledges that Creative Commons is not a
+    party to this document and has no duty or obligation with respect to
+    this CC0 or use of the Work.
-- 
2.49.0

