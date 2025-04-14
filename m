Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF449187858
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744639890; cv=none; b=fg4dxaKnyx0wYnxgaAZs/YgiH0RvMi/HMJWK3wXBsjznTsGYgZMJKbJfx1s0yqIqw4rhzJEYN5pxmtD/zBP8F91PskPTrvXAMYnLkOnFHNA16PgXSGE0JyL7E9JGBMMuLJlwN4/BEqSU3wHkvtpurwWZKq8IU4xOM9mUMb2ccUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744639890; c=relaxed/simple;
	bh=tEuPCZrbW4uGWbDihJx7L/LXb8gjOIKkMgf9s/m/B/w=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=l//rLd1FubW5Y6s+7D0to3J7H0F8lXM6Ov+YvAtuRkpAOZb7zZk6pB9eyavcxYIxLvnCaY9v8o7U/GuGY9P7DyA/BQlt6l8kiZQ2r6531oJ/1+rmI2258Tw0Z6ZzXuui2kt3nNs4Gi5r4cURD5/DNNDV1MXjRZl8tmchWLcDCeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2PVqUfvb; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2PVqUfvb"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-af28bc68846so3868063a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744639888; x=1745244688; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rN4c8fNLuwFLiyiUAz0qlqS5AwW3WCou4y1O1Fl9+04=;
        b=2PVqUfvbZna/Ovn8a325o9ELiN6ZsBlYz2OE4q9/PymbpBw+8bwQ19YAVZPcJEfRxJ
         mY7bezvuBI+z5TMQvO4d/jWAC3U+xNppFFNRC9pbe114h9rxZwktkFqwnLP/FrmS2VEy
         juIfDkSoyiQ+Tj3yVStiVVx1CW3EHn7fTKEahiWuKZJIfu9VNlTH5Dy2baCBqm0kKMGS
         OoF0WL6kmImMMXLmoYjAVyq4WYU75O2iWfTOV8/h7heNtPSMH0ZTOb+281ZXoj28Edzv
         ZdTyUf4qpbEGJmvvfjoPIifk3WnI9FgT15vTLTHZtXFJKgLwLl4YMqfxTticIbHWo+R3
         G04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744639888; x=1745244688;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rN4c8fNLuwFLiyiUAz0qlqS5AwW3WCou4y1O1Fl9+04=;
        b=J86fPR2F0v3b4/ZMkRIcaGgWkGWGQXN0hw552sL+rkzFVERiruTgyHUwyulZWA09pT
         3UMSKGbqHAZoG2+oCFW9GKRo1Ig17qLk0pSbO5e9lOXR8esm6rh/7TgGbjvpsUzWTRUj
         nMDYQBqm4HKU9zL/XQClK/ZSV3nGcjrWXuRyqWMuMW9I2WSeh/85ZedQuQ6fSXYkqhX7
         VhvPfXHESJklZmqDadXkfBEnAKPtrDRFGGWxWBeZcNefDpE63xZTUMrsPX+NeJNmvWXA
         wZ4WCXZr0hm3WNisA1DQ+EhIm8QoxG7g8eH0KIgGBOKTOQYCyIM/Cs2PWvn3P/5X9ufY
         OXeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAkPzflRqfUjaAgD1Ul5WErerzv7I89TP2YY61b05zuL9FUqcr/CkfXsgET8yOzrQyJRhfH3oi4POm7gk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzd3OpvQjKhzGXma2ufdVEDst4UTI7qu5AogjNef6oLR5+dTlG
	A5uWlD4zpPFER9yka1pG0Qq1o11Tgdgw+CBuCh/XpfBr7pXVG+OrzGPPxJqhF9Yv4AWqFdWcQD8
	7s5OndT7OWr3OtWDQPyMdEZSFpFtQ1BMO+6fW
X-Gm-Gg: ASbGncvceK6U0Ni1fKxzV8l+kRtPDJ1d9xdXt9jLKz0FHCcXwtE42X6maQuyhITCa+H
	7C23Xa/upgm9mTytFBCd57+ZHZebyitjqFfByNX+o7n89Rg2FmMDRCjQC+tOkR0VFHWYuHhZgiv
	Nq9uOozvc4A0ltw4DHZAOO8aXF+F1hqtpwRM2048ZdGKhvjJqSzYA=
X-Google-Smtp-Source: AGHT+IGvcRdqaiufKsFDDDQaCGUwRsDmsPajuU91sQMLxAcWYm80/WD1jFGm+db3CQMcEptop6u1R1NHxXqb63usPvA=
X-Received: by 2002:a17:90b:2811:b0:2ee:c291:765a with SMTP id
 98e67ed59e1d1-30823639c94mr17879078a91.8.1744639887495; Mon, 14 Apr 2025
 07:11:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Aleksandr Nogikh <nogikh@google.com>
Date: Mon, 14 Apr 2025 16:11:15 +0200
X-Gm-Features: ATxdqUE88UhynrTms5J5w8VyMpN0utUaEsGYZOg0K2pAoIUegIx51WjnYJJGywU
Message-ID: <CANp29Y4FmGDXm3LWvW6D+JR8CWf=fvuiAseFb1h2HQSDjFKO2A@mail.gmail.com>
Subject: Latest clang versions fail to compile CONFIG_X86_X32_ABI=y
To: llvm@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Cc: syzkaller <syzkaller@googlegroups.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Alexander Potapenko <glider@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

I've been trying to build a Linux kernel using newer llvm toolchain
versions (18, 19, 20), but it consistently fails with the following
errors:

ld.lld: error: arch/x86/entry/vdso/vgetrandom-x32.o:(.note.gnu.property+0x0):
data is too short
ld.lld: error: arch/x86/entry/vdso/vgetcpu-x32.o:(.note.gnu.property+0x0):
data is too short
ld.lld: error: arch/x86/entry/vdso/vclock_gettime-x32.o:(.note.gnu.property+0x0):
data is too short

The steps to reproduce:
$ git checkout v6.15-rc2
$ make defconfig
$ ./scripts/config -e X86_X32_ABI
$ make CC=clang LD=ld.lld -j48

The versions used:
$ clang --version
Debian clang version 20.1.2
(++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97)
$ ld.lld --version
Debian LLD 20.1.2 (compatible with GNU linkers)

Is this a known clang/Linux issue?

There's a kernel commit that addresses a similar problem:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=aaeed6ecc1253ce1463fa1aca0b70a4ccbc9fa75

but the error is slightly different there and the added Kconfig
condition apparently did not kick in.

-- 
Aleksandr
