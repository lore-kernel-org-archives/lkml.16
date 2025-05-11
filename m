Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BD73A1B6
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 09:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746956586; cv=none; b=HUA03GLXocUvPvGVhGu58SyJtdNhhD/GB4Inr3Tac2Aw9ZFFfDvbHh2hDEDkRKTr4D+Us02xRMN599yVXpr46onpBEZieCaKVT8ctRerrN8s/ezcBB+Y82UaOVB+Xnh1QJopX0efCV9tbaiqH4iIzpLmhOrB8JMaS09L4vavhqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746956586; c=relaxed/simple;
	bh=SnC89AHyslSef6V2aYLkekOdGeOj9PF1IUYLzzXqRiM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=WbmkFwiZ5rYrC5fFoucB5kb2jWuRyHtVq8wx/DIrXtCvk8vVlTVCLraSQDjfBNENpIYQQCbaczPopYp6pW3SG4Cvp/9sW581w37BInfSW4+GizPQI/zcgvQOMH1X8HHodlIb4sapYvBJMYU9oVBGQ5SvYPnkA/hA4FTBSMCZDQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i0CuGun+; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i0CuGun+"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so3506836b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 02:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746956583; x=1747561383; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SnC89AHyslSef6V2aYLkekOdGeOj9PF1IUYLzzXqRiM=;
        b=i0CuGun+j1CGmSILNJkS3g7KztD2ERvhpANUsW7e2c1Xin0g2KGxDA2OScJvlrLQ4u
         66OHbi7wS9YI+qulH4c0xGHPvNLzqEuuipPSNw+Ho18y0fdc41Rj2AdT7Eo7F2so8IIH
         dK+C7g9dByqJ+aaykuty/eOqQe/Xg83dVAhpRFQyHlZ5vsbayYj7rJCIibyS+Cm5ck4u
         gbcQjpMuygL5l6lOgByRYPoRUu5DMsopdhf+GLuilZVIVVlWBFynyGvE6a6BOxGZlj6U
         U3/UdxyDRSGWudySCbdmWkg/uO8Lqooo/zlhXL0XbXCZe+GfZbfxh5MRtsdzsyOe4yMG
         KPMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746956583; x=1747561383;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SnC89AHyslSef6V2aYLkekOdGeOj9PF1IUYLzzXqRiM=;
        b=wvZRYnXyBqsehYR0gakymIZG7SMdrorPnLXgmXA493HgOvKN6CU+VXMbjllTs3wjnX
         kOIgZF/mae85wM9FaQMOsevtLHpJevECxLlzTir08pZPA1D7kOao+cDw5NbAOVLMVlC5
         NLyuAnJ3rBlhXCV1RZEVtfRS3AHr4bjRg/2g/xZqiOgR9WCVFnFjxeD03FaD/2jLjqR1
         c4V8fCAjsLpaj7mEh0t2ZhjYHhMHuQTav/Jxe6/sWW8KNBEVgXj5wxgyF/Mo2DKbjeOu
         mUbihkPaInesI418GvzLnzhCHLdc7m1MKbnAszaooro83f7+jAlIROAFGegs+7O22JYV
         aRdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUv4F2AvMdS5qa8cEJ88kf9Yf6LHeo6X4PKT3JqLIHxp8QcrFyLC3egbHGCEZk/dLCNaIfVP1Da8bkc50E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5rvhA9uR76VGP0TKevDzuVuasXQa6pCmu6sxJ5jt7k3juOWdo
	f65AyzNI6epeLHFeZcaYSqQIfWHWN29YwF/q62CNNK4BF3b6Go7KapywxM198I02t9f0r9bH1t3
	AruADJvoYV+ju02jw3yyYnFumouQ=
X-Gm-Gg: ASbGncvaojxw6Ec0wJabdP8p+ZCAeNgjIXqUBvi/FRjF68tyUjZiePoCnHGuGHbM00Z
	Nr41DACWtMwswGnLxYh08eaZXsrPr1Wc0z8ZFyGlFd6orLH1DEfrdgEdlpxHndT3PYSK4ndxKir
	NWk0O7+wjeIAPck8EL3Xxf2JIGbfuHyKSLU0De9K9Wco+SLrILQRWxFLuvqqucWv5SXE0=
X-Google-Smtp-Source: AGHT+IH/mJ0x32ZlNKoI2eDR9O84MqogT0fzcKY9eBjFtKcEWG4I2sMg71tE4UvVNHYrlB5MENrq/i8SwY18K6OTj4U=
X-Received: by 2002:a05:6a21:3510:b0:1f5:7cb4:b713 with SMTP id
 adf61e73a8af0-215abb3a301mr14054823637.19.1746956583393; Sun, 11 May 2025
 02:43:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Date: Sun, 11 May 2025 11:42:27 +0200
X-Gm-Features: AX0GCFuZrFjEp_RkcV0WctIvu4X1yuw5s5lS-0WHsmvO4h373KZg12qijyqjgv4
Message-ID: <CAKR-sGezB_SEb7UfPV6o6T2yibkAzNSqK9Hry1kNM46BMsH2_g@mail.gmail.com>
Subject: mtd: rawnand: brcmnand: exec_op patch broke < v5.0 controllers
To: dregan@broadcom.com, Miquel Raynal <miquel.raynal@bootlin.com>, 
	bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, 
	MTD Maling List <linux-mtd@lists.infradead.org>, Florian Fainelli <f.fainelli@gmail.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	joel.peshkin@broadcom.com, Brian Norris <computersforpeace@gmail.com>, 
	dan.beygelman@broadcom.com, William Zhang <william.zhang@broadcom.com>, 
	frieder.schrempf@kontron.de, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vignesh R <vigneshr@ti.com>, 
	Richard Weinberger <richard@nod.at>, bbrezillon@kernel.org, Kamal Dasu <kdasu.kdev@gmail.com>, 
	liao jaime <jaimeliao.tw@gmail.com>, kilobyte@angband.pl, 
	Jonas Gorski <jonas.gorski@gmail.com>, dgcbueu <dgcbueu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

I've just realized that your exec_op implementation patch broke
support of v2.1, v2.2 and v4.0 controllers.
https://github.com/torvalds/linux/commit/3c8260ce76634291aed877032a41e37388=
4d69e4
https://patchwork.ozlabs.org/project/linux-mtd/patch/20231125012438.15191-4=
-dregan@broadcom.com/
I know it's an old patch from 6.8 but I just discovered this while
trying to add 6.12 support for bmips on OpenWrt (from 6.6):
https://github.com/openwrt/openwrt/pull/18746

The issue is that low level ops always return 0 on v4.0 controllers
and v2.1/v2.2 controllers don't even have the low level registers
defined:
https://github.com/torvalds/linux/blob/3ce9925823c7d6bb0e6eb951bf2db0e9e182=
582d/drivers/mtd/nand/raw/brcmnand/brcmnand.c#L357
https://github.com/torvalds/linux/blob/3ce9925823c7d6bb0e6eb951bf2db0e9e182=
582d/drivers/mtd/nand/raw/brcmnand/brcmnand.c#L371

I guess that restoring the legacy functions isn't going to happen, but
is it possible to restore < v5.0 compatibility on the new exec_op
implementation?

Best regards,
=C3=81lvaro.
