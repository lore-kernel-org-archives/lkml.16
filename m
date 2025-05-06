Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177B2218AB3
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 05:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746511137; cv=none; b=DXeNg5+oGV6mzKVpXxbSQsVDFGzHBBmCVgznTCH8fvW1UWSFKWtnHNRgnHlARsiChLJg3wAD7QDjfZQF35jAj/yakeXgPVLIuiO4GROU7uRaVbIq6cRcAJFA6DGgStjyPzd4Bi/ncrIqq3j7NYwe7f546IK5fne8C/nUYF/EuRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746511137; c=relaxed/simple;
	bh=lHGjUreNtBKPMjSbSSELN5KxrhdXn9e06u3NrjNNqyM=;
	h=From:To:Cc:Subject:Date:Message-Id; b=l16sOVUDgeQl5Qkbg9R1ai/26oOukUwU1OXq5hNvnAQcuy9pRu2FKvdGtb9NGkusGZL5ypwSdWvluaW2ZbjIql+XAtlwM09CgTu+eV29gyI/GFS9a9Bbw/I3fWfpkmGHkrKKAajVGWlr5ZF8tc9jKAki2hHcceVB6mq0ZxeBhD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=ncnQjlXl; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="ncnQjlXl"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-739525d4e12so5120740b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 22:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1746511135; x=1747115935; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9RMzXmlz7UkanDilYbtO2LNwOeq3p6JuBHkzmKd9oc=;
        b=ncnQjlXlaPT7uujWK62WaGBAIoBtnBFbTe6QokHiWWujX4kCkJTSAR0o0ziRPrh4iQ
         QdfmLcima+ZLeeS94S8BKS2ZmVC68dbyBd7vgDU3Q4YXsKGwGfc+8xRUft6NSk8JRJdt
         Us3+c6AYOGvW9j1HfXSpDDGM+m9mQMBRUOWBguHyIQMGos+Oe6TVq8K0mq4Y7Q2pcMDv
         O+oZR3xQh21mIjRU+7GBVIJVJlz9GLVflpobBZWSSHurM0bBiNh+Qd1gZGLmWOFFjnox
         5gLFV8kOoTv+pg+Pv2WOtSKbABKDGKSQIFw+xKM+DO2BVoqIOy6F+RjKNK+ILyzVeapg
         BU3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746511135; x=1747115935;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P9RMzXmlz7UkanDilYbtO2LNwOeq3p6JuBHkzmKd9oc=;
        b=CvKUDC7PjnKe1R2N6OyTxfb9l/lAU6IjSCsAzX+y1Cq/rPsKjBQseFDqBpVvzsX+bF
         820VV1gDxK9uz4E4pO3jqOMpVY5pvOiHJgtS7QMP3HoUpbz9sVwAOtsX81oBpyLCE0rS
         MrukEKzMBK5CsQLnVjfMVL4sYDZ7mwPi28kivnT6CjoBuPUKVT5BaGN8dBs6VTP4Jwqg
         QaQ4nBJE5fH2xUrE5Oizz0DqJuD66l6dYlQe0u/fq5RAh4GkPd2oVsOFCpqSJjaQ/WRC
         tbG4Hco3DrZlLMG+macs20TsxpIqKBJgYNAMkYjrQjgLfi3rZcv9drO00f+f7HDUqOpb
         e8yw==
X-Forwarded-Encrypted: i=1; AJvYcCWhngEVGkE6xj+k1PLPGs2r9QN1rTxPj5kAIh8ZM8c+C1/4zUQ8mfzuDiaQ1/xM47zFeY5CZ6kYTKqW6b4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDj5YmPYmAdkF+fPQLJeve/4TOaYrzKMO5M8ulTpaaAzEflw8f
	NHksJaQZBUBUGu1Nq3Rsb3PWbTdms5ndVuE4oZkOESuue9yULZfUY2UDA+vWwBQ=
X-Gm-Gg: ASbGnctpKBZX8sQkB6YQaHUQ1SpolOeCVPVGs5cf94IiXJU688mrIwaaKyt9OsB2KRy
	Yo7L98XicYsSpvqQ79LB2/qvvzQmtJ9VqzJQI1oPY+Pwl/P9M3T+2k64o6Ne1zE0/YpoDTJj7ad
	fYMEi+afa9zn5iKHsOc704iZO5nV1FKdrbM4xGrr1aNzOnRSbrIWEd3EEklvDaPS/Hom4ykfK/I
	IBbUtt+ClmuM4z1ndgJAD43JB4HYA5sH8ngyX7oNSStOJ4N2XxeHj+3todfKFncdHTgmFSzuaKZ
	tGy+mvqM+j3kNl0yFnMFmbO5CXBA2fVkf7USG1O0mw8r2yEY6kbqFIdYh0N2KnIAOMuerTl27wv
	+BnvmpQ==
X-Google-Smtp-Source: AGHT+IE1ALKtmymWe3IxwJGQDidvr9hFv4JXT7xekgdbvQ1bIbVtaLXBYn0P6rox6hbXUopZtRexcw==
X-Received: by 2002:a05:6a00:aa05:b0:736:33fd:f57d with SMTP id d2e1a72fcca58-74058ae66dcmr17568044b3a.17.1746511135383;
        Mon, 05 May 2025 22:58:55 -0700 (PDT)
Received: from ubuntu.huaqin.com ([202.60.227.233])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058db91cfsm7965444b3a.48.2025.05.05.22.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 22:58:54 -0700 (PDT)
From: Hua Li <lihua@huaqin.corp-partner.google.com>
To: dmitry.torokhov@gmail.com,
	hdegoede@redhat.com,
	javier.carrasco.cruz@gmail.com,
	zack.rusin@broadcom.com,
	namcao@linutronix.de,
	andriy.shevchenko@linux.intel.com,
	tglx@linutronix.de
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hua Li <lihua@huaqin.corp-partner.google.com>
Subject: [PATCH] Input: gpio-keys - Detect long press events in sleep mode
Date: Tue,  6 May 2025 13:58:47 +0800
Message-Id: <20250506055847.15389-1-lihua@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Previously, long pressing the gpio key could only detect short press
events and could not report long press events in sleep mode, we need
to recognize long press events in sleep mode and fix this issue.

Signed-off-by: Hua Li <lihua@huaqin.corp-partner.google.com>
---
 drivers/input/keyboard/gpio_keys.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/keyboard/gpio_keys.c b/drivers/input/keyboard/gpio_keys.c
index 5c39a217b94c..b546f38ecf8f 100644
--- a/drivers/input/keyboard/gpio_keys.c
+++ b/drivers/input/keyboard/gpio_keys.c
@@ -426,6 +426,8 @@ static irqreturn_t gpio_keys_gpio_isr(int irq, void *dev_id)
 			 * handler to run.
 			 */
 			input_report_key(bdata->input, button->code, 1);
+			input_sync(bdata->input);
+			return IRQ_HANDLED;
 		}
 	}
 
-- 
2.17.1

