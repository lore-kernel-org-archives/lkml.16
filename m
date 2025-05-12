Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACF6259C9B;
	Mon, 12 May 2025 09:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747043782; cv=none; b=Cx2u+jSrbc13pEnlBLFGfwIVawGA3wzol1x9st1RUf9V96WCrp0pzbRCO0kSJb0d3CYQqFYafV0LS1CP4a2aH3pM5tIqcbRU220uN/DuWE4l0hrrqxW+I0Whs3JonBUgIhBs91XfwKniHCy9tdCic+4FGGG2eLqimE7yhkJPNdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747043782; c=relaxed/simple;
	bh=OlbebHoLu4LXG8M5DHLeD47dN2+hbpUNsw4GjMsaE6U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pSO/9Xb4gJG7DGyFkBGp6pWzYZVHXLJDasXm7/263SX/zEUV+lFJlxWLdh3bs+nNF6+aoIE7WrXjjDa9IgdSZ6ju4mw/oZhhVZSkyxv2QSfDE4W59sjHRYbHlKSLj5hXNj0TG5A9eV2Bw03yneJL9DCBUCjnpW4Zza69lFcQQLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TTcIeneb; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TTcIeneb"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54b0d638e86so4772688e87.1;
        Mon, 12 May 2025 02:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747043778; x=1747648578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n6xGlGBkE1m8gu0/rjDmatj+Hz4dtijC/JB0CSfGWno=;
        b=TTcIenebahkJuRXSJryxpnnfBRwKKNCrTfi0Gr5gretwOgLHI0TQY/M15jpe3d0tNu
         WCpixKQLwbmBlfuJImgxGu8iErNxQw/4Kt5UVEH8Th0eT4rkyhJI0YmVXsMUgnndIrRE
         GUut89zCGWVvkUtMKHMYwTCKdH28DkdGCxd1h5A/DWKQ4x55sZIu7QZK/Mg16jT9D2LU
         E7cyo305vb1gOJvitiMgCJIN5XIJHNB804ytz6DGnAfHt4OFZS+hJKiTUThp2VTYAaNp
         x7KFrG1Ryx7wzCDhkXroWsHu/0wsTDMl+146ECFMTt/NNW4XzS7VEKqDSQKGRsV/HFDT
         Qc1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747043778; x=1747648578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n6xGlGBkE1m8gu0/rjDmatj+Hz4dtijC/JB0CSfGWno=;
        b=VuSrbMLixtb3Dllzcy7tWvQ18vQLuJNWmT9rP1g4x+8Qd3nZbDZ466oslBAPnFtqq4
         7u8G6lRYLoNOwrm8heOb9ScZMmbY7enXhiu6XzECSaRKBQ2SN2JGX09vT4DlE6y5zFJb
         xvlLHdgYYdS2atQ1POMKi4D0weFJ5xHCkyouqBQwIxtHt33dHdkGMlKCcDjYp2POje0V
         A96+IWWpdMXocfW6f9edyDrNfPYuS4JDGjV1yBr4UYfcdv8MAnZ+e7LFJ9WIbdWx2zXc
         lKBBbF41qjS9muGeZuD5k22YhvXGDMUOSRwjXOzVba3b4EIMXOFNoitijMzsmLOfw9e4
         Pdeg==
X-Forwarded-Encrypted: i=1; AJvYcCVeBtZLGmY8xbajFdVLsYzKNnURciCK+CX54Nes1Fu5VE+2aRoydqXxnT/k+y0uWaVOhWmziDOjt0LzISDPaSA=@vger.kernel.org, AJvYcCVuHTimskuKtx2GyGyzQFC7KQM5e3lI437fTCCt10m9F0fn9JUGD78ye9d9t97jHsnsesLhC8YpU0cMZ4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBhDI5TmVj4K00/0sqy2QuA5BSkUr6ihdAFGWZ3idWCO3cRyZh
	4CTOPPiKbOG+DciGCQzegXzi1zDt5zDyxV7vAxiiieO+FIjgSWlA
X-Gm-Gg: ASbGnctSEotcwu4YhncrC6qG7KnZ0fCwvXA3OFeA5ZyiLQpTQymR5I0/ATXC8RKVDOa
	8/lpMZaU3qIAHAyUge3iPBBLo/wqYvpi7EMxGFDtx78yN+dzrzjGFvf0935cB45FD2Nf3YzTEzU
	fYmebDtOJOeWoVBcL5EZC+Ffd9JbaPTMmnTKK2kNPjS+P6daWdFEaWbZqBM40VvS3vgVj/I6gvV
	B2DP5ZOG/4kP+PipMl5wbq/maLBj5URDCqlLlCMQbXX9K6nIpbqTEZfBgnI5dMw86W/Nfatjr7x
	obJcYYIom17oc5zlLXEIk1rdqYE6CP00icfW1+fePAq+ZbKY7Oab3aK8fs8Qy7O2bTUppzgia/n
	Okx+4VPEztUXcLJx2CEV2t/WHlfF1jC/uuXsjTsQ=
X-Google-Smtp-Source: AGHT+IHVWWri4vLZs2whHIUJWvjl7yMbyBdtbTF5UREoIyZ4wrhRYZ7fIdThZCbA87BC5h9ImJP7aQ==
X-Received: by 2002:a05:6512:4408:b0:545:944:aae1 with SMTP id 2adb3069b0e04-54fc67ad8bemr4406415e87.12.1747043777823;
        Mon, 12 May 2025 02:56:17 -0700 (PDT)
Received: from abj-NUC9VXQNX.. (dsl-hkibng22-54f8dc-251.dhcp.inet.fi. [84.248.220.251])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc644fa48sm1460449e87.1.2025.05.12.02.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 02:56:17 -0700 (PDT)
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
To: dakr@kernel.org,
	lyude@redhat.com
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Valentin Obst <kernel@valentinobst.de>,
	linux-kernel@vger.kernel.org (open list),
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	airlied@redhat.com,
	rust-for-linux@vger.kernel.org,
	iommu@lists.linux.dev (open list:DMA MAPPING HELPERS),
	Petr Tesarik <petr@tesarici.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Sui Jingfeng <sui.jingfeng@linux.dev>,
	Randy Dunlap <rdunlap@infradead.org>,
	Michael Kelley <mhklinux@outlook.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>
Subject: [RFC PATCH 0/2] scatterlist rust bindings
Date: Mon, 12 May 2025 12:53:26 +0300
Message-ID: <20250512095544.3334680-1-abdiel.janulgue@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Here are the scatterlist bindings that has been brewing for a while in my
local tree while working with Nova code. The bindings are used mostly to
build the radix3 table from the GSP firmware which is loaded via dma.
This interface can be used on top of existing kernel scatterlist objects
or to allocate a new one from scratch.

Some questions still need to be resolved, which mostly come from
the DeviceSGTable::dma_map() function. Primarily, what if you call
bindings::dma_map_sgtable() on an already mapped sg_table? From my
experiments it doesn't seem to do anything and no indication is returned if
the call succeeded or not. Should we save the "mapping info" to a list
everytime we call DeviceSGTable::dma_map more than once?

Hoping this initial submission will generate some discussion. I'd like to
acknowledge valuable feedback from Danilo Krummrich and Lyude
Paul in shaping this up.

Abdiel Janulgue (2):
  rust: add initial scatterlist bindings
  samples: rust: add sample code for scatterlist bindings

 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/helpers.c          |   1 +
 rust/helpers/scatterlist.c      |  25 +++
 rust/kernel/lib.rs              |   1 +
 rust/kernel/scatterlist.rs      | 275 ++++++++++++++++++++++++++++++++
 samples/rust/rust_dma.rs        |  14 +-
 6 files changed, 316 insertions(+), 1 deletion(-)
 create mode 100644 rust/helpers/scatterlist.c
 create mode 100644 rust/kernel/scatterlist.rs


base-commit: dd21715de3dfa6f6457432ce909e5f7eb142a7d2
-- 
2.43.0

