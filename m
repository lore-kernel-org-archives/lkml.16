Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51F62F5E;
	Sun, 30 Mar 2025 01:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743297920; cv=none; b=ZzNfuiGX2TI9040PCYmuCBzjzDkT7QgLUD2wkEnP3EtRrCEuijUXWZpcd/5XpWH7sn0andSHSJR3oaWXSZ8QJ+ufpX629xnO0cq6gpHz8QcX1v+2QjO8BJz9NGwfaK1o+GxZivrA7xX3ma+/utxO21mNFIZCZz7cZlHsMPeT4jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743297920; c=relaxed/simple;
	bh=63YAsRcrUP7aTS8gAI4HjbVeysFlkxotoNZUiIvo1KI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hiZG3iT/6GdoSk7/eUB+LrMHA4/cKb66oC5LSmQTPSORnPta6kygM3JMxBGJ6wsUAvix7wNEYHtyUTDIzHLK3EHbVQ46oiehVUNqLPy4ogaqGZMWhBAnRLZXHOB+RJeHlUjvdbEnvjV5+N7tqAQV7kZI2I/eXYwmA02QddWoB9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c9uxCmn7; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c9uxCmn7"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so23483875e9.1;
        Sat, 29 Mar 2025 18:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743297917; x=1743902717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0YBtgoHQ8wdNpKVMvmo1Gs6WFu0m4rSJTZCQrvW/Ocs=;
        b=c9uxCmn7iDXVkXtI3YBFwj8lznN4B/5m6PdRwgYDUJWQBI/UzR7nH3qUUYPxTboMzX
         sl1N2lYaVIlW6kd6tLmtgmYnTqmuEU+soL1sd+gf4NUiX93lfZ4nCpSrH041Lb+Z9lCg
         tYXfaaQ2p/6n3LNXya2AyXN31b6ZxY/7zqW0HmW//UNh6+yFi/cOT+HFdIYEG9LLzqbz
         gNyZUfVo5DTRw8TWvJwG5mhDiAVetJBuk0XSHKz6dBnFM+HYAyabc3feO11z/9jtElhU
         XEJ95MCdxo8FPVBYgLu5+IPTcsJj/J/2D7eUNpl4HgIgx/YYuwH7jkDDGFmmatnsmGw3
         z4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743297917; x=1743902717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0YBtgoHQ8wdNpKVMvmo1Gs6WFu0m4rSJTZCQrvW/Ocs=;
        b=qrDc/rGhkW04hLiNidmjyzdaBFJVEwYfLU0215lcaitJJEnj248nmVLCEoLJbYSuXL
         0C0EAGj6zSCyR89oXVVbr8OH8OCWzs1nwm+sJHztRo165QJiu/677xmusCaghCcrWPOb
         e15P6B42ar7+2B8ID3Vcufzaqps9rkDTGpdNjgQhPImVP3cwfnHeflwtHC8oijAWR8fo
         VUvJJIOGRhEBZpSYd4APaFVdgW1muKuHTyJzNZLmVn3cR6EAxmzUDHWBE8PIICAQ28Ge
         Vmu7qSB3mpwg6Oy0lKSFgmkKGMWToRlvn3vGkJKbYKSbzvkqzMfh1xaM/4A2EYS1p3oz
         e6gQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJa+yousjqEdqXnAHuXfOpyLdDVW54uUO/bf9WKV8RndXAvbw5AX5Gf8tVSRA20C0JGJePxmHPZ7/s@vger.kernel.org, AJvYcCX1oQ/7xkBXDHS1CZqTPkQov7G7AfPXouS8AAG7pHQk0lq2rxvYGzJVC/mMOJbWui4y0B9IJMLff2vOUvI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrjYcT060E9AIZquNTtGeYP486dacpCNRdvHFiNz2+hdPVAB1w
	eIdfYSg+BF0y2rbwjIZADpzXAIqWGw1K2cT3alKYbZEle9bhvI+B
X-Gm-Gg: ASbGnctu4Yyf/QD3uxvDTtjFMjpiJm/tIpNeznoHf68VNCyVFzPL6odaEWg6JH9Ejq+
	f7mpRVlK6CKPko+WbxlndVCuehPNMuKBDogLL88pOm0Oz2Xxhnxb4rYcaPPWfn9zK+wlP+Pdfw9
	HL8OHt0FVUdNMcYFE+5qxze2vIOc5LpsCV6BcO7zY/UdgD57joM0nfdWoNVlF9hieWeBU9rptLC
	5t+B9BACrDecpzUV6J9KeVJR7iBCsghAj9e9EjK7f0D3KCQ+OPm4Qzcs2za0X1mTPSJJNC0GDCX
	TXk1gOx0CSsD5bhrj+yKLRQ2C+aYWbMK3lAiMHePQiOLhcNp+IdWkZHZ7sdI5vDzR+CNgDH4Ilr
	Cw/aqlpiBe9iUupomheDCGDOg
X-Google-Smtp-Source: AGHT+IETgakP77R1xNRKQkY2RX9kFRQvJyHoxZlC3KNeSg7iURqiKwJHKtUZE8zqkLBK2Qu2lsdF/w==
X-Received: by 2002:a05:6000:4282:b0:38f:3073:708 with SMTP id ffacd0b85a97d-39c120cc9aamr3108884f8f.3.1743297916783;
        Sat, 29 Mar 2025 18:25:16 -0700 (PDT)
Received: from localhost.localdomain (84-72-105-84.dclient.hispeed.ch. [84.72.105.84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b6589e4sm7321606f8f.10.2025.03.29.18.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Mar 2025 18:25:16 -0700 (PDT)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: clabbe@baylibre.com
Cc: david@ixit.cz,
	gregkh@linuxfoundation.org,
	johan@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	martin.blumenstingl@googlemail.com,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Subject: Re: [PATCH v8 1/2] usb: serial: add support for CH348
Date: Sun, 30 Mar 2025 03:24:51 +0200
Message-ID: <20250330012451.13711-1-frattaroli.nicolas@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250204135842.3703751-1-clabbe@baylibre.com>
References: <20250204135842.3703751-1-clabbe@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 4 Feb 2025 13:58:40 +0000 Corentin Labbe wrote:
> The CH348 is an USB octo port serial adapter.
> The device multiplexes all 8 ports in the same pair of Bulk endpoints.
> Since there is no public datasheet, unfortunately it remains some magic
> values
>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> ---
>  drivers/usb/serial/Kconfig  |   9 +
>  drivers/usb/serial/Makefile |   1 +
>  drivers/usb/serial/ch348.c  | 736 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 746 insertions(+)
>  create mode 100644 drivers/usb/serial/ch348.c
>

Tested-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>

Quickly gave this another test by just connecting two ports of a CH348 device
together and making sure data arrives unchowdered at the other end when sending
at full speed with various baud rates. Seems to work about as well as I
expected my jumper wires to hold up at higher baudrates.

I'll likely use this to lessen the pile of active USB-to-serial devices on my
desk while working, so many thanks for keeping up the good work on the driver.
That way it'll also get some more in-depth real world testing in th e coming
weeks, but I doubt it needs more testing at this stage.

Regards,
Nicolas Frattaroli
