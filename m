Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACCE225779;
	Thu, 24 Apr 2025 10:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745491124; cv=none; b=p1TD5Kg+7gmNHzL8nbcDukO9E9RJE+FCVWkIHKCWyKZMLHIck6Vu4W7OXDqZjVi5nHZF3P15UtNGKxpQZWzOEPywhcqW03tVEDehW6wbA3Hg/LTwW7JyqbQptYZqA4gTW3R24K02w8c6eexpPa1Pq/eYw2/kh4Fglh0jzaeJetI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745491124; c=relaxed/simple;
	bh=cF0IRQhi9ey4Mgece/vsORD2K46nk7KXEntxzC0l0fM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sLElM2mXsvLr7TAbXKy7vXQBz6jA7Xs74kix+GUMDoIOL1XAD26avwaC77lI8ckS3y9j1YGU6P2XYRNC+dEC5JCxjyq7nlc3pHU3UrFKr5lOLLffeYcEL7nu/J1R5knkrMpAeiUWKF2zKhTpShTuworp5xddYt0gAGgX6FkUpaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aj2l2XWM; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aj2l2XWM"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6eeb7589db4so13562756d6.1;
        Thu, 24 Apr 2025 03:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745491121; x=1746095921; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KqLXzSekZBdUrQl7KyKSgYQa4cggf/FacgO4meA+Tto=;
        b=Aj2l2XWMMOut0xWvG6eweyiiiu/0soRNcwOy/W1ApDY9B7MlEcf2J62bjDC554ew5L
         T6lRERgUn+u202W/vzrHxg6KR52tJ71Jv2P1sz/yUdlr+k5Yv9NDRkD70DvTMUCbHy3z
         leIxL63v+XHLodyt2FxxF+E8En0FmHMBZO+6emc/fGdoIaAA2EPNF0quHpa9we/XPTbt
         MZ/2dT+0L7CEjgx1G4lxzx6N/tBlqD7j6VRdQ6bHoyqcAlBBFFr0ysNonyypRrMHrn/h
         /9BVa4q8aUo63UlT7DFIa/stLJj8/TzbUCeU6rX/DkWkufpmMDGATuWdMSOhkH5naUfa
         5CIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745491121; x=1746095921;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KqLXzSekZBdUrQl7KyKSgYQa4cggf/FacgO4meA+Tto=;
        b=YIH11qyHzd6QKP94UGTLxsZTlmOmOzbI7CRVqgjAaW4tQLKqKafRp5DU7T5Pva5ntX
         Ppz+wwA/TGl6WAh+yaUsgZrtVS/1debA/ewBMVpi+91EnltpaUvEr6i6ytoiLpplVVX5
         17EdRgF7cbw0TqySvFrrxmvwuA9jD8me3Qic+ONrzW0uIFJgfkCAQrndHgW8fp89VZsU
         Iqfp68MYCDGsRqi1fS5eNTGyc25f7yh19UzfinIkJZdOJWyJdlsCzLT3Bew9hPAjBoez
         Y/1GsIeBvDwiG62+dwvmjK05cVBs3Sd9JtXc1dP01x6WoZuHijHpDpPBPDhsKV2giIh3
         2OrQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6vhEvXUevYQe7TvekHxld9VEaLs1b1sz6SpNFzjIu06SR8dXkyJxikjUb2JFB1uVJcZ5v3yeOSsmoju0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzP24oOeOzQFRW7+5P49u6RkgjH1KLr83fSlXdgZsnMOAfZxCQF
	mcKUe0QmNO61iMivhRGd0OHQyOLC+Nu7BbHXEitPaxI/Hsdyjkn7
X-Gm-Gg: ASbGncsbbLmUihpBhODXSgA2F7OTPUex3F6cxo+Np901xfVRVuCpCNy/faWtWd0H59Q
	seS8o6ZO5t+vkDIkiW0ueX+FoQGhDatHJxxQbM2QCJyfK2hdXd7LRRCvaXi/7v2ipwWKf6zU0/I
	UTM+T7UijqINjiEnc+e0CgMUuzKK2yai4j006crSqKHtuvYSUkpPVCTfXT0uP6oBIYCaQ86LTzG
	ju37kMKtZUVQ9TwLIM0lLWZGWMWpWKG6QYWSB2OMSukPwJSMxmp9Zap2mU5BWojv6/ETH7zn2e3
	2i6NMcck3nfRFYneYyrC8CIoRywrhg9R5cAxpJvYECkgY/uU8rKtckwm3QLVgeMPq8LrDKVp582
	JSko=
X-Google-Smtp-Source: AGHT+IG2EvjJf89mWgOx6Kxegd4xSBNFm/mDTTEB8HgYn7sH1v5X0EdTVvytVGrEav+wKSnizeu0WA==
X-Received: by 2002:a05:6214:761:b0:6e8:fa33:2962 with SMTP id 6a1803df08f44-6f4bfbe61e9mr40017466d6.10.1745491121415;
        Thu, 24 Apr 2025 03:38:41 -0700 (PDT)
Received: from [192.168.1.159] ([2600:4041:5be7:7c00:4047:3830:186a:1bb1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f4c0a73b63sm7839096d6.70.2025.04.24.03.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:38:40 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH v6 00/13] rust: generate_rust_analyzer.py: define host
 crates and scripts
Date: Thu, 24 Apr 2025 06:38:28 -0400
Message-Id: <20250424-rust-analyzer-host-v6-0-40e67fe5c38a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKQUCmgC/33OTY7CMAwF4KugrCcoduL+sOIeIxahODQStChhK
 hjUu4/LhqqqZvksvc/vpTKnyFntNi+VeIg59p2E4mujmtZ3Z9bxJFmhQTJoap1+8l37zl+ev5x
 020ty9gimKoiorJQUb4lDfLzR74PkNuZ7n57vHwNM13+5AbTRHrEqPHoM3u7PVx8v26a/qokb8
 ENYgFUChbAG0TBAQQBLws6J9RV2IqTtHDPaEy4JNyMQVwknBASCUDe1Kfm4JGhO0CpB04qKuAz
 AIDvmxDiOf8VdwXjAAQAA
X-Change-ID: 20250209-rust-analyzer-host-43b108655578
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Boris-Chengbiao Zhou <bobo1239@web.de>, Kees Cook <kees@kernel.org>, 
 Fiona Behrens <me@kloenk.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Lukas Wirth <lukas.wirth@ferrous-systems.com>, 
 Tamir Duberstein <tamird@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.15-dev

This series updates rust-project.json to differentiate between host and
target crates, where the former are used as dependencies of the `macros`
crate. Please see individual commit messages for details.

The first 3 commits contain mechanical formatting changes and are
optional. The series can be taken without them.

I avoided more significant formatting or changes where possible to
reduce the diff. Unfortunately `scripts/generate_rust_analyzer.py` is
not consistently formatted before nor after this series.

The 5th commit ("scripts: generate_rust_analyzer.py: use
str(pathlib.Path)") can also be considered optional. It removes an
inconsistency I noticed while working on this series and which occurs on
a line which churns in this series anyway.

The trailing commits can also be considered optional, as they can be
submitted separately. I included them in this series because they depend
on it, but they can be split out if this is preferred.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Changes in v6:
- Rebase on v6.15-rc3.
- Extract local variable `crates_cfg`. (Daniel Almeida)
- Replace `map` with generators. (Trevor Gross)
- Replace `str.rstrip` with `Pathlib.path.stem`. (Trevor Gross)
- Use `Pathlib.path.read_text`. (Trevor Gross)
- Explain why `cfg_groups` only applies to workspace crates. (Trevor
  Gross)
- Link to v5: https://lore.kernel.org/r/20250325-rust-analyzer-host-v5-0-385e7f1e1e23@gmail.com

Changes in v5:
- Split remove `"is_proc_macro": false` into separate patch. (Daniel
  Almeida)
- Move whitespace change from "add type hints" to "add missing
  whitespace".
- Add patch to avoid default arguments and force keyword arguments.
- Add patch to add type hints for CLI parameters.
- Replace some instances of `str.replace` with `str.{l,r}strip`.
- Rebase on next-20250325. This must be rooted on linux-next because
  it's the only place rust-next and rust-fixes have been merged.
- Link to v4: https://lore.kernel.org/r/20250322-rust-analyzer-host-v4-0-1f51f9c907eb@gmail.com

Changes in v4:
- Fix typo (s/generate/generated/).
- Pull Trevor's suggested change into a separate patch with a
  Suggested-by tag.
- Add patch to avoid file descriptor leak.
- Add patch to generate rust-project.json entries for scripts/*.rs.
- Add patch to use `cfg_groups` to reduce size of `rust-project.json` by
  90%.
- Link to v3: https://lore.kernel.org/r/20250319-rust-analyzer-host-v3-0-311644ee23d2@gmail.com

Changes in v3:
- Rebase on linux-next. This is needed to pick up all the conflicts from
  both rust-next and rust-fixes.
- Drop `uv` from `mypy` command. (Trevor Gross)
- Add `--python-version 3.8` to `mypy` command. (Trevor Gross)
- `from typings import ...` directly. (Trevor Gross)
- Extract `build_crate` and `register_crate` to avoid peeking into
  `crates[-1]`. (Trevor Gross)
- Link to v2: https://lore.kernel.org/r/20250311-rust-analyzer-host-v2-0-30220e116511@gmail.com

Changes in v2:
- Rebased on "rust: fix rust-analyzer configuration for generated files" [1]
  Link: https://lore.kernel.org/all/CANiq72nv7nQ+1BinCHe2qsvwdUb-y9t7x=RGSppi_n9TBXNHpw@mail.gmail.com/ [1]
- Link to v1: https://lore.kernel.org/r/20250209-rust-analyzer-host-v1-0-a2286a2a2fa3@gmail.com

---
Tamir Duberstein (13):
      scripts: generate_rust_analyzer.py: add missing whitespace
      scripts: generate_rust_analyzer.py: use double quotes
      scripts: generate_rust_analyzer.py: add trailing comma
      scripts: generate_rust_analyzer.py: extract `{build,register}_crate`
      scripts: generate_rust_analyzer.py: drop `"is_proc_macro": false`
      scripts: generate_rust_analyzer.py: add type hints
      scripts: generate_rust_analyzer.py: avoid optional arguments
      scripts: generate_rust_analyzer.py: use str(pathlib.Path)
      scripts: generate_rust_analyzer.py: identify crates explicitly
      scripts: generate_rust_analyzer.py: define host crates
      scripts: generate_rust_analyzer.py: avoid FD leak
      scripts: generate_rust_analyzer.py: define scripts
      scripts: generate_rust_analyzer.py: use `cfg_groups`

 scripts/generate_rust_analyzer.py | 334 ++++++++++++++++++++++++++++----------
 1 file changed, 245 insertions(+), 89 deletions(-)
---
base-commit: 9d7a0577c9db35c4cc52db90bc415ea248446472
change-id: 20250209-rust-analyzer-host-43b108655578

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

