Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF08335C7;
	Thu, 26 Jun 2025 01:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750900699; cv=none; b=fw64aV5yFIZCyl+YQELGuEg1vvj2Q2Rv8E1IGSNKaUunEQbtCvVv+Egc7IpfzRYCq14IaJII9h2oymraQDEYOtkd/+EneZEpsZZPJvEStj3vAeo4BDi9QW4JwZC2sEcnrJZpUmGEaZzPLNVFEfApERNly0Op7B6T6pJ5dNUr4lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750900699; c=relaxed/simple;
	bh=txBj50oC3ARrwVlgFC3zuz3alQWcd/MUPASflpIkFCY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RHpGj1yhdig3nGP6gA+TKjeYxnTepfcVhhOZ5nx58lQdwUhXBgWsqpxKYNRe9FTXS3/yoeqBrC+aiyzT8oueZzSiaXUzEOvUOuxisf02ENzNxfUJIZ/LMcT5z6zFdH5324SsR3QeoKiv2fGYzKlnCzpIVIpSolyWq2GYBQesXsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTFvMnn6; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTFvMnn6"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2363616a1a6so4880855ad.3;
        Wed, 25 Jun 2025 18:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750900698; x=1751505498; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BQxmQ3ZNFaMMJU+w7tK5QVT1MOPim9tRaV1Wj7cYjcw=;
        b=JTFvMnn6R3MiPG4WqXAizUkjU6w5PM7n9QyFv1r7I+E8JpTc5uvbXROUDxFCbwAFvg
         +VTZarFnBO9mE7OWcgKUvYWcUibvXfw+IlLabOPVs4KxQ3wBFCg0mgOjUyQ9yrl1FP6x
         ToNgemaPy1GXkjJritatfmWj9J4/pDq8nDadhNRJX1SSPGue7HRON1TZX6akae7Aegqf
         lUJaZCme5hs+SCFveSTztUc9uOeTd8sbX80TBaz6vBvWSG3s4E/BefhHdauvWh/gp5Xb
         3cAzjkgpvTHU204Bhoku4yFzMUMuFKEQbQ63Z3vM6+HnZMMcPoWcHjizoLxa1HLseeH+
         678g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750900698; x=1751505498;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BQxmQ3ZNFaMMJU+w7tK5QVT1MOPim9tRaV1Wj7cYjcw=;
        b=viuvpisvi5XAg4JVkUCpOKcejmVKWgCtHnxK/OIwN+md9F/XiPMCVoDX9dI/PCWXEh
         JiEfQ63JjrX/Om16UGR0ko6BYBRduT4X8NnSocSQJ9431gdkAPH3V0DH8C/gXqFKlVp7
         di+5ecowjud/Ao9cGfETV9MhOa4yE5oleaiCk/aRiJqIq97GP8aAzA7FMjD6cPrHrEin
         v1couRKqfW/4iVbOvX1Y6keM004hxg1rZClTowT3HcS3qb16v1+GpgEkaPoLvpeo7Rx+
         nmT/xiCrGD3/wxDHboH730EfCiBs6ThHAArH5ahQY/y/hbJ2nppyOs9S2HvT2ATrXUba
         50EQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEYCaHUxovW7vPaMVkDlCgsFY67Dsi9AQtyQpfUU0S8pf7NwBeAAod5X22byISYTc5Gg2Cpn1QhFlJvlo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy504lnjw+pfTJMwk4J9GdywxSlWR2tn7ceQvjV4mVY5RB3W8Vc
	YANnX0pTTjYO3PvuBd8B8PXPtSG5FFd3DP0p9/fgqy86sPbQfWXezeih
X-Gm-Gg: ASbGncvqoEvoBN1ft5ohpeTdPvIgGkaPaOdoCphHOoepKMq7lU7C/V3wiLmxnNGK8wz
	nsu+4rotOvkAXlSW3ufzBhIz8kwGRqJnmPwwPY3a2KAhGONma+yN5FQ4qU/VS17OSMf8DzjqOcR
	o6GLGpplBce9p4avfkhnlCfdHwriUQW9wi86d21M+dopkTzrI2enGESzPIILp4xRIRZa3rR5VHd
	rUECcZJUvStIuzxjTRbbruJU0S0CqA8t0hm07rLM5zg2JKOBeBPu4NQjRySKHG86K5nfhZyr1Bo
	xB/g2f0aCROn+EUZPbmA7PMQqrCnCaUp9GV6OQkkM8zD6Rho16K+xAfTsWOc2Q==
X-Google-Smtp-Source: AGHT+IGAvc9GeOOyZ4HqGfagih45BN8YxRtFSW/5A8FhV+TzIq5Nbed3TQmM204w0VYn8CTDvt5PvQ==
X-Received: by 2002:a17:903:3acb:b0:235:e942:cb9e with SMTP id d9443c01a7336-23823f95760mr74499485ad.9.1750900697694;
        Wed, 25 Jun 2025 18:18:17 -0700 (PDT)
Received: from [192.168.1.26] ([181.88.247.122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d871f10fsm142710025ad.233.2025.06.25.18.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 18:18:17 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH 0/3] platform/x86: Fix fiwmare_attributes_class device
 unregistration
Date: Wed, 25 Jun 2025 22:17:34 -0300
Message-Id: <20250625-dest-fix-v1-0-3a0f342312bb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK6fXGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMyNT3ZTU4hLdtMwK3STLlFRTIxNjE4MkIyWg8oKiVKAw2Kjo2NpaANU
 6VbBaAAAA
X-Change-ID: 20250625-dest-fix-b9de524340b2
To: Jorge Lopez <jorge.lopez2@hp.com>, Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 Prasanth Ksr <prasanth.ksr@dell.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Divya Bharathi <divya.bharathi@dell.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dell.Client.Kernel@dell.com, Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=868; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=txBj50oC3ARrwVlgFC3zuz3alQWcd/MUPASflpIkFCY=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBkx84/sXnO4sCzBQrE14/3kbbfCFmaoH/r1okSGdeLK3
 Xn2ao+WdJSyMIhxMciKKbK0Jyz69igq763fgdD7MHNYmUCGMHBxCsBEeo8z/JULWnzgFA/r7WUV
 POun8UkbzsnW+1Nq5TzRes9iE7PUwgCG//X//CUeXjv640WP8Yr3k474T+F/Y/pgjuTmtMQaww3
 BjYwA
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Hi all,

Using device_destroy() for unregistering firmware_attributes_class
devices may cause issues if there is more than one device under this
class. See details in the commit message.

This patchset fixes this problem for all users.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
Kurt Borja (3):
      platform/x86: hp-bioscfg: Fix class device unregistration
      platform/x86: think-lmi: Fix class device unregistration
      platform/x86: dell-wmi-sysman: Fix class device unregistration

 drivers/platform/x86/dell/dell-wmi-sysman/sysman.c | 4 ++--
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c       | 4 ++--
 drivers/platform/x86/lenovo/think-lmi.c            | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)
---
base-commit: 73f0f2b52c5ea67b3140b23f58d8079d158839c8
change-id: 20250625-dest-fix-b9de524340b2
-- 
 ~ Kurt

