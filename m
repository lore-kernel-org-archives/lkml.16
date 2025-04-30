Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9B5647
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745974940; cv=none; b=ULNayKLgOuN1R0+XoWFEiG05tQIM18SQqJN09LAhcvosrFEfHx1RMFPkFz4rtkERLOmGfkqtExTvq9rb7vEEedV8AUTe5j4LNg8J5LubjjzC/GFMCg7AFiKz71rEJEimr2g3yJW7eBry3MvAfZa0cS+YyKAKOqZkKv6Q8Qqx7xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745974940; c=relaxed/simple;
	bh=xp7tOi0cj7UpgOl6wrM5JMGsq6o1u05fS0ZCcGSomGk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q6d2Dlqhkc6Rz+uTyVw4Twyl9vK2tn0lD4rrwby02kvoa3t2nYCP3AfN9p8NlfLVbvUZ9dBPScS0Iqy65p53eZ4WIlE8G9d0VngVBm8wEdr7v0W0TRXILhn7ESfO5aTQlNOIBiVyz2xXB//9oThaknAYUoEa85fpi/UmZ1FFYRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HqsgFz2C; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HqsgFz2C"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-85db3475637so14332139f.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 18:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745974938; x=1746579738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5NHKa0PPlJF+9R+OAECmAN8QtisVqJGLvAEF8ZCeteA=;
        b=HqsgFz2CAcCQ+KpRfSwRaSD2M6Dpxt9FM00zy7dTTQBcHSM+wbU6t/aQpQDDcXFmXN
         /dU/ovZPWLO6tIwVkb+D4mEWeqixFXwkrfEZPG5+IPQsuQGUrFKhnbBGZoZQOdUi6C+K
         7uTzZKORLQl2dayu9vanzfviG906rZMwceAWEza9GwTqU2rN4w7v0dttCtSkhT5HgI2d
         R8ZRYZHhTm2SMJDWOBfPuzeZJulVOIs9tYegJIM1ZZT1HP9w0EkL56vNEi7Kl+Atf4WC
         jMnf5GfnQzCCb/vBfNH+iOOMBR/DFREwAddkiXh1IoMCW95wQa9r7RliEOSg4on+6+hp
         J6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745974938; x=1746579738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5NHKa0PPlJF+9R+OAECmAN8QtisVqJGLvAEF8ZCeteA=;
        b=xBMGnta0+FO3niiJgLIWaGwY5UgoYR2axnTQ3FdwQSE9if01VoGma6R4VGOk6hycnH
         xggdvMbkCyAgtAB0DIsiHK1PH9atAdZLafxvr2kPNhMBoc5K3kw9n2twuxS9ghvyHTMV
         v7mwPXQoBQ4D1elkiA7Pq9zXSYpJi+8xsetUnmowlzNhE2GJP9YQrW3hEJ4fyYDxBWkd
         bbWSv4Azj9wt4CYrKZIWwR/6GsTMK9i6HNcfjuTGmJhMP7OLI1ok8c4WAG+BbZwhwVbJ
         orpglGCYlu6J9ZsS1e766A+WXwqvAq05La2x3I4zpsKHVh6DwxXxoONTHcvQY8qLTZy1
         /qRw==
X-Gm-Message-State: AOJu0YyfSxRZHFQyyGZW71M6ndQ2l9z/laQ/FWeragp1rKClIy2A68gY
	Bi11yPTuagbv/rtQC+vSwFJWaMTvy9+YP/JnJdm4CuDQ0h+aZZ4L
X-Gm-Gg: ASbGnct5GIUIcVDx/wwC2q+SvRk4v+7ZIkw17vxCfl6YnKBF7eJMi/1yiVOff3Ho8Fe
	T2QDq6Lc8do55TSfC8eKZvgrX6dz53ELNGU2enWspYdP6WbyJOLF/W/flmvVpBQN84t9JDtPjrL
	XZg54CwazPS7GKlJ0BY1scQU0D8PJ44tIoClzKsHbwZAFFgZ5wr4x4y+BwFtOOU4NhYRL38/I9l
	HU+OSESDCsgSh/HDqHrprtLUZzJ9bJFa9P10yIQjRWx0WTAhHtErc1W5JhuN4UuBtcflA6HWUYk
	5nhe3d3YzgNnlPHlyrzT5Z6AJ9qpk4w2HA8PzYzWHEDQ1fFR/VcxvTYLMdzSH1OTZIY=
X-Google-Smtp-Source: AGHT+IFLaFQ904C5P+VR6kfInawd48tGLiLFnHPw6XWpMNLWw0WANcGltKGC+BvuHcmufUmKalVioA==
X-Received: by 2002:a5e:c308:0:b0:858:7b72:ec89 with SMTP id ca18e2360f4ac-86496cacb64mr91607539f.5.1745974937709;
        Tue, 29 Apr 2025 18:02:17 -0700 (PDT)
Received: from fedora.. (c-24-8-12-5.hsd1.co.comcast.net. [24.8.12.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-4f862e0f4c0sm534818173.4.2025.04.29.18.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 18:02:17 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH 0/2] mm/gup: Cleanup memfd_pin_folios()
Date: Tue, 29 Apr 2025 18:00:57 -0700
Message-ID: <20250430010059.892632-1-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A couple straightforward cleanups to memfd_pin_folios() found through
code inspection. Saves 124 bytes of kernel text overall and makes the
code more readable.

Vishal Moola (Oracle) (2):
  mm/gup: Remove unnecessary check in memfd_pin_folios()
  mm/gup: Remove page_folio() in memfd_pin_folios()

 mm/gup.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

-- 
2.49.0

