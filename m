Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527DE1E885A
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 07:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747120678; cv=none; b=J/GNBQDSVOBl3y9sqD8YAyvLQFbCVDPFKU0CMQMgFkOpwLxWCTCvLtHE5N7l21zLNdIZeODUxMohHA+BtPb3tjCcflQc60FFTRVWQIovJMs8ekR4fIJJo0aQUXXvLO0D4X106ag78CLBNtHCkH8NSHM3nuUmwPgcnyWaEVPSe8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747120678; c=relaxed/simple;
	bh=xvzoV0iC/YctRZfGcRgdGlhugaW2Vr1q1SDlXESDq+k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jMcanXmwmXXcWslBZsGGtX9VFpEOqoSAHhollADvP3jMg/5H8DGBuCqwifaOAXMb3o0td93rwMK9VS5/0pbyO1GDkjMFXspuV8Bi8hC4rzPEVgHoanwVmW2JGXnNWvQIUK3PTqKhdKhnazNdT3VrKbANb/03VC8AbVuCubsbOr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZDhAe/Fw; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZDhAe/Fw"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54D7HTOn3007472
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 02:17:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747120649;
	bh=UxNwJ+d0HodrpLSe63Wt0or4AAJJKcfodnYCzI/WscY=;
	h=From:To:CC:Subject:Date;
	b=ZDhAe/Fw8Ahpkx6nmiQ3k3K8K//iqMr4RTcVcaVZX5r1LycGIPo/k8+3utY2Qf33i
	 2Q5N5sCRMFQIKgSjRY9h8PS50en0uNTy2ubViTAZf/2ugpy3Qa+jzZMApN2AsVn5pn
	 9WhORdkI7NFqKiBjhwHxN0Zbkk/80y0DOyJxnG0g=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54D7HTlF066715
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 May 2025 02:17:29 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 May 2025 02:17:29 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 May 2025 02:17:29 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.161.59])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54D7HPTO114273;
	Tue, 13 May 2025 02:17:25 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <tiwai@suse.de>
CC: <broonie@kernel.org>, <andriy.shevchenko@linux.intel.com>,
        <13564923607@139.com>, <13916275206@139.com>,
        <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <baojun.xu@ti.com>, <Baojun.Xu@fpt.com>, <jesse-ji@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>,
        kernel test robot
	<lkp@intel.com>
Subject: [PATCH v1] ALSA: hda/tas2781: Fix the symbol was not declare warning reported by kernel test robot
Date: Tue, 13 May 2025 15:17:21 +0800
Message-ID: <20250513071721.1090-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

After commit 28a09d9e42c5 ("ALSA: hda/tas2781: Create an independent lib
to save the shared parts for both SPI and I2C driver") created a separated
lib for both hda-i2c and hda-spi driver, which caused this issue.
sparse warnings: (new ones prefixed by >>)
>> sound/pci/hda/tas2781_hda_spi.c:496:25: sparse: sparse: symbol
   'tas2781_snd_ctls' was not declared. Should it be static?
>> sound/pci/hda/tas2781_hda_spi.c:505:25: sparse: sparse: symbol
   'tas2781_prof_ctl' was not declared. Should it be static?
>> sound/pci/hda/tas2781_hda_spi.c:512:25: sparse: sparse: symbol
   'tas2781_dsp_ctls' was not declared. Should it be static?

Fixes: 28a09d9e42c5 ("ALSA: hda/tas2781: Create an independent lib to save the shared parts for both SPI and I2C driver")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://urldefense.com/v3/__https://lore.kernel.org/oe-kbuild-all/202505130420.vr9yDI3k-lkp@intel.com/__;!!G3vK!URphGMMfZ2erCLfJdETofl0O1mTSydDLLJ6inMIYWYUDUKYef_IuLvI7pnYj3Mx-4LRIi4BJEw$
Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v1:
 - | Reported-by: kernel test robot <lkp@intel.com>
   | Closes: https://urldefense.com/v3/__https://lore.kernel.org/oe-kbuild-all/202505130420.vr9yDI3k-lkp@intel.com/__;!!G3vK!URphGMMfZ2erCLfJdETofl0O1mTSydDLLJ6inMIYWYUDUKYef_IuLvI7pnYj3Mx-4LRIi4BJEw$
---
 sound/pci/hda/tas2781_hda_spi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/pci/hda/tas2781_hda_spi.c b/sound/pci/hda/tas2781_hda_spi.c
index 50b82ecabb90..e0f8603c4854 100644
--- a/sound/pci/hda/tas2781_hda_spi.c
+++ b/sound/pci/hda/tas2781_hda_spi.c
@@ -493,7 +493,7 @@ static int tas2781_force_fwload_put(struct snd_kcontrol *kcontrol,
 	return change;
 }
 
-struct snd_kcontrol_new tas2781_snd_ctls[] = {
+static struct snd_kcontrol_new tas2781_snd_ctls[] = {
 	ACARD_SINGLE_RANGE_EXT_TLV(NULL, TAS2781_AMP_LEVEL, 1, 0, 20, 0,
 		tas2781_amp_getvol, tas2781_amp_putvol, amp_vol_tlv),
 	ACARD_SINGLE_RANGE_EXT_TLV(NULL, TAS2781_DVC_LVL, 0, 0, 200, 1,
@@ -502,14 +502,14 @@ struct snd_kcontrol_new tas2781_snd_ctls[] = {
 		tas2781_force_fwload_put),
 };
 
-struct snd_kcontrol_new tas2781_prof_ctl = {
+static struct snd_kcontrol_new tas2781_prof_ctl = {
 	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
 	.info = tasdevice_info_profile,
 	.get = tasdevice_get_profile_id,
 	.put = tasdevice_set_profile_id,
 };
 
-struct snd_kcontrol_new tas2781_dsp_ctls[] = {
+static struct snd_kcontrol_new tas2781_dsp_ctls[] = {
 	/* Speaker Program */
 	{
 		.iface = SNDRV_CTL_ELEM_IFACE_CARD,
-- 
2.43.0

