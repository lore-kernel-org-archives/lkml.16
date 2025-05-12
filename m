Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E872B29550B
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 13:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747057424; cv=none; b=a5hio4oDmzlcifv3sXXDuB4FgRV6L5BLGD6EcMvRK8WM4GtNL3D3KO82J+zjR5+WHV5MYGvAX3+r4hPMFL7R8Hx8bGeo423qXSuwFbEdt8G3rl7bvYANmDqTsIxrTxoBGEeakvclUi+PQwpHkh6vwey8CQxNH9I376bp+vLM+hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747057424; c=relaxed/simple;
	bh=DIkq7mdvxGhBOJFBrxOyEybYOHqdPTblIBg1vS+0Vmc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LnWE/AEA8+/E6SXF0klw2FbnwwkAk1ahofmP3hzHFRqkdSW8IquzDiONroZkeQbDG85cAdd0pdfY3cXfSEeJ3QKYC7rUcfL7zmRA4kvFyQ3qhcJ4BZWVpk1Ygss498wNvKPhJNfjZvfge9/Hwvnll5AFT4oicAFjofFyRAQZ5fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lxrewr28; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lxrewr28"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747057420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kceEV5H6KvQLNqsOUbeqe5/B8K16InTUHSahrshNDTA=;
	b=Lxrewr2814gA76BTIXhzlA50N2/wNCeTZeUkhfAPsE9mvRb6xsmo6pwFt2Me4t4nbCQ0tB
	2eIpG5kwVUVX8i5mqhjZ1taP6y4ZxfePmvphcDbNbPBflMbW8qCl0OBh9l636tWbbh7u+D
	aw92I1Cn2LoAo9XNeSNjJDY+HrOpP98=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-Rh2lhDyKO6u_gmWY_RpLhA-1; Mon, 12 May 2025 09:43:39 -0400
X-MC-Unique: Rh2lhDyKO6u_gmWY_RpLhA-1
X-Mimecast-MFC-AGG-ID: Rh2lhDyKO6u_gmWY_RpLhA_1747057418
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a0b394504cso2229752f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 06:43:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747057417; x=1747662217;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kceEV5H6KvQLNqsOUbeqe5/B8K16InTUHSahrshNDTA=;
        b=dNhaEYoTzYZ0RQGDU2bxHnoqnuep1Wp0ivIm4AfWRl/t9ZTVnyx/r9g3ZY5m5HSJcY
         VuKLsxoGUN3vm4BwHU6X3c2sLygbGAKpr5d2Axxm7ylOy3S+XRlPgYG2FnLiyE7s7/Fs
         QJFeA0T3JfeyrPPUf0/lFDNvV5fblr0BrexqAagbv1ykHelPX/WD3PhMmstNQPEzlRb0
         FfIY7/vjrNwervdXUoRo6Zvx92HLlwtn5B0NmMCmHVrLCgBm5x0Oef7dQsO0cz9uVFyx
         bmdeLymJVNF0nfkwXoqpgHVWVxM8psyzWUzRlIRO9AHx+9FYx387vzpqhrm5Ujgdq1+X
         cFEg==
X-Forwarded-Encrypted: i=1; AJvYcCWafXPTazWUOw4mx710HJ8TJobJGO7vNl9ct0lYVvbAZc/8j9eMp9ILTnelVP3zLGO5ES0hzyLhHUjdJP0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwiqIlW96KTWeLZFNTNgQ2WAUm1eiFiDCV2hPKjoEc5UKwWHQP
	C/pDlQH9ENj3PRatAgP8A2nHWjqaGPFkzpSAO4ehajy0dJyHY6rPDrzB/0f7cryVsrtvDa/Z4Gc
	RjSDcvmcmNeOU8y1I4KKDmxu4z3na1IkYpw4OcemiJm+v6fG9Q9nLaHIzFphUaA==
X-Gm-Gg: ASbGncuEIcUpAX4NmEQuIu/eqXifqJR4Q3GDol09CdK0M7GD6+0QaB6q7vHmZ51Bzq7
	ZSrwBL3TsnwXoOMS7ZSQrzEla7jEVHRBB+9mw/hFCJIYwNKzabF9OM9HN04Ix8GlYTq/ZyZ7LqT
	Wp1Vy/RvQ/4kmIYVVRDG8tYoCF+qJV1PzEfYp5LUsDjDTjUjTPbleHIepfhGI/jux0S1CNmHyQ1
	nrXsbXP4uFuDiCfbZSeZartuhWuqxch7G991DMKY9DwmjIXT8F88wa3tcUHqblcb5Pnipbfo+rD
	8dzBsIhzJEVSvKEUkHsGXJmGD7WzJnEncYlOTuqzY9vuvz4HjeT/05hMag==
X-Received: by 2002:a05:6000:1885:b0:3a0:92d9:dbf with SMTP id ffacd0b85a97d-3a1f6a0fecemr9538726f8f.3.1747057417706;
        Mon, 12 May 2025 06:43:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9GrRsQVcleOZ+a3jzIYyFjnvFHc9WWiVYWigIgCkWCb9s1ctlCszrZn/+QgiDGFa4grcYmw==
X-Received: by 2002:a05:6000:1885:b0:3a0:92d9:dbf with SMTP id ffacd0b85a97d-3a1f6a0fecemr9538710f8f.3.1747057417366;
        Mon, 12 May 2025 06:43:37 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen9.rmtde.csb ([2a02:810d:7e01:ef00:b52:2ad9:f357:f709])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c599sm12700074f8f.94.2025.05.12.06.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 06:43:36 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Mahesh Rao <mahesh.rao@intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in INTEL STRATIX10 FIRMWARE DRIVERS
Date: Mon, 12 May 2025 15:43:32 +0200
Message-ID: <20250512134332.36366-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit fbfb64987062 ("dt-bindings: firmware: stratix10: Convert to
json-schema") renames intel,stratix10-svc.txt to intel,stratix10-svc.yaml
in Documentation/devicetree/bindings/firmware/ as part of this dt-binding
conversion, but misses to adjust the file entry in INTEL STRATIX10 FIRMWARE
DRIVERS.

Adjust the file entry after the conversion.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 49826646c38f..2c04cce07a9d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12383,7 +12383,7 @@ L:	linux-kernel@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git
 F:	Documentation/ABI/testing/sysfs-devices-platform-stratix10-rsu
-F:	Documentation/devicetree/bindings/firmware/intel,stratix10-svc.txt
+F:	Documentation/devicetree/bindings/firmware/intel,stratix10-svc.yaml
 F:	drivers/firmware/stratix10-rsu.c
 F:	drivers/firmware/stratix10-svc.c
 F:	include/linux/firmware/intel/stratix10-smc.h
-- 
2.49.0

