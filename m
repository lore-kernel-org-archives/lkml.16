Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F471C861A
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 09:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743845261; cv=none; b=NGNYbQgwNAHBGvIrEUriTOlCtstJCOOjjNNAU6SyZzduDWtUT0uHbBVF2e3SvVFu0g/BOS8lnHoZso5FeGC/Ukvciju/Ws0MheCDhfzWyqf1rTuNb3A0GgFDvJ9ZkiVFo0FIZUF3c7zbLXkP8+ECvHfQzf+20vg7NYOKavGaZ2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743845261; c=relaxed/simple;
	bh=SdTjxolhxMdpEMLdv2bok/HJQZH5YHyXLZcK4xTHZec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HCP+dNDa0PIjGEeuZ1c/3o2LoFimBuRCd6kULYPAXtZQpKkGs2qZnlDgQ1aUQHgIhMp6Jz6qvdp53/b/CWpu+KqiyHXqHXm2CZiyIs6gmQtK/MKXIeUdnoLhrcR1rxM5xF9rjNdQW02k5iPsbajZOvHSiD7WHU5NjE8kuvjdrnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=f8oe5KuG; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="f8oe5KuG"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5eb5ecf3217so4810850a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 02:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743845256; x=1744450056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9QgniJ6UdmWL8To9NYgCLVFTHa10nmpPKSIlfTFU2tU=;
        b=f8oe5KuGorMguiFhBIf0tDLKaA9DQqdvfhkOei5wAJCxhJLa/YkAaLKLuLm2en6XNA
         t0XGEWdNOC6KrF+/OvP2IMcLuOkN0ujAdkr3ODufuOzcDR5d69se5ZfWtA+gVmk6RIhC
         La9i3eS3iBVeiB6MNpOJ/B/egCp+heXmyTszzhk6Cpg0nYRP/yWn1E1AWWfgJsW7awnD
         RHBXpQR6xxLOvoA/wRFNHTF3esQcWBIJTPAsXTBnDaosgs5nRqbKDu61P/eR30Md/s6B
         u2Bl3pwOfhRpV3qW5881na9PQFIr+ezbvibtR9HwazvwGyAQktqoEZMXA+SRC3z/9dWe
         jIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743845256; x=1744450056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9QgniJ6UdmWL8To9NYgCLVFTHa10nmpPKSIlfTFU2tU=;
        b=bmZRDlfthH14uo5bPBQ1KlH3DbZs6qnrfx/7l6ttroyJgmv0VXNbV+xMmuXOc1kq1L
         2r25CEVL+s6sDbOW+aNXa1huBRkT0vACwLzQnfcvbHC4DY/+6JPDW47XhqVe3bzkK102
         5kVcJaHCjWUsxkjEa4A1XiMdsMrg2eGeQsKKickUfVq1BpOox6sWKvYul0tOyxw45C+I
         zJkTn4jLzOIrF/lj/i8MTNHXXn2AqJ26RkFKiHAHEfYzMCUYtB7P0dzwsPJERLinibNv
         8yaSbviEoBZC/ldzJeyBBgdJsvNUGN4lpzwJ51nMB32idUwvZAq1VDfE7QvN1ldJ1gIG
         C0OQ==
X-Gm-Message-State: AOJu0Yw1xjBsmtdHVQtlHQxL/pq2MJXmlfbDIVB2AxZkvdTI3XWjnkK9
	fHCOp9LxJFYFeKccJ2Q0jUDCURqweJDnlr8ZTuRYkquOskYlakTM9e1lzwwxvl4=
X-Gm-Gg: ASbGnctbtKwEJV9LqqP1suI7dDAsQlRH3vjIvJksKvDUAtNcrow9wni6yC3kQ7DmEjG
	bdgoNsmIB+HAt18fZIKYAUhGaHERmvpKmLvLHcUBvgoYjsVqAWu3IpvIpIehnadwp6E8svDnMZI
	0waSfoET2qDKQD2wpkegh3RLuYb5cki3gwLtZqKuQWo4QfR/o9YKJkb1fjCKfzzpfJZEJ9qz/xa
	6olu7MMJo/pEwqDZf06K+x85EFwgcGkCDRwD6rHcmKVtRTBO2WFVwUfgo2P5czMREfnEdHRJvJz
	x86PctEVXn7PTDAVGYnxmG+t5aH5JJNlDz5uChB3QJuleTxtmw==
X-Google-Smtp-Source: AGHT+IEbL8c+JGzPbn45puOitVnDeaHIThpApjBbi0QC6iao2fwFoA3sj7pZiaJmhvJQOzAGSNO8Mg==
X-Received: by 2002:a05:6402:280b:b0:5e6:44d9:57f7 with SMTP id 4fb4d7f45d1cf-5f0b3e4732amr4711403a12.26.1743845255834;
        Sat, 05 Apr 2025 02:27:35 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5f087ed1f40sm3442815a12.26.2025.04.05.02.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 02:27:35 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Michael Hennerich <michael.hennerich@analog.com>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Trevor Gamblin <tgamblin@baylibre.com>
Subject: [PATCH 0/6] pwm: Some fixes preparing chardev support
Date: Sat,  5 Apr 2025 11:27:11 +0200
Message-ID: <cover.1743844730.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1226; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=SdTjxolhxMdpEMLdv2bok/HJQZH5YHyXLZcK4xTHZec=; b=owGbwMvMwMXY3/A7olbonx/jabUkhvQP3wue3FO2D7yoPyX3tFXWCtPSC9wxXg/6hGTMVGZbB hUsSOLvZDRmYWDkYpAVU2Sxb1yTaVUlF9m59t9lmEGsTCBTGLg4BWAid05wMHQGvZ3cUu4YtHTp 6coW45J/V5ef4p8hFa0cvPZHwTankIZ5zcd8X3KV8W84vpJ5YuP6zPN+y88nLy7l0rM9cTnLuLL G9WP4rv+Zdsb3XjxQMVAW9f434WduiGpiv0aE95O5T7uZZdvK018/ruj1KZ8/V5DXo1la9VhDeo WpifGV+IOPl7c+yAsWdTY8WLbKvITd6Gy/u5Yi644lPVpzN8zxZt5i+P/zp7dX91xz9WTX1bK+p cu+IOJaaHvGkjkhBT0V6rM6e5jK8kSW7S57pxZz4oXsBE8nxqu1joLhd8+JX1m41p9XW9U+ba9B 0fzGfZ32j64rr7YwizpmKp1fVFSz83yM3/11HQna2zcAAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

while working on character device support for PWMs I found a few
inconsistencies that are fixed in this series. After that I plan to work
on getting the character device support into shape to get it into
mainline, too.

While some of these patches qualify as fixes I think there is no urge to
get them into 6.15, but given there is a bunch of such changes I might
send them to all together to Linus for inclusion to 6.15.

Best regards
Uwe

Uwe Kleine-König (6):
  pwm: Let pwm_set_waveform() succeed even if lowlevel driver rounded up
  pwm: stm32: Search an appropriate duty_cycle if period cannot be
    modified
  pwm: stm32: Don't open-code TIM_CCER_CCxE()
  pwm: stm32: Emit debug output also for corner cases of the rounding
    callbacks
  pwm: axi-pwmgen: Let .round_waveform_tohw() signal when request was
    rounded up
  pwm: Do stricter return value checking for .round_waveform_tohw()

 drivers/pwm/core.c           | 23 ++++++++++++-----------
 drivers/pwm/pwm-axi-pwmgen.c | 10 +++++++---
 drivers/pwm/pwm-stm32.c      | 25 +++++++++----------------
 3 files changed, 28 insertions(+), 30 deletions(-)

base-commit: e48e99b6edf41c69c5528aa7ffb2daf3c59ee105
-- 
2.47.2

