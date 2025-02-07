Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23E923F274;
	Fri,  7 Feb 2025 15:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738943209; cv=none; b=Avia7SjAdvZuSUfN4mXUa7p+lRN2Ac8AEDHojgSquT7irJKOYApsw+cLnNIuXKCuv8HVY4x+Gka4GBjxS/sUEUaY/tdiwFuny+4z9ULt1+zndnH6Sn/IS5HQK4mxw9axX/ucCZMJNlmLxlPuU32QJ0bV0QWcNJuLYPrYmLW7D5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738943209; c=relaxed/simple;
	bh=r26Dfk4pIcjqXrs15ojOrUuhmcD2JhPNJuuQ8V5RiLY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s3WWQ9Kd3X4XsNIwGJ1QaJ03V5jAdcIEp0QsnWAAH8SIqwU+yVNmUXoHcGu7MDJBvCklmfZQJWCbvfdWddme9fqNQ9bLsSfzcnYWhRUuY96BZdwlVwS5PhWSnntK5H+NGf5GvFwgqqaouQyQDRHm5BIJzDLrEIjYBecbWBDWJ30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W7C6NAll; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7C6NAll"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4b6398d477fso617315137.0;
        Fri, 07 Feb 2025 07:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738943206; x=1739548006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eLsBRDyk6qd68kI3ESmjd0DlEYqGWVuzIkKvy/jh8NA=;
        b=W7C6NAllJ9R7zDKY30ov2M2NGs18EfD0aSVGG/wOfs8Bs10fUsV1D3fCdmHCJz/0CK
         BGRwwI9mOf1QFt20/+r+kkuK9jRTJxE5Rd2z+0tvCmAh9N8Utsf2pugTS1TaEpzjE89a
         R5WmxNvd/WHPxEQ0XgNxFR9/BW3oT4r9hPzAJsqRi60r9DyroOJv166L7K5xKwAM+6LN
         E9mrIgiqecDBUXo2i/ShOh09ghLDx+kvyAdVjUUC4Ao8mMLoDTHjOJ3VTz4PmWlmJ7x0
         al2Ztrur5EDVSQX68FJCBOmYQqaMkEZbZhjIq04pf4h7YPC8NXWQDOhA3gpnIjNLk7c+
         hkGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738943206; x=1739548006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eLsBRDyk6qd68kI3ESmjd0DlEYqGWVuzIkKvy/jh8NA=;
        b=TQWd5siQlBUQUNQFlIOXhvdCVFAje8/uhDLG5QKjwWWL81sGXUWWOtqapX7/8g2vq+
         TlUFUMRYaMSxuoUSIDVjB8o+ZJ2Z5mlkGhMF+eubRJ8VRII5cDlEUK+VwQUy0nADz9ip
         GPkAKF9ycjTPDruzzsUEZ37l3EoK9xfsdb721OtNDAFkxyMrzSlU0kYgmBFeQlpCbhq1
         47eSTpQM8Kh6KvJIbMf4M7hXYAv03UOC8qCXDDT/FZ8slWpIaxrvkyUz0yPFDurpQaVd
         OzbY4mvLWnmBRssUTBoGjsUjKMo+Zfqzo60YO+wpV0hl+TOTVnqQm31BRiSq7DBhjUho
         WIsw==
X-Forwarded-Encrypted: i=1; AJvYcCWLxyYsnJyq9zC+9DpSPYEENB1LkEBsd0VOKgtCePVQz9JdWgOeCmqv5qhrANAiBzaUQQMFYjhwr50LxeE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf3Mpw8MxZ/knpRW6tCXNWJS+7hv/PIfUXnWJw5UxyZ5iwn+vW
	XRxzqLBov9gnHZEBOK10fIi+/5h9eXWrvQpVVHb12cOEtjdl+HT2x+QFdw==
X-Gm-Gg: ASbGncvspL7njg+F0pw7qyBpPhUwiL5t+I/gg3n0/OHyFKxlK7nBuSzwRoNqjnalOP0
	Fx6+Sua2S7LFupv34A/3pBfBx/vmR6sZ7Yr5sn1PdWAvg+Y0XF0hr94aW+KQE/e1LlFWnxI6wCG
	XpVaQzuWZtF5oHOgudxrIslsrIxrxn9KCqpp3zJrPYLU2ZUpADonnA8H3QIaQmAacvHlDL206am
	EHu1eq7dv8odnCbBbI0AvBW9rpkWgJiIWdZNsdgE7qTii+NrvHfHzYIwZUc1NP9FQs7KhDiLjCw
	c3osEM5Sqhn/DfLmSkWS19Q=
X-Google-Smtp-Source: AGHT+IHL49dhcDF9F0FsF56G23+ZkINi+toeOQyajQvu7B6a3hvZHuclYXGlf/fqcaNfPeplUGcfcA==
X-Received: by 2002:a05:6102:2b92:b0:4b6:15fa:566a with SMTP id ada2fe7eead31-4ba85da669cmr2945996137.2.1738943206108;
        Fri, 07 Feb 2025 07:46:46 -0800 (PST)
Received: from localhost.localdomain ([2800:bf0:82:3d2:4207:a956:ebad:2a64])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4ba76cb8e44sm768456137.0.2025.02.07.07.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:46:45 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Armin Wolf" <W_Armin@gmx.de>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Hans de Goede" <hdegoede@redhat.com>,
	Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org,
	"Kurt Borja" <kuurtb@gmail.com>
Subject: [PATCH v10 00/14] platform/x86: alienware-wmi driver rework
Date: Fri,  7 Feb 2025 10:45:56 -0500
Message-ID: <20250207154610.13675-1-kuurtb@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

One more correction. I apologize for the noise!

~ Kurt
---
[11/14]
  - Fix .driver_data of Alienware m16 R1 AMD

v9: https://lore.kernel.org/platform-driver-x86/20250207140743.16822-1-kuurtb@gmail.com/

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

