Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792A321CFEA
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 20:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743796810; cv=none; b=pbvEPe1xm2zMnUBGrqa3GSR1LHv5eavtx7k3sR0bNRnVLe7PyRopYNL+jza/YX5FlFPfsIPQPw+No9OACQ0Ugsw9kJx18aiQFEyBSokjhWCRqvYEvc1TP1YaxKn0uGP1hww/HkeKEf1WifFDikuIctSJ5X8ZIL11VyiJTFU8lkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743796810; c=relaxed/simple;
	bh=Z+hEStOqVif7943lSI/sdGCcGpwnb6+xp/b4cL1hsyQ=;
	h=From:Date:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R2IIdUXw7CuEyu926SxaTe0Z4AB+mT/0yXkYuf7MSMuNl5bIl6XNdsGEz3duBWUxG53lJJpJ40pyutfbqCP/jlEXznAJXCOdFYkNNUhYjcSDrQu7YzSkTBzECIpA1jMz7u4XHTkdNLRla7Qw5v+1MFguk3Bc6I/i/1kVF/lJaoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kudzu.us; spf=none smtp.mailfrom=kudzu.us; dkim=pass (2048-bit key) header.d=kudzu-us.20230601.gappssmtp.com header.i=@kudzu-us.20230601.gappssmtp.com header.b=vYYUvqYo; arc=none smtp.client-ip=209.85.219.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kudzu.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kudzu.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kudzu-us.20230601.gappssmtp.com header.i=@kudzu-us.20230601.gappssmtp.com header.b="vYYUvqYo"
Received: by mail-qv1-f68.google.com with SMTP id 6a1803df08f44-6e8f254b875so24113286d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 13:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1743796806; x=1744401606; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:date:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h5eZ3DGWv7e/HOiKc2xl6HutGoiiFu21dZ6Xc3YK3wc=;
        b=vYYUvqYoZQ0lNRe3DbfdCti7NVlie8G+3QpqHPNpUD5ZJOTqEbb6jwF0OQIB3M0BKz
         kA2CmeZxfO7NbjojTdBkZUtfu+nZzEUQv/AsMIoWdki/UTnJp7JB9Ulsw2YfrnRIRJsf
         JZWpISQImuJAE3rQ6K6030l3vFLdcdYuLta/+gfdFPqV4fVMKjuiZ8UhGmwa/e0RE6N8
         HbyCiZwsT5jPgMvG0j50ngyi4eWDUEBLcZM6pjrgSKh2TUm66zQbACozJLj4Tg2/Ywcs
         Xu62zren27Y8ewOAd9V79S8F/Hjd2E1rB6jnbRyoDMWRNr5g5s/cUxt8HUkP2YjRTqig
         4m8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743796806; x=1744401606;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h5eZ3DGWv7e/HOiKc2xl6HutGoiiFu21dZ6Xc3YK3wc=;
        b=MZCj3hpbGf9duHdkQ0RuFp1FBia15AXDRtkbV95qWj3phUYr1l1QbZykQeJzp5khDQ
         FA4jYnH64uAvQJD2Jsa5ItvbH7MiXwuzAkbGnn+HKRTm46jarldCY9kN397SuC/Rdz2k
         yPbdnv9/hepPTOx/9+B+CO71zu5R5C6AGoQ43vlPRLM+AhLjn9zMmPSfs8myobxyvzAS
         NS+UGx4H/tQfEty/7ADo4cByUDQRZq0cIlZZFVvLr/XaR49e+9J1DqbfLfFFNUORRRgY
         VBsNRHyd6WXdLRDFdcSP+sETPLzeXITFJ1g6pINzNbvtmQn9Qt0lqkUu2qYg9gwIyfYk
         YJIw==
X-Gm-Message-State: AOJu0YwM9dOZoXVL9VNUqhv/p0WqqB9xhiWdtmMTVXkJ/YkBwW2kazh2
	PxZLbbBGUw7ZBqYxuonraShRR6vrgu9ncL+6FbISOUkDJ8dffMAc7tYyp3Orv9NMmOKUP1UALUI
	5xpDO
X-Gm-Gg: ASbGncuvw3law9DDV8lZKM6E0PnjSl9/y2EGKsLSdEGZ17bhL3Ie0WurvIMQtgQyiG0
	R1WI1Fcv2ZyS8r1adG6BVcAiDE3Bp9Ous2y4qCXwdLIPzDIsNpJHVyuk10Qyb8FsHHj8MeNJP33
	Za87weyu9TUEZ7nbVuVBTyDyfeuRONxycGp9ELT27VNoyd6u0FPuIfB0/rCFoywLo+G4XZ+hNK+
	NsXDjgoXqypIdn5C3iHIlku6BT3n6N3eQGTwz5KAmybtdhPrzqOer5mNUUIKP2G2Co+sDudt+ql
	EXWv4/D1sgrXkk8t8sowcA+shoU9dmw/UFii
X-Google-Smtp-Source: AGHT+IH1dFd1V/bERQFGbzF7wB96i6ZViPRK9J2/g7n+bkagE+I2+GWu+MCxNK2rVP98gHE179j0aQ==
X-Received: by 2002:a05:6214:19ca:b0:6e8:f433:20a8 with SMTP id 6a1803df08f44-6f0b73f46afmr10169116d6.9.1743796806094;
        Fri, 04 Apr 2025 13:00:06 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f138d5dsm25238936d6.92.2025.04.04.13.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 13:00:05 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Fri, 4 Apr 2025 16:00:05 -0400
To: torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, ntb@lists.linux.dev
Subject: [GIT PULL] NTB bug fixes for 6.15
Message-ID: <Z_A6RauUQ2sczSMr@athena.kudzu.us>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello Linus,
Here are a few NTB bug fixes and minor changes for 6.15.  Please consider pulling them.

Thanks,
Jon



The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://github.com/jonmason/ntb tags/ntb-6.15

for you to fetch changes up to bf8a7ce7e4c7267a6f5f2b2023cfc459b330b25e:

  ntb_hw_amd: Add NTB PCI ID for new gen CPU (2025-03-18 13:35:00 -0400)

----------------------------------------------------------------
Bug fixes for NTB Switchtec driver mw negative shift, Intel NTB link
status db, ntb_perf double unmap (in error case), and MSI 64bit
arithmetic.  Also, add new AMD NTB PCI IDs, update AMD NTB maintainer,
and pull in patch to reduce the stack usage in IDT driver.

----------------------------------------------------------------
Arnd Bergmann (1):
      ntb: reduce stack usage in idt_scan_mws

Basavaraj Natikar (1):
      ntb_hw_amd: Add NTB PCI ID for new gen CPU

Fedor Pchelkin (1):
      ntb: use 64-bit arithmetic for the MSI doorbell mask

Markus Elfring (1):
      ntb_perf: Delete duplicate dmaengine_unmap_put() call in perf_copy_chunk()

Nikita Shubin (1):
      ntb: intel: Fix using link status DB's

Shyam Sundar S K (1):
      MAINTAINERS: Update AMD NTB maintainers

Yajun Deng (1):
      ntb_hw_switchtec: Fix shift-out-of-bounds in switchtec_ntb_mw_set_trans

 MAINTAINERS                            |  1 -
 drivers/ntb/hw/amd/ntb_hw_amd.c        |  1 +
 drivers/ntb/hw/idt/ntb_hw_idt.c        | 18 +++++++-----------
 drivers/ntb/hw/intel/ntb_hw_gen3.c     |  3 +++
 drivers/ntb/hw/mscc/ntb_hw_switchtec.c |  2 +-
 drivers/ntb/ntb_transport.c            |  2 +-
 drivers/ntb/test/ntb_perf.c            |  4 +---
 7 files changed, 14 insertions(+), 17 deletions(-)
