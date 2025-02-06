Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A941CEAC8
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 21:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738875984; cv=none; b=kcM8OErWAb42VR7zo0JzwV4XRnG4kHOYfVMFv9qvTu6WZThDcy5Z51BuXi34aXR6xBQc0WH8ideKntX3uWh2kmxxsMeNyXcqTc0CFEdCkyzh7s8geuLsSMch7x1c6ajwKxWe3kWegaKjJevwPW1RTQ3Mk5TyIX1MiJRpnHQbsIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738875984; c=relaxed/simple;
	bh=eDdg1OikNFeKYaPrTJC6O8xWZo1Lwf8ku2Ik/nyu9Ms=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JgFsWdlqUmtmmuU3taO3lmRaJeQd7951sBGNqKOYxmO1lf8Cx7xbEf35lieSUTe48IfHPJ4Xzt81ITO9fMWKzDtuvqJbBZcgadNTArkV9vS18TmFtzSz1CbEqt3FPfmaHFlZJeEOKkVFsQi4J+7/rJS5ED73U9CAWs7yRtzeYa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IbKCEEpb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IbKCEEpb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738875980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=svH8z0fc44fWEW7HMBpOKmCOktswJ2tPSlwMrAT2m1c=;
	b=IbKCEEpb1cSkHXTT5PutOmAVG4ATRukFE0jN4aJW4k5kKNdApuwKB1rpm6utKgN/p2V7u6
	vY3sl5zAvUZZO/VGqyrVrwyL2Na2SMB3uL7WBfUd9owL9xDKbtj6Q1kC5qPs8A+rDG8ssc
	levsSDYR6eZb2g5Qw3dn7XgyKTdTfz8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-44-vW-vhDtZO7aMwU1ihcfg_g-1; Thu,
 06 Feb 2025 16:06:17 -0500
X-MC-Unique: vW-vhDtZO7aMwU1ihcfg_g-1
X-Mimecast-MFC-AGG-ID: vW-vhDtZO7aMwU1ihcfg_g
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 484281956096;
	Thu,  6 Feb 2025 21:06:14 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.21])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CC13E1800115;
	Thu,  6 Feb 2025 21:06:09 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Subject: [PATCH 00/14] drm/panel: Transition away from using
 mipi_dsi_*_write_seq()
Date: Thu, 06 Feb 2025 16:05:55 -0500
Message-Id: <20250206-mipi-cocci-v1-0-4ff0c69e8897@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADMkpWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIwMz3dzMgkzd5Pzk5Exdi2RjU7Mkw8RUczNTJaCGgqLUtMwKsGHRsbW
 1AHg9qeRcAAAA
X-Change-ID: 20250206-mipi-cocci-8c356b1ae765
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Joel Selvaraj <jo@jsfamily.in>, Ondrej Jirman <megi@xff.cz>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Artur Weber <aweber.kernel@gmail.com>, Jianhua Lu <lujianhua000@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>, 
 Douglas Anderson <dianders@chromium.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738875969; l=3868;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=eDdg1OikNFeKYaPrTJC6O8xWZo1Lwf8ku2Ik/nyu9Ms=;
 b=6U+NJUI+gDOZehmu85lDpdKCDfRRUQUP4wZ6oHXvTg0M68Y45O4LKKJYkBmSmYiSkyEEA7Y7u
 u/bs5Xn0FqOC/YPGLA96/frTS7CTaZuXnbAK2gcmiPIr6ecYACDw+qN
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Transition away from mipi_dsi_generic_write_seq() and
mipi_dsi_dcs_write_seq() to mipi_dsi_generic_write_seq_multi()
and mipi_dsi_dcs_write_seq_multi() respectively.

This is addressing one of the gpu todo items [1]

Used Coccinelle to make the code changes.Semantic patch:
@rule_1@
identifier dsi_var;
expression dsi_device;
expression list es;
@@
struct mipi_dsi_device *dsi_var = dsi_device;
+struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi_var };
<+...
-mipi_dsi_dcs_write_seq(dsi_var,es);
+mipi_dsi_dcs_write_seq_multi(&dsi_ctx,es);
...+>

//rule_2
@rule_2@
expression dsi_var;
expression list es;
identifier jdi;
@@
static int jdi_write_dcdc_registers(struct jdi_panel *jdi)
{
+struct mipi_dsi_multi_context dsi_ctx1 = { .dsi = jdi->link1 };
+struct mipi_dsi_multi_context dsi_ctx2 = { .dsi = jdi->link2 };
<+...
-mipi_dsi_generic_write_seq(jdi->link1,es);
+mipi_dsi_generic_write_seq_multi(&dsi_ctx1,es);
-mipi_dsi_generic_write_seq(jdi->link2,es);
+mipi_dsi_generic_write_seq_multi(&dsi_ctx2,es);
...+>
}

//rule_3
@rule_3@
expression dsi_var;
expression list es;
identifier jdi;
@@
struct mipi_dsi_device *dsi0 = pinfo->dsi[0];
struct mipi_dsi_device *dsi1 = pinfo->dsi[1];
+struct mipi_dsi_multi_context dsi_ctx0 = { .dsi = dsi0 };
+struct mipi_dsi_multi_context dsi_ctx1 = { .dsi = dsi1 };
<+...
-mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, es);
+mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, es);
...+>

[1] -> https://docs.kernel.org/gpu/todo.html#transition-away-from-using-mipi-dsi-write-seq

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
Anusha Srivatsa (14):
      drm/panel/boe-bf060y8m-aj0: Move to using mipi_dsi_dcs_write_seq_multi()
      drm/panel/ebbg-ft8719: Move to using mipi_dsi_dcs_write_seq_multi()
      drm/panel/himax-hx8394: Move to using mipi_dsi_dcs_write_seq_multi()
      drm/panel/jdi-lpm102a188a: Move to using mipi_dsi_generic_write_seq_multi()
      drm/panel/samsung-s6d7aa0: Move to using mipi_dsi_dcs_write_seq_multi()
      drm/panel/6e88a0-ams452ef01: Move to using mipi_dsi_dcs_write_seq_multi()
      drm/panel/samsung-sofef00: Move to using mipi_dsi_dcs_write_seq_multi()
      drm/panel/ls060t1sx01: Move to using mipi_dsi_dcs_write_seq_multi()
      drm/panel/sony-td4353-jdi: Move to using mipi_dsi_dcs_write_seq_multi()
      drm/panel/visionox-r66451: Move to using mipi_dsi_dcs_write_seq_multi()
      drm/panel/xpp055c272: Move to using mipi_dsi_dcs_write_seq_multi()
      drm/panel/novatek-nt36523: Move to using mipi_dsi_dcs_write_seq_multi()
      drm/panel: Remove deprecated functions
      Documentation: Update the documentation

 Documentation/gpu/todo.rst                         |   19 -
 drivers/gpu/drm/drm_mipi_dsi.c                     |   56 -
 drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c     |   36 +-
 drivers/gpu/drm/panel/panel-ebbg-ft8719.c          |    7 +-
 drivers/gpu/drm/panel/panel-himax-hx8394.c         |  364 +++--
 drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c      |   31 +-
 drivers/gpu/drm/panel/panel-novatek-nt36523.c      | 1588 ++++++++++----------
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c      |   88 +-
 .../drm/panel/panel-samsung-s6e88a0-ams452ef01.c   |   34 +-
 drivers/gpu/drm/panel/panel-samsung-sofef00.c      |   19 +-
 drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c    |    5 +-
 drivers/gpu/drm/panel/panel-sony-td4353-jdi.c      |   10 +-
 drivers/gpu/drm/panel/panel-visionox-r66451.c      |  118 +-
 drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c   |  113 +-
 include/drm/drm_mipi_dsi.h                         |   47 -
 15 files changed, 1244 insertions(+), 1291 deletions(-)
---
base-commit: 92514ef226f511f2ca1fb1b8752966097518edc0
change-id: 20250206-mipi-cocci-8c356b1ae765

Best regards,
-- 
Anusha Srivatsa <asrivats@redhat.com>

