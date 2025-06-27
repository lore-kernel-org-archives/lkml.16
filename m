Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEC0214801
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751024029; cv=none; b=KGDAF5zNTIDuTmVbDA/fBGY1jpBTiKwzLG5+SSpYGI/4eazafTwj/94wElj44g4eAtl1dQ79wmzRXGqNARuXOA6uC9e3msY6kaZcSxhWgMVzM9GzHdBQeHoNwmexHNiwVxcLuSpfC2D79L3WKQzn3xXl0YHZlsIsqldXEA48KRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751024029; c=relaxed/simple;
	bh=ezXjtQ+GOFvejke0GzgA3qykC/18a30fkdbtkQk7ERo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jVQy5hPQR1Z/NW67MjZiDuOkctVjnYF8ps5XFETWHe61x6xEsBbRxOz9Fml9iAf6sHKcyx1Yl+j/MuPKloL84NpfFiuiPOIUnIAZoHU5avX6FgoOuHWR0U+NWMlvUYrdFK16VBo2WFLORZLLCWTK4EfzZ61xinzU3jcUd3ltRxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iajF2GjD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iajF2GjD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751024026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3aRzI0bjtMw21rZmghu7msd+/WgHADKWD3NdKB/6P48=;
	b=iajF2GjDKTrdSJc85kMzkI8Vr7mo/f/ZLa6HehIrxtg4CIhn5XRxJ5He9r/BW234UTZKX+
	sf0zkhzLHmakcpAEOetGVIf+M4Dbamc498tw0oDf5DE6qF0trqW9JhiiyzmDjjOaPmoRDH
	NLyhgCByDyQeMeTxkN1dFDcPmu98J7w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-RiphLJy_NJaNBk6epZw6_Q-1; Fri, 27 Jun 2025 07:33:45 -0400
X-MC-Unique: RiphLJy_NJaNBk6epZw6_Q-1
X-Mimecast-MFC-AGG-ID: RiphLJy_NJaNBk6epZw6_Q_1751024024
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43e9b0fd00cso10842085e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 04:33:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751024023; x=1751628823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3aRzI0bjtMw21rZmghu7msd+/WgHADKWD3NdKB/6P48=;
        b=w2KZFVNztlq6el8E3alYKezVPNzgT3THRwicKdi4K9kvqN3sBjRIu/OLexiokCmYMc
         +6E4c4u3hYoO9dHOxXvP1iWn4+FNEBeKbGJh4jo1aTm2mMBC1f4QnJRae1cmS/yB2v0k
         ZKS1o0nJrkPOHaedN8INWpT1W+WRt1AjeWKtQO+l1pMdOqNQU2jafajZpZ7Df6BcQFXH
         5JcJlldfqE64KvqA0g4HUUKGpYVf0qvab9+MKcX/dv1jZGqlBWybe618Z0Z4Uwll5SCU
         Hoo14s1qNHARaviKvnxIIDvLXDhuVxEywtb2+l1Lu8AxjMIsDht/dul7Vd/aqu5oC5YM
         lf/w==
X-Gm-Message-State: AOJu0YyqPfoXM5R473V68nOpZPvj7o/ft0h78RaXeT+goP3Xx2jmCTKJ
	jzL5QRlOA4V2qKCa4HlgOV7NOl9fovTq8TMuveNukkVhKrsyikmHAo1sNQO1CVivXOj9Ls63PgD
	lcAgAHkrKqh+Qm4ZPRLhOglnntRg6yxboOfpcLt1+WdoAg/cEfVwuHXQlVCMMFAFWBlIb2x07a5
	MVcBnRvDGvha63IlzLYfqQSGQLQKhfQFv0Neyj74SA3CgIVl76
X-Gm-Gg: ASbGnct28sLbMZPKLxJhDAgjdx+z5no8f+czeRp55zvzJmSfM7G9wtbF6uQDuCImfQX
	MFY2LJx+WXv7BHDRdLbP5+3oLJZna8GHIu+i9yQrLtXJQLrOCFSCHZ2XiPTzeSUTOWfQmrSyf2a
	bFHn/1txOMVeijHflH1QBJ155O04D+j+vVUzcRHTVHQCnLxWE3+dzDHHks+sfwEa9yXibULXx5L
	EFYIFrlNN7T2GWLgz1mZw5IwaxkKgaH6ZjTGesMadnS+z+DAZPiI59KxCiwVkZsrFdTZdkUTvgT
	dHXhg4ASFrD55pvxo/2p9VlJZFBeMblDt3AP4kZx+AJ3ihg=
X-Received: by 2002:a05:600c:608d:b0:453:ec2:c7b2 with SMTP id 5b1f17b1804b1-4538f2cf96dmr26854805e9.7.1751024022992;
        Fri, 27 Jun 2025 04:33:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpFrELdHrX0UB8KDlawLgo07Z21cQgKAE3Ir2Mmzr5B+NPapuquz0W2E3S8XCFYAMfKu6q8w==
X-Received: by 2002:a05:600c:608d:b0:453:ec2:c7b2 with SMTP id 5b1f17b1804b1-4538f2cf96dmr26854425e9.7.1751024022509;
        Fri, 27 Jun 2025 04:33:42 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45388888533sm56556465e9.21.2025.06.27.04.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 04:33:42 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	dri-devel@lists.freedesktop.org,
	Javier Martinez Canillas <javierm@redhat.com>,
	Borislav Petkov <bp@suse.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] MAINTAINERS: Add missing sysfb files to firmware framebuffers entry
Date: Fri, 27 Jun 2025 13:33:04 +0200
Message-ID: <20250627113328.2703491-1-javierm@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The commit d391c5827107 ("drivers/firmware: move x86 Generic System
Framebuffers support") moved the sysfb*.c source files from arch/x86
to drivers/firmware, because the logic wasn't x86 specific and could
be used by other architectures.

But the drivers/firmware path is not listed in MAINTAINERS, which led
to the files being orphaned and scripts/get_maintainer.pl not listing
a mailing list to Cc anymore.

Now that we have an entry for all the firmware-provided framebuffer code,
add the missing sysfb files to make sure correct folks and list is Cc'ed.

Fixes: d391c5827107 ("drivers/firmware: move x86 Generic System Framebuffers support")
Reported-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Closes: https://lore.kernel.org/lkml/aF53djlieUNF_-aV@smile.fi.intel.com/
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ac6f0547cd32..f69a86b9610a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7497,10 +7497,12 @@ M:	Javier Martinez Canillas <javierm@redhat.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	drivers/firmware/sysfb*.c
 F:	drivers/gpu/drm/sysfb/
 F:	drivers/video/aperture.c
 F:	drivers/video/nomodeset.c
 F:	include/linux/aperture.h
+F:	include/linux/sysfb.h
 F:	include/video/nomodeset.h
 
 DRM DRIVER FOR GENERIC EDP PANELS
-- 
2.49.0

base-commit: 017a6f7e7e25017eef9c30946cb0e7c803cb3f35
branch: drm-misc-next

