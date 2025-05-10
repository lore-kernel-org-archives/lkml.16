Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C521F0E2D
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 14:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746886993; cv=none; b=LVUlqhY6Db7D9O+H2Y73VHueADHepkN9VqTHmGqZJzIGUhjKd4rjWS6oI2iT5i79QBBbycMoK3ZYtuyrudwJqpMVoUnKA4G4Bdyi4MVu0d/nSpF7UtIxgv+dCGsqUGGLcx0jeDRZYLjMtxhd+hSWSM6lgC1L3bvNobZayAXoo6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746886993; c=relaxed/simple;
	bh=p3u4NeT+Hlz3U4mn5XoU1kpNDyhl/JfPmsAHC32olPg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=smLFEQSuCQCYMisXyJJh+OCpfpXDf4K5Nvherxmzftqy8qSLaZIM35xHR9gookHYJuv++rIz4By75bJ5UsKcm/50FXoh5+bP4VDkllQRsRLCPOZ5IKIp3vo5XH7nquPQhEGUmFNLucNZXqbuf5c+6caAnIIrfo4rcLG9wPmk9Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=parent-leaders.com; spf=none smtp.mailfrom=parent-leaders.com; dkim=pass (2048-bit key) header.d=parent-leaders-com.20230601.gappssmtp.com header.i=@parent-leaders-com.20230601.gappssmtp.com header.b=ccdlZu5A; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=parent-leaders.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=parent-leaders.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=parent-leaders-com.20230601.gappssmtp.com header.i=@parent-leaders-com.20230601.gappssmtp.com header.b="ccdlZu5A"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-878627ac2ddso763674241.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 07:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=parent-leaders-com.20230601.gappssmtp.com; s=20230601; t=1746886990; x=1747491790; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=p3u4NeT+Hlz3U4mn5XoU1kpNDyhl/JfPmsAHC32olPg=;
        b=ccdlZu5Ay+hxuEdjsm0ePYU5aeZrQ8g0aIJYf4//mszj26IJ6oXfDiu3uWJxX23aUf
         V3KeJBKbpWZTj29JR/bgWJYOKfPTR6lPi2NA6t5uhvOsgrSzcmtNjGg014/7fbvzpUPO
         Z4RUUR+9J0TgYQzw4wp+kPXqlymFU0VXC5C0FO6qlTdSCwy0cgtUYnJXykjSPxbJoeIV
         OPqXqyR8U8pv4WvS3okEOZxgFWWajbjEBaWu4qr/X2J6tcCzYIQIEMLm8VUqMGjjeUjb
         psA3eMAPBPmS/5IS/2SX66YS/THFcPgBgAJZidYyvj6Hoiakk2WInmy7H7qgAkYpmww9
         y4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746886990; x=1747491790;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p3u4NeT+Hlz3U4mn5XoU1kpNDyhl/JfPmsAHC32olPg=;
        b=ZAg4O4JmR0F3f1W6E4dgpNM8y/1efzuna88RvTNVsMfsm1F0LAAcFCHg3CSHuipu45
         su5Mf8HhtKCR+eITPi7/UAkoO1yudYT2BHQtRK02zi4nf95UyMlkW4NJOd9Jom0YqpKu
         EY1UAlon4+LLyP0L9y5UqioiKnTUkkv6AEblnnsctGFDa4OUTb2uQMCtAmRX7EiOq/+D
         53GLVdqeMoLx+l/bi0hOXMeeYKgdGEAo9bYkg5Qa5AGj500eF7VjhINE+itqsZ1p6GUX
         ZvGlP7fAX+ltXWF8SMPqHuPI2UuGPeiN/O9EjUnxmt0/0XU/oltuBTLsL3Hn8br1Evq8
         tVoQ==
X-Gm-Message-State: AOJu0YwjUWu8l5wrtrH1MBsLXpI0un66hEqA8UorW+bhashKoQKfpEuV
	5p1qppJn70uNInHxL+9+PmfQ0N4jMyUuRkzocNxxHntOenUsWll++A+YBFpRhBYGl8xxBsjw0aV
	19bgR4SiyA82D6W9vhZQSqsmmnZUXoYN49Xdg6wT2ThB9MZjQ
X-Gm-Gg: ASbGnctqX51V7BGVGxIOX4uz4Phfe2JKnP/dn3LSpUh/IQRvXzvXAx0M/84dcytGDa8
	9YPXpL1OVaOJtkKQR+wmSWXfCpWKntiz4xLH8VXArFr8DbvKeDtXBGrlfH+kYcllOr7t3jFioGo
	jeYjsa0RBTo1GmC4kQtOJ1e7O/018vKP1M
X-Google-Smtp-Source: AGHT+IELViigIzxZsawdCxir0NROtePmYzXm2k6eVfdr4JuK6QaqGnb2yUdpH4PtEJ2aD3zuLw5DZ4zOmF23olldMIM=
X-Received: by 2002:a05:6102:4bc4:b0:4bb:eb4a:f9ef with SMTP id
 ada2fe7eead31-4deed30e605mr6209068137.4.1746886990400; Sat, 10 May 2025
 07:23:10 -0700 (PDT)
Received: from 402240868419 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 10 May 2025 07:23:09 -0700
Received: from 402240868419 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 10 May 2025 07:23:09 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jenna Sherman <jsherman@parent-leaders.com>
Date: Sat, 10 May 2025 07:23:09 -0700
X-Gm-Features: AX0GCFuZ-bDIYiR00CyywG14AL4c4omRTqScwmG_2RPZew1FVYpTqv-pX23JdI4
Message-ID: <CAMg1BipFGXWB5z=eeSa0co=vokrsWgMqNGn5VY4SZ05io9ws6A@mail.gmail.com>
Subject: Article offer, will you please consider?
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi there,

What if taking a few minutes throughout the day could help you feel
more energized and centered?

I=E2=80=99m working on a quick-read guide filled with tips on how to breath=
e,
relax, refuel, and recharge during the day to keep your energy up and
stress down. It=E2=80=99s all about small, easy habits that make a big
difference in how we feel.

Would you be interested in featuring it on your site? :)

Thank you,
Jenna Sherman
Parent-Leaders.com


P.S. If you have a specific topic in mind that interests you, kindly
inform me, and I'll be more than happy to cater to your preference.
Moreover, if you would rather not receive any further communication
from me, simply respond and let me know.
