Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5430410F9
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745474597; cv=none; b=pqJBCjbF3o9LxCUb9t+UpNxsWrOCqrPYjgsYgQpaa991+foLjopQJd4/H0tQOhh0w62PGOCrjwAtkrRW+Fhwc6hw/OGwMv4s2vRM9lh3TuAJsnsQl7R1jJmABxCuOTiuDFosK3ID19X7q2xhqTgPsYRfcUFbgaTRQsZSFgP6Euw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745474597; c=relaxed/simple;
	bh=N4+dOHsFBFY8VSO44cac9auJqY/gWjZkjenRbn8Dddc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZQgWqbuAwkljUxbnJs60dmW6cY65F0Q0h2JXlx1AzIh4VKNms1rWLe8wXpbxVKuczW2wS0EMknfiX3fj609ijOQ24MrWdIgG5q0oLO7QyJDn0+kpVs5z+cRdSti8bIza2suUUAf/QbdhDLVEyRt/0jz9WDi7ZfXnHEiyyBpmfsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=E/47EZbO; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="E/47EZbO"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2902f7c2aso103416766b.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745474591; x=1746079391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GJdtOl5EDz2hncAAugtWLs1+GfGekzY/FmiHJo9Y1Kk=;
        b=E/47EZbOp6qhqrWVKue2ZkoJ9oIs7snCuM6wovBwS9bZRQiPs8qJmJiMc2ognyWhTC
         disfCmo+sOObiz8ADEC9xBUo0FFNq+kAgS9ez6spt+RhPDi+wljVAis4cVqIEb0pTmIw
         gEqL7YNaTBxWO/73pYgExV01qekNyVSSxpmrub8OPC6tiYkPGnLS/oYHptyGCuIzF0BD
         MJYXhFw1RCOswYqxi9nCpN21VYcWD5I78UJDRZXVRsE2z6+z6G63u5aSnLTBj0mGYqOq
         TU/dLfARhWTpcMEn4i6TLCj8aAFJgI1nkvkouns/xVhref70vS3mkrtDc1w7Q+lWJq/i
         HfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745474591; x=1746079391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GJdtOl5EDz2hncAAugtWLs1+GfGekzY/FmiHJo9Y1Kk=;
        b=jYtoBBmrfnW/NoZ9rrK1wO2JIlQWY9hIhVyFWD6Y2OA7OO0bqli9piBQXi7TDew+Tm
         kLZjX16TvCBE81YnbWcYWQO89nP3YZaDmoht0loDUXOs+VDaXWDuxaH4xdGWyOOzJbej
         l6nRykbSZcKgmqCWLNXfTw2rjYeUQXgjTw7XrTzSkQG8biHUjw/YjH0tI6MJpiQEKu6M
         5bIigC86symS8YLUX0FLyXXpH4dFMLg1j/0nwQunP6brCS99i0il+v5fOZXWRCE4CJRY
         HN5dt77s+jnUWv/gGAwgq2Ml1vj0VDUYQmifMsh+vf8Cmcx5LmKr64KRy1NFGGXj4QDW
         rD8w==
X-Gm-Message-State: AOJu0YzM4G0DrkPB0yA1oUIoOWbAsBa4kzMPduF8MLN9KEDYnrI2Q9/9
	jgxBvQNz2sz2LW5ouQzMNvQuFTYtB9mxuRpCY9eLNqX/qGoW2RF/fqNtoHGZgbY=
X-Gm-Gg: ASbGnctCaPUatmSBpp0krPqJVtQIo8C2DZNLdO85GiZgk5dwJnWHsDLJpONzVf8xhNL
	sBfc56+Yo5+FtMiqY/E2GJUi6YoxPx7e9w8cZZQPTqqfI3fdQSpqyVM+fImajJo5F2lIvONPI0q
	g+fuWffBHB4Uh6RNFO5sL99hl2evSLHmLbGEpBqhB4Facvm2B67agoiw6MU715Bh0lml2h8WCFo
	Uhb0tfKF82VzkjLW9vYScN6qURFhDvcnKM28FFSduuDYIbKwniYSt5K88XKkRxg2w5hmxDRcGE7
	2IC5jdWBJUQi2DgMwuCK+zefQdveABh+6/6ZoS7pdu0faNuE5RtZahJw
X-Google-Smtp-Source: AGHT+IHJFY/69RTzkEvJcHmho3oaGQw2a7KmcZcxpgTVeiCJ4O5ab+igUuUyxGHvSH9l8IU/e1ptRA==
X-Received: by 2002:a17:907:7e8f:b0:ac6:edd3:e466 with SMTP id a640c23a62f3a-ace5721a191mr143592366b.19.1745474591007;
        Wed, 23 Apr 2025 23:03:11 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ace59bbd6e7sm49374366b.118.2025.04.23.23.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:03:07 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] mailmap: Map Uwe's BayLibre addresses to a single one
Date: Thu, 24 Apr 2025 08:02:51 +0200
Message-ID: <20250424060250.3085683-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1288; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=N4+dOHsFBFY8VSO44cac9auJqY/gWjZkjenRbn8Dddc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoCdQLWrNDcnppGlL5NvLzpsYmDCuza+J9DrEk5 cNtM81heNqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaAnUCwAKCRCPgPtYfRL+ TpSQB/0Xte3d5kQWHIZJJgs00r/h6LHPG7KW/A60lFJ7av61x3pK4uvHl95EqwG3A+4xUVCtgAN VRN/9kwAkTkJy7CfJrJyPfXOEAQ3GRFG04uhx+nansUeeBXlPmnMYkucYjbXSpRx1+V/Zj3psNE cOazHwJiWcvtSJHLxkWVntd5+5Iiq08GDZ/3V2jaHYqnRcNxZH7f5h6p41ecWsHkDXvkxA34/o+ Q/9ZwYZek3VDKSTa2oeV/VY5zkqpPULDq8+VoxyHl0lrQ1iBD+r1P9E3QJzAX33hG3XzxI3iyEK Vubp9HCXrghHK3WQgfaSyYqlSidqZCvSmHrJXoWYuZcv271L
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

When I started working for BayLibre I wasn't aware that the mailserver
rewrote the sender address and so a few commits entered kernel history
with a working but unexpected address. Map the unexpected to the
intended one. This also makes the author of those commits (e.g.
32b4f1a4f07f ("pwm: jz4740: Another few conversions to
regmap_{set,clear}_bits()")) match the address used in the sign-off
line.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello Andrew,

I see you are the most active committer to .mailmap, so I suggest you
take this patch. But if you prefer I can pick it up myself, too.

Best regards
Uwe

 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 4f7cd8e23177..6ff50648857e 100644
--- a/.mailmap
+++ b/.mailmap
@@ -744,6 +744,7 @@ Tvrtko Ursulin <tursulin@ursulin.net> <tvrtko@ursulin.net>
 Tycho Andersen <tycho@tycho.pizza> <tycho@tycho.ws>
 Tzung-Bi Shih <tzungbi@kernel.org> <tzungbi@google.com>
 Uwe Kleine-König <ukleinek@informatik.uni-freiburg.de>
+Uwe Kleine-König <u.kleine-koenig@baylibre.com> <ukleinek@baylibre.com>
 Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
 Uwe Kleine-König <ukleinek@strlen.de>
 Uwe Kleine-König <ukl@pengutronix.de>
-- 
2.47.2

