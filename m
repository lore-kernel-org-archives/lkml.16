Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF26A24502F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151111; cv=none; b=QvJBRaGGQzDy3xDJfv4ju3BeII3+eS9iFGGkZKoIWO6eFhJUWycHsCUSTyJvf0dI9C3nQBpV23sJ1nko+4QofNm5X6NMKKq/K1ufL/wVkDiPeX/FIlbnpIxV/79RYZCb+JlDoNw2ZVNwNwJ5mnzqLxukT4ByQ8F+ETV+RgHtBGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151111; c=relaxed/simple;
	bh=6mgVkkpsjWIgIp9gXlW4Cyz9Lws2PKbkHc0ayWK9yXk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DxgbZbOgg3D9X6It5WQHgSom7rqp2kledPMz8KDw/7KRdORCecGsjCWFwUiMFOhnc67z5Nip5BNO4ktISmesNLD+P7ghl2VBldc4CEHSLqx5W/17Zcbhh8GLM09i6jstTaOW0/MaAjrZtr6EneZVzZCIR7a3vBbVOGHB0rzMco0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=lzlCiGaZ; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="lzlCiGaZ"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-736ab1c43c4so5938761b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151109; x=1744755909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ViqAkuD4B+wSto7DcoJaE9q3C70rJlubL0ef0OPS3I=;
        b=lzlCiGaZ9KPMb6GV/lr8MPu3iDLFI+YT03/ZDhK7gL7edLUXe0orRb4DQcowt/k4ky
         2j/mYDwRk+6yoTKVJWdB4zFNR1nj6A6SGB1D0KsMvfgv1BZ5FciYk1bH8a6uddyZkTh4
         HVjltb0cO5JvpnxDLKvXjqvn4/Ir7xq2URb581Ovrllpr4lMv8P97wp8wdVOKqJdUbjA
         2hjVTTF+TSX9E52NcpXCGrXqxL6A6k3HC52LCtGkCNgnLkes16k8/N1+EQjb/HNGJi6k
         R2/m2UDN65RLtKdABno7Er548Ccct3OfqsUSytuOQbJveuz4EBseximLxyw6n+ExEBVn
         rzIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151109; x=1744755909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ViqAkuD4B+wSto7DcoJaE9q3C70rJlubL0ef0OPS3I=;
        b=aVSUIEuBf0GcCQdpUE0o9bVRIorTOodNkMfBiReInSo+tlzFovKrcX6YPn/w5iJ2uy
         E4wMuo5vPifTkqGAgWIW+BlL6OxNwfz1U7BKNESvUW0PXSk6Yq0PFIqxey9CWYwFSAq0
         Z/iEAuDX6H9SyjO7DBtJSWINuRjb5+1KN8SWI+8T+P+H+rWuqa0bGQVoP0zDWo6UEgJh
         2x1cBTnHT9g/r/vPMwBWZ00JJDkoM5OsOLGhxwCC2EwEL6xhQ2WFBYXRy3Z6lRvLEf7C
         37oEc8S+e1to1k6YXoq9ygWjUnsKhTFW2emeO7GWBODzpzGVF3xSZ2xdHwTCIwy7rnbJ
         fQVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIVKTA/A9CBz1XxwB2NirDtM0gWL8t1SqwVOAu8XcHapWWnIjE7tX+lJlaZcYTyFaZ8gSwSlTx9hqsBOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaPhbHV9SD95mKTt0PESjkrh9kOe9xcA4YJXa1uebXmA3rAeE1
	VGxSRogj2WMNmjIwjiM375QUImjSzS515mQFx5mnu5gSl9ud9Gy3YzBb1uP4Xw==
X-Gm-Gg: ASbGncsh5p5/SWjb0ExHvGEDBl0r8KpkGlku1E7henyxrTLR3PIsD5Dj/QBAW6h10Eu
	3O0ZPpFdgY6lhsZh/YRYG+NNvLJAp4mpUSE8rf9tFqM177B7RIxsWkfG0FJvvTyWxL4uFcqEZrR
	C9aL4L3IofMzr8zROOVMEBVnh21pQUReYrmglv473Sxz+9HAmgjB8DqVX/6LeRsUQciY41HJJ7l
	nGtkIqvfoBRgpoSjc+Km1CSkx4663faOTvjNBAzxnHJB1pCECfTDOe9kJ7e4dXmoIG24v8vkVIJ
	ArK6eYewTqsAFZioprC+jH2awHN3wmqIFZ03b0cQmrGEYxt/ugspqZWUabHLf8dE+QmdKTgFSyR
	Ef36WRCU1Tg==
X-Google-Smtp-Source: AGHT+IGiBppSjaQteYHQJXrW7OuRfab0zZwBhov0YdifkfZ3l21wx31Di7eLQuSk96wm0lnB3s9uKA==
X-Received: by 2002:a05:6a20:6f0e:b0:1f5:7280:1cdb with SMTP id adf61e73a8af0-2015aeb5bb1mr188900637.16.1744151109169;
        Tue, 08 Apr 2025 15:25:09 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc41ad0csm9593343a12.66.2025.04.08.15.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:25:08 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 00/18] staging: gpib: Removing typedef of gpib_interface_t
Date: Tue,  8 Apr 2025 22:24:46 +0000
Message-ID: <20250408222504.186992-1-matchstick@neverthere.org>
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


* Patch 1: Adding "struct gpib_interface"

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
 drivers/staging/gpib/include/gpibP.h          |  4 ++--
 drivers/staging/gpib/include/gpib_types.h     |  9 ++++---
 drivers/staging/gpib/ines/ines_gpib.c         | 14 +++++------
 .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        |  2 +-
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c     |  2 +-
 drivers/staging/gpib/pc2/pc2_gpib.c           |  8 +++----
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c   | 24 +++++++++----------
 17 files changed, 57 insertions(+), 58 deletions(-)

-- 
2.43.0

