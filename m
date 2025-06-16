Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8DA2DBF77
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080807; cv=none; b=lxPgfL/jhY/gxuca7uZXZZeBYB8qZcFZr2jPO/NoZ+8IfSGxMzyhFXOEJmehxYoyKAt9EdBEQzOSucL6jeLyAhEwO7P6AWIA0FyPlUPH/Das8J2B0muIr+cCezcEhyNrjFBKHIVNF/Liytpn9CZm7h387UrOeo37x0gOUgzfwhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080807; c=relaxed/simple;
	bh=p39s08lBsdKyWiPzDRau2EzpDZFXgqJHAiwGMuq/Nwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mGI/qDqxmmJyemdqghuShnd2uIqaBI3d5RaxVXovARQikF0Y0qdJGT6KRcfZGEUNoiWFuDh65Vrb0HWL+MbYFRJVnbVtlgPXPrH06ew0Ml6R16QVhXLia2wb9ZUk6nI5KBgZZuU9nU+l3xDWjNUt1lVl3ZhqBJ2/Lq2lWRXcrM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L+s8sUSS; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L+s8sUSS"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60780d74c8cso8229768a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750080804; x=1750685604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iRxqEsXbtVo0LTo1eLfkdMCcKn/6qpCdwe4jbm1dkIM=;
        b=L+s8sUSSF/Udpc2RkSiAVy5YerjD1X0adZ3u36b69fv6wfyOYFbxbDVj/LGqq0gAst
         78jPhM7PY4undtTcqLg7rXKt1/A523FOJct926umc43ZdjUQDwp/PjZjFlqAakRYVjtp
         IXeg5h/zOg+F0XF6/IPiPvXTp79mDzaJ3hTco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080804; x=1750685604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iRxqEsXbtVo0LTo1eLfkdMCcKn/6qpCdwe4jbm1dkIM=;
        b=YsVEEIjWZPqcYKXImCZiI6PA7BieOGXNKMRdflrKYyZSfY1IlO7Hak8Iw4Y590I9fj
         4lLb82cmKSjbrrtVJxIt/9tzriTdjwIBpYnpBF6jESZVIxBPtCSC94nKlJ03iww5Wof5
         xip32XJdNJWUTyZDCAVq/wgmMmMZSA3Q83Z34t+kRZBZrsX+WzS3cEgJ+XlAAIvxb1Ro
         Dy52hosLkQ6UiZ0s1MOx1TXj+5cYmKFvlkBaX4O+x9iOn0U2zmw5pVPMe2EmX9MUpas9
         klvFmgWoYYbVgWWnMiU9NBji0FyyeLcuk/ZYXDfnycZ3gUp4N+thX8wYMn9QsSlTZbGi
         0sbA==
X-Forwarded-Encrypted: i=1; AJvYcCUlbcLZgAczJKG0DcbXszSwpOAky1tCzelDBCrSZzXwapNe64R40qJ1mmJLpQg4RvTvWezhJMcgl9+HzOM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH9g3HIL99HPk3PpomrQLQGW1HlmOnNuTr2BJgvbgO8dMfWfha
	RV6CIMV9G8GOoA0Y4EKMrytM2oGuR+zIb94FJu/aQvOXvV8mFFTpV4LCKJEOSxwxxg==
X-Gm-Gg: ASbGncuO7sx7P8vV8doufvrTOL52OApVVcwH8lws10RxP/yz7/L9TQMe94z6wLS1dVd
	M+Mswu50Qlv2rNhqtwbz8xVndbS57u+PTRsJwf5vib/s2YHT5uhntnD1vQn5U+nnITtimcEsTpp
	TTLq1JCBPGELwcwqo96BvgbMFd19JW6GvaKEP412ouxvrsF81ebiEDMi6xcWca1IKifZBXYSRbC
	2S6qIWfy+wgV/B8JQysKGUYD3klKDcTymQGomduN3kKsqXPVL3uLEk83l+kcJ3Z/RImSzwzY3t5
	L6uM63lCmglQtkF1FFxiWCiG0Ei0YWCSh2RwlB8sANzPeaMRcVlqqXArM6W8NOSBBuC6YoFzfex
	eFjbshuYbpRC4V7Nwx816deLrYcaLVeeDzbrXSFxXqplePeK/iHvYH0KJMQ==
X-Google-Smtp-Source: AGHT+IHW7N4V3Xmd80K442egDP5c14Z4Wwz41/QwxRTZ4VwR1xjfYPTBJjTabMbR2EIyF9mo+GlBTw==
X-Received: by 2002:a05:6402:348f:b0:602:225e:1d46 with SMTP id 4fb4d7f45d1cf-608d0835bf5mr8908309a12.3.1750080802251;
        Mon, 16 Jun 2025 06:33:22 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a94ce7sm6036664a12.58.2025.06.16.06.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:33:21 -0700 (PDT)
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
Subject: [PATCH 08/10] usb: typec: ucsi: displayport: Propagate DP altmode entry result
Date: Mon, 16 Jun 2025 13:31:45 +0000
Message-ID: <20250616133147.1835939-9-akuchynski@chromium.org>
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

The `DP_CMD_CONFIGURE` VDM is the final step in the DisplayPort alternate
mode entry sequence. Reporting the error code from this command back to
the Type-C mode selection logic allows the detailed result to be propagated
to user space.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/ucsi/displayport.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index 8aae80b457d7..6f754e696d93 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -241,7 +241,9 @@ static int ucsi_displayport_vdm(struct typec_altmode *alt,
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
2.50.0.rc1.591.g9c95f17f64-goog

