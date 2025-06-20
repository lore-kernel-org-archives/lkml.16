Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6ADE28CF76
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 13:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750424909; cv=none; b=r2SwAglmzIjToR8CA7GqCt0IlxoT4uS1KCuq94r4gJY/A/jISnl/I7CwhTFhplF/367lTnKSOf1Bh5glKhnB7z/7GTDM+tbfILRnrtUbVZBiK300dlO9W+I9onAFGVBtvQ2ZEzzRZU2HWsclsiZuppXwIi4SSLVrOR2JXi7duas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750424909; c=relaxed/simple;
	bh=/eRyrPSfVH4pb56171VjO8PcLakHMAQoKvhNZP2d87A=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Go6Me/WpyFig40yN4LKWSgZaW856VP2zzNxCtTw2jaeRHGSLX4mjS0G0OfoSab5OY+8tiWkhLcDiyFCjx4nyFkyNw+bbt4oxAGHtUAaXMJ8tOMx1ZNpW4g6J2f3WItozx+0HR9yQzlWwedzIorKYwhCaKblLaVHbYsrv9zTUf7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BhOrnrZe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BhOrnrZe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750424906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=efezj3LnMENDrFh/B5S35gvfWn7TvlAanxYCoetZO3w=;
	b=BhOrnrZeqFQT/RphKQgy1jZE58cRPgjN5Kxtrru7d7do2NIWl7gO73iL3bftk+Za961Vfd
	NuRlfBRG5GN/LMbFsjngz3MxjTnqvfLFAYkdyF73gQSKmM62XlYoQXJm+sQZ0+wzlkG98W
	gIoMVWHNVLN8eYJ2P3a9lQAnR+Y2Ayg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-93-li-FVJFxM9aHd0M71dKmIg-1; Fri, 20 Jun 2025 09:08:25 -0400
X-MC-Unique: li-FVJFxM9aHd0M71dKmIg-1
X-Mimecast-MFC-AGG-ID: li-FVJFxM9aHd0M71dKmIg_1750424904
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a37a0d1005so1125467f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 06:08:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424904; x=1751029704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=efezj3LnMENDrFh/B5S35gvfWn7TvlAanxYCoetZO3w=;
        b=px7+KHBdicl+OyssDP4LTmlUPoPtYkgut0JzEiAxB7id50uY9N2JkOxK/4amvup9uk
         3B7ov1ESjp586HoqcXuPbs1Tr9eXOnkcSYawguZhlSOlA0boYQgiJC+WxKh2qfS5zBRe
         xceEIod9jl0XbsUELXe3EzOnFWwaSE6IqWfaWl38viGv9ZTP2QRuyD9DXfSm1DY/9DaK
         /20LKmZcvu6VnpO+kOR0kAwwUyf247Ya5FOD00HRXlJ504HwyxBhjJycYpdXBtsIiLLM
         XSnj7fIbUt1Lc2Nn3Mh4Bz2JxxH48Rb4rjge/mEf4lvuk38VZoP4qHrwqlsMWac+N1Hs
         Xq8g==
X-Gm-Message-State: AOJu0YyKo03lYflsqZXDIAi+JoRE5ZBLzt8j/P4qv29pm9U7UU2D/sqE
	AZcmlMtA1GdzY8luqn/RYm9xQAv74vlGhevF0oLa8bNgqTZ0cdF6bCdWhswASgmx1ibioGQHHZm
	GGBq3MZkqhLpIa0TYkB9/1FM/GeUP0tSGZjNqzYKvZYtwcnUUpVvaFBsPxrXwvgcXly4G4tj8jg
	==
X-Gm-Gg: ASbGncvMWBeVwK8J4HLeWhqLsfasjypg6pqqsMxACAYtSOfckf3u0B0h+2AMu4iXh8F
	FOKHlRMZhMNHev9/DhjSUYCbRnhBkstEEb+xtw03kJt2qUdlXTVpoZWhKU7kEVMFvvr38RzPO4A
	Ri/Plb3YsyiuL5r9R2vljOa1IENamWupOdW70HObYbN1+J6022xHEZz4odRzamfLF/jZ1VBT8wm
	80tcoMu7qS20gffJ/cH3D/AiiCRag6bVTHogj4qWJ2/zxALoxW3dkNRTvzxBaJs4LRM0L5RCgo4
	OIt9DMVKNy+pYYC3WtjN34/gqSiry4hQXVQ=
X-Received: by 2002:a05:6000:70d:b0:3a4:ec32:e4f3 with SMTP id ffacd0b85a97d-3a6d12e8d73mr1963674f8f.17.1750424903392;
        Fri, 20 Jun 2025 06:08:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvQvIvRiOMOwY6vcPGATBD4+Ygw2boYIIBCDTjikBg4YIpBv3nF1VGt1H//5h9pdOChc4ssw==
X-Received: by 2002:a05:6000:70d:b0:3a4:ec32:e4f3 with SMTP id ffacd0b85a97d-3a6d12e8d73mr1963604f8f.17.1750424902439;
        Fri, 20 Jun 2025 06:08:22 -0700 (PDT)
Received: from localhost.localdomain ([193.207.146.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f19f9esm2059296f8f.39.2025.06.20.06.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 06:08:21 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Naveen N Rao <naveen@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	linux-integrity@vger.kernel.org,
	Peter Huewe <peterhuewe@gmx.de>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v6 0/4] tpm: add support for sync send() and use it in ftpm and svsm drivers
Date: Fri, 20 Jun 2025 15:08:06 +0200
Message-ID: <20250620130810.99069-1-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The content of this version is the same of v5, but rebased on current
linux-tpmdd/next (`git range-diff` on v5 is empty) after the merge
window since tpm-svsm patches were merged with another tree, so we
agreed on postpone this series, see
  https://lore.kernel.org/linux-integrity/aDCb-wkHGoLQ-IGg@kernel.org/

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

Thanks,
Stefano

Changelog
- v5 -> v6
  - rebased on linux-tpmdd/next - commit e271ed52b344 ("Merge tag
    'pm-6.16-rc1-3' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm")
- v4 -> v5: https://lore.kernel.org/linux-integrity/20250514134630.137621-1-sgarzare@redhat.com/
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

