Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5386A207A3D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 22:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744928406; cv=none; b=QnQr6oazZu6TMUvAy7Mo1YDbzrbdRiDP3OIzOLxo9K7px1ZaGDbvedBTPXeE1Q2rOWn278BR1Df1OcUwCMJqqwhq2TPkI2B7ZBTZnxU0LHBllvLYMDXNpMeGFN+BDcbD/Nmvsvg448ChF/gbKBmL6PXggtw1Ol2YaW4R/xrF1sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744928406; c=relaxed/simple;
	bh=fog5CWESXdKx/6ubejMM0siBLnev3SMvqMgD/8SRGwU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gV3wlno+ZfacCM5YJACAQUzuEcJ7kMBr0Er3DjnoodOPtZsZ8r5jqwWb+V3OwYux0BYpr/OzJCwhL1pm5jpVLO6V+Td9gPT/LPAFns7UsRcEKquqgPmMOZADZtVFt2WFBcqPDn0GFRNYUBUzD+NtyxDCvPxchvS/H5iAs3talmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ik1Oou4+; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ik1Oou4+"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e6c18e2c7dso2408722a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 15:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744928402; x=1745533202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rzrckr4thNI+C6JEdU5Aeb+FsaAEqlUQoawPDha4Svo=;
        b=Ik1Oou4+f4hQz+qzOru5G/kx3ciXP0JOK3Vequ2nm4uGyG/6ecVW/v8rfgyrUWcfwF
         mNOFtZKDptUISMAhAcT3bA4orDOV6a/8kRAK+6tbX0Hh2gVGJNJkPyOr1pygjz0Uj4pt
         IkpwWrEqbhworyKn5JrWJFm6MSbIS6fVjpH9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744928402; x=1745533202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rzrckr4thNI+C6JEdU5Aeb+FsaAEqlUQoawPDha4Svo=;
        b=qWWu4zMMHQ5VBoIxZUu1W4yAhhlUz11hYdumY3VosniAWPXBYf7UPMzeo5FX4uACQa
         nlRE4ewTMKA2QckjGK2KCd5zg6z2GlSHnyD5S3PcFmoqkFNSmdKoGbJ6NqOHttXOWIfY
         16i8vxRlEDWxKrBDCSNbRnNaDp2iUfh+PcyQvNs4E0s10Aiu1fbp3QdKAjvdtt7d9aHZ
         sHvgyeyJ9elcGsAhVzyY0hjTOUx5r3o8Ke9CZ1pCHNrEzv0atIx50N72gQbCkAABWRFK
         naEtMPT2fA5DikAM7i+8FvvvQg5UvpVf6RH6iKIoXk570Tq6JuBxUnwZKukajJmTkB73
         9xLA==
X-Forwarded-Encrypted: i=1; AJvYcCVqECma+7rJL5iLpqKisCy/3a/itNrji757yFzoWpB1PiZ4Gmx4Ydw37qL5/kmsAmhty5LLWfEb5wqk8ws=@vger.kernel.org
X-Gm-Message-State: AOJu0YydE7EVRj5cpALP8w/8YHd5hzj2cSKTPE8myLK6gu/Lv58yvwOw
	ohQ/3qDYY2hjCSNmSaeGUAqPaGgxSTQBClQa7CKc0xQZK23ulEOE7yvwgd8lAA==
X-Gm-Gg: ASbGncujYnBIfYrO7dxy2AbASQ/aLViskyTooOgJN4MGxjRaISn/WZWbG3yQOYG4zSy
	6EWbXhJIxFkzHoAEsXUcEzltsr/6Crf9+nYBAriA/bYigmalQVNnHNseiCAttiTNHkVc1j66ap+
	P/yKfw0N9SpWfXUC0rIvhV6sZPaH589eVU2nqDVsc9cwqztUwhbOpqeQJMZ7KIJRM3oWvI9nCZO
	ryz6KWDvy3dIOj77z/gGnummIwsDY9Ada3RU2XyH5/rSlJS6yM/vTKmiwCzT8pz8/49uAgAT6Nk
	4XPeC2g/6yLri1mgQ8XM71C/+HjaM2YiYA+OyYxVm+8J4h9IzePwtSYMifQrC6Ivvr9Guje/nve
	DyN6GOXVrVAn9+oezECGuwaxE7yLGjDhR9Q==
X-Google-Smtp-Source: AGHT+IHHIANGDHuODOVGmA1P4rTvkA2hkLp8NQiSmp7ChP3YmPRmbiVxDn4b/Nka4+tZ6lw02YRnFw==
X-Received: by 2002:a17:906:f591:b0:aca:db46:f9a6 with SMTP id a640c23a62f3a-acb74e52fb1mr31024066b.59.1744928402578;
        Thu, 17 Apr 2025 15:20:02 -0700 (PDT)
Received: from jaz-virt.c.googlers.com.com (8.236.90.34.bc.googleusercontent.com. [34.90.236.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ec0c068sm45725066b.11.2025.04.17.15.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 15:20:02 -0700 (PDT)
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
	vineethrp@google.com
Subject: [PATCH 0/2] x86: add support for reserved memory defined by DT
Date: Thu, 17 Apr 2025 22:19:36 +0000
Message-ID: <20250417221938.579452-1-jaszczyk@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Grzegorz Jaszczyk <jaszczyk@google.com>

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

Grzegorz Jaszczyk (2):
  of: fdt: allow to register arch specific hook validating reserved
    region
  x86/of: add support for reserved memory defined by DT

 arch/x86/kernel/devicetree.c | 12 ++++++++++++
 drivers/of/of_reserved_mem.c | 14 ++++++++++++++
 include/linux/of_fdt.h       |  4 ++++
 3 files changed, 30 insertions(+)

-- 
2.49.0.805.g082f7c87e0-goog

