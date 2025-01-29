Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082211F471A
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 22:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738190573; cv=none; b=g7EeNU66JieQ/zmHgCDFTLB/onmziAqOY6C6+Y0DOld3hfe4SYle5op7UUTnnBS846dhtTrkBGN23vpV6Q4b5gR8dWMxXCiwuzLkD5L4svL909FzTvsTNPq/vypx9HIUVqrjusTRMGZ+YkFFbpWsnTh76FqH7Wv/E3KMIOJcbO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738190573; c=relaxed/simple;
	bh=wvVzIzAs5+WDE+GJcz/oHr4G45IfBDRvB4m4C4Fb9Js=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dbsIvwl3iz1B5m8KOSrI0XcRQFyyT74kNFJsrbp/vz6wWjJzOro/Lxi+ZMm18H0LrwQmrtalGwe3p4RxKjFTXTJhdnCA/0OYI15HoIicRiq/Hw1+aGLgV1hGwIuwi1QEh3OyMwPAmj7CUPfOKfGwPUmff4imZQf34z0zU6b7a6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yTIcXJTw; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yTIcXJTw"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-21661949f23so4155375ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 14:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738190571; x=1738795371; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cb+6DeiIrDYs6+D7kWz+SSV0N/KlwTlgW0EvhXblryk=;
        b=yTIcXJTwMRFGihYxBP/DmpvRg1XjjngH6QZydQdMG9kTDLJUlryPumxPTGqZ67ZrUL
         2YTUbMtn0UKtviW6hf0FmdZokP/mjJRSN/JXKd28Kb6EbwOtxrS4gQG7EE6mrIr7+39p
         1UfqFhTgmYWelTRmiyOwTI33c51osIx/vSZlthFUKPM6sFQuqTd/M/KBk79C6Tt9OCT8
         3Pr1dRuQ4pmQ1DJpWo5CPiNuWYhsIvYxT3Za9LvfqDWCX6APmovHOSeMrXeb3d4UR/3D
         3Btt1de8HWGaAyvWbXXXKNT+jXTxPy91OXOOFQys+jzDKRS0DgtHOz7I0HFsVPaRWJlW
         vvkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738190571; x=1738795371;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cb+6DeiIrDYs6+D7kWz+SSV0N/KlwTlgW0EvhXblryk=;
        b=MMbT50yFg76NOut8qhWpIbYL3hZzfytOWGL2GEqxRBb1hmF3UI0pgPOCDzZ1EkLhjU
         SRJeY54aZpWMCMtSfDLH/Vc7d7DWbaE4f0Jg2XockkbblNFcHAjv/HTqHFJURVaxC7+8
         kB2bnCedumj3Et5YKudPAWV43zy2oK/w9pOYCO2K/V1lYUFk/WB7UZyxQU8GXs3RbFd3
         w4YK54WUSvYk/hn8Sau+M2idcUJk9xlOAfZaODeNsRAgh4tdHN1yVn611D6UCPu6jlIQ
         iQgdwj/sGo16xJWg71edtzS3OLkv/coP2kBj6ndn0ge4pTQQU39bS7RgMTAujoJZes1r
         P4EA==
X-Forwarded-Encrypted: i=1; AJvYcCWW6Vmar6UY66Ysqi0OiJ25I2/VgVZbkvGeGz+guWr4plDossHrzH+ZZbDbBUXa8nPAdrZBvGNmiv1UY10=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxng2SICH+RQys/RWFmwamh2JqNSQxjj/GCnKY+aFVUZuf0Bqxh
	/ZM4RwF4Ak1q/JYLRBJLzxbmSlwBzG4aUjC3+CSSeyzpGpYmebyfU7YAoZUHrRa1q6X56Q==
X-Google-Smtp-Source: AGHT+IGDZN67byriIZ5TIJ74e/Xl+F0BuBhYUaCM7mwYBiMBi2VTra4u5+oA1ptyGp1vtiEeW3/9K7g+
X-Received: from plgi2.prod.google.com ([2002:a17:902:cf02:b0:215:ac55:d3ec])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f687:b0:216:6901:6847
 with SMTP id d9443c01a7336-21dd7de1cd0mr67719505ad.42.1738190570966; Wed, 29
 Jan 2025 14:42:50 -0800 (PST)
Date: Wed, 29 Jan 2025 22:41:51 +0000
In-Reply-To: <20250129224157.2046079-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250129224157.2046079-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Message-ID: <20250129224157.2046079-23-fvdl@google.com>
Subject: [PATCH v2 22/28] x86/mm: set ARCH_WANT_SPARSEMEM_VMEMMAP_PREINIT
From: Frank van der Linden <fvdl@google.com>
To: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: yuzhao@google.com, usamaarif642@gmail.com, joao.m.martins@oracle.com, 
	roman.gushchin@linux.dev, Frank van der Linden <fvdl@google.com>
Content-Type: text/plain; charset="UTF-8"

Now that hugetlb bootmem pages are allocated earlier,
and available for section preinit (HVO-style), set
ARCH_WANT_SPARSEMEM_VMEMMAP_PREINIT for x86_64, so
that is can be done.

This enables pre-HVO on x86_64.

Signed-off-by: Frank van der Linden <fvdl@google.com>
---
 arch/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 87198d957e2f..ccef99c0a2ba 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -146,6 +146,7 @@ config X86
 	select ARCH_WANT_LD_ORPHAN_WARN
 	select ARCH_WANT_OPTIMIZE_DAX_VMEMMAP	if X86_64
 	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP	if X86_64
+	select ARCH_WANT_SPARSEMEM_VMEMMAP_PREINIT if X86_64
 	select ARCH_WANTS_THP_SWAP		if X86_64
 	select ARCH_HAS_PARANOID_L1D_FLUSH
 	select BUILDTIME_TABLE_SORT
-- 
2.48.1.262.g85cc9f2d1e-goog

