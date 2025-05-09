Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD3127055D;
	Fri,  9 May 2025 07:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746776948; cv=none; b=V0WW+Jv99APdMVBUD9CBkjTAwZs7pdgbkDhmmcrCEAE6uQmKXk1XvhzFN0EZj0yWwS975HgwAtPRy7wwDYU5YutXP4duJv7GzPEgpYry6NYquH8tEESM1p9j8ldIq3ZWVOe1N1bdPU4qZ8c+a65X/sco4b6s21wShEXsyrvuN3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746776948; c=relaxed/simple;
	bh=Qm35ocUja106vQcCzehngsxcScUQ8t8EEoToUMaDeVQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MV8tRJOsPcCjxVPsjgsS1TOtNirvXRl/IkL++OAo7WrHD2jjo6GQRBOqmb1Ryrp2uYWc1UwEy7OtSrJy6JG24lHL1T8vt3E7OPjYfHrxjR5C9/IcK7w7CFps5HJ47bwXcGgo0psAdCiPVhh6d2ZY/sa/uoVrn2aziviYHcnyDyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AJUAJzlT; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AJUAJzlT"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-528ce9730cfso460272e0c.3;
        Fri, 09 May 2025 00:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746776945; x=1747381745; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EYiUl52hL8bnUKtwOCM4fmuwNTc1LYwe3bT+bqnTv8Q=;
        b=AJUAJzlTTLsLxPBIP9plm3v6OZUYfrdo5+v/8ABwiOVfQHnPaOjL1XpfYxjOcrhkB8
         vEPKNVpD4AikRyCAht+5kuKsuDQgNv2CnRe/+Wxznsyz/Ack3ZkqJExDiDKosTfDzsnP
         vgPrO3FfRqp1w2pQaXMKAgOprSMksKklvGzrGO4nO7kly8XMaXDiMnNTCyalDYrGhze2
         dhnWoYbDAN2k6vjxPz75aW6dxmaGjwk7v4rB6+MSYBUNWkZIZ54TqO9nezRVgQbGEd0q
         nRB1dXMM4YALP938vxifcVecUXcaIB+CRzYoW96PTFngfhZvtCn8aRULegCw7fBqwhAj
         Gcwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746776945; x=1747381745;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EYiUl52hL8bnUKtwOCM4fmuwNTc1LYwe3bT+bqnTv8Q=;
        b=ns73yrGS3u3+ACS0SO8Owb9YXM8P/3EvMeThHCWlHjYrlTHIogCKZ+CyTmCL2bdOMl
         7RCMfpYoHyfi0eWVAUw4aVvTeXYdNmeXcBzq+Jla2lWLmUDGF0KYEuqAzZyYb0SLFZuh
         c4EalfJiseynsHqJwdy601eSSqTwmCtRKTTTLwILMPcJqLxBm1Eqw2GfH80pmb5PQzhW
         +YlmqguaXpQJbkVQh61vJsT3JRWtmgTFX0gIF18DTm87GwFednAPKYA5wOtD5lmT4Pga
         y9ovr7HB6Uf/ITZZV5idZ7GzFZReVEyn4wkvQx75/ZtNS2HuEQirRiljvK9x6XdPOn+U
         RjSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqWPZxNuHtBvzQv65uh6U65quca/RMH/0+ENla459lMZqoBvVukUXMIy86EHbdmwQXgunk8USeis79Vgo=@vger.kernel.org, AJvYcCXLbFT1kXsYR6kFXaHY5LD5f76cBFcrLtxL3cIYL32T3LRKEXXIwIq5rVOgkaRKB3088J6z7FJx5VzJmlSz3KaQIoFfHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx28BWz0YTgeq2aRKUq2wxV0yfe1IYn8IdXqADR3/tfK+zVxw83
	PIyLcnOaVZlQapKDwJXHSEgO/lNnFyDpKVeYFnnMFk5R4jogHtpn
X-Gm-Gg: ASbGncuHfFsPyxfvhf1YnTdjO1pg7jlTQlxLCVN5f/Jns4AvAmO0837htR4Y5CbrrDc
	emShVVjsewBuA7jsp6TJZumBBrYq4g6mkBSRXkztOGMzXvsinA17MfaOlV25k8sAewyPJAXCR6Y
	tv1TpdYROMx1jlD8vReHZAwRqRddQ+5v7o4F+YckKOiEuQh4PDNU2TS4zSktyMkWPh63wpduKop
	PqnaoNUYfmKPCJfkobS2x2NtRuptW+j2cwBE90+NJXzUGBWLQQcVajisPGiIITWqjyo6ni/yKnn
	OT4yz8PWRegnJmhglD1bIMQeVoqg+vNC1lVavSov
X-Google-Smtp-Source: AGHT+IEyrJbae1a+03ec+BhX+SpORF51sM+Vf7YAY9S+znTMYLvP1NKaz6h1M1mXknNbXiQ54WN3RA==
X-Received: by 2002:a05:6102:800f:b0:4c4:fdb9:2ea with SMTP id ada2fe7eead31-4deed333f02mr1912141137.7.1746776945311;
        Fri, 09 May 2025 00:49:05 -0700 (PDT)
Received: from [192.168.1.26] ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f62986f3sm678265241.33.2025.05.09.00.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 00:49:04 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH RFC 0/5] platform/x86: firmware_attributes_class: Add a
 high level API
Date: Fri, 09 May 2025 04:48:32 -0300
Message-Id: <20250509-fw-attrs-api-v1-0-258afed65bfa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFCzHWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYyMz3bRy3cSSkqJi3cSCTF2D1NRE82QDIyPTJDMloJaCotS0zAqwcdF
 KQW7OSrG1tQCz4E6iYwAAAA==
X-Change-ID: 20250326-fw-attrs-api-0eea7c0225b6
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Joshua Grisham <josh@joshuagrisham.com>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Antheas Kapenekakis <lkml@antheas.dev>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Prasanth Ksr <prasanth.ksr@dell.com>, Jorge Lopez <jorge.lopez2@hp.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dell.Client.Kernel@dell.com, Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1676; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=Qm35ocUja106vQcCzehngsxcScUQ8t8EEoToUMaDeVQ=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBmym3OOnqjZkhNZInhlW29Ihz+jyqfv86IUZZ5dOLdlq
 WXKxseNHaUsDGJcDLJiiiztCYu+PYrKe+t3IPQ+zBxWJpAhDFycAjCRaCVGhlO8DlMuCcz5/UPt
 yC6xRobVdsHb1RsmvmdV++oRFDzlhTQjw009x1OJAvOUPVLklvlXl3zk094wKdeKYfPWsPmP4pK
 qmAE=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Hi all,

These series adds the _long awaited_ API for the Firmware Attributes
class.

You'll find all the details in the commit messages and kernel-doc.

I think it's easier to understand by example, so I used the
samsung-galaxybook driver for this purpose (last patch). IMO code
readibility, simplicity, maintainability, etc. is greatly improved, but
there is still room for improvement of the API itself. For this reason I
submitted this as an RFC.

As always, your feedback is very appreciated :)

Overview
========

Patch 1-2: New API with docs included.
  Patch 3: New firwmare attributes type
  Patch 4: Misc Maintainers patch
  Patch 5: samsung-galaxybook example

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
Kurt Borja (4):
      platform/x86: firmware_attributes_class: Add a high level API
      platform/x86: firmware_attributes_class: Add a boolean type
      MAINTAINERS: Add FIRMWARE ATTRIBUTES CLASS entry
      platform/x86: samsung-galaxybook: Transition to new firmware_attributes API

Thomas Weißschuh (1):
      platform/x86: firmware_attributes_class: Add device initialization methods

 .../ABI/testing/sysfs-class-firmware-attributes    |   1 +
 MAINTAINERS                                        |   7 +
 drivers/platform/x86/firmware_attributes_class.c   | 424 +++++++++++++++++++++
 drivers/platform/x86/firmware_attributes_class.h   | 283 ++++++++++++++
 drivers/platform/x86/samsung-galaxybook.c          | 299 ++++++---------
 5 files changed, 829 insertions(+), 185 deletions(-)
---
base-commit: 3c415b1df95c06ae4f9bdb166541ab366b862cc2
change-id: 20250326-fw-attrs-api-0eea7c0225b6
-- 
 ~ Kurt

