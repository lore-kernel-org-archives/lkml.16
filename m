Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52374145355
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864917; cv=none; b=OxXHskgFqutYcckdYdp3eBsUMo7Qbzav06rLKDHXb8YbWM0BEoe/BVf7KLOqRB8P38WsygwtX5NWUgeoFXD2vuOZGbeMXZP2L+LTvIU8eKPlXoKks/G2a4oAKpTiOr1InoggvCXW817E6hIL7L6K0VbwS+fdBNgYcg+fJmfWd7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864917; c=relaxed/simple;
	bh=zuIu2JkP+VByMmwOo0tadAV1iHKJrDP3Abn1qg3Qzl0=;
	h=Message-ID:Date:From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Disposition; b=fWxINCBmJUFNwux95T3IBqebMUq+ixiXXkIsw86AK/sr6TnYHd1czHh1K/bx6wusblXT6bWsgVqUuWLmNaAJ6xVooVCrzQJlNIDXt9MyTYrXzL99bWChXNqfxRnY48CaSxugqMXjCoLfF/4axv3L4oU5knchVCKUxhjgRN35u34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nwol3brN; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nwol3brN"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6114114daddso3544899eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750864915; x=1751469715; darn=vger.kernel.org;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yzp42f5lewsnvG/FHvqlSbFmAKtKH3G1kymBQyanvJA=;
        b=nwol3brNJkPydHOfJL1YVRo8TfqXQcm4eWAJEth22fouzj3WlhAiWdn4jp5UG2++p6
         GJw9fisPEldRd9oGGVfHhoWXWbecKe5MJMSWHeeW9qQSbges5O6Ikoh0VpnaC8NyNF7Y
         2Ts3umvqBE7mCqZqf581uWSYhktyI6/+MMC8FEV7b+qT1c/GYKYQa295RsynxSIdEWQL
         j0DBYe+MWDJn6keLNnpiTK8JqGRd8lv67CGnXPY5yKPaMCX2q9LTJbByNodaF5KM3fCl
         +sxlO72+LcCWgVIpBpO94CJqusF+3uAh1dP8FvQMqEZl3jYuE7Lz0NEkEZVgRXEjqX0P
         liLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864915; x=1751469715;
        h=content-disposition:mime-version:subject:cc:to:from:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yzp42f5lewsnvG/FHvqlSbFmAKtKH3G1kymBQyanvJA=;
        b=EyENbcwmFpesimYw0FN9p6iIWNN2YmVrqjE6KIh3i8pMlL27cB7AXP2JhXbKqVa/sY
         EVIM0zElLX8EFZAUwRY2HAb4kuYsbS/1BjdgavueUWhMd2cPcOkjOL2m9el+EHqRyt1I
         tNn/fXsMrMALkvaly5b/3Fp9HEGtJTT9EeJxRvhfJT07xosqOQx8SGubuO6CiRXyWVv8
         yBu5QnNu+4NqCvn2XMQuM26o6RdHtWeBDoM99gl2Jo4lKHq5NkAnRJ/Wc3Oog8zo4iPd
         e4IxISTyXqme/yGBIVvpHuS8R8RwBnmfdermVzWiAOZtUfvRInBHCpqtTfquRmtU3NhK
         sgWw==
X-Forwarded-Encrypted: i=1; AJvYcCXH5f8vQlPuA3zCiMKXLQOA2WIV+XqcnYRwqXLE8kzgsufB5uc7YnytTo6PQwYKvuThusLuHUQ/422+nWE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzegHKUmxFMkjTD523Pej+4MCJT/6BSG3RvDiIOrlifYoimII7S
	p4VY4+a88zk/ZbCNVifbKiVbQBCuAVIH1rR1Pwjl6Y/pjLrvIaOm2w0h4YxNSzjJ5HQ=
X-Gm-Gg: ASbGncsA7OLJ7YniN+YzzChlA40oxzOsxu9h0Wt2p8W8BnyAFnhnZiiK74SgjHUiLxo
	qMx4qYOrXx3/aReZmFAKXT/VZtlgMfkhLhOVbpdJzpeWf5I4EtgHnXpIpsyoHGg4c9tqqiLToQp
	ZOKSrURA9Cs5GcUQx9i9CkVlavAQAoQR18kAT78rhGqr57hj9a3NQSlPe0oKkP5HI3Rk5PIccXZ
	THQEbMUzZHHYREdW/U204VqPdipkUA6UqwNCHdGtMII3kddmsHrXwYIz0+BAU7MQuxrgLffGB8o
	bZAvEjAPeuHiSfF8tGoue0BhdwZZ71d0ovDNzUPkJqSGyB8B837Heq2CXrBv4mebrj+smA==
X-Google-Smtp-Source: AGHT+IE0sp7UIYpHTtNI56eLO5T0nWk3x41wIaH4yAbmtO92FlclbiE0NYj4ZNNE5zKNcwsYhAbJ1g==
X-Received: by 2002:a05:6808:1781:b0:404:e102:f684 with SMTP id 5614622812f47-40b05751023mr3392045b6e.13.1750864915540;
        Wed, 25 Jun 2025 08:21:55 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1fca:a60b:12ab:43a3])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-40ac6d11b42sm2202921b6e.38.2025.06.25.08.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:21:55 -0700 (PDT)
Message-ID: <685c1413.050a0220.1a8223.d0b9@mx.google.com>
X-Google-Original-Message-ID: <@sabinyo.mountain>
Date: Wed, 25 Jun 2025 10:21:53 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Prashanth K <prashanth.k@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lianqin Hu <hulianqin@vivo.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Michael Walle <mwalle@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: gadget: u_serial: remove some dead code
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There is no need to check if "port" is NULL.  We already verified that it
is non-NULL.  It's a stack variable and can't be modified by a different
thread.  Delete this dead code.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/gadget/function/u_serial.c | 7 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index ab544f6824be..96756a489d6a 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -1501,13 +1501,7 @@ void gserial_suspend(struct gserial *gser)
 		spin_unlock_irqrestore(&serial_port_lock, flags);
 		if (!gserial_wakeup_host(gser))
 			return;
-
-		/* Check if port is valid after acquiring lock back */
 		spin_lock_irqsave(&serial_port_lock, flags);
-		if (!port) {
-			spin_unlock_irqrestore(&serial_port_lock, flags);
-			return;
-		}
 	}
 
 	spin_lock(&port->port_lock);
-- 
2.47.2

