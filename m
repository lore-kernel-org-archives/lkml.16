Received: from mx1.zhaoxin.com (MX1.ZHAOXIN.COM [210.0.225.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB4E26C3B5
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 10:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.0.225.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745404274; cv=none; b=itWqhnz6WtOrN+VMCCJd3B8IA7ekmSF8OC+QQvfOCcnX9zKVT6c5sMXSjTwiD/cRDPdbTN4yv/4zmiq+TJSoyiuZJTBTdzCPtMpBBem0G/TkPBnDcJqRxkIhUxQ5htJNeNKbp1qx+NkB5n8YmtwsaJDcplSn3BdQaR0iS8aiP+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745404274; c=relaxed/simple;
	bh=hY1V2YaAxweb85C7/iFaxRha68QFX8C1goEYWdQgp3M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=new4PU2N21h7On+2A3gmvniH/1fhPFOwVrdMxy2dqHacX3jDkq+F+rP/LgBxGUxlKD+arg9cQEiE0vzzIvFFfHxOmp1hbU/fMDL62/le2JoTmkhi9a6NOqxh1z2WmDMkQ6/eHmoUazak+oR7Ms4tLCQNDsgYug81WqhqGa5DIlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com; spf=pass smtp.mailfrom=zhaoxin.com; arc=none smtp.client-ip=210.0.225.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zhaoxin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zhaoxin.com
X-ASG-Debug-ID: 1745404186-086e234cd0999e0001-xx1T2L
Received: from zxbjmbx1.zhaoxin.com (zxbjmbx1.zhaoxin.com [10.29.252.163]) by mx1.zhaoxin.com with ESMTP id p2hQiQtqvLeBXN71 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO); Wed, 23 Apr 2025 18:29:47 +0800 (CST)
X-Barracuda-Envelope-From: TonyWWang-oc@zhaoxin.com
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.163
Received: from ZXSHMBX3.zhaoxin.com (10.28.252.165) by zxbjmbx1.zhaoxin.com
 (10.29.252.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.44; Wed, 23 Apr
 2025 18:29:40 +0800
Received: from ZXSHMBX3.zhaoxin.com ([fe80::8cc5:5bc6:24ec:65f2]) by
 ZXSHMBX3.zhaoxin.com ([fe80::8cc5:5bc6:24ec:65f2%6]) with mapi id
 15.01.2507.044; Wed, 23 Apr 2025 18:29:40 +0800
X-Barracuda-RBL-Trusted-Forwarder: 10.29.252.163
Received: from tony.zhaoxin.com (10.32.65.152) by ZXBJMBX03.zhaoxin.com
 (10.29.252.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.44; Wed, 23 Apr
 2025 18:28:52 +0800
From: Tony W Wang-oc <TonyWWang-oc@zhaoxin.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <peter.ujfalusi@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<maxtram95@gmail.com>, <hkallweit1@gmail.com>, <TonyWWang-oc@zhaoxin.com>,
	<ranjani.sridharan@linux.intel.com>, <skend@chromium.org>,
	<lumag@kernel.org>, <chaitanya.kumar.borah@intel.com>,
	<kai.vehmanen@linux.intel.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <CobeChen@zhaoxin.com>, <TimGuo@zhaoxin.com>, <LeoLiu-oc@zhaoxin.com>,
	<JoanneBao@glenfly.com>
Subject: [PATCH] ALSA: HDA: Add Zhaoxin HDMI Controller and Codec support
Date: Wed, 23 Apr 2025 18:28:51 +0800
X-ASG-Orig-Subj: [PATCH] ALSA: HDA: Add Zhaoxin HDMI Controller and Codec support
Message-ID: <20250423102851.57997-1-TonyWWang-oc@zhaoxin.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: zxbjmbx1.zhaoxin.com (10.29.252.163) To
 ZXBJMBX03.zhaoxin.com (10.29.252.7)
X-Moderation-Data: 4/23/2025 6:29:39 PM
X-Barracuda-Connect: zxbjmbx1.zhaoxin.com[10.29.252.163]
X-Barracuda-Start-Time: 1745404187
X-Barracuda-Encrypted: ECDHE-RSA-AES128-GCM-SHA256
X-Barracuda-URL: https://10.28.252.35:4443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at zhaoxin.com
X-Barracuda-Scan-Msg-Size: 4618
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.0000 1.0000 -2.0210
X-Barracuda-Spam-Score: -2.02
X-Barracuda-Spam-Status: No, SCORE=-2.02 using global scores of TAG_LEVEL=1000.0 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.140376
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------------------------

Add newer Zhaoxin HD Audio PCI IDs, and HDMI codec vendor IDs.

Because Zhaoxin hardware limitation, set BDL position to 128 to
increase interrupt interval.

To fix response write request not synced to memory when handle
HDAC interrupt, set bus->polling_mode =3D 1.

Signed-off-by: Joanne Bao <JoanneBao@glenfly.com>
Signed-off-by: Tony W Wang-oc <TonyWWang-oc@zhaoxin.com>
---
 sound/pci/hda/hda_intel.c  | 23 +++++++++++++++++++++++
 sound/pci/hda/patch_hdmi.c | 11 +++++++++++
 2 files changed, 34 insertions(+)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 9756017930b5..d7651a75c629 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -240,6 +240,7 @@ enum {
 	AZX_DRIVER_CTHDA,
 	AZX_DRIVER_CMEDIA,
 	AZX_DRIVER_ZHAOXIN,
+	AZX_DRIVER_ZHAOXINHDMI,
 	AZX_DRIVER_LOONGSON,
 	AZX_DRIVER_GENERIC,
 	AZX_NUM_DRIVERS, /* keep this as last entry */
@@ -355,6 +356,7 @@ static const char * const driver_short_names[] =3D {
 	[AZX_DRIVER_CTHDA] =3D "HDA Creative",
 	[AZX_DRIVER_CMEDIA] =3D "HDA C-Media",
 	[AZX_DRIVER_ZHAOXIN] =3D "HDA Zhaoxin",
+	[AZX_DRIVER_ZHAOXINHDMI] =3D "HDA Zhaoxin HDMI",
 	[AZX_DRIVER_LOONGSON] =3D "HDA Loongson",
 	[AZX_DRIVER_GENERIC] =3D "HD-Audio Generic",
 };
@@ -1750,6 +1752,8 @@ static int default_bdl_pos_adj(struct azx *chip)
 	case AZX_DRIVER_ICH:
 	case AZX_DRIVER_PCH:
 		return 1;
+	case AZX_DRIVER_ZHAOXINHDMI:
+		return 128;
 	default:
 		return 32;
 	}
@@ -1877,6 +1881,9 @@ static int azx_first_init(struct azx *chip)
 			chip->jackpoll_interval =3D msecs_to_jiffies(1500);
 	}
=20
+	if (chip->driver_type =3D=3D AZX_DRIVER_ZHAOXINHDMI)
+		bus->polling_mode =3D 1;
+
 	bus->remap_addr =3D pcim_iomap_region(pci, 0, "ICH HD audio");
 	if (IS_ERR(bus->remap_addr))
 		return PTR_ERR(bus->remap_addr);
@@ -1973,6 +1980,7 @@ static int azx_first_init(struct azx *chip)
 			chip->capture_streams =3D ATIHDMI_NUM_CAPTURE;
 			break;
 		case AZX_DRIVER_GFHDMI:
+		case AZX_DRIVER_ZHAOXINHDMI:
 		case AZX_DRIVER_GENERIC:
 		default:
 			chip->playback_streams =3D ICH6_NUM_PLAYBACK;
@@ -2781,6 +2789,21 @@ static const struct pci_device_id azx_ids[] =3D {
 	  .driver_data =3D AZX_DRIVER_GENERIC | AZX_DCAPS_PRESET_ATI_HDMI },
 	/* Zhaoxin */
 	{ PCI_VDEVICE(ZHAOXIN, 0x3288), .driver_data =3D AZX_DRIVER_ZHAOXIN },
+	{ PCI_VDEVICE(ZHAOXIN, 0x9141),
+	 .driver_data =3D AZX_DRIVER_ZHAOXINHDMI | AZX_DCAPS_POSFIX_LPIB |
+	 AZX_DCAPS_NO_MSI | AZX_DCAPS_NO_64BIT },
+	{ PCI_VDEVICE(ZHAOXIN, 0x9142),
+	 .driver_data =3D AZX_DRIVER_ZHAOXINHDMI | AZX_DCAPS_POSFIX_LPIB |
+	 AZX_DCAPS_NO_MSI | AZX_DCAPS_NO_64BIT },
+	{ PCI_VDEVICE(ZHAOXIN, 0x9144),
+	 .driver_data =3D AZX_DRIVER_ZHAOXINHDMI | AZX_DCAPS_POSFIX_LPIB |
+	 AZX_DCAPS_NO_MSI | AZX_DCAPS_NO_64BIT },
+	{ PCI_VDEVICE(ZHAOXIN, 0x9145),
+	 .driver_data =3D AZX_DRIVER_ZHAOXINHDMI | AZX_DCAPS_POSFIX_LPIB |
+	 AZX_DCAPS_NO_MSI | AZX_DCAPS_NO_64BIT },
+	{ PCI_VDEVICE(ZHAOXIN, 0x9146),
+	 .driver_data =3D AZX_DRIVER_ZHAOXINHDMI | AZX_DCAPS_POSFIX_LPIB |
+	 AZX_DCAPS_NO_MSI | AZX_DCAPS_NO_64BIT },
 	/* Loongson HDAudio*/
 	{ PCI_VDEVICE(LOONGSON, PCI_DEVICE_ID_LOONGSON_HDA),
 	  .driver_data =3D AZX_DRIVER_LOONGSON | AZX_DCAPS_NO_TCSEL },
diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 7167989a8d86..a3a53e63a51a 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -4610,6 +4610,17 @@ HDA_CODEC_ENTRY(0x11069f80, "VX900 HDMI/DP",	patch_v=
ia_hdmi),
 HDA_CODEC_ENTRY(0x11069f81, "VX900 HDMI/DP",	patch_via_hdmi),
 HDA_CODEC_ENTRY(0x11069f84, "VX11 HDMI/DP",	patch_generic_hdmi),
 HDA_CODEC_ENTRY(0x11069f85, "VX11 HDMI/DP",	patch_generic_hdmi),
+HDA_CODEC_ENTRY(0x1d179f86, "ZX-100S HDMI/DP",	patch_gf_hdmi),
+HDA_CODEC_ENTRY(0x1d179f87, "ZX-100S HDMI/DP",	patch_gf_hdmi),
+HDA_CODEC_ENTRY(0x1d179f88, "KX-5000 HDMI/DP",	patch_gf_hdmi),
+HDA_CODEC_ENTRY(0x1d179f89, "KX-5000 HDMI/DP",	patch_gf_hdmi),
+HDA_CODEC_ENTRY(0x1d179f8a, "KX-6000 HDMI/DP",	patch_gf_hdmi),
+HDA_CODEC_ENTRY(0x1d179f8b, "KX-6000 HDMI/DP",	patch_gf_hdmi),
+HDA_CODEC_ENTRY(0x1d179f8c, "KX-6000G HDMI/DP", patch_gf_hdmi),
+HDA_CODEC_ENTRY(0x1d179f8d, "KX-6000G HDMI/DP", patch_gf_hdmi),
+HDA_CODEC_ENTRY(0x1d179f8e, "KX-7000 HDMI/DP",	patch_gf_hdmi),
+HDA_CODEC_ENTRY(0x1d179f8f, "KX-7000 HDMI/DP",	patch_gf_hdmi),
+HDA_CODEC_ENTRY(0x1d179f90, "KX-7000 HDMI/DP",	patch_gf_hdmi),
 HDA_CODEC_ENTRY(0x80860054, "IbexPeak HDMI",	patch_i915_cpt_hdmi),
 HDA_CODEC_ENTRY(0x80862800, "Geminilake HDMI",	patch_i915_glk_hdmi),
 HDA_CODEC_ENTRY(0x80862801, "Bearlake HDMI",	patch_generic_hdmi),
--=20
2.25.1

