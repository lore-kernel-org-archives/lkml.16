Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEAA139E
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 21:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745704480; cv=none; b=OLQ81yvGcPJ75u4faasrHNNETZi2OWClGiyjOyLFz0hsdoI+KKiChPIyRM+HSEWbS+kV9r5AzddWvEsRtzi6i19fs+tLgJDWMcsMWRqsw4Pbbh1Jye90lBHzILMgKIbViS9rcTpwpWzepWITcaxfPPgoLp/2SX/6tzPEz03sZRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745704480; c=relaxed/simple;
	bh=zOvKS8HfF3ul3wcfcEnnWBhtgOVVT5StFc39IBR/X3s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lZv8hxkwlczCQFkIx+sJ/Sln0QWrLgXVsxdGlLPVUCtoaR7coi60Hevv07LRFAUbytENTt4dOtZycwn/vBkiE6lUEdPY7sQvk4M0/aSzvbAZwo/aXBkhhtkJju900qSHrzEN7Ka9bfxNZTEFBa1CigE06ItQnuB+H+dyjEx4Ev0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de; spf=pass smtp.mailfrom=nurfuerspam.de; dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b=A+q1c1nJ; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nurfuerspam.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nurfuerspam.de header.i=herdler@nurfuerspam.de header.b="A+q1c1nJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nurfuerspam.de;
	s=s31663417; t=1745704469; x=1746309269; i=herdler@nurfuerspam.de;
	bh=6UX8WR1b1aNo3GfDGyLRiWCoP0+LlBWXXJWJ/Mv8Te0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=A+q1c1nJH5Cjst+gBBANLOHsStojP3uQX2MqbBuv7U5TmWkszAL15/alKVy/f27j
	 zibyAFu+itlNV2FJFEtApKYiXKrkfRLWB3qzjDVt2xLn+gUxC7dvCnGeJyqg8ggMl
	 cNVPQ2GJsmuckKQVmguo2fpYV58gLndL+NeGjP1JhqTRdpaQusV8ozPvviU/gK8s3
	 TmefAE5KwhjCbQbHMXnSX5I541hSxhtJaRgNjqvDNi9IbjB1sNIQbmwLdkP3wyLVE
	 soNigxRPwweNH7tqs5jAv+xkel63QHtrmBM4hse3ljVsmAR4L/uuwfhZZCq3nyNoh
	 /xinAK7jtjclt8Q55w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from astro.haus ([178.132.68.48]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MhlGk-1umW0b1cvo-00kDdv; Sat, 26
 Apr 2025 23:54:29 +0200
From: Stefan Herdler <herdler@nurfuerspam.de>
To: lkp@intel.com
Cc: herdler@nurfuerspam.de,
	hverkuil@xs4all.nl,
	linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev
Subject: [PATCH] media: av7110: Workaround a compiler warning
Date: Sat, 26 Apr 2025 23:54:09 +0200
Message-Id: <20250426215409.36852-1-herdler@nurfuerspam.de>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <202504262127.FkkWHzfs-lkp@intel.com>
References: <202504262127.FkkWHzfs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xypEWkhXizihWrQsChbcn5DlIjhdILF7i4NAb888rLBpvNxWpHB
 G/adbFSH/Mfbs2rFzTmMB/8qfWCS3UibYYqqSwBYs57u7pAv9ELAWx5A5Rs1qAh9aPPxSds
 FqXiAB9Gjzy+xgCRL/V0CzYD2f0FleATyKRoE1Zoj1/QiJ1/kU2BTjzFatkxRSR76h9OL8n
 Ukf8F0l1rTd7yUM39FqmA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6sedqHscmFU=;t3uBPmbvm1V2JFsLBbdrgYpuxKx
 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

Avoid compiler warning caused by an empty block statement.

Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202504262127.FkkWHzfs-lkp@in=
tel.com/
=2D--

I could not reproduce this warning with gcc10 here, but I already had simi=
lar
warnings with gcc12 on other projects.
I think it has most probably been triggered by the empty block statement.

I'm pretty confident this patch will fix the warning, but not 100% sure.

The kernel test robot will pick this patch and test is anyway, if I'm corr=
ect.
Let's wait, if it complains again.
That's the best I can do right now.

Regards
Stefan


 drivers/staging/media/av7110/av7110.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media=
/av7110/av7110.c
index bc9a2a40a..962536ed7 100644
=2D-- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -159,7 +159,7 @@ static void init_av7110_av(struct av7110 *av7110)
 		 * some special handling for the Siemens DVB-C cards...
 		 */
 	} else if (av7110_init_analog_module(av7110) =3D=3D 0) {
-		/* done. */
+		goto init_skip_analog_module;
 	} else if (dev->pci->subsystem_vendor =3D=3D 0x110a) {
 		pr_info("DVB-C w/o analog module @ card %d detected\n", av7110->dvb_ada=
pter.num);
 		av7110->adac_type =3D DVB_ADAC_NONE;
@@ -168,6 +168,7 @@ static void init_av7110_av(struct av7110 *av7110)
 		pr_info("adac type set to %d @ card %d\n", av7110->adac_type, av7110->d=
vb_adapter.num);
 	}
=20
+init_skip_analog_module:
 	if (av7110->adac_type =3D=3D DVB_ADAC_NONE || av7110->adac_type =3D=3D D=
VB_ADAC_MSP34x0) {
 		// switch DVB SCART on
 		ret =3D av7110_fw_cmd(av7110, COMTYPE_AUDIODAC, MainSwitch, 1, 0);
=2D-=20
2.34.0

