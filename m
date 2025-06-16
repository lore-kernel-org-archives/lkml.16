Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F43C1991CD
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750060018; cv=none; b=eavDTjj5MjWP+OEWqKFYEliogfEHvrxFloy7LDqUcmD9JzuVmW7Mek5L4R/v+gLGW27tc+2/MEbVBl67PuFiv+u38d9Z1Dfo8rDefEsTaWCNxwJgpLFucnD/T7EbsKYminHpDk/moSc7X+GH/PfQB98aycYayz60ZPh2ZV5+2mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750060018; c=relaxed/simple;
	bh=jgAxsTdc39hBDx7iOTO5H6wVJ8soJenHQN6jHtoYN5s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=m+tU2Q9NFMQxXm9LSRe/a7AwTNBs0FAeqiyxJ4MUuxPLPINFI2iK4N1X7eNCc2eXNbSuDWICYst1954eDcmiVAPkHksOlv9yKddS3UmjYj09QINBYi7mNcbO2Vk0zXE8QVgSjFxCIyEl4dkvcGvvBvvYYFGF8Tm0HppvvU2jwvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=AnnBijBV; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="AnnBijBV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=W5
	j43MkTtuhs8sLgSYF06e94i28Dyh1YdNYRzVhcD+k=; b=AnnBijBVVxkVB0n/id
	LVlTpE4ey75AQ1TwAG+xGen99uajIa+EJ6OJZ9StTC/QpqU79mdMMet0QLVQrNCM
	9R0TppduEUHGdGBWxLrz3UkMvXQncERgK5A/Fmsrn1eOp3G5t8siUBg/gKc+YFQf
	Lwp83xJ9PLs1I/wqLjZWGV/pQ=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgCHXoSgy09oddz2Aw--.42840S2;
	Mon, 16 Jun 2025 15:45:37 +0800 (CST)
From: wangdicheng <wangdich9700@163.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	wangdicheng <wangdich9700@163.com>,
	wangdicheng <wangdicheng@kylinos.cn>
Subject: [PATCH] ALSA: hda/realtek: Fixup ft alc257 rename alc3328
Date: Mon, 16 Jun 2025 15:45:20 +0800
Message-Id: <20250616074520.582138-1-wangdich9700@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgCHXoSgy09oddz2Aw--.42840S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WFW5Ww13Kw4xCF1DKFW7Jwb_yoW8trWfpF
	45ZF48WFZ3XF92vr4xKF4UuF1rC3WkGFyrC3y3u34Iqw1kZ395GF4jqF4jvFn3GrW8Gry5
	Zr1qva4Yqr4Fqr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUUku7UUUUU=
X-CM-SenderInfo: pzdqwv5lfkmliqq6il2tof0z/xtbBDRBuT2hPyE1ZWwAAsc

Audio ALC3328 recognized as ALC257, updated PCI ID0x10EC12F0 to rename it to 3328

Signed-off-by: wangdicheng <wangdicheng@kylinos.cn>
---
 sound/pci/hda/patch_realtek.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index d3c9ed963588..e18b2a2acba8 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6712,6 +6712,13 @@ static void alc_fixup_disable_mic_vref(struct hda_codec *codec,
 		snd_hda_codec_set_pin_target(codec, 0x19, PIN_VREFHIZ);
 }
 
+static void alc_fixup_ft_alc257_rename(struct hda_codec *codec,
+                                 const struct hda_fixup *fix, int action)
+{
+       int err;
+       if (action == HDA_FIXUP_ACT_PRE_PROBE)
+               err = alc_codec_rename(codec, "ALC3328");
+}
 
 static void alc294_gx502_toggle_output(struct hda_codec *codec,
 					struct hda_jack_callback *cb)
@@ -7799,6 +7806,7 @@ enum {
 	ALC269_FIXUP_VAIO_VJFH52_MIC_NO_PRESENCE,
 	ALC233_FIXUP_MEDION_MTL_SPK,
 	ALC294_FIXUP_BASS_SPEAKER_15,
+	ALC257_FIXUP_FT_RENAME,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -10143,6 +10151,10 @@ static const struct hda_fixup alc269_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc294_fixup_bass_speaker_15,
 	},
+	[ALC257_FIXUP_FT_RENAME] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = alc_fixup_ft_alc257_rename,
+	},
 };
 
 static const struct hda_quirk alc269_fixup_tbl[] = {
@@ -10715,6 +10727,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x10cf, 0x1757, "Lifebook E752", ALC269_FIXUP_LIFEBOOK_HP_PIN),
 	SND_PCI_QUIRK(0x10cf, 0x1845, "Lifebook U904", ALC269_FIXUP_LIFEBOOK_EXTMIC),
 	SND_PCI_QUIRK(0x10ec, 0x10f2, "Intel Reference board", ALC700_FIXUP_INTEL_REFERENCE),
+	SND_PCI_QUIRK(0x10ec, 0x12f0, "BXC NF271B FT board", ALC257_FIXUP_FT_RENAME),
 	SND_PCI_QUIRK(0x10ec, 0x118c, "Medion EE4254 MD62100", ALC256_FIXUP_MEDION_HEADSET_NO_PRESENCE),
 	SND_PCI_QUIRK(0x10ec, 0x119e, "Positivo SU C1400", ALC269_FIXUP_ASPIRE_HEADSET_MIC),
 	SND_PCI_QUIRK(0x10ec, 0x11bc, "VAIO VJFE-IL", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
-- 
2.25.1

