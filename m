Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E986F1BBBEA;
	Mon, 10 Feb 2025 18:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739210661; cv=none; b=daBXJwmBkthGdauAdtPOdzBgsw/ES6QMRgTV9FgtPHK/I/1F+q/0hE32spCypDkGOFanvMnivrvmzpvz55uOIIgRjoXmdYSHBodOCUDOHVMd9Cl9UVZ8Qne4ZIuIi10VmaLc0EA4bvkcspBS2b1EfrwPLFhPLHOSTvDHbCYpxM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739210661; c=relaxed/simple;
	bh=SoRH/nPWFkeEUsSCVv1czg7FINQofZ6/jU8RngWhuhA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sACdNnBLJCDbHaM7F9x/TG27B00jiJtU0CghOxp+YG0cLlJPpETxr1Owh7Vhs+M7mlYEvmUtCLsvkfu00LH1+Z9RW6AhmoHIoAxtLANZ8CTME5X4yp+7WUw3as12wYZfi6XbQDPPHAflM9BrpTeuMQORo/hapFrz9vmAE4d5Ksg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OqmQewij; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OqmQewij"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6dd43aa1558so35841146d6.0;
        Mon, 10 Feb 2025 10:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739210658; x=1739815458; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=maSza0ymzP8/Fo7wVw77yTEckZpoR9TKor6Glc7MNzs=;
        b=OqmQewijOmo9KQ5g7cLAb0Y5D1s5d7vb+LtmbOakofbBDicTYEwEhcVFsDPavoQKfe
         T/i+gCXpcXjzeoFCov3L3Io+1ZYzjwjEOUzJmqkP7koXVmJ6JyHdpexhjb/qJLhb7nTZ
         jrs2zCHblC0234PQJiTJdBhQbbI9+xpkSENg68fu9VgZvE0///eKQ3IufhwZvY7IHsz6
         Ob9t27qShHWe5Rz4uIzIZe4mhMYATGHrzAlrqhKGEaCM+ltnAX22JVY5p75PxKo/rCCy
         cXRZ1Jo4N5bgXQ2B7539quqt/z59tDnU1Q8Su2ab1GCwIqL9nPbsGY7ggyIvA+yhJMfm
         W3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739210658; x=1739815458;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=maSza0ymzP8/Fo7wVw77yTEckZpoR9TKor6Glc7MNzs=;
        b=aRD0v9Ym3vRdDi8j7esD3BfTcxaMFSprbdjACBK5RJzSKC5ZdSh1aRYtV4+QUbhVXe
         RHAgtu2SGc8Kp00oVjT93MiAE16HmmxNpXttXFQ/3YQGlPj+3iSwrqATW4pi8CLtUX/0
         GdToBzPF0SfRkP6eKna8YqZFLuLWQ/gD6jevi7IP2BpVTp1sr5hp8EncW6dplu2z/fqx
         7H1kuRhus1B/edL9B2aNSqISDl3t83ODkN2F9x8cXjzldLpJjka76SaM5tOhNFAyeNZb
         txrqFPFgRqJX81gF2l/tjxVU9S39Z16vOR8yKOFY7lIfz5ODeRZdLy8WL01afBofTzKN
         huDw==
X-Forwarded-Encrypted: i=1; AJvYcCURJo2wlGAyeFPEDwi9lMstyixP7w/9My0Xl3ICzl60PGGZMAsHSquXS2Yc8Q1opN2SxOi/drjJTtWxxE8=@vger.kernel.org, AJvYcCXb4Vkl6xWsxdmRHjV1BOpUHA8JXbVGQiH0bknsU7P8Ch5Qi79+XdIiN73vk6KWd5+DmfeuucMU1RQ6wYOJxnU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaNcKzfmaXSQRxwYIIhwiW5S5oDYaLMz4X4D7xtxUvWrfl2P2v
	IGwv4V3VLOrNh+l/JBUOFYRx8v2nEXJMdggJNqr9KmHurN7Zpt9Y4EX7q5c2
X-Gm-Gg: ASbGnctjsIP709Me0skX66yJh/Hm/1WFqLLMYG5WRPdSsq2q1s+XtVllva6ixMpBFLY
	LuFPeOWRyCwVeOOxLkZNrApCtyaxSkQFf7hET5hfI0CqJMHk0vDtO24ORPBOVzrRWCxlwlDWCml
	iz8z7ZEyRP9noigaQo5kKgm8ZmM077gs6vJvF5Vtkbg9JV+WYFZmfEVZAJHjFhVz3lS1rOpq9a+
	1cTr2lh1RMW8efuA9U4K46B52iJ+ViObxpB2tOhgA6EryDraPdC9R54CwPt2LJ9QVTv9P8vq+fL
	JjyWnw120rJCC48WcQLqhOD7+zsqhbn05EkT/WwF1THGiY2qMBr+tkwC0EvAzD+jG0reOe98PZ/
	u1QAwEIBIJZ+8NTl8g//7jLKl
X-Google-Smtp-Source: AGHT+IE+pEQj4YUADOP22JHCS7hpqQRk1URb9IxIh4573GE4bUofjqFBZ9ngBTUaFeniPofJYCAySA==
X-Received: by 2002:ad4:5d4e:0:b0:6d8:7ed4:336a with SMTP id 6a1803df08f44-6e46788825fmr10925946d6.31.1739210657813;
        Mon, 10 Feb 2025 10:04:17 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2620:10d:c091:600::1:cc94])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e449c271b2sm37713226d6.36.2025.02.10.10.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 10:04:17 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH v2 0/2] rust: fix rust-analyzer configuration for generated
 files
Date: Mon, 10 Feb 2025 13:04:15 -0500
Message-Id: <20250210-rust-analyzer-bindings-include-v2-0-23dff845edc3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ8/qmcC/42NSw6CMBQAr0Le2mfaKkRceQ/Dop8HvKQU0wIRC
 Xe3cgKXM4uZDRJFpgT3YoNICyceQwZ1KsD2OnSE7DKDEqoUSgqMc5pQB+3XD0U0HByHLiEH62d
 HWF4k1U5bsjcHOfKK1PL7GDybzD2naYzr8Vvkz/6dXiQKrKxpr0pQXZrq0Q2a/dmOAzT7vn8Bk
 MTGY8wAAAA=
X-Change-ID: 20250210-rust-analyzer-bindings-include-531e9dacec8d
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Kees Cook <kees@kernel.org>, 
 Fiona Behrens <me@kloenk.dev>, 
 Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
 Asahi Lina <lina@asahilina.net>
Cc: Boris-Chengbiao Zhou <bobo1239@web.de>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

The individual patches should be descriptive on their own. They are
included in a single series because the second patch uses a function
introduced in the first.

I've confirmed this allows me to navigate to symbols defined in
generated files as well as to the generated files themselves. I am using
an out-of-source build.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Changes in v2:
- Add missing core dependency on uapi. Fixes navigation in
  rust/kernel/ioctl.rs.
- Link to v1: https://lore.kernel.org/r/20250210-rust-analyzer-bindings-include-v1-0-6cbf420e95b6@gmail.com

---
Tamir Duberstein (2):
      scripts: generate_rust_analyzer.py: add missing include_dirs
      scripts: generate_rust_analyzer.py: add uapi crate

 scripts/generate_rust_analyzer.py | 41 ++++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 20 deletions(-)
---
base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
change-id: 20250210-rust-analyzer-bindings-include-531e9dacec8d

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

