Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AF12DA77F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 08:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749804695; cv=none; b=Q43E9gsD/WHs7m9htcnAZPQQIVeiCoZEuWkTGT1L1/Bfei4sIJGop6TX4rS/SmOVJr7BsPqNF4ug+mT3I86y12d/VnW3C8sXdcwCh3Le1MXqFEH2HKZc0GiY84lFAynDBgmoaerYQ9/wA7aVkGBPEECW7JDkpxBoV8AR9sGPNQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749804695; c=relaxed/simple;
	bh=ue1V2fMlHFxjzWDa7ywds9gbO56VeSoCDkL1sUWu9lI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hBoFQXa18fzesCpjPySpmJdArniAAEHZCjcxjT1gRkrU3znMoI1pnAbsBIBnChvAAB6w83itkIFsAnStGrVl++FkDvgMYj0OKB4drmUljgB5EDnKz0HQvnv29rYIhf1yxhL/QTojaI2bfyXvCX/X+8GvCiSvxDe+wb0cDkATqE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Vk+RyFkP; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Vk+RyFkP"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-747fc7506d4so1752396b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 01:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749804693; x=1750409493; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ra+cpBxpnqunFQ4OV0qpDstT9OVa7F5M+0LYQ6+T/Pk=;
        b=Vk+RyFkPfsKDz9H8vL9zUnNbxgif+YWg+5F2GR5B7w9ZmBDKFr03ds2eDlVBYjH+oi
         Q1ZHrs9Ag2cclFvOX8IuDuHXhd+g5Qng5yG78feKQ9nKKN/Livg/1R/614VrYLg+4/Wq
         I7bbbvFOfbbMYTuORd1rCBKXn6xrHH9IH6/wY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749804693; x=1750409493;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ra+cpBxpnqunFQ4OV0qpDstT9OVa7F5M+0LYQ6+T/Pk=;
        b=BF7MJExDfse2feTHOYX25g+fAAEsseE1Rf7hFaqH/Mj7oZbHRoWiI3Z9ARagf0fO59
         12/u/wC1IMivDXP7cxQ59rGfLYTMsuDsIQq+cVeEKbPSYaz4VoArR4LSAW/AQKkvpu1z
         7ho68QGYEqYSE7aVX3g5+oNBfJfyUvMrpsSeOR+6BQfQM40rcK+HFOTcNL1WYlpCM9lG
         EyGgE8DY/4G99yYfEbIsxAZzO5Hb36ijkgSBBVeesDLT57HYo69oZoFATT1Ce3LSyIYa
         S8Cy5Hj5tGos6pVf8dtaVF9DHOwNza+XO05J6I06Y7+9LFpYzjJV1SEeXv8rVUUOugrb
         C2pQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQLcsNKc1YWBwSBU99yC8jajPT0SM9MxgeUTLcdlG2qkah02l7/IMr+6aXj6VhTWYyPxvVx0sXanRMhcw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCGKzXO1dm2KJqchiQY2NR7XJIa4Hwb+LDreaEB99zmTfuJ2xj
	pv1uPJgv64DFNvYroL0V20ZKP2xPEXTMYuBw4/pcG9O37X2+AZd0pGIx3q1Mrue4qQ==
X-Gm-Gg: ASbGncvpKgwAa3ly6v02WTe4fSFxM7K7EEwkgeWWcCYNp7qhQvnRONC29SwXuRa8zcy
	A2Jn3/EpuZL2ct1V5UDodnEGHItubw/5PYp4sPjbYYD6rvPt8Xo+k27xye5H4bOg0JRjWz540XS
	9h9UNFEslui5LQccZlecq4GG4CxsckaUw1/obQtgv+uA97OWZ8FXYMX2Z+Zt8lbBSX2gNhb7Zi5
	5Po2Z/TVXy3RJarYmw0zwe+6xoSpR70gFT2quYq8s4UGcQMuFZjdPktZoa+vA7AqOPin+gf7XHN
	trT2oakp85QDloGkUh5c/yH7/SElHrI8cMX8jP3SNQmULR+q/kQS5JMCQufmXUFftAm5jU+qV3w
	T0uIxGKqFivp0SxJ3Qwhy49k=
X-Google-Smtp-Source: AGHT+IH9vwPEaPkVV6IKS2ERa3AkzSRnik4hPp/d8F3OsHuqwJVSjrz2eaWzpBszwWSFt7ME9aFmZQ==
X-Received: by 2002:a05:6a00:984:b0:739:50c0:b3fe with SMTP id d2e1a72fcca58-7488f6cb9b2mr3944526b3a.8.1749804693085;
        Fri, 13 Jun 2025 01:51:33 -0700 (PDT)
Received: from htcheong-p620.tpe.corp.google.com ([2401:fa00:1:17:6b54:d556:d2c0:44d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900affa1sm1064510b3a.118.2025.06.13.01.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 01:51:32 -0700 (PDT)
From: Terry Cheong <htcheong@chromium.org>
Date: Fri, 13 Jun 2025 16:51:27 +0800
Subject: [PATCH] ASoC: hdmi-codec: use SND_JACK_AVOUT as jack status
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-hdmi-v1-1-665ba7ecd5e7@chromium.org>
X-B4-Tracking: v=1; b=H4sIAI7mS2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDM0Nj3YyU3ExdS3PTtBQT46SU1OQkJaDSgqLUtMwKsDHRsbW1AJu54AB
 WAAAA
X-Change-ID: 20250613-hdmi-975fd43bdecb
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 bailideng@google.com, judyhsiao@google.com, yuhsuan@google.com, 
 Terry Cheong <htcheong@chromium.org>
X-Mailer: b4 0.14.2

Use SND_JACK_AVOUT as the mask to align with hdac_hdmi driver so that we
can determine HDMI/DP devices from event type.

Most drivers that uses hdmi-codec driver will not be affected since they
are creating jacks with SND_JACK_LINEOUT mask. They will still report
SND_JACK_LINEOUT when the jack status is updated with
snd_soc_jack_report.

Signed-off-by: Terry Cheong <htcheong@chromium.org>
---
 sound/soc/codecs/hdmi-codec.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 31121f9c18c91a7444420c7ad2a10fd5ea406dc3..e1933f733af1032bc6f8fef1de4356a346aabcfa 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -943,7 +943,7 @@ static void hdmi_codec_jack_report(struct hdmi_codec_priv *hcp,
 {
 	if (jack_status != hcp->jack_status) {
 		if (hcp->jack)
-			snd_soc_jack_report(hcp->jack, jack_status, SND_JACK_LINEOUT);
+			snd_soc_jack_report(hcp->jack, jack_status, SND_JACK_AVOUT);
 		hcp->jack_status = jack_status;
 	}
 }
@@ -964,7 +964,7 @@ static void plugged_cb(struct device *dev, bool plugged)
 			else
 				snd_show_eld(dev, &hcp->eld_parsed);
 		}
-		hdmi_codec_jack_report(hcp, SND_JACK_LINEOUT);
+		hdmi_codec_jack_report(hcp, SND_JACK_AVOUT);
 	} else {
 		hdmi_codec_jack_report(hcp, 0);
 		memset(hcp->eld, 0, sizeof(hcp->eld));
@@ -984,7 +984,7 @@ static int hdmi_codec_set_jack(struct snd_soc_component *component,
 		 * Report the initial jack status which may have been provided
 		 * by the parent hdmi driver while the hpd hook was registered.
 		 */
-		snd_soc_jack_report(jack, hcp->jack_status, SND_JACK_LINEOUT);
+		snd_soc_jack_report(jack, hcp->jack_status, SND_JACK_AVOUT);
 
 		return 0;
 	}

---
base-commit: 27605c8c0f69e319df156b471974e4e223035378
change-id: 20250613-hdmi-975fd43bdecb

Best regards,
-- 
Terry Cheong <htcheong@chromium.org>

