Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A01F1DE883;
	Sat, 17 May 2025 08:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747471926; cv=none; b=ipud7pxFW4740wp1zP2e0gw6Uth3O7PO3Vzky6xOvTuDqtCQk626W4X6Y2SiCf2DXzimkE/JH1XcHel5uGszdQIfgFRpnESexjDifVAaaDqHjC1DQ4KDvxJhCNeAqKbMcNU8Bmh25CPbRo6ckabxBkFbPy3BqrIg+YmpacE2Jso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747471926; c=relaxed/simple;
	bh=lF9/DFxJbpnFVTv/6jEIAz7zEF9sW7iPq3Bf8TJ1yxg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DL/HhGf41TOC0wl05gjTsYjwcCtLUd8qC2q3y4O0o6f1mAz07LwxIOyMjmRkoLWfuh9nQ2gRIoHYEKVcH6S+wNcw2dEZ8kmq2eNBJZBc6+VPufZN6q1HDAa6ZGI3ZsW4qwlCMNiiX2nVPdLGIZwNfO1WN33T+NfHn+ER/WUM1iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTcbo8JD; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTcbo8JD"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-527b70bd90dso1119809e0c.3;
        Sat, 17 May 2025 01:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747471924; x=1748076724; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pyxELqAYWJh5y3cAyXG15Si240JlncX4Vur5tcQgMPk=;
        b=MTcbo8JDKnMJVp+NWJOdj1SuPQCRgYvcSO1WLzJL2LIApzKx/rRTLtWPzPMDnK4g2u
         HzSCc/UciQsSXeYQumPGEHPVJqWHg+tnP1+d4iHTbtsPZODOnKVs3j+1mrIo2KM50p+j
         4IQn5YeIer3H4eW335RK7ot3F0XeS6nxjDBKultv0JktVvPJo1j1xn7x6W3YfkPaDrId
         PAiyJ5f7tFyNTp+sPENbg5Vjw3e/6QLALxOEYm4Hsgf3d89PpJ5w1KWbtMNMYlm5ZMzh
         oltMqrNmdFb3zfJ/gsvM0RIwVjuZvhRZOfNrXaN7GFPOgDtANeFlgPAFnJOWzIxTLux3
         7TBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747471924; x=1748076724;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pyxELqAYWJh5y3cAyXG15Si240JlncX4Vur5tcQgMPk=;
        b=Oova5ibYPHAGmWhKq3PH/TaN/cgBAepcqOfaDuZhzciv7Th5YKMKrGja7vkVk+Ml1A
         YD66ao12PU05V1FTo8kjmqP+EZP07Wfp35tonIwcnjIX4cseIgNaayZvL3kmAZboFKnf
         E/2aHOxyJQ4lbcP38P2TXyX+Dng1ZD4sBUmslA5EK05TnXf/lBxAbbqTzYi7PjQuaJ8d
         x6Z0CUB7IpQawZjSKT8IW4Chpa3eYPiOGbNWjfHkVTXRxIh8o0IOAxu7HUhjHzFG71be
         N4x3AFZMl6ukSDbV5jrQpmJa8IzCkrYsTwrLPM7ahYFj/XO0pjKcBmmCF0kRSWqPDHl7
         KTgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEWDXyCNSfJ8jnpYGBzGMLmS1gzPAtLgRyWXSsVGM0sv7zNLOifJtlVSMIu1zsScz1cjheoriWY6Z0FZgeb3w14+sxxw==@vger.kernel.org, AJvYcCVLL+SuO5XP9jfil0yUTIO8B1wF5TR5ivuHJEtURWQPMjaSgzMhG1Eo51TAblmtkBC79OCMBjukpYCpP1o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPN27nggi4a7R3idncw/GETZf5G7DiSP87ox9ebnX7TA+h0U7K
	K60Ld0zMs7sokXowI6yh3vtPRDO7kMEcC35+us5k84o/IrOi2szX7aDQ
X-Gm-Gg: ASbGncujNRVjMgJztU6PrAjx6wsDKdbwavcIQ/BB5rN6AY32eRgHeYoc26//igpEWeQ
	cngfbqq0QUhl0FQFxlutdqft94nLnGSmDz3b3EwGxUKBdSo64ZP9vTtOi0agfA/IVlE/vEge9tv
	oJlTNs+jsL3iQpfPqfcoIPLkzp7WWXW1eH5jgrrjwOuvyktaXdeLHJI0b/sCgFK2hxXAUL1N9az
	OFe1a0f5Wx+cxV7G6z5H0dyZLH9bSb6kHdBoJhslAoECNzht1cP7lt8Jok3qIfJsA7JHQwkj7VL
	aWcLdml7wFWpbSU6qwLjSrq551xXW2mZEJsq2tNDamjxgfIwNlgqXFPmP0ge
X-Google-Smtp-Source: AGHT+IE2zj+cCjYg9Z7WVAI06jrGyEqAoqfSPLHRzpeK7vCrfIb4WieZ10iz5x8cDVmSHCp7lbvuiw==
X-Received: by 2002:a05:6122:65a0:b0:518:7ab7:afbb with SMTP id 71dfb90a1353d-52dba94a50amr6505648e0c.8.1747471924059;
        Sat, 17 May 2025 01:52:04 -0700 (PDT)
Received: from [192.168.1.26] ([181.85.227.70])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dba9405adsm3455812e0c.11.2025.05.17.01.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 01:52:03 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH v2 0/5] platform/x86: firmware_attributes_class: Add a high
 level API
Date: Sat, 17 May 2025 05:51:35 -0300
Message-Id: <20250517-fw-attrs-api-v2-0-fa1ab045a01c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABdOKGgC/1XMyw6CMBCF4Vchs3ZMGVO8rHgPw2KAKUwil7QEN
 aTvbsWVy/8k59sgiFcJcMs28LJq0GlMQYcMmp7HTlDb1ECGrDlRge6JvCw+IM+KRoTPjSGydQH
 pMntx+tq5e5W617BM/r3ra/5df5A1139ozdEg2Qs7aQtbOy67gfVxbKYBqhjjB1Wt8FCoAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2232; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=lF9/DFxJbpnFVTv/6jEIAz7zEF9sW7iPq3Bf8TJ1yxg=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBkafnpcTEJzjbanGpft2/s3r3RVm9v3uc7X1d5ZxtR7p
 sdMWCjYUcrCIMbFICumyNKesOjbo6i8t34HQu/DzGFlAhnCwMUpABNxjWRkeHqK741DZXrka5fc
 9I0zZx498FHLa4e208uyKWcqP95V/srwz9bS+4pmqfgX2Q1z38e0J5cmOZf+4Gaa9Sv5yF6mB6X
 OfAA=
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
Changes in v2:

[Patch 1]
 - Include kdev_t.h header

[Patch 2]
 - Use one line comments in fwat_create_attrs()
 - Check propagate errors in fwat_create_attrs()
 - Add `mode` to fwat_attr_config and related macros to let users
   configure the `current_value` attribute mode
 - Use defined structs in fwat_attr_ops instead of anonymous ones
 - Move fwat_attr_type from config to ops

[Patch 5]
 - Just transition to new API without chaing ABI

- Link to v1: https://lore.kernel.org/r/20250509-fw-attrs-api-v1-0-258afed65bfa@gmail.com

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
 drivers/platform/x86/firmware_attributes_class.c   | 454 +++++++++++++++++++++
 drivers/platform/x86/firmware_attributes_class.h   | 276 +++++++++++++
 drivers/platform/x86/samsung-galaxybook.c          | 308 ++++++--------
 5 files changed, 861 insertions(+), 185 deletions(-)
---
base-commit: 9f080c9f2099b5a81c85b3b7f95fd11fad428cc8
change-id: 20250326-fw-attrs-api-0eea7c0225b6
-- 
 ~ Kurt

