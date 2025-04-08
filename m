Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C60157A72
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 22:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151826; cv=none; b=Pm8vKu0nYjMSiYfQ0IFfr3Br57dKR/IZ9Rsg8zmH3/BnNx0ElQBMP/SidIi1KRvX96o4fPDnZxEplfCoMYXV5R9NRQQsEWCXcbDqC51IRaNznMkzpMkmYVWhcZSs/H1fQrOm2DQWLhu804rxnbu6iy257/AoZ5W/Ry7gb3ovgoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151826; c=relaxed/simple;
	bh=LOomkHuTmEbqkD9S71jgpPwKhCrIEWuwQa+giNptrIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g/KB+HCyKZcljMoMblEuXiAj27COuF4QGLvHMxXG7XaLhzIelv+mYqi8CnsMfnR1PGRcUxqXOhTpgXYzoxLbyA8jf9xhHI4nJOANzwQ+B+CCHwSy39P44HKVXmtXBPm71+EAuZR7BhPdKcq8WFJpojLZphbfRE+KMpDZA1WkvLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=WzYXX+44; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="WzYXX+44"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-223fd89d036so74413805ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 15:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151824; x=1744756624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AP2PXK6Ju2JXIsqif6BfWbW1iCsIHOY8pmyx9+/+GvM=;
        b=WzYXX+444G64TI7LUtQwrgBZiGS0vyC5zt7f4uWUOafCV10xplfXo9+i/6qQi3orqu
         Znoj0FBUwpq/o+H9js2m72e2p3hr46whHc/Bfp+xiTkhVtvGUYB0dkR6SIv+JC3NR3TB
         OZqb/Kh3JMRRMAS6kZ4OLBf2nmuTHZ8ktagZjnD0UuYfwBjSKmgWci9eOKMHDmU3FZtz
         o9wiqc219fojYsrfzDQzqJUZwgYtKfwOhIPAGk0z0vtsVUURwmcfJpuVslGJvZsTdkVx
         IB9ArqDiduZP6V1UL/H4O7UpVeWuvnfwMK9wlPcGRrm//Z/psgiJUyX0Mnbqg7ai5Jk/
         P96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151824; x=1744756624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AP2PXK6Ju2JXIsqif6BfWbW1iCsIHOY8pmyx9+/+GvM=;
        b=swrABMRKynff84UDkvvEpoUYa4uiAWnHS9rjt3gtut/z+meiV9cG62+6iSb5yPH58s
         9eNypCnuxQ0CvYCrBioVSancFx8km56jItzxFIQHVdxP0nNkepOhgv/ja7cf3mIxdh1R
         ojbQ2Jygi4eFCGXSXcI6NFIFI9VFppGwXvJKhS+ZjplNdpli21I4OH97C0Yvew2qvU/3
         okUSPRZHKEKap5U0W8OL6tFXvbYD+tgCXXWSr7hDpUtUnVc6+NVreCGnbDkiLHWvHoh4
         Jc7SjyoeBkk8LWfeEK3R5jbNRV7J47nlQyXHHcblHIwLYyvuXMv7r86YlFCDvLsSL+DY
         szVA==
X-Forwarded-Encrypted: i=1; AJvYcCX1QwxJQIv4OEBO4SO7H5VuWykhsyQobhrm4SA71i5DrDl84W1WBrp/zfGmzqRHs9jNwFnk+sa4MexFyTE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAsjqtzGDh0zsO4zxu/4DZ2G4XD1N5xmZj9wez5RTmKj4tDNki
	+lx85iJGZq1tBlB0UuGGclRuBoMfzFfaF7oz8ZyONVrAZGvEixZPaMlctaOHFg==
X-Gm-Gg: ASbGncuqjYyUmqSSBn4R1qiJspEQCh5V/km0bInAJveegM5VizsH2TiDK9KlXtdMxmP
	a/95gRUfe/3WvrroeDzz0kh7X1+mEU3yQu9hPJN2GY34vFNO4ZL79J1hngdqFaifAXRZxSFntJK
	VkbRL0Q+yrjgGhtjidgPQsJX0qOdUNua/HyvG0yHIMucp6litwbGlhSNVIQgKDVNG7CAlp2mvC/
	LXVAWq8HO9VDQwog9jvv+yacSQGi3cmu31oaLUZRS1bJunJt2ibSy3bmrcS/IhLTDH11Zpm41K0
	rlDRxIiGD8p31XwbfDwfbyv5OfcQ2hz539O3AkryWJxGtC1dYVO10g/qxsifUZgO04a8WxZgZHp
	b/J9soqpfo3XMMBZNZRWv
X-Google-Smtp-Source: AGHT+IGKvEnsdRS5hL6YZmLxvku7FG2molMRR7QZI4ydjjytO0nD6yliVmHOsuIfTe6xa6XFkMqxLw==
X-Received: by 2002:a17:902:ebc7:b0:21f:4c8b:c514 with SMTP id d9443c01a7336-22ac400e787mr5352735ad.45.1744151824093;
        Tue, 08 Apr 2025 15:37:04 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c0223sm106106375ad.73.2025.04.08.15.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:37:03 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 01/18] staing: gpib: struct typing for gpib_board_config
Date: Tue,  8 Apr 2025 22:36:41 +0000
Message-ID: <20250408223659.187109-2-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408223659.187109-1-matchstick@neverthere.org>
References: <20250408223659.187109-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for gpib_board_config struct in .h to allow drivers to
migrate.

Adhering to Linux code style.

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Reported by CheckPatch

WARNING: do not add new typedefs

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/gpib_types.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index a5c21ac6affc..1c641f17bdeb 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -23,9 +23,10 @@
 #include <linux/interrupt.h>
 
 struct gpib_board;
+typedef struct gpib_board_config gpib_board_config_t;
 
 /* config parameters that are only used by driver attach functions */
-typedef struct {
+struct gpib_board_config {
 	/* firmware blob */
 	void *init_data;
 	int init_data_length;
@@ -48,7 +49,7 @@ typedef struct {
 	char *device_path;
 	/* serial number of hardware to attach */
 	char *serial_number;
-} gpib_board_config_t;
+};
 
 struct gpib_interface {
 	/* name of board */
-- 
2.43.0

