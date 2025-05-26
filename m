Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3D633991
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 15:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748274584; cv=none; b=mhK1VScsr6oJ5t3d8gt1a4Q2tDGR3jOp0T6cvhjcx0ZQUUYotZHn2qLDXPj2dtDbBiJe0E+xD5WmDze7IeOjzIR84mKLjzk/iTjR+nZfOaIZ7YohcjO0w9qKomMTRetFgTJkHrOlHtL54IhHdNdtf+eMxvKBxgGrYFIfMFqQrkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748274584; c=relaxed/simple;
	bh=VwZ4kx+tXYYa5loZ3PK7z3hK3x/IufSOURYacjqHQdg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=oUXNZyyEbNeqjUXkxzH9T9e7KZAnC6ncmKks0nae8YrhGuL5wJ949bCiEOIi8+wPQEwAKFm17DIWQreN9O1pXOhoe2tK0U/XOvq9ju57u018TTNbpYd+BF/W/SwYQuLNLzLlc1KUBp8Zpo0YUVWQgzuHVXK94DI6bkS3kSByVZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VsxnybnA; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VsxnybnA"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4e1432aaa68so1616073137.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 08:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748274581; x=1748879381; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VwZ4kx+tXYYa5loZ3PK7z3hK3x/IufSOURYacjqHQdg=;
        b=VsxnybnAveTuAnk61KssPKMXDy6L5HE9qh2VNVAPT3JE5DR1w1kJ+uMma1sqUOdfse
         rHeUAX/m/Vk681COUsxqN1sTDbPMNhGF0/0BLjNkxuXCwxx5KAQ+J94jzis1Suyq1Ytv
         UYHzTjxPS51y54OangTu0lovMCdx/CK4guI5z87OZC4dqX+fkF1vGrjFSW0LZ69YXshJ
         lw00Bzsc5Er6bW5AMoVQsaFgrh4CkxU7EppbOue0kFBJhaC0bCyHqCyGFJvAa7lsYOPb
         dHoKVj6qnJsrB6mD2B9bg7jxUeD1DLeF50pudB3c+Zj1BtAxipC8KDNKub3EWeQKQaAA
         jrrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748274581; x=1748879381;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VwZ4kx+tXYYa5loZ3PK7z3hK3x/IufSOURYacjqHQdg=;
        b=CbVPhvxfBs2gWW/rJ1rJKIDs1KmXzj6yo2ELmj9BLOm/iLlqTkzOJWEciuHTuHm3dU
         tuLMxw/8q/DRP1w7Z9vrIxcTv7uBVgV1DDkajY8mgQFioMAxqTlB8v2RAo6PHsW125+m
         T7P31uq2zq2JRNBDPsGFiVZFKderyfjG6Seu7DGSHwnztxX1aUwmPOzxWq9If5JfVW8s
         oPo3VpdEyi1mmkVPW/t+F94uSaEcvxdUZpImEILGtsVHd7G/ModcWOyAEuhaxQNfCTwl
         ZOusUOta0erN5NDAl17wY1ldQ0fPivwrNJWVBp7jHAJbPQ5Npmn9OhytTpnTIe8o2og+
         00YA==
X-Forwarded-Encrypted: i=1; AJvYcCXDJSiLGq2mifNQ1zzR0xmZEBVK4NTXCgZHvG7dCvjrahEMJmgFkrP5XsMyUKF70DUoGTLPe20rHDGe0z8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywoi4X8dJScnqjSKLmAa4/vsw39SmixJ/+MRiiBwRrNeF+gkDgX
	n1N5pV393EOotaTNVfJmxnolk/oyrZbD/aqPFZdFYN9ytZ2UWV6BEuf5OiWfeUSpo+jpr5Ec3AT
	A5qMxIsEdyhJN1URKcjw55PWIkn9CO0Quli7w
X-Gm-Gg: ASbGncuUz9+swOXDOvctTQh7JWPQsRCbDnqJwFRQIK5CBF5lM9ypzLdRuNFQZMG5Drd
	ngyosK6fCX77Jz9tkWI9PVA8BVMqJzKqIf+omqaSrVjGT1Aqi81f5Q3DhplL1ASjL3U3lkl4x3O
	rNtwka8PqNY1oE449XiClQXNdWvuh+k/52MQ==
X-Google-Smtp-Source: AGHT+IHxHI/WgYYSbd+L+4dIuaYdnza/2CAUBC3/gbbiQ6akT1ylcuRrP0ipSR8hMLf/hn9wzVHFuky8Uzro+oMqR0w=
X-Received: by 2002:a05:6102:2907:b0:4c1:94df:9aea with SMTP id
 ada2fe7eead31-4e4240c112emr6567236137.15.1748274581237; Mon, 26 May 2025
 08:49:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Xianying Wang <wangxianying546@gmail.com>
Date: Mon, 26 May 2025 23:49:30 +0800
X-Gm-Features: AX0GCFuH5q3K6rpEbnZIexqc0vbJnC9LpuAM7WMpr7TMYF6YvKC7kVCM8cgUaMY
Message-ID: <CAOU40uDrsJH2562F4FdxEatGmxRyX0anmFiXN97+gOKDqAHmbA@mail.gmail.com>
Subject: [BUG] BUG: scheduling while atomic in throttle_direct_reclaim
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I discovered a kernel crash described as "BUG: scheduling while atomic
in throttle_direct_reclaim." This issue occurs in the memory reclaim
path, specifically in the throttle_direct_reclaim function
(mm/vmscan.c), where the kernel attempts to perform a potentially
blocking operation (schedule_timeout) while still in an atomic or
non-preemptible context, leading to an invalid scheduling state and
triggering __schedule_bug().

The crash trace shows that this condition can occur when the kernel
mounts a specially crafted ISO9660 image via syz_mount_image$iso9660.
During image parsing, the VFS initiates page readahead through
read_pages, which issues block I/O backed by a loop device. This leads
to a SCSI read path where scsi_alloc_sgtables
(drivers/scsi/scsi_lib.c) attempts to allocate memory for a
scatterlist using mempool_alloc. If memory pressure is present,
mempool_alloc triggers try_to_free_pages, and subsequently
throttle_direct_reclaim.

At this point, the kernel is likely in an atomic context due to
earlier direct reclaim or preemption disabling within the block layer
or SCSI stack. As a result, schedule_timeout is not allowed and
triggers a BUG.

I recommend reviewing the reclaim context propagation in:

scsi_alloc_sgtables and sg_alloc_table_chained
mempool_alloc in SCSI I/O paths
throttle_direct_reclaim to ensure blocking calls are not made from
atomic contexts

This can be reproduced on:

HEAD commit:

commit e8f897f4afef0031fe618a8e94127a0934896aba

report: https://pastebin.com/raw/bxuLHCgu

console output : https://pastebin.com/raw/mCZ4Ap8Q

kernel config : https://pastebin.com/raw/aJ9rUnhG

C reproducer : https://pastebin.com/raw/1dku01DG

Best regards,

Xianying
