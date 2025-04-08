Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82189221F0E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 23:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744154742; cv=none; b=E9DRzFd6oeOW8Q+M85+/Jx8AOpdjtvGjszcBMJJLU1iA/XygLoFAfkSVivAUffaWllyc84beH+5Q7nNUg3tVl1WN/54RNXC9N0lR/wUwfeznT07D7i3apoiQ4MWrPt3rHdvb5jPn2/K7KC1si/HJEB8rGC0rp5K3bjN6hlO5Vx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744154742; c=relaxed/simple;
	bh=yaG+cNw3thGzK/uMl7ZE2Fba3N0gTNuNWI1pEKzcOXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OZwP/Kwg2+pElMs0HCfhvzpcHX4GVSECWRI50JfmJoSvwIkj6OIWMF4GDTvMmJsTWVkZ+YwknysMYs+qgCkHwohZlY/CNgYLleK36BDfdLzpaNRz1Xygr4mwTolRygHfUfsZmP+PcXie5EGvaqCHpAlnM6ajv4mYslOi2ibdR2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=F55VCcMy; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="F55VCcMy"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ff6a98c638so6291729a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 16:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744154739; x=1744759539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QdaIenzsmWJTTujQ9Rnj1L0tl/QFO/K85i0DJLh7p2M=;
        b=F55VCcMy+cnhMtoTmdLumY4ABnI2lyS97Fw1jDAfDrYEh/NS5ZLogyLujSncliNyje
         Wr82YEgD8JRl3OEXmIsUtcah/YOHZbvl0iNYnnsUdsc88hwsIBPX5KPdE+wtYXb+vhb7
         Fwmdi+WrZbSQV4ZSLivRYpTw0cERqF0zIqdsTdZmB8YEbV06u2iIIcH3fQ1X4ZDWDmPS
         w63x6WFwKl70/QcnEnE8Q6tOIwGZShN2S9Ix+YiJ7tj6B53JgoiYsgAN/iyq8sCAnTqu
         D+07dBzkPmk8AIXl5RBjrWk7g9XFn8dC3SkenOoMVSiCt13zPrMVpOP0o0Qc0LsfWC2/
         F1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744154739; x=1744759539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QdaIenzsmWJTTujQ9Rnj1L0tl/QFO/K85i0DJLh7p2M=;
        b=txGdXfB04yOKyvhb5PwffvgfmJD4o5EksrMyiMI0TbHELoVOjbkEq+RXmW/E/5EFaW
         tCAy10ZQBjiiQ1XI8qZLzjnuCCV96S4xO1PJBPdvjEssMa4ZdfboJjmlVLsmQ6Q4w8AG
         RUEy7enI9DU/RzAMBZQCeJYqLwl4MG88FmzVugDdp7I7PnQGEN5cT5NInFm0wrnzgZ7H
         rQoiM9b+tpgFvDrym9G1ts1moW1wXezvldoUjNL8KcWmE8isFIeJMZ2vajtVkEU2cpks
         /sljIh/IvSsU7hb8cfnaA1StWkG9frFP7B7nph5ykbmYGGskW9/wkqhroB07E3eHc64v
         wgaw==
X-Forwarded-Encrypted: i=1; AJvYcCUYcBK+jett2QkXa4jqX2AvpIYzYExwA1oU1CO4eatIfUU6GIqDmBGnU6zadn8ZnTjXKivhjzUL4gLrEU4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMOgqapezJasU9s7j1qC3N9rFnzBtWb3bO6wJv3cTf35OXiGkU
	KwLXdcE4WBGW0qoLNx32auybLb7/3Zormt8FXTOBB2QC5QQ66dPi1JRy4m/9Ng==
X-Gm-Gg: ASbGncuqMOUuJcecn6OWRRVDq5SpbSl3jbf5t8koa+pr9tbwNCh/EVCGamZM0VnNKF7
	wdMwDP+0Q+Gs7TuhU+SuD4dKZDo5M4yNwl+jF6Tth5MinZLWn/sj6y2TG/wQ7JLSAefAf4ky+QW
	qeKXYFjrG7BzxX0fSx9kenLbKO0ma+QFKDRRMjILZugjeZn3UNuKpJsrqRf5QWiotGEQUYgnXNu
	gbo2Bktfl7qPaqXUzHWryr1+uuLLCjxC6V9WZ24wQnwT8ty7Ld9PbiAP5f3t0SiXPR7dOgz49uJ
	dUy4uYRbH4wRMdeU4guK29BIXzx073d+XBlxPbR7jKCkbDTkHNGlLxNcq1/VKaLX5H6zTuruO9z
	qgJ6Z1KyLy+Zuth0Kt7YI
X-Google-Smtp-Source: AGHT+IHdNvvZeYZEkWu5hl2Ax+3ZQOzgnn/I6tXchKkRcxPGcuGKRXDFSRdslYshlPTmMcdFAUw0pg==
X-Received: by 2002:a17:90b:2f0b:b0:2ee:db1a:2e3c with SMTP id 98e67ed59e1d1-306dd31f6bamr403489a91.1.1744154738672;
        Tue, 08 Apr 2025 16:25:38 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd187263sm142158a91.42.2025.04.08.16.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 16:25:38 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 0/7] staging: gpib: Removing typedefs
Date: Tue,  8 Apr 2025 23:25:28 +0000
Message-ID: <20250408232535.187528-1-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removing various typedefs to adhere to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

* Patch 1: Removing gpib_event_queue_t for struct gpib_event_queue

* Patch 2: Removing gpib_interface_list_t for struct gpib_interface_list

* Patch 3: Removing gpib_event_t for struct gpib_event

* Patch 4: Removing gpib_status_queue_t for struct gpib_status_queue

* Patch 5: Removing status_byte_t for struct gpib_status_bye

* Patch 6: Removing gpib_descriptor_t for struct gpib_descriptor

* Patch 7: Removing gpib_file_private_t for struct gpib_file_private

Michael Rubin (7):
  staging: gpib: Removing typedef gpib_event_queue
  staging: gpib: Removing gpib_interface_list_t
  staging: gpib: Removing gpib_event_t typedef
  staging: gpib: Removing typedef gpib_status_queue
  staging: gpib: Removing typedef of status_byte
  staging: gpib: Removing typedef gpib_descriptor_t
  staging: gpib: Remove typedef gpib_file_private_t

 drivers/staging/gpib/common/gpib_os.c     | 155 +++++++++++-----------
 drivers/staging/gpib/common/iblib.c       |  12 +-
 drivers/staging/gpib/common/ibsys.h       |  11 +-
 drivers/staging/gpib/include/gpibP.h      |   4 +-
 drivers/staging/gpib/include/gpib_proto.h |   8 +-
 drivers/staging/gpib/include/gpib_types.h |  38 +++---
 6 files changed, 116 insertions(+), 112 deletions(-)

-- 
2.43.0

