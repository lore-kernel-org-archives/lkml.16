Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181D0270EAF
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 09:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744968687; cv=none; b=Ue/nfrxElrNcJxh96dwcHHtHXTq8mIV1BkK0MO6Ae90JdBSf8nLZxjd1IyJdFyeYy+l3W4EIHBj9pm9m0h/AI0OfdrGX0CSw4DekYBsL7dcJYFwlTx21WPWRK2M8EkduXk7LCioaLPbWshnbuBsKBbDi0JfpnhBu5+IGjYjcP34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744968687; c=relaxed/simple;
	bh=bf1QPLQ982jUYGjff53G/vojBk6fxXpw9Om2goquwfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B49PbNpyQpgGgQser+tJv7MJfsgnhP9C+1waUsSoQsgC51iXMFlVgLKS+UMfBRf7wG4tPyIjsJLRaFVOoDA7ejqGbNln49P3RZ/+eNKhHp38KsAzCxDEfL6W5Bo9X+9v1nhN89PqPp35Fzz8hRMJeDHpoNX+A2Nh1rwbf61FUPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WAbk5uRG; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WAbk5uRG"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so1826255f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 02:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744968684; x=1745573484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ziEWnqr68bl6EYzUSY5rbxDyqDTwrndaf3K3nBdL2T8=;
        b=WAbk5uRGYT491nzJbvjONoPPwYdOxJNm4/LkED+0WHHg7rrzdJ3CJDAiLPOpUljC9R
         AMjZyVkDPe+SWVRX8SvEHtzeju3ilXHR3VR6DTV14LMoLjQRvEWy/5ZStPNjfAwmIvoy
         kT5LnD0jl2O+F6sZo5VqZlYUG8Q1uW0RVPaLaEa3XYqf5IdOrusHOQ6GCd8p4e7Ujlpj
         HHBfikQmTZ6HSf0goyefzKmKAeVj/Xw1LXh8+D12mVY9CnasSqWB9DKwoZCupvehuBGv
         CzcsqFXcs4qdn9tMKItDt2fLooTnJGJkzuplEHquOUlX0g4rAFlUcJeV7EB2yQhCTq/t
         Gnzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744968684; x=1745573484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ziEWnqr68bl6EYzUSY5rbxDyqDTwrndaf3K3nBdL2T8=;
        b=hvqc1ydTJwHy/hYIVNXv6CkPA79pbnuQrshSZ3aEkd7kh+3CjxDqxOZ3dxYXyFwCie
         qnJJEaabprUEPb/7NwiMRaYq9WiWsuOy5XOzDg/waYdPQ1v6yciIS1qV9tF7j77pchIB
         rdZvL0zLZHdNFF+IdCl7T1PF4Xbnzv7meL53ZkxVt73unGiTQzhLDNUS0OxGtiyGi9fZ
         WGv3s/Z+r+DFSteDZcAC+OFWTXtb2TBrbdeS7YrAf5HV6XxAsA9Tr40IClc1WC8ct+dt
         4g/1zTbqEqtkfN73cdYM/HkYcBjv1HwG86m/xbugZ1H+advBXeed55kndywmMdkHesz4
         GkdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNvaqtCMGNJcPQMpudvAGmgzQsu1gnFtsVu3K0ScvMy7wA2XEpg5dmMyLjTZUOJ4mCZLPICVCwo9heSyc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVP5NI66FTPm2Mfij9K6vqU3Algl8LY8FCOXjMOMu1wtFPDZuS
	kxqd4NtbzuQ/6cUJBPHW1Jyk2SUgSre1rzWJc5TjDJDw9o0y5FuV
X-Gm-Gg: ASbGncvXo5PIcuo+okDRQKH24kkYFUck/bevo9b5XHvGCncFmZBZOANAmC4dwC2BMDU
	Vl12oU7YS3HnMudHubDn5pupbBnOpc3GHaw9TzlFntyAeg71nhTwbRUwidK+FGGfWtk2u4hNjJn
	b6JfEW/ssYacbZ99hvCi0lZS/QjVtrqm0PCvMgAED+F4XUnPAtlfiDhbf0/xjTsxDP4z7sZMTit
	BEymkw2KlzzwIMMr135MNSItavmZXjlxO2CnbVAsReQb/KXqYGUHMdQQLcFo17MfSc6czUZ+9fd
	m/ELVg76AMvtR9vHLvtZesxKmi1Ft5tte9qki2b2fCADhzjMx58r2FEFX5NoLKdimyR0MajmvFC
	o
X-Google-Smtp-Source: AGHT+IEkgWk/w496CaaXwuS7ubgZL54PSfX59h5yXTZtwL7fxskSCMm62/oqb2JCKljM/a15kDDOmQ==
X-Received: by 2002:a5d:588b:0:b0:398:fd9b:b935 with SMTP id ffacd0b85a97d-39efbaf6f36mr1633392f8f.53.1744968684326;
        Fri, 18 Apr 2025 02:31:24 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5a9df6sm15599595e9.1.2025.04.18.02.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 02:31:23 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 2/2] staging: gpib: Rename common include file
Date: Fri, 18 Apr 2025 11:31:11 +0200
Message-ID: <20250418093111.8820-3-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418093111.8820-1-dpenkler@gmail.com>
References: <20250418093111.8820-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

User code includes gpib_user.h. Since this include has diverged
from the original by
  - removing unused functions and defines
  - changing camel-case identifiers
  - removing typedefs
we need to change the name of the kernel include. This include
will be included in the userland gpib_user.h ensuring backward
compatibility for application programmes.

Rename the file and change the references to it.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/include/gpibP.h              | 2 +-
 drivers/staging/gpib/include/gpib_types.h         | 2 +-
 drivers/staging/gpib/uapi/{gpib_user.h => gpib.h} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename drivers/staging/gpib/uapi/{gpib_user.h => gpib.h} (100%)

diff --git a/drivers/staging/gpib/include/gpibP.h b/drivers/staging/gpib/include/gpibP.h
index 6461b330a3c3..0af72934ce24 100644
--- a/drivers/staging/gpib/include/gpibP.h
+++ b/drivers/staging/gpib/include/gpibP.h
@@ -11,7 +11,7 @@
 
 #include "gpib_types.h"
 #include "gpib_proto.h"
-#include "gpib_user.h"
+#include "gpib.h"
 #include "gpib_ioctl.h"
 
 #include <linux/fs.h>
diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index 9e0dfdb9904d..2af4574d400c 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -8,7 +8,7 @@
 #define _GPIB_TYPES_H
 
 #ifdef __KERNEL__
-#include "gpib_user.h"
+#include "gpib.h"
 #include <linux/atomic.h>
 #include <linux/device.h>
 #include <linux/mutex.h>
diff --git a/drivers/staging/gpib/uapi/gpib_user.h b/drivers/staging/gpib/uapi/gpib.h
similarity index 100%
rename from drivers/staging/gpib/uapi/gpib_user.h
rename to drivers/staging/gpib/uapi/gpib.h
-- 
2.49.0

