Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6DB257458
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151122; cv=none; b=pjlEDsA9f1b7H5qb59xMvHH+tFBcx7+3JFeYC2tLPr2IGSxdYk0y+3ihzQ4XvpME6ffthblR5vLmZI4cTwCjbyDDZwAsXFrrsXe5QYNUcFXokcj3yi3QQbafNMPn5PVwhDoVoBnoBiQLYiHD9372tCVwiqVaUTgaySLMhliST9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151122; c=relaxed/simple;
	bh=svD6c9dO0UVlCIVTddePdMduVpdHWbHw4LzAwR+m9OI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JuZkYmbsHF2r/neJfEb2LjCKTpCVGzzGQ9EX1l5LqBZTLP/lMiuWpM8EcrZxvgju8MuvSN5ZHr4qYzXv8UtO5IzgWnr4xEC8CLC9bi6SQZP3Pm54Y6T+Pnca9qcd6OIXUrtZHln+vv8Q7WO3RT89/x93+QsUkm0jqvtUVAbR7G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=QnaNG36Q; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="QnaNG36Q"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-223fd89d036so74336045ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151120; x=1744755920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOUuQo/ZBOK4e2pJspysWYksCtSOwA8ABZzWMkqa/TU=;
        b=QnaNG36QFUT9DvxUFYCxBxhUuVpppkKXjEhDxRYNxL785vUWDfckUDUbroaQpI+sZ5
         TAfOKZr9PD8Gp1tSeVazfTYoPdur5+QbVqIS5E+vvQPRKoHC8HMYVATlw2YS28y4N5Bs
         qB/aPcTjiVYGTY0Ri5ui+xAvQkIt66CJ3xFRcqykHRHdtVhaS12EMz18xANctc0C2F++
         nWby3voYl/f7ahvdOfS9Hp4Xotb2uC3Hc2Tgez8sYjlWENOZK5D/1jefLsfopcmgCRe/
         tKdrSgnT7q2Qf+cuYrWibJZgh+jrpLLAXzrcBfy63nnPna9TXdlfk89jNJTD8hEGtXvD
         zzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151120; x=1744755920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FOUuQo/ZBOK4e2pJspysWYksCtSOwA8ABZzWMkqa/TU=;
        b=ABG/GdoBxjjXy+Vmq9+NvLn8dU4jw28QT0ANR2a8Mdz2RlS9WaK37/njeQ5pReqZEM
         k9yqEdUlS4K0A5Rz3UO0tdUAYeFVuyG+2I8lampUJ1Ex+PGQLHXK7ZaJ79z1CZWfoWZB
         O3WA4Yo413WIlYYVrplksDsg/s89s5dKe42Hkth1MmFxE/yhwDACmulJws0g8SS01qyX
         QTaQGeGH9o9yXuOeDB5sse+IjlrGR4o7OrRJNemxMYYDO2pEvT3Z6CUMiQqRDKQT0bAD
         uiJRN3Tz/eyB0Dxx+Q2Nvi35DiCmFu53NV1fJtzWj5AvV/khqGl8GbsQMXJ6Q6FYYbHf
         tN3A==
X-Forwarded-Encrypted: i=1; AJvYcCU6RjcGMlcnS0byby/jJTtF/YMV4BOLaTEsALAKfv5RuIcGaE6SEb733NVs/QfV7lUzWcI0RuLdHBnGxvg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvpjsyGat1BuK03zbGOmv5fkzr6eBURJ1ZHCuwuDYpLEhThY1y
	7PHlxJxb3+zRvFjo3G7rXTQvIsZUp6qpBU5xO30O5PHdqwIk2GGA63kesjA2VV3T8ur2PdFvNjk
	=
X-Gm-Gg: ASbGncs1bf5/rwsTOJ+c0hrZ0rpOqz7prcTWpU7D5dEak9UqgOmeTvTR7fCP23PsuVm
	aGQy/pRtKZ0D0waRohpTiu0PUGqm2k2rWedkcYZyUCuQj6iLecMZGhZoXjWNiKcD9Iwb6FHec29
	RO3y7Fw+/OYcAnH2DJRJdZKUGqEfOEkMLba8Tve62L8BBmlvN86+Yoqi/Q6eMu+ZnseRs/KmjmK
	dHfR37RKmS78K3q+VBXphTeTFFEjdyBNl9es8vCIZBbknEu9YnBqIryHLUwD2kbTy2TpOFAK2ks
	PM4D9e6JVSRMfXDgCt1LAkWLj6l0g/eUVWdvOUJ3B5JgBShS9CYkIDKpx+L9CHC5nL0mJSvfFSS
	aUECfVl+lm7rGsrutaq4P
X-Google-Smtp-Source: AGHT+IGpQMTVAyxJa9CK2SFGohMZaktmVvVgc2/bQ92j0F5OJwvRHayzQvbnJzUIL7peYa7lBWAoEw==
X-Received: by 2002:a17:902:e943:b0:224:26f2:97d6 with SMTP id d9443c01a7336-22ac3f9beafmr6540105ad.28.1744151119965;
        Tue, 08 Apr 2025 15:25:19 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785bfe9asm106872595ad.55.2025.04.08.15.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:25:19 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 09/18] staging: gpib: gpio: struct gpib_interface
Date: Tue,  8 Apr 2025 22:24:55 +0000
Message-ID: <20250408222504.186992-10-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222504.186992-1-matchstick@neverthere.org>
References: <20250408222504.186992-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 86bdd381472a..7e85dd29ef93 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -1306,7 +1306,7 @@ static int bb_attach(struct gpib_board *board, const gpib_board_config_t *config
 	return retval;
 }
 
-static gpib_interface_t bb_interface = {
+static struct gpib_interface bb_interface = {
 	.name =	NAME,
 	.attach = bb_attach,
 	.detach = bb_detach,
-- 
2.43.0

