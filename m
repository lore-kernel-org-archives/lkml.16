Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5961D63FF
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 14:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744122260; cv=none; b=a7krDce/yRfOdeWwOnmG1zrTgCWSKfsID1ahom2f04W/SjBtrBkalR2Tk6XSreCfBlgV/D/bqhvIz4c565rG3tLYy1GclHVuNW03Tbii9IMUj5XtFB/aHHpZtKlyHxEYEqnR5QEJYZHFPmWv+3ZMipaEwwhSM2fSwBrRO5P7tT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744122260; c=relaxed/simple;
	bh=ur4m7aU44Xyh6TdtFa99xxsKqSj1jWF7QjhxaFVdqwI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=O0P3snGSVeAUwHzyUjKDYTYcJFSP5dvEBuaCflPsMNrwtHKyM3MUig3pcMVIoDCZp4hHBGyI2Y1rbj1XM4z2yWfTSca4WLmx18M7JQe0wu+VHNRN3bqb9HguuENF0B0rWExOatLsexBenKr2WtQuCVblw2edrAHKpgJw/PAUkSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=TgG8G6kB; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="TgG8G6kB"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so8243283a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 07:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744122256; x=1744727056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+MtPJRtiyh+SPBx4mLCq9KljUfJgi02xHmVOcg7TVdU=;
        b=TgG8G6kBtlzOkRUm5WRzNnbOSS7GZvkcUctU+kLcZSNOvK0K3GMKG3igG3p/xbjBJd
         lnWZs1IR2+23Q6eMYF1rkyzA6v3O6S2Ent7uA0HlBbJbUqflODavwCyMAr2o84IndZW8
         Set9nfkY4FX/AdNczAW2GcJJ1A2xYCgFM+DL9F3MjLaWe7xgl8MkLYoGEBqUWHPL++KV
         59SpupbKnrS+HZav/G3ADPXyRTUzDlk1RSyCPBv6zYBEGD+eodxixZQ7e4OX66+Von99
         DY0O3yOcmeXRhJ/XHrg3XczCs9+GkVRfEZ4v310R9x01PicAxT1/EisyegT7nF55FJsD
         6Q6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744122256; x=1744727056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+MtPJRtiyh+SPBx4mLCq9KljUfJgi02xHmVOcg7TVdU=;
        b=FTaE+RZ0asXsv7rrmsQApKvMn3qvhpsmYeC9rCp3xwpvHfDYQDOl7y46Z7rXTL3cvz
         ZwkAQYxQX/Mn7lCGWqArLg6tKs7nF10dP/Hm/Fanzgt7ljupqrWp/2Vd9da/zHdcnduc
         0vCA12ueqds5mgTnZTzfc37gnUQmnasIaMbPt4tCWaIIupsEw7fW8KTsotTM84AX/Heu
         390z3lHXMSbiea/cJGLu5r6CvVLl2JJEjW9yb7juWX+0doQC1ypTrj/N2/J85Y5V2GM1
         5W+GyvJPgOi6hoaB8F3LHpvsVtVEpmtiXu8RP3ZBkghkh2JPSaR8hwuPH8poSSnsGpP5
         pucA==
X-Forwarded-Encrypted: i=1; AJvYcCWW4825Gfx3bAO8Z/f059TY6CrzgQp8CPbVYvNcwc/oklK0hhMgEblY5BqDB5EIuDIhcWTZfuvmjcJH5Sk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxcgFX5JMB2os7GZU6zXP2tQXB6GCgakNwPtwwpAWFWmdUN9/l
	kj+SpFrxHxWWgiq4eeX5KH3fhqQQP5Bej2mQ767MmYpPJFbvOaIgJuCwngo7Xz4=
X-Gm-Gg: ASbGnctYZig/XIIjkwNbr3l5tfY2HO/kRbEH3iVtL+0hwnZ99xYS0nVa7o6p7T64QJH
	IxoNoSjlB8DFGmZwd5cdenxUAKisP5X8vvsIf7ADXu/w0Q/h042/gV9bs/Seb0/TiqlJ4s/L+Sn
	T1lI6xcrbo0LqXfc2n/Z/+20maYERsrkwlzhP7AgGYaj1PmbGF1mNXDFyA9OTM/6vHl/6JcPQPH
	HUQHfj7WFJKnD2lvnU27/tOXjHvVhWQOZlymnr7m1eZmgmuTQgX7UhGmwc5s3RUrTu6dN09t2MV
	TEcietEAtFuZBI6wZXe+pAGnVNc8Gj/P3z55Z2qqxjkKKByNMw==
X-Google-Smtp-Source: AGHT+IF8wXFz8uA+4L7c2akpcsetRzXiZR3HHixUfXB9ZLuMwsWg0eKFk03NCvr2THnphnjjgfuQjA==
X-Received: by 2002:a05:6402:2743:b0:5eb:ca98:3d3d with SMTP id 4fb4d7f45d1cf-5f0b661a93fmr13098218a12.22.1744122255934;
        Tue, 08 Apr 2025 07:24:15 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5f087ed1feasm8086092a12.25.2025.04.08.07.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 07:24:15 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: David Lechner <dlechner@baylibre.com>,
	Kent Gibson <warthog618@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/2] pwm: pwmchip character device
Date: Tue,  8 Apr 2025 16:23:53 +0200
Message-ID: <cover.1744120697.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1748; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=ur4m7aU44Xyh6TdtFa99xxsKqSj1jWF7QjhxaFVdqwI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBn9TF6ysVHjqWGQGJhd8cUXhw04NSmZphk90vNx eek/4P6moiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ/UxegAKCRCPgPtYfRL+ Tqh5CACmbzHRtvo2P4VtFw31uuIT0MSMnHKRY3QxIi9nxDC44RY2CYgqsn31OiDCx1hWQ5ZVNgK QoZIAaWEZJmhDlp0JJnSh5xnl1h0RutBEmbnnuQ1+t0A0+LPkV6RplrcEnqWKqAsjPh2zSaykwj xunfpijLCNwucoM344MOLiBQIF78rgxh51iGuJGTtWVn5Fiy6RNNeQ3kQuP29sGPdcKcfmy2I3G y2YMSEKD+naQJRLJSomppjghUGMZnnh/zrKOrdDl8t7TRtrx8pTw1yf/sPuJRdb5YKKyuY5q6hC OA1RC5n+zyuPCEVpv3wEbln5dSYEmmN3pPOnJsO0b1hPCd2t
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

after
https://lore.kernel.org/lkml/cover.1726819463.git.u.kleine-koenig@baylibre.com/
(v5) here comes a new revision of the pwm character device support. v5
consisted of 8 patches, the first 7 are in mainline already, so it's
only patch 2 of this series that is left. The first patch is just a doc
cleanup that I created while working on this code.

There is a userspace library with a few helper tools available at
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/libpwm.git.

Relevant changes since the last submission:

 - (A bit) more documentation in form of code comments

 - Make pid of userspace process that requests a PWM visible in
   /sys/kernel/debug/pwm

 - The (in kernel) convention that rounding functions return 1 on
   rounding up is hidden to userspace. It's not so relevant there
   because userspace only works with the generic waveform description
   based on ns, and so different waveforms are easily comparable and
   so the need for an extra signal about up-rounding isn't critical.

this is based on my current pwm/for-next branch, the current state is
also available at

https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/chardev

Best regards
Uwe

Uwe Kleine-König (2):
  pwm: Better document return value of pwm_round_waveform_might_sleep()
  pwm: Add support for pwmchip devices for faster and easier userspace
    access

 drivers/pwm/core.c       | 312 ++++++++++++++++++++++++++++++++++++---
 include/linux/pwm.h      |   3 +
 include/uapi/linux/pwm.h |  51 +++++++
 3 files changed, 349 insertions(+), 17 deletions(-)
 create mode 100644 include/uapi/linux/pwm.h

base-commit: 957062f2ba4790c495de606ecf8bc7398c0c710f
-- 
2.47.2

