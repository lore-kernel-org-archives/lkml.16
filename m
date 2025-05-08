Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C626121D3F9
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 17:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746726679; cv=none; b=JNAqkUY+4m8yCPzHuG5TQeKssNd5Tj+fp9WCfrvzB12FXWV6toInmcAeKgl0Ox+QjI5BmC2qjovUmDlUjoTeBToEdGzg70cOgUCobQAtnhzwQ6/0PiZOnuCI1iKYOLfjMoxWuTYdyFtMIY5O0rcChc/iZwDxz/wEkw2i9YxdqrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746726679; c=relaxed/simple;
	bh=nssSBeCkXHTHuH7oP/DIiP3G47FdBuIT9jFk4RFLUoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CXTnNHg+PI/msVP3S6Io/ULB3eGVp9AlCa7wpA4qviyRu/M8Un9pKv3LvEQtSS+MorAR4E+JMlqos1QlCu0k0MFqq/U9Wmd23+ka0CsvWwtFTMb+rDB3ryrSYos56KfgX2hN249EsOWTg3JkJSoXqrcGdz2TjpAsLQc18k4qzZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BhhuQMyC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BhhuQMyC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746726675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=H7pvuB9Kat/lENMiaug5ERD4iLY8+Gw9do+INRaXLYY=;
	b=BhhuQMyC4+emT4QFD5BrGyeVsrn/djAh7UkTu42IM0TgQYRTuZM2ihQW9cuzM8Qp6W63i/
	ShVeTrfj+I2a4UKF11rXe+geva94nPqme8kS3EmPZzOvfdGLbswO21RaJ+iKbQtWzW+nOv
	RvibyuHFECJ/uPf6nlxC3eOdRmjt/9Q=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-1K_uSW_hP0Kkm_0mXRh1_w-1; Thu, 08 May 2025 13:51:14 -0400
X-MC-Unique: 1K_uSW_hP0Kkm_0mXRh1_w-1
X-Mimecast-MFC-AGG-ID: 1K_uSW_hP0Kkm_0mXRh1_w_1746726673
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3d9659d8bb3so2428615ab.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 10:51:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746726673; x=1747331473;
        h=content-transfer-encoding:mime-version:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H7pvuB9Kat/lENMiaug5ERD4iLY8+Gw9do+INRaXLYY=;
        b=b6r8IJejRA1OFuT6uQFvWil/3OcXFhkIPCzdZVEl0wNBkfL0iS+EaLfVEla/GKB/uU
         7Z/0MQS3+wNS1q0we6KloBa2DziyE+TFt47trR/0NKHl945fOiwlV0EBmvVgmAjlTAEO
         0Dt1z2Iq4KhZ47w5e41QhZwagebego59y1VQenl8D2f8Jm9BqGKmasPcdsLDXTRFB8/p
         +aqakLL4pUPinfUasn/lZJOid99gn1z5Afyr5V0HIqCPQnQ7hp1JNtrFfjG2DBnMXT0p
         m5R/tnB6Dikw2ozbbdj4yGN6fBmnBI5wOJLnBuNKOGlLZ7iPEQhbzQ3j9T/Ph/ZgGKKa
         6xag==
X-Gm-Message-State: AOJu0Yy5cP90uL2PiXwXFv7YP5uNevHegWQ7oqxVCFcnfFbrO51lQ0H2
	TJLvaBC4rb4B5vV5mgC5in6iDdYOtrvRFgv/mtXJx4GBUmO4hGv6pCL68u5F91vqvF4ij9yKnb5
	FpMOXbYlfVJxRC7wvKe6HWqsH5zGlVex7JTVyyKAukL+rr2E2rWCB0eRlvOIuDA==
X-Gm-Gg: ASbGncs+pMXiNZySjjWeEIwodguGmdJCJS/ZomS1RPwt8L7hvXDouV/x8nxLKOF2uG/
	qiIzzmUzJEOuwhJ6pqWPo4ieJf95nobRiZU5vqNcK+5yK1r4ZoaZBqUMmuhGrC1b7Y6NkgKfedj
	VmzmJYSytDH/ZJI2KYdaHZlHw3Wm7XvCHMuNYmsnkD3dbv6lyRAyfZuI50Hl0uAlidhwEYGTUnd
	UmOG7pPFLYkecqXZgxMkhl8n0XmZNqgsuvashi045nUIaR5PF1uZAoroQkAhammibRsOpOUPJar
	7izcrO9FNQY6h2Y=
X-Received: by 2002:a05:6602:2dd5:b0:85a:fd80:df2b with SMTP id ca18e2360f4ac-86763541687mr21930539f.2.1746726673323;
        Thu, 08 May 2025 10:51:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkQt9myXVwB7o8pNg5TdGwRTEQjZSHkXMWZXuNibUqf0c2zhrB2WfJ9C26jKFu4Cg7bvroow==
X-Received: by 2002:a05:6602:2dd5:b0:85a:fd80:df2b with SMTP id ca18e2360f4ac-86763541687mr21929939f.2.1746726672993;
        Thu, 08 May 2025 10:51:12 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa2250348bsm63280173.55.2025.05.08.10.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 10:51:12 -0700 (PDT)
Date: Thu, 8 May 2025 11:51:10 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: <linux-kernel@vger.kernel.org>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>
Subject: [GIT PULL] VFIO update for v6.15-rc6
Message-ID: <20250508115110.5ac2ee95.alex.williamson@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Linus,

The following changes since commit 92a09c47464d040866cf2b4cd052bc60555185fb:

  Linux 6.15-rc5 (2025-05-04 13:55:04 -0700)

are available in the Git repository at:

  https://github.com/awilliam/linux-vfio.git tags/vfio-v6.15-rc6

for you to fetch changes up to c1d9dac0db168198b6f63f460665256dedad9b6e:

  vfio/pci: Align huge faults to order (2025-05-06 12:59:12 -0600)

----------------------------------------------------------------
VFIO update for v6.15-rc6

 - Fix an issue in vfio-pci huge_fault handling by aligning faults to
   the order, resulting in deterministic use of huge pages.  This
   avoids a race where simultaneous aligned and unaligned faults to
   the same PMD can result in a VM_FAULT_OOM and subsequent VM crash.
   (Alex Williamson)

----------------------------------------------------------------
Alex Williamson (1):
      vfio/pci: Align huge faults to order

 drivers/vfio/pci/vfio_pci_core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

