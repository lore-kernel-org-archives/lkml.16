Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DDA19C55E;
	Mon,  2 Jun 2025 08:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748854493; cv=none; b=VHNZiF1meHltTxPraqqZBlXTQTKBexWwUm0CqdnLr1xiPySd4KrBEn6ESr+5WunJi9IdXkrdBODzTO4V94L7UXqtmsDvXfB2WoIZzoI0IMt3lvOhkyWgZUObCiQ1M4cQ09CIasA6xABGhbSvHFVkW0gU9s76h3YivDwhAE6drf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748854493; c=relaxed/simple;
	bh=MLcNJDKV9gsnJnU6fEk+vYT6E6DBe92pvFdpw4BYUG8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wm6On0FDI0FrVAkF9aU/LCtmTFIg9qOPz5GzqeGJ0CM7Yne7LpNACbEnl81qSf4/Uavj+x+lJZLc81icMQIQwrDn2hYFzUAVVwLgym1Se66216Bzch7N3GwCesCZLDnSr7Hn2KEv+k9AgYUiTW/2IGW55cgC/JELNhvfGEkiGFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UvX+hFaF; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UvX+hFaF"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54e816aeca6so5384936e87.2;
        Mon, 02 Jun 2025 01:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748854490; x=1749459290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9+telj4p6ynVQKOKj6b/gndQEjhkehuFQNwZjD1BmKc=;
        b=UvX+hFaF/PNRhpZwqiu8Ei9ppMpQV9ZioTq9kK4tKHAYh/28QAg+cqXS8EU88+lv0S
         C3nnrgc///0OUjzWaJd7NYq7CFuC7bplQqYDQNIAiFwqz/ydwRnIolu8UoIgudza3jSo
         TsxX07lw/BxmZSL+ut9yt2ES13tUrEGkBy5rP4CItRorGubryKn7/sRjlPV2yCAwgkCh
         zOe3f5GNukciZbpEU5CSUvOEC/aep7tEMiOk4NJoZwncz+MjO322Me8YbvVP4PFR16LV
         VKbJEVJu32fQf11gcWCGmJ+Zn2y42OfB61OsoaKGzHoXzvfPoUn2crWVqJ+45g980419
         vkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748854490; x=1749459290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9+telj4p6ynVQKOKj6b/gndQEjhkehuFQNwZjD1BmKc=;
        b=k/S7FX4JkL2E0aBp4OmkYejmDjQnEzi8rs6OvuDsZxYdZsOHvgCooZSN5aCWTKkolI
         WyIlB7S9lcsxuoX9l6ABiFZSyDJJKuctyMgtTYYjD5BnnWgFN5U5IDbCKLwsnnEXy6he
         3xXiTOwO6iib4RAn4K2xKO1Da6hN8QyIFHYvDAteloYpZI0Q73o688Gwz2eQU4Ezh4Mm
         ClhCi+47VXkwBToADzo1SkIUL0HkymSF+Do+RT3BcJwZ21MrjjSvp4clRXhPHx0KRjY5
         0nCURCEUbYSDeZwJhn8Uwz1Nnvw/Q/dGDhUCYVdO4Hy8L511lc7WTGBA/fSXwuNCe8ZH
         pxKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXkzfrJjWJl8Uh4ZMF88JpmfsGsWkor3hqK9ft3JqFS3DiVcXDTQHmteFgZW3guZ40bcg6fmqZcDS36vNrWp4=@vger.kernel.org, AJvYcCWwrygLpipLej73pKeYZOwbVfLsVsp+G37A1tn+vn9JDOna1neJKPRXREsW3KoqVVVQN78/IRxjBF68G3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWwSqB+9lrLX2bzhOrobuBgA2+FRF3SMVCPq373XMKp0Z2PLib
	BRO0mpVk0QfUhjH8/7d5n4oFsGi8aiUKD/+RvZH7cGxXgPtZsCXVHPQY
X-Gm-Gg: ASbGncurG5NJla5u5FopDi2gPPw3RnKaMVO5tE2JfULGCm8VjOmCc2B1RIULXUHjP/+
	Ke66Y7Dd2DHlFbtTqdzmEX4tsCC1eUSJs+zRqEK53iBC80NkG1C79tXtyXeh5f2He/FTOOAwBD4
	DBiKTUVTYFQmSQJOEdYWhtiMERdkfy/iMu7nrNZD0013gGett4xka36ukueyW07gH4vTF8WhN+n
	1P20c6fTpsDFn6Cod+pQyVkFxxw1uQdXr6LpowTXwjTa/5RwniVQqtC9vjQ9DnHe8mARwZhr2ZD
	3QD0ZxyBUIjLmrCuY8h5zukEXGd2tzWZHdtP3VN9MMc7PC5+f8CrcGKNghY68emjOYTwg+93MMO
	At6B1k2jMRiBP/nguY2LgbgQrodj3
X-Google-Smtp-Source: AGHT+IHo2NQcKatHJHFatk8XSmAeedAW4NR6jRllJ8AjxcE10Os+h8aPokKup1yOp0ML5QiCKq5SPQ==
X-Received: by 2002:a05:6512:23a7:b0:553:2668:6f32 with SMTP id 2adb3069b0e04-5533b8e0fccmr3937492e87.5.1748854489451;
        Mon, 02 Jun 2025 01:54:49 -0700 (PDT)
Received: from abj-NUC9VXQNX.. (dsl-hkibng22-54f8dc-251.dhcp.inet.fi. [84.248.220.251])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553378a13basm1524325e87.81.2025.06.02.01.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 01:54:47 -0700 (PDT)
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
To: acourbot@nvidia.com,
	dakr@kernel.org
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
Subject: [PATCH v4 0/3] Additional improvements for dma coherent allocator
Date: Mon,  2 Jun 2025 11:53:10 +0300
Message-ID: <20250602085444.1925053-1-abdiel.janulgue@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v3:
- Improve document clarity and move the range checker in as_slice/write
  to a common function (Alexandre Courbot).
Link to v3: https://lore.kernel.org/lkml/20250425073726.1027068-1-abdiel.janulgue@gmail.com/

Changes since v2:
- Rebase update, add fix from Alexandre Courbot, commit clarifications,
  minor sample driver improvements in error handling.
Link to v1: https://lore.kernel.org/lkml/20250410085916.546511-1-abdiel.janulgue@gmail.com/

Changes since v1:
- Pull in reviewed-by tags and include links.
- Improve error handling in rust dma sample driver.
- Clarifications in documentation.

Abdiel Janulgue (3):
  rust: dma: clarify wording and be consistent in `coherent`
    nomenclature
  rust: dma: convert the read/write macros to return Result
  rust: dma: add as_slice/write functions for CoherentAllocation

 rust/kernel/dma.rs       | 150 +++++++++++++++++++++++++++++++--------
 samples/rust/rust_dma.rs |  28 ++++----
 2 files changed, 137 insertions(+), 41 deletions(-)


base-commit: 7a17bbc1d952057898cb0739e60665908fbb8c72
-- 
2.43.0

