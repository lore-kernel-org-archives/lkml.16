Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A391728BAB5
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751292772; cv=none; b=OzLtNcF4warD3HkryNEdzIWJY+cCGvzvOhfZm9MyPedwVRlbGJvPWdLXcHZOhDeqMmrEmkHzemrQKWVLJJaTG/98Jnp8gvwXVa019OkQKYTsvX1sRb/OizqxfiGNJcrzvFTSjVLzyrl0X6ONNe/Zme466adpb74QVXzpz2JaN6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751292772; c=relaxed/simple;
	bh=bMHPCmwSf/0UHN/+Dbhn0oR0tIkPxlobark4ljmFKMs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T6GlEKvq9IJvmPgkhz/Oc02PjLa2tqTvlxaBJZb+JSr+81py3kszH9IGFQ9iK+lF6X0HkLrHfITA6MTosCmh5it6ENQ4u3do1s7cOKmKo1SSC4U5UGbMIGSKoZfddwlecwGGncLueXcslPIebupXlLhFGoYGu6DAwab69ntwjyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=A1K4Wkdw; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="A1K4Wkdw"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6088d856c6eso8472510a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751292768; x=1751897568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PPXqzMTVNtWkrqY32SDEDi5ZNrPEzXx3OZ7fxqg/7GU=;
        b=A1K4WkdwUyqzbBHrwC+mbOLa1l4hSZR4irEc5ltp+11Z/NLMR69uvLX3YPYSwB2PFi
         t8QUbqNfFeDcAlXN4KIMJKZfQHlQmdcz3jkh/LU367Fu5To1jtU7VZRxI9A+MxD2kQAq
         8FKbfRKFrQjqdNVADEUiQkZxkqp+K7euXHlZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751292768; x=1751897568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PPXqzMTVNtWkrqY32SDEDi5ZNrPEzXx3OZ7fxqg/7GU=;
        b=budrbcA5qjR1E4oOnCw01ZhyO872MI2Vn5fsbD+UH8V1Kbnlz0GBovXXcdZfkub8Ff
         Cyf7oFn7kIqio8T9XKNx72x5u0uhAoBw/4H/XXh7ZBqLnSVVM/NQtfAiXPcWT1C1lPVy
         rz0csvrOG6yZm0mo+H/fnjzh0bNFK8HiWu/SCjaS+2mACd7MdWJUIj1fXODMs4T7il66
         Dscq4uUeKPRKq2KOf1K5LpaN3u86oUEHkzJ79/rJMYEx7+h0eQhf5H5Jm7167kneP/YO
         fxrtACc6aEjYIv+Tcwx/NjE2DSugz9tdb9CDp9lUqPFwalK+J3OW6LvDdDEI8pIIZ7QJ
         /pBw==
X-Forwarded-Encrypted: i=1; AJvYcCXqDd56BehLz1ljPRjXxqbA3tZaTPZiIzlB6oVc6RTYYgomWoydZ3JdpZNkBLRqPTVNSPCjim7K2+iWkZc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOLE857aShf9sfc264CIzB75QXJA4Ygn0CFUlALaUHetOa/CJE
	r4ZVMZxGv3RwLakoU9+Ltb6++ietQVTPmdzLg1WaZM5AMDTdLhriTyb8ydT69qRiaw==
X-Gm-Gg: ASbGnct5Jk4j/6BRj4Al7jxgrkDhUnaVPQBT93zVguZoSiiiudcd/yR8I1ZsqRjQUht
	5iSQXnk4a9J2/hFlgBSmVOQ248v2adCfI5PYDegreimDwh3lLKP5BHfswpY4+OEyGW2h1SvY5/l
	IptCMetxzsPrZKjdduSZmgkRyPX1kFUihNWja5k/NTcZ9CsaVZAjjuSVgDsnjvoyS2pvh9Vjkvq
	eQ5wn7bjSFrC1oA/PXLLk0yf+8YlG2gv+w4jcTYYvJQ8ztqsezycdN+/50mgLVPt3IeuhNreuqq
	G4oQ7zkrLkwaX/NDfHF4b1XVHvzHds83OfenFmXqbfTSi107whJZ95t//WYe3rqNvE1hA+hWvD3
	hXI5eEboyQr5WzxMUMICCzDb2jreSY6oriiUzaW3q6yDi7TBNoH25
X-Google-Smtp-Source: AGHT+IGkDKPhreTeoMJMMTTbgIYsyB6qEooZPSD7ypLq50eF8X4N1KuKONp/TfysPQPg9BZXo77t8Q==
X-Received: by 2002:a17:907:94cc:b0:ae0:a245:2fef with SMTP id a640c23a62f3a-ae34fdbed8emr1390270066b.20.1751292767830;
        Mon, 30 Jun 2025 07:12:47 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (72.144.91.34.bc.googleusercontent.com. [34.91.144.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b416sm670643866b.28.2025.06.30.07.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:12:46 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v2 00/10] USB Type-C mode selection
Date: Mon, 30 Jun 2025 14:12:29 +0000
Message-ID: <20250630141239.3174390-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces a flexible mechanism for USB Type-C mode
selection, enabling into USB4 mode, Thunderbolt alternate mode, or
DisplayPort alternate mode.
Two new sysfs attributes are exposed to provide user control over mode
selection:
`mode_priorities`: Allows users to define their preferred order for
attempting mode entry.
`mode_selection`: Initiates an automatic mode entry process based on the
configured priorities and reports the outcome.
The mode selection logic attempts to enter prioritized modes sequentially.
A mode is considered successfully negotiated only when its alternate mode
driver explicitly reports a positive status. Alternate mode drivers are
required to report their mode entry status (either successful or failed).
If the driver does not report its status within a defined timeout period,
the system automatically proceeds to attempt entry into the next preferred
mode.

This series was tested on a ChromeOS Brya device running kernel 6.6, and on
an Android OS device with kernel 6.15.

Changes in v2:
- The `altmode_priorities` attribute has been renamed to `mode_priorities`.
Consequently, USB4 is no longer referred to as an alternate mode in the
code, comments, or documentation.
- Mode priorities are now set as a mode sequence, eliminating the need for
explicit numeric values, which simplifies configuration.
- The `mode_priorities` attribute no longer supports disabling modes.
Instead, this is now handled by using the `active` attribute of the port's
alt-mode and the `usb_capability` attribute.
- Changed `typec_mode_selection_reset` behavior. The function returns
EINPROGRESS if the entry process cannot be terminated immediately.
- Patch 6 from v1, which addressed a deadlock, has been removed as the fix
was already merged separately -
https://lore.kernel.org/r/20250624133246.3936737-1-akuchynski@chromium.org.
- `typec_svid_to_altmode` macro has been replaced with an inline function.
- Attempts to enter a specific mode are now limited when the operation
consistently returns an EBUSY error.

Andrei Kuchynski (10):
  usb: typec: Add alt_mode_override field to port property
  platform/chrome: cros_ec_typec: Set alt_mode_override flag
  usb: typec: ucsi: Set alt_mode_override flag
  usb: typec: Expose mode priorities via sysfs
  usb: typec: Implement automated mode selection
  usb: typec: Report altmode entry status via callback
  usb: typec: ucsi: displayport: Propagate DP altmode entry result
  platform/chrome: cros_ec_typec: Propagate altmode entry result
  platform/chrome: cros_ec_typec: Report USB4 entry status via callback
  platform/chrome: cros_ec_typec: Add default_usb_mode_set support

 Documentation/ABI/testing/sysfs-class-typec  |  33 ++
 drivers/platform/chrome/cros_ec_typec.c      |  17 +
 drivers/platform/chrome/cros_typec_altmode.c |  32 +-
 drivers/platform/chrome/cros_typec_altmode.h |   6 +
 drivers/usb/typec/Makefile                   |   2 +-
 drivers/usb/typec/altmodes/displayport.c     |  17 +-
 drivers/usb/typec/altmodes/thunderbolt.c     |   8 +
 drivers/usb/typec/class.c                    |  94 +++-
 drivers/usb/typec/class.h                    |  16 +
 drivers/usb/typec/mode_selection.c           | 529 +++++++++++++++++++
 drivers/usb/typec/mode_selection.h           |  49 ++
 drivers/usb/typec/ucsi/displayport.c         |  10 +-
 drivers/usb/typec/ucsi/ucsi.c                |   2 +
 include/linux/usb/pd_vdo.h                   |   2 +
 include/linux/usb/typec.h                    |   1 +
 include/linux/usb/typec_altmode.h            |  12 +
 include/linux/usb/typec_dp.h                 |   2 +
 include/linux/usb/typec_tbt.h                |   3 +
 18 files changed, 820 insertions(+), 15 deletions(-)
 create mode 100644 drivers/usb/typec/mode_selection.c
 create mode 100644 drivers/usb/typec/mode_selection.h

-- 
2.50.0.727.gbf7dc18ff4-goog

