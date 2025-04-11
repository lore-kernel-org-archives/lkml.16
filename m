Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2E11D79B8;
	Fri, 11 Apr 2025 14:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744382218; cv=none; b=UPqekO9vDCqGjLYNYjP+sX37CYViWpewqV4VYKCPARVKp285AFJxYOvQAkYm9U12GAXTYRB7BbO8SNyYBVaNBJ4mG5lSy3tT7qVpZ3ckk6vOYtBvkGCXDvL0ioQ7L2P/Kh+RKFrA3Qwto1enIdUr/r1kW+REdT2V8KFLpCVROqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744382218; c=relaxed/simple;
	bh=MDMZyOrDI1AJ1Ze12LYcqz8KZ/LNZ7rG2FZPC6LCaNc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fQIHlNQd9mnNG2OQt5pQTDs557+bN1P6Yg6mhbhCAh/R/CZYKLghEqhF1gQJIz4H0F7q3Jghf6Lmo6Q1OLqGvnii53dZ0OyxCZQh7hHhdBtqyyyi2aQmOvcLpTJ8cF9/6rWIVEyuYJzMt0KRsQiYYd8ovvhyZ+M9IXQz3ThdgUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XwNH3FDM; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XwNH3FDM"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-879d2e419b9so1817331a12.2;
        Fri, 11 Apr 2025 07:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744382215; x=1744987015; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gw2dO8vS6OgIF2LvBFKNBF2YrfGqh6ki+p5neWQ9t0Y=;
        b=XwNH3FDM/3bsSaDK4ZJc2oUq/sjuIAEH/kPM0zZiql8EoY0OlZDFDRemDG8oWSUP2z
         YwBDPXO6A/4h8HXYG22DwnF26USLzck1kK0rWlo1cW7jA1HLkXJ0T1/uHQ3u4vlzAF17
         jTxOTqmza3hzVx95MLZeim79vHFXMeczb7LQFsT14HEk35xhlB5nxNgGq3W6SGndgCi2
         LSA4bVu2W8IOy5hcmno0mnLji7NbJz79s79HQJYL0G0RCBFq//77pEzj9Ig0Ig4dy9dS
         NVcwC4EyXW6M9fICpP+eaGmuDHJjFlugZGRbbnem+aFO7erAr+4JqqF7g/JnGsgl2I0d
         bpxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744382215; x=1744987015;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gw2dO8vS6OgIF2LvBFKNBF2YrfGqh6ki+p5neWQ9t0Y=;
        b=RidSKdakx43o+Gty6ZlW3/0I2g9Y6KV1POLiekzeXY2elwSO2TOeF2GvYm3wshbame
         gRa2rFfZAxPVE0+0fpb5Di9UZjmc7zAX81OZfeFDGTDkVzD2Eos1h1iF8HZ3rZGXmpGp
         ZCovYE5XfryP9gLBb2SPfftHQxAZCeD9LWy0ITc+VGt/ciPcBtXIzz6PIvUKM91lmF3S
         13+4yPBW7/Ws0KarDyYwINdNwBWYD3hk47zIX3hXqjSTAJRljzhstBZZMwzM6XSpMxSO
         HOL2XXHAI/2fhb37ETcCgyMq7dR2DSFlRfLkybps1PAWsCXtVLCvg3Qfl0R29bnRNzIL
         W4SA==
X-Forwarded-Encrypted: i=1; AJvYcCVjtbkIHCgfLMo6u6S9/bT/fZqo6p+EfoDXnUiAMxP8i1fopw35xVSLJjYJV+61OZtVYZnZv9gmlb2JRQg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+0lvoN9mk8brb4J0fIGDCkhDPk8wRXOBiZFPc0egEn1jhyVJ0
	02SDmP8mdlARvzmqMfzdbm+LH1qxiA0cqd4gmcaaJgN+SKU/Scg0
X-Gm-Gg: ASbGncufuD3qza0tGjrH7w8cOruFHINpnUYN8a6dbMB6RJmFq1b0BZrV8cth7lBx3L1
	j6pJ9YUZProQRC5U33wfAf6cGymAy/BoUMSglXx2xAMbQ5jjxTlKBHCI0J1dUBkU188am4Rz6oD
	JQ8nrbXqwGX+iJ947IYTbKP3FCnEzjQXK5jv/0BdTXfqNjM6zNQRUyHshB9g4tuxyazQHIL/H7s
	eTVAGhAKDvXuKR5/5Q1lbzrN4XQ7TJX+2867g6dqfgXag8PcNvEeXuzObReZzc51XFF9IW1oevK
	oI1UFlFoemQ0NH459Y0jzLuMFHov5+4LdxsPiiIv
X-Google-Smtp-Source: AGHT+IHuejsi8XeZLddNc0+AGQbP62F+n4HF023AKKUVHKsJERbvM3IWwYHT7xFCw4t8bAwZk0BLjA==
X-Received: by 2002:a17:90b:5448:b0:2ee:b4bf:2d06 with SMTP id 98e67ed59e1d1-3082378e686mr4379078a91.19.1744382214834;
        Fri, 11 Apr 2025 07:36:54 -0700 (PDT)
Received: from [192.168.1.26] ([181.91.133.137])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306df06a14bsm5630754a91.1.2025.04.11.07.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 07:36:54 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Subject: [PATCH 0/3] platform/x86: dell-pc: Transition to faux device
Date: Fri, 11 Apr 2025 11:36:40 -0300
Message-Id: <20250411-dell-faux-v1-0-ea1f1c929b7e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPgo+WcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYyNz3ZTUnBzdtMTSCl1To1QjE1NDg0RTcxMloPqCotS0zAqwWdGxtbU
 AcSyOBFsAAAA=
X-Change-ID: 20250327-dell-faux-52e24510a574
To: Lyndon Sanche <lsanche@lyndeno.ca>, Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Mario Limonciello <mario.limonciello@amd.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2

Hi all,

In commit 

	35fa2d88ca94 ("driver core: add a faux bus for use when a simple device/bus is needed")

the new faux bus was introduced. It was designed for cases where a
module needs a fake parent device.

When I saw this, dell-pc immediately came to mind so I wrote this small
patchset.

Compile tested only.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
Kurt Borja (3):
      platform/x86: dell-pc: Propagate errors when detecting feature support
      platform/x86: dell-pc: Use non-atomic bitmap operations
      platform/x86: dell-pc: Transition to faux device

 drivers/platform/x86/dell/dell-pc.c | 67 +++++++++++--------------------------
 1 file changed, 19 insertions(+), 48 deletions(-)
---
base-commit: 70081121e24cacbef8b3be849cc13bea31f8a158
change-id: 20250327-dell-faux-52e24510a574

Best regards,
-- 
 ~ Kurt

