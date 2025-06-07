Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F4627468
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 02:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749264842; cv=none; b=mj/5toE/s3W1PzC/DFNhpe4lEFIs6G+R/ub3r1/4BzQ4KvvZwS6/Pv4/qcSv+oTZs3HT3bVmQpedK0zzO2Y+9WoNT4EXk+SCFfvI9Gv47LSiUN8JdaeN/yu2Woqq23jjTQfugVRmZM2tyJldb+ehq76LpoP8d/bCBr7xuHgFeac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749264842; c=relaxed/simple;
	bh=DlBaewAA+ovTE7nzNZ0gfmioiWclhmgO3IlQrbrct5o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cZU+BPagwgbnU/zFu/lm7JYmaTPgp1qyw30SX0cNIBjpjkmNOjF00/7XpxOlGu0+QhBmmr54fRvBlS3eQ3GqmtpeW36+GxIRfYtadelMBxmRc5/PNPo6wI5SZGe7SSSUj03Ai4LKFylsi/+1/algl0SMySYIcuv8za9d9+kHXdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VPWAJctp; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VPWAJctp"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-3a53359dea5so677989f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 19:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749264838; x=1749869638; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d8AB0D5JOvGYjX2dpcO3lbaRK+7xpSkRk0OO2w6sGwk=;
        b=VPWAJctpjOSiVMgnWcmaeUg/rilGXNARVB1/p51qvxNfSf/eWlIs3K2ZrsT2cBJiO4
         gxJFMZgWbEyM7obAkuCi4gyFwjZb9BNUGM8Zj4nPXbZhl9bRORi4TxDXoxGPhEOLNdl7
         ew6+F1+Ghe+lpfXezTv+setwWpBiyk5n+gDQiPT8oUS7wIyadt0DnaUk+c3GhstKEUoU
         wcKdch+fVSqo/ETh/kFAhDk50l/vVv2kCoApPDJzZt+TdW+4twlYpgIuaKYdg0aULndQ
         fFN7aT58Je/Xmxs3p9fGyqXwDSiKwvKotew1425vXqfnFsL7R3iUnoo2k3p9RBKkbAvF
         0OHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749264838; x=1749869638;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d8AB0D5JOvGYjX2dpcO3lbaRK+7xpSkRk0OO2w6sGwk=;
        b=TeOEHJzhnFhJ/YhnXMczAmnDQ0s30enlnAxdZ7sVOCREJdCPABCiA+xrwlicflB5Ez
         z96zd4SBSxd+N7/Elge6Azb1A6eBofoqs6do5oxRBtjY7Cq5/QU+KOoIwwdtgD43Dp7r
         Ahq9YKFss1y1+VV7cJyrrap471r1MDpdC75CZQruDAkDXyKw345sCxTsaVBiPAgqTyVk
         oxiMjXQ3c4e4zWJ6I04/AS4NK6YviHPhv20z9h5TvGIkXMY5ybQqjrRwQsYCWftwv5N9
         vXjR26CuLoCqNeSef8cqnR+aEl5mFnB+0OOkWoXKjkRV/zR3QyzIFUh9TT+wlmlDwUsA
         aUbA==
X-Gm-Message-State: AOJu0YwvT2nCbvRGMSiov1bQFLqntlkr6Ds3IEro1zQmo+5x84KebVCW
	7LLUg0PTpDCZawegX37kS4pqQi5phbNn2xRJt+jZ98NhHuJoM0KZG/0HKWOSSb+70i0=
X-Gm-Gg: ASbGncstjnKZKIzDxtghzgdfccB9CfmMKwo85/KZGT+Rq3LUvFKHERTjgPj6u3iExcD
	c+Gq4tBDbYEqZuywdW4nfNJimaDIVp3YSKpv8MrqdtjZqcjdfJbT/ilgapRW8PlYeZr5gcJGtFv
	y0tfdOnzWaTzlf4O0M2uwKxCdTQY/VeWx2GdC22at24lWKvrdmeLU3KyeZQqeUdXcZjIu3tMULf
	tlQxWEzWwwycQ3Y9YCmh8KUkb4ayh5nF4R93IpJnuHovWgdnlF3bVG+s4CEqds7IcIFbE4C2DXz
	itT3PoOhbIshhzQaRSZiD/dIMKg5wbiAbCZCk26Q5uVfH91N0mgeeV2eSQ0=
X-Google-Smtp-Source: AGHT+IHShYQtnCxYffZd53hg8+hhCGTXjO/OocFI6hhZSrjjpXUQTLeXH1KRlfClVKp1b+8IXy1o1A==
X-Received: by 2002:a05:6000:144e:b0:3a4:f975:30f7 with SMTP id ffacd0b85a97d-3a5319b4e68mr4801932f8f.56.1749264837970;
        Fri, 06 Jun 2025 19:53:57 -0700 (PDT)
Received: from [127.0.0.1] ([2804:5078:80f:b600:58f2:fc97:371f:2])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-530e6429475sm2005465e0c.45.2025.06.06.19.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 19:53:57 -0700 (PDT)
From: Marcos Paulo de Souza <mpdesouza@suse.com>
Subject: [PATCH 0/7] printk cleanup - part 2
Date: Fri, 06 Jun 2025 23:53:42 -0300
Message-Id: <20250606-printk-cleanup-part2-v1-0-f427c743dda0@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALapQ2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMwND3YKizLySbN3knNTEvNIC3YLEohIjXWOLNIsUU0MDCwNLSyWg1oK
 i1LTMCrCx0bG1tQDCWrwyZgAAAA==
X-Change-ID: 20250601-printk-cleanup-part2-38f8d5108099
To: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Jason Wessel <jason.wessel@windriver.com>, 
 Daniel Thompson <danielt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Richard Weinberger <richard@nod.at>, 
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Johannes Berg <johannes@sipsolutions.net>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 kgdb-bugreport@lists.sourceforge.net, linux-um@lists.infradead.org, 
 Marcos Paulo de Souza <mpdesouza@suse.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749264832; l=1540;
 i=mpdesouza@suse.com; s=20231031; h=from:subject:message-id;
 bh=DlBaewAA+ovTE7nzNZ0gfmioiWclhmgO3IlQrbrct5o=;
 b=uaTXBJLcvhgf5YKL4OJgFRYKVnwKvnF9HHj0A6a1DeNA/cKGB2zz4gtZcmbgnKD0ZnQ5jzr1u
 IL5jbxZWwPtDKhU0kF+79D2EX/S5HQyeZSKJDCeivyLlYkj/oRqQ8Gh
X-Developer-Key: i=mpdesouza@suse.com; a=ed25519;
 pk=/Ni/TsKkr69EOmdZXkp1Q/BlzDonbOBRsfPa18ySIwU=

The first part can be found here[1]. The proposed changes do not
change the functionality of printk, but were suggestions made by
Petr Mladek. I already have more patches for a part 3 ,but I would like
to see these ones merged first.

I did the testing with VMs, checking suspend and resume cycles, and it worked
as expected.

Thanks for reviewing!

[1]: https://lore.kernel.org/lkml/20250226-printk-renaming-v1-0-0b878577f2e6@suse.com/

Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
---
Marcos Paulo de Souza (7):
      printk: Make console_{suspend,resume} handle CON_SUSPENDED
      printk: Use consoles_suspended flag when suspending/resuming all consoles
      drivers: tty: Check CON_SUSPENDED instead of CON_ENABLED
      drivers: serial: kgdboc: Check CON_SUSPENDED instead of CON_ENABLED
      arch: um: kmsg_dump: Don't check for CON_ENABLED
      debug: kgd_io: Don't check for CON_ENABLED
      printk: Don't check for CON_ENABLED on console_unblank

 arch/um/kernel/kmsg_dump.c  |  2 +-
 drivers/tty/serial/kgdboc.c |  3 ++-
 drivers/tty/tty_io.c        |  2 +-
 kernel/debug/kdb/kdb_io.c   |  2 +-
 kernel/printk/internal.h    |  7 ++++++-
 kernel/printk/nbcon.c       |  8 ++++----
 kernel/printk/printk.c      | 32 +++++++++++++++-----------------
 7 files changed, 30 insertions(+), 26 deletions(-)
---
base-commit: e728cdbeed0667b6261fceeddc91ef1420463ac7
change-id: 20250601-printk-cleanup-part2-38f8d5108099

Best regards,
-- 
Marcos Paulo de Souza <mpdesouza@suse.com>

