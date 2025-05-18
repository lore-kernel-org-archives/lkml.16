Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F222C9A;
	Sun, 18 May 2025 10:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747565471; cv=none; b=DSlSvyscd/DGbtpa9rzP5fTL6jzatfcxkgdjr9ZlgbkSDlXOT6gtiAd9ZlzTpnsYuzApdA5dWySzKTxvkovkTbDRZpokQwNMlalJFWZk/2aXCvksKWfemZiccqNW/OhvRIO24dgl8X+Y05FmMpX07TyIODDqhlWSYKGu7j3ZgOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747565471; c=relaxed/simple;
	bh=RT2iQ5brdMeC84IB6KveIUJpZkTRlSqN7u5CsAjxDm8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=h3jaz9LRyECpsOfUn+z+Iw4VYKtqdgdPvs6oMVMXDMKfcu0B9LCJ4Q7M8PqkEB7AsBjlKC7R0Ffkt4A969mcMV6J1WOerFJpsxKr48IytUCG1vQsyepKPIg8Gsq1TCE2sxkc9dYB8hZUGoF1KbPydOyUW1H8A25D8szvRPHSyr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMcWwvin; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMcWwvin"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22fcf9cf3c2so29264755ad.0;
        Sun, 18 May 2025 03:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747565469; x=1748170269; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XKMc+c0+FW2CLyEi2+IaRcJT9E5ZB/68CPDxgtfVfbI=;
        b=aMcWwvinM3YgsdySHWDDpexX7pOgC+N37Gj9NWatgTlyiy8xefQljnlgVyQa23GVl+
         uZOyDsJ6BfKcdSzHm01ZP0ZWWjuhJ1i2lXuuQwPO6invNr1CsfnSrlW+zfcNhtuMbtir
         i1/meLHmkIJ6RjavL/4pVkxyRfhdPAtdioGBDyVHHthpGv6PT6qMtMlvCjQI3Jdqvfjv
         rzw4JSZ+BMGGZbfos4r9Y8VE3Ej+/UJLWvrlgp3KM3fpzhMWdHQyYIw6J8r4s7Dj2DRp
         i+DOK+FEAwizpa8CZuttxgKeOtuM3gGZ5gJqzOQ4K8Q1VYyGiSqU+tiulc2U2qSNknxB
         25+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747565469; x=1748170269;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XKMc+c0+FW2CLyEi2+IaRcJT9E5ZB/68CPDxgtfVfbI=;
        b=dzkTQgNWDEGbcuXY13tuJTHHPevLLSgeR2oJmXihNNojX2UBxu9I5+2ZWzihA8p8Jz
         wDTZ0sWycjEUcn7sm0a6qedykutFH/lXVIFdgSZOPa+6P1J6u9IaKXRIx20yKJfgGqe4
         GAWLwCI6nXqg0K9hIXWoP+f2Ryis+BqGVtOFci0RnjMxyxmSXolBLmT/b8GFUH6Cj0wr
         pSYOg6HE9B5oMxCTGYIERRKX5lX2bDJPlRgVlmyo6yFv8pZf1eoSmHQVqwS8bbaA75yG
         zucff41Z3rDsBYAzIlgjdMCACpenlgAMGCYvkSjg5e4eI5S8dxQI4BjyubcFEf3c2YcI
         KpAg==
X-Forwarded-Encrypted: i=1; AJvYcCU+xzvXoYB4Um0wHpPpazlkw7l19ZogRhSgmf+7eK2abS1BOJPT93CGyBa+jNZyojXs8x4mxN8fDvp6YiQ=@vger.kernel.org, AJvYcCWsewaplGP2Cxz8V69R+X+61OJ6LS+ICHjgAJCnITk4A3ToJnOMt5ko65M0M+seaXyPWY4pIZZL2liFdcY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz69t82L8SLOIUbrf6nY8oOMCFUNVSEbjWXb5n7ymYzwDU3KrZD
	gwZ7HmzzFI+1DvCDTtTCSIx5575ZPyeeYaRr3flQm0pQ5s1BxZLtQ+GxriSRUg==
X-Gm-Gg: ASbGncvqWJ5AURXRGeJVl+JyqtyTpJD6LmE2I0iq4PenueBdMMjG3NQ8jFW9qMvQZxY
	cdsWOZUPFQXzTuLRmxBNXfuRpQ7eY4chUM/7zKB2OfVhhs9/rZ1O7P3njyTofcq4tjo8SJFUsoY
	QkxIYfXwXf3J8qq/Mw/Fimgm3aowFdSpDCcYsnf5/DfBXuWKus1y0DPzhuLky0EFk/LAEA1c8fC
	/A2bIueB7DXcNFBE3sv7/+SO3e/rq4fF6dagyOwTsDFPptTPj3T7K1TB96/M7qtk8pTxAfTcIZ2
	JYdWaM+QsNBqXSvUBJ9+CUeso0x1jSBUvxV/fA+njJpEXc8VhHU9UHhE3QQ4eYqdgT7gUK1/J6B
	ijR7M/SOEhfAehg+vWW1OMm2qOGh2Za9M3Xbm0L9SOS6Tqg==
X-Google-Smtp-Source: AGHT+IEUkg1TUzp2BVrV+b8/Z3XW0MO1HoRrw61SVBQahL7dOmOnaaKx5W1Z6wx8ILbhquAihcK2AQ==
X-Received: by 2002:a17:903:1ace:b0:225:ac99:ae0f with SMTP id d9443c01a7336-231d438b657mr131062835ad.1.1747565468838;
        Sun, 18 May 2025 03:51:08 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4edd259sm41956115ad.256.2025.05.18.03.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 03:51:08 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH 0/9] ASoC: apple: mca: support simultaneous I2S capture on
 the frontend
Date: Sun, 18 May 2025 20:50:45 +1000
Message-Id: <20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIW7KWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDU0Nz3dzkRN20zIrUYl0zMzMDSxMgmZZooARUX1CUCpYAKo+Ora0FALd
 eCHtbAAAA
X-Change-ID: 20250517-mca-fixes-666094666fa0
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1591;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=RT2iQ5brdMeC84IB6KveIUJpZkTRlSqN7u5CsAjxDm8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBmau6ezv/ts+iQwxk93erbzrFdd627P/1xwbY9t2p/5c
 1bwtm/P7ihlYRDjYpAVU2TZ0CTkMduI7Wa/SOVemDmsTCBDGLg4BWAitwIZ/vBwnDXpruRrPFR+
 2uzGAvvJFS/PKi6ImFO8IvnT+erXSRGMDCdsNPbujVYPTJw96+NCQeZDdo2rq4ulbZbeY3ndd7P
 SiQUA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Hi all,

This series introduces a number of changes to the ASoC driver
for the Apple MCA peripheral to enable support for bidirectional
I2S. This is achieved by allowing frontends to act as clock consumers
and logically ORing data input lines when multiple backends are linked
to a frontend.

This allows the Texas Instruments speaker amps used on Apple Silicon Macs
(Apple-specific revisions of TAS2764 and TAS2770) to send their IVSENSE
data back to the SoC. Since these amps do not have any sort of integrated
speaker protection logic, we must use the IVSENSE data and the Thiele/Small
Parameters of the attached speaker(s) to implement our own in software.

---
Hector Martin (3):
      ASoC: apple: mca: Move clock shutdown to backend shutdown
      ASoC: apple: mca: Do not mark clocks in use for non-providers
      ASoC: apple: mca: Add delay after configuring clock

James Calligeros (1):
      ASoC: apple: mca: use readx_poll_timeout to check for cluster reset

Martin Povišer (5):
      ASoC: apple: mca: Constrain channels according to TDM mask
      ASoC: apple: mca: Separate data & clock port setup
      ASoC: apple: mca: Factor out mca_be_get_fe
      ASoC: apple: mca: Support FEs being clock consumers
      ASoC: apple: mca: Support capture on multiples BEs

 sound/soc/apple/mca.c | 336 +++++++++++++++++--------
 1 file changed, 234 insertions(+), 102 deletions(-)
---
base-commit: 7163ff8cf6a2ee6b6861f0c521885e83a97145f9
change-id: 20250517-mca-fixes-666094666fa0

Best regards,
-- 
James Calligeros <jcalligeros99@gmail.com>

