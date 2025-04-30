Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACE81DF98B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746002543; cv=none; b=c/1yldervfAj4zQVpurAB2Y9diqT4Sf0POpbeHiSFrZ3jpRhXTiSNB0c6dTEfSSCdugSEvXoj8AU58hdc0h5hRmA/GxVCCMZlpvDuBrIlDsXDhi0I0sfB4QV83sTtdg3txSFQsp3ihLV5KCRAOIWEMSNNxU0BSpfiTPq/mh33dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746002543; c=relaxed/simple;
	bh=GKW8F/esjma3xIisnNdfmxgVLhg33OtW33/8gKmHAKk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ll8dz3sKfAtMx6aOqmJo8TDfsJ1NHYkL36wJ2Pf7Kgyvq0CzOphSLL38grp7uGHKNww7G0Ix+kcOW+zm+7J7BmL3Ze14NrhjqzkYBXAX/z7jxDUwTDfdUa3aScwmusl3EuKwM/wt4p+UARdry42/QtaDNAvL1v3ACF/S4NEKFuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZdP3hXK4; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZdP3hXK4"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e677f59438so10964094a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746002539; x=1746607339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=92CUaGQAbfLwUOAfwUK+51NCmaqkCK/WvaTduxkGT4w=;
        b=ZdP3hXK4ynRDOFi2tBgcCpqZ11Uhc2Lr+dg3S070NzPMjv9vrjF8vSR3p/4TT7gn5z
         w74qgnwm0Ux/CEVCuYuALSGsIFve3AuElAG8I0wkNJQqHD/+2X1hC1T6rcSX5cFTqz4I
         AaysfU8cLxLT7xvaaL4mRXYhgaBK7fuFyAMek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746002539; x=1746607339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=92CUaGQAbfLwUOAfwUK+51NCmaqkCK/WvaTduxkGT4w=;
        b=mOl+pddKzsErBPLobS2k9z62u88XvZ6scVlFkDsWUYhgio/mKX0qyGdhAl4AnVdeCa
         Ty+3gi6fK4zx0d+8QxbLn2iZG0Pq8SZ/sd+lrJhD+SAhgacWC8CJEs3A0TjXx2OhUZvM
         aWqOjXOaI0IpKHish/s2QmtG/5Y7SoaJGlQ8OY4Tp7d39xbMZnpkYiLY6YJ8ZTZwvc0S
         qAV895Iagxl5Tmfm7w4E86bfiBhyXytB8OLGlB4YPn6fAZVyYQ9Iur2XldNr7UXBfRB1
         i+Ep9CLmB4bAIhv0Y1oYfKg30i89FEh9Ugnv028U38Hs54ALwZ1VfVUzxQjEIp7lSTRO
         c5fg==
X-Forwarded-Encrypted: i=1; AJvYcCWHCe/nz0/sPd1H4dFE9VSWsP0S6eLKhj3eRIaRnNTGQzDKiZYt6pIhR/1pFHVqiAEbox43LiSo3ayMCq0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTKxYnKN/MjPpIbc96FfjW8jboN+SvTBLuhZcpe5Oq+GSSS35p
	t4hz1BdWDpjKYQ4zWCDqwP1LXnx7YMJYnWusIg37IhWYHhdNvP7zGlvY+n9uIw==
X-Gm-Gg: ASbGnctbPqaj5W07Pw4vbbrVUbkrSjKGZz1U4pOYvdMEPeikODvUnmS8VWRpvoeKO7C
	7XE1fxEVJdPd7G6C3GVJ7K91RuHIuGxM0R98N6/DcSNQnouFl3YscuQsDhXig7UbbDbwC1u7Oks
	AxtUY7w/9cxuEuM9JyGP9px6YBgaxQYfLputR2FuWRM189E1SxMpl0hCrbkNYVE16K7Zs0Y7hPO
	agUFD9n7jZ0uPtptEKjBfSUJkbDJVOCyzf4g1mzoha8NOPJ7mN36ab5reXGF4nEU6Og7oqo5aCJ
	05lfVo4Ml3eqGXnzeJDmXBuonkAWnUfemkImLvW1dqTYfetHK0EbGYULNi1e90SLNEtfZ4Sbd6r
	tbMZV08trYM1jhPxlM+to4sQAFw==
X-Google-Smtp-Source: AGHT+IHxx+jvJKhxJN5DAz1Pj/9fep2nbrC9HiPTHd7+BrSnkhxBr/I4PsJYRNJc5L9MSoHlnuyC3A==
X-Received: by 2002:a05:6402:50d1:b0:5e6:616f:42e4 with SMTP id 4fb4d7f45d1cf-5f89bf1d74cmr1957760a12.27.1746002539157;
        Wed, 30 Apr 2025 01:42:19 -0700 (PDT)
Received: from jaz-virt.c.googlers.com.com (23.31.204.35.bc.googleusercontent.com. [35.204.31.23])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7016f5342sm8351783a12.35.2025.04.30.01.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:42:18 -0700 (PDT)
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
Subject: [PATCH v3 0/2] x86: add support for reserved memory defined by DT
Date: Wed, 30 Apr 2025 08:41:36 +0000
Message-ID: <20250430084138.2287031-1-jaszczyk@chromium.org>
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
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
2.49.0.901.g37484f566f-goog

