Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1DA24A069
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 20:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746391259; cv=none; b=G2ilgLAsrYXr8gHpJpleal2Fo2z59BKOSwd7VggrNtWHamgi3dm2lYyKeX7fSt+/IRepElkmHko8LLzodo5MHjSb3WJ+3EC3SiwwZeOeh6v14rlfjNP9rhd141mGQmNBzKk7bHTpeLBeEhItEPOIDiqN3i+msGOd9AG5yzA1KW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746391259; c=relaxed/simple;
	bh=smBIuefJusVCZkMarPCw8EeRbjCwtiXNR34TDrzHQvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SblZQdlalnNdJsc7rJI+vveFi2N5KrF9qYNLdZa7yTIUCNgH2H48RpacRztqlSjsMRhACr9rdBIJVAN3gMiDI+9klgz2n1mlY6w2hNvSvc9slIfBA08pEkAsf3d+3MCXuROWKNtQBzUj/uO68bGUlmBf02gF/EodwgqMzv+MEAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DPdrkefw; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DPdrkefw"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6f0c30a1cb6so27560476d6.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 13:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746391256; x=1746996056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXxJtyvGot6HJbUxi0ulWkcHmKm54VWCVqBH5FJjijk=;
        b=DPdrkefwtgO02b5OapgOQLEzizcGbJsx+tOA69Oo8iganDYYRNK0LKwvc56gUfpso1
         +tUUe8GH02bDiH6KO9xwaOJ/dsgdbBI5gdBvdDrcwczJ5mI5xQBvbg/n9nUF6lgOHrlp
         +gR5I6GjEuk1hS88oQml2pRw+4NSm6ijaJo3Wc5A3eUkA7qVClBk8zR6ApiPSYLdf1wh
         WDgvfA7TAJFyl8kNPDuF9fT0/XaauvQzOjDabACVFxVw5GIMOOUkirWO/nY28Hh8yCeq
         g3djeATZQd0anE5PyhYc4Sir9iam/VL5HYyPwRJGfeC4d65UuWnCXB6Z9xjY7s/QMAZv
         IvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746391256; x=1746996056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cXxJtyvGot6HJbUxi0ulWkcHmKm54VWCVqBH5FJjijk=;
        b=b8IDRFGfH+JdW686XTpBDcatocHn7p2Yr6zSENx6zN5NqTBTzVkf46Hw5MtdwWp/MO
         9IHvDwfd7STTnywdOBwZFIl4lJ++9dJlxXB0hJemj1xvx6g2RB0OQqMfvTRhdyU2+KVc
         UNTMX3KMZV222vVFFogE8z1yi+euGpR0Uy17FZWtVczMCxTsSTo3Q+BxDvKMocKjMlVz
         oTy0UbY5lLuppXBem+3fZeVoLE/+oIv+Cb4SLiMCs2KQydivjVfoJf+N7sdTmaZwwiNe
         gxAhF1OHWZBjVBUhb9lwO20uVAYzuMF8f5zr5kLNNl/gkKHyPf7xuXzGGNOdzEBeSqKr
         mrRA==
X-Forwarded-Encrypted: i=1; AJvYcCW8kSBp+oIMb6ATdhKqwz8A6cL466y1MHKJUpo5KwzUgpaMqgIEFrt7HwbFD58TxdFwJUvhJGGPm61UlOw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdI/dkmFzHi4QHBTESHWbkN1OYqOi8hMa54rUnhvjIqdiytQUl
	FpR3Ry3/kC4DEcQ4okC6YUUVgIt+gSMFzHw0BpVVUBuPL9PhVeEx
X-Gm-Gg: ASbGncu0Tk5f+uf/N50xixgnymGDr5xK/gac1rJhEIYxK6f4m62NfEBI1O5/fAwDAe0
	S25z4gvr+zkzp3p9ZiPBU7CcESjsqIHz/ECvTdridwpGzhjUy+QVc9vzOGX4ijmJ8V/jx39mhN+
	DLsFImSZO0KpxaoXEwUdMYGGrh0m1bOEgp6rXgfdYbuwTf8czc5X2iAIj8jJ0xXrlF6A3Yf8CEY
	a7i2PL3TiQHK69rK/j24QQJbk8v2ttp/6iCfQWOLugm5L3XTGfDaOhJgf+Lp4g0JwnTULLnaF+D
	TzbmXRRfHVZP7T2utcYzkgPih6WyvKjwfsDWzptzRwLegwWYjBnlTAv9u8WzpTuMnGEi6ANwYfX
	wvvMRIeereTwpf1g=
X-Google-Smtp-Source: AGHT+IFX9vMTFxIiEctPJs7CoAN51UPQJJgA2OWsY5C5sbMOHT2NenXH8JAv6Nc+cQKxpNnAmbibUQ==
X-Received: by 2002:ad4:5c4c:0:b0:6f4:c237:9709 with SMTP id 6a1803df08f44-6f528c9ca62mr102800546d6.25.1746391256486;
        Sun, 04 May 2025 13:40:56 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f3c3892sm46286516d6.34.2025.05.04.13.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 13:40:55 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-phy@lists.infradead.org
Cc: dominique.martinet@atmark-techno.com,
	frieder.schrempf@kontron.de,
	u.kleine-koenig@baylibre.com,
	aford@beaonembedded.com,
	Adam Ford <aford173@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] phy: freescale: fsl-samsung-hdmi: Improve LUT search for best clock
Date: Sun,  4 May 2025 15:40:42 -0500
Message-ID: <20250504204043.418924-3-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250504204043.418924-1-aford173@gmail.com>
References: <20250504204043.418924-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Searching the look-up-table runs so long as the frequency in the
table is at or below the desired rate.  This works well in most
cases, but the next entry in the LUT might be closer to the
nominal value than the lower one.  Add some logic to check
the higer value is any closer to the nominal value and use it.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/drivers/phy/freescale/phy-fsl-samsung-hdmi.c b/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
index a081f07681db..191c282246d9 100644
--- a/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
+++ b/drivers/phy/freescale/phy-fsl-samsung-hdmi.c
@@ -510,7 +510,14 @@ static const struct phy_config *fsl_samsung_hdmi_phy_lookup_rate(unsigned long r
 		if (phy_pll_cfg[i].pixclk <= rate)
 			break;
 
-	return &phy_pll_cfg[i];
+	/* If there is an exact match, or the array has been searched, return the value*/
+	if (phy_pll_cfg[i].pixclk == rate || i + 1 > ARRAY_SIZE(phy_pll_cfg) - 1)
+		return &phy_pll_cfg[i];
+
+	/* See if the next entry is closer to nominal than this one */
+	return (abs((long) rate - (long) phy_pll_cfg[i].pixclk) <
+		abs((long) rate - (long) phy_pll_cfg[i+1].pixclk) ?
+		&phy_pll_cfg[i] : &phy_pll_cfg[i+1]);
 }
 
 static void fsl_samsung_hdmi_calculate_phy(struct phy_config *cal_phy, unsigned long rate,
-- 
2.48.1

