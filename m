Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7601E1C22;
	Thu, 30 Jan 2025 15:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738251933; cv=none; b=UxUC5+4yGK6sQ01Kpv7OxytxklT6nEBhoFgxWsyXrBXjk7MrEpGdjyBGswMkTnFlhOLLgFpy9yUOVBSfLKHAkW0yBKtXBWfmEPrZzr3BfVunnaWtdEEnvuvFS3a4BipXn8LOdc6H31HpHC7EcIIDg6rEclvUUC7mtXYMqzluilY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738251933; c=relaxed/simple;
	bh=weQOwIjYJYH9Fvc6f2vO7vqMSQYvHZgRIwIM++ObIXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=edtuCWvQgy8PvgYwPd7dihdgih0jyf8BOcGRLEi9VN1M9cdohZbb+jGU8bod3D6OkRjzZiYq+CcHCBxTKccZI1+duxDbKqKIVN/2ksmMSiyT5aqdmXAdUul9EFK9+zXepfiCTIQVw/xYiq5O/JrJEtr06cluoEfnZFT3E/Ij19Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=f9D4XRCC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZL3SUWyR; arc=none smtp.client-ip=202.12.124.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="f9D4XRCC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZL3SUWyR"
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id 9D28D114010B;
	Thu, 30 Jan 2025 10:45:29 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Thu, 30 Jan 2025 10:45:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1738251929; x=
	1738338329; bh=SgQyaIVGztkMCarUps60DVXh+PXZsKmvoBlXKnoc3d4=; b=f
	9D4XRCCqfLJRx3YDZN8P9nk8ZahQVkNl/634bcnFN70UAi8EAdKJdhuz3+ruIuM0
	+hPe9PEraBHrA6DWjaE7kNamSbP+vEhje/FbINXGQUB6LfdB8u0Q8+gVwHmwrtu8
	cCDfDtWH7c7y3rTK3EBNkROiNhkMRki1N6TAu3OKnBh/Svi25gg5dTDQmWx2392Y
	xeC50h7L3KW1MhHjJIFQyaWQdr4ajBaLRZ7OTVEbGJgoTJYyJi9r+AzkDXXnudkP
	Pj1ZIQzpumqK8Rl11GmNqdCWUx2JMOJPrROOvA9dLZs0an92ryFmSiYO66klw6rK
	AefG9hYsUx/QLEdCii29Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1738251929; x=1738338329; bh=S
	gQyaIVGztkMCarUps60DVXh+PXZsKmvoBlXKnoc3d4=; b=ZL3SUWyRHEYXIT1vv
	RKPDyG7vVa82WYRWA3a+TQMTRnMJLa+9/wVp94O0NRM0qUi4EO5fE/Evn2zUnJuI
	lfEYGQmC8oX0YJYIl92JFbfulEECMlBeTWD1M9NuXaNxYT8n1Yp7Gmy1HNkVvOGl
	6s3KJIlTxv6PZ8hZQyxj57Pld12TlQyjCxU6NCwvbhZFUtXh+M6jpkVe0lc+W/wk
	O6QeXIqa6KK3u6CMATZDidMBICHGzJOjM3k7ZVumjiF9oTDEbU4CJ2bLS6Ys5o81
	NPH2g8T3DsAVNy+fHjEWMlfaAzqw0VyqcbJcVuE9k4EhEDNpiSIbEHng/9doYC5e
	XvKFw==
X-ME-Sender: <xms:mJ6bZ_oXhbNcsVoCMYdZLvDYFXHc_CiX2RVTn0CoVn5iAdIcqV9XIA>
    <xme:mJ6bZ5rtozFamldEGOcwkkr_1aMwzLzIvpzelyie2Lk2H75rBDNcQBbm5lRFWDkDF
    MXCp6EozJgmvwlKgsM>
X-ME-Received: <xmr:mJ6bZ8PenPefoTHPN_SjIecfJGtxo0mBEKCvKvwyzWNOQ32av6CzJmpvcU6BoPJxr9IbvbMyI2zBMfNCNqdnJHRRSqac1IFjCHxC9Tt05dDe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeivddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucgoteeftdduqddtudculd
    duhedmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhep
    ofgrrhhkucfrvggrrhhsohhnuceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsg
    gsrdgtrgeqnecuggftrfgrthhtvghrnhepfedtvdejfeelffevhffgjeejheduteetieeg
    uefgkefhhfegjeduueethefgvdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgt
    rgdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmh
    hpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgdprhgtphhtthhopehhuggv
    ghhovgguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtohepihhlphhordhjrghrvhhinh
    gvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehplhgrthhfohhrmhdq
    ughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplh
    hinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:mJ6bZy53lRgbmINIPsq6csmHLeQ9V48KTlbLrZkpbWO-u06q3YeA7Q>
    <xmx:mJ6bZ-7WYr9bXsKierJNjQvLRrHQ73FYF8bcQ-w0_6dex4yqu2UHRw>
    <xmx:mJ6bZ6jzfVLjc6GEgIdjVsk4I6HkVfUCx20_-7098d2q2FQ8ymNeZw>
    <xmx:mJ6bZw5ABwrH0xrsm9pFv8FHAucBOGV-96dmwXfi6DlxMLAxLKk2zw>
    <xmx:mZ6bZwShGEEc2zIRfCDX0boMEIX4VnMDWAJd_07lyxjUdTpYeFiy9Ro3>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jan 2025 10:45:28 -0500 (EST)
From: Mark Pearson <mpearson-lenovo@squebb.ca>
To: mpearson-lenovo@squebb.ca
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: thinkpad_acpi: Support for V9 DYTC platform profiles
Date: Thu, 30 Jan 2025 10:45:15 -0500
Message-ID: <20250130154520.26469-1-mpearson-lenovo@squebb.ca>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Newer Thinkpad AMD platforms are using V9 DYTC and this changes the
profiles used for PSC mode. Add support for this update.
Tested on P14s G5 AMD

Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 drivers/platform/x86/thinkpad_acpi.c | 33 ++++++++++++++++++----------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 1fcb0f99695a..cae457bc0b07 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -10319,6 +10319,10 @@ static struct ibm_struct proxsensor_driver_data = {
 #define DYTC_MODE_PSC_BALANCE  5  /* Default mode aka balanced */
 #define DYTC_MODE_PSC_PERFORM  7  /* High power mode aka performance */
 
+#define DYTC_MODE_PSCV9_LOWPOWER 1  /* Low power mode */
+#define DYTC_MODE_PSCV9_BALANCE  3  /* Default mode aka balanced */
+#define DYTC_MODE_PSCV9_PERFORM  4  /* High power mode aka performance */
+
 #define DYTC_ERR_MASK       0xF  /* Bits 0-3 in cmd result are the error result */
 #define DYTC_ERR_SUCCESS      1  /* CMD completed successful */
 
@@ -10339,6 +10343,10 @@ static int dytc_capabilities;
 static bool dytc_mmc_get_available;
 static int profile_force;
 
+static int platform_psc_profile_lowpower = DYTC_MODE_PSC_LOWPOWER;
+static int platform_psc_profile_balanced = DYTC_MODE_PSC_BALANCE;
+static int platform_psc_profile_performance = DYTC_MODE_PSC_PERFORM;
+
 static int convert_dytc_to_profile(int funcmode, int dytcmode,
 		enum platform_profile_option *profile)
 {
@@ -10360,19 +10368,14 @@ static int convert_dytc_to_profile(int funcmode, int dytcmode,
 		}
 		return 0;
 	case DYTC_FUNCTION_PSC:
-		switch (dytcmode) {
-		case DYTC_MODE_PSC_LOWPOWER:
+		if (dytcmode == platform_psc_profile_lowpower)
 			*profile = PLATFORM_PROFILE_LOW_POWER;
-			break;
-		case DYTC_MODE_PSC_BALANCE:
+		else if (dytcmode == platform_psc_profile_balanced)
 			*profile =  PLATFORM_PROFILE_BALANCED;
-			break;
-		case DYTC_MODE_PSC_PERFORM:
+		else if (dytcmode == platform_psc_profile_performance)
 			*profile =  PLATFORM_PROFILE_PERFORMANCE;
-			break;
-		default: /* Unknown mode */
+		else
 			return -EINVAL;
-		}
 		return 0;
 	case DYTC_FUNCTION_AMT:
 		/* For now return balanced. It's the closest we have to 'auto' */
@@ -10393,19 +10396,19 @@ static int convert_profile_to_dytc(enum platform_profile_option profile, int *pe
 		if (dytc_capabilities & BIT(DYTC_FC_MMC))
 			*perfmode = DYTC_MODE_MMC_LOWPOWER;
 		else if (dytc_capabilities & BIT(DYTC_FC_PSC))
-			*perfmode = DYTC_MODE_PSC_LOWPOWER;
+			*perfmode = platform_psc_profile_lowpower;
 		break;
 	case PLATFORM_PROFILE_BALANCED:
 		if (dytc_capabilities & BIT(DYTC_FC_MMC))
 			*perfmode = DYTC_MODE_MMC_BALANCE;
 		else if (dytc_capabilities & BIT(DYTC_FC_PSC))
-			*perfmode = DYTC_MODE_PSC_BALANCE;
+			*perfmode = platform_psc_profile_balanced;
 		break;
 	case PLATFORM_PROFILE_PERFORMANCE:
 		if (dytc_capabilities & BIT(DYTC_FC_MMC))
 			*perfmode = DYTC_MODE_MMC_PERFORM;
 		else if (dytc_capabilities & BIT(DYTC_FC_PSC))
-			*perfmode = DYTC_MODE_PSC_PERFORM;
+			*perfmode = platform_psc_profile_performance;
 		break;
 	default: /* Unknown profile */
 		return -EOPNOTSUPP;
@@ -10599,6 +10602,7 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
 	if (output & BIT(DYTC_QUERY_ENABLE_BIT))
 		dytc_version = (output >> DYTC_QUERY_REV_BIT) & 0xF;
 
+	dbg_printk(TPACPI_DBG_INIT, "DYTC version %d\n", dytc_version);
 	/* Check DYTC is enabled and supports mode setting */
 	if (dytc_version < 5)
 		return -ENODEV;
@@ -10637,6 +10641,11 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
 		}
 	} else if (dytc_capabilities & BIT(DYTC_FC_PSC)) { /* PSC MODE */
 		pr_debug("PSC is supported\n");
+		if (dytc_version >= 9) { /* update profiles for DYTC 9 and up */
+			platform_psc_profile_lowpower = DYTC_MODE_PSCV9_LOWPOWER;
+			platform_psc_profile_balanced = DYTC_MODE_PSCV9_BALANCE;
+			platform_psc_profile_performance = DYTC_MODE_PSCV9_PERFORM;
+		}
 	} else {
 		dbg_printk(TPACPI_DBG_INIT, "No DYTC support available\n");
 		return -ENODEV;
-- 
2.47.1

