Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5E2230BC6
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 10:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744021258; cv=none; b=vGS9KYB3bk9H7Ast/GVSFEp59yCXeSmnAnWW9yFdlO/fae2gZVM+WhQ/aKcpGGc3GtI/eZS6h0dgU3InAwDB/VU8oVNvq5IbIx0SJqRKDlXARwiRdAPUzJIRNczYBLvSVOrPmsRPCu5qDmQeS2y/oeJD3+3ddvFCxubFsmI7qHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744021258; c=relaxed/simple;
	bh=gVlihUZSd639fQJOGFXoL+jhz4s84F+ss9pAwAIb588=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=onKMuoKEeEqt6LnWqN/kKp6G2/zHQ/hzCoRmc8HoRCG9B7Up8bSG8BeytsMeGKj1cVLGubDdH7pBymERRMTM+D6GWueUznldfeYbxAGVkbTovAXnH2qz5aNYr3DpQyuqIWbDR7mObVoORL9HBpssCxGP1sFNXiPlDJSLgY/ffdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=S9CmOO3R; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="S9CmOO3R"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso790561366b.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 03:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744021255; x=1744626055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=athitrIlFUHEiEDxf+01r51uYAvDaVmfFgQ/U9/E5OE=;
        b=S9CmOO3Rm/OIvtZ5P0FH15jKy5a7MO+4BwQYV+Hu0Ey+cM2OcfhGk2PLVt7tLWGXNJ
         BjmgPETOqeuGwvGOcVjWQhHnsWld198Gm3kHPYY0Y4jPz5McuZSBPuII10t84KO3c65c
         oeldKD8iJ8m1SPw0nYz+p1bZnCjY7ffiJHXrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744021255; x=1744626055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=athitrIlFUHEiEDxf+01r51uYAvDaVmfFgQ/U9/E5OE=;
        b=BIolrcbfuaTIXGKh7rHOLMDrjz/yesZWgm8md4sM/JGxBYkOZ5kKaWw9fpfYqDGf5l
         nzDUe00+t4OcwLeDj5qvjGJWxFOSwU0cNXrMqVc0gMoM7CJiBODjBxQoZIFpnsBnOlnI
         SC5oxyNaxf7udKzC2sCPYwun8QEg8nB7CNTkb09Li2QWHR9Khe/Uhys+VwXdhPhHaOJa
         Uv0IBMHp49pdkERxszgmVa1QLSws7yBRpL/TrqktseZw/dYQrbyBzAHOG846KhAk/OAa
         dup/g8b+NMGjEOa04+6H7ewnBpW9DZlpYeCmVgu/0EDKgWjJNRMUYDsc0wz1MOS1L1UW
         +WYw==
X-Forwarded-Encrypted: i=1; AJvYcCXZqMuL+o/NMaNL8D5utSzItlmAcunXJx1X6TQnTxkJf9VrzKP1rMZPfVULcY+EQXYDhLpegM5E+RABobM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrOjzQ1rx2HtsLDOLM2jSbANQpIXGgnSkHUNGzKEllFKHlwiYF
	Ve30jWqE+srx1LNBLpTQfAE5sTTJhzfXKkbMox/qeJ7+kG6PP0bUf3Kjn70ZX6w=
X-Gm-Gg: ASbGncs+cfvurfoNTKnhEPAtHzjW1QqggJqn+DUYyYugFEX+l2D8EPXp0MwXjsgJU73
	WRAzy6y7bDK70Gu1zfATC7SE8pXj+EJeZrs7PmBPGdH/AdFXAnaKYLj0iZFapiILFOphMqUeyiH
	x1AwUklbkADsqxy6sSma8w4L1qzVCrkqNNAOuTUPzBkygdHTH4dll9GCRmtoO7F9TihJEbFtlWg
	cOn5qp9DCImlCVF8Q8wynkw9R25APmAD25F+JPBl6V+KczMduCLy8rrNVnhi1Sp20NbHMMJwYfb
	Ku2T1S+kdOnk05vMl1RibNe+jQFE64DEQtd4kKsq7Wo+VSIaGQ==
X-Google-Smtp-Source: AGHT+IF18aluJtArY+4Lz8Yl8WYJsCo+sYSabuDUCe0n35NtXxKE47amets788BoPar+JoY3CYd37A==
X-Received: by 2002:a17:907:9728:b0:ac2:87b0:e4a5 with SMTP id a640c23a62f3a-ac7d6c9e900mr866928266b.2.1744021254787;
        Mon, 07 Apr 2025 03:20:54 -0700 (PDT)
Received: from localhost ([84.78.159.3])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac7bfe5c7f7sm712686266b.20.2025.04.07.03.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 03:20:54 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	jason.andryuk@amd.com,
	Xenia.Ragiadakou@amd.com,
	Alejandro.GarciaVallejo@amd.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH] x86/xen: disable CPU idle and frequency drivers for PVH dom0
Date: Mon,  7 Apr 2025 12:18:41 +0200
Message-ID: <20250407101842.67228-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When running as a PVH dom0 the ACPI tables exposed to Linux are (mostly)
the native ones, thus exposing the C and P states, that can lead to
attachment of CPU idle and frequency drivers.  However the entity in
control of the CPU C and P states is Xen, as dom0 doesn't have a full view
of the system load, neither has all CPUs assigned and identity pinned.

Like it's done for classic PV guests, prevent Linux from using idle or
frequency state drivers when running as a PVH dom0.

On an AMD EPYC 7543P system without this fix a Linux PVH dom0 will keep the
host CPUs spinning at 100% even when dom0 is completely idle, as it's
attempting to use the acpi_idle driver.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 arch/x86/xen/enlighten_pvh.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/x86/xen/enlighten_pvh.c b/arch/x86/xen/enlighten_pvh.c
index 0e3d930bcb89..9d25d9373945 100644
--- a/arch/x86/xen/enlighten_pvh.c
+++ b/arch/x86/xen/enlighten_pvh.c
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/acpi.h>
+#include <linux/cpufreq.h>
+#include <linux/cpuidle.h>
 #include <linux/export.h>
 #include <linux/mm.h>
 
@@ -123,8 +125,23 @@ static void __init pvh_arch_setup(void)
 {
 	pvh_reserve_extra_memory();
 
-	if (xen_initial_domain())
+	if (xen_initial_domain()) {
 		xen_add_preferred_consoles();
+
+		/*
+		 * Disable usage of CPU idle and frequency drivers: when
+		 * running as hardware domain the exposed native ACPI tables
+		 * causes idle and/or frequency drivers to attach and
+		 * malfunction.  It's Xen the entity that controls the idle and
+		 * frequency states.
+		 *
+		 * For unprivileged domains the exposed ACPI tables are
+		 * fabricated and don't contain such data.
+		 */
+		disable_cpuidle();
+		disable_cpufreq();
+		WARN_ON(xen_set_default_idle());
+	}
 }
 
 void __init xen_pvh_init(struct boot_params *boot_params)
-- 
2.48.1

