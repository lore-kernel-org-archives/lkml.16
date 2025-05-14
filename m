Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC71519BBC
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 13:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747230403; cv=none; b=EMVN/Dzsis7HE93EotfhaPPhCQjewb6IUszS9xpjy5K1yBQJXx15z+p21t7xOPz7EB4D6ObEoGTFsZnsKbCKgp6r+I2vloXxn4zpbPeRbesVFd925Sx/UZGYRXTjLPE10Arh0mFFljYER2sgSuU2WVYybNgQPT2W6i/7X0Qycwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747230403; c=relaxed/simple;
	bh=PSDzFJ6pwrZPT3XWZdI28VfZnrFAtzEea9+QlIcF/0s=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Vfcb85spxoTZIhR6/vr8Z75hdNy4rrVOhw3JyrRBBZM4BOS8ZtrU9ZFoQH34IWQHga2S+vlEdn9Loy1MVTBVWehZ/YkHjQ0mQwxX4JOMZIZNCsQ9dVgpYOWcujn4uqxfrTxW6LCLI10jzWYtQsnhq1KklvBh/GWpLpVI+qs31Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f7WUk6OP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f7WUk6OP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747230400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=s6k9/GzU7jK7zlNovm76Gy0+NwNfyykNoxZQiNddalM=;
	b=f7WUk6OPTaxohewWw5gxTHFZdvkCSZyceI84kgDXAd3E9e1TERl327+MxD4HeaRblBcyTG
	75ZWX5kC//TL1OXPPsPZDnj6ZXSTf+BEbX0rDHieNIiUNNquBKpWbuej0K0GIaQUzh4TN5
	lcF+u62wreVX5tLVw4assxBQzvzy9zQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-Qjqq5oshMOarxr2MkNdxmg-1; Wed, 14 May 2025 09:46:39 -0400
X-MC-Unique: Qjqq5oshMOarxr2MkNdxmg-1
X-Mimecast-MFC-AGG-ID: Qjqq5oshMOarxr2MkNdxmg_1747230398
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d5ca7c86aso33728115e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 06:46:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747230398; x=1747835198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s6k9/GzU7jK7zlNovm76Gy0+NwNfyykNoxZQiNddalM=;
        b=vDzYr2kwL6Y4T9yXdHZhq+6GDC/357xvbVJjoZk1CdIT8B8D31oLV4ZcHi5bxoYmZA
         Mw2xc5R42BQu7Jyerx0BDY7lRMAqkz7q2+BCPnUeUxSyg3VthmE2VujuQbl4ndV6KyS/
         i9DmpVith0vDojDdraVXU30NHHYdpr1/giqFIhqHU0EmyyUm6o3rrbTb+eGvnPdnX5aq
         AIe60ru5d7r5eJQ7qvsQwgszkn8JZftpMkCfu/MSZjwfNB10qUW2iKPFmFkJLXSOZbqp
         RyP5BDQgGHSfYIeefH7aOyd0NFl0USinETxeglyurxNQ2pLfXUkyB1xvNkHBxmWud88E
         o6MQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwpXGCOX1ivMyV2si9oVZFxcvuDavrjVf8l4lpTDu0LA4MylgQWzW/nQBoZjXoihdussO+AE4/FXzkdeU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgD2ba0l6LiXC/qXu4KLC7yR2sqq9NKlW2OyixFvI5snLH9+Pg
	/bNZzYBeaKXXWpSVBE4LQW/0KMtgp7Pz9+y/T1v+XLEBzFwLo0RJcsKefOXBd36DHzSfTmmP+Yb
	TwcfQHUAFY4hjdNuvh3zoAkXX1MsTEUQpDa/PwdQQ5xCyaWcKOUHz9RbMH/h0ZQ==
X-Gm-Gg: ASbGnctRBW7L88Gl4FFisn6fC8NR3KadVQR7Jom68tynT3+a2xcc+LFOkFM5yUd1v10
	cKcJitJktnGgsmbrtRvz/Kb2I8OPPuog/LZIqpubjH9tOHk608KOvGgngAeLtSd45YSLBkgSuSs
	totn46hbsnR+E07reWbNta5W62d7M2jtEQm/qLFRamKP7CzXVuxtY5bmGfg7HozeYvfLyeP7yhl
	aahQLcm4vySSX/JsJt/cncxIN04NA7VHPJdBLhDkfPJkmFBEt+dEFckg321DT2qN/HYpWGTm7ts
	ivA9Ow6RJziO9xNIDuY=
X-Received: by 2002:a05:600c:c07:b0:43c:e6d1:efe7 with SMTP id 5b1f17b1804b1-442f21690d0mr31437675e9.26.1747230397909;
        Wed, 14 May 2025 06:46:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFY9vh+bpQG79sp/6DI8di3RxLNOV35Az0tewqTY/ffxwzq3/IqQ2Ik1HsPTwPjASd5o1gbLA==
X-Received: by 2002:a05:600c:c07:b0:43c:e6d1:efe7 with SMTP id 5b1f17b1804b1-442f21690d0mr31437185e9.26.1747230397293;
        Wed, 14 May 2025 06:46:37 -0700 (PDT)
Received: from stex1.redhat.com ([193.207.148.196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3951b62sm32993785e9.22.2025.05.14.06.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 06:46:35 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org,
	Peter Huewe <peterhuewe@gmx.de>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	linux-integrity@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-kernel@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v5 0/4] tpm: add support for sync send() and use it in ftpm and svsm drivers
Date: Wed, 14 May 2025 15:46:26 +0200
Message-ID: <20250514134630.137621-1-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is a follow-up to the discussion we had about whether or not
to add send_recv() op in tpm_class_ops[1]. Much boilerplate code has
already been removed by Jarkko with commit 980a573621ea ("tpm: Make
chip->{status,cancel,req_canceled} opt"). With this series we try to
avoid also the temporary buffers needed between send() and recv() for
devices that do not support interrupts and provide a single operation
to send the command and receive the response on the same buffer like
tpm_ftpm_tee.

The biggest advantage for this approach is with tpm_ftpm_tee where we
remove the local buffer and extra memory copies. For tpm_svsm it does
not change much since we continue to use the pre-allocated buffer,
to avoid making an allocation for each command.

Introduce a new flag (TPM_CHIP_FLAG_SYNC) to support synchronous send().
If that flag is set by the driver, tpm_try_transmit() will use the send()
callback to send the command and receive the response on the same buffer
synchronously. In that case send() return the number of bytes of the
response on success, or -errno on failure.

This series is based on "[PATCH v7 0/4] Enlightened vTPM support for SVSM
on SEV-SNP" [2], which is currently merged in the tip tree and available
in linux-next.

Thanks,
Stefano

Changelog
- v4 -> v5
  - changed order and parameter names to match tpm_try_transmit() [Jarkko]
  - rebased on next-20250514
- v3 -> v4: https://lore.kernel.org/linux-integrity/20250509085713.76851-1-sgarzare@redhat.com/
  - reworked commit descriptions [Jarkko]
  - added Jarkko's R-b on patch 2
  - added Sumit's R-b on patch 3
  - rebased on next-20250508
- v2 -> v3: https://lore.kernel.org/linux-integrity/20250414145653.239081-1-sgarzare@redhat.com/
  - fixed comment style [Jarkko]
  - renamend `out_send_sync` label to `out_sync` [Jarkko]
- v1 -> v2: https://lore.kernel.org/linux-integrity/20250408083208.43512-1-sgarzare@redhat.com/
  - changed title since we removed send_recv() op
  - implemented TPM_CHIP_FLAG_SYNC idea [Jarkko]
  - removed Jens' T-b
- RFC -> v1: https://lore.kernel.org/linux-integrity/20250320152433.144083-1-sgarzare@redhat.com/
  - added Jens' T-b on ftpm driver
  - removed last patch since [2] is not yet merged and will require a new version
- RFC: https://lore.kernel.org/linux-integrity/20250311100130.42169-1-sgarzare@redhat.com/

[1] https://lore.kernel.org/linux-integrity/Z8sfiDEhsG6RATiQ@kernel.org/
[2] https://lore.kernel.org/linux-integrity/20250410135118.133240-1-sgarzare@redhat.com/

Stefano Garzarella (4):
  tpm: add bufsiz parameter in the .send callback
  tpm: support devices with synchronous send()
  tpm/tpm_ftpm_tee: support TPM_CHIP_FLAG_SYNC
  tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC

 drivers/char/tpm/tpm_ftpm_tee.h      |  4 --
 include/linux/tpm.h                  |  4 +-
 drivers/char/tpm/st33zp24/st33zp24.c |  2 +-
 drivers/char/tpm/tpm-interface.c     | 22 ++++++++--
 drivers/char/tpm/tpm_atmel.c         |  3 +-
 drivers/char/tpm/tpm_crb.c           |  2 +-
 drivers/char/tpm/tpm_ftpm_tee.c      | 66 +++++++++-------------------
 drivers/char/tpm/tpm_i2c_atmel.c     |  3 +-
 drivers/char/tpm/tpm_i2c_infineon.c  |  3 +-
 drivers/char/tpm/tpm_i2c_nuvoton.c   |  3 +-
 drivers/char/tpm/tpm_ibmvtpm.c       |  6 ++-
 drivers/char/tpm/tpm_infineon.c      |  3 +-
 drivers/char/tpm/tpm_nsc.c           |  3 +-
 drivers/char/tpm/tpm_svsm.c          | 28 +++++-------
 drivers/char/tpm/tpm_tis_core.c      |  3 +-
 drivers/char/tpm/tpm_tis_i2c_cr50.c  |  6 ++-
 drivers/char/tpm/tpm_vtpm_proxy.c    |  4 +-
 drivers/char/tpm/xen-tpmfront.c      |  3 +-
 18 files changed, 83 insertions(+), 85 deletions(-)

-- 
2.49.0

