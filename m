Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88E721C177
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 12:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744980486; cv=none; b=KAQ5W82ctLH3UZ7QqAQ7bEUwQKcC0IwcTQl3iUoMGKjZFb5l0WGz4w9CJo26y9sOph2mktw47Nkcfjaqcy3U8+mrcKau8T0JaZNsbnvmjY0iGImbtKOwLAWuI9hnEfkSSIHczg3wju5JkA+zhClFO+5kZA4sP5Vbw36ApVF6Hgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744980486; c=relaxed/simple;
	bh=sm0Kja+j67BaId3flLiV3IkELMf8gW6ME9Do1RU0r50=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IV3btJSnhazRRrLM3jK7O7VkFUHaIsJuE99beKrvQ2MO3x8Rd8nqmJcSCCK3nvvTlQgPtw9ALlwlNso21+J44ylEUvjyzi8/3KvqfLE4i5tOKnfm/aPija/P5hYFy15+R2RiGGFm3HeB/cKmhDpsKJ1Z4loIkPyzX6cETNqROq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YdudIM1t; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YdudIM1t"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso338670966b.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 05:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744980483; x=1745585283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L2U3oS9FEPs7BLcQpWAz8ZLF+X/aLkc568YRZ0unsNs=;
        b=YdudIM1tyH6lA65vj8gMfn3en913T/vkoe0PvXmJF2Z1gAnSicqMlAg/ZPyHH2kCtE
         o6+1U48MX/v2fNlojIy8L30hvs4haZnelmYkiTF0lhWUNgScNhxHsnFSijEVsSBbo0y3
         DLAac6hKAz/IzGOk98BMIjxw9CZQ0vUeTnwLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744980483; x=1745585283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L2U3oS9FEPs7BLcQpWAz8ZLF+X/aLkc568YRZ0unsNs=;
        b=jW9pF1G5tLvRlsOLMTy48jO4QFp3lOuDyY45PxWUfRyvKeGzVXqEwo7xo/sV86xE5J
         OuC6FIT3UOHgghXF85qY3DmZuJ7pL7NOH5ORcwA+uciNT8+Gn1nIAm5bHTfqxuX4icJ4
         szEO26/Hy4I7pwWjM+5ROPXz9yhE+xWfaI9JYpZmO2VWnMCBTUtCLXIJ9SEQMfdelnbE
         B18Q+/o+4Gg5qExshnD7xXSpwQ3a3kogpDdbfaPGKMmLUSpAXXrX3anEvOwe94tOuqJX
         TEpSiOooCEJ/QZ7rzhU6waiyvoF52aMAYGzZKV6duFj2yR2xlTrx6c+vWucr8bBfkPbP
         Sn8w==
X-Forwarded-Encrypted: i=1; AJvYcCWF6B0jq5qN1raWvkpoEX/NrAY+sigCypc2yT0fHzCUhhed2nUY1+uYU5OjMagPyW48SBMxN2MbRZTegp0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXG6MB5L0QMV1aoLkV6ub2jUOiG8GM1yzjdgZD7gEWq+ETNnUo
	45KNDUZ3tOjJZb7L8cqwXPWXFITZnZmLFi+YTt3C+U/7XdQZA80uf/ev9pDcJw==
X-Gm-Gg: ASbGncsreo1+lFF4k+LyeXIUtAV6ig06hfTC1kJHMsR5OrNARlIBuR0qtTTXRjTeZ2g
	sFxkus7PFiKMFI3mFe0Gtf44qQvQTQcipxC1tN5+LWXmadrIs5PkOaHULpz6UpPvVVcjghscXBu
	O2ZAc8JbTSNRBFJ13WmWzhW2rr1QEKKJztD9YbKldokcwbn86RKpKF4WKVhv0myhFdx/hcSbrNg
	1AodUNO2qPIMfIIS6syIz0YxjsnX733FZkkPp/pqdqn0Nhl5PpEYvQgrszsI5tyDqbrADiwvCzR
	Ipei5LzItSRRWFLarIWBTefstZ2JSKUxJ627Tolym/fWuzJVUhRVplOdZCTskgmxPs58p89Kjkt
	pklgHGUzgRNTXIkJ0BWJW6nm3hh7hw5IECw==
X-Google-Smtp-Source: AGHT+IGXb19UX71C2tpbTIUbuu9QFKVXj6WfnL4bV9JsdZYmFiVCY6mWxooalMc06bK0oV4PcWxe2A==
X-Received: by 2002:a17:907:60d3:b0:abf:7a26:c47b with SMTP id a640c23a62f3a-acb74db865emr186468066b.39.1744980482965;
        Fri, 18 Apr 2025 05:48:02 -0700 (PDT)
Received: from jaz-virt.c.googlers.com.com (8.236.90.34.bc.googleusercontent.com. [34.90.236.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec51601sm117445166b.74.2025.04.18.05.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 05:48:02 -0700 (PDT)
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
	Grzegorz Jaszczyk <jaszczyk@chromium.org>
Subject: [PATCH v2 0/2] x86: add support for reserved memory defined by DT
Date: Fri, 18 Apr 2025 12:47:16 +0000
Message-ID: <20250418124718.1009563-1-jaszczyk@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Currently x86 allows to boot with ACPI and DT at the same time and basic DT
support is already in place but processing DT reserved memory was missing.

The DT reserved-memory nodes can be present in DT as described in
Documentation/devicetree/bindings/reserved-memory/reserved-memory.yaml.
Similar to other architecture, which supports DT, there is a need to
scan and register reserved memory regions on x86 for such nodes. It is required
by drivers (e.g. open-dice driver) to process DT reserved-memory regions.

Patch #1 extends of/reserved_mem and adds the possibility to register an arch
specific hook, which will allow to validate if reserved-memory region passed by
DT is valid.

Patch #2, uses introduced in Patch #1 API and registers x86 specific hook, which
will validate if reserved-memory region passed by DT is covered by E820 reserved
region entry.

For more details please refer to the commit log description of individual
patches.

v1 -> v2: simplify and fix off-by-one in x86_is_region_reserved as suggested by
          Dmytro Maluka offline

Grzegorz Jaszczyk (2):
  of: fdt: allow to register arch specific hook validating reserved
    region
  x86/of: add support for reserved memory defined by DT

 arch/x86/kernel/devicetree.c |  9 +++++++++
 drivers/of/of_reserved_mem.c | 14 ++++++++++++++
 include/linux/of_fdt.h       |  4 ++++
 3 files changed, 27 insertions(+)

-- 
2.49.0.805.g082f7c87e0-goog

