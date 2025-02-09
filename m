Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171B324112D;
	Sun,  9 Feb 2025 21:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739135104; cv=none; b=Q3LZtW27u/Eqd/h7Zru3Nuy3R7VyPwEPi2dQYa/pwW15R+505dwgOfBN2K3lrqbM2b8seHzeP8EO3xR5bJqmkRY+1tgZqmvUha4LyXAD4XdOhQxTj0MsW8MK9im0YHw98OLXG8toJz8llIuwYK5Qv41Vb9ZQYL7xAbBNi1j7Yto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739135104; c=relaxed/simple;
	bh=OljXlFCW+mFegST2txTEX+N+Z9WkNlGxpcue6m7u+5k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I+LykP9tN57TRT+RFHQB/Gyh3FNA3a3/I6ytaWPry3xXiVmgqEo8cU7Hkhh36s6AMImSMf1EHcuGA7Kgzv+2+VSWtwdLLq819xnvX+HGTAM6PhW/5oTGPQA2UQjL+NmQcvQh3c8xOBKsiq1SOxPvJIZ3vLMBnQjA8jxXeOqwgwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gn9YkJ3o; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gn9YkJ3o"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6e4468b7099so30510356d6.1;
        Sun, 09 Feb 2025 13:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739135101; x=1739739901; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TPb5KYrIKF8gVY1gTO29M7ETnI6lLPpGl8HyBBZHBYo=;
        b=Gn9YkJ3oeu0J44IdIUK7FwheNl0f1p21agxBNi07ZOeUYl5gKgDcGb53/QWpEzB9CU
         JR0BFEKPZVr4r1vq7MMBlZQMQpzfjA47T5BFRnysW266vTDS5GKmHB2oEAfcqCN5Ojc6
         VWJKfKy4pvgepIWR/M7378wmOFm5H7o9DqgT3s5DptlhxdJk/Hj3N6iPmtAGH+ZFuYta
         EIz+H4j+gryANs/Ej5U/D83qKZddkSwbtcAcvHOktwqZNs4KZ3ZJYQWxBKdWQoBIBQdR
         QwjxIaXY52lHKFq9IjNhCQL8OTP7Hmjh83/nHV/k38Vok1fGmhoJXmQ3VreUZsA+SRKc
         E8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739135101; x=1739739901;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TPb5KYrIKF8gVY1gTO29M7ETnI6lLPpGl8HyBBZHBYo=;
        b=pOPCaZehb+0RA0+7wBEEO0HtLKVudY7WDCxAqHikxCiG1pkCYtn0aAAEBuTOkmdLLP
         k/80x4J7GvleePmLozeM4rYfItKT5XrEGkEqICmSV1cjY6ZpZKLdu+Vr7gXOOBkUXQzf
         P8ZoidB93Tr2qq6TQHMM8xWcxBMMcawJNegyjDeYIoffgY1pfL3J4a18Z6+7/Rt+sSrY
         u/I6pv1BOqxd933pWw0VSWmiL2JSlsuVGDDUzm324rbI9efey0a9XZoZO2262dAjBGsg
         GaXBWEIIgiY5QBHbhrbyDnwDrW6e4Zkfdi6Gwwv79x7t2yEVyb2cgG88VWx6699+XhnZ
         T+NA==
X-Forwarded-Encrypted: i=1; AJvYcCXDtzqYUceEE10Wn6siFGewHCcM4AyDqD950mdZSfnBhmMhj0GmF0e6vRRD3XxKP/u3dACQoGaLjkZG23A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgdP33N6S1xsFUrCCLzx5GBM7v7H2pMhnmFTwQ58MOYPTlW6m6
	8Rg1C0YxeEl46iemKENn1+U6gnZCCwukVJUNgtOn1GVOC6FfW99+
X-Gm-Gg: ASbGncs4YxdpXd4wneRiFbW6s+HCsjn+5pPAiqhBbl1qtAOsfoe465K/bAR8sQpdJpE
	ECryT91MX8vpALhtSAuQcSgECtC7Kv7vZ6JK/cbGeSPNpTVNHUf1N/gd7lIzISU0ZizqeYKV6iK
	eRL7sUt0Hn35RB6NW+QnflyNX+KsX8W3h/VeU+8eRA5UAzCTLwcWPKefYmuGj0sOiXJHC+LegL0
	1yp6K/htriDujcyOWDzOY4BVKPcJNPFAZetsHDWVWKMXNQm1j+/KmJ86MswCN8LASFWbdN0X9ql
	l/DitiHmedsBZqf3SZU/nP0z0dVFlqPEdWl5IGE=
X-Google-Smtp-Source: AGHT+IHHBT10KpMZZhwpBVSBq4TY9GH1U0OJcN6+gGwpZP0xFky1B+nlkh0lFTfR1+LVlsjjnBwqaQ==
X-Received: by 2002:a05:6214:1c09:b0:6d8:adb8:4012 with SMTP id 6a1803df08f44-6e445737328mr180843416d6.45.1739135100838;
        Sun, 09 Feb 2025 13:05:00 -0800 (PST)
Received: from tamird-mac.local ([2600:4041:5be7:7c00:15f6:96e9:3308:934a])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e44d545327sm24915476d6.33.2025.02.09.13.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 13:05:00 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Subject: [PATCH 0/3] rust: add missing macros deps as host crates
Date: Sun, 09 Feb 2025 16:04:45 -0500
Message-Id: <20250209-rust-analyzer-host-v1-0-a2286a2a2fa3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG0YqWcC/x3MTQ5AMBBA4avIrDWpUn9XEYtiMImUTBE07q6x/
 BbveXDIhA7qyAPjSY5WG5DEEfSzsRMKGoJBSaWlkpXgw+3CWLPcD7KY16As7RJZ5lrrooQQbow
 jXf+0ad/3A+PKLdJkAAAA
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
 Chayim Refael Friedman <chayimfr@gmail.com>
X-Mailer: b4 0.15-dev

This is an alternative of (or follow-up to) a similar patch based on
rust-fixes:

https://lore.kernel.org/all/20250209-rust-analyzer-macros-core-dep-v2-1-897338344d16@gmail.com/

This one contains a larger refactor that allows host crates to be
declared separately from target crates as discussed in v1 of the above:

https://lore.kernel.org/all/20250209-rust-analyzer-macros-core-dep-v1-1-5ebeb3eb60a9@gmail.com/

In my testing rust-analyzer seems fine with multiple crates with the
same display_name. Crates are identified by their index.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
Tamir Duberstein (3):
      scripts: generate_rust_analyzer.py: add type hints
      scripts: generate_rust_analyzer.py: identify crates explicitly
      scripts: generate_rust_analyzer.py: add missing macros deps

 scripts/generate_rust_analyzer.py | 143 ++++++++++++++++++++++++++------------
 1 file changed, 97 insertions(+), 46 deletions(-)
---
base-commit: beeb78d46249cab8b2b8359a2ce8fa5376b5ad2d
change-id: 20250209-rust-analyzer-host-43b108655578

Best regards,
-- 
Tamir Duberstein <tamird@gmail.com>

