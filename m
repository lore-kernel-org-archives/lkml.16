Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F46C182
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 00:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738282743; cv=none; b=Puz+jmKg90E6f9OKcrPRitjtp6LnnnOPgGJ0UTpyJBTM1vk+E0ADI5fe5wt+5qEkmim9xlw/jAdHTlOJ9kwI5l3qvoVNFnfbSqli4wGfNbAbhJhy43+2QfBuRvyvUZnNrs+8VK0gdo9jkxbAoN4WmMLy8vHJUM0yqDQTCRravJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738282743; c=relaxed/simple;
	bh=O52Yzruw7yyuKWFA6+3Hafvmwr0M3TDOPu4MYTJVH3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MFfjVtJ4jfKwmCzoywwX2a/P8ykaXc25tg6e9CQLRsTB+QDeNWvk+m8/LooCEcykUlHVyAWgT1t8vAVJNzjtuPJvAJ3LtZeX/D7KV8NgyslRcqjanjLvKPDbb3Qmhfb7mhFcMyQm6EvgmWQ0noG08lUxmT7T8Q1dQ05f/ExY8Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PQwaruOa; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PQwaruOa"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-218c8aca5f1so14405035ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 16:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738282741; x=1738887541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oWUAukKm+Ulg4aVVFfRO1Ki73t1eOXCR15qhPHxZ7oQ=;
        b=PQwaruOa/h3wKDBvy/x4QsEyBjxTmGaEorcdIoz8PfyMUS25q1S+q5FraK/PRjiSEd
         Xk0/FRLYFkyaZFTiBhIVc2LeG4GFAlpy22d8Kv09fIDJ4BX6SrOEDdL9CEso3SGaemvK
         mMqXQbkYX8nivQqoZJpPRxf/tM+kNdLJwmHwskALxniPv+VowuRzu+3o1UdL+HQaJs4Q
         7XZvIS/ifIcovS16U6NrL+mzXFjJ5V7RcB1WJ4qdxgPeKyW1wa7hUXzXryG9F3OYnFhH
         T/qF8/ax5gZsKWDO3SYtxDEdwE3CFGtcUpA8d8hG2X1VLIr1txAIAVeV4pf2aBlUnG0M
         xO5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738282741; x=1738887541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oWUAukKm+Ulg4aVVFfRO1Ki73t1eOXCR15qhPHxZ7oQ=;
        b=Vk66KCNTAgvBaJTkcYCfvZYooVlbZ+Kx/Q6Hc1KGYdmeietEncb/nclhNmAe1J7vdS
         asEEWuUH3Vlq3tLSexJlF8yJADTuLaso0sjKs34csrskh1Sm2uXK9OXW/ozeXUx8fvLB
         nV0TAT84OmRw/KzF4WIylDFZGGY4KDkuqWZPZM+okukdgkPyCsydE9CBeLjj8TwgJ3jC
         8EDmK/7jKkveNU1xeia2+vin3fhipIWHj5daApmEFqbyBoKVyQeWoLoqLpOmBzov9Kjl
         T+CTiL6K4ugjxvKZ+5uUgO+AgU8hbAtOyQsWkIcLxcZlOyR0SaECKS4TOIPEU4P9TiZd
         EKDg==
X-Forwarded-Encrypted: i=1; AJvYcCWrvz425XwuoRlPfL3ePfGN15GCHYENrCL2dRsc9Wpcb0wWoJzclKtRygUnY3M+Jzs5B4ilMxh382+ULjQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz20iG6rP+hQawxl5ZcvpBZUm4F/niLVMGpKAsoiAQ4giT421Hl
	tNqMaCAdFLAsSSE4pxxUlFYfv90QFSOxQVeocAw/kILxsFLt0I5X
X-Gm-Gg: ASbGncuLawsqU/lZw7euUksPjB3FnNjPG0Qwd0N27wQhxTEVN/tt8Bjz6g31D7XFvW0
	JdFPmj+xi1OR+B89jz2n9KLpV7PfY3HcZiVwRU37XiIu5n9f7xmIXChxfntMXYfDKL7kI44Ke5A
	oPsWKLtZDcd2NfPzcsElOFI/g3N8U4Qz/ulZizLG5EnCTRwLwiHlHX915z1DSJQBkyFCq5bs/0b
	PYRpjkpG+avOSGkLwr5KxyTVv7lZ2mAgaybqsQjb3Qp2Pru70ckcoTxF3lTz7RWFfZmcVgkSUOM
	bvhjeCp0evcvdjS/4nYnvHH6WM7qKUvew2DtqHnLyN/dFlblsA==
X-Google-Smtp-Source: AGHT+IHQVlYS6aYq8WW++lgxdknQoz1+xqr0lH079FezTgl/uti7NF7HLDu0SbDJ75R5kv5gMEBdhQ==
X-Received: by 2002:a05:6a20:d503:b0:1eb:3482:9d27 with SMTP id adf61e73a8af0-1ed7a5d53ecmr16566389637.32.1738282741172;
        Thu, 30 Jan 2025 16:19:01 -0800 (PST)
Received: from fedora.. (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72fe6429218sm2148234b3a.66.2025.01.30.16.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 16:19:00 -0800 (PST)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	hch@infradead.org,
	urezki@gmail.com,
	intel-gfx@lists.freedesktop.org,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH 0/2] vmalloc: Introduce vmap_file()
Date: Thu, 30 Jan 2025 16:18:04 -0800
Message-ID: <20250131001806.92349-1-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, users have to call vmap() or vmap_pfn() to map pages to
kernel virtual space. vmap() requires the page references, and
vmap_pfn() requires page pfns. If we have a file but no page references,
we have to do extra work to map them.

Create a function, vmap_file(), to map a specified range of a given
file to kernel virtual space. Also convert a user that benefits from
vmap_file().

Vishal Moola (Oracle) (2):
  mm/vmalloc: Introduce vmap_file()
  drm: Use vmap_file() in shmem_pin_map()

 drivers/gpu/drm/i915/gt/shmem_utils.c | 23 +------
 include/linux/vmalloc.h               |  2 +
 mm/vmalloc.c                          | 97 +++++++++++++++++++++++++++
 3 files changed, 102 insertions(+), 20 deletions(-)

-- 
2.47.1

