Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D2B27A459
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 14:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748357181; cv=none; b=H2D5F0wd7gZG/i5suW4Bfrr8UPeSCXb2kcUTOU6IZUD8ww+V2AA2tweTVcdkpAQhnR3pDca5zBEf6lgF29kLkF+CEkNwrzZdmDN2pPmN4aon9g9aN1zO3W7K7kpGV4rMtw1QUm8DF6hhpjA9JZn/MelbVbpY9zN+27sRx5hWtbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748357181; c=relaxed/simple;
	bh=j+1FYl1eH47hvev1VnD13nxIOLXyM7N6wIPD+7tAisw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p/jrkK/tui2kRCo/4FgdeEPl424yZuOCdGKMm4WeLaOFvXtntcGcyQnfjnI0YMPPD5sLJr9Y0fUj/3Rc4uni9T0ccX8RCI/0nrasO5DvWBJiiRtDF/xbpvSVRl3kF+/vgafX5KuZxNNgFlFoAvfmwUHjCiZgM1Oh+X2WZl5stqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cPJ5qlIX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cPJ5qlIX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748357176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TYvH6opew6c0SfiVsSSap4M4b37BCRrFIqizknsdu/Q=;
	b=cPJ5qlIXc99eKk7rSUVTJvQ+oq0zWVInia/K0aQLCLR9i/dfo+GwM26vmoVnQSoY0XV7jO
	i6pKccaOz4hlPyihH44m660sgAcLZXRzd7ywamRlQwkDtFx+IEkdiMFuWRPLTNqLq+8X4i
	fyZ766isqkIKTIGpea8bwKx4kHAeF1I=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-516-Senl8kZHMmmjF5SAdGBHUw-1; Tue,
 27 May 2025 10:46:09 -0400
X-MC-Unique: Senl8kZHMmmjF5SAdGBHUw-1
X-Mimecast-MFC-AGG-ID: Senl8kZHMmmjF5SAdGBHUw_1748357168
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C6B0919560BB;
	Tue, 27 May 2025 14:46:07 +0000 (UTC)
Received: from dobby.home.kraxel.org (unknown [10.45.226.108])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 247183000717;
	Tue, 27 May 2025 14:46:03 +0000 (UTC)
Received: by dobby.home.kraxel.org (Postfix, from userid 1000)
	id D2E7044FBC2; Tue, 27 May 2025 16:46:00 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: kvm@vger.kernel.org,
	linux-coco@lists.linux.dev,
	Gerd Hoffmann <kraxel@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] x86/sev/vc: fix efi runtime instruction emulation
Date: Tue, 27 May 2025 16:45:44 +0200
Message-ID: <20250527144546.42981-1-kraxel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

In case efi_mm is active go use the userspace instruction decoder which
supports fetching instructions from active_mm.  This is needed to make
instruction emulation work for EFI runtime code, so it can use cpuid
and rdmsr.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 arch/x86/coco/sev/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index 36beaac713c1..145f594d7e6b 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -346,7 +346,7 @@ static enum es_result __vc_decode_kern_insn(struct es_em_ctxt *ctxt)
 
 static enum es_result vc_decode_insn(struct es_em_ctxt *ctxt)
 {
-	if (user_mode(ctxt->regs))
+	if (user_mode(ctxt->regs) || current->active_mm == &efi_mm)
 		return __vc_decode_user_insn(ctxt);
 	else
 		return __vc_decode_kern_insn(ctxt);
-- 
2.49.0

