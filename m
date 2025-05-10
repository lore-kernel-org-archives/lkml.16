Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE1422D4D4
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 15:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746891490; cv=none; b=UWPfWYFtmD72J1+VYjW1cmjRVRulT2AQ257B4ihpOT/MMOZ2FGt6w20TvTs6XdTW8binuIPj5lu6U+ltKL7ogOv+Hvu0PGfe4tQJs5tLlImWd6v9GNJ7nLYg8eVkF0iLIkjwVfa6I31p3uwmUo7HPatZ+vuWzbPiwsL9EAK+NOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746891490; c=relaxed/simple;
	bh=cyKzN5n74ZRPzOjivCuJ+2rpIjBBQdYG1gV1au2lrSg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pvRQj1uyiBJbHRL9ITDbqfmmwWNUk76UrGL9p5UyEDwqi5rwRCWoWkkDMLaniZBRGoSyErvW/vccXYJ7nejSNIiOOCxjUMkG3QPIJ+1fOBYEk91zhr3Y5ifQHLz/950XDu7pgzcEnZr+y9rrYfvNFYRMtWuNvDieTQRyFnEvAwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QWA4K11T; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QWA4K11T"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5f3f04b5dbcso4903785a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 08:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746891487; x=1747496287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WisVRIR4CgyfzhdNxpezMbCgvO4XZsl1Wpaq0T63y3k=;
        b=QWA4K11T8I8zm2NYEwlpSfrAjtQFtt0h5jJOdJyvArXonsJ5yiMRd54UoT4VOurJdf
         tQkwwmYlDYQ4I86t5RIDL5HoUtlAtDIpgPL744ptHsK/WPZAr/xu9loyRIBxdakGVup+
         ry/0BLIgh4z4ktUy8EPeW5m+s+QpyhuIxkq2xZBhQ8N8DAuxCw+U0J4qVaHpGfD6SY83
         aEQipUmrz7h3TuK2tiA/TS0QvBCM6/nUTn9ZFOB7gcm+4qoCuhaxb08Zd+1JDqMX1mFf
         VI3S/JiEu1Qwez+F6vdrRBW0IT8iPl8dt90kDafmzq+/jbMuDFrp+Ntq1PzCZCmtkRx4
         2p6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746891487; x=1747496287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WisVRIR4CgyfzhdNxpezMbCgvO4XZsl1Wpaq0T63y3k=;
        b=W44tjPvVNCO/gZk34alAPipQ90JwjPb02ZocqjVp/8W46w3g4Str2fAuOWNzm8IzpJ
         5Kp8jroJJHXF7rJd3uvOSgWs+MvtWQgwXybz+6V1xiJ08Vcdnb1spErybzzeoNGcBdwW
         5ZuTdt9E9ca54RlpT5rsxYLhdXif3loOHQrGL0552A9rJYsZa7Se79kAelJ3gYcQz8xi
         +qkWrA870tCXjbN+UQUWcsmAbFOIzsmHwMjGHcEdxh3/EW5Us12+DB/Q3CePMc/K/rQq
         oTBcE+rsDhhKx9HlZTPZe9WBMtAu2wl4OFOafNPNhCf/tJIJBrQd8BUT1WsLbHor7/YZ
         CrUg==
X-Forwarded-Encrypted: i=1; AJvYcCVgL80JjXoG3g18pwXnTbyVDRbLEqZx2dTskH4OcIbzVhKheASpwIWdIk/hwW1YIUuuy4AMo8b46Nq8I3I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+pUSZFHttwN9KfiEu92CSfhVILZCibsPbSj8OaUgZ/KwlcM+e
	XoxWFf1qUH2g3siFlQFabFtLtP6O5LCo6tXDgeWUtxi7HPK7moi9LrNYDvP+72iJ/w==
X-Gm-Gg: ASbGncuphLUMOabG/d4nK5m2+prZpSXNFputJ0go9OGwOkNoxSPYlBh0r8qBQXC5o5h
	ioTZ8nJL2UFjxt875zstcZGbLzV0FXi0KIDSPWphcZ5sIelxauWBxaZj1zud/pv6YCxaiWcTosg
	tmrdwlOUku7zgl59yE1dXtjI+X1V1HjxbtV/pQSfXmto41b5SufnIhr8o5XMhUBB+u6xTj807Xe
	wwExSGZJVpp9ftHxnLPZnOWnp4Mw+OIBBterb0ax7a9ESH8SA/hVuhaJgNSQG6SrrJuMOeNayHw
	xRs9bTuu081AJ9inWQHQ1g+zDMCimbOdTglM6FZ9AuukwMR3PSSVZEDkKRtMDy0eOjuGff3dcVE
	Mv0cVw+E3b2sYZUXLzAWlJLwhoIsEu+njTMiyiJz+BDXPq3hR4Wk1mIW8yhVo1d5n4MLoCak+lZ
	GH4A6WkDaB/F0=
X-Google-Smtp-Source: AGHT+IGJ7K1oC+40LDkqzQMhD25A5UkOKfSfr8SDBJL1orB3LhZckJHKiEfLWOxv6y/kE9lR9h4LtA==
X-Received: by 2002:a05:6402:26c1:b0:5f3:f8d5:4a5e with SMTP id 4fb4d7f45d1cf-5fca0730971mr5419551a12.2.1746891487036;
        Sat, 10 May 2025 08:38:07 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0706-8b00-79cf-0e0d-6e5d-219d.cable.dynamic.v6.ziggo.nl. [2001:1c08:706:8b00:79cf:e0d:6e5d:219d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9d70e296sm2986376a12.75.2025.05.10.08.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:38:06 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: [PATCH 2/2] Staging: common: gpib_os: `request_system_control_ioctl` return value
Date: Sat, 10 May 2025 17:38:00 +0200
Message-Id: <20250510153800.130974-2-thomas.andreatta2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250510153800.130974-1-thomas.andreatta2000@gmail.com>
References: <20250510153800.130974-1-thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`request_system_control_ioctl` now returns the value returned from the
function `ibrsc`, now int.

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 drivers/staging/gpib/common/gpib_os.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 8456b97290b8..dddf7a70084d 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1970,9 +1970,9 @@ static int request_system_control_ioctl(struct gpib_board *board, unsigned long
 	if (retval)
 		return -EFAULT;
 
-	ibrsc(board, request_control);
+	retval = ibrsc(board, request_control);
 
-	return 0;
+	return retval;
 }
 
 static int t1_delay_ioctl(struct gpib_board *board, unsigned long arg)
-- 
2.34.1

