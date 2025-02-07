Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF6C33EC;
	Fri,  7 Feb 2025 17:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738948925; cv=none; b=aSAu44KdpTipoPFPNzcP6kYoPLNhZ9qRBfrEngVkNC9R0MnE92AgRd5h4bsH0e6TjXwxsJS61g7eGMh9j41ZRZ1Ejb5C6RK42yb8junv6frbhm4QknzZs1Hc/3PBX0UNr1tWATs6CFzKr5cCep3YYohS1RFLhXjmpeYwdgxQtJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738948925; c=relaxed/simple;
	bh=F6saKOuYKwll98yUlD5RzF7Rw2xWw9P2OMNsWIabYd4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SaOoNGwbkxvR6N/Xgg7Cr2VsFc6H0ZeObKQltDSBiTnwCUAfE1WgGGHfYRgwype3CUsMnEy1AAGmFFO3nEJpxMhMYm32HH6m9f0i5Ymh86FCUdZXzCTFRe9/GZeBWUnZy8DHPNbafJher7Nl8ThiM/dAvalN28BuRcYEu+9c36Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fvf8V1Fu; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fvf8V1Fu"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6dcdf23b4edso19850456d6.0;
        Fri, 07 Feb 2025 09:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738948923; x=1739553723; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i0jQusLVjmcEdcJUsjZrDDX/aIkifG5xyFRhHncB574=;
        b=fvf8V1Fu3rFB9XzGjDlIO6xdAlU1qHhslOqhIT7gH0hPsGIZSerpP4JZZhK+rOoRpS
         lvFX5qzmF5y0MICw5meP/R8Hc4Y5rhykyI5x6Jf7ftuNS0BubY3UPFmIEWHdG2uIZuZx
         cLdggQw2qcSLfFp4LCz/n20gzzI2UvuF8QWPwYk/H/3q3ukKlT/8I1wCYnjNOnfMOJkV
         UjnspQW61NplcbyfRhYA3nK/YUUcV2RGTj+Z7GVL7uF6M7RVkdvQjFFZ5JHWQYcvCcQ3
         CLmyibOuBBrfe/4HfrnBj97cYe8namuSNWUvSWM/LQCkVjeUdGVUxOHQ611ovi1O/kQS
         WRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738948923; x=1739553723;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i0jQusLVjmcEdcJUsjZrDDX/aIkifG5xyFRhHncB574=;
        b=O1t6MUOQO/ZUpxXr2U8BAbvGbHE2e0iuIXRrngqnW8Q+bq8qetMQvwWoa4YWYfyq2l
         Qf4rkKVnD5UdVrgkJsxC73KKT3NjZUC0fNR0/eOLCHVLDTirqKSJpYgJCKiASThp4Ycj
         ewVkjzVvm69XkXn5tNNLVn3kZZ1gzc3ebG7Pc/MVbmQzZqUalapeMkHWosCnV0ngrwGn
         9NOI63DG1a8kw6SHQ2L7VEimowN85KVoeTDvRHjL3Xa7sS3LXRUJcLGyqIthDnu1DhlT
         nHSwhr/sIh+DPVcQG3EOuNYfhXeMzwVrAxYXiRu+EC6MFklPQmvEc7e2AWku6N+l9z6L
         oBog==
X-Forwarded-Encrypted: i=1; AJvYcCUNmMKx55I/P97bjVyW7zp204+jrW6lWjq+p1hqF6Wg7kMMpBLU9smQbuFu/Mc0E8/Lu/isrZ55I5L2/s4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7btGpwpcvYj9yq5vsX3D16Xyxp+O9v/6EM1+oLF3NeBbcxgHA
	QJZjS2b0/ZGi4oK/a09bmY7RrIj6z3VNRrgBLsyJokmUgNhdIkUt
X-Gm-Gg: ASbGnctynImgO70zx0uzwLaRX2aubBNgGOgIg4WUBR31FCDG1RxJJ1dNrdLPHYoQ7+F
	9SNwGRi7PyFra7RyaCQh+8RWdiktciSvDS04ap6xQGvbLWJIwILs60JGytlSqGivFCezBIijvyD
	Ba9JgVR3ldIPew6TIgjTmFfI+5NQdNE0yz/AF8cfIkfdqu5sXAYqczBptr45TlpsTSlTJJidVQA
	8ffOn5idxZ5ovfpYy9inrgwqbEie5/fCNWiFJYjz7TVHvHL2fYx27RhQk8kwlOT4TVoj0e8i8yz
	gypCRHIT1whK0UEIUzQl7MOuenYkCY+blsd7+B4ZQzCWUs8=
X-Google-Smtp-Source: AGHT+IHoUXEMaP6obo6DMG1s/ySdECgGCnYRm6KE+L69ErTzkmUz7xbr4DptrblobnYPWt2OWfqrmQ==
X-Received: by 2002:ad4:5742:0:b0:6d8:9002:bdd4 with SMTP id 6a1803df08f44-6e4456d9c2bmr72195176d6.28.1738948923053;
        Fri, 07 Feb 2025 09:22:03 -0800 (PST)
Received: from Tamirs-MacBook-Pro.local ([2600:4041:5be7:7c00:fb:aded:686f:8a03])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e44eb52460sm3159646d6.8.2025.02.07.09.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 09:22:02 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH 0/2] rust: macros: fix `make rusttest` build on macOS
Date: Fri, 07 Feb 2025 12:21:51 -0500
Message-Id: <20250207-macros-section-v1-0-8f018cb05a20@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC9BpmcC/x2MQQqAIBAAvyJ7TjAhhL4SHXRdaw9puBFB+Pek4
 8DMvCBUmQRm9UKlm4VL7jAOCnD3eSPNsTNYYydjjdOHx1pEC+HVVZ0cxoguhEgeenRWSvz8w2V
 t7QMgRNEHYAAAAA==
X-Change-ID: 20250207-macros-section-f7cddc7bbdea
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Tamir Duberstein (2):
      rust: macros: improve panic messages
      rust: macros: fix `make rusttest` build on macOS

 rust/macros/module.rs | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)
---
base-commit: beeb78d46249cab8b2b8359a2ce8fa5376b5ad2d
change-id: 20250207-macros-section-f7cddc7bbdea

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

