Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5601F8670
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 17:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748365893; cv=none; b=WGIAh6skBEM+hOwuTZvfafiLBVWSYtu6j7Dp1keNswAZQcYeNbNcwmWEw58U7aLc1ujOTsVlI6Rdmvub+j+MBnGYUpaxUYxFShi/SI5fC16Sce748zlaqYzRYyRXyECBZm4q+oPIis4F+fOA/GAdxrQuouc1R5nGK+YTolzJSo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748365893; c=relaxed/simple;
	bh=BAHBdkQJKTMWjTYd1N7GqR6d4nnM047AWC8u6YKpT1g=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=bgL5Kj/Aiqf4UfKowG76C1byTfaIJ2acsgCURtjvhXFHp+yomuXroVrY55uUXUw5Y8vf+EWuRiLrAvQhgYIWxkecsNWEGD+U9VCa+/PbeuWzz5KMtkNn18SYPOLEoF1qXFqCFiY/TNRF/DDU4DUvRXm7yhS8gUgpuERdBvl4dKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k108hRjI; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k108hRjI"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2344f94f9e5so17480895ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 10:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748365891; x=1748970691; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/JvhhsVzxZpk7DMVkKHCJuZXnAATuH0obboMI/6t6mU=;
        b=k108hRjIrBfx9OLPw11n09lDC+YSvRwjhJi1UWs/xazNCvHvAPRUeZOSIkyxLclB2+
         47OuQK5kLKXEXJZPj3KXW/8SVMc/F4175JfDFsOux6vy7SMi5dAPz6Xwrcm2z1qx1GvS
         80OdXMWak0zA9lM4tBwAUgsmS8sbQsVBBAvxwPuVCBFRzcTUPM/lAP7nbOGqdVwnkcva
         nwnfjSlpBVQh+vIvHKPvBgblxiV0ulaiCGYP0IBOdawSFjVFb6ugnvIAdlIiFXD/iYTk
         XpMMEX4uOZQANsl8PGVMg20uHaovtUOhJLs+0maKbMY2zYDbnsBn3+BgZoiDM8vgxSCc
         qEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748365891; x=1748970691;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/JvhhsVzxZpk7DMVkKHCJuZXnAATuH0obboMI/6t6mU=;
        b=I+coPIL7pCVtP8707TA/6y3kBgr8FKAwLCBbmM1rqwLov4ZLsZtKN0E4QJArqqFulM
         K4bbbmSFjRnVHrhsCAtBILmZpYfbV4GflrvFnsH5QvHXN4AZvJVKFcKESVJm6pQtD3mF
         iZNsFQbgKhcy7DKMBqVRCATm68FmMNJxgiYQ4NoG/2URAo7FA08VCKQ+GYeG3lcwCMaN
         vMjZJvB0vezEIW16Es4QHnFzm1Zz6aeTFow/xoMJMgHvF8DeDMvOxs9RXKhBTmdktQMS
         M1fbZHU7+ROAGAGruV8DwcS7um5na7jFxLxeYrGuoFW8NdksLqxXjXu6UACsbx24mrW0
         s/zA==
X-Forwarded-Encrypted: i=1; AJvYcCVqy9uu3Y9q6W2cVlmSWlVWtVMa3bgNZbrUMEWvX8KTA4d9MXe1y0JRK3N/Ih5mPOuyijB/7Vq+aC1SVD0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXdAwsNinoKALKJNrdoKTZamLteoYfWrm4yiXDTYTjKOnTtE9d
	QA//UuzC+ohB2TFr5/XoeuHvF8QProlYyHI5CI2Q7AXjH+SJ0L+5nWgMdsc1/U3Yg0Yb0/aIfCb
	RmVBII1fCdtFYAR9nBDkR3w==
X-Google-Smtp-Source: AGHT+IFlObLHeHzUVU0aoa/6zQoHjEBLIMWsx/uXdkET+437ZwqTAGXDxMMkOl3bzunvlhVkDNDYu4RJDS5pvyYQ
X-Received: from plu15.prod.google.com ([2002:a17:903:368f:b0:234:7a8f:b8e8])
 (user=ericflorin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:3a86:b0:224:23ab:b88b with SMTP id d9443c01a7336-23414f48ec8mr186992505ad.8.1748365891579;
 Tue, 27 May 2025 10:11:31 -0700 (PDT)
Date: Tue, 27 May 2025 10:11:22 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1164.gab81da1b16-goog
Message-ID: <cover.1748365488.git.ericflorin@google.com>
Subject: [PATCH 0/6] staging: sm750fb: cleanup `sm750_hw_copyarea`
From: Eric Florin <ericflorin@google.com>
To: teddy.wang@siliconmotion.com
Cc: sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Eric Florin <ericflorin@google.com>
Content-Type: text/plain; charset="UTF-8"

This patchset covers style cleanups in `sm750_hw_copyarea` defined in
`drivers/staging/sm750fb/sm750_accel.c`

PATCH #1: staging: sm750fb: rename `sBase` parameter
PATCH #2: staging: sm750fb: rename `sPitch` parameter
PATCH #3: staging: sm750fb: rename `dBase` parameter
PATCH #4: staging: sm750fb: rename `dPitch` parameter
PATCH #5: staging: sm750fb: rename `Bpp` parameter
PATCH #6: staging: sm750fb: Rename local var `nDirection`

Eric Florin (6):
  staging: sm750fb: rename `sBase` parameter
  staging: sm750fb: rename `sPitch` parameter
  staging: sm750fb: rename `dBase` parameter
  staging: sm750fb: rename `dPitch` parameter
  staging: sm750fb: rename `Bpp` parameter
  staging: sm750fb: Rename local var `nDirection`

 drivers/staging/sm750fb/sm750_accel.c | 46 +++++++++++++--------------
 1 file changed, 23 insertions(+), 23 deletions(-)

-- 
2.49.0.1151.ga128411c76-goog

