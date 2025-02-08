Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4F91E515;
	Sat,  8 Feb 2025 05:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738991814; cv=none; b=tQDd9rFNxCQmR1v6ym/2LMY+vh92HKj4zcuPndXlNHFGR8c6Aky1wQG3ANlDgPphxR0N+IsoFER1sU8TTy+CrdXiOtF1MVq9tIJecs9ywWEvfI3iYNKgLSUYUNP9XbTrUqC/2TTLpwLSoh2PEZvZ05i+Flx2r2sJl7cBGrkqvFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738991814; c=relaxed/simple;
	bh=Wh95MniglZrxJYV1WBtECKZ07EvFPp3vsPwJ2IF32No=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EyoCzTSPJVg7VqO3EvJp2GA/RIIcfp8QlJ71YnuewVAP3i577gCRn39iRobUI7dnNZzDyZrKNijAvhEZMuk9bDwPqUm6jbUYyjOMTVaPyJHAAvuTL2S+XYA2Qpu2PQoxUbKLGybplOqpNoeVZdmGXi+W9LTkmgZdJdhhfbrGWCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H3ewHPgc; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H3ewHPgc"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e5b22d35268so2563330276.3;
        Fri, 07 Feb 2025 21:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738991812; x=1739596612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Br0fmd3voz2egE/wkBW55eYvDvDY6vZCi/PhKJu8ARo=;
        b=H3ewHPgcYVHFNOQiyZu6r0Vf7wYZn7k8d1oQgfBQHoBDwseoXtyeM2CKRwPQlucc/y
         aZvV9g5lrLeZOG8F2qSOXtjbnJM+TbuKsY03NQszfcw8PP1hZ59dhSewfbxPzfFJiCWd
         AcobIYXF8j0CZY1V4FJtsBRJqwS9SwLExK9B05i4aEw99Q/bBO6kAsWc4VjuZ6rMYVJm
         AUwLkawhm5zuOJn00EHssHjXBBNpI3/hrddy70uUb8JAUGhTpJyrqMaETJP0JeeGfiQd
         mnHrkKqjaI6gG8iyjzs6BdMPDSCe0lTmvyaZFDIAyvbnIY/u3E7qc4SvvuQvFWE48/UY
         eZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738991812; x=1739596612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Br0fmd3voz2egE/wkBW55eYvDvDY6vZCi/PhKJu8ARo=;
        b=Kkl+qb1OMIV+6iHxuvJBCxuQt11D/GN/4+V1x1ASuBFFiUKViWehiGYSFL2UqEPfUm
         E0CXdAbMJQxVkj+xTc+fScNMs8JCMWzODZAP1tiOY0hmF22EzFhd9IQT3m5COhYmjoTK
         EPXpvLPFF8JFs6xE8obU8UT4AWuMwBgF69iT+yyPMx0PG0RonNRimFw7yTgM5PcVE9lR
         IYUsl4YWt68/Jwirx2N3VazLrcbbSWN+HLKP9afQl5T0VSTw7+IOHnBJyNw0LC6J14Tp
         y9wT4QhJr6zug/ul7qKbT+Fs6pmd0Fikgcf5UZXSWlRw9Bw2CMj0J7YfXz6MsRGYdHG8
         tGtQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7FxBMPcgtKjmncqvFIT3fNPP0z1AFsZq+8UW6oOXNbxx7qda5KCbVXZY30mvnA/pCjhoHZ+Uu2Wh3Ep8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFtzDb2pTGBddwFLbNOthff6oi7oDIh58+OR3GHmR/mzQXqZcZ
	Vl4MYSSfaRdWS4WgddLhAS0XmnVd+j2xHAZODhXsXrgusa00gf9A
X-Gm-Gg: ASbGncua4j3sEjuWC/2kdHaRF8DbzEaKZ1DpMbz2H9bJqb8UIQpnGasgd4zH5ZfpDDs
	20qHP3pBlPsNH18hUOzwGM+P4l5vp6xUa/ntJOfng4djGcGBAUZFBCVRuGdwA4RIk1ciN5/NBzZ
	M2BhTiYJtFNJVBtQ+7KyQISZnnBt05IfKZ+Tv89mnwy/9Chf+3/xIroq4PdT3O9TbjNr1k7Mxeo
	QlWHtYHaO4Q41hHeIb1mSZEYv1QMv286XZN9A//qwQT12300KEflKeoekRKkhyh4fEHFuituWoS
	c0aFvNqcCp1Ov4qavPVrgVQ=
X-Google-Smtp-Source: AGHT+IGX0riAH/3hApp4kFdJC0CnmcgG5Sr9IQVM/ydCvzjfY7h3u4L6L2aSCDPhoFJv0xhXauaPHg==
X-Received: by 2002:a05:6902:168e:b0:e57:3dbc:bbbb with SMTP id 3f1490d57ef6-e5b462b5caemr5549968276.44.1738991811607;
        Fri, 07 Feb 2025 21:16:51 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5b3a1f00e0sm1207670276.2.2025.02.07.21.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 21:16:50 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH 00/10] HWMON support + DebugFS + Improvements
Date: Sat,  8 Feb 2025 00:16:04 -0500
Message-ID: <20250208051614.10644-1-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi, all :)

Seeing that the alienware-wmi rework patchset is almost done I wanted to
get ahead on development and submit these series.

The main highlight is of course HWMON + manual fan control support
(patches 7 and 8) which is highly requested by the few users who
contacted me privately. I took a similar approach to the dell-wmi-ddv
driver (thanks Armin!) and cached sensor readings for better
performance.

As always, your feedback is very appreciated!

Based on pdx86/for-next, depends on [1].

~ Kurt
---
[1] https://lore.kernel.org/platform-driver-x86/20250207154610.13675-1-kuurtb@gmail.com/


Kurt Borja (10):
  platform/x86: alienware-wmi-wmax: Rename thermal related symbols
  platform/x86: alienware-wmi-wmax: Refactor is_awcc_thermal_mode()
  platform/x86: alienware-wmi-wmax: Improve internal AWCC API
  platform/x86: alienware-wmi-wmax: Modify supported_thermal_profiles[]
  platform/x86: alienware-wmi-wmax: Improve platform profile probe
  platform/x86: alienware-wmi-wmax: Add support for the "custom" thermal
    profile
  platform/x86: alienware-wmi-wmax: Add HWMON support
  platform/x86: alienware-wmi-wmax: Add support for manual fan control
  platform/x86: alienware-wmi-wmax: Add a DebugFS interface
  platform/x86: alienware-wmi: Improve and update documentation

 Documentation/wmi/devices/alienware-wmi.rst   | 390 +++------
 drivers/platform/x86/dell/Kconfig             |   1 +
 .../platform/x86/dell/alienware-wmi-wmax.c    | 793 +++++++++++++++---
 3 files changed, 792 insertions(+), 392 deletions(-)


base-commit: e75394bbf4838857f57b6c5d00f1e56c46cd6c11
prerequisite-patch-id: 2e54a1278aabd3810a2e501ab8f001af5f83e45c
prerequisite-patch-id: d9e78e1086bb0fc8df23678f91fcf2e219d73f81
prerequisite-patch-id: db9c0c4b1b0dacf365d9aa4644282e32a3e80634
prerequisite-patch-id: c9cf42516931054b8a292774b9c86416246da36c
prerequisite-patch-id: a047966c43a92c41a01858aed9b74470324f9e4f
prerequisite-patch-id: 32293f8c9ed39c076c30f7bcf9ab8105ff8dd4f4
prerequisite-patch-id: 100391541e9ca8c1a49b1e48a3f99128b0d14b5d
prerequisite-patch-id: e7cffaa05f5212b70520d3d80c23f1804007b349
prerequisite-patch-id: 4f9219d3b1f6281b1815f9ac5e823aa59e85f588
prerequisite-patch-id: c37756f4b1e7f61c0dac0f3cbe68b95838ecce84
prerequisite-patch-id: fdf58a28326cec768d5f45252dd7b1f189532623
prerequisite-patch-id: 0a0fd32bdc83a8676eeda30e25f93c2edd3b6d3c
prerequisite-patch-id: 4c85aa2b99a106907639075a2fc455f312a14b4f
prerequisite-patch-id: bb7c74dd242bf773f06e531090ec63cc17b1ac69
-- 
2.48.1

