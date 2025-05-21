Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB2422B5AC;
	Wed, 21 May 2025 16:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747844219; cv=none; b=IEbQbr8L0FJGf+FMSN50QEpmwj9DKv3OyJPhYswBTWa+pX4mEq9jPAX3KCYRsjuzscHWSp+LJ7IPV64DgLmbUH2RyaIk3PWlEuHmPCLn5M8bqDxhe0u/jYpwrtXWFhgPYJBnvFtSuOT3Y2K66UqaBUuLU4K3DxcE2VpxZWUZhGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747844219; c=relaxed/simple;
	bh=B4oxhPJUpgNUrajc83IjrVqK7rHcKNJCKJyvLqXmphM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JjD8EGOvKulPwVTmuoMb0XqHlVArmNUFpoZ2DaPl1JjcafSYSg944t71UoSbw1bxKDLCNUyRXm/Ea66ZSFlOKGb/N95VAakNyT52Ov3nywyWmWBaIj+1YaEZ2KTpBw9HMvYBNgVQNbA71ozvJSYeHyGZ/HS7Je4tfTDruS7VPC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R0+i3DkI; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R0+i3DkI"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-72ecb4d9a10so7705825a34.3;
        Wed, 21 May 2025 09:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747844217; x=1748449017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cgPZCOhzfhKQa7GH/ctMaTjQORCrQoSP/fn/OFIVK2M=;
        b=R0+i3DkIGPdVR46e/qHXFHdVYBinBluFFejexasZfySUm9zVMndefegZa0x0bkj9p4
         A9CqD9+mU+ix1APbtElteDaKS8LeIBxA2+iy5IrNbrCR93MC57YQ3vb1yw5W3cGyImmn
         F6wlq+M8zisPqxyjn53VocjFQbvXBBwnBl7AM7i4c6UKE/Ha4YPyYd+GvvAQJ4pUWO1K
         YuAiDpGEHxpxkiYlIz3UlnmrpGce23Tkm69Bx9eoxTPJuxKOEZWkBAirBN9rs6Mg8DyQ
         M33losC+tUalI7PC4OLHyx8sdz2eh2QtHAvO1ei4NimfmRn9zNjrE1I/4Fs8Yml8lLua
         hP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747844217; x=1748449017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cgPZCOhzfhKQa7GH/ctMaTjQORCrQoSP/fn/OFIVK2M=;
        b=X4PuARIjUM+u2b1rzdCTJA1WH3Tl258tXaG8HYHig8/1snYeSJG0an1sD0C+wrMu8m
         QhS4m1krtO2W/hft+y3bwdh/N6SePPUPTrGaHoH7is1hBNkcyS4P7g4A0BgdOBBoXrc6
         pjupKxMTNJiLhae3EFX8uO1BGNTXtTM+freNdx12UUSu2VpTsCqa96UhdLeyJTG3tQEt
         ZHHG05bPdNEkkxitjg0Jui5sZ10p2HLTYX0cDAFQoI6MIXeac8nv7HX2ZKJdig1Ch+EA
         Ity+yP1pCFN1F5YVpbGfraDe+OlDotWJzY21elxknwqw2wrFsEeImMhkIg5k2dVfYWK9
         gJ5g==
X-Forwarded-Encrypted: i=1; AJvYcCUHeTAC7X8lQS3xARUAVucbc9yWj8+I3Nz5J9XK51HKuDc0LNV0XYCJJRkju0j2DbsJdhMbH1WUMJmSvJ+NrIn+eMCo@vger.kernel.org
X-Gm-Message-State: AOJu0YzfHyVLYM6C/IBQIZ3mqbxLiLRegEkirsxQIskW7NzNdKqPhPgd
	ot/Tu+xPiWY5CO4xE0G1QcDkirgHd193TwpKnRS5tm48c48DPD7yGzlq6NMOsA==
X-Gm-Gg: ASbGncthY98xKFhtqXuVD+uFk0IWITPL51XiJ4D0uwNsT6fpzaGj1ddR/l861spT9lz
	TOpuDub2HeV6+KNIBLvMvKOCVOMjEx4eQeRJPtwJpC4p1sp7cb4XRNxGZ8vOtqMwu9YEBzJ55FE
	8eZVm7vn+00+fFGB2CwDvVUBnREGzPRzdIe5uOsY4PFx6icd4HPG/Pk3F2O+geXXRXpo1kWO7UQ
	ou0e5t5bIEzvZ88RTB7ZKdU2CEengOr9XQIhTlG/UgU6qdJtyKBSAIlUCeEmGFAi+9+0qb01K16
	KGM32S3grTQOgsNGWHGZeCmXfj3KITKXW2OTngXCioYuZvimMjgf41IBrC4kEJENmb+S2pBl2o/
	xxpNUoYxAyQsLftiIkQ==
X-Google-Smtp-Source: AGHT+IGSn7GVDNSw/kusSE7SZE44OAVnLLkF5o4VvRJj5c/XTRAdLquJcNGJ7fhtKrCXZzJ8/NAI+g==
X-Received: by 2002:a05:6808:2289:b0:3f8:498c:9ef4 with SMTP id 5614622812f47-404d87fe3b9mr13894993b6e.24.1747844216704;
        Wed, 21 May 2025 09:16:56 -0700 (PDT)
Received: from localhost.localdomain.adc.delllabs.net ([143.166.81.254])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-404d9809bccsm2180129b6e.29.2025.05.21.09.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 09:16:56 -0700 (PDT)
From: Stuart Hayes <stuart.w.hayes@gmail.com>
To: linux-kernel@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Cc: Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: [PATCH 0/2] platform/x86: dell_rbu: Packet data fixes
Date: Wed, 21 May 2025 11:16:37 -0500
Message-ID: <20250521161639.47357-1-stuart.w.hayes@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two fixes related to packet data.

Stuart Hayes (2):
  platform/x86: dell_rbu: Fix list usage
  platform/x86: dell_rbu: Stop overwriting data buffer

 drivers/platform/x86/dell/dell_rbu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.47.1

