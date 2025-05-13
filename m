Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F18823C8A1
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747130254; cv=none; b=YBf2q/xdIO/hziZlt8nnmJBsr1OyWNujg+vcpAWdxD1tn/mYVU88z2bdRPySxpnD/SpJ4/QOIgwKuP/U412KRVl+nkIPsMSBeKwtkk7llPV5FcOqOSJWwTrh1dl1Sp+RbwyTMn28yAA/pKe0/wUhYRa5nZvdu8bSTWVIwLnrJas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747130254; c=relaxed/simple;
	bh=m7dk+dz/FQ5y5TwuOJuv8h8k/o/ZvuzcKicVSuADyhU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qEPbxfExTxSqrMOW7d33FsSugAjZNiTH2ltSajir5gBgnP6/IhKfgi9nBcV8B62gIiET7p/edJy9CeaWZv8h37uWK//sShFs583GJeoZ/vSM7Uffspos6q4CzsZ/Ae4DxmWJS/p+aWmyKEdVA59WWpwk/LjLETaFwo8ESnWkuQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hi6NQ90X; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hi6NQ90X"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a206845eadso1414567f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 02:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747130250; x=1747735050; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NLOdbjvW3023c+QSK4O/m+8FGrzwf9Sug5Us+R2Jh0w=;
        b=hi6NQ90XWR15nxlpVNdyfYm2s/IA77FUXBPd3bJKrHq0MRr325VSnr0uQivcqxE+aO
         iFvxsRhg2n1Hhws64shklZY6x/P+YzolFJddr0wgZOjbiLRjsxAlXDZYrkiKrCTm3JmU
         nRh2CPWUaBICk6yUSBX5XN+AW4zHvGVl+MN0uWbFEkMhBGO9MnLn6fsDMl+UGQ1GOcjC
         75vJsZ9lWGz7QmYoVRqcZj3O/4aspKsZy5B+EKO7CCTSVeLvToDuf6ZgVvgar22hWu5v
         0Bx6RvNN1Y/or1UME6reVF2T+sd+acC9knf33boMPTUVwgaYtfsmBAjaDxSqYzRq7id/
         j15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747130250; x=1747735050;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NLOdbjvW3023c+QSK4O/m+8FGrzwf9Sug5Us+R2Jh0w=;
        b=v3xRr35zuGuwNzNRPt24iCuDdke3UtfdlpnHUbltf0lc6IY+qNAXjEY+zWhi7fuPW4
         fkOCmIF08KfY8W+pIz64WA9Jr6Ei4Ig/3RLxy4El9q7m8YgHr/Z6+3RQO27gpmHAFo0r
         bL52j56fXyannLic5wnzRNHL5dIiL6TZmn63753fl72V4Hn3cVkBPb8miIX9vdgVxdKb
         R0ro4fj4ngRp8HICmp8oYW4KNNxFSKIc9CTdhQjXi/6okBrblCt8/x8Rs7zO3OmjkikM
         Q3FRLhJGgG1xuRk6/RxnswY0/S1iFBzsCGrS9UDMGrLNBxBIQROkzHKhv+cD0h+K1YeW
         m1FA==
X-Forwarded-Encrypted: i=1; AJvYcCUvaiXuFEdnJjdUxyLnTjBPcJxJKpkXR/bsn8jLg0quJ2WFEEbAEcq0mdU7CJWPCKp+BTpR8R/ZzReNYMY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzphOnEQPfXt+3qjWemhIvI5sjLyfE5O+K8yaKypg1U2Du9OVAw
	8DktBYvH3jK2FtI464NK83AZihNBuHcXILFjtlrlYM273QSKMYGLC/nKU4c5o/g=
X-Gm-Gg: ASbGncuJ7fTgX+0LX+TwHYtHBDKh5iRfEFjW1ENssffzuQcZrbz84RzUC4kNUP7iK1p
	IZdQt+ukWMGo6QtMK1al1U5fNyzuF7CFRBNlCcdXUDl6MzevT/jquWUfdcRgNn5X4r4SdpDQuGf
	eOQ4IrojmAcU2tz/v19b47VPM6v02hsL9jkiPGGKpfUvr2ZpgABj1kwSDcRBKV9yxqgK9YV6NH2
	v2ltsWPj0vjjNxvQ0l04bE4n5BWEq8gG/hCXdzXO3luauZztJSSXU2++HMTCzMxboysnGm7jzuk
	dLEv6P9S2P6eD38JtJYgli/vya0UM6xtaTl88sNjxmfdz0rOgFp4HI6pELKWEmJaCwegIpbXfwH
	ccg9dYpIaBlVREcrMTSsVrA==
X-Google-Smtp-Source: AGHT+IFmloF2gXlsJK/TdytelTjfQyRAY2cW/iP2qUFwPDDpUiYaqsBBWIdshKt4SYc+wAa8wx85KA==
X-Received: by 2002:a05:6000:1786:b0:3a0:8c4d:7033 with SMTP id ffacd0b85a97d-3a1f646d8c0mr12827020f8f.5.1747130250512;
        Tue, 13 May 2025 02:57:30 -0700 (PDT)
Received: from e133063.arm.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ebe4fsm15858404f8f.39.2025.05.13.02.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 02:57:30 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 13 May 2025 10:57:30 +0100
Subject: [PATCH] perf tools: Fix arm64 source package build
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-james-perf-src-pkg-fix-v1-1-bcfd0486dbd6@linaro.org>
X-B4-Tracking: v=1; b=H4sIAIkXI2gC/x2MzQqDQAwGX0VyNrD+5KCvUnqQ7ec2luqSgAiL7
 96lxxmYKeQwhdPcFDKc6nrsFbq2ofhe9gTWV2XqQy9BuoG35QvnDFvZLXL+JF71YpkgiDLEMYx
 U42yo+j9+PO/7B7dTBcFoAAAA
X-Change-ID: 20250513-james-perf-src-pkg-fix-59e5ec53c404
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.2

Syscall tables are generated from rules in the kernel tree. Add the
related files to the MANIFEST to fix the Perf source package build.

Fixes: bfb713ea53c7 ("perf tools: Fix arm64 build by generating unistd_64.h")
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/MANIFEST | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/perf/MANIFEST b/tools/perf/MANIFEST
index 364b55b00b4841fc7b3505e8f27ea9f3f246e3be..34af57b8ec2a9cb7f8ff75b4515f32f866452e3e 100644
--- a/tools/perf/MANIFEST
+++ b/tools/perf/MANIFEST
@@ -1,8 +1,10 @@
 COPYING
 LICENSES/preferred/GPL-2.0
 arch/arm64/tools/gen-sysreg.awk
+arch/arm64/tools/syscall_64.tbl
 arch/arm64/tools/sysreg
 arch/*/include/uapi/asm/bpf_perf_event.h
+include/uapi/asm-generic/Kbuild
 tools/perf
 tools/arch
 tools/scripts
@@ -25,6 +27,10 @@ tools/lib/str_error_r.c
 tools/lib/vsprintf.c
 tools/lib/zalloc.c
 scripts/bpf_doc.py
+scripts/Kbuild.include
+scripts/Makefile.asm-headers
+scripts/syscall.tbl
+scripts/syscallhdr.sh
 tools/bpf/bpftool
 kernel/bpf/disasm.c
 kernel/bpf/disasm.h

---
base-commit: 8988c4b91945173a6b5505764915d470f0238fdc
change-id: 20250513-james-perf-src-pkg-fix-59e5ec53c404

Best regards,
-- 
James Clark <james.clark@linaro.org>

