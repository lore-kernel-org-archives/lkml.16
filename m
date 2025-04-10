Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6049F1DFDE
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744268732; cv=none; b=aMWEgwr40tuEeIzeo21O9aJ2TxeHYAJ9j67nl0avchQ7QnUb8ojD+5EvIK+kImg5vROknI6se4EahT+dUMBE+r9OHA3Tencdxd2cbVMAQr6H9HeURumXNKChEHdwIw4TYVLeFXcXjueOIdDXY8QtVu/6veDP4vlvKugR9tDrfRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744268732; c=relaxed/simple;
	bh=7hWJQdoCyi+3cNpW78Iin5tlyn8Ip64fOzSIxgSjWBk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VB0Wzmaa1ZjU3+jYJUOulZf2R8KCXRCmNnxAWJLG6xIYHr9yxlgOoDyEQdTQfo1+XmIJMErlZHaCDUmHwCugDPID/BlttczXz3tYpage8xQaLj6VbwzSUzufOBt4P55sCL0GhgOI4nmqgtUZ3vIpf6hOHQ7TZRkBD6uWdFqBsVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=fnXw6QHj; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="fnXw6QHj"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3f68460865aso354546b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 00:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1744268728; x=1744873528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r4B+r76KGyj9PQoVMZG+CNBPOS4MHHbIZygRDgwNdE0=;
        b=fnXw6QHj2u8KQdkPlho7uMqT5bA2Gg54xWmGhCUumYXrBSwIEFxh/onxWcdkYWauHK
         I2L+2edTObvFyts0V84FIq1J0CqMt43zO8tPD0UlAAgIMa73LuC8NMOV48JhUPE4rzBh
         CksgZPPcyhXhy3T5I1fRyRJd4lckONrBRh9/nlf6GkFQksRp/ZJazwZWS51qn4zwRZNI
         MRw2f/yksJ1HiSNPJLwa8cZO/7eDVaZIfBxA+BZRls6q60kEPfbHQG94yO9Cf/Ba9BkT
         NUbZLwhdnG1gMDwsAV5jW18WI5KZT+BzaJnI9/GezO4xnYu0WvHJRJgOtORhQjj3Xh7w
         NQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744268728; x=1744873528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r4B+r76KGyj9PQoVMZG+CNBPOS4MHHbIZygRDgwNdE0=;
        b=JQiGzAoJKIYU2sJavvFOZemt7GTrdv5AN87qzX2ve7lphuVrTV9+u7u6d43Ai1ISrM
         kg3TmylTkb0P9Zfx93GncRmrZKIvvViip5bHkHZFVeDxrtm4p/3rjQ3a98J6h9WNSSjt
         46Z1eim5tZbiaEQ7VeayWRsNvgEDH6BnvOX1bDjXh/ksk3yXbIS3ZDB2iA5qRlJYlzT6
         TZwzq5qf6Sx46gc1Bq60v2bmZ8rd9FCTyKHHpqo2nphYbIyLAL/2Wv5zcHa+u1EG3gIq
         6cOvch3aTwtc++AI3RvEeRx27jb31rxx58piaSyFDr+9wYVfRaqRD/lQ25i7IEtmOPWg
         GHfw==
X-Forwarded-Encrypted: i=1; AJvYcCXhCOLBTwNsDIpDf5QdU8gw6LC5hPHPc4+H4EK0DhdOv9tqw16GiCLsnvNH0tJqGf6/zt4NC244PxTXYNM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY2zCkSQUMgxeHQn7w8QLwFQF2mqp6gTl66GjaC8Ur2nh+oRhy
	80ZV0RxctbeBDUjXmTNjGDMjJt1ccfmgjou+c+cR6ec/MxcG2m42KMcPmgy+3g==
X-Gm-Gg: ASbGncsT5RLXUHtc5Sc7Ym8SviifsxoCz1eRk/9ASZwcELNbKBWbzCs6529cxvGQ+bF
	KIH8EdNp8E3wg5vuu2qW8DEM18A9QJmGCZtwk1AAijScoFkJ+SUn66y36U1rDeJG12PIeisioaS
	/AOW0jFEI3pMhZKqwBDBbpJLasx/GjJgwI3Lt01rCvI0Lswq0xwh21NyraBBfG3GqEk6QVCjlaS
	Y0uNeS/PDYHZ8ydNxDlWXSKSqGoGVT5KyeyGqdZAx6wWZvN8+dhgWbLZV0bPtnipFZMA0nXk5Vh
	BGcCopz9bPQ6cqng14Gl/WysSLa4tl9sr+O7hPT3sJEryR91ylICQnwFLtY=
X-Google-Smtp-Source: AGHT+IE0G4eyDdJwnFSAO15PM4AGl0rNOflCYe5zhewyGprP1/yMke440QYr7XRmFAHXObEZEqUpLQ==
X-Received: by 2002:a05:6808:170f:b0:3f8:acb4:8d8e with SMTP id 5614622812f47-4007bd5fb16mr847250b6e.39.1744268728298;
        Thu, 10 Apr 2025 00:05:28 -0700 (PDT)
Received: from aus-ird.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40076282ce8sm461369b6e.9.2025.04.10.00.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 00:05:27 -0700 (PDT)
From: Cyril Bur <cyrilbur@tenstorrent.com>
To: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	paul.walmsley@sifive.com,
	charlie@rivosinc.com,
	jrtc27@jrtc27.com,
	ben.dooks@codethink.co.uk,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jszhang@kernel.org
Subject: [PATCH v6 0/5] riscv: uaccess: optimisations
Date: Thu, 10 Apr 2025 07:05:21 +0000
Message-Id: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series tries to optimize riscv uaccess by allowing the use of
user_access_begin() and user_access_end() which permits grouping user accesses
and avoiding the CSR write penalty for each access.

The error path can also be optimised using asm goto which patches 3 and 4
achieve. This will speed up jumping to labels by avoiding the need of an
intermediary error type variable within the uaccess macros

I did read the discussion this series generated. It isn't clear to me
which direction to take the patches, if any.

V2:
I've taken on this series as there isn't any response from Jisheng. No
significant changes other than build fixes.
- Fixes build breakage in patch 3 to do with not having used 'goto' keyword.
- Fixes build breakage in patch 4 on 32bit not having declared __ptr in the
  macro.

V3:
Significant commit message rewrites.
 - Corrected the justification for patch 2
 - Better explained/justified patches 3 and 4
Minor code changes for legibility and more comments

V4:
Fixed checkpatch errors
Added a unsafe_copy_from_user()
Added patch from Ben Dooks to save SR_SUM bit on switch

V5:
Fixed mistakes in adding unsafe_copy_from_user()
 - Sorry about the noise

V6:
Reworded patch 1 commit message
Patch 1 no longer clears SR_SUM, just saves/restores

Ben Dooks (1):
  riscv: save the SR_SUM status over switches

Jisheng Zhang (4):
  riscv: implement user_access_begin() and families
  riscv: uaccess: use input constraints for ptr of __put_user()
  riscv: uaccess: use 'asm goto' for put_user()
  riscv: uaccess: use 'asm_goto_output' for get_user()

 arch/riscv/include/asm/processor.h |   1 +
 arch/riscv/include/asm/uaccess.h   | 218 ++++++++++++++++++++++-------
 arch/riscv/kernel/asm-offsets.c    |   5 +
 arch/riscv/kernel/entry.S          |   8 ++
 4 files changed, 179 insertions(+), 53 deletions(-)

-- 
2.34.1

