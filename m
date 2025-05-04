Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F019641C7F
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 17:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746380211; cv=none; b=jU2LYfgw9oXjmKa6gYfh7Nw4oaHzhASh6F+BTzacPZq37xhbOkZ8VpdQrxo0oJWdVHTvg13kqrdaCgcitXJaOAoLukxPFfaNOd1ckWQ+nwQhnPtNXJpCtx3NAMIeoiQ6OmzKp7GwamVDX/I0K1cuMaZyHGXfoa71gpK9xF2kuoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746380211; c=relaxed/simple;
	bh=qUJyY+Pm7fBiy5QRkFsCqC2J1jEL+LVs8n7x7xWbk3I=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cuf9BNDR89/hoPNOeMG0nUi2OHhEynUgiYb0WH+PgCXmDswS1BRieeYp9cnCLHSsfXju6aKqHp18GiOtNpvV+7I9b8jyrgVIYE5L6iP01PwCo+S9yhhhCrZJxL23yZTpdWdUfQ3JBHcdzJmYWyV0awEgdtBnxX3AMrlRr02xxVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cggMjF1t; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cggMjF1t"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54b166fa41bso4860854e87.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 10:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746380208; x=1746985008; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i1R1HQ9HyFIN3dBGbHVb38mA80A5GKNDNA54pgzRhZM=;
        b=cggMjF1tZ+WOwtBErGdUfXSQH47q92BWvz1nbiQbCC6i5OvkCKV1q+65P7t3cMB3gH
         M16ARsa6u8Elo/TXi2SclMIPX0K+GU7NIA5i3GmeQ6hzLXHWwEr/ov0qJ/umKNkoituZ
         qFDl1ALNIgMsiuJw/FQbGr9YM/tfj6J9j6FNuECEJ1eHv5b9ITF3ihY6/NrLvz5J+YF/
         z8igpooeV9XwDl+SMXpRDRtyHcnB4s09XL5Y/yRQACdxv3ClbPcnLvWZT/L+Tgwl+w42
         hHkuF7ydPP092343jKgDlnQZI4f3zoXJLqtbYB2gUzJ7h8qIeJAGOKza9Q6JlmokTZ9g
         bDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746380208; x=1746985008;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i1R1HQ9HyFIN3dBGbHVb38mA80A5GKNDNA54pgzRhZM=;
        b=TOBiRxQ3vZEhfBJdUuGZJ2nNldpp0uS1r/O15cqqi9B7OhFsQ8PprmYvXdZH0Jr4PI
         TVgnocHG3aDCXtcUmlPyJcKbxIAZ+gx81PrA1pyMCYvvuLBs9ImhJ2yo/38KlZefstZG
         JDMJJqwKsMXu9+oqNsuT2Me8Yl6PxKe/DMjO+moIgiX4wfIGl8WMuVrPe6hgxlim1CiK
         NPrZ1lwRJIGolZjXhJpmQDaMHVLZmU1Rpgs5QY/4v2Kh4WYkMSjHmCXoDmn0aTw8yoqN
         M3QtemgMktH57rU5wQJ09MH0wLQnyE2NtNH3czltYZyPJCMQxHyh+I+ekH3q0hDsXylX
         la5w==
X-Forwarded-Encrypted: i=1; AJvYcCU43GCHEXrLJBt8z7yiUe/qJkLGt3XekvuBkOpXcmyOEFixqVTwpbeDPKRHt3VJh/iEo794hEzLKyel7/c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4yR6FG7ZbJbppQl5qyr4ps5KUAqEYmvfn0RyCs8BIJX+jwnm7
	YSO4Aa9esVRaXFvHovPwxdDvL4fmx0zlGHpOksPxjxabljxZCRSaY1ch1kO8
X-Gm-Gg: ASbGncveAXsy1AxrCWSOkhUtNcqcjfCTxh3t6E/sLX8Yv3/1sNBWlz+VrNOiEr7RPgp
	yFLNnIpO3J6c2qniXz64KikBuSvLMYqj0iJSqCgvbGm5REZzbbNXZ0vLICLndAbore6ME6bhIGI
	5pqksKoliy1RDh9ddBVz/4DKA8kHU6ebDiJrP5MWSlqfoj4no2VT7bFGMON8mdqNSc6EUaBQBnw
	rliAtgZtueFAw6khgBB3H0mJt3pDUWg5x6ema03Qu7P3pXCvxNUq1IU2LrOuXlsxwUbNA/cWvjV
	cbEm0fnbVuoKyJ46ZKN07ZgbWYnGoLh7AEf5QAcUyytKa6UtjsoKCtoEvBp1FT/PR8lPnmvJOgs
	u5e0K66096InKXM+df7IXkHQoa1P2u4LkYt8il7bvkrauW5PF
X-Google-Smtp-Source: AGHT+IH3noLLLf4F+GoZtIuspmu4BwJrKfT8mbj105wxtpW8D2nTlAaw23TrbFihdIH8g6fRjwO8cg==
X-Received: by 2002:a05:6512:3e16:b0:54e:81c4:5b13 with SMTP id 2adb3069b0e04-54fa4fa59e7mr1084115e87.52.1746380207768;
        Sun, 04 May 2025 10:36:47 -0700 (PDT)
Received: from Lappari.v6.elisa-laajakaista.fi (nzckegfiondeujtqrpj-1.v6.elisa-laajakaista.fi. [2001:99a:20b9:a000:e830:2617:2988:d7c7])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54eac09a963sm1163647e87.24.2025.05.04.10.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 10:36:47 -0700 (PDT)
Date: Sun, 4 May 2025 20:36:46 +0300
From: Heikki Huttu <heissendo88@gmail.com>
To: abbotti@mev.co.uk, hsweeten@visionengravers.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Staging: comedi: drivers: adl_pci9118.c: Edit file so that
 checkpatch.pl has 0 errors
Message-ID: <aBelroMtikijLKuk@Lappari.v6.elisa-laajakaista.fi>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Change lines that checkpatch.pl throws errors about.
Errors were about extra parenthesies and typos.

Signed-off-by: Heikki Huttu <heissendo88@gmail.com>
---
 drivers/comedi/drivers/adl_pci9118.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/comedi/drivers/adl_pci9118.c b/drivers/comedi/drivers/adl_pci9118.c
index a76e2666d583..691c8d6bb767 100644
--- a/drivers/comedi/drivers/adl_pci9118.c
+++ b/drivers/comedi/drivers/adl_pci9118.c
@@ -32,7 +32,7 @@
  * ranges).
  *
  * There are some hardware limitations:
- * a) You cann't use mixture of unipolar/bipoar ranges or differencial/single
+ * a) You can't use mixture of unipolar/bipolar ranges or differencial/single
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
@@ -946,8 +946,8 @@ static int pci9118_ai_cmd(struct comedi_device *dev, struct comedi_subdevice *s)
 	devpriv->ai_add_back = 0;
 	if (devpriv->master) {
 		devpriv->usedma = 1;
-		if ((cmd->flags & CMDF_WAKE_EOS) &&
-		    (cmd->scan_end_arg == 1)) {
+		if (cmd->flags & CMDF_WAKE_EOS &&
+		    cmd->scan_end_arg == 1) {
 			if (cmd->convert_src == TRIG_NOW)
 				devpriv->ai_add_back = 1;
 			if (cmd->convert_src == TRIG_TIMER) {
@@ -958,9 +958,9 @@ static int pci9118_ai_cmd(struct comedi_device *dev, struct comedi_subdevice *s)
 					 */
 			}
 		}
-		if ((cmd->flags & CMDF_WAKE_EOS) &&
-		    (cmd->scan_end_arg & 1) &&
-		    (cmd->scan_end_arg > 1)) {
+		if (cmd->flags & CMDF_WAKE_EOS &&
+		    cmd->scan_end_arg & 1 &&
+		    cmd->scan_end_arg > 1) {
 			if (cmd->scan_begin_src == TRIG_FOLLOW) {
 				devpriv->usedma = 0;
 				/*
@@ -983,7 +983,7 @@ static int pci9118_ai_cmd(struct comedi_device *dev, struct comedi_subdevice *s)
 	 */
 	if (cmd->convert_src == TRIG_NOW && devpriv->softsshdelay) {
 		devpriv->ai_add_front = 2;
-		if ((devpriv->usedma == 1) && (devpriv->ai_add_back == 1)) {
+		if (devpriv->usedma == 1 && devpriv->ai_add_back == 1) {
 							/* move it to front */
 			devpriv->ai_add_front++;
 			devpriv->ai_add_back = 0;
@@ -1185,7 +1185,7 @@ static int pci9118_ai_cmdtest(struct comedi_device *dev,
 	    (!(cmd->convert_src & (TRIG_TIMER | TRIG_NOW))))
 		err |= -EINVAL;
 
-	if ((cmd->scan_begin_src == TRIG_FOLLOW) &&
+	if (cmd->scan_begin_src == TRIG_FOLLOW &&
 	    (!(cmd->convert_src & (TRIG_TIMER | TRIG_EXT))))
 		err |= -EINVAL;
 
@@ -1210,8 +1210,8 @@ static int pci9118_ai_cmdtest(struct comedi_device *dev,
 	if (cmd->scan_begin_src & (TRIG_FOLLOW | TRIG_EXT))
 		err |= comedi_check_trigger_arg_is(&cmd->scan_begin_arg, 0);
 
-	if ((cmd->scan_begin_src == TRIG_TIMER) &&
-	    (cmd->convert_src == TRIG_TIMER) && (cmd->scan_end_arg == 1)) {
+	if (cmd->scan_begin_src == TRIG_TIMER &&
+	    cmd->convert_src == TRIG_TIMER && cmd->scan_end_arg == 1) {
 		cmd->scan_begin_src = TRIG_FOLLOW;
 		cmd->convert_arg = cmd->scan_begin_arg;
 		cmd->scan_begin_arg = 0;
@@ -1279,8 +1279,8 @@ static int pci9118_ai_cmdtest(struct comedi_device *dev,
 			} else {
 				arg = cmd->convert_arg * cmd->chanlist_len;
 			}
-			err |= comedi_check_trigger_arg_min(
-				&cmd->scan_begin_arg, arg);
+			err |= comedi_check_trigger_arg_min
+				(&cmd->scan_begin_arg, arg);
 		}
 	}
 
-- 
2.47.2

