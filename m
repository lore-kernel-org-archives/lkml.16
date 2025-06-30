Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B5F221540
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751272267; cv=none; b=AgjK2pVRnp+6e1ut6+hbdmcNbBjKuUiY1m0b92aqzZ/MKYk053qdjf7xVzW9R0LmvF9gH71gYMkmY1+l4uMBU5R3EB5zZf7APiQd/1qVQ+XYk43gfsHf1b66BbkiwGxjT94h49RyuW+IDYLr7CK2t7tozs9erqRp8ZJg5AFoAH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751272267; c=relaxed/simple;
	bh=jfK1JCLXX0AQ/C2AaSK8OfLO9I78+U+gJ/g5BtnDLp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K5zDdXmCKmCkiWW8n+uj9FTIJ82ab2TG1HQxfsVuB2b6oohxVZ1rUF1Lau56GjBhbItyTMav/QNiCmNtDMuHoBl4CqkHUqUlVRzYsK+fttO7WKpHCRAS4mO3R7fva+B8M4TKmvv7by6ier0fQ3sL9J/f81nh9Sy/YQ7dOzvpY1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aySfQ6im; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aySfQ6im"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so8027414a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 01:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751272264; x=1751877064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l8JjQ+1mhu7w6AzCypUJiqd/c0GGf08rutzFlOhZeNc=;
        b=aySfQ6imY82FygRFpgj0juGlIaG5RsqoQ5KUScV1+nMxUfE/jMSASgGgEE4401PuGL
         Gpwn8LHkuCVwn09kY6JSuIEes5UiEXecHVUiO8E7oWlu90dAa++p5AW76495tSR/pFXf
         CeDdhOiihjtl0T3FAGTO7Y6oCEHUpzkBE1rc9Y0Km/2TnPK8qZYcUBm1o8Nm0DmWaa7C
         r3x5JGvAUR3Tm/BinaUrHcbM9tPCSnTvLeR8vqF8m30gD2UQjsoCrR7vKfhEfBBi1TQS
         4usukfuhvQ8oQUKA5MNI5o54Xa2XK4jHgIYqydtySzJxkMioM4LmNmWQQk9JTGUala+F
         GwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751272264; x=1751877064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l8JjQ+1mhu7w6AzCypUJiqd/c0GGf08rutzFlOhZeNc=;
        b=ISg7xdaWlfFa1dM87Y0CQ+OKny0+s20MsbKx8e2eGZSJaqCmBL/z2OzD4GZW7xg8R0
         fXG7YrZu+GNfN8vaQADO0YyodcBq2WWAsPZdiajNe77HI6Aopray/Ek8ZBTWkUTUjtCN
         FYH1Z3JB5wMCnzZmic5LUjJgST4SOxoj09JbhudLekKiMzvuduDKzLpHSXWm3Ou8e5Ak
         GEGhzWHGZ50Phj28k3iltiuWL4WetjkMmpKYFLYvoMdK1CNRGOPjsyoYhEIjuSI3GwrP
         Ao2kd8ufthCSieKpl5/+n+S8pz9InIOvvMyX1gJjVW9QIJER5e02HRmplblHMKJG7ds6
         h13w==
X-Forwarded-Encrypted: i=1; AJvYcCW7rjJ1BkU2euRtC+v/f5GVtbyxwcPGUT/eZNTc0hrSE+s+P+ZB9e6OYDI6vVen0Rkq3dsHjk6MaCOWvU0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9jRZlcksROc11bOLI6X44OZ/iG4el7VyXlWOpKRYXzBpALCeI
	LDKgIvV3dPd3GX5BZxZW4LhQzB6CRoO5oKzwpYnnZBEYaTEjb3jVbLRW
X-Gm-Gg: ASbGncvX/UcEGMsb5fVKPzjR3GlpwW6ctmqq3Ywdi6qISzdFlqjuySdUKztkshavNAb
	H0WWoprrumlJNsaC0HAQRK1Uhny/+5/1yOtsUonPgrLd2FDyxuPkMPXerOlOwHFGjLBAJPSVgYR
	/rl3LOL7qX5W2ylETZFRmhWYvLqDBX/5w3jz7Jv2bqbhpsEEzpvr7hgiNfX218gGP0gRSen431o
	9bDnQljdetLF6GKdzPBANRDu/CZhMgNPSfwxHxUKkP6Rbs/3+iz8fFpnQixFAu+6YKG+0Z+rBn1
	Yt1MCdKgNhKU8OB3Ct5Hmla3mTIccVrHpInJ5GoSiCG9xMkCNl3NYLCqLY0MjfCbR6PoUnXwyBL
	rIec=
X-Google-Smtp-Source: AGHT+IF3kNEHTgHmk6z+DnoXffq1NyoVg6tYWzSNwERgNq0HjPGnqOvaj4L2dW7mN0yNlOJYAJh8wA==
X-Received: by 2002:a17:906:eecb:b0:ad8:93a3:29ba with SMTP id a640c23a62f3a-ae34fd985femr1030293566b.17.1751272263321;
        Mon, 30 Jun 2025 01:31:03 -0700 (PDT)
Received: from localhost.localdomain ([95.90.184.252])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae360e6ce54sm577568766b.37.2025.06.30.01.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 01:31:02 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/3] staging: rtl8723bs: remove unused function parameter
Date: Mon, 30 Jun 2025 10:30:47 +0200
Message-ID: <20250630083049.103734-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250630083049.103734-1-straube.linux@gmail.com>
References: <20250630083049.103734-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The parameter 'band' of rtw_ieee80211_channel_to_frequency() in
wifi_regd.c is unused, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/wifi_regd.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/wifi_regd.c b/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
index dbd4bf531339..ac0b58a8b5d3 100644
--- a/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
+++ b/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
@@ -41,7 +41,7 @@ static const struct ieee80211_regdomain rtw_regdom_rd = {
 	}
 };
 
-static int rtw_ieee80211_channel_to_frequency(int chan, int band)
+static int rtw_ieee80211_channel_to_frequency(int chan)
 {
 	/* NL80211_BAND_2GHZ */
 	if (chan == 14)
@@ -82,10 +82,7 @@ static void _rtw_reg_apply_flags(struct wiphy *wiphy)
 	/* channels apply by channel plans. */
 	for (i = 0; i < max_chan_nums; i++) {
 		channel = channel_set[i].ChannelNum;
-		freq =
-		    rtw_ieee80211_channel_to_frequency(channel,
-						       NL80211_BAND_2GHZ);
-
+		freq = rtw_ieee80211_channel_to_frequency(channel);
 		ch = ieee80211_get_channel(wiphy, freq);
 		if (ch) {
 			if (channel_set[i].ScanType == SCAN_PASSIVE)
-- 
2.49.0

