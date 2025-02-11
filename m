Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5461E26BDAB
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 16:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739291059; cv=none; b=rJQZOY5zVwqoHNPjuN1DN3T54UUt4EyrYNjcjf3wDf17687KcZEBN1jKZOSi0F7BASv/9GO7MLrVNWvdMA3Wlj/yG3RfKXbMvDBAVFrnyh5lC0rRqiPUvS55SWyWlsxYowY1ryDck/gzxigZ9U7svm+egmKb3z+j/dNgME2+Sc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739291059; c=relaxed/simple;
	bh=OyOPFVp/Nt6RR4/5BdrueE9wCXeRre5brIic17c0cUA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rr5Chs8iHfMKUxVEbORuKxktDWuc5v/VSxP2kh2b/GLpHlHh7zKNq1XpEnRC6Rls3llE/4pkwV8PKvX7baA0OjFXC/iC3U7bjdeNtHVlR6SpmgHMr8P9LB3qsUCEkY0PRihXl1CgEcOAhA1mT7pA35ZJ8R4yEFlCswABXpDSZYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OIy1XOxB; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OIy1XOxB"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21f0444b478so82325125ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 08:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739291057; x=1739895857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aMGuYuQ0Y+vam6Iz2PYQ4HaOw2lXym2EDG2tN0GCNkc=;
        b=OIy1XOxBN/M+ZR4mchd/MjpqHDbRo5Ew/4TKeFn35P8ucd9dKVv9XnoypHNRL9i9qH
         w3JgG8N3AOaGnp1YgKTVYje/oC4YAv/gEq4DCPcMtk5/D9hdQ8vBpDWX+fbbtVWdZwO7
         W+hYIXF2KXwqKeirgKa++7ep8/RUlSDrHDf61kVte/4ROBcqo4Mj2DQ6nwMrAYTldwJ5
         TGzKgmhGZTjDFCM2c+ErAN78m0CQydjkivxVX0ThdWAdc/eHIMg+9XUy6Vk3xYeu4DS2
         inrrSjcgCZwOTz0RY0dzSiBQBlrQVIqUOyfgzABkxxJFnLcKVOuC23shpRfotoXvmo5o
         MWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739291057; x=1739895857;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aMGuYuQ0Y+vam6Iz2PYQ4HaOw2lXym2EDG2tN0GCNkc=;
        b=PztOvXz5A8vYRVp/M8flahnyaPAzA+WJpwQ1f/kTn6B5CkuE72vHnnsR+WU07yqSg8
         QkkhqV8yyMJYb3oWfmU2mliwQuSs+Rjcm2h+e9YfClUti+eRgqqUDU5QZDvuKfZqlYAv
         LPuBAnnDxOoqsu+vaHjIdwUfaytWCBr2aHxZGfKYaKitbVtvHsxkj5NOGEfkjhHON5+v
         urrRqIGKUSNpPj8TRbkQELoOr5wKarbOl6OmqbQ77xph+hIQrlgNsfqGxEy1IsKDY4aN
         hMvkc/vhvAgojl0YvABt6tWPKmFV4dkeXI6yEOcTut+XHih5e59ReDmmJNkpvQaGLTz+
         hdbA==
X-Forwarded-Encrypted: i=1; AJvYcCXwkIVmcEsOVKW/214aQUgbqp4gK6qOts077LWFTRx4NGF2EGC7hlzk6nl+V5+szyUWJ3ofYCv3BeW99Sg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwU3EoHgUb5b/LeTv+EljbQurtcYVoy6j8LZk4gLLsPO8HWKus1
	RPocz0torpHhJS9DdVAM0L6UIIs8EnCRWyOs/qqrQm3iIfkmMjTIZKf/aiJa
X-Gm-Gg: ASbGncsbSnK8ToFcSeUwwVnXXP2LFoRZ9f7oQbPia5EJ9d9lgQDYYzgwBCqMoNSiUp0
	erW1z96b+r6VapjTmEA+PxvGSc8rJvQWL4HQkLOwg0QlGf04jm7ecHPz0INz+/18p49vtFds3Se
	4/jPf3g3097F+6mFghYPny9kbgOs9Bq/UUjJ8xCXDd4k1ga1lcPhoe82TB5Kfcs99mxcPnJPQf1
	mcG1TGPCwxubTjk4tK41Bn4gx2GD0JLoVg6krxrwR6GbyT5pGpxLqnR0f458FsutL7OpAxXvqYg
	LgukIR8acR/gQO2eTMcUlBaaAV8I7Tl6k54kqbQ5gamu
X-Google-Smtp-Source: AGHT+IF8/SZkwkHULreTwIkrrhsne6AFKASijffVAvsDuEJZxMagh3mUi28qJJZlqKx4S2XIpHUSPA==
X-Received: by 2002:a17:902:da86:b0:21f:4144:a071 with SMTP id d9443c01a7336-21f4e759f4cmr328161895ad.40.1739291057463;
        Tue, 11 Feb 2025 08:24:17 -0800 (PST)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:e985:a3e9:17ea:8af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3683d5b0sm98212385ad.109.2025.02.11.08.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 08:24:16 -0800 (PST)
From: I Hsin Cheng <richard120310@gmail.com>
To: yury.norov@gmail.com
Cc: anshuman.khandual@arm.com,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	skhan@linuxfoundation.org,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH 0/2] uapi: Refactor __GENMASK() and __GENMASK_ULL() for
Date: Wed, 12 Feb 2025 00:24:10 +0800
Message-ID: <20250211162412.477655-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series refactor the implementation of the macros
__GENMASK() and __GENMASK_ULL() in order to speed up the operation by
reducing the number of instructions.

All the changes pass the unit tests and have used bloat-o-meter to test
the size shrink for vmlinux. Performance tests comparison are list in
each patches.

$ ./scripts/bloat-o-meter vmlinux_old vmlinux_new 
add/remove: 0/2 grow/shrink: 46/510 up/down: 464/-1733 (-1269)
...
Total: Before=22438085, After=22436816, chg -0.01%

Patch 1:
	Refactor __GENMASK()
Patch 2:
	Refactor __GENMASK_ULL()

I Hsin Cheng (2):
  uapi: Refactor __GENMASK() for speed-up
  uapi: Refactor __GENMASK_ULL() for speed-up

 include/uapi/linux/bits.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.43.0

