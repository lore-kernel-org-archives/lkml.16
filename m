Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EB625F980
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 17:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746033343; cv=none; b=SwbnDHvQU+Z8oShAko5Atw0p29baSi+QbBTH+8ISMJrcDVVDAPLMssoRlSiv+UZnVWdzxt7Qoanp3FZhRGlicbkViZBapOH8unQt3VQCEE9cDiUNCWPLwRxBiRb9ihjUJaqhkW7vVUc1qJe5eRHxz4yY4UZp7EtIFELZbcJjF7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746033343; c=relaxed/simple;
	bh=a1OE5bfqiQpD3wUqlPPLecFwn0/TgL4JwzH7YA5a96I=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Content-Type; b=m3y67IKARn9ZHzjazHSp1Wiub0rYeG4HeZsLHyHOrAh7YXho/knZKaF9Pef4xmoKswCQ9QLE8j5DPsvDnWgffSXQuEaldDv5DQP4Bd1xJFd7IaeHorn0O/u46v6bGiWMng1dtiFrv7n65q6QSoPbb7psxxAb7LeU3UyLt3rWIy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CKZV7+v+; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CKZV7+v+"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-736d64c5e16so92115b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746033340; x=1746638140; darn=vger.kernel.org;
        h=to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2l6EpSn49twaG/1RM3U2XqpvkRe6FWEsiPTfIGBFJKk=;
        b=CKZV7+v+XqB+eJFxYGGWtpU9caUc4ZRN1HuxhZXHfbOTcz6zoe+1HDakACaCwvr0v/
         c16wy5ntS+PcxuklMLxmQ3n9xdqquA2/3cVj1Sqz9WdK55ASlLEbCCrmgevyvBIciQhw
         mpqJH89ypTJ1ELKqP6xNBaVoqWoCQkV2tv2f+USmNr2d3vBg4e+lURuOkZgS7v5L51Zj
         H743/he3U8UPxjE6StyRhpD8w/2dlYUSrASyKECtXEIZH4mX9ILRaqAaKraq6XZ8ynFG
         JTFpZSwB901Wpkpgk1YspfHD3pJ0IKfGYBCi/nM5Ypnb4ItpvX7m8CAQVFWlS4/WhtJc
         oBvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746033340; x=1746638140;
        h=to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2l6EpSn49twaG/1RM3U2XqpvkRe6FWEsiPTfIGBFJKk=;
        b=TL6mUFVmGIu4LQry4AGUQZ000vtz0KZlNBMbQuTLHg2YNPM8udu8IZjsBKYum2CiDC
         QemEywmCZAfdnCmUbkt9emzms9chHW8rkQqiUWadgC++Uv59Xcua/6CkzPAPu23lrBwd
         YNwIiVQzDQSr1mgD0d1LB8vph/hiFCIO/XK8/k5j+yxObap2KKaFgAlIVKIAFJ0/gEN/
         1Qmhlc1pcmArtSkqkVOIJhcTgGiMe9k1l6mNPN5JSLfMwcr0oU/fG+h6ObXpdCoSswBH
         /KqVmTdQ+we3+aUlpLJlW9dEqV/buNK02jZBio5L8ZPFlCbIJHuxpSSApDsqVMv7rna+
         9X6w==
X-Forwarded-Encrypted: i=1; AJvYcCUgxO0DcHfKN97pCmAm/kBSsckIqnvNIz9/dVQRKuuqt1dpy9gYQ86c0f1ahsyid+gsTgjbxAUz0DpZvcE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyCh7QinxJbsO9YZl1fW6ZgJ9auYf0eZNmzv/q9xgJkmlDa3cN
	qWuiVm2hhVodJ8eqZsoqK80/VEheiVVOjCI8rFcObyvba6ZUHKFzSQ0drU7sXukSPlAu8OHoaM5
	ST5/MsQ==
X-Google-Smtp-Source: AGHT+IHwG7pdNLiBaAM24HThjkOi7tLfoBL4L6u/i7asjEelEVXiAdsmMsTUPy8p7bw7xwkQu9IheoDEPmPe
X-Received: from pgbfq21.prod.google.com ([2002:a05:6a02:2995:b0:af2:3b16:9767])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3d8c:b0:1f1:432:f4a3
 with SMTP id adf61e73a8af0-20aa2fcc884mr4171936637.23.1746033340179; Wed, 30
 Apr 2025 10:15:40 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:15:29 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250430171534.132774-1-irogers@google.com>
Subject: [PATCH v2 0/5] Silence some clang -Wshorten-64-to-32 warnings
From: Ian Rogers <irogers@google.com>
To: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Jakub Kicinski <kuba@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Leo Yan <leo.yan@arm.com>
Content-Type: text/plain; charset="UTF-8"

Clang's shorten-64-to-32 can be useful to spot certain kinds of bugs
that can be more prevalent in C code due to implicit 64 to 32-bit
casting. Add some explicit casts to header files so as to avoid the
warning when these headers are used.

This patch started out as a single patch in a series for the perf tool
where a bug could have been identified were -Wshorten-64-to-32
enabled:
https://lore.kernel.org/lkml/20250401182347.3422199-3-irogers@google.com/

v2: Rebase and try to address Arnd Bergmann's comments wrt the commit
    message. Arnd also mentioned doing larger refactors, changing
    return types and adding helper functions. I've held off doing this
    given concerns over breaking printf flags.

Ian Rogers (5):
  bitfield: Silence a clang -Wshorten-64-to-32 warning
  bitmap: Silence a clang -Wshorten-64-to-32 warning
  bitops: Silence a clang -Wshorten-64-to-32 warning
  math64: Silence a clang -Wshorten-64-to-32 warning
  hash.h: Silence a clang -Wshorten-64-to-32 warning

 include/asm-generic/bitops/fls64.h | 2 +-
 include/linux/bitfield.h           | 2 +-
 include/linux/bitmap.h             | 2 +-
 include/linux/hash.h               | 2 +-
 include/linux/math64.h             | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.49.0.906.g1f30a19c02-goog

