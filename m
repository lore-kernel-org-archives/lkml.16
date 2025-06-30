Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C0228D8D6
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751292788; cv=none; b=ACSp4Kokp7C07eCam1b/765CFssmlZ4YlMlecpK6mvzonz1OBUfz1t5RfWFeCoRUBm1F7cwWgYZgSIJNwIMEBSUuaFvwUpyl4VpLDS0VEZeL5Y2tA7Zt4QDX4/wpbW8s960GTBbYgQuXDMgAFIWYQJwmSZeJyxrNW2kFzyKo9ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751292788; c=relaxed/simple;
	bh=qWGW8YbtsDuKpbmI6ubepotX+ijoTJp4dAQsUcMuZjU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ugE1U0QS+PjmvB6eZcAgzsJNE45LqbBM6I1VV81nXzyCR7mPWSwlxjYGhrGy1hoDlM+az72YE8dNjq9+OJvf/LqDf/cUCX/1in66Srv3clWdlzyynUEEh+BGo2bV+S0W6tnt78W8FcYBFMIStctawLqOO2HMLm7DA36OPCbHw3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PkYuq1cn; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PkYuq1cn"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ae35f36da9dso453532566b.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751292785; x=1751897585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N1Xh0BjAurZ8GfKMX5dM5eIqjsMx/yoO6fgXGDkZDUE=;
        b=PkYuq1cn2UtiD87OCXUnyJQnJDVZtFkTp0kAayK3suKPJmy6f1DWPNsNkgzwSO0Apt
         Vkc7MRB5mAmGEaWt+P03dXIh8dTqTVAjRq3GTZkpDZN0+UkjY318cQyRPrnrITNwqSNr
         aspimak4joIRLHUMkUzPKnKmqp651WWDLEksI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751292785; x=1751897585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N1Xh0BjAurZ8GfKMX5dM5eIqjsMx/yoO6fgXGDkZDUE=;
        b=bpg3wV5sMM4Bk8bXSr3FiwH7Ivc0KSDoxnhmPxs/bKyFrmk2Ky81G8l1BDx8wLsqEs
         vkx2ZAIoU9sY85uYLpdznvii8w4kFiZ+qI/JddreGs98I3S9Ny1oAl6SUtv4fG30YGvh
         b3AdihbrQuOEgnws6IsiV5M4+Rx0pNcE3FTPZA9ccbltxNp8jqiVNfG6bg1K9XR/eoeq
         0dtUSRPH11rrtCr2JFMDEHKXSGBuScFXWU+rG8EuR/PtDaYAXtZOjb7RWHPFdzkw3Wan
         /noPQIufoqD/3+SSMb5p7ezQGRhof/w/KgwzGMLdPYs3on/sgnqdHHNP/11SPMnLCcaa
         Pt0w==
X-Forwarded-Encrypted: i=1; AJvYcCVWboxmbWTCSGSDu+YYZGZHYopJtRynaD401U2h+u/ZKzavTyBOo3bqDqEGGCs0X8cT6r/gBjxmLjJMuoU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHbzkKMvTEHshD+9QdynNAGuecg1Mm+c0e8UNPTt1pVxhmyIo0
	QGVAziSabx0tx07i6S+EWno9lTEh4E9HqLppUoA2PiCL+NHUYCZ66u8IddzucJwQUw==
X-Gm-Gg: ASbGncvEGH2D6MXm62hHYIloZo/u2cvyllx0j/36Ifnn9PUHDWMBIUHqZmYcCHzAmQq
	hoJryVn4t1w8AjCK0EXt8/v3Ex6RlUolD05l/4FGchVCMt3iD8uPvrLLQLCpH2K7YqGH1EJEiEr
	B9nkqcsBMRJlLwBrDHZTRY/srUVLGHWpAky1lYd7KtwVAvNYBtwDD9nPZGVxPmTQLndvtJiEfKA
	hUoF7PsULF1Q5BeprjBU8s9OtwqX8akWl1GyxFmKixFnSHQN7s3Y65jMociFvqf9ufj2+wcOO9i
	Xq1Uo69oivjp6rS2vH3kpINAKtnBqeIL1L+63XvvZGl8gKtQwW20qdpG5TZjp3smdM9tZoPX6I1
	KEOAH4Ke37TDiWkHK7iy9tutE3gOFkSZm7Q/xljXzSf8X3lM/KzsZ
X-Google-Smtp-Source: AGHT+IGiJo2J+7ysvkMPbSppys/RSb0riJCR/djRR3Vxz/X1CdlBlaaZmnA7ExkeEfvj0vTjvfESJg==
X-Received: by 2002:a17:907:d78b:b0:ae0:af6c:680 with SMTP id a640c23a62f3a-ae34fd3311fmr1153897566b.2.1751292785232;
        Mon, 30 Jun 2025 07:13:05 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (72.144.91.34.bc.googleusercontent.com. [34.91.144.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b416sm670643866b.28.2025.06.30.07.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:13:04 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v2 07/10] usb: typec: ucsi: displayport: Propagate DP altmode entry result
Date: Mon, 30 Jun 2025 14:12:36 +0000
Message-ID: <20250630141239.3174390-8-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250630141239.3174390-1-akuchynski@chromium.org>
References: <20250630141239.3174390-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reporting the error code via VDM back to the Type-C mode selection logic
allows the detailed result to be propagated to user space.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/ucsi/displayport.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index 8aae80b457d7..47c28646cfa9 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -234,14 +234,18 @@ static int ucsi_displayport_vdm(struct typec_altmode *alt,
 
 		switch (cmd) {
 		case DP_CMD_STATUS_UPDATE:
-			if (ucsi_displayport_status_update(dp))
+			dp->data.error = ucsi_displayport_status_update(dp);
+			if (dp->data.error) {
+				dp->vdo_data = &dp->data.error;
 				dp->header |= VDO_CMDT(CMDT_RSP_NAK);
-			else
+			} else
 				dp->header |= VDO_CMDT(CMDT_RSP_ACK);
 			break;
 		case DP_CMD_CONFIGURE:
 			dp->data.conf = *data;
-			if (ucsi_displayport_configure(dp)) {
+			dp->data.error = ucsi_displayport_configure(dp);
+			if (dp->data.error) {
+				dp->vdo_data = &dp->data.error;
 				dp->header |= VDO_CMDT(CMDT_RSP_NAK);
 			} else {
 				dp->header |= VDO_CMDT(CMDT_RSP_ACK);
-- 
2.50.0.727.gbf7dc18ff4-goog

