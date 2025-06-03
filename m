Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33BC4C92;
	Tue,  3 Jun 2025 03:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748920889; cv=none; b=ThVRHmNw2/5BtaZF3Flnrfm4qUVUOWBHzxTI6Z7xl4CntG+YRuPKKHqqhDMqSSHN10d2VjbXb89nN5qGseMl/EV7OSWi3mcNcH5PdPInWWqpIisXEWbTAx/CPvkcJj4sGf47IaT6yFDLDdznxWY8et+g9Xapy3bmWgm6shLD7Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748920889; c=relaxed/simple;
	bh=+MCGyiFoj163GQ4SdScgslfTtU1bGfCxA1Id5r9orj4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JLrfu4AfC88pjRKMWXA1tFQSL473ArB7kvWy535UneT++OXDFsssudcY8IEgy0wnLZRC+btdTB36uJVvAnHHLV6XHOiJDvrZRcjqoihi8xvIWtF3kFbSIiLhQkxGh+EPs6r5noqq0PTOjvxFJlKKK36phxHmqnGVJDuq2uXoJ7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e3WixAD+; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e3WixAD+"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso6462293b3a.2;
        Mon, 02 Jun 2025 20:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748920887; x=1749525687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tTnaGWdB4hgkfh8Hd2ADSGObagE2/WLWzPn+jkGndp8=;
        b=e3WixAD+pXhDEE4EEEyNEmbdYYKP7WpxLPiD8SR8pztjIkWARhlFX0Bgan0q4PAzPV
         vgahTcOckWgwAzFpDsd5OJceTwdw8xT3Nr3/nnDmd1RbrysSYOkw2ahfxaU1STpJ/88G
         0X2FjSgbdxQHWfKT32OqoOpAry7sI0IEKVGKU7Pzt59hZKDvH1jaXyEPRRKbuwnQG2xI
         6/hPc3V7DAkCkV8lh/k9RWBi4/NNLNOLO774+KPrGe1RN81eGTXbqlyf24cxqrYgpuBm
         +N4gTXAOFCKCf/3j/YAdkltMGFXTEbGbMxj5zHn6SFX+cX+hbHA4ddSnriSuXwchGaQ5
         Sbbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748920887; x=1749525687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tTnaGWdB4hgkfh8Hd2ADSGObagE2/WLWzPn+jkGndp8=;
        b=S+Llm0/udOFQQFE8hvTvcxBsbzG6R9E/dEzGoXGz/Pla9HFNxPWI+HINrllt9VDX3P
         DBIUumO/i0PlG6lBNv+piUf8HPbOGq88yOz5JPU4FisycPxVPEnKZTWqJa5KjY/ABE+x
         5jpiqm3HNT+e2uaL/qJoAERi/zMndNnv7RzkXpIfKMDgcWSdHeajH2d1ib3GDWcn0Uj3
         of7HIfzwn67+eBzx0ZvaQgN3mnZW3lYmtnok0Ho+NCgg36bFs2mkElCQ/US5U0no4YUp
         YUZhHQ1h6MTI6yg7QjvFrB5ycx44TQ7dfvihBIMxzvEVcO2+H4Q9JwpckOMwOQZxYXPk
         ljFA==
X-Forwarded-Encrypted: i=1; AJvYcCW/R+b4P1u+qV5UHpF5ffGVEKp0E9GYesWe8G0mtSolqajk2PynYajhJi7oprqVAx/I9l32WaAKfJk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/nsbwwfqfp7CTNkiskgWKcOoaQKVUN9bsG3kBjZl93VAdsAep
	x6ynvHaUPJ8KOs7Hewq5zekXkC/ycnUd/LmDX10rw88jHS1AeYVOA99Q
X-Gm-Gg: ASbGncumr/Q5749/w11OQ72buI1w+8z8rzFcGkjCbCsN0sh7YYhpB2GEG43pmCkLZGT
	rG5wCpExtXLhKKyVtqDsbAnOIM2jVPPKoh4QsYztIXiBAh4zdZSsijO4/CBSR0Zo+ZRRccEFYZX
	v+9yevJZTCxs4J6yWkBRt03jQ9q5Y3zv0HcqKkJVOks+0WfNc+8XN536qpnWCa+hGQysXFminRp
	62+ko7DQeSe85W9fvn8o5mXrqG0pbRwUL6+tNorHfN+mnwjFrT5iJUREbkKXirOtwcj1abztshL
	efFNw7jGWSG/1ZJ0VXRCw6OjSHQcpRath5RQzMP5FcGl47Z4Rdi8a8yzRT/7f510pX94AUU5jXS
	hMfYEqW2FGjq46bYl/o/Xgl1O9qe6qdjQt7s4QXVASx7rs00+jplJTEcNoUqD4FdxIw==
X-Google-Smtp-Source: AGHT+IHqaQMicBQLryNa4dKPf3wUERioG1d+CGxGRw3kiVwNTF1000JWavPYx38aQpXZgDpseqislA==
X-Received: by 2002:a05:6a00:22cc:b0:740:9a42:a356 with SMTP id d2e1a72fcca58-747c1bc8985mr19773383b3a.11.1748920887008;
        Mon, 02 Jun 2025 20:21:27 -0700 (PDT)
Received: from cs00-MS-7C09.. (2001-b400-e38d-e87b-a123-c29d-1136-f01d.emome-ip6.hinet.net. [2001:b400:e38d:e87b:a123:c29d:1136:f01d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afff33cbsm8387602b3a.158.2025.06.02.20.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 20:21:26 -0700 (PDT)
From: hsyemail2@gmail.com
X-Google-Original-From: syhuang3@nuvoton.com
To: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Sheng-Yuan Huang <syhuang3@nuvoton.com>
Subject: [PATCH v1 0/1] USB: serial: add support for Nuvoton USB adapter
Date: Tue,  3 Jun 2025 11:20:56 +0800
Message-ID: <20250603032057.5174-1-syhuang3@nuvoton.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sheng-Yuan Huang <syhuang3@nuvoton.com>

Hi all,

This patch adds a new driver for Nuvoton USB-to-serial adapters
in drivers/usb/serial.

The driver supports multiple virtual serial ports over a single
USB interface. It configures the device using vendor-specific
control messages, and handles data transmission via bulk endpoints.
Port status is reported either through an interrupt-in or a bulk-in
endpoint, depending on the hardware configuration.

Any feedback or suggestions would be greatly appreciated.

Best regards,  
Sheng-Yuan Huang

Sheng-Yuan Huang (1):
  USB: serial: nct_usb_serial: add support for Nuvoton USB adapter

 drivers/usb/serial/nct_usb_serial.c | 1523 +++++++++++++++++++++++++++
 1 file changed, 1523 insertions(+)
 create mode 100644 drivers/usb/serial/nct_usb_serial.c

-- 
2.43.0

