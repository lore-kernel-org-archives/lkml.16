Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA3321324F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836131; cv=none; b=jcH3WDaBwUwvw7IY7VzqId58y/RJ69pKG2AzkqfCoWQua00JhuNXV4iGGSe4DPcomtd/TzI0OONEmYferRBTZGWm1rIenZSW29TPRdW2kfDBU5KuK6sbrHswfICfWvQ61rplPpWs19s7+KDARNSqnglXnC3pEqhz/3sDBXgmPVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836131; c=relaxed/simple;
	bh=isd3pWKNkrhji+qFvUAUdB4tZj2kAOCHkG7qUxql/Qg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P1q6twZ/MFCJibNxRL1ifPwg1UWTnX7l6as3TEtDVyu00U9C3cH+pW1UqJUhBglsItGipVV3wrIFmn3jJbS7I8oa6nWwWLT8kDzN4t4sbHzW/+i10XKvXyF03yD2P6kflOAIzBhCZRm8EtckJYCFx8Wf4niSfPUrIlbNe8zPTkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=cfCtctn+; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="cfCtctn+"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-225477548e1so1229855ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836127; x=1745440927; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IhFC5zP0nN1As31BXZj0zvD7HqsSqRg0k5dUe1wvE0g=;
        b=cfCtctn+E5bb06+nO+NEOvxdXStHVdhEwB36q9RpCOGt4m8/MSeNZGZaQvvA2CQ5Z1
         +ada1yEfTlHlORTmK74DxRdhlI9UEGNmzMSo8FTFK+u7I7l007S/0wjTunaGOCyBI+lm
         FbwfMbCkb7CXs2cV52bHdMhCKZBdaygJ7lrxMnOVKrzlDrf9LdMJviUEaAwQsegb8un2
         BlFKQy01/uq1Vav+GK0JWS8M5fRLIpiZhPUHtisPXFCCiIUe1KbQGTQGfEUU0BjB/0vf
         yaP2ZokRT/byiI9X6Tt9GXGFlQYBXRUzQOaPEBXvyCj2GFZ+p45v3frgb/0tCepz2tp+
         n42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836127; x=1745440927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IhFC5zP0nN1As31BXZj0zvD7HqsSqRg0k5dUe1wvE0g=;
        b=CxzfcDMcijQvOOgDFZAwTZBZzRs0qj1Xabq+4nS7luNablvcuQIMY5V3UgWXjHKXuq
         pJX3FdAtTPWmKVC5nOJD+eHJBVsR8yiXTVEZaygCmnQpL8Ll27E5HlW7vpP2i/WPJoCc
         3Ts8CoY5wAEraryJuYY0eKPO1OTxn3ISbnekXPCreUNsN+39S4q012m7BHoo2V+98SFW
         Orekg4U9CHNVpS14UGzeiBJi1bDGVddka2qYL51LBak10q/pMKdaytn1HpuWpFkIyVaX
         n5axBj2dz0Er1zXnEG23y3Nlb1QvEJ2e9I6RgrF6cJA4YdB0aEQu7i9YXc04rGpeu4VQ
         MbVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqcHFuz4S904k6n1yMSFbs7J39aNoD4e5O+ZtRmBTd2Mu24svLdyWq7QTdV68PPcRDU3Kymha9w+dW+X8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlrbkCPEdKAQ8cKA05LvSfbm82AtvQrEnTf39JwbJpXkUsvvVW
	C0LKRfHse6RuRiDstjl8LvAbELmtE0FLnK7mAqXT82kiT/ojXp5QiqbqrumHJQ==
X-Gm-Gg: ASbGncsDzO3udD4CLg7Fga4Nvpdjro3o8GcWHTDeIpM7uYrusOAUHIHlDkL2Te1K3Fl
	lVSxIxKiXugTf5bPqA5AkiVgGsG9dx2s5pErN0Xzr36W2YsJYNL5BlW4OjEVK0PaEQNdPBlu6sy
	jRS//BssbtdUabgKu2/J69dFCY5HfO0eVV8z8jV9QVDrNhyFwyFFhp11aEsliCebEQfqqav6C3A
	JnWRDfiwDNHsbGM/Uu9hgkmTIRyBt3PaOdr4IxYxt1tzCKYn4WxSOTk26mfOZDeDrQGja/Ve3+n
	MctmMNavtu8Jx2wkYAf7a/AVfdhCSlUu5Ybl0THCvKtdwDIWM0/x56/P1+7UHL6JsgZviNoL/q9
	GxZaVBg==
X-Google-Smtp-Source: AGHT+IGvO1pPtoCMh1G8ZobJNDUhVfmiaAosvQAjes3PNqavxN65KPJVMCnf89ttFZeJegPK78M7Jg==
X-Received: by 2002:a17:902:f68e:b0:223:3b76:4e22 with SMTP id d9443c01a7336-22c358bc257mr41543505ad.6.1744836127500;
        Wed, 16 Apr 2025 13:42:07 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fa5de2sm18854845ad.133.2025.04.16.13.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:42:07 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 00/18] staging: gpib: Removing typedef of gpib_interface_t
Date: Wed, 16 Apr 2025 20:41:46 +0000
Message-ID: <20250416204204.8009-1-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

* Patch 1: "struct gpib_interface"
	Having the word "_struct" in the name of the struct doesn't add any
	information so rename "struct gpib_interface_struct" to
	"struct gpib_interface".

* Patch 2 - Patch 17: Replacing gpib_interface_t with "struct gpib_interface"

* Patch 18: Removing typedef for gpib_interface_t.

Michael Rubin (18):
  staging: gpib: struct typing for gpib_interface
  staging: gpib: agilent_82350b: gpib_interface
  staging: gpib: agilent_82357a: gpib_interface
  staging: gpib: cb7210: struct gpib_interface
  staging: gpib: cec: struct gpib_interface
  staging: gpib: common: struct gpib_interface
  staging: gpib: fluke: struct gpib_interface
  staging: gpib: fmh: struct gpib_interface
  staging: gpib: gpio: struct gpib_interface
  staging: gpib: hp_82335: struct gpib_interface
  staging: gpib: hp2341: struct gpib_interface
  staging: gpib: gpibP: struct gpib_interface
  staging: gpib: ines: struct gpib_interface
  staging: gpib: lpvo_usb: struct gpib_interface
  staging: gpib: ni_usb: struct gpib_interface
  staging: gpib: pc2: struct gpib_interface
  staging: gpib: tnt4882: struct gpib_interface
  staging: gpib: Removing typedef gpib_interface_t

 .../gpib/agilent_82350b/agilent_82350b.c      |  4 ++--
 .../gpib/agilent_82357a/agilent_82357a.c      |  2 +-
 drivers/staging/gpib/cb7210/cb7210.c          | 18 +++++++-------
 drivers/staging/gpib/cec/cec_gpib.c           |  2 +-
 drivers/staging/gpib/common/gpib_os.c         |  4 ++--
 drivers/staging/gpib/eastwood/fluke_gpib.c    |  6 ++---
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c      |  8 +++----
 drivers/staging/gpib/gpio/gpib_bitbang.c      |  2 +-
 drivers/staging/gpib/hp_82335/hp82335.c       |  2 +-
 drivers/staging/gpib/hp_82341/hp_82341.c      |  4 ++--
 drivers/staging/gpib/include/gpibP.h          |  6 ++---
 drivers/staging/gpib/include/gpib_types.h     |  9 ++++---
 drivers/staging/gpib/ines/ines_gpib.c         | 14 +++++------
 .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        |  2 +-
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c     |  2 +-
 drivers/staging/gpib/pc2/pc2_gpib.c           |  8 +++----
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c   | 24 +++++++++----------
 17 files changed, 58 insertions(+), 59 deletions(-)

-- 
2.43.0

