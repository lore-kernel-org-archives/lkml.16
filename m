Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A685F1DE88C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 15:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744990949; cv=none; b=pbqWg1DNzE+LJUc0Cax0nWrljpaW/b9/noTsiuT81nmijJN7sxP8Isa7ErEuy9TErzQeD1q0BOt5KPDQkbRNIoyGFUhrzYoU0PDMLeYNqdk+4vwKJRQFI9mDDlXWjqpsJQDzNvgZmVs3VSZxfVk/ISod0jmHwK1yW2Szid8YPZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744990949; c=relaxed/simple;
	bh=8e7pbQ2bTA4lrV+RYiGKF2Y3SlI9gzWDTtVmcFDC2Bc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s0eAklmxAsgND2iMNDX/JGPOHCtWZhY4Hqv8yV/uE32LL/yce2W9Y2mQjIVHv1O4q4WcmOcJiQalnvAtm6bglwYBEJFsQgQoYGzCUbd28sd+DMZmS5O3h9gQr/ny7WNEaswXA2qBM1Lbb+hcWzzZycbGiqiX4Ieny5BMpYCKBlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aYhbNDMb; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aYhbNDMb"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso12948555e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 08:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744990946; x=1745595746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=swXOeOrGvU16YEKC9rgfXZITAmlWOeSfggI4AmHPyYs=;
        b=aYhbNDMbfrMp844SXkpnyz8NAa0+cYTtpH8GQv9B9UWZFdeMAlp8dc8uUMysbBq7gz
         7UDkPZJdUUHXrxYz1mkCPUpFEZDJyy+ZP8ARYFT905oBZrREhZgjxjSZDnY9QO2Kb0cA
         jdTmATOSX7uTpvzyVSzT09+I1YR9DLLh5G5xIiQX5n5tVggnXpp2IQ/+j8xTeKySnlJ5
         0fhe7n1w+zi/i+mqaOf9Oao2j3KHxxkOVdjEHCMrW9P7i5SdIFHRZFq4aIzMfoIjAhxi
         oX30ERu4zohc8i0pTJ77oGxHUiZxlsJyMc+d5op6ihTFElKuQkbGkj8QIOOnkHvCIJvH
         Rabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744990946; x=1745595746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=swXOeOrGvU16YEKC9rgfXZITAmlWOeSfggI4AmHPyYs=;
        b=tFL55ney9Bj/+fdLz7CdPFqg8RK9AtF7h7JuDRbP0KqvuuUk9phdWeMHzVbWUVF4Fg
         IzY37xOiBzzvOORK+bZWBiWrSMutThEUcVI8QUIe5dAM72JZCftIumwZuCac0+Si/81h
         RES8noWv2p/wRWxNTmoopnGCSaOoBNBHckZV+xiqEWlaDnif8XNk66rS04Sy9b4TuMhU
         D/vMmAWeNe6cA/ca/PHYX/aQ/7R+CWcg+qwU9HX/QYStByyuLiv5qswyTFUQxUimQmSc
         537LLY6l69JYZ4YdRtLM+kyiTAiAmNfMuY3hxZ72i/6LXSYxfxXUFV4RiMYBmDyzocEi
         BRtw==
X-Gm-Message-State: AOJu0YyVXCtuwoUDhjdkZKjsOoytDdHcmZNe6mKvgZQSCzLNGVxZSW1u
	gzQOmfcPEEpG39d4uUtDokwpBwI0SZ9sY7ZW0rS96i9N4HEOKWj3
X-Gm-Gg: ASbGncvoR0sqmyhhsYSqbWh6dea/EfG/iA8HOS4eQyv8xndDk06XP5Wnazee9MM68d9
	BJVirAQWFxzsUeKFKgZLoejLj3KTBYi0EUWDhW+35Zc7BN1de7Zr03akV1dQRxG1FG8xyOs+aD/
	BwLtB52VwM5MfHgVyjgTMMfD1uF9/Hc+qK+6TkOiVakqVQz+a10SW072pmgPZdif9FkyAhj1mKk
	60wV4c5jABT7VI36bK+hck7qjrnxEVA04Ds5/0vJ9MHB3EQX1C9pJxGsj/4ka2Uo9v4Ldz7hqwJ
	EednAQlCXyXNA7uz/ZS8Xt2T91T6t7sO+v/XwQ==
X-Google-Smtp-Source: AGHT+IHP1H8hH4FlWxzL+NEYXKcVuQYxizbv7WQN229jr3mrOiH4KUMIeR+Cmibpy0NJ8czxaCRnNw==
X-Received: by 2002:a05:600c:4e8d:b0:43d:1824:aadc with SMTP id 5b1f17b1804b1-4406ac616d8mr28402565e9.29.1744990945681;
        Fri, 18 Apr 2025 08:42:25 -0700 (PDT)
Received: from ubuntu ([102.88.77.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43d03csm3160549f8f.59.2025.04.18.08.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 08:42:25 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: julia.lawall@inria.fr,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	dan.carpenter@linaro.org,
	andy@kernel.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH v6 0/2] Cleanup duplicate NULL tests on a value
Date: Fri, 18 Apr 2025 15:41:55 +0000
Message-Id: <cover.1744990405.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v5:
	- Splitted patch v4 into a patchset with two patches so as to
	 proper explanation of each change due to different code patterns
	 in the change as suggested by Julia Lawall.
	 - Modified commit messages in each patch to properly explain the changes
	 show the initial NULL tests on the value.
	 - Added Subject title to each patch to be specific to the value being NULL tested.
Changed in v4:
	- Separated initially integrated suggested change
	 "use modulo % 4096 over & 0xfff" to a different patch.
Changes in v3:
	- Changed other cases to use modulo (% 4096) over (& 0xofff).
	- Modified commit message to reflect these changes.
Changes in v2:
	- Dropped patch files for media drivers from patchset as it is
	  not meant for outreachy applicants.
	- Added full-stop aign to text in commit message.
	- Made code more readable by adding a line break.
	- Changed cases to use modulo (% 4096) over (& 0xfff).
Changes in v1
	- Patch for drivers/staging/media/av7110/sp8870.c and
	- drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
	  is split into two different patches in the patchset for use by the different
	  driver maintainers.
	- Added subject title for each of the separated patches.
	- Patch 1: Removed unnecessary curly braces {} initially inserted.
	- Patch 2: Unnecessary {} was also removed for v1.

Abraham Samuel Adekunle (2):
  staging: rtl8723bs: Remove duplicate NULL tests on pstat
  staging: rtl8723bs: Prevent duplicate NULL tests on psta pointer

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 62 +++++++++----------
 2 files changed, 31 insertions(+), 33 deletions(-)

-- 
2.34.1

