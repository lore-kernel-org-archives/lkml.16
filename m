Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4102877FF
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080797; cv=none; b=hGoy45L9xwUICsEjOI84Q/RK7iaBq0OUYgdaT0f6uujylK2LTpdKjL/Mps0v3TyzmkqYbWBnFxtjn6BLICcAKO9NDUS/bK9RQQBgqkRlEtWBdzGoHkNP4OONmTavapb92mHBMYPtlkd17EHxxvR0J81+0JQlj7usmuYCKwFL8AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080797; c=relaxed/simple;
	bh=0xC0NBWhh+5FZ6EevG3lvJaPJC0xaC2CtQxodewDrnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZUpOpjbO7jIprbqk4TdWjzaLCbdt2fd/qClHRKRWvh0CVDjl0tNnG9j8+gVuQeQv4nIlbcU4ZhwnFcQneCjTHv41OtPKKGLBIEqfywodwJF1qJ4jbzAlNEyK99eUnryqNoNifmSXyQMYoxDjWP1r0Sf+yOtPYd18cPM2zIqsiBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=haZhNVVW; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="haZhNVVW"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60789b450ceso8807610a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750080793; x=1750685593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCYACXhfENDI28fFqwzO6WcqXr+cZJHgaCmuMhA1C2o=;
        b=haZhNVVWWvs2sRVX4sdjaQN8lQx96TpHZ7V715IZSr9SWp1cpVmPPKvOqsao9zLTJc
         ma4N01Caa4nG9jGh0QckyBkcJNPc/CN6Zq4n/1Qu0B7hwoNq4ApKdp1HL0GSfgsEWmzS
         9vbxeE2nOJabxahiqbDOuV/ED1YARdXrhjoJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080793; x=1750685593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DCYACXhfENDI28fFqwzO6WcqXr+cZJHgaCmuMhA1C2o=;
        b=KO0LEI1j9PluWEFybj1Bp5VyebnefVm7cXxQ4xK2JV/dec4uv96V9x0NkWGJ4TcDFU
         wI73KN5ctlb/8fs+TrpibuNHrXbotakWouXvKsDyYfSael6mVx62mh0tYbjgWz5QRTVW
         w2TxcsbIJ0UtcZdtkq5s/LyFEf2u20mVFCew9cCJ0Qe83dkZ3J9UXXkIc+I44FFO3Omh
         nNr5Yhyk9hxIZ3MKJ9Jk0ZIsx1jh+BBqMadm/JQuPAfXYi4mzpxRs7homACp7Pxv3xUk
         IdB4r96RS8Ro2TrTB7ea0gXxD05zR5BRVQDD4ETM2SeuESJ8uhAYQ5oYNOj1IqV7htTQ
         rTUg==
X-Forwarded-Encrypted: i=1; AJvYcCXZZp1TGF144gqdeb7VRrFM2NuDHdprlEdtu4ewzdCpTG3Ffo0XZERgNh6og17RYdWw5aPdZwAL51rv6HQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbs5oD53C8mAF7shDtUC1PnlWvAgI0CmeecJfvBmeLBOg7e9d7
	DUzS1p/rnAYzf2J8xtUQmEfUPmmVrdls+2/+9VRE1aBOVkq6xPllZmh7CWhS81YHmQ==
X-Gm-Gg: ASbGncveMLxvpyhRoZnusrkG3x54BASgFpUztgfMI347WxFf2RtCovIzQa6W9hmRO+Q
	qrAifNzAiYkuF0lKWbdV7d4rY20KVb4C6h+ixYRESEIjlgi3V8VDsOW7kDnGtztTa02ahJ9alyK
	RUuHbCXVv/XZgLqP0AnpKOQ89R3ziPkxYR3ZmKiiCmVH9r9X2Nxvk9qYlK0JkOf6W1aTV8nib1W
	siy6AKyBf4Jy8xYrItXJhDEv+yfAIpjvgkKJFJtXcJU6vC0b6mj/5Z5+fjpRQHqm0yDB9K183g9
	TK1IoYZEvlZENdY/5sHrL4+ENS4MWvTjMp5E54/eDuGpkGmntNbNEPt2U2n3jM/fteDwHdj3B2/
	tcJbMt/pJefkRbnzByAJ6MXPPDbdTpz2ujsY+l58sbU9L/dUIagr1UxiU7Q==
X-Google-Smtp-Source: AGHT+IHEB1jBPDHClH0iincBHttzHTsFdApFe/gtRaP+clRmz4tP9oguLOHtjZhuypGZtB3dDT6wTQ==
X-Received: by 2002:a05:6402:51d1:b0:608:50ab:7e38 with SMTP id 4fb4d7f45d1cf-608d08f7932mr8236948a12.14.1750080793177;
        Mon, 16 Jun 2025 06:33:13 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a94ce7sm6036664a12.58.2025.06.16.06.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:33:12 -0700 (PDT)
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
Subject: [PATCH 03/10] usb: typec: ucsi: Set alt_mode_override flag
Date: Mon, 16 Jun 2025 13:31:40 +0000
Message-ID: <20250616133147.1835939-4-akuchynski@chromium.org>
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

This flag indicates that the PPM allows the OPM to change the currently
negotiated alternate mode using the SET_NEW_CAM command.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 01ce858a1a2b..1372becaec82 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1616,6 +1616,8 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 
 	cap->driver_data = con;
 	cap->ops = &ucsi_ops;
+	cap->alt_mode_override =
+		!!(con->ucsi->cap.features & UCSI_CAP_ALT_MODE_OVERRIDE);
 
 	if (ucsi->ops->update_connector)
 		ucsi->ops->update_connector(con);
-- 
2.50.0.rc1.591.g9c95f17f64-goog

