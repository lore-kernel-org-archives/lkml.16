Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81CF28DF00
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745917379; cv=none; b=mFPYcLTJW+QuYY7amny1cyt5ldu3nxhAdJaK8pN3isl6DqwkgAXaHwFfqTTU0txGtjdtzL6Oqk7NvkGqPvnjzkeiPAZoaDaZGvD9HwV80Wyf5kCSooUywOo+ic/ZuoP6QipmO/utsu+Q1jFOTvymVD/gzlT+h/jMPeEqfnR1vlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745917379; c=relaxed/simple;
	bh=HRoiZv1+AvWN1cftOgRkKmMryexssKHd2QZI31HjnNo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=AJ+tkFh0hJZaI11kU95FaiNyurbfeP4AipQ57Vm2P2pek2QquJ9U3ax8xdNzT23R/rZhrrE0ks8V5gCV9Mx5+8V34kvlfvg94OhKQypqnEPq0NPHCSYCfvbgad1k96WLsV3CqndL40/O1cLYvr8Aquvuwhofi+mHeHaeCYY6av0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sogISGKs; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sogISGKs"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43ce8f82e66so29808295e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 02:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745917376; x=1746522176; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T7ZncPTDU6rGjAymPxyi/H+YVSlLIlXgf5320AUACWY=;
        b=sogISGKsrMP3rM6k9sShr4hm2c6oWSNJ4j/W4+dTlW+n6LgRxJp4jQgq7iBm1T8Y1h
         JoDOTzkxNOV9gDVBNULIoLv2ew+ioQ7CwLdmgcIL7ph8ISBqmuyJwNVSBFi5Z5grHACw
         7xvM2vlKbJa74SNwXtuhcly15w3cspeGvVqk53xZBXHYtVd2TRgjkPTBKcVOWvgQhYHf
         KKjd6I7uhiLCRA9YiJNsktn8LlrIWfothHFCQlH1YLlWX7dK8nzfs6ZZiF6Qm3tiKSi4
         Ir6mEAmY8FA68wKNs48ZfMHEzaLx9JuA+NjdOr9sazN6ixG0HZ/hWeqqXSvswROb2j6l
         AF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745917376; x=1746522176;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T7ZncPTDU6rGjAymPxyi/H+YVSlLIlXgf5320AUACWY=;
        b=W0VjBpMvXwT1VdG3RuClAx8UgV+bVn5iq2MVYbBHRseGgpugsjSemySDqcFuM8oCz0
         wBPuhMzbjUCLChIMLykSCQ1QY2MMg71E05C4GubvLcEN9GIbKWPGt+17nSJzi0Mk6itf
         69CrIOYkqhyAtDnCRRr07rl8ekDMvLmpHmLDheaHEb5dBz937Re4jiV7Z8Nnvl4T6KWx
         cdZp0YH6xuCUfoiMrkJVUMW39LFSCQeUJjwpd1gHhcksY16Qg7Fa8ZU1LMkssLWdRoh6
         m2IEnAzKbHwTPcS8YocGNMH0lguXfYJh23FeP+bP+DqbTB6pLajhGlmy53+sGoJJGHXi
         jAAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWT/2VPCyzqZ+pimXIeCMYxuJ+OJyfhrpsqfcIWNIZDTW797cwC+8/dFTyEp0xwQiv3kUC3sjS9nQ3E5Qc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk+A/FREEJL8tTQXffDHHyM8e7BQyRoMbJLbmbuvMYuXWI8QPc
	2ZwzSSILUL79uclOfxIwjeltZeCRDMxIyZAhLRy3QL4mTHj1SLCyUkQy3UJ8XP9Iaaq/tjplVUZ
	Ux741Vp48J5n+uQ==
X-Google-Smtp-Source: AGHT+IHv1zfxovl47q1QWqZ72EG7uO/LnNgfzHzDj7h1HqVSnMn+iKzw289YE7xV/fElvgiBNWuw6BMxSX2OQcE=
X-Received: from wmbbi26.prod.google.com ([2002:a05:600c:3d9a:b0:43c:fcfd:1ce5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:109:b0:43d:db5:7af8 with SMTP id 5b1f17b1804b1-441acd1dbacmr11681895e9.21.1745917376113;
 Tue, 29 Apr 2025 02:02:56 -0700 (PDT)
Date: Tue, 29 Apr 2025 09:02:21 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJ2VEGgC/32NQQ6CMBBFr0Jm7Zi2AkFX3sOwwHZamgglU2wkp
 He3cgCX7yfv/R0isacIt2oHpuSjD3MBdapAj8PsCL0pDEqoRtSqxrjyrJcNLYcJ38VGaZUR7VN oYwiKtzBZ/zmaj77w6OMaeDsukvyt/2pJokR77S6WlGy7Zri7ENyLzjpM0Oecv/qViWCzAAAA
X-Change-Id: 20250424-strncpy-from-user-1f2d06b0cdde
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1216; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=HRoiZv1+AvWN1cftOgRkKmMryexssKHd2QZI31HjnNo=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoEJWjNVurOgL/TbOxrTSkHoo8h09pT855aIlGP
 zed8otHSneJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaBCVowAKCRAEWL7uWMY5
 Rm5UD/9E1fo537h/ISDw9qGfdVOTzxwZaWziUhKZPx5CkSjMpgiJK4myYe68YJkMUBURVvzdeYp
 uIp7gqWuEP33hgLezRLq48hdRzM2WhAR7DD7DTXrcaiCLbEMe/AghSZhmXD9RtOqSxIwV/gAO1s
 5n0I974CHXeZkiGjpGWu7pSe+NH5+XACqzSu6sLY66ALqs1WVY/Jg8cTMcYLivX5J7QX4IotExw
 STsobhkuA9/D+OfwWB6MYArW5Mni+ULju2KmE2Mxszp9oyyiNIkWmVGCmHl0mJVGluaxMLpKB9u
 6l2LjdQQN0YX2pP2l7CtrUgx+yR/pbRacRV+/64KmghSVxL6NF/+xY01nzFiAywqBYpzheXPdLu
 2UmrlwEgxIDbCf/vvXjim7YT9fZo9Udd8/SkbX0mNYxzAQBGZKdRKxgs8JokCpFu9YI/EcTUVs4
 Esy7Q/GGmhM27vTToTUgGMl/s722tjJxxAKElJtAtRPiTJ4dRQkSAxflK5JvYQdqrODFP3ffLBD
 IKKKqwCynb7plbkGj74f12hhiEyHHE8qDoFa3p4VWxH+7CkQAeLA4zBodZnz0JaswcWbrpzpO7O
 +gm/zECr+dmsE4aAN/GJqYWxkTWgDAtacDp7fGFYvFoDFdwgrLQNRCod0d817udWJ4WFL2z5Yib NOqJLRu33edgEjA==
X-Mailer: b4 0.14.2
Message-ID: <20250429-strncpy-from-user-v2-0-7e6facac0bf0@google.com>
Subject: [PATCH v2 0/2] strncpy_from_user for Rust
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

There is currently no easy way to read NUL-terminated strings from
userspace. Trying to use the ordinary read function on an array of the
maximum length doesn't work because it could fail with EFAULT when the C
string is shorter than the maximum length. In this case,
strncpy_from_user is better because it doesn't return EFAULT even if it
encounters a page fault on bytes that are after the NUL-terminator but
before the maximum length.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v2:
- Rename the raw wrapper around strncpy_from_user to raw_strncpy_from_user.
- Add a more convenient helper on top that adds the missing
  NUL-terminator when necessary.
- Link to v1: https://lore.kernel.org/r/20250424-strncpy-from-user-v1-1-f983fe21685a@google.com

---
Alice Ryhl (2):
      uaccess: rust: add strncpy_from_user
      uaccess: rust: add UserSliceReader::strcpy_into_buf

 rust/kernel/uaccess.rs | 69 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 68 insertions(+), 1 deletion(-)
---
base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
change-id: 20250424-strncpy-from-user-1f2d06b0cdde

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

