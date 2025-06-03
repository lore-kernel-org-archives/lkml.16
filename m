Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EB75FB95
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 18:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748976227; cv=none; b=pJgY/e+oG4b3P0aDzAssDKETr/5u4cNr2MzDPx7zYVsZ3Et2Upv9xtnyXyXnHyQgDbMXUUpw4ct8QA7KfYQc5tf8Nag6FibS/aSOEo1RxFU8LXgpSSBxyDLO2ZUxFhqKx8qQDGp0qGE3yMYmFqB6veX/BfCUGixhPDCjuRGCJb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748976227; c=relaxed/simple;
	bh=7Na7b9d84asEMVy9YmX0919RZAM/FGgd63S0RP/e3ms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N73rO8BX7+jN+mtIlNQI9LkNj3DKonL2WcMRmHVo+kz2xnfbLpWpxUCrGbo/nt7fyu0mvM/NnzbCr487tcaoZuS1kC6loRCYQ6A7wSpGdoYXDA2JYp4iVw2Xbl/YwjAd02KMPRySg3Eg/d+rf71eyXiE9fkHuIGBcizKKuIcgv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d3WMwHOw; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d3WMwHOw"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so66500305e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 11:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748976224; x=1749581024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HAejrhDDtmgE851HnjVtZktSKnnol5evwViP/UzrPXE=;
        b=d3WMwHOw/vJ7GQvDxppLbUWv/vYuRwiSgvTigw1c1fVy0G/tUeurkWY3LBsRlr2XQz
         8NavqC50PxgWCsiE7cyJaYjn32gDzDwt5nM8DMpPkmFrViENqgDtBA0V1NU0gLUio7co
         vMLk4S1UkzF5grBBwvVW+YeiEfQTBn0zbEGtZMNlhNSmBFS0pvn0rjMwHYk/e2Fi0u+6
         N5QLOQcqD3WypWJq+StZY3o+lFm2iI2Wka6zgzYyrBcCQrH5u4QysfEsc6teVbLE2X1/
         AeKvfcZ5wKoe+sIO6Bps1HoEEYzL2r8Z9Bm0OpzaM9kvoDS4CRqJz2bM60G26vlkg6NV
         V6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748976224; x=1749581024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HAejrhDDtmgE851HnjVtZktSKnnol5evwViP/UzrPXE=;
        b=fkUVd3OIGvsLsbhXqVn+a6KzDxXVEvPhLDRL29/PbdiR/xWn/ZTvOmB13NJnrjxzpL
         8KRHVl9x7bk0baKq2l1WQj8GPgPPzJgyLTWjqg6SwG9/eKGc8qPyxY8KNQlyDu2a10UN
         oM3tiELec3yuW4/WAA+Kyj5vNJffaR8Eagqr94OnkyMxYfSMVU9Vq4jr0YzIZ4tjDmUX
         0VbqcCAeDqqWS1UgeX7B4PVXFwzF/6KPjub+4WgGYkWDJ+GXnxzAnJ3bhKul4LiBu6l7
         i8coHb+513Q9dgpkWTQW1+QddNXHvPo8NywNsGxtbYAGnBWh+pkqPYVCxqofbIM5abXO
         QBGw==
X-Forwarded-Encrypted: i=1; AJvYcCU8epa+/j9MJ2qZvsRNmGwGdNf+nlYZlWF8S7zayITzXNilIGQdGmQkZ+qDydigMsMZJ3LJvdIuNECkW+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJELF4i6jjKpUJOyjfz4XKVNt4Eg5FqRl17lUGjl97JO6KUcDA
	MzLeRl65gWpY0vepXlRSC/SL7hMwLdJt4cXWgDH9XH5tkyd18O5i6xXcMHeSoQ==
X-Gm-Gg: ASbGncvSeFcBwdzz9ctGDaDgpsLSuhOUV1j9K0DYEu0n/bohGqp2pLsK080fIId+3TC
	rBun93knlMpE9/6OtbhPUDHGvtwWDHVnI7uSHcSSnMb8t+EjsDoULbfw629fXom7aM8pAFtwhRR
	0WIQ0ucHneBbnVO45K8rpNBNnTtWflZQCF1V8xhxONz9Rbfc/1bEiW+Pb4vU3jBKp6VlWVJ9jHW
	ly/LwxsNd63aqEo7VJOWAkituCauzbkZ3cSwOSbIlNA4M9s4tkSnQAfPAQY5MyXtBBpoQ9GCXjP
	CaVsbQe4yzSZ6WIKggnBN+iPG4SH5Jje+uhbVCPqE/QS6DkUK27BXjxTvM2yhjUX2O7rByyBqSX
	xGFRNBg6wk/fcGWHW4MoKGA==
X-Google-Smtp-Source: AGHT+IGhUxsMTNkPK/YNFAkbTdGasswJqXFYgHcYXwpWeWUAPQYObmMMIw6jLjlW8DdYPzjSdA7bcQ==
X-Received: by 2002:a05:600c:1c8f:b0:450:d61f:dd45 with SMTP id 5b1f17b1804b1-4511ecb8920mr131690865e9.4.1748976223839;
        Tue, 03 Jun 2025 11:43:43 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe73f83sm18449959f8f.49.2025.06.03.11.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 11:43:43 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 0/4] staging: gpib: Clean up uapi include files
Date: Tue,  3 Jun 2025 20:43:16 +0200
Message-ID: <20250603184320.30594-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch set addresses a number of issues identified in the
uapi include files.

Patch 1 - Remove enums and functions that are not needed to be
          exported to user space.

Patch 2 - Add removed enums and functions dealing with GPIB
          command bytes needed only by the kernel drivers in
	  a new local include file gpib_cmd.h

Patch 3 - Convert generic types to fixed size types in the
          gpib_ioctl.h include file.

Patch 4 - Pad bit and byte holes in the ioctl structs.

Dave Penkler (4):
  staging: gpib: Remove unneeded enums and functions
  staging: gpib: Add local include file for commands
  staging: gpib: Use standard size basic uapi types
  staging: gpib: Add bit and byte padding to ioctl structs

 drivers/staging/gpib/include/gpibP.h    |   1 +
 drivers/staging/gpib/include/gpib_cmd.h | 112 ++++++++++++++
 drivers/staging/gpib/uapi/gpib.h        | 198 ------------------------
 drivers/staging/gpib/uapi/gpib_ioctl.h  | 112 +++++++-------
 4 files changed, 171 insertions(+), 252 deletions(-)
 create mode 100644 drivers/staging/gpib/include/gpib_cmd.h

-- 
2.49.0

