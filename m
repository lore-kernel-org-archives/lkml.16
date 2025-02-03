Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FA88489
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 03:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738552354; cv=none; b=f7bnXuD0RH3VXdgLJW9N8iVlNiaN6NTaBBWIZVsl0RtyYqnfPU1uDOtHsqermNzpunwX9knT5QUbVFl+PiDkBLtv+xfjRwJsDoIZ9mGUtcvfL9vyKfhoRh9WvUYO7Gk/XO65CuddYAtScHgStXmL3aQ7ktgMZ6rZRgPmXwdkiqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738552354; c=relaxed/simple;
	bh=9qEe9GBuiReSyhyjLuww21ymXgybsQsC20Fu9NIuEPY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q0jbmgP/0YV3jWiPHi25gI0J8FGU279uYkVUxGPUjYlH+elGl6NMfalY2OH8YrMLNpvWoD4rJtKKHlRf/6IndZM4sGri67nhluaC1BKj99XpFmEkzDUF6oD9eZWXsRX/Xca+mbavTcTyo1Xjn1dpGZkQ5u1zh0xsNfxAuzxbeZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=YNGDbTXF; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="YNGDbTXF"
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EB23C3F689
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 03:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738552349;
	bh=9dRaT42vDk2aDgfJrdAlWkHrMcmu16MBdNXartJvulQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=YNGDbTXFFoEDmGBIkRTN1CwLdcKOnC9L+nEbGrHiTsc/Vr+DIf9QpU+uQZ7yutybG
	 97dE+KDZ7UEh2j+z/NLgd/TPYt5OoeULmAWWqV3ld2CkSlz1hNk7VfB1xXEDElM48q
	 qQbEmP8ZEQ68NgLQskLGEXdJp3b30Ix/dMtH3IDZPl1QZl9AKP5Qpdb5Yy6r3zku6l
	 5IIYKbrLLuBQxE+c0SI8z2s+iagAjXltkOkgKCo3JW/ls5pMFPHtWH5ZVRaWlJSUd9
	 8K8y0/3rJtRL5p4TQF1zI6v9HfOg6Az48BgPgLh0WuuKlQk6ganhb6DPoLv1jVW/xh
	 /P6az+i3+Shhg==
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2166f9f52fbso127477265ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 19:12:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738552348; x=1739157148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9dRaT42vDk2aDgfJrdAlWkHrMcmu16MBdNXartJvulQ=;
        b=KmDtwQs58jYzWFZqxdUC17w4W61xqS8Kxn9yO+2DSim1Xp+X54Yg3RV9KWEy9VyNX8
         MauvKAeB/RNVYtXtfpL10Ei+tmpgMGiCKcuwzHkwNwgx3vEEfH5NL2nTNq6p8mnVdvLv
         MMOYpqMJUCpQY2vAuYoFEbFihRiijMzP8dGZHGd24VRvJ/vj1AMR7UM2hyoK84t7hA6Q
         aJVHaY37z/7zhWhgT8QvPsRT956z9gkLKg5DQRX2VSvVvoLFNkInp/KRhQFeMeik39zL
         QCwau1YxcDWmJjvc+614fHoASMRy2D14veN/nilHnGcXRtuJ2KW8iCEat2Y8LNIoDIdi
         BAyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk3oX/74WU/Dcg2uVJB3kr9BVq2+iSY/9vGqaNySIxKeIQBOaDvSmMWsf96Ml/RMuPCBWNiWQRRaycISw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqGokfaX9dc7/bqD37Vt+vcYZhY8UnHArUA0l97a7JgIYs6kvT
	F73EJgVOcHPOcSonUBY71BpJajC4UYnGq3gqwA95twz2gCamLp5UGtlIHfxcYAjGLLLeiuoNDuI
	j0b45voUJbrPRMXQojMLpWsPjzNTwdnp9FY6z9f/AfQgr0pz5buGEK5oTV6JouKfdBu33X81TJJ
	i4eQ==
X-Gm-Gg: ASbGncuwkvePRmdyac8osZ05KSfANgJtaTGK65p4ECqa3unMLp1Qt+gVbZD49dSPhNj
	kkwh00qFAMNjCuv1eBFroq2n7zA84zdBeqwSj9V0PkA0odQgBY3FZXgo8oCZp5xPtA7ZxTALCqf
	YSKBtQuVk7jiNWOGQJM6vc8T51XggcfdSdZ3ryFCt6zUiNon5ltlYCVdgwyQcmDPydgyiNc938q
	/DkJcIJpa+Q3QeNsW9jmJ9xsZhO1KOM2/vSqjhHZn3CiWkdVHjMRU0i/6fYiqoZewO+EgaBvwEx
	CnTP
X-Received: by 2002:a17:902:c40f:b0:216:281f:820d with SMTP id d9443c01a7336-21eddbf3371mr197858335ad.11.1738552348449;
        Sun, 02 Feb 2025 19:12:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbqq3RY0ybUzsaAUXBG7s71Ef7RwBo37hUW1Z4jJuX4NQap/3W/X0DvIDLQn2If8JISW9oVA==
X-Received: by 2002:a17:902:c40f:b0:216:281f:820d with SMTP id d9443c01a7336-21eddbf3371mr197857985ad.11.1738552348008;
        Sun, 02 Feb 2025 19:12:28 -0800 (PST)
Received: from z790sl.. ([240f:74:7be:1:33e1:5e62:5b35:92b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de3300253sm65809075ad.162.2025.02.02.19.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 19:12:27 -0800 (PST)
From: Koichiro Den <koichiro.den@canonical.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@bgdev.pl,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	maciej.borzecki@canonical.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/10] Introduce configfs-based interface for gpio-aggregator
Date: Mon,  3 Feb 2025 12:12:03 +0900
Message-ID: <20250203031213.399914-1-koichiro.den@canonical.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces a configfs-based interface to gpio-aggregator
to address limitations in the existing 'new_device' interface.

The existing 'new_device' interface has several limitations:

  #1. No way to determine when GPIO aggregator creation is complete.
  #2. No way to retrieve errors when creating a GPIO aggregator.
  #3. No way to trace a GPIO line of an aggregator back to its
      corresponding physical device.
  #4. The 'new_device' echo does not indicate which virtual gpiochip<N>
      was created.
  #5. No way to assign names to GPIO lines exported through an aggregator.

Although Issue#1 to #3 could technically be resolved easily without
configfs, using configfs offers a streamlined, modern, and extensible
approach, especially since gpio-sim and gpio-virtuser already utilize
configfs.

This v2 patch series includes 10 patches:

  Patch#1:   Preparation for Patch#2.
  Patch#2:   Introduce minimal configfs interface.
             Addresses Issue#1 to Issue#3.
  Patch#3:   Addresses Issue#4.
  Patch#4:   Preparation for Patch#5.
  Patch#5:   Addresses Issue#5.
  Patch#6-7: Prepare for Patch#8.
  Patch#8:   Expose devices create with sysfs to configfs.
  Patch#9:   Suppress deferred probe for purely configfs-based aggregators.
  Patch#10:  Documentation.

Changes for v2:
  - Addressed feedback from Bartosz:
    * Expose devices created with sysfs to configfs.
    * Drop 'num_lines' attribute.
    * Fix bugs and crashes.
    * Organize internal symbol prefixes more cleanly.
  - Split diffs for improved reviewability.
  - Update kernel doc to reflect the changes.

RFC (v1): https://lore.kernel.org/linux-gpio/20250129155525.663780-1-koichiro.den@canonical.com/T/#u

Koichiro Den (10):
  gpio: aggregator: reorder functions to prepare for configfs
    introduction
  gpio: aggregator: introduce basic configfs interface
  gpio: aggregator: add read-only 'dev_name' configfs attribute
  gpio: aggregator: add read-write 'name' attribute
  gpio: aggregator: expose custom line names to forwarder gpio_chip
  gpio: aggregator: rename 'name' to 'key' in aggr_parse()
  gpio: aggregator: clean up gpio_aggregator_free()
  gpio: aggregator: expoose aggregator created via legacy sysfs to
    configfs
  gpio: aggregator: cancel deferred probe for devices created via
    configfs
  Documentation: gpio: document configfs interface for gpio-aggregator

 .../admin-guide/gpio/gpio-aggregator.rst      |   93 ++
 drivers/gpio/gpio-aggregator.c                | 1194 ++++++++++++++---
 2 files changed, 1103 insertions(+), 184 deletions(-)

-- 
2.45.2

