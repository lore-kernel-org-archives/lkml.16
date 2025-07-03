Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D41EEA9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 12:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751544213; cv=none; b=XzE36zCJWGUwjA77IJQ0VR+m8JjyfXFP9o91dXjBa++xlawfhS5o3wI8MpJy89yFkqgeyOKvXZs2wnipzBRHBJoNjdWvMBzrFiROvyUmNPLY6uD1DVbu2e/zQYoAr2YOcDgEcvLlv+dqY2rsJhvQ3dbX7JUs8GR4m2Ko2GKKnQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751544213; c=relaxed/simple;
	bh=gWmMucoOuA1az6fC3asUkLhxguswTObwGrLfdc8ob0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ROBQme/3tapwMo0b5od7dzTX6LnRn5VAbWQhumi7tJtnNRklcYfuLmiu+1wbAEScZ/fuQXtoL5UT96AxlCI9mwVnTZCs5qZWr+m+k6o6kKyrrW1NptXd0hRu/gWubW5+JRMq5I4YzjT1VF6akNWOES37jkd1y7j+nC1l3jHwQlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UhVa+qDt; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UhVa+qDt"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so14555941a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 05:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751544210; x=1752149010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/6Az8/htOon/tG5o1K/fhfx5nMaY5HuhIoQAgZM+Fi0=;
        b=UhVa+qDtcvCN0zmyJNYsiozxNGsAD0b1UuT0UwdlQ/ua7mW0B6yDk/O0JpOg65nov8
         Eak5rfRwsE7265fyCQokwzHgOi09hru+qf0U6o+o+FXiIpguqYk8Y3a61pQqAMOAgqd7
         6/1fYGuNtrAyRnMcN25YWZIwN4dmjHyphEZ14Ezod+b0A6ITxuPfhD48RtXGb0kDML68
         gb6ckQZlOacG/l0tEhlY0XirFGR4DmmYXkoxZ1GaW5VKbLuRyLSMoWec2fXlZlMvWS5v
         hoJCRYuwxgARevtTLCyMuu2kMDa5tzUwc05daZR+WLSxess1NOto6QY5sJMrwTuCn0oJ
         oOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751544210; x=1752149010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/6Az8/htOon/tG5o1K/fhfx5nMaY5HuhIoQAgZM+Fi0=;
        b=GPSrhbCaOKoFqMsFqoUus+/zc4SqvarQH/CTLvvj/8Wz80l1KXBJ6vNxAHfFDnxr4y
         USyzkLx2a40ObmMIp2Nda2/xbb4ej0JM6rAo8fzGpcf6sBtf9hAO263xtjeRRTV2yldt
         zJStvMprgo0PcG+Wc8ULPMPIedyzvRdTR4YBBO9FwH/FRz3w+vkGKNhcQF2rsd0x6DMX
         KfDhsJOQ8CCqqoUzLgWmq5Uli+CPyNgNv0qtsMOcFniAayEQTC17onlI/tCL8FT+l+J1
         OuTtkFFmFixBdeWQl4jhjItbtkwQVdmtP24qncHNotek+xZVzGVXK8ZRamJlJkqgiI04
         hM+A==
X-Gm-Message-State: AOJu0YyLU+b0HTbdVqdpeGtuWuR3puM9tzr01xrvIB+xO8Juq64Jqc6Q
	3rM9vGhdGYg6lfkUc7nt/aAmx6UKSb8ys+cHcUxDS6eANxURYKV3grajiGcn9iH5
X-Gm-Gg: ASbGncs6Y7UNxMu7MsdqoL9oDxw0xI6VIHX8KElUxd75SKFGdKhwjVGB7bcJrslLndH
	PtS7R0qhUMcvAanR9X4CoRQfVtG1BDWqp+Y0Uw8VgILO93FCZXSEnq7aX9RsCCm631E32mKJyp0
	n46vQYOsMNif3dMB3F0PqGSdC7AliA6lUMG9vBW3XuYI7FPfZRZF+HeZoEDlQ1cpW00gCokSHcJ
	JJciweQVZMpfZZLTos8BisQZ2cvRYgWERNBILq25uEDpdN38RDYU2P/zjBjMb2XCxH6kU5iT6Kk
	GDFO2trRxhGF6+Gsg9b/wzYfJEOqpUoeg7WMVCg34iYVlbmBHDbmJYTwLtw+gKOWTNCMcZOBm1c
	QsOFugAeGYwFdhHVXm2jvAajRdFGp
X-Google-Smtp-Source: AGHT+IGrone20PK/ICj88SFDR6rGiCEtSCIee4w6s6pvA2Jp+3DW3EPJVfXOqrskPBFuxSDlu6YXFw==
X-Received: by 2002:a05:6402:2690:b0:608:6711:a06f with SMTP id 4fb4d7f45d1cf-60e6cc91a60mr2948677a12.4.1751544209617;
        Thu, 03 Jul 2025 05:03:29 -0700 (PDT)
Received: from Mac.lan (p5088513f.dip0.t-ipconnect.de. [80.136.81.63])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c83205eb0sm10563837a12.72.2025.07.03.05.03.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Jul 2025 05:03:28 -0700 (PDT)
From: Laura Brehm <laurajfbrehm@gmail.com>
X-Google-Original-From: Laura Brehm <laurabrehm@hey.com>
To: linux-kernel@vger.kernel.org
Cc: Laura Brehm <laurabrehm@hey.com>
Subject: [PATCH 0/2] coredump: socket PIDFD+PIDFD_INFO_COREDUMP issues
Date: Thu,  3 Jul 2025 14:02:42 +0200
Message-Id: <20250703120244.96908-1-laurabrehm@hey.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Preamble: This is my first foray into the kernel mailing list, so
	apologies for any blunders - I've tried my best to make sure
	this is addressed to the right place, and to follow the
    appropriate conventions, but I'm likely to miss many.

This set of patches addresses some issues I *think* I've identified with
some of the new coredump socket/PIDFD_INFO_COREDUMP ioctl functionality.

There's a reasonable chance that these aren't actual issues - I've 
tried my best to make sure the error wasn't on my end using these
features, and checked the kernel tests for them to make sure I'm not
doing anything wrong, but it's definitely still possible since I don't
have a lot of experience with the kernel.

I sent these as a PATCH because it seemed the most straightforward way
to illustrate the issues I'm mentioning.
They're signed off, so if these do turn out to be actual issues which
the included patches address/can address with some changes, I'd like
to see them merged.
However,in the likely case the issues I brought up are not real/I'm
just doing something wrong, please accept my apologies for the spam.

Laura Brehm (2):
  coredump: fix race condition between connect and putting pidfs dentry
  coredump: fix PIDFD_INFO_COREDUMP ioctl check

 fs/coredump.c | 8 ++------
 fs/pidfs.c    | 2 +-
 2 files changed, 3 insertions(+), 7 deletions(-)


base-commit: 66701750d5565c574af42bef0b789ce0203e3071
-- 
2.39.5 (Apple Git-154)

