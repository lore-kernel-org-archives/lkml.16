Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B93017B505
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747839895; cv=none; b=PwllBnqQbCbBhFMFkyiB1xcpIX+59G2tKXWY96xk4wRZmK59E5v0riYij0fkRzjJTFDPS88Fnodb/IBjZEl94NWLtTt4pTzIAcXkJIuJWc9pEtUSf7z8RfoJsSX2xgmG0+UmA9H9ntCv0TOHtXPVBbvO8MCnxZzscsXtMtfhgAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747839895; c=relaxed/simple;
	bh=rAK8m891E8KdFMdbw9KiGXTNkY9MVOu9WA612F/WSDw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=XqTDN+U9vbA4KswiGSODsJ4tO3fo5XtKPQvRMIEjEmFqFB18g7qWtshhpgB71dw9wmCjalpA84hfU2vR+jTJgXoaL3rJ0Dc1xiZr6q92a9V5OnYNdFj4jvWcKtbqUhbhIfMUS4U9ZO64gw6Yyo5bLCnH3tjihoWlLnIH60rbCMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dvyukov.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GSUXK09s; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dvyukov.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GSUXK09s"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a360d01518so4246148f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747839891; x=1748444691; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=X2gLgcajWgYr99BCBnkb56/jKL1VObmhmn37WxmtGyo=;
        b=GSUXK09sbi+8P19tiCPeYAdVgEtAISmcVjAsliiD1noqgnIeAe9or3pjK/vgMVJWMB
         iF0MRruF7xl5xcVvpCbbWMegYpxKVtspcV8AuKauoj6dRudZKBt349M7KT1Vq8FlVAOx
         EExILxuzxrR9DDV9iGAEA4rpG8VXSAT9sOxXkC2QipAwu/2HTle/bVmB1RQR/r/lOYOz
         ksSWvdM8EK8W0kGKCXcC6CDQWPW1N49mdvHbjKm8kJxPcrq9J/qmZ493eSteh41it1Vm
         Smc2yJCiFoJfetozqwjFdhc5rqMkXKdlQgu1MBb9NjdggyOB1qcVxCOdZZ9vxc6cQDdG
         1hKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747839891; x=1748444691;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X2gLgcajWgYr99BCBnkb56/jKL1VObmhmn37WxmtGyo=;
        b=O/CcysUkEk515ugD92y59gW1sTWvMns35QSqmEYel8fa7yI/qxytqRzXu7s6xXli+l
         wmzfDr5g9WOsZw0Re7fG0WSg/xP0RT0MqoCLh7udM1DWQHoAj7gvjwbYmbkW3jCkyAWs
         aA/4pMCtLjsNPYssORAPOvw8ZTjE4MJOcIytfTStxw2gMSgZSMoOnPgMQeUBg+oAVZyB
         ubbd36wW8qLqIF+gni2wJ8C/w4bc1S8yoKbR3QtP8mIQqmEsngf29wO5fdQeoIC4geq9
         unhJmDIgG3Dkr9DJMHQ8cRMS9kiv8+32ylicnRlnzeIPKkMlF/Jwr2El4c/oBGZ0Lcme
         VKKA==
X-Forwarded-Encrypted: i=1; AJvYcCWh6qBTbFdwVvMP9wt+UOj9Og92kk4RQKp+JW3xcL3WqxCRnUpDEd2yt2pmSPQ7XzxMk29VV2SPwEia8uA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxygNkw73HpDX3bykubZYWxY1Vfg4gTclZJKTR8m3udSX69+aqf
	sbmIqJ1RAlumlTrfPNCq6WHzztymHlMy235UvmnUL2ba0LSuUV2UJm7DL989VcNyDXx9TNW+X93
	iZKjP4imurQ==
X-Google-Smtp-Source: AGHT+IEqf9PQZvE2cypc3D7bz+rsl3bYnj9z9B38TdNUYoWgXKOGOOfPZ+N0pAfavCr5RfeAY+lSVqGJheXS
X-Received: from wrbby5.prod.google.com ([2002:a05:6000:985:b0:3a3:6aef:bddf])
 (user=dvyukov job=prod-delivery.src-stubby-dispatcher) by 2002:adf:e40f:0:b0:3a3:64d4:3b63
 with SMTP id ffacd0b85a97d-3a364d43b8bmr14053053f8f.49.1747839891677; Wed, 21
 May 2025 08:04:51 -0700 (PDT)
Date: Wed, 21 May 2025 17:04:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1143.g0be31eac6b-goog
Message-ID: <cover.1747839440.git.dvyukov@google.com>
Subject: [PATCH v3 0/3] syscall_user_dispatch: Add PR_SYS_DISPATCH_INCLUSIVE_ON
From: Dmitry Vyukov <dvyukov@google.com>
To: krisman@collabora.com, tglx@linutronix.de, luto@kernel.org, 
	peterz@infradead.org, keescook@chromium.org, gregory.price@memverge.com
Cc: Dmitry Vyukov <dvyukov@google.com>, Marco Elver <elver@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

syscall_user_dispatch: Add PR_SYS_DISPATCH_INCLUSIVE_ON

There are two possible scenarios for syscall filtering:
- having a trusted/allowed range of PCs, and intercepting everything else
- or the opposite: a single untrusted/intercepted range and allowing
   everything else (this is relevant for any kind of sandboxing scenario,
   or monitoring behavior of a single library)

The current API only allows the former use case due to allowed
range wrap-around check. Add PR_SYS_DISPATCH_INCLUSIVE_ON that
enables the second use case.

Cc: Gabriel Krisman Bertazi <krisman@collabora.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: Kees Cook <keescook@chromium.org>
Cc: Gregory Price <gregory.price@memverge.com>
Cc: Marco Elver <elver@google.com>
Cc: linux-kernel@vger.kernel.org

Dmitry Vyukov (3):
  selftests: Fix errno checking in syscall_user_dispatch test
  syscall_user_dispatch: Add PR_SYS_DISPATCH_INCLUSIVE_ON
  selftests: Add tests for PR_SYS_DISPATCH_INCLUSIVE_ON

 .../admin-guide/syscall-user-dispatch.rst     |  23 +--
 include/uapi/linux/prctl.h                    |   7 +-
 kernel/entry/syscall_user_dispatch.c          |  36 +++--
 tools/include/uapi/linux/prctl.h              |   7 +-
 .../syscall_user_dispatch/sud_test.c          | 140 ++++++++++++------
 5 files changed, 146 insertions(+), 67 deletions(-)


base-commit: 4a95bc121ccdaee04c4d72f84dbfa6b880a514b6
-- 
2.49.0.1143.g0be31eac6b-goog

