Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C825C19CC28
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 08:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743756676; cv=none; b=QdH2iqxK+8SnUiECNWwPwD+ZAIwg4bcqs/drPHK+ucwnqolFhBkyr3s/mWvyTqdMUXH72FoMRnxD/k23ABKJHTkkTQecYrUPnqtTOfy7i3idnFXqgjfnicW7NbB/iU24SfoQm+4vBRxWFGVNkd1k/ji5/rBIf5vQjYCf1GkUVj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743756676; c=relaxed/simple;
	bh=lngRN9nvGxLhQV9TVsFmrrZpgQFhZKfVPpdORrbJOEk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tKv1X9I+YLxjajZzErIEoHIXYEBJFLegK/AFrLNmrYqOOVsWnBhCoeRKDbxRt+Sa5VN8lDCRNa7i8mb5ZJVrcFSsV1y/C2zVk9LH8F7+xj+b3f70cpgqLJNkP417hU2y6sgrDJI2nlqpfvaBmcHZqhilwDa1+QCPlyFQ4yuPG/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I7NJ1lD5; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I7NJ1lD5"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so3221388a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 01:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743756673; x=1744361473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4CojFgjAzP50elq6TWRr9b4r5AbCg0Y2Qy9bynVTKdw=;
        b=I7NJ1lD5lQIYe7CbnXxvwzeJj+u0tF8NpR1vf0g8JlRk/m2g/1ghTd6iMHX6lbOR6u
         mYVX/+a9oynr0Q37mCnvZJqualZNPfPTdvl3+PR844jMFBAvwORb1HOOCVlcnBKQXoZq
         9nyACpi4o5D/oF5Aaf6FRrbWsrIp9HYh1M19Vy85sgJLVPiESACVOcgaaFDlpvDMDs+i
         zc1tQatF4OKWXoBhKoIXPLMOPX91KMNYXc3eumLccc4maD2FYjvVyKr3JHvEVUkCUDAn
         E25NIWXx1RbZvdKA0WUqlWlhAqWc575kIqEcZuhfqv6DlOgXTb1cNqHD5KZVztAQabOL
         N7eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743756673; x=1744361473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4CojFgjAzP50elq6TWRr9b4r5AbCg0Y2Qy9bynVTKdw=;
        b=hpsoUGTpSgXUa6cnHMBLuVaqKphlnJQoPyeE6/NXp/z9QX7WoZh1cMlOXuOU2TjfYB
         csLYvu6xOs4R/dUlP492RRnnXJUwMHJQqCZ8PaH7UcXnRkrwxTneA2/xWtjQKQW0wDOo
         3C19AO68UapaA8sX3U0kHO5a3xzhHwdzpsz+IROqRLgopdFZrjac+IipUJEFw4dbF6Jg
         w1F//AQLJ+vVCFuj9RPt3Jl2vz+ETOdLJpFd7HoxAW6IXHc51gSfSSa6+gwG10u+eDmm
         dAPPnQlc1P3VCqPUSTvROBZpxW0cLzwbrau+NzJ6+g3982/dTBTNrNS+FMd5q6irNGvK
         8sGA==
X-Forwarded-Encrypted: i=1; AJvYcCUqtDPT9BLHZ0j1lmiYRvl8QemoXbGFvSXTq9PScAqovp52fNd2xSY0OzsWfa2hIIxhXUWic7FREh03f8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHCBwEqzUlUIdMFNAFc2iQu79hnoiG7yBMcRmK7j8MQihDe0DW
	jbozR7u8yHSNLKQsZ9Hr6mDmHYA5VciF/El84oxi0goWegM6j3OH
X-Gm-Gg: ASbGncstL6/WYd8IVk/zD4rtPg9gyDcBl9EfF9jcqAaBGfl0RKbDTkHdEnQwl1DTZfW
	ySAynmWM43QZvvND/sUDAuE61ZYI9Bnsex5OmpjjH5G9hg12Jsl+YmjdDHWtV6WgBWYfvTk+LgW
	Vth47W9jpM+t9vNfh5pJycc05VspxtqYzZCeTWuhwx1VQjsrIT2/oYBEYr8sFJLgFdjUUikpEGR
	Mkk2O9K8+SZh9ZlDkRqwAES2sblIcgaSRa3QktwF887qzwS08tDGuuZ3Xdaxda5+dihkA+j5+p5
	8K2nXc7SqZKQQZ18Qbw3O9Ju9qG96tIkmj3ZwK/SCjGdcdnc
X-Google-Smtp-Source: AGHT+IFjVi/bcMPN485Ss8hZ0/3qEWIMI8fnouefKu2Ht7IdYo1Va+g9peAmMnxiZI6LEIilKgFZYA==
X-Received: by 2002:a05:6402:278e:b0:5d3:cff5:634f with SMTP id 4fb4d7f45d1cf-5f0b660b98amr1432310a12.24.1743756672629;
        Fri, 04 Apr 2025 01:51:12 -0700 (PDT)
Received: from HP-650 ([105.112.123.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a5204sm2042952a12.66.2025.04.04.01.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 01:51:12 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev,
	julia.lawall@inria.fr
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	andy@kernel.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH v4 0/1] Unnecessary code cleanup patches
Date: Fri,  4 Apr 2025 09:50:20 +0100
Message-Id: <cover.1743755621.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patchset modifies unnecessary duplicate NULL tests on a value in an
expression, when the value has been NULL tested in a previous expression.

- Changes in v3:
	- Changed other cases to use modulo (% 4096) over (& 0xfff).
	-  Modified commit message to reflect these changes.
- Changes in v2:
	- Dropped patch files for media drivers from patchset as it is
	not meant for outreachy applicants.
	- Added full-stop sign to text in commit message.
	- Made code more readable by adding a line break.
	- Changed cases to use modulo (% 4096) over (& 0xff).
- Changes in v1
	- Patch for drivers/staging/media/av7110/sp8870.c and
	  drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
	  is split into two different patches in the patchset for use by the different
	  driver maintainers.
	- Added subject title for each of the separated patches.
	- Patch 1: Removed unnecessary curly braces {} initially inserted.
	- Patch 2: Unnecessary {} was also removed for v1.

Abraham Samuel Adekunle (1):
  staging: rtl8723bs: Prevent duplicate NULL tests on a value

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 58 +++++++++----------
 2 files changed, 30 insertions(+), 30 deletions(-)

-- 
2.34.1

