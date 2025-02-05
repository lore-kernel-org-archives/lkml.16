Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489CF1519AD;
	Wed,  5 Feb 2025 20:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738787280; cv=none; b=tBrXgfDZ3Yv3Vu693aywb21JtpeH32kOkD9rhmUbcNLQPfe7rX7kvyxdhiGXSUhnzmkwj0Zb9kBuEXUrbZOEwP8Z96rJk5M0RL0Vu9HwPbcIzQ+tQdlIk5oPSvqi3qPRD79439CTGvKyG1TfWNfyLPU1922/erRNsQYNYdNeC1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738787280; c=relaxed/simple;
	bh=15CBMjnHfLDzOcxHcj4i9dwQs3godR6phNv1yOHD2CQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=atc2YLB3/EWNtUc5eXo3ZG/c67DoTrr8a+9KLKMc0Dqv2TX9BfEPwDyxdui2oTmjRnwZ5KoT+FjsiOI3gdO9zIw/fUFl15UpdMLz8OFIgycCJ5YjJul6Hxzfkw121WQKyOy4sTmMWvGdLEszu+cZ7wEEKbyRpWuPjG0REVuoS6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A6OqNIqI; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A6OqNIqI"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21634338cfdso5229375ad.2;
        Wed, 05 Feb 2025 12:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738787278; x=1739392078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o0WtarwkqI4WjE0Soy4DrMD/J0v99JZNNib7d5tgyxk=;
        b=A6OqNIqIaxzG7a7FOY0x/zOqP8uPsvSYnvxMWWiCvjUOLf/SFDBM5qVsviY+eEHSJm
         Qp+EACmF9z/qC73e2C/vLKSlSnLxKEzMVC/oq+D+PK/ha7GLgrsiHAJQocMScfvhnFSJ
         3GFmDkOd+v7oo8ZbMEgFz1ztYkf9ozsy38Ypf8H0jIY5y9nuU/rhG3OreWICXP7agbiu
         NO8qdKU+OXQWve17WFi3xmskkq62TeXnTUGf79grM/iz8BbsMt0zKTd9CDKruGsRQbKk
         9lBRLS/s+xBsQa48rLhj/Yfi7dl3/5sHIRGkQCyB7bfRxh0PwwF+SGNuTQr8KyVRSXLi
         QCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738787278; x=1739392078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o0WtarwkqI4WjE0Soy4DrMD/J0v99JZNNib7d5tgyxk=;
        b=cf0KG4IJduNrvpquK2+r6R/8RkOYCJfh1r+2Rh4msMywe8LxEU2L4Etb1HrTUUbcCG
         ojnh/Y2SM8rJ6XC+J6wuBW3KA16hQJUEpm/fVNe/Vjo6DOUR4YW4nrrwjCKi/gnv1v5r
         8PUWG7CaRuYEOx1AF70WopRHP8p5gfWIdAlz0IZcY0/vXXqi2mGULt8fLn6HwcBiWEFw
         b15ZBL3Lh92t6MkKR143TF4dNliqdkYQGVxy3BGLZcfNnLR5DmUXQDWzGGu7zD9hS1Xr
         ax1Jr3mKKag2saSuQHGzXmCFVjo9iOf/A+5h1bz/jv/JegO6vOreFjVBlfVmOqG8y/Za
         qu4g==
X-Forwarded-Encrypted: i=1; AJvYcCUQ/ONg01ifPFqnBzQxyfecfJwouxKkM0Wl+swXK04SnAy5OwG1kqXj+CnHV0OKx1yo8+ih7f3xwOU3X8Y=@vger.kernel.org, AJvYcCXKsKmh967xN4GTd+bb0ChlRUkLxOiiqGPov3BLJkI2/ZXoArNDFquujZPPydlZGnUq6EJ2yMYj1UP6@vger.kernel.org
X-Gm-Message-State: AOJu0YyHAbYseDopCKowZGKg7pKI8LoLMRfFWt7RB04tKBZcpMVXYqeF
	3wKxKsV8TF/a/9vRUpNwZyWAZh7SFRjsi5m4ZfbuV0O0p6yzPTPtoL5USO2uQ18=
X-Gm-Gg: ASbGncsAxXiPJvE6KWnq/Km7SlR4prmtDVTDa5BDn4wukbR2a/xzVSIK1ZkGlR6uXzo
	5vGeJS5ORas6qdrC1rlhaubl94SItvLk1r+3AvQ+OFDg8F5TEhmI6gK/E2LCRrY4UGyra31kLTW
	Z6OY4J3cr7QhavC5GBhbFFFyVjJukPEqSxm8alQpeBA+T1hCZc/Ap8LR+6g6KM94Zy1LsiyHSJ8
	k2AVLtwk7LkOUobmayBJPqt/N4WHwKXLtPVJolCnIINN/6SC/jL7GynuhLmCvCsj0RTlmWxCfo2
	cflepY3SpUIL2y4ZqyT/7y4mYIZDL33qE0C5D4Fi87DCvVrJ
X-Google-Smtp-Source: AGHT+IGeF/Ls5GxBWhFKZUx5uThbSUUXzfvOJ+MSpx5kUENmcIeAuhJOFMrnrQLuzWWkeZVV8OY3eg==
X-Received: by 2002:a17:902:da83:b0:216:401f:acd with SMTP id d9443c01a7336-21f17e4e961mr78863465ad.21.1738787278402;
        Wed, 05 Feb 2025 12:27:58 -0800 (PST)
Received: from purva-IdeaPad-Gaming-3-15IHU6.. ([2409:40c0:101d:c4fc:84d7:253:f453:251e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f16ab3c85sm19323755ad.37.2025.02.05.12.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 12:27:57 -0800 (PST)
From: Purva Yeshi <purvayeshi550@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: skhan@linuxfoundation.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Purva Yeshi <purvayeshi550@gmail.com>
Subject: [PATCH] usb: dwc3: Document nostream_work member in dwc3_ep struct
Date: Thu,  6 Feb 2025 01:57:33 +0530
Message-Id: <20250205202733.18611-1-purvayeshi550@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added description for the 'nostream_work' member in struct dwc3_ep to 
resolve the kerneldoc warning when running 'make htmldocs'.

Signed-off-by: Purva Yeshi <purvayeshi550@gmail.com>
---
 drivers/usb/dwc3/core.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index ac7c730f8..9095878d7 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -717,6 +717,7 @@ struct dwc3_event_buffer {
 /**
  * struct dwc3_ep - device side endpoint representation
  * @endpoint: usb endpoint
+ * @nostream_work: delayed work structure for handling no-stream events
  * @cancelled_list: list of cancelled requests for this endpoint
  * @pending_list: list of pending requests for this endpoint
  * @started_list: list of started requests on this endpoint
-- 
2.34.1

