Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5BD25CC7C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 23:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745363148; cv=none; b=JHy8NmLO/Eq5VLnpGiudjuD60Pnpjjz/jW9HGMziSwxgpMfsWp8SPsjy4bGy9QewhCsFxQ1As14MosDRDD61rxaruOCL+sBblHEtle2SQ2QReSd0A8U09/gXV8tPvOpUqAKwleOr7ldi8eAnJ6eSxYh7VqTTSXrFDcEv+WrPeho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745363148; c=relaxed/simple;
	bh=0H0uKZ693mlpOCVqBXLPrlDdTN8NIHveQOdXj53aAW4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YoQCoboc+Cb5FKSG4r1Sbs43NLXH5DJbbvmGTnRX48jzPL4usY/fVAb19anEsnkLJh0U9VwJfz4AxxnkTn1XmvdRdsah3bNTnA5o61y4a8UIUcSLEVdcbwFq+P/5lgd+03oBrrT002Xj57t9GcG4g4ImFYlTLKTwZaWwggfWLKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q0x+4bkH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q0x+4bkH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745363145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eA2dPJ7kUmIfz4lKYy/AXLtHSVSq2pKZ9vTXMKbDLTg=;
	b=Q0x+4bkHKduoH7nmc94kLtJUWUZ/7UZINtjYWtG+CviDspvZADrc70CKarBTSik6Q37yNn
	5IYqzZLMkBW13FnpzQhw1yf5tidvi4drSJBdHYHQ7HOmGJoWp/drC9+ZqYCZsaeTsRhxgS
	YCK8bRz2FsjC+96HLHdHiakzDlg1mdo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-342-zFzYHi_wNxSfo9fhPr4raw-1; Tue,
 22 Apr 2025 19:05:40 -0400
X-MC-Unique: zFzYHi_wNxSfo9fhPr4raw-1
X-Mimecast-MFC-AGG-ID: zFzYHi_wNxSfo9fhPr4raw_1745363139
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C0C3C180048E;
	Tue, 22 Apr 2025 23:05:39 +0000 (UTC)
Received: from omen.home.shazbot.org (unknown [10.22.88.22])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3381418001DD;
	Tue, 22 Apr 2025 23:05:38 +0000 (UTC)
From: Alex Williamson <alex.williamson@redhat.com>
To: bhelgaas@google.com,
	rafael@kernel.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] PCI/PM: Elevate PM usage during reset probing
Date: Tue, 22 Apr 2025 17:05:30 -0600
Message-ID: <20250422230534.2295291-1-alex.williamson@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

I encountered a confusing scenario where a device reports NoSoftRst- and
doesn't have any associated quirks to set PCI_DEV_FLAGS_NO_PM_RESET, but
it refuses to probe for PM reset support using the sysfs reset_method
attribute.  The reason turns out to be that we don't increment the usage
count while probing, the driver has the device in D3, where this system
seems to support D3cold, and the PM control register is read back as
0xffff.

The cleanup __free helper seems to be the cleanest solution here, versus
refactoring to a common exit point or wrappers around reset_fn, but feel
free to suggest otherwise.  I see a couple potential other use cases for
this helper in the vfio code.

Please review.  Thanks,

Alex

Alex Williamson (2):
  PM: runtime: Define pm_runtime_put cleanup helper
  PCI: Increment PM usage counter when probing reset methods

 drivers/pci/pci-sysfs.c    | 3 +++
 include/linux/pm_runtime.h | 2 ++
 2 files changed, 5 insertions(+)

-- 
2.48.1

