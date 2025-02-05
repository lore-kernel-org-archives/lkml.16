Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EF11519B1;
	Wed,  5 Feb 2025 16:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771749; cv=none; b=QCa/bbRhuyjplwIDNYWs6lAnR+3Nit7g1V4Xwu1E91R5fFW5a3z7tcBJOADubvQ4Llvcu6mjsrfiT+49400w/M5pOplmZG93i3TZBctKGnvcexA/el3aTQsb1IStTKM/2sRb8W9ervfy2XDays+a/HvDslO8v1zgcEM9Yj2eT80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771749; c=relaxed/simple;
	bh=F8668StW9/w4a2vLVJfdRxxvvZY/qa0fTwKXNsntRnw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PihnYUzZcCKxDd3gsVXBQ98LtG70tCEZrZpFPXy1tkc6j+nAKtacfrI7eOSq8TVffgDmRhopibVdr5gr1IhBt0Ulb6421ACXnyuVfyivcxVFLP6PqYekX8PVpa/YWh8tOv+5phQJnwmhhbBbWYK9LnnKhvVoaHwTfdDn0+JUnD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=hJP9OMaE; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="hJP9OMaE"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5156Lall024527;
	Wed, 5 Feb 2025 10:08:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=UUzPVgCpajggfKVM
	dv9jNuQ4lruaM+EuO+bTxw7gNlI=; b=hJP9OMaEjQBaOuU5P6jdWOamzy/d1rHH
	Qul6t6bbB+PS/HySHXaluk/0fr0uYjb4WRmAIDFO+5JRwKpWbFkYckSsebUqmoo6
	GtOIBBzREwL/gtc9/iEPzYlRU1gR82lUoGbN9ol+CCXC6F8HbDVVEQ9Wb2qHios8
	UXK/ryUkEFBHI+Qrp/201gC9i2vKUy/gxYSLXZsoIM8DpTRvT2Nk17Hdk10lAfY2
	xmFqdg9i6p0drBpDGsEfPIMAgpxzS4WK3Fl96XSmOYYiuii9vfbWM8j4qT9eHvSm
	PVmzb8R/tMlwTBCs5DPBQ0zwwllJtmmaX2WPVqt/ugQInuuWHF23lg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 44hhw54pqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Feb 2025 10:08:54 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 5 Feb
 2025 16:08:52 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.14 via Frontend Transport; Wed, 5 Feb 2025 16:08:52 +0000
Received: from lonswws03.ad.cirrus.com (lonswws03.ad.cirrus.com [198.90.188.34])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 1DD84820248;
	Wed,  5 Feb 2025 16:08:52 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Vitaly Rodionov
	<vitalyr@opensource.cirrus.com>
Subject: [PATCH] ASoC: arizona/madera: use fsleep() in up/down DAPM event delays.
Date: Wed, 5 Feb 2025 16:08:46 +0000
Message-ID: <20250205160849.500306-1-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: C0djC6pTA-orCrzm0sCvAivmT_sJvqXP
X-Authority-Analysis: v=2.4 cv=W/3CVQWk c=1 sm=1 tr=0 ts=67a38d16 cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=T2h4t0Lz3GQA:10 a=w1d2syhTAAAA:8 a=Rk8IO1C96jJ1JY0G4JwA:9 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-GUID: C0djC6pTA-orCrzm0sCvAivmT_sJvqXP
X-Proofpoint-Spam-Reason: safe

Using `fsleep` instead of `msleep` resolves some customer complaints
regarding the precision of up/down DAPM event timing. `fsleep()`
automatically selects the appropriate sleep function, making the delay
time more predictable.

Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/soc/codecs/arizona.c | 14 +++++++-------
 sound/soc/codecs/madera.c  | 10 +++++-----
 sound/soc/codecs/wm5110.c  |  8 ++++----
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/arizona.c b/sound/soc/codecs/arizona.c
index 402b9a2ff024..68cdb1027d0c 100644
--- a/sound/soc/codecs/arizona.c
+++ b/sound/soc/codecs/arizona.c
@@ -967,7 +967,7 @@ int arizona_out_ev(struct snd_soc_dapm_widget *w,
 		case ARIZONA_OUT3L_ENA_SHIFT:
 		case ARIZONA_OUT3R_ENA_SHIFT:
 			priv->out_up_pending++;
-			priv->out_up_delay += 17;
+			priv->out_up_delay += 17000;
 			break;
 		case ARIZONA_OUT4L_ENA_SHIFT:
 		case ARIZONA_OUT4R_ENA_SHIFT:
@@ -977,7 +977,7 @@ int arizona_out_ev(struct snd_soc_dapm_widget *w,
 			case WM8997:
 				break;
 			default:
-				priv->out_up_delay += 10;
+				priv->out_up_delay += 10000;
 				break;
 			}
 			break;
@@ -999,7 +999,7 @@ int arizona_out_ev(struct snd_soc_dapm_widget *w,
 			if (!priv->out_up_pending && priv->out_up_delay) {
 				dev_dbg(component->dev, "Power up delay: %d\n",
 					priv->out_up_delay);
-				msleep(priv->out_up_delay);
+				fsleep(priv->out_up_delay);
 				priv->out_up_delay = 0;
 			}
 			break;
@@ -1017,7 +1017,7 @@ int arizona_out_ev(struct snd_soc_dapm_widget *w,
 		case ARIZONA_OUT3L_ENA_SHIFT:
 		case ARIZONA_OUT3R_ENA_SHIFT:
 			priv->out_down_pending++;
-			priv->out_down_delay++;
+			priv->out_down_delay += 1000;
 			break;
 		case ARIZONA_OUT4L_ENA_SHIFT:
 		case ARIZONA_OUT4R_ENA_SHIFT:
@@ -1028,10 +1028,10 @@ int arizona_out_ev(struct snd_soc_dapm_widget *w,
 				break;
 			case WM8998:
 			case WM1814:
-				priv->out_down_delay += 5;
+				priv->out_down_delay += 5000;
 				break;
 			default:
-				priv->out_down_delay++;
+				priv->out_down_delay += 1000;
 				break;
 			}
 			break;
@@ -1053,7 +1053,7 @@ int arizona_out_ev(struct snd_soc_dapm_widget *w,
 			if (!priv->out_down_pending && priv->out_down_delay) {
 				dev_dbg(component->dev, "Power down delay: %d\n",
 					priv->out_down_delay);
-				msleep(priv->out_down_delay);
+				fsleep(priv->out_down_delay);
 				priv->out_down_delay = 0;
 			}
 			break;
diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index a840a2eb92b9..af109761f359 100644
--- a/sound/soc/codecs/madera.c
+++ b/sound/soc/codecs/madera.c
@@ -2323,10 +2323,10 @@ int madera_out_ev(struct snd_soc_dapm_widget *w,
 	case CS42L92:
 	case CS47L92:
 	case CS47L93:
-		out_up_delay = 6;
+		out_up_delay = 6000;
 		break;
 	default:
-		out_up_delay = 17;
+		out_up_delay = 17000;
 		break;
 	}
 
@@ -2357,7 +2357,7 @@ int madera_out_ev(struct snd_soc_dapm_widget *w,
 		case MADERA_OUT3R_ENA_SHIFT:
 			priv->out_up_pending--;
 			if (!priv->out_up_pending) {
-				msleep(priv->out_up_delay);
+				fsleep(priv->out_up_delay);
 				priv->out_up_delay = 0;
 			}
 			break;
@@ -2376,7 +2376,7 @@ int madera_out_ev(struct snd_soc_dapm_widget *w,
 		case MADERA_OUT3L_ENA_SHIFT:
 		case MADERA_OUT3R_ENA_SHIFT:
 			priv->out_down_pending++;
-			priv->out_down_delay++;
+			priv->out_down_delay += 1000;
 			break;
 		default:
 			break;
@@ -2393,7 +2393,7 @@ int madera_out_ev(struct snd_soc_dapm_widget *w,
 		case MADERA_OUT3R_ENA_SHIFT:
 			priv->out_down_pending--;
 			if (!priv->out_down_pending) {
-				msleep(priv->out_down_delay);
+				fsleep(priv->out_down_delay);
 				priv->out_down_delay = 0;
 			}
 			break;
diff --git a/sound/soc/codecs/wm5110.c b/sound/soc/codecs/wm5110.c
index 502196253d42..64eee0d2347d 100644
--- a/sound/soc/codecs/wm5110.c
+++ b/sound/soc/codecs/wm5110.c
@@ -302,7 +302,7 @@ static int wm5110_hp_pre_enable(struct snd_soc_dapm_widget *w)
 		} else {
 			wseq = wm5110_no_dre_left_enable;
 			nregs = ARRAY_SIZE(wm5110_no_dre_left_enable);
-			priv->out_up_delay += 10;
+			priv->out_up_delay += 10000;
 		}
 		break;
 	case ARIZONA_OUT1R_ENA_SHIFT:
@@ -312,7 +312,7 @@ static int wm5110_hp_pre_enable(struct snd_soc_dapm_widget *w)
 		} else {
 			wseq = wm5110_no_dre_right_enable;
 			nregs = ARRAY_SIZE(wm5110_no_dre_right_enable);
-			priv->out_up_delay += 10;
+			priv->out_up_delay += 10000;
 		}
 		break;
 	default:
@@ -338,7 +338,7 @@ static int wm5110_hp_pre_disable(struct snd_soc_dapm_widget *w)
 			snd_soc_component_update_bits(component,
 						      ARIZONA_SPARE_TRIGGERS,
 						      ARIZONA_WS_TRG1, 0);
-			priv->out_down_delay += 27;
+			priv->out_down_delay += 27000;
 		}
 		break;
 	case ARIZONA_OUT1R_ENA_SHIFT:
@@ -350,7 +350,7 @@ static int wm5110_hp_pre_disable(struct snd_soc_dapm_widget *w)
 			snd_soc_component_update_bits(component,
 						      ARIZONA_SPARE_TRIGGERS,
 						      ARIZONA_WS_TRG2, 0);
-			priv->out_down_delay += 27;
+			priv->out_down_delay += 27000;
 		}
 		break;
 	default:
-- 
2.43.0

