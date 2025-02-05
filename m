Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAC320C028
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 03:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738725279; cv=none; b=DdlXX5Poj2NLJqwyi7tt++ciWdF1zCnbU/0YZVmoPuqsr7v5VLK1PJgk90Y3A8v1A93EXD5r8B1EK/6uGoIpXv4qy3e2cB8TyF1vBikZGptAy11Ht7J1iq7URoTcKAlTgNZAUd2Z4BtXUoo52GIWQsAJgIHT7d24XGBt8xktRe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738725279; c=relaxed/simple;
	bh=0Sn9GaXZFrryUTSxKfT70QrPR+o+tlFtxRyHWIRxPwk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uwYcIpoRH90Ubgx8qPcAUT2d7P7Qwjlm7/x9bzj2uricdLru9BCoJqKiUgJZw8eGeYFO9+b3MbOsTkqWZODY0TJ475ej/2+FGHHZyUe2vUT9qDy0rsxvhjmYH2NCLrvm1P7IQ3pwgCJLrvx1WrAjQ8oqL6MxrUPDV2hlNj0603I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=C9xe+vqe; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="C9xe+vqe"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2165cb60719so114901435ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 19:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1738725277; x=1739330077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UYMUDf0U+sam2c6CFInFyZHHseSO9b7zpf93O7tAZgA=;
        b=C9xe+vqeoMHo+e+IykpYffj4wbx3BXw3Hp+tALsKwO/1af9zIiB8Gn23gn0tjZSIpd
         BFzMSNlFlZAy8xco99ZRb3QQlyoErZQ1U7BHXXBzPU0XjDxOjYCtAK+lsM4blWoPtNhG
         VS3AT8Nj+uUJrO+4NSrBfmE1ni0bNmdTXx2XSRQxg4RjcEfseiEpxCSCDUoq9O0BaoQ6
         RkTJ3sLOha9omwjAsqEKWFTQxKkvenDv0Iw97+WQzpSOyFZVoRQQb6OtlGUyr/sxzGjQ
         6vFnLIWcEqT4zc9kWRXtf5ZDgaE1eig3O8y8stEUwhkQ4x09Jc8q2i10YkQQggsCLSQX
         0bEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738725277; x=1739330077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UYMUDf0U+sam2c6CFInFyZHHseSO9b7zpf93O7tAZgA=;
        b=iPpw77OcE8Ml8ArPB7tg/JIEX/waP8xfIXpJZMb7FJnkczm4EKQIHd8fNaYqdr+FKr
         74Qi9LWb7i4cZuCgA4FHs9U/8LhFL3bfatEKKog1uRk2SKJ2ZUKUEGfAnNr+3gAa1Ocf
         r2YCQ9stG1kazmjP7dEeecmDjJHDSnTgf/cKTo2g6ZjAB5N+vTvjVHGDtR5KRmMyuotv
         6llpsvjmj+0tisRbAAUkSkgTT40kflMfd+Ezd7ioY0jwmeTtaTaSYdWrDN3Jk/PTgutF
         //65GxEX72tGjKoUK2umwsLGAVtOBtPmvL0fyCi5iyZcBunRcfiojMNG+FGgrEP2tfGu
         UAvw==
X-Forwarded-Encrypted: i=1; AJvYcCV2QITgLRXr/Yd70yk0IEgrdPplBTzcpZ9KZ25faO6wWZRZBG70u6vs9+l/4frNrWsLO5FW8rY21XmDsMQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Lyh8mezXRlgYXZ0xy5GEfjX1q2dVXMLx7Jd5GEDsdgHkHxq6
	58IG5VK/wZAPyyiQ5rj3etSiSB59nESiLGW0Q4SnucbWCSljqVSPGuQqsXYWIzY=
X-Gm-Gg: ASbGncvq8EwTmpxhXf9STB0VW95zolt46q/QN2nY7Lh5tWeKhX6Xrp/Wwbv1tTOnrEn
	cuyWXXEUi4yrQ/7TymAmbpreKv2/XOVrDT6g0GQPl+s+y9xXMaWgEFOXviUi4IFi9NABTv2BbW5
	hJE1F2LffkGbiIMdH7YuaoNK0UcTKmXxrR++DKzaVXCVS4feyEHF6fqvAPUueJ2QAJe/U0N/Mqt
	lWIO8tLf/bMQjoX17/kouYNoddo9jjw6ovuA+u+GrBTdlnpSQiMt43S/D3zeXy2w8aFKIlx00NY
	Z7KhmMqZjpUYf6+RpMKJb0oeQtre3x19Vospc5xC3KYJDBdqRQ==
X-Google-Smtp-Source: AGHT+IFDPCWHUwtXqg+k70YQs3UcC9V7LP3BF4/Ea4bhDSCyvX6XTQ9pdwUU2CcxAcZ+siU2q2RAZA==
X-Received: by 2002:a17:902:cecd:b0:215:83e1:99ff with SMTP id d9443c01a7336-21f17e48cf6mr17420455ad.27.1738725277309;
        Tue, 04 Feb 2025 19:14:37 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de330342asm103509115ad.193.2025.02.04.19.14.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 04 Feb 2025 19:14:36 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: xueshuai@linux.alibaba.com,
	renyu.zj@linux.alibaba.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v2 0/2] Fix dwc_pcie pmu driver issues
Date: Wed,  5 Feb 2025 11:14:23 +0800
Message-Id: <20250205031425.67265-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v1:
Only sent the patch titled "fix duplicate pci_dev devices".

v2:
1. New patch: "fix the incorrect reference count".
2. The "fix duplicate pci_dev devices" change is made in two places:
One is to remove the modification of the PMU name. The other is to change
"for_each_pci_dev" to "pci_get_domain_bus_and_slot".

Yunhui Cui (2):
  perf/dwc_pcie: fix the incorrect reference count
  perf/dwc_pcie: fix duplicate pci_dev devices

 drivers/perf/dwc_pcie_pmu.c | 62 +++++++++++++++++++++++++------------
 1 file changed, 43 insertions(+), 19 deletions(-)

-- 
2.39.2

