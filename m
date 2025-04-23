Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A419D1F4171
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745392343; cv=none; b=Jd9zDE6S36w/o6/QURcQf/gnO4kiMs7NXPCgMI0x/EJme/Ehhw0m2FML/1hv1SVrhDWPFh5YyX71A4XQQtJNG4u/X0gFXHx7l+w8tHemeFo8uSTDFc5AsN+ClGmTA2H8bsvJJ9pppBdjLBNI5LbjndybXEeEgPZwO8IYgAHr/a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745392343; c=relaxed/simple;
	bh=pKHNu+OJ8VesxkajHV+/DwJVpFI6q/1viDc2UaycMPU=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VQUk2wXJsslOiynvD0VhvuC1W1/ElcbnvNQaaKALJL/AQ8yuGs2xJndVxVEDSlde/Bjq0KLCl1BxohuYYacOS53nqAVdQvjDi0irqhM2s5ZgjAxvykTg5OesHErfrur+oPo7dRjfUs+TvQEcprQ8zhFfcTAyXpX4e+Bxe6VnZ40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=P4cgoiyF; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="P4cgoiyF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1745392330; x=1745651530;
	bh=pKHNu+OJ8VesxkajHV+/DwJVpFI6q/1viDc2UaycMPU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=P4cgoiyFb8mGiLIFA3QinUQ+vjiZzv1ED2t8p45Vrt6aQr9KsIaSEJmif6K3zHBqJ
	 2+HguaOxd7p35ml1o9l6JeeCVGgKL1klNRPxc5oorOJnWGUe3Q9RBh4DJGmeR7c/hp
	 2sYC1W3BTPeQWx/TSj/2R2XDmq/8pv8Jjnr7A6bGN6hfHz8lDsYJVaVqjfQ8Afwwfy
	 X+CEMQuiAByLXGj/CbJm4l9gxGEtEMoencGpHZ/RvLrvC+LDh/DIrv87EoWSG8oVda
	 uhYT7E28zVagMCcAZY1YVQuplVVNm4L3GCiS2FLnLfo6yif0Z872K+X+9XAITgi4op
	 y+gzwknUGTMbg==
Date: Wed, 23 Apr 2025 07:12:05 +0000
To: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
From: Abanoub Sameh <abanoubsameh@protonmail.com>
Cc: "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Patch to replace strcpy() with strscpy() in drm_fb_helper.c
Message-ID: <m6fDuYqgCI0Sg6QMnrYRG8MnGc1yujAoq2vOkZiGDI4OwsQXSRKwLf_i3Ekb71lKsIKS3IUhzLsQM6gwn9X_bpChsnApJp2TggjbHdXctdw=@protonmail.com>
Feedback-ID: 23391015:user:proton
X-Pm-Message-ID: e96aede9142539d25ce00ea7990f2d54ee1d3fd3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From e45e4d9016262ace19db01e69d266d6218789ccd Mon Sep 17 00:00:00 2001
From: Abanoub Sameh <abanoubsameh@protonmail.com>
Date: Thu, 17 Apr 2025 23:37:21 +0200
Subject: [PATCH] Use strscpy() instead of strcpy() in
 drivers/gpu/drm/drm_fb_helper.c

Use strscpy() instead of strcpy() since it is safer, and compliant with che=
ckpatch.pl

It is an easy fix, since the size of fb_helper->fb->comm is a constant defi=
ned at linux/sched.h

strcpy() does not check for destination size and should not be used, see:
https://github.com/KSPP/linux/issues/88

Signed-off-by: Abanoub Sameh <abanoubsameh@protonmail.com>
---
 drivers/gpu/drm/drm_fb_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helpe=
r.c
index 937c3939e..4392aba01 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -33,6 +33,7 @@
 #include <linux/pci.h>
 #include <linux/sysrq.h>
 #include <linux/vga_switcheroo.h>
+#include <linux/sched.h>
=20
 #include <drm/drm_atomic.h>
 #include <drm/drm_drv.h>
@@ -1650,7 +1651,7 @@ static int drm_fb_helper_single_fb_probe(struct drm_f=
b_helper *fb_helper)
 =09if (ret < 0)
 =09=09return ret;
=20
-=09strcpy(fb_helper->fb->comm, "[fbcon]");
+=09strscpy(fb_helper->fb->comm, "[fbcon]", TASK_COMM_LEN);
=20
 =09info =3D fb_helper->info;
=20
--=20
2.49.0


