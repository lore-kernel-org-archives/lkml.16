Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5A33398B;
	Fri,  7 Feb 2025 14:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738937290; cv=none; b=TjM6ps4ldPNmHFQ8qlDw6PJD8CsIIDe2+ofkDIOW+kzKt90PzacjYtPFJEL2nzf3Qj38FiU92lPDiyzIhDKNCwS3nd1WuIRiwaretGUqihCYB5ZM7P4pn6LYPvb50jJ3711wrkt0mBFMIzQwtDyWqqTbUgsuWWSdaBmLEHPHE+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738937290; c=relaxed/simple;
	bh=waUGYQylZsvTC2lQroLCbM/1tw6SegVtb+pycmZdjM4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qsj7X6Lg/X907mEC2lRs+5vYVOIKhM69piE3b5a8M0+wmQnHXA7swJuVDBva9evlWzVdsPdGLjB+5cqcRLA3exObgu9yTko2mYd9GMaSAidbEcWkawWbjZdt+XtrDP4GzhLtvblRyPWP6YllahvhuRiwSr6DB7G4HfnGKhsRIxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OBYzAYFd; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBYzAYFd"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e573136107bso1803066276.3;
        Fri, 07 Feb 2025 06:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738937287; x=1739542087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ro3oOT+B3Q2DLskPRmtiJGhr5n3xItH0zu9B9q4hXzY=;
        b=OBYzAYFddCDWfgRXS//53LdHUW2iclhjbyCCbjCvyV1TUm7QbBfZfy8DEtPZDoGTZg
         fFxV8i+8eGnbblHVN3aM+W3+hpK6qxkIFubaJZb4erora+HVREdnTmPgdscktyiyG8KY
         dlvYzVIKd5WtO2KjG64Kcwu5vny0viFD4nmREXH857MW3Jow/5Wje1ZHG/jQWd6aXMI6
         0UqHkILrF13DxzUR+CJ8p3Wpwrpf3nwm93Gb/yaFwJ2l7EJ2bBKNGypN37gVLZNTGXa7
         1NSbW6PWAAx6smi3TG9aQEyQl31I6bJqrpHvqFYt9Rzs3tjH+9ApWytIpQBBYHaRBAah
         ONZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738937287; x=1739542087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ro3oOT+B3Q2DLskPRmtiJGhr5n3xItH0zu9B9q4hXzY=;
        b=shb4dVplBEUm/+Yd7UieKeH/28PfeJaYp8em2snlUU/Mw4EWZbj9Eq3e9f3xYJejXj
         SJcp9H7Hk7WpDq4r3E1bptqt0W0NvXehKoHk9O1TljLQgd71/ltytQaE59R1L4xhnhSK
         +OosnsVjxOs/DZxqtQxuIV7w2hBeLF6l4rhOE3zv/NrfTPCJpBv1XtCoHRvsZMTCeQWW
         wpCIwOq+s/uizrnE7bW2XIymfo1TDaZUOKv4G8x8cyKX5mXoj/4KrHCvtvi/EZG1ISX2
         8yjPaSRHiLUHC8tXHNxXulRwOZ69bEq9yPo+bgHvwSey11KDs0yE7AKyv2JPDBlmgBcl
         bejA==
X-Forwarded-Encrypted: i=1; AJvYcCUrIodTTSNAfDrpiBivdvmjErPUoecOSJLVGJw3daxokhsiTs51h6X74t5JmgGn2n6fLjQrox+NvlAGJUY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4JvNeHwlrD+kgx8CLYE4VvbO0e5mi71Jfyc6BB9ygYpsQK7vz
	hQmof6Sc4G4ctVnJtTO4+HC8/rDINKlYrVWl/HHWqlRVssmCH3eJcx/J7A==
X-Gm-Gg: ASbGncsAZqr9ojK/XDpmM2L9SzBXACwr8DXJ+d371L/8OEm0ogUX+8mFGTuzximMLc4
	/61suskVzHlYEJx5nhZG8xsqf+YJ+mp5OiqmP8bPzpWWVK4AQcJKBRTRomMBBkMENZBKcvTW4xU
	Vg5vIK1PqRJUCUCR0fBK0xBJe8ksI0ymBguljjQNwfaxAi3E0zeDhj/X1ocXiiItnB4KgcEAqVH
	qRuyl2zOBCsNjcuhOK23w4I4mM51rjMU0xaTj6C8cVX1b0TF0WL5gM65M/lJZyyNmdo4mGHMKXY
	sJ5JsQsD8+xWYjLHBaLmVoY=
X-Google-Smtp-Source: AGHT+IEtku4Nw1Bp9IDIWNWXOLntkCce9vM4vyoQtv7tK+M1iD64rIR8FS+eMVfk/RJzIcfGeBjbJA==
X-Received: by 2002:a05:690c:9c0f:b0:6f7:56f7:2398 with SMTP id 00721157ae682-6f9b284504emr27217287b3.7.1738937287453;
        Fri, 07 Feb 2025 06:08:07 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f9a000f577sm5525607b3.118.2025.02.07.06.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 06:08:06 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v9 00/14] platform/x86: alienware-wmi driver rework
Date: Fri,  7 Feb 2025 09:07:29 -0500
Message-ID: <20250207140743.16822-1-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi!

I addressed the style issues in the last version.

~ Kurt
---
[05/14]
  - Removed empty lines between call and error handling in all cases

[06/14]
  - Removed empty lines between call and error handling in
    wmax_game_shift_status()

v8: https://lore.kernel.org/platform-driver-x86/20250203182713.27446-1-kuurtb@gmail.com/

Kurt Borja (14):
  platform/x86: alienware-wmi: Add a state container for LED control
    feature
  platform/x86: alienware-wmi: Add WMI Drivers
  platform/x86: alienware-wmi: Add a state container for thermal control
    methods
  platform/x86: alienware-wmi: Refactor LED control methods
  platform/x86: alienware-wmi: Refactor hdmi, amplifier, deepslp methods
  platform/x86: alienware-wmi: Refactor thermal control methods
  platform/x86: alienware-wmi: Split DMI table
  MAINTAINERS: Update ALIENWARE WMI DRIVER entry
  platform/x86: Rename alienware-wmi.c
  platform/x86: Add alienware-wmi.h
  platform/x86: Split the alienware-wmi driver
  platform/x86: dell: Modify Makefile alignment
  platform/x86: Update alienware-wmi config entries
  platform/x86: alienware-wmi: Update header and module information

 MAINTAINERS                                   |    4 +-
 drivers/platform/x86/dell/Kconfig             |   30 +-
 drivers/platform/x86/dell/Makefile            |   45 +-
 .../platform/x86/dell/alienware-wmi-base.c    |  491 +++++++
 .../platform/x86/dell/alienware-wmi-legacy.c  |   95 ++
 .../platform/x86/dell/alienware-wmi-wmax.c    |  768 ++++++++++
 drivers/platform/x86/dell/alienware-wmi.c     | 1249 -----------------
 drivers/platform/x86/dell/alienware-wmi.h     |  117 ++
 8 files changed, 1523 insertions(+), 1276 deletions(-)
 create mode 100644 drivers/platform/x86/dell/alienware-wmi-base.c
 create mode 100644 drivers/platform/x86/dell/alienware-wmi-legacy.c
 create mode 100644 drivers/platform/x86/dell/alienware-wmi-wmax.c
 delete mode 100644 drivers/platform/x86/dell/alienware-wmi.c
 create mode 100644 drivers/platform/x86/dell/alienware-wmi.h


base-commit: e75394bbf4838857f57b6c5d00f1e56c46cd6c11
-- 
2.48.1

