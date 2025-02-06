Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED03121CFE8
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 08:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738830042; cv=none; b=mqROnI+chfFdLoCpD8eOnPcvWWCLdJCKNRN75yz0OwkjvqnION6gYYJ99gzG1z2p2m3iYNPqqRxdst7fFo+POHHivVJA8pXElSf3VMLq746vQXcn448lLvDDbxc4aW0Ayt6kSaqUNhLAqi40nEDCrfDKYJl9+l6+F8X9kBmnIyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738830042; c=relaxed/simple;
	bh=gvvj+VL2oy/SYlCfXe1IkAWYcwruIZvvhOBZmeM7UuI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K7x7xVkTyBn5o6wvbGksno2PjOR2eS8zCNWH6lKcpv4VaVurD0vPP63TZC0i3ejP1fKu6w37k7QWDCneOrjOKP0oPCOZqco4l+//dRzd3IbnZ9qLhi9wf5Q0SIlIewdM+glKtgIIVbYaEut5PullHWUYNVU0m9AdN8a7POxvBW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XPKH7iJb; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XPKH7iJb"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43622267b2eso5975245e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 00:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738830039; x=1739434839; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ZsjqPZJwxPhczAVuwJaDZW5cSu9f0BQ2iUCT8QnQh8=;
        b=XPKH7iJbLj7EdNd2NZritpx2z9UQ6Wd1Sm+gMINIVAqd+UlxPU3ZI3ggGkcR3me2Wk
         VxkuZ001mmRkrbsnwb4P72Cmo1Qgba3J5BcrITv8YQe1O6OuIDEgS1iRk/9XETgvz048
         gRrWZruOl3+lAHd7YJAO9iEXLXJVz0BK91IALTgML5nUCk/PauUlbQUNArh89A2Fsvs1
         o/E/19MCQ+WQa9+Tun+jlpoRqawVMiLQGULhj62By5WPLFdvfhs3nuVueBPekn6iLVIs
         KJ3eFk9BLXRC/IdbnOasgo5RjszxPyKJ+H5NSS9UPoxGXSKQh6XxOtnFScf40UyfXjTz
         Fdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738830039; x=1739434839;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ZsjqPZJwxPhczAVuwJaDZW5cSu9f0BQ2iUCT8QnQh8=;
        b=RhCjbHmYkjESymKjB22q57ZxrsRceT/W5EUSaLgi3bRhdIUz13ksutcVvMxXeyZe8i
         teJlemp9G7cOoVKyHG7hYx/WcQe8nKgYme/mwrrdATipAjBwjkH27RrZwpNndmK1aHOV
         bsagt8Pd8RJLZ2gziCsLw3nU/9k7iOp6TpRwkIylj4sSvzm7S3hEMFWvHvG08pb9asJ/
         qpXyg6kA8b/E+xV0dBuN2aGFXjQhKlER1I2rX4kiIclRuNmiu2XE6G8pLLcCsz50Rml1
         TIQyg0w+MscUDaGYU0h2OHBf6iARMhxCgX7KjPWFlqalI7Kl4sOCAQzSfsYjMGISgf5H
         9Dxw==
X-Forwarded-Encrypted: i=1; AJvYcCWrFY6uMYe6tNEv1qUl9le1oXmuutnAEFLryJ083THQwh2X+6exBCtxxfErAOEISz+zVDsZu/9MYmpNpMQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+xO4fqYRS3w0E1RcPqm78grQcAaB+aAFZqyvx1JXZNShUdItE
	2b2Ws9Nm8DjKSGbHvH8RAm/3qSoMyxX5Nzwa2/NFz3JBCwFqjlonZE6o+B+vlhI=
X-Gm-Gg: ASbGncvUMsS9OUmhe2Vln06x0/LSNQ5Z8gY/XmMi+efC1lXzFK6+Z70OMBhtclBXTz+
	8Tp9jGHiwX6LW09CC8CQWL9rGPJrIoy01ksyHaljw3/77WypXcunMm21R2D4OaQymcKMeyxWjJC
	aqA2kGavTk2SD65jLrdWrGXMV++ScTBjFjkjVxfEGGcZz6AKslN2XC2sgwQ088kf473QF4mXur7
	cHDUBY2R3mO5tD3jLO1JcayedXxzWHKZPvR27FYegjPm5GIWsSWAHEO1SnfLvjI7rQVEKj+CLNX
	eOf73wL6oTYJvDquyFNa
X-Google-Smtp-Source: AGHT+IEw672wkeMRWS0mG0ONJyCs+3Lw27g/wNKsVWY4s/Z5oEiommyWvGRy9G5wlJR9rng6ZVaR0A==
X-Received: by 2002:a05:600c:5687:b0:436:713b:cb31 with SMTP id 5b1f17b1804b1-4390e17e820mr44665435e9.3.1738830039214;
        Thu, 06 Feb 2025 00:20:39 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4391dca0179sm11159505e9.11.2025.02.06.00.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 00:20:38 -0800 (PST)
Date: Thu, 6 Feb 2025 11:20:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] HID: lenovo: silence unreachable code warning
Message-ID: <4585c11a-3e85-4f26-b1e1-0aad5e05706d@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

In theory, this code used to return 0 if CONFIG_ACPI_PLATFORM_PROFILE was
disabled.  It's not clear if that was a config which would actually boot
so we've removed the CONFIG_ACPI_PLATFORM_PROFILE ifdef.  But now the
"return 0;" statement is unreachable and static checker tools complain.

Delete it and pull the else statement in a tab to silence the checker
warning and make the code a bit more clear.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/hid/hid-lenovo.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index a7d9ca02779e..0fe487a6c071 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -728,11 +728,9 @@ static int lenovo_raw_event_TP_X12_tab(struct hid_device *hdev, u32 raw_data)
 			if (hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB) {
 				report_key_event(input, KEY_RFKILL);
 				return 1;
-			} else {
-				platform_profile_cycle();
-				return 1;
 			}
-			return 0;
+			platform_profile_cycle();
+			return 1;
 		case TP_X12_RAW_HOTKEY_FN_F10:
 			/* TAB1 has PICKUP Phone and TAB2 use Snipping tool*/
 			(hdev->product == USB_DEVICE_ID_LENOVO_X12_TAB) ?
-- 
2.47.2

