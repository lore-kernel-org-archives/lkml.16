Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69ED028151F
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 16:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746547670; cv=none; b=rfY7JDBl4rNv41Ze1c/0ub1r5TcLaOMIGjZILiTOC0uF5Z/uzpCceDqGCQcpXsPENp4UjpsenGD6CJi0LlMwjJmlu0lbZBQgSQO0PInCtZCB8qV3DfgL7pFxetfpGVOJQZn6LF/7aZ/mTd97Cb1WtoH82NZEh3D2tsbZAXUGdkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746547670; c=relaxed/simple;
	bh=++NsuOXbU6JeviK3tv6NwHftyt8vtfJpHdMnWN6PK7Y=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CNWPrYPaTW72zHCREd8i2F4l1MZ+hLcE7ctMRO4acDKYfYEubXx59T+Ev3SuKwvfbwv5ai9dUxn6y1VMEiSm57pWlL7/XvsWaKYgWXFvNvcUbvgbf0i10UUMsp9UtUym3pO0vJABmeefn7F1pBPWnMIloQ/lApZtq/FNeL8niss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eaXoFeQ8; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eaXoFeQ8"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-549963b5551so6590789e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 09:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746547666; x=1747152466; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ccI0ZbkTSL3PDCgLFexvjp+ZpLltoeC/qewLDe6KXW0=;
        b=eaXoFeQ8z6suuP5VUhs/4Po4rCOxc1XvtgQ8ibtUTjeALJKmKWnAy0jdnwnP5XqeJN
         A0kyMrhbcRWnZX2sngrWljJVn7AKozkjMuX7np6PudI3wgRZlV+nSJskTrB8eb3e3X2f
         U1/ielMlfaZ0gYL+oTVoBrSCsSSWThLuHMJ+sjUzjtnmRRYVrXhV2zN2m0qIg+pIZBmD
         IzXtdYJwXPFOW+3gobmXvIWvpPeEXBEq/pIIud0X354QX4AMsDWZ3cHqCJpp18rCexAV
         hyq/zU13AK016ILzI2sbyjmYrDhoaIz5KvBtmyKjcSaOWAHSEhZWvsPtmj69lhT/+y3C
         RkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746547666; x=1747152466;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ccI0ZbkTSL3PDCgLFexvjp+ZpLltoeC/qewLDe6KXW0=;
        b=bPfCbNMa5ZT7KeIW1FYpqDHm77ktdXghLNoKj9ro0TGe4ULRVQy/pQplPsZIybX1u6
         C2gl6zn1y5g8eEv39wLQRpU0dP5tbg238J/SB8fjrkLbDxQf1zfAP1qgCHvP2evkIn1d
         dW/04Qt65gAqRDGQmVWroFok6XwePVDXMVgAdqTL4gQ6cR7ujrUzvywY+ICo0U5f4FKu
         0jQdU7SC5Y4pgRR1qRyIvLUycPWO2Dcyef+dngXJXVOZbWUwdJxbXrRW2h07TTLE2WPc
         R87NXT32fGlYN5iW+IMXwWTy+Fe1tlMWftKjS2aYYVOoZnf2lNRvtQuZuA0VUJeWld9Y
         wNgA==
X-Forwarded-Encrypted: i=1; AJvYcCXsi8BeJNTymdanxBTU6LMEetS4qD+m1TC6EXnFhTL0a85bqLFwCTqUzIDAcpIORVt9CD5bVGJEXaa1iCU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrvQYICVcXeHER4xQR+1djzN1FbvM+e2RxhX8ofndIVNnbHt2p
	EqakTNquhWxQhUbVs04N+mMuGRm57XOaDxKPmAj477A4Y7FaIiTOUzbgUypu
X-Gm-Gg: ASbGncvzHpszwhVYFaICT8CCmeQ085UHFdnnBF7tHUuhRCFCiRFLQS5ZJHYHZHWK74N
	3BTaFOyL431wetwHJz26vMbEEBOS0p+ZXV+/nGU6X3JeQLzQXJwlDi5tzseQ2HhdfH6KbGWEZA8
	+HpJr0uD+8sHn0XQZ+sJ3tOpZ+uNVWQHF7Al2E9MxiQdWF2ci9m7ZiiQNfpCE3A+02xn9rhZ4VE
	asQCFFkRncFKusJ3qN/2kX9Bpv6tDapD0kfKdS3e1DKHfjtNUsSGj/PUqUEhTdzLX+I9jDzBYtP
	YSziRL8ujTJIAyde1uNW/L+SYh+Edo8K1GMcYGvrv+BrjUsCQBhca8oYJWk5PNDVe6q8I3m6TFu
	RBDMCquzwYWPebOcRZD2kBbd2HUMs50Ytq9KW/Ex4x30Wdruo
X-Google-Smtp-Source: AGHT+IHGohD1hBOjHdmCzYeE7aRhFMYrXNXwF4mFguSFUvoNb6azHquBd9hXCHFv+Y8bWZpgamhwWw==
X-Received: by 2002:ac2:4ed8:0:b0:54d:68bd:2846 with SMTP id 2adb3069b0e04-54fb92a3b98mr23872e87.29.1746547666066;
        Tue, 06 May 2025 09:07:46 -0700 (PDT)
Received: from Lappari.v6.elisa-laajakaista.fi (nzckegd23h6nrc6dqb9-1.v6.elisa-laajakaista.fi. [2001:99a:20b9:a000:465f:16d7:e89b:ac75])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54faf6c84e1sm968609e87.146.2025.05.06.09.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 09:07:45 -0700 (PDT)
Date: Tue, 6 May 2025 19:07:44 +0300
From: Heikki Huttu <heissendo88@gmail.com>
To: abbotti@mev.co.uk, hsweeten@visionengravers.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] comedi: drivers: adl_pci9118.c: Edit file so that
 checkpatch.pl has 0 typo errors
Message-ID: <aBoz0MJWkKk7zSZg@Lappari.v6.elisa-laajakaista.fi>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix errors produced by checkpath.pl about typos.

Signed-off-by: Heikki Huttu <heissendo88@gmail.com>
---

V2: Removed all modifications done to parenthesis. Edit Patch name and
only typo fixes remain.

 drivers/comedi/drivers/adl_pci9118.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/comedi/drivers/adl_pci9118.c b/drivers/comedi/drivers/adl_pci9118.c
index a76e2666d583..67c663892e48 100644
--- a/drivers/comedi/drivers/adl_pci9118.c
+++ b/drivers/comedi/drivers/adl_pci9118.c
@@ -32,7 +32,7 @@
  * ranges).
  *
  * There are some hardware limitations:
- * a) You cann't use mixture of unipolar/bipoar ranges or differencial/single
+ * a) You can't use mixture of unipolar/bipolar ranges or differential/single
  *  ended inputs.
  * b) DMA transfers must have the length aligned to two samples (32 bit),
  *  so there is some problems if cmd->chanlist_len is odd. This driver tries
@@ -227,7 +227,7 @@ struct pci9118_private {
 	struct pci9118_dmabuf dmabuf[2];
 	int softsshdelay;		/*
 					 * >0 use software S&H,
-					 * numer is requested delay in ns
+					 * number is requested delay in ns
 					 */
 	unsigned char softsshsample;	/*
 					 * polarity of S&H signal
-- 
2.47.2

