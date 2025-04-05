Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096632F2A
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 20:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743885949; cv=none; b=JYQoyGgaPs+mD7KwG0h/7FEpPIq+xWbdHJaWTMXDgdRWLF/aZ5Nt3R/wYROFTOvI7lCS+no71UdIC8fkk1I6FLpkWuWquf7/hHaJyclPj1h8ngw6VQrdY2zTXo0HAlV2C+Rkl92f5wiRIHWZ4ZN/Gun9ecMA3KWzli5ztF/andE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743885949; c=relaxed/simple;
	bh=iFBc37iiegUvj6Pmlc8hs4nu0xUKGgSgMw5TqRNQgyc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fjD5d6KnozSrdqd/WqtKwxZBlOebh2qEq6rXaiHkgWP5Pvwxa67CbJSLsG3l5mjSN94ZU6uKRCXXIiQcYG/YR59p3PJZeHRZ7XfMzDp3TaHX/I+9C2JhDl/9PtBP7hAuiPHfrkGiRPNlwJk5jSbyKFdpBcZ8LsUuuGxIqwFiqhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DBz/PIpt; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DBz/PIpt"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3996af42857so2765099f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 13:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743885946; x=1744490746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1sIl6mz/PFE9IQCpKjz35dp4OjLgY7glXaYOR1Bw3ek=;
        b=DBz/PIpt7lQUWNJDJlRV8KtUnAz+bRRXSkjX9+LvCu0Z6Q2BeoxAVVT7ZMHoo9t8MQ
         48i3D0cQfwQlL52YnIjKujHZOLyFe0xfQQiYnPJ9K/PnkV8NWUYv0J8bQnHLJUXixnvG
         bt+GOEcN7hs/9PqvHQOZ9o6ZzapE+gwHvAjaX80/IQNxfP6Trh/FFqGDtq91Kh79khce
         rcFKreJg2PPs8Q52nrCWfJDOWTK8Q4hegu+5npmzaAu4wcx3gCeuv5ooF46c/KSSSYyw
         8uTvZ7emzm9lBnCYyXde3zed+r0qj+qmPgAmN2PBKlrkYUscQOIE8q4lMhJAkYVS/q6W
         azFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743885946; x=1744490746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1sIl6mz/PFE9IQCpKjz35dp4OjLgY7glXaYOR1Bw3ek=;
        b=fhSMGY/ggJh6nSwbcsgYGv89ybFcokBY5VPN0OdSsZjNPcNQ7oanvlv+B0iHAWXD/9
         6y2wd463Uy4Y+wyj6kGVmoN9yI0dt8lgUsY2JGNX0xmCQVQcpZ7BcXHxZ6+T2p0aN11p
         2/FoCugyb5sEvztfDTdcO6arNtGg4vKe1bhaPUfUEMfXB30S79mNt+dUyGSt4jJx6tK8
         k2EGLpOcKw74oUBQQgKFo0iOsK+Qi72bvJK8MZSRaDraJ/v7VASpsemlhPLqdc3UnV/j
         48VNumhmnLKd69RMTkLb0vhnHC+gtVrbXEc9uuOiptoO6mEc4RtR9hBBYOKCgTce9AfF
         xmEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGRVzt5hysfZCFnumsw8a1wRSTDPYqvkUJQC8xNXGL2chnC86smDHJxTKQ81u2WfGUdEdo9GZXZwNzLdE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt6MJefoW3VrXkadKXCFwYJXmDsz82/XK+4K7936JfGbPafcRU
	dddwLOTYOpDykxi8hNmgqacdc2R8Ar8XAaeKA4/mQsHgXbO231uB
X-Gm-Gg: ASbGnctmCttnwVOzzdVHKhR5t3AFI0UEZb2QEr+g790NZGJGnkfinqeedEQcUt0nwVl
	fbOcTkAOxEAx7AIehnDwIMiXPyFeZGS0oHf3aN4le5HcWqMt5yEctLXk2WWp0Ad42E4s/iK5d+V
	AxecL59yGoytmYEmMT56rOYHhOKSHdOijgaH5/EFSOKk3hrHbeRv1G/zK5rzWJTnEdPiINuEhF1
	bW/jh1mAy0zM6fiQWW42TpFcz5hhJvu6XhgABh/uaTpl3EPNHpCuIZJgdqiFGBn/xOMHVY7ML4q
	PKuKexR2gWexC42BwiId/3yO14Hw5/kq6R85xCSDNSK4a+4bDAGQAekx+HIKUf7X4fM1H9vQUAU
	5UYNGE+2uHOEOj4HEQ0zd6soczA==
X-Google-Smtp-Source: AGHT+IHjhoWhpX8sAuuh4jnMizy8/9MBIIS03TzCpeXE7BuiXGXl8Cjn260VHl6n6oC2bui4HCe/DQ==
X-Received: by 2002:a5d:6d8f:0:b0:39c:e0e:b7ea with SMTP id ffacd0b85a97d-39cba942a90mr6149235f8f.20.1743885946218;
        Sat, 05 Apr 2025 13:45:46 -0700 (PDT)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096ecasm8027042f8f.18.2025.04.05.13.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 13:45:45 -0700 (PDT)
From: David Laight <david.laight.linux@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Cc: David Laight <david.laight.linux@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Nicolas Pitre <npitre@baylibre.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH next 0/3] lib: Implement mul_u64_u64_div_u64_roundup()
Date: Sat,  5 Apr 2025 21:45:27 +0100
Message-Id: <20250405204530.186242-1-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pwm-stm32.c code wants a 'rounding up' version of mul_u64_u64_div_u64().
This can be done simply by adding 'divisor - 1' to the 128bit product.
Implement mul_u64_add_u64_div_u64(a, b, c, d) = (a * b + c)/d based on the
existing code.
Define mul_u64_u64_div_u64(a, b, d) as mul_u64_add_u64_div_u64(a, b, 0, d) and
mul_u64_u64_div_u64_roundup(a, b, d) as mul_u64_add_u64_div_u64(a, b, d-1, d).

Only x86-64 has an optimsed (asm) version of the function.
That is optimised to avoid the 'add c' when c is known to be zero.
In all other cases the extra code will be noise compared to the software
divide code.

I've updated the test module to test mul_u64_u64_div_u64_roundup() and
also enhanced it to verify the C division code on x86-64.

Note that the code generated by gcc (eg for 32bit x86) just for the multiply
is rather more horrid than one would expect (clang does better).
I dread to think how long the divide loop takes.
And I'm not at all sure the call in kernel/sched/cputime.c isn't in a
relatively common path (rather than just hardware initialisation).

David Laight (3):
  lib: Add mul_u64_add_u64_div_u64() and mul_u64_u64_div_u64_roundup()
  lib: Add tests for mul_u64_u64_div_u64_roundup()
  lib: Update the muldiv64 tests to verify the C on x86-64

 arch/x86/include/asm/div64.h        |  19 ++--
 include/linux/math64.h              |  44 ++++++++-
 lib/math/div64.c                    |  57 ++++++++----
 lib/math/test_mul_u64_u64_div_u64.c | 136 +++++++++++++++++-----------
 4 files changed, 179 insertions(+), 77 deletions(-)

-- 
2.39.5

