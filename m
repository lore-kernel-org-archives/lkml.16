Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C0427470;
	Thu,  8 May 2025 17:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746726490; cv=none; b=TTyQIPQRbBCFziTUBH0l7+/aYXuCa7jkJBeSFoEGgWhIxUy7NvJ9Bm88P0M25SqZCqCmT1Af7cIjxRkJI86n+LwMUhMqLRNVt/8nrd4YivYARZS4ldmBVCR0UxbkaCEF3gtBJ42Dk8kAJqkBY6tZ/IAmhu4d4QiZAemaGozBeQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746726490; c=relaxed/simple;
	bh=jd8KDAA5nklc+QafKfTYSqBKgvLQkQvUCe++LG8aEvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i6BtFt2hYL7XRMiBoeQw9Vh1ZYDrVhTnV2UHh00JfqBidfVb3+AbQbamafRkok2Y+9uC7XQKc7bCZTjU739L+7m2QOIT7unFqZE8b2gppHNV5DoSA9/SdOkxd/eh8JMFtN7ATrcsw1fKTWi+wzBa6+v4CfLanfYdyLACstv5c08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J+7vBBox; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J+7vBBox"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22e70a9c6bdso21948185ad.3;
        Thu, 08 May 2025 10:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746726488; x=1747331288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LyB1B4pYcWiPvT1oUA/MLKveWlBjaDgJpcmCpY+cTqY=;
        b=J+7vBBoxfUGfFqp4pvOCwaWdDVTUmL+MWTLycAYCOuBgOMEX3c0xH8I1TZQwpfznzt
         AAKk3kmZ6DyvduWFrZw1pwLNdu4KjIVkXwkE3ttGcnlbFtunGkOvggbZ0Rskff+ggKwn
         YqY1Hq/4l/EC+ZFul0bf9c1A4M1DqSJE1VkvOA2GVz9ZjRR23c9MSpTHvmvOOTcP8QNM
         DDErKgGhgql1DYL/qLcTBO9XWxqbHhi9Ac4jsFCF/d2GgoBlaAHvC3/+Kx6OVYg4ZYdP
         8YXZ1c/ICa6taLlpZca3/lXJcLaudNjINLExykx1qcg8PyaGt4AnxofnuMnz+gBleq/F
         4shQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746726488; x=1747331288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LyB1B4pYcWiPvT1oUA/MLKveWlBjaDgJpcmCpY+cTqY=;
        b=ncv19tcQZe9RIPFGrr7ZPS548EsLIH/yQrcbMlHNVkFT2OMZKTogdwqjsvkTTyr9uS
         1k09sSrtp7qe2TJ1ZJnSSRXhUCu3KwmoV6L8sRkrIdp045msWOE3uadqcLsNT18gtAfb
         TIJC4v1BsVSyJeUKS9/XR16hX2UriYXccwKIRrObKPUyEOd/MlZZYyXkVTJuUJZb+ICs
         Umx2znNUVvA7t90Yp6ghdAsLA2H3op5AkP1KVn4bPoUiIll7f69i2cHEfhhWdWKoZnlD
         zIp2GMrerj4w7UuxiBOL7WmwnzTzd/pf4aFuJ23RjUbCGngkPN6PvR92b/zgZZjxlbJT
         Pmpw==
X-Forwarded-Encrypted: i=1; AJvYcCWJ5E9oyX0tJOrQbUzOSsQWVvq/gc4saDb7//zfVHWi5xmGLqgp/SuVRCWf8kKEUGRSLESfla2/P/IcwN8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtvN9EEwJpXaJVSLPfT1FT18uuDdbFc/DCJy75GTVyOt02Aonn
	szqvlFA240bypcQ2GpDsTme9GNcdtYO2hCSTkA3CvEIZ5nNCgqsw
X-Gm-Gg: ASbGnctUIR4o9YkobVlE1dbiVrnRr7aTRJrHbmKNG/hJUl0Cjr0l785U6yVeGOg3+zE
	892OUuyC+4Epc/XUkPSVV9cW1lfrBlBM43QQBqMYdJZ0tcJ/0GZGMHVNDzZw2RZlhCrYOOl65aH
	73UiX++Qu/WT8N4JcDHy0Ke1M7fUG+eLchbFSrNpoV+o6fQD8UYRzrVrlB7f/usk++ydHY6NR6l
	pXFO3ly9hxDiprxuHkoV0fWpecwfe9csZF85uzb/z4AFvz+SE2DuxIhPGFStUMO/CaYqZJHj0eL
	8pPys32yVDqhwulwfLBi+sKJrwWSJlVU1krRS8vOoTi7qRIHAi0huLcj+2ZVWTGzUgEZQQR8JE3
	JJWtbz8lHOvYEbTCZSDH2910jtCziyG/h+WtLih4Iiw==
X-Google-Smtp-Source: AGHT+IFF8ECxX861npZizaTDpVgNfnpXLpSwnneNwDnEuZFmAQyOqLGa230XZ7ytSJuLE9MO8Y86Og==
X-Received: by 2002:a17:902:f682:b0:224:a79:5fe9 with SMTP id d9443c01a7336-22fc8b59bd0mr3479565ad.30.1746726487888;
        Thu, 08 May 2025 10:48:07 -0700 (PDT)
Received: from cosmo-ubuntu-2404.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc828a3a5sm2023315ad.161.2025.05.08.10.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 10:48:07 -0700 (PDT)
From: Cosmo Chou <chou.cosmo@gmail.com>
To: badhri@google.com,
	heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chou.cosmo@gmail.com,
	cosmo.chou@quantatw.com
Subject: [PATCH] usb: typec: tcpm: Use configured PD revision for negotiation
Date: Fri,  9 May 2025 01:47:56 +0800
Message-ID: <20250508174756.1300942-1-chou.cosmo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initialize negotiated_rev and negotiated_rev_prime based on the port's
configured PD revision (rev_major) rather than always defaulting to
PD_MAX_REV. This ensures ports start PD communication using their
appropriate revision level.

This allows proper communication with devices that require specific
PD revision levels, especially for the hardware designed for PD 1.0
or 2.0 specifications.

Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index a99db4e025cd..5a58c21c4d14 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -4782,8 +4782,13 @@ static void run_state_machine(struct tcpm_port *port)
 		typec_set_pwr_opmode(port->typec_port, opmode);
 		port->pwr_opmode = TYPEC_PWR_MODE_USB;
 		port->caps_count = 0;
-		port->negotiated_rev = PD_MAX_REV;
-		port->negotiated_rev_prime = PD_MAX_REV;
+		if (port->pd_rev.rev_major > 0 && port->pd_rev.rev_major <= PD_MAX_REV + 1) {
+			port->negotiated_rev = port->pd_rev.rev_major - 1;
+			port->negotiated_rev_prime = port->pd_rev.rev_major - 1;
+		} else {
+			port->negotiated_rev = PD_MAX_REV;
+			port->negotiated_rev_prime = PD_MAX_REV;
+		}
 		port->message_id = 0;
 		port->message_id_prime = 0;
 		port->rx_msgid = -1;
@@ -5048,8 +5053,13 @@ static void run_state_machine(struct tcpm_port *port)
 					      port->cc2 : port->cc1);
 		typec_set_pwr_opmode(port->typec_port, opmode);
 		port->pwr_opmode = TYPEC_PWR_MODE_USB;
-		port->negotiated_rev = PD_MAX_REV;
-		port->negotiated_rev_prime = PD_MAX_REV;
+		if (port->pd_rev.rev_major > 0 && port->pd_rev.rev_major <= PD_MAX_REV + 1) {
+			port->negotiated_rev = port->pd_rev.rev_major - 1;
+			port->negotiated_rev_prime = port->pd_rev.rev_major - 1;
+		} else {
+			port->negotiated_rev = PD_MAX_REV;
+			port->negotiated_rev_prime = PD_MAX_REV;
+		}
 		port->message_id = 0;
 		port->message_id_prime = 0;
 		port->rx_msgid = -1;
-- 
2.43.0

