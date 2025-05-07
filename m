Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD548244686
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 09:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746608867; cv=none; b=cA2dw2FPpmDhjGJRo2WaLpTWgiijJjf7jI8H0UoARWOfbMl3TESLc4lu2k89ppgcDpWTTUo8rTp2wkHuZj7ngULb9tAtzfbrWeZ3eG1EcjK/GdO7pNDAXDC8mWbc4YvCZv8sE30qC1T5BdNGyQjFeCHFELw8FJ1IFP8iV/lliPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746608867; c=relaxed/simple;
	bh=Hvq3Tj6KSvXUKEG3jUHwYrndTLINKs7iS0ydr0S0WW0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CXJNecAwu8spDOL5vR/hm1z+DRbk3FTspacVzHgq8nvWubMp7EySiAvaCqF2MhVHnQeY6aIQSi9L+wXDEHraY9W1EGPiv46FaCVxRYx1Bok3+K+csW72MaZZ7runUVsdeJguxCSrXmMd3AqpE3VavDkplTKcYFTxmKjgBRaVdlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZS8ryqkO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZS8ryqkO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746608863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OyA8luO+mopKaxusFyQvoZhry9W0VGu+ryrSc+pSsq8=;
	b=ZS8ryqkObuAWU4NkmKfe3CoPylrQwB76nt6ZHz2exeVXFIAooGeG5+A19g719m87PJHoKW
	zdfWbwnJD3rBrcVVDe8G6A/tbhPrtNf13QEFY/BIsKgzrU6P2C4GwraoiAFw5XjcXTg9V3
	mOurmbUZ9ytct6Ens8j0R6XlMbV9Zlg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-14-zTN8HV4WON2mdfydSdRb0w-1; Wed,
 07 May 2025 05:07:40 -0400
X-MC-Unique: zTN8HV4WON2mdfydSdRb0w-1
X-Mimecast-MFC-AGG-ID: zTN8HV4WON2mdfydSdRb0w_1746608858
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 488661800370;
	Wed,  7 May 2025 09:07:38 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.33.122])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EFDA61956055;
	Wed,  7 May 2025 09:07:34 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Wentong Wu <wentong.wu@intel.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] mei: vsc: Cast tx_buf to (__be32 *) when passed to cpu_to_be32_array()
Date: Wed,  7 May 2025 11:07:28 +0200
Message-ID: <20250507090728.115910-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Commit f88c0c72ffb0 ("mei: vsc: Use struct vsc_tp_packet as vsc-tp tx_buf
and rx_buf type") changed the type of tx_buf from "void *" to "struct
vsc_tp_packet *" and added a cast to (u32 *) when passing it to
cpu_to_be32_array() and the same change was made for rx_buf.

This triggers the type-check warning in sparse:

vsc-tp.c:327:28: sparse: expected restricted __be32 [usertype] *dst
vsc-tp.c:327:28: sparse: got unsigned int [usertype] *

vsc-tp.c:343:42: sparse: expected restricted __be32 const [usertype] *src
vsc-tp.c:343:42: sparse: got unsigned int [usertype] *

Fix this by casting to (__be32 *) instead.

Note actually changing the type of the buffers to "be32 *" is not an option
this buffer does actually contain a "struct vsc_tp_packet" and is used
as such most of the time. vsc_tp_rom_xfer() re-uses the buffers as just
dumb arrays of 32 bit words to talk to the device before the firmware has
booted, to avoid needing to allocate a separate buffer.

Fixes: f88c0c72ffb0 ("mei: vsc: Use struct vsc_tp_packet as vsc-tp tx_buf and rx_buf type")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505071634.kZ0I7Va6-lkp@intel.com/
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/misc/mei/vsc-tp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/mei/vsc-tp.c b/drivers/misc/mei/vsc-tp.c
index da26a080916c..267d0de5fade 100644
--- a/drivers/misc/mei/vsc-tp.c
+++ b/drivers/misc/mei/vsc-tp.c
@@ -324,7 +324,7 @@ int vsc_tp_rom_xfer(struct vsc_tp *tp, const void *obuf, void *ibuf, size_t len)
 	guard(mutex)(&tp->mutex);
 
 	/* rom xfer is big endian */
-	cpu_to_be32_array((u32 *)tp->tx_buf, obuf, words);
+	cpu_to_be32_array((__be32 *)tp->tx_buf, obuf, words);
 
 	ret = read_poll_timeout(gpiod_get_value_cansleep, ret,
 				!ret, VSC_TP_ROM_XFER_POLL_DELAY_US,
@@ -340,7 +340,7 @@ int vsc_tp_rom_xfer(struct vsc_tp *tp, const void *obuf, void *ibuf, size_t len)
 		return ret;
 
 	if (ibuf)
-		be32_to_cpu_array(ibuf, (u32 *)tp->rx_buf, words);
+		be32_to_cpu_array(ibuf, (__be32 *)tp->rx_buf, words);
 
 	return ret;
 }
-- 
2.49.0

