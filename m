Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D8226BD95;
	Tue, 11 Feb 2025 02:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739242262; cv=none; b=Uoqbw2VEofMOHwKuq5bDisObNFI7bJeQcgpRtb9U8V0Lo65eeZUGQm7PfRP4cojCNZ3Lgzr5ZhqNFNXDv31UTSMx+8YN84zsR3scFASsncOt2hQ46geZ0/niTd07B/u+n6QU/O5UzBpBGbejU3CfhZ/n0r7rJpYvJG2q2f87Xr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739242262; c=relaxed/simple;
	bh=363o9y6nIpiTcHxka7eoHXT++KoCdpZHBIaS99QobQ8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Nkcfn3MCSmgugGZM9LT+kUIlQEZjqeAXh6NZuuh5W75vnwrQZYnr6uiiRwyS6nxRLbAlG14kBHRnpw5TiRfN6+pRg2UOIiqj4aBBMDGKcBs4D7u/oUSAHwzE1LWI8IKmKl/s9R9tSgOD+zuckhs7ll4fmMhB0itNU6fS9uGYc6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DvD4Yzoy; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DvD4Yzoy"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-46fd4bf03cbso79326501cf.0;
        Mon, 10 Feb 2025 18:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739242259; x=1739847059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y7W7UIaefMaBKc66QNK3ykd+EZmLgH4o0pIICgtsY1U=;
        b=DvD4YzoyWCsxGs3oah+AAf4W3kV6G77brbORHAtkRGeKeAKwkf7pw2u2iz8Fzv+X3n
         ZedawpIMvjzqGlqS+iwUOQqjkqH9naqmu5qe2iSHRJAzPnTjfikHxE5Y9QCcN3niz9Dt
         xtG7vXREonyX7de0Z7wSFGEXECT4cd0HNH1evkbk67Q7m2LgmtCvr/2Ic4IYeXXmtFbA
         5/kdHyO2m47dQZ+g+hpqFIaXYOveWf1GCpOPjRKA3BU68f4WVN9FDWtDMWlqvTCzFkMA
         h7/E/67zrKmsWS06hu8gbiOgP22gHZgtkjyDuF6BbR2WLjNoD7eeb15fgPw+gKs42CBo
         9jGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739242259; x=1739847059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y7W7UIaefMaBKc66QNK3ykd+EZmLgH4o0pIICgtsY1U=;
        b=HKMeZ6sZcUA9c7ocEzq27KyiRjK792EIlNOD3jjyVWF2rin3sBpF8FLoRaL27wPfle
         KL28WqgwjoZvEHE1DmNB4Bqy2x/wW/C0f63AvLXvXM64eOe2lspXGy9O/Q6GEyyzn/Q3
         z/kaKvT50PINamI8DHDJVTBKMHAx5tKyxgNZGDwcdQNrhJxEfxjujCEBdvKWVmK7qDez
         +u8wiQDY6vxq6PdkFKnpc4o6E/WXIradY6SjP/bdsM6xJNib4a2tQ5zSHPEhTKGHdT5p
         toWk82Yf1VooAVWvqhR0ji7YStIpCb1EUtJ8r2vxP8w2AY6UrzT4JFiqpTGKf50XA3mG
         r2HQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvA3RDK2pBUJ2UObzVgYDDDuY52jea4wKMMUThWxYpUddCEF+bnEAL7SWL9FNFDUDrPBtPHdmr86E/M/v4@vger.kernel.org, AJvYcCVP8p3DOFyY6S6lx8vYFISJ50lsHOtY5lpBGjZ9gqpxzcW1f3VlwaHAeHW5wUaqiCe/BM2QUf8QdQs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzelYyV5eg8mdo0iYESgERIDpFDVYBFfsbXc0IGtmtoAT8Ae6oQ
	PUsBHfw+o0dGiYdjlfa06Z+I9gorvZZPln89Tl9iUAIm7Ga2Ri9Q
X-Gm-Gg: ASbGnctYfZq1tukBcTYE3imJoKCC7DW8e5pwnlCMuT1mcYiMRHIkr9+mh3IhA78LNsm
	CcnD3mTV4Id9YoghiXM5IwYa8PJ3adUmURs32XU7viAqUDLi4xhiNziWOKE6ouZXBPMAAVeThJI
	jVI1dMiTW30/yLAbmCHudTZckkmOGMeQ7b5TpO9xLIyHn9JiAVkQqme+3mcojqE0N8dL+FbS6ne
	QtWIJ3PAvA4s1XvcnfbUohYCFkoeS2Ax15nJKkK1R0g/GE6pOrMTHXCPrHfbarMePDWBpEqVo6H
	KcMmb5lzBG1XGLZMUpSlXc7EHDLQRM7qCJ2XmWwf2/JwyZUZSyYxx51r5H5xzzuIMse3kirat0s
	OPx5N6DVld99A7RSh64gZfUuSgSAqIvSMbNQ=
X-Google-Smtp-Source: AGHT+IGuUfMIhb5DuQUpTinkcfu/mJq0eKFdgYhp/7lwkzu/vFBxjpk51/uOsYm7BksfGGQUP0bayA==
X-Received: by 2002:a05:622a:8e02:b0:471:8c1b:7e33 with SMTP id d75a77b69052e-4718c1b81cbmr65116951cf.33.1739242259377;
        Mon, 10 Feb 2025 18:50:59 -0800 (PST)
Received: from SystemsProgramming.mynetworksettings.com (pool-100-1-71-214.nwrknj.fios.verizon.net. [100.1.71.214])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4719b182ac7sm11794231cf.5.2025.02.10.18.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 18:50:59 -0800 (PST)
From: Brian Ochoa <brianeochoa@gmail.com>
To: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	corbet@lwn.net,
	x86@kernel.org
Cc: Brian Ochoa <brianeochoa@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] docs: arch/x86/sva: Fix two grammar errors under Background and FAQ
Date: Mon, 10 Feb 2025 21:50:54 -0500
Message-Id: <20250211025054.4062-1-brianeochoa@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Insert missing "to" to a sentence under Background
- Insert missing "an" to a sentence under FAQ

Signed-off-by: Brian Ochoa <brianeochoa@gmail.com>
---
 Documentation/arch/x86/sva.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/x86/sva.rst b/Documentation/arch/x86/sva.rst
index 33cb05005982..6a759984d471 100644
--- a/Documentation/arch/x86/sva.rst
+++ b/Documentation/arch/x86/sva.rst
@@ -25,7 +25,7 @@ to cache translations for virtual addresses. The IOMMU driver uses the
 mmu_notifier() support to keep the device TLB cache and the CPU cache in
 sync. When an ATS lookup fails for a virtual address, the device should
 use the PRI in order to request the virtual address to be paged into the
-CPU page tables. The device must use ATS again in order the fetch the
+CPU page tables. The device must use ATS again in order to fetch the
 translation before use.
 
 Shared Hardware Workqueues
@@ -216,7 +216,7 @@ submitting work and processing completions.
 
 Single Root I/O Virtualization (SR-IOV) focuses on providing independent
 hardware interfaces for virtualizing hardware. Hence, it's required to be
-almost fully functional interface to software supporting the traditional
+an almost fully functional interface to software supporting the traditional
 BARs, space for interrupts via MSI-X, its own register layout.
 Virtual Functions (VFs) are assisted by the Physical Function (PF)
 driver.
-- 
2.34.1

