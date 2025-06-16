Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20A42877FF
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080802; cv=none; b=Gzt5QPyFRRyAGUeW5te6uRMZ/giPB5qugcyEXG9bYR0jJ2xGhNOQDFILeDXp3/WzsPR0JVE7v0xvjaMXXqUSEjRV9x6aTitJCYNoELTAZD/uxWS2xxmsYU4QuznRt6W3RMfmWweUq/FMh4MwFzTx+H+4hpPpjM7n5CWJpNdiTfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080802; c=relaxed/simple;
	bh=Qd939gkPb0H61tPk2RIMeLDSe6Zyt59w3Ryj4n49L+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bjqV/gB5/I93kLlaEJ5KKNPdcEqN3olCwFhWlOWBjGN7Go6sjRNS+iymtRblnAIKR8gaKSOFscGso/sd5dZn01XOWaopatmA31mgeMFnAN7Al3/LKsxwYpd0Xe7jRFwdycU3AIoZGNHhFDP0jBCFBKZ4jchalgeipp+R5mFf7NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L0dMoETu; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L0dMoETu"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-60780d74bbaso8095100a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750080799; x=1750685599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NxRvpi4mZMXdsuvOPAqvVcquISKrLNsOB6lTKg+yoXc=;
        b=L0dMoETu2GWqiOB/SPJgmEpJcEG4LNW3FoySfEglS19BC9dsJvWMBNmGu6SPWZmvOJ
         ATu3Rg+I9AzO2IgCyJ6KXzgIeWxx9GmEnbi+PpoUuEEARPeKsG3XzMN7IaQrEjyNhom5
         iPtV5ai8jvM7FBY90sibLniYKItVLE3NPoStE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080799; x=1750685599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NxRvpi4mZMXdsuvOPAqvVcquISKrLNsOB6lTKg+yoXc=;
        b=vypdkAou3CZEhwpdpIlfbnpmmhtu23DE4oWRyLLX1N+LdfxUAvJfuRltMM1R1yfpW4
         i0m7p4dh66ikx7hURt+ny+xffqfZ5TkHBxDW5vb+wgSZtmc98v+LUFsRekWRpS0DgB8a
         MvllmUKBKxpNPIuyKyeTlkfY8eiaF2qoqnYRzQ6xhj1NNvCMeMsIyzev6Nf2DVYDZ6n5
         TF6PJFFXj9SwooQPahRYwA9DBJW9+XAvfrj7r3Ij/Um8CldLJLSCeXhh/KvlFpoS7FMK
         BhNNfMgXlFqL8pCb1T6T6UUQ48FtS+ZJGMA7J5OVluNliI3+RpMvgJRV/ImCvU/oXplS
         gyUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVfvuoW/rb3sr9Y0xAv9leeeGzU45Bn8AGv5R/n/kV09lF+l640OxKoUA9ZNxR4Y5kC8IUdBDTwg8NftU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1yMdFfBIZq/8uQhQNRWI6x+yC5Px9FsBUBdqNAhpKgstA7PuX
	9Hp9gGg2KgWUVdIkVmdteR95MmI6SasxkTkjFEaSRP9d9bccK+LiOyFWdk+LMLzgyA==
X-Gm-Gg: ASbGncty4VojRVMq8lrzpF6j+2o8HODH7EyG2kVTNErPOtKSyfYG4thE1CXJppJ9os8
	fi6960ZD5jTNM9zD+nC8QoHSj/04s3xrvsKCkL/u7UKY4+RPusp77Zvg35/sCJMR97YIf61DziK
	RMs953Y7xJQgNOMT5C/0zZuErNQjpxC+q1sEeJg3+O/D9KmKoTMAzXl87QPsGIMq+WmcrsfpEpj
	mzSpzoh3E0WWCXTgkG59uTBDpJM1XXJCSX7DU919MmPXgwtEDgyYXlbymU0yIoSnUzn/+ZoQNaG
	zo4IvOEox+NPFZLJNEmGf4d9YRc5elAzmZwDRPYlYq9PiCAlET9SYnZrJ4MrwpliL5ZWjSyuOB8
	Drqwq4raDcuUo6r/SIVStvIsL8QsPA3hJWoo7Tk2yruIUpB2SrhzVK9x6OljvduoG8ljK
X-Google-Smtp-Source: AGHT+IHXHH/g4hQtpUyXbw2a55jyHtMmZWxsR2Yjrb1ebrbQezAfwXZaOWNhg4NlM54/48a7s2JliA==
X-Received: by 2002:a05:6402:26d0:b0:605:2990:a9e6 with SMTP id 4fb4d7f45d1cf-608c6e16978mr9487904a12.5.1750080799174;
        Mon, 16 Jun 2025 06:33:19 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a94ce7sm6036664a12.58.2025.06.16.06.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:33:18 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	RD Babiera <rdbabiera@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH 06/10] Revert "usb: typec: displayport: Receive DP Status Update NAK request exit dp altmode"
Date: Mon, 16 Jun 2025 13:31:43 +0000
Message-ID: <20250616133147.1835939-7-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250616133147.1835939-1-akuchynski@chromium.org>
References: <20250616133147.1835939-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit b4b38ffb38c91afd4dc387608db26f6fc34ed40b.

The commit introduced a deadlock with the cros_ec_typec driver.
The deadlock occurs due to a recursive lock acquisition of
`cros_typec_altmode_work::mutex`.
The call chain is as follows: 
1. cros_typec_altmode_work() acquires the mutex
2. typec_altmode_vdm() -> dp_altmode_vdm() ->
3. typec_altmode_exit() -> cros_typec_altmode_exit()
4. cros_typec_altmode_exit() attempts to acquire the mutex again

This revert is considered safe as no other known driver sends back
DP_CMD_STATUS_UPDATE command with the NAK flag.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/altmodes/displayport.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index b09b58d7311d..ac84a6d64c2f 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -393,10 +393,6 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 		break;
 	case CMDT_RSP_NAK:
 		switch (cmd) {
-		case DP_CMD_STATUS_UPDATE:
-			if (typec_altmode_exit(alt))
-				dev_err(&dp->alt->dev, "Exit Mode Failed!\n");
-			break;
 		case DP_CMD_CONFIGURE:
 			dp->data.conf = 0;
 			ret = dp_altmode_configured(dp);
-- 
2.50.0.rc1.591.g9c95f17f64-goog

