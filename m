Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0036E28E5E5;
	Fri,  9 May 2025 10:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746787514; cv=none; b=nTxuq/QcdnAwT4TqWd6dWvjqLkumGKYmrN9wSpfsa3wQRZkJKIf7Ye0s1NHqLWwU5npY0GTs4gz/NFQ2hRArBnpXiJ2OnxMrKJ1AEIpt1rBjp+wiWCMCFClufJVDRo116ZuYws2e7A5jdBvT0MRGKf8RF+8nsahObxiSefvduJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746787514; c=relaxed/simple;
	bh=oOlUbRK9DpvwgrkBO+Rn9Cb8aoZaQB0qwhCMzOD/9Vc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LI5WWeI002JsZCuTgK345nlnjsg0KA3emUWyCd80QE5iYsSkIovW0Gnqm/X2iw5mn1Ni2RlVJkJ2Tu5J0dQQZzEJvdhpKgbZiiQhCl2AB8uIZ7qDSvdj8mAHRGxQbHPbzLabqByQ2CmaiLLZUzrRZEiB3hzvHEaoeTVNRQUtRY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jisk4ol7; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jisk4ol7"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5fab81d6677so3698802a12.1;
        Fri, 09 May 2025 03:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746787511; x=1747392311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CxPInF1T9LVjEkvLtOyhGto+ZvX/qrXq2sR90esUvWw=;
        b=jisk4ol78Ms8NreIveiRyl/22p9xGNvby2ENr7pbxtr0UMbx+7dKTnK6s/T2Ff6P+b
         uU2yLrjhL0xtFt1kwdPS97YBIaqqL3P3Vr8oD2QCxI9MbTGvJm0pTzPrn8AuG3e3Ns1E
         46pLfDvO8zqleO51wD4rLw9mvqIhV5xOGwbNzk2dKQWBVRGsp2m8n5k+37Ya8vp34fI5
         eOqQuG5/Bak2+uli9OrOGtcGAwyhMLVkiEK5nPtklzlTEsdTz8fif+QD8owPZqFfG2zn
         u4a3ToprnOVSVgCRFQ8AIey3r2q1c5BmW62E4qDx5ke2KJ2YBDE6Y8S6YI4hYQke4x3B
         Jb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746787511; x=1747392311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CxPInF1T9LVjEkvLtOyhGto+ZvX/qrXq2sR90esUvWw=;
        b=AwLPdXQXOma3jFZ0xRIP8BJCxGkHpYpEVPSY3ixyczvYlqlvU7sQW80ZrP1qyzrZ7s
         a/toR4vZI3LYEh34AvZf4T/LYndb4SFl3YHHGoZ4WWYeXuai+U9i5fGfBJRpR+6jP7ID
         XCVvtaW6qeyjCwrndIYNp+9mZaF1U2ieQekzVIy6kksX2XfuA++jJD2HdSySH3zXofZ0
         uVrzD2MKH8vxsbYB0/d3dv4NTWkTQYNX3NGrg22XH52qdEGu8v5SG+IrM1bYep5vg9rC
         oknXzAytG9JPKf2CGpLd1GkdWu4gG8vBEFB/KOBTDmplXaDqW2vzos7OdrHzHUKq+ALD
         6sMg==
X-Forwarded-Encrypted: i=1; AJvYcCVOfC7G6dNaqhDzTjZDrzAAv670Xxt7O1BBFIuBjSq9r/akTVpvAOmNlJr2eocUSFAvCGvSxV8b9Dxo2sI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2Q+7BeXUblVTOMBRKvRtiBuXi16IAe/nycVl5GgCqkD+Tw6sd
	0lMJfxgaor+PJWYjxC+eRKihZDlGloOCbM86LWSUnaUk9ZeP1V1uathXUgcL98IsdQ==
X-Gm-Gg: ASbGnctzciMdPqvQQyvIMAYNLg90qpM6gj9e49OHo9i3ar0nmYORx9Lw1SrcNpSrkNL
	9BBbAcGHxGKQpAv9iuCd6KaI8F7VfhfXuOGczFCMUSga5GDXMWWwZ9C5o29wRM557l+wv/RZS+2
	cM6Fsk2pM/Qw7vqJfYkJ++9uoUf2gh8VfARn6Y68MfmRNZZVgJrxLjSO8h9/4Q+VLlJ9dMZ3qeS
	1j6VTCJLJcvW75jU53/aCG8vh09mISBYYVbxqDMIKBT2BUAOJLdRjEbWx9xcK4Sb2gJHz6MHaJ5
	r/hGnYauhl+MQkLDuPRcLB3JFQp3m6UuW42lmss=
X-Google-Smtp-Source: AGHT+IGGLGNvENgsehRHPyd78blj4yJFAdejnjHHmOciST0qvwqR/4gxuUrwFEkkZ1cDCGVf1I/sgg==
X-Received: by 2002:a17:906:99c2:b0:acb:34b2:851 with SMTP id a640c23a62f3a-ad219170650mr281983666b.44.1746787510903;
        Fri, 09 May 2025 03:45:10 -0700 (PDT)
Received: from localhost ([87.254.1.131])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad219853421sm129131466b.165.2025.05.09.03.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 03:45:10 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] memory: stm32: Fix spelling mistake "resset" -> "reset"
Date: Fri,  9 May 2025 11:44:58 +0100
Message-ID: <20250509104459.28167-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/memory/stm32_omm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/stm32_omm.c b/drivers/memory/stm32_omm.c
index 166baed0738a..bef7cf4391d6 100644
--- a/drivers/memory/stm32_omm.c
+++ b/drivers/memory/stm32_omm.c
@@ -173,7 +173,7 @@ static int stm32_omm_disable_child(struct device *dev)
 		ret = reset_control_acquire(reset);
 		if (ret) {
 			stm32_omm_toggle_child_clock(dev, false);
-			dev_err(dev, "Can not acquire resset %d\n", ret);
+			dev_err(dev, "Can not acquire reset %d\n", ret);
 			return ret;
 		}
 
-- 
2.49.0

