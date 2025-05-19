Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F664A94F
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 02:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747622121; cv=none; b=WrM2AKrQIW0F34PY7EpXMJqfAMCcMP188uU55aDD/uVtUqo0M8hV4ENCkM2tivFsXRKBO90hs4zTEDhZgbvjutqg9FB1x/0NWZWrx9jCVNQqc5hdAMkasE3cbIsCgwF6tdKOZH0I64HN8Cje3USOCxmDAxCgr/N+X34Xw9C48XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747622121; c=relaxed/simple;
	bh=MLOjAAPcplXLjt0idgSdbv1QlkinDsa4uGJV0cja2/c=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=SpSHD0S7CpxdzrGJ2BlAb3iZ7KQJVYjkyKg+/lO0t9zGu8UJa+jPW6t7c546BONVQJVtpxE0EHgxrBKoiNRR+bro2VdxIramrT/1mNDLWdFxOYoQ0+7vgs3tWJPpLbjOgQCU/2K+us4slAC6822hxqlIEohG1AMnhg8EbFBXKXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VgFaT2nf; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VgFaT2nf"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-23209d8ba1bso11506865ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 19:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747622119; x=1748226919; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T4x7wNdRetlNSCsQonq8ajzFu9C5gDJsZscn/CMz2O0=;
        b=VgFaT2nfX+ruVDjsDTstxcM8K3vxhYy1Kby8Ej8fWxtGDv+EX+DlSfZWHL4B0QvYmv
         fl0E4a6q/fEITSz52BjeP1TMn2/JzkHiLzcPgnQWGbO1ss89mLoPkyx7pk2DVlfz8S1Z
         aB1TIjo9XxUfP7hf3NuYcnzB1Ftqay7Y7og6sWvgqppUSL+G0zZhH9NDtD6fHYIlEJq7
         nlCnoRXN1tvqGOXHymx/wYIY8njNDXW/WUvhm10qFQn3HPzH8/yhOGK42ujSN/strD72
         GNUZkVSCG8zIY+TQnBmz7CAunUG3lMTBMm8Tyz09KfkoBfsc3xfCcA66j3n3Bjhfpjlm
         DPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747622119; x=1748226919;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T4x7wNdRetlNSCsQonq8ajzFu9C5gDJsZscn/CMz2O0=;
        b=RIkvI2+p9nyFBEFsqsU5Hats3KCplEDYvC1N7Nv75DI8cMj6FjGKYVhfwWWc+Ru09u
         CJ0BoFUp3Hh3x0wg1CzTY7ks7c8WgWmkPfUxb/cHkMBYk6EjYtNLlDWpwuV9EZjjGZlJ
         S3yH6KVP9rhGp5dKpEfIjy6gh8GASjOYQVH4vrFcq0AFicM9CoNnt3xrVVqZGoCMeznR
         FeX8wGkQCBesWY2FVB9rmZ6RL3kuWstaodJLZBxOs5ao23JNOT2FkxJZpvnTYRxR21Gn
         uO/64doFkINWbONeg/m3D1gUAxBKXGN9/4Uhm7fmdcRJhzmA5GYGS3fEqZIoZ1eopknS
         15ew==
X-Forwarded-Encrypted: i=1; AJvYcCWzVt3YGWaoqfEYeElRYRYgO/zHsJolPVuktVyMpwCKaovJZYkvdhH7mpvtdjt8cRi6yliMTUb0hW7GmtY=@vger.kernel.org
X-Gm-Message-State: AOJu0YywuwyBbM7RjTqXhM/LJQTYDNeZXoyleDNOLE52leDw5thuaRLG
	kDpqXm1ueARFSNLBLGQ1s7LjbWePSmfIo1hEciSIEkMaxT9Ov/tsiBVWXlIPuwX/nsSYrkl/TBX
	Ejw30P3hUB+jdvPiQZRSoOFXLfg==
X-Google-Smtp-Source: AGHT+IGmupnY76hX7BcuQdiL3IIli6yYr7kfdGnKxgi2woWXJy5arAeTwD4OJxOiun/hcxLuZq62u/OigAgXEhe0bw==
X-Received: from plxe18.prod.google.com ([2002:a17:902:ef52:b0:22d:c61d:a4a3])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d4d2:b0:231:faf5:c1d0 with SMTP id d9443c01a7336-231faf5c3ecmr138087165ad.24.1747622119492;
 Sun, 18 May 2025 19:35:19 -0700 (PDT)
Date: Mon, 19 May 2025 02:35:08 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250519023517.4062941-1-almasrymina@google.com>
Subject: [PATCH net-next v1 0/9] Devmem TCP minor cleanups and ksft improvements
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@amazon.com>, David Ahern <dsahern@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, sdf@fomichev.me, 
	ap420073@gmail.com, praan@google.com, shivajikant@google.com
Content-Type: text/plain; charset="UTF-8"

Minor cleanups to the devmem tcp code, and not-so-minor improvements to
the ksft.

For the cleanups:
- Address comment from Paolo post-merge.
- Fix whitespace.
- Add improvement dropped from Taehee's fix patch.

For the ksft:
- Add support for ipv4 environment.
- Add support for drivers that are limited to 5-tuple flow steering.
- Improve test by sending 1K data instead of just "hello\nworld"

Cc: sdf@fomichev.me
Cc: ap420073@gmail.com
Cc: praan@google.com
Cc: shivajikant@google.com


Mina Almasry (9):
  net: devmem: move list_add to net_devmem_bind_dmabuf.
  page_pool: fix ugly page_pool formatting
  net: devmem: preserve sockc_err
  net: devmem: ksft: remove ksft_disruptive
  net: devmem: ksft: add ipv4 support
  net: devmem: ksft: add exit_wait to make rx test pass
  net: devmem: ksft: add 5 tuple FS support
  net: devmem: ksft: upgrade rx test to send 1K data
  net: devmem: ncdevmem: remove unused variable

 net/core/devmem.c                             |  5 +-
 net/core/devmem.h                             |  5 +-
 net/core/netdev-genl.c                        |  8 +--
 net/core/page_pool.c                          |  4 +-
 net/ipv4/tcp.c                                | 24 ++++-----
 .../selftests/drivers/net/hw/devmem.py        | 52 +++++++++++++------
 .../selftests/drivers/net/hw/ncdevmem.c       |  1 -
 7 files changed, 59 insertions(+), 40 deletions(-)


base-commit: b8fa067c4a76e9a28f2003a50ff9b60f00b11168
-- 
2.49.0.1101.gccaa498523-goog

