Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C8F227586
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 18:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749667057; cv=none; b=a15nez3fwUr0QTfQBzA8KqJ+Kc0OGJCAin/te6xt9y7k6l6g7H70Gzd2q8EE6rIO7GuXASPvCt9wvvgLib1B71yyK2jr68RcMKXhew7snamD6gbe56RXNdONGHYGNcw9NMuLrAFI1rxZyHCjKuLk8QKpnkYFTn2UEp05ubsrp7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749667057; c=relaxed/simple;
	bh=PtjcRg7r9dDYoDn4dMsR5Www73D4wiUbSHxe0flzOIw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qliZkL/QvQlillW4fv+Woo672nVysICMz9ezAlp9MLYpSa0l4o1HZBC1eZhU30zLXgjUn1/lsswmGJJBLypqbxJJw4CygZ7zXZlD0qQinzDiDBr4ztqyEAwbr3XVl3pF0OX3RYDaGUpiKIOk5UjCCFJ+/U1vnGbwwvB/nh8HRik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=oWbv86TA; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="oWbv86TA"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so78052e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 11:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1749667052; x=1750271852; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nxFfYw7Bh3J5bDd9GOMRnGuEy6auNfpZtx05LVWHCwg=;
        b=oWbv86TAcjjWqjql0LfX9QROVQ7xKOTMls5t8Bp8QXAxRGMorqLvG3LvjdcW4r9m0q
         7Ux+nbcoHsoe0zTTZhn3ctfEUzHUJE9nEaVwpifWGH/HPsdi60JhaYjJR0GHtQmYECbo
         zSgoGr8qSfyu9oDX5OtO12tki0xIHKLHlSc/tcj8N64U80eXE0TD7qoMXrf/T6GgraID
         +Kw1LwL1Y+w49nXv+wRDa5sb/H9pOrJSjuOGcggpmGXqdS5D/emxqiiNx+xeSHB8Kyif
         gmDeI1Hn627uRIfBORmlDceutQA5I9NLWeybaFhsUWIg3hlt2Ya2Oxla8oGv2jps1PBt
         kPxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749667052; x=1750271852;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxFfYw7Bh3J5bDd9GOMRnGuEy6auNfpZtx05LVWHCwg=;
        b=Z+RNvjyttKQHKSSvMCfsnOrlPS6R7Da7KmFgwei9IgVavtwqj+eGb5DIbFXwZgv5hu
         5uvs1G3HlbeiLpDY5I5jCPQ6cz2wgRNqIFih39VBMPt6HeNdm3RnGALyiaY1vEeH5cbg
         Os9GinVj7ig5GHhln87sPsW69y6rSA9qJ6LIodtWS+aJrjujjga1Ka7K2fXXFBPeMehq
         Uvkdu1e3a2TGK5IvL97HLlbQ/CZTswk0rFUHE+wqly67lYbCfYlljEgUBDhyzzAFcR1l
         LwJqXcN4vKU84xUK5cPaKAEWUO294W/roA7g30oRD/NINtyCXvzY3PnkAsXwsaAh+Onv
         Jzgg==
X-Forwarded-Encrypted: i=1; AJvYcCXJ6kguxGg/fJlOtUmfWoqCFV9F/vrb4D6cwuWYpmqE53JvZjCyGgaIOL+nphJUmitpmR3XppohSuu6X8o=@vger.kernel.org
X-Gm-Message-State: AOJu0YybbaOke+qWh4/hBHWgS+JOIxJw10tZFuqUTUpx3afROwkOJ2SJ
	K4yKuFTJhifB26pN8GvKZxT6e6XWOUX3iLQ4W3gARaOa3o/wukwdR392YorbiAMwS+e2Uli/XIS
	51XAW
X-Gm-Gg: ASbGncuhd8FEHnkGwFNTP2V/DwNtJy7Or31Mc8wWWnYOQY/BUdNLHxk3WBdD7++y7g4
	P+2fAF/OjdjHmQyizpnbIjhXhM9Nnv/QxFI7g5cxXOSZtzkrzDkS0rFs5YP0wXPVas3Z14sRLe4
	saN6jDgpuN5tlCWRBb1GZqQxNhU30RjlLbjnQOwNGiE/Adg+vk9RXbHsR2xcmg2f0iWtGbunRSx
	YzQqt42kMNtS+TQczpBGHK7AazglyAW3y1VF6C1CAZ4WGhOl/Qaa2ULs3oXfdRVmwGSum7SNDlf
	RJmEF+D17xPXpuV7Hp+/RXcxJ53vhGSyn+xC4FhbbrW5r+XkQ5PyfA==
X-Google-Smtp-Source: AGHT+IFzYupa7d+ONAjulOpVhh56Bqw1ABa6/j/qgq2ciZf4MuyCJ8C6ogS1IFGo/jjRE88dc+izmg==
X-Received: by 2002:a05:6000:2c0f:b0:3a5:5149:ed1a with SMTP id ffacd0b85a97d-3a558a43b48mr3492897f8f.59.1749667040479;
        Wed, 11 Jun 2025 11:37:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a5324364d4sm16119390f8f.55.2025.06.11.11.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 11:37:20 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 0/4] media: tc358743: Additional link freq, and better
 validation
Date: Wed, 11 Jun 2025 19:37:12 +0100
Message-Id: <20250611-media-tc358743-v1-0-708556026f9d@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANjMSWgC/x3MQQqAIBBA0avIrBO0NKWrRAvTqWaRhUYE4d2Tl
 m/x/wsZE2GGgb2Q8KZMR6yQDQO/ubgip1ANrWi16KXkOwZy/PKdtkZ1XJiASjgr1eyhRmfChZ5
 /OE6lfLup0v1gAAAA
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Maxime Ripard <mripard@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

I've had these patches on our Raspberry Pi downstream kernel since
I tried upstreaming them back in 2017 [1].
Maxime's asked me to repost them as he's trying to use tc358743 with
mainline in RGB mode[2], and is hitting exactly the problems I had
written them to solve.

The issue from that series of get_mbus_config passing the number of
active data lanes has been resolved.

With regard updating the FIFO trigger level, from the previous
discussions[3]:
- Cisco's use doesn't use OF and therefore is unaffected.
- Philipp's original use case was only 720p60 and 1080p60 UYVY at
  594Mbps.
Both those modes still work with the updated trigger level, but
I'm happy to revise and only use the new trigger level with the
972Mbps data rate if that is deemed necessary.

The final two patches are new but relatively trivial.
The first makes probe fails if the hardware isn't present, and the
second reports the right colorspace for the format.

Hopefully that all makes sense.

  Dave

[1] https://lore.kernel.org/linux-media/cover.1505826082.git.dave.stevenson@raspberrypi.org/
[2] https://lore.kernel.org/linux-media/20250606-roaring-blue-bat-a8b2aa@houat/
[3] https://www.spinics.net/lists/linux-media/msg116360.html

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Dave Stevenson (4):
      media: tc358743: Add support for 972Mbit/s link freq
      media: tc358743: Increase FIFO trigger level to 374
      media: tc358743: Check I2C succeeded during probe
      media: tc358743: Return an appropriate colorspace from tc358743_set_fmt

 drivers/media/i2c/tc358743.c | 134 ++++++++++++++++++++++++++++---------------
 1 file changed, 87 insertions(+), 47 deletions(-)
---
base-commit: 8d441742cb6a1f1cf1d8f2c73339af27dddb7cf0
change-id: 20250611-media-tc358743-07de40a814bc

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>

