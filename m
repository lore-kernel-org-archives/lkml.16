Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8519C1E0E0C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 11:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743591708; cv=none; b=o9qrt7KniZvaMTIsevW9UxP0PzaSyce0rEaxgvJfWJLo7ejcOUbfnPEMQGqAsMHk9Fr9dmx1XOhs9Ah1LsPMta+JshEXNc3S/3z9KNZUzCeb6ul5OB1wbaXUY8XwbN4cwNT5fwCg2KNE2YKisOykahuVo24NaLQlPkEVhFtnbIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743591708; c=relaxed/simple;
	bh=YryIXZwiZj5TQVa6xgb5j2pgntCojc8vvWQXzdlrvxI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rKIaP5QhFdsHDDE9YyxQY7co/EcKxDZEhjkbxfTPvll46dUien+qdLyWnGHqTF+263EiqTmMs5oHPiRKKGYcZ+s/M7HkeJL6pqwRnd/7/FSxaxmEQD5lGTcUO2l7m5mbHD1YSgIreezAhkKj7DQMvQmLF6UygpUtpd39sQ2JxoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P8na8wG1; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P8na8wG1"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso65664385e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 04:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743591704; x=1744196504; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y6Xjq3Wk1adijXSrV6wojCwtoTAYgsAX9qsyZmP0AH4=;
        b=P8na8wG1ZlWbiC6nQEHo6QJSnXGmjZypjSykn66msC161sxkd0QSodR0WVx4yXo0dZ
         OzdmwzSavwGK32pW1676RBP1L0nOYcaipzNn02A6QBvBvdQ3xgLNXD1L3+N9eSX63l5g
         Ybgz6tZyX27zBA7TODu5zvvDe9+6brhl188jvYpgDLssPd7EFie6EqdFoowGqDOizgUP
         UVW0Kai38zgqie4e1ceknuEV1oEt2VR9PPPu0S7YCEFNAqWetps1trD8rshw7+TmaREZ
         Mty2WmylEGKck0mVGQdHHYkOn2JB+cUKZDSZM33RcgPjIwup24IJWluXcRmrhThcoYnX
         NySw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743591704; x=1744196504;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y6Xjq3Wk1adijXSrV6wojCwtoTAYgsAX9qsyZmP0AH4=;
        b=TMhq+cfAqYz+cPTeh5BvX8zr8pC9iWNzwJGtK5PDfrZCZmF1HAIf5XRoyAG0A5qbXO
         AGeX7XmPnorbeYStTKjTt8QBsIbCQd9PI99RUs3Mkf9Gv9jcEfQaN5fNuK8EJyHq/5eR
         vuJJRF8rbLSRj3q+B8RcaTlSOUX47hQnq+IXnNEtIiMtfFeCAdY4NE+3t7QCUZEipGRX
         mtPBV0Zd/CXx3g+zIaduXsCq4h8BVg/z63uyivt3RAfMB0K1RpnjEPsRdSFWNa9LPdTG
         OfdWHPtu5nWKjFWFTxopJ7k11rFvRLUz4EB0I9wsoZYOLGq7kHw/90x/cctgFTMsCXgc
         XkEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVNVnHC4xPmlQQD0nbeGO5fOgfJ532/Qm6LvPcdgECwuDlvJQIeMVZPo8BZpB+GmSFwmcZVbINLNvp7go=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfz3PCcWMZe8VGYShtMQl48wTgaGPZmgHuL+UHfzT6Dg+D/vgE
	6LBNJYAjFG+IZxMQ3PylVJb96WqOxVuybrUfJm9qmDM8Doj7/LUxkz74iW95n9c=
X-Gm-Gg: ASbGncv2T3wWFD6Caw+ywDpEqiBbec/Jmr7qtqaG1jrpai4f4dUGb4FXo3TAJJQVQ+D
	9/YbnzyZuhQuPmLb1bs2R1eWEKnQlZxPZqInZM0u4lqlJqWDinSeGLxDEz1JOGItZwaCE2JeXfm
	cxbmZxFWNmy8uU2HYZGOYEb5f8AUuMS/CzrYOoo8D9SaF4mGFgm7pXsibFYBaBMQ/KsyeX8o6vf
	hQgct7CYpqjeMhQl7ZwsGqIZe9tpc8VTD3r0gKtnV01q4HjwO4qXjinkm7gd0RqoE/OZbbLzeP/
	Iqi+cEuP8U7sw4d7xZWI83sAtAtE1VhmC0ln9isSWqLejBk4jSEKr6k05EcM
X-Google-Smtp-Source: AGHT+IHO1mXjqZOU9fX/s+6kuEaCBJHUNNDyFh8HkN6EexBt9U2YTxYwKeixp694XKSML/OGgpW1sw==
X-Received: by 2002:a05:600c:458b:b0:43c:e8a5:87a with SMTP id 5b1f17b1804b1-43db624b447mr157936675e9.16.1743591703864;
        Wed, 02 Apr 2025 04:01:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c0b66a75fsm16423386f8f.41.2025.04.02.04.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 04:01:43 -0700 (PDT)
Date: Wed, 2 Apr 2025 14:01:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Jeremy Cline <jeremy@jcline.org>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] Bluetooth: btrtl: Prevent potential NULL dereference
Message-ID: <0174d93d-f3a5-48ed-a755-ed7f6455c1bf@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The btrtl_initialize() function checks that rtl_load_file() either
had an error or it loaded a zero length file.  However, if it loaded
a zero length file then the error code is not set correctly.  It
results in an error pointer vs NULL bug, followed by a NULL pointer
dereference.  This was detected by Smatch:

drivers/bluetooth/btrtl.c:592 btrtl_initialize() warn: passing zero to 'ERR_PTR'

Fixes: 26503ad25de8 ("Bluetooth: btrtl: split the device initialization into smaller parts")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/bluetooth/btrtl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btrtl.c b/drivers/bluetooth/btrtl.c
index d3eba0d4a57d..7838c89e529e 100644
--- a/drivers/bluetooth/btrtl.c
+++ b/drivers/bluetooth/btrtl.c
@@ -1215,6 +1215,8 @@ struct btrtl_device_info *btrtl_initialize(struct hci_dev *hdev,
 			rtl_dev_err(hdev, "mandatory config file %s not found",
 				    btrtl_dev->ic_info->cfg_name);
 			ret = btrtl_dev->cfg_len;
+			if (!ret)
+				ret = -EINVAL;
 			goto err_free;
 		}
 	}
-- 
2.47.2

