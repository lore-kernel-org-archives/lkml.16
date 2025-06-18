Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723AC25F78F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 21:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750280825; cv=none; b=BwJt6IwqAUP3B5HiKq+aDRLzzuVSPuBc2tnBnsbHlVqSZ+tknXynLPosk892nOM+2mdjm0gD7Hobah3cEMg8MMpSeCi/Hhri3By+iB/aOS8C1B0GEJ6cd7ehbxG9biHooX3YICw5rOwksG3IfHAw6UQisbvHB7vob/XVv43TEv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750280825; c=relaxed/simple;
	bh=9SSlTyGcvM3WP9iJvBpypYeq0oOSbyJY4I+5igRnGig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uc9bASJvjPkYwkatEV0zTpIAS5tK17Dgd5w8SWGHbvk30OCSiRKwomcavqNBItfPhITO03GdrXLMJuR+aXWnr1EqfVz9xAs/Jy6sm8xktKP9ptm+q8pmptF8AxoZcf2UGnx8l1XJ38Y2RUQAEQF9FUi+3j7MEjinzvwvkVq87IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZvZX5FTB; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZvZX5FTB"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6084dfb4cd5so2472123a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750280822; x=1750885622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iC4Avl5nsV5TTclLWzzJIwtPU3vLc3MEvXLZIzDVvGc=;
        b=ZvZX5FTBoJdNCOE9i+noZEvQMlZvM5qin1K/A9uE2+OGiEmjtbW3cV+gEIXXma7ufb
         Vl147M5LGgYF6g6xku4Hfq9f0hiOdjTgao/2nGXJMVhXklcl77QPNEi13unQEQsfL6Ue
         qDAvt8GqsE+GcN7lPAnmrK94TMit7f0O9+twc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750280822; x=1750885622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iC4Avl5nsV5TTclLWzzJIwtPU3vLc3MEvXLZIzDVvGc=;
        b=vE/SYT2TgLCNyY5XO184WwZgOebguSRjVp7vaQnunaqYNNNrYdlzdTndBHDNcGWYVG
         sCPrBSQCc66Ya7dgNM+Ft66W8a2gkiHReqZ2f4bjlLxXrLni5qGsHhh05Sxvq+13pW+Z
         X7A94+oqq8xPNtH764/x75h2Iv2ZevhzIBgRqPWPwpuK13w1CCeIzSCCiqrAbE9us2b7
         LaYUV7WgGHNg2UufxG2Cq2e7Om/MNSTM5O62UR+mQC+dcXZCDgRFBu7nwos0qstGQSsN
         qRF9VLGmlYjvn1pnkFH/EMWZevDpjUgAgxrD53fWf3UoXbioo2y9/TVfy0OgewTj2p8q
         oXnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRQzdzIdXVolVGIrhw99dG/cn+QZQms8/NStc2Hl4ifarHDQlplPAC3kagV1rhKCtat1HwDYTD/PzFu8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpN++sTVt5qXkuU1MMVmTy9b2pX/LMZ28luji4xSj4eelwfX3V
	a+CKwYcskLLGA50aTdjKj294DfRqaTvRMb6vmHyk7XqMjGFul4+XRmFRMSKxgnp4CQ==
X-Gm-Gg: ASbGnctEQbChmAeGBXL7DD1B+YtbNW3Djzl2yZYTV7Tf4dmeZuJIn11fBeInh9SwGwZ
	3LEGx3ZM7uwr8IHoPub7rdKL09mv9QBgszDDTGGFlVgm5XXHx7bi5kWZDz7YK+xMfUJJulPfsO3
	VYb6sWvaWpio2xrnW3ZtxMpieEjY4ikxvKF3uPjbsBy22f4dOUn58zZy67PCC/J1gzpF1Osfrd5
	ruI19r64ikChp1i4IQ022SqbepmF9Du+kLjTCn8WXoycZLPLmDzjugoUtJU0S2BPP33Gk2v9AOQ
	s54MZVLVbjttuplSpubkI4Ea38UXLUFZ3aXm78hvLYnkbduKVvVW4+CWIjm4gjhRih2BAafdVnR
	F4/VluqXe062U/nabjaBAkZTh1H+gL35Cp/Lsrjeq1a4AbBJEUQ==
X-Google-Smtp-Source: AGHT+IEiOE+h6jkEcIYe3lTIazAot2yWdKT/iY65/o+HVS9iYyzBT8ezqDEzQ9GEc6CtqcUb6mDfYQ==
X-Received: by 2002:a17:907:944d:b0:ae0:175c:18 with SMTP id a640c23a62f3a-ae035264a94mr84982866b.9.1750280821779;
        Wed, 18 Jun 2025 14:07:01 -0700 (PDT)
Received: from jaz-virt.c.googlers.com.com (104.112.91.34.bc.googleusercontent.com. [34.91.112.104])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec892b216sm1112822266b.135.2025.06.18.14.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 14:07:01 -0700 (PDT)
From: Grzegorz Jaszczyk <jaszczyk@chromium.org>
To: tglx@linutronix.de,
	robh@kernel.org
Cc: mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@google.com,
	dmaluka@chromium.org,
	bgrzesik@google.com,
	jaszczyk@google.com,
	ilpo.jarvinen@linux.intel.com,
	usamaarif642@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	tnowicki@google.com,
	mazurekm@google.com,
	vineethrp@google.com,
	rppt@kernel.org,
	agordeev@linux.ibm.com,
	dyoung@redhat.com,
	myrrhperiwinkle@qtmlabs.xyz,
	guoweikang.kernel@gmail.com,
	kirill.shutemov@linux.intel.com,
	akpm@linux-foundation.org,
	joel.granados@kernel.org,
	sourabhjain@linux.ibm.com
Subject: [PATCH v3 RESEND 0/2] x86: add support for reserved memory defined by
Date: Wed, 18 Jun 2025 21:06:26 +0000
Message-ID: <20250618210628.2635891-1-jaszczyk@chromium.org>
X-Mailer: git-send-email 2.50.0.rc2.701.gf1e915cc24-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Grzegorz Jaszczyk <jaszczyk@google.com>

Currently x86 allows to boot with ACPI and DT at the same time and basic DT
support is already in place but processing DT reserved memory was missing.

The DT reserved-memory nodes can be present in DT as described in
Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml.
Similar to other architecture, which supports DT, there is a need to
scan and register reserved memory regions on x86 for such nodes. It is required
by drivers (e.g. open-dice driver) to process DT reserved-memory regions.

v2 -> v3:
- Patch #1 which extends of/reserved_mem and adds the possibility to register an
arch specific hook was dropped. Instead "x86/e820: reserve corresponding to DT
reserved-memory nomap region" was introduced.
- "x86/of: add support for reserved memory defined by DT" stop relying on arch
specific hook. Also calling x86_flattree_get_config was moved and is now called
earlier during memblock setup.
For more info please refer to commit log description and v2 discussion:
https://lore.kernel.org/all/20250418124718.1009563-1-jaszczyk@chromium.org/

Grzegorz Jaszczyk (2):
  x86/of: add support for reserved memory defined by DT
  x86/e820: reserve corresponding to DT reserved-memory nomap region

 arch/x86/include/asm/e820/api.h |  1 +
 arch/x86/kernel/devicetree.c    |  1 +
 arch/x86/kernel/e820.c          | 19 +++++++++++++++++++
 arch/x86/kernel/setup.c         |  6 ++++--
 4 files changed, 25 insertions(+), 2 deletions(-)

-- 
2.50.0.rc2.701.gf1e915cc24-goog

