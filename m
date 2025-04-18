Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45F0FBF6
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 09:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744968681; cv=none; b=YWjXtM1Mo986kOwoN5VI+jTbZNiY+oo5/fFMwD/MOw93iJqruUjW3bsg8kdMATLIbQvzyKBh8o0rbk7WX6HJNrtlcUey9k+hWEMbyXRsDH4rIfOOp6t/gYjNT7qx2e5TAR7zn5CMkxcV2gVGvjELN6eMUJDF0mHipC4BeZyy+Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744968681; c=relaxed/simple;
	bh=35eYlthOzoCoyxaXhYS51LoC89mrgWwmbNDsYzxwC8s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MlDn1WkzsoDZqZpsyC5DC4fYNUIMttLvlu/TiD+g8WtWvjD5l5lM9LiqyB2ui7a2IEh1d9n4iCMnU+uSQUJ6ZzJQy3Y8U6+VtxOqkukrauepDQB3mrR3lb7D9mSjfPw8UK8Fwj4XCoFc/Gp809VbjlvqOrKX5vPV9Od0pmBmW2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Om8mF3Tm; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Om8mF3Tm"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso13349675e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 02:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744968678; x=1745573478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kmVZRcl7cqHTS3SFq/dUhCtlv0ePManje3rm68OnUn4=;
        b=Om8mF3Tm2zvSXqm/dA6669kyqj5CxW21hbFPe+AGraKrsHJPxH4x1PiLZlCIrsVTKR
         XMRc5RncvXLMt9UbD1NJCcd5KlTVTftIvxSFR/5+Lv8chdj0GO4H8ixUnqLomdTFe4+P
         6rf6eIWeNYSFbU66+FRncdul0vywVz0A8c7j19t3dsP+GL+3nIzjgNGXN4W5wyrIKara
         4BzrF/t9gsvTvZ3snWTC1z1aEDcYP2TIeyhSvKSO4F/zs+hu7R6t0LN33e8MOU0Ki+3Y
         X02xpjx5r4TQ1aspsi1AmfVKBaf4LZmT0ECJ2W04Lqhq+ZDD2Arh22GppbiXkUxE9Tbx
         mUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744968678; x=1745573478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kmVZRcl7cqHTS3SFq/dUhCtlv0ePManje3rm68OnUn4=;
        b=la79s+6QxEQxu42eQ0+fAM4YdNAYi0gnwmIqS0xKYmr/kTUP7yVjfSHlef58/omtuz
         JzdiRVG3zmQlt4ozkhWd6uiDxD7OsiDZ3872fW5BT/vsHREkqdS9MI/6ymHhInMCat+Z
         p8a53eajRbBiejmsERiPQJywHQXU6tzjpB/6DXAc5feTncqWyBgK1Qaw/YRFLjEJEVoF
         LvDnSgIejleJX8oGRjqgvld8aOQ1xgNHf/H+/TRidzNY3PaSRQ9zs0HsY6JXxpDxFpb6
         CdmbK7qWw3XBGY6LWmzoPk5QJL7sSkre3njyHdfppyDAX/gDwcSkm6Jd/6S3Yq7iHdRM
         Dp6g==
X-Forwarded-Encrypted: i=1; AJvYcCUH9I7+inRaL5S3TOd1vVY16Y6hdxd7lpuu5RrZ4jyi4Q8AJRqjj4f/CTyhTeZQOFMRB3AN7rYDLfKggzM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Ga4UuKYF+lGlZFOwporjpY+2MjlzVniIgIJKqpIhxZjE0mTf
	gGFzXoBkR6IIA6dcMazkYuQxuTEif/vC3ScK1jkgsh4Fw529yTKaVd6kAg==
X-Gm-Gg: ASbGncus9JFbGNjTjNcGos7rDv5ERBbvLYi7iU/3YEPg1DG8FIKs5gti3jVplSQjq+y
	O0zvHxjYd/GJzoi85P9BXGKVoqdOGKolKJe7EN+hXIwFTYenTcGLQQVVvVjT38zXx69hB/sByqi
	xx8ZlXoKlyM4uJ+MujWIxT5qqTNAf9Xj5qbv/4EJyJbzIjkcF50lBiHOHWv+QrBFnUmWPjDzkLu
	uV8Cnct91s/U8rgbdrbBaTZZtviVliQuOLgjCyNyyi2pwJ4vjJ7ZoDT7QBdS6txWDPoVzWp8tse
	+GyBUnliaU4+MkHakRj7ruDgaOpOZT8fY5gaGv5AD+lsHzXvINkn5E1PqzRTVul7SEWGw5GLq2H
	F5sb1V/0QTtY=
X-Google-Smtp-Source: AGHT+IEupr4/5H3YDxZSchyvSu0/QZXfQmk2lwlWupU6OWG5QAf7RG/eaPpiQUHJ7Q5pZFey+p4Ddg==
X-Received: by 2002:a05:600c:1e18:b0:43b:cb12:ba6d with SMTP id 5b1f17b1804b1-4406ab7ab1emr20798095e9.3.1744968677732;
        Fri, 18 Apr 2025 02:31:17 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5a9df6sm15599595e9.1.2025.04.18.02.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 02:31:17 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 0/2] staging: gpib: Clean and rename common include
Date: Fri, 18 Apr 2025 11:31:09 +0200
Message-ID: <20250418093111.8820-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches prepare for the release of the userspace libraries and
tools to be compatible with both the in-tree drivers and out-of-tree
drivers.

   Patch 1 removes unused enums
   Patch 2 renames gpib_user.h to gpib.h

Dave Penkler (2):
  Remove unused enums from common include file
  Rename common include file

 drivers/staging/gpib/include/gpibP.h          |  2 +-
 drivers/staging/gpib/include/gpib_types.h     |  2 +-
 .../staging/gpib/uapi/{gpib_user.h => gpib.h} | 42 -------------------
 3 files changed, 2 insertions(+), 44 deletions(-)
 rename drivers/staging/gpib/uapi/{gpib_user.h => gpib.h} (82%)

-- 
2.49.0

