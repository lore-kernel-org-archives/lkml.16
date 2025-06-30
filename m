Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8556218AD4
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751268687; cv=none; b=INoiVg8/r7icF4WHfjGyjCAHp5ZX8667Yd24HdC4YuimCg90ZQUUbqKY5n7lmmn/ebAeL8I8HQyhboF/0WF4yPD4dda36mHIkVNMzrvfK1xiAbavijO1qdYbi5XxpC3Wvb6kTb4MRu+IXkHM+Nsrg7dYf+PmqAmpwpFkcpqMrWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751268687; c=relaxed/simple;
	bh=IFIH+MZeZGncc5oPqvS+TkU1/Rq4qHZHJMPO62is7RU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qigINJ90mLuHybRsOkxNcTbIJAqBHhWtIHTe3yJWa0iJSPU8OjlwFVLvv20X5qA0kQsy9KLSQ/5CDG333AQKxcTCOBPvsvW97nvGl6Lkj2IWqByMP3Hj0edQeFrQ7DiwxxGEnZL22Mx2Ew/9e7IK1t9gjgSwEHpOJEmRSml4uAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=compal.corp-partner.google.com; spf=pass smtp.mailfrom=compal.corp-partner.google.com; dkim=pass (2048-bit key) header.d=compal-corp-partner-google-com.20230601.gappssmtp.com header.i=@compal-corp-partner-google-com.20230601.gappssmtp.com header.b=JFUprPnD; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=compal.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=compal.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=compal-corp-partner-google-com.20230601.gappssmtp.com header.i=@compal-corp-partner-google-com.20230601.gappssmtp.com header.b="JFUprPnD"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-748feca4a61so994133b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 00:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=compal-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1751268685; x=1751873485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=POxYgTmDu2e9RWNzg1dbBCkTKGEMfv0ASNz6IDybwM0=;
        b=JFUprPnDZVsEi7JTE1op6i7IyINe3LBrDwYzkNVK1Wvu7hyCyVp0mpndnuQHoZu2i+
         EdT4D7g7dY5U4FZgHgoqGKPEt4WVPFO6vWpWl84teRadFPqfy9MdQ3ovNlxo3MLuzX/v
         rjDVfVuBBIuo/p86/JVpHRlPHCsHe0kTwP7cPG4xTuMXVv59Cty9K06JKoEslt56yKmL
         CnaeJeWfY5bOPq3GQ9IAQxT5uIsLx4LuVvvlc12IjdI8OVQ+ZE/JOAwq//4csZpeWVp1
         zSrN55F2KZMLAgNIczBGLM0sV9s6SmwX4gbeFMF/puKb0UhQsuV6muSC1X7PcE9nCEtu
         oOXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751268685; x=1751873485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=POxYgTmDu2e9RWNzg1dbBCkTKGEMfv0ASNz6IDybwM0=;
        b=CxAkjxylkLxgKOsOI50kjlOEmI4nptAtFraoIQpbCIiIpJY9FuRSgx736I+Rw7asIO
         ETfXocPurkdhUEgUIItBV96YtUxzdP6Ors1Z0GZcaM6OsYzlnq2Bk08pJMdqXmiLj6+j
         5WacyRGtY2dXrRcp3murmnVd45oDGJZXoO4T7agwNPbPgvp9t0FfSK2uu4JPJWKpgpxn
         oVXdHyNRfZ4ktCOVk8Qf83/kQYywS6iFTTNPODfRErILQUjiy/5EkMYtoaFA1bODkQaB
         KtV8RockLCTJx2w3Ptlg+Yr2rvdFUiOkPML/bySuUbdALoniw09qJeXaTX+FL8zUQd/T
         tOaA==
X-Gm-Message-State: AOJu0YxRIhkhpc4FIszejFmqytINtSzQX1b/eK/UbYvEMkB3pIFLYgME
	nmIBclyJgtjq4q2T8rszpSmbGYEyFoMhN7GvDUhKrtfPRDaG9CXZ115niGUOzqCAGkgt7jNMXmG
	zExMT
X-Gm-Gg: ASbGnctNMi0Sx/YrIRG7PuNAwsL6puF7yP+lzwViXuuO1Fkb7tat6GXKhxgNokZcLJV
	kfQARYt88eM/rpc25P++xN1tEs7aEMyYsDnyrpocO84hLAPQ/58oeyGX37oH6uduVlXoP5vkUNi
	rZyrj1zyWcYwF6iEYaBvWydy3emlXpGtCrH0cC77FGnF+1uZqsBcCK8JI7ic3m0fMgKvVP2I7tj
	b4IIKhRFTEBNg/BbctsxfQPvufdsgCTttXoxpL+gX+yj+9Ih+dZ12ydUTZFYfJHutxFTrtIjLK6
	wXDrkB1Jha5fbye8I78CbS8+lAqQVEk4EqUPWRR4iaJdZzlnLlD9fE4xoZimUY0na12wZI7ySZI
	gSUDQXRv+rybI9c4iO/Oq1g7+WWiK+nVjjYmHZuMhKxheXZF2VIYB1bQrHDwvt1t7kwaZYRRibI
	0Kurysfngvb/9fL8LrS5gK8a1/ZYfdriaXEZgLzAOLPxxG9+BmzMDI39A=
X-Google-Smtp-Source: AGHT+IF2dJnHM1Gkfw8ZKgifsBXM1Dg3mh0qy29vCF7Kn90HV7QpAS1LvEjYMDtwWkrjgbtM4CyJuQ==
X-Received: by 2002:a05:6a00:1403:b0:740:afda:a742 with SMTP id d2e1a72fcca58-74af6d381c6mr16618695b3a.0.1751268684834;
        Mon, 30 Jun 2025 00:31:24 -0700 (PDT)
Received: from ajye-OMEN-by-HP-Laptop-S.compal.com (2001-b011-2017-b5df-1684-9463-00f4-4a0e.dynamic-ip6.hinet.net. [2001:b011:2017:b5df:1684:9463:f4:4a0e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af56ceb74sm8512046b3a.135.2025.06.30.00.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 00:31:24 -0700 (PDT)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Naveen Manohar <naveen.m@intel.com>,
	Dharageswari R <dharageswari.r@intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mac Chiang <mac.chiang@intel.com>,
	alsa-devel@alsa-project.org,
	Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Subject: [PATCH v1] ASoC: Intel: soc-acpi-intel-ptl-match: Add rt721_l0 support
Date: Mon, 30 Jun 2025 15:31:12 +0800
Message-Id: <20250630073112.2823898-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch adds driver data & match table for rt721
multi-function codec on PTL at sdw link0.

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
---
 .../intel/common/soc-acpi-intel-ptl-match.c   | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index eae75f3f0fa4..0257e12e8b6e 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -330,6 +330,15 @@ static const struct snd_soc_acpi_adr_device rt1320_3_group1_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt721_0_single_adr[] = {
+	{
+		.adr = 0x000030025d072101ull,
+		.num_endpoints = ARRAY_SIZE(rt_mf_endpoints),
+		.endpoints = rt_mf_endpoints,
+		.name_prefix = "rt721"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt721_3_single_adr[] = {
 	{
 		.adr = 0x000330025d072101ull,
@@ -339,6 +348,15 @@ static const struct snd_soc_acpi_adr_device rt721_3_single_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_link_adr ptl_rt721_l0[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt721_0_single_adr),
+		.adr_d = rt721_0_single_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr ptl_rt721_l3[] = {
 	{
 		.mask = BIT(3),
@@ -664,6 +682,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.sof_tplg_filename = "sof-ptl-rt712-l3-rt1320-l3.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
+	{
+		.link_mask = BIT(0),
+		.links = ptl_rt721_l0,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-ptl-rt721.tplg",
+	},
 	{
 		.link_mask = BIT(3),
 		.links = ptl_rt721_l3,
-- 
2.25.1

