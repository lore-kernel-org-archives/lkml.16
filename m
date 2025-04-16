Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A3924A057
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836139; cv=none; b=SbQ95wXRWhViKa5Q36xa9beXpaiVTwsTbRggmARzLZxxGgwP1zx+SeWw0hNo9QNP7fs7WpyzgzJI/kbvwvKHMK3+HtiPWgQvUdpoT9cTWii70qeyF55A05vXYyjwvGRcr5sjBqM5XmI7La2sIhhoBal0VCVD0DzLHk+cTgfxaVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836139; c=relaxed/simple;
	bh=Hs92UuHoYvzQoi8J9GCbjuZUp+OKv64K/u74xz89GFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K8G3G/7zWRJ9UjoEXJIsrRReuF1uO7d0k7hBBlbFqTtANifMieovD1k4ro/7OTZyvhIAjRX50oKlppNwwKnvgkwSgibh3lvFTWw8DyB8Fxx0ksPaw9e1mV5lTWpNJUnChp9+H3fEOgAa1cfMtUw19mlzSF0Q6FuinFsgeK4ZUyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=atJTLUfU; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="atJTLUfU"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-af50f56b862so40089a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836137; x=1745440937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/PC19z9s7DGRWg7r1KoqgXBtiHi+mWDJPXbJcIe1syY=;
        b=atJTLUfUYwwetaawmrJcP7D8yojZhNxh5g4iuju4NBxe9NjUzibfnKedSeK1HKB8Q9
         iydcTbOpwEDmOXR96Y4DTlYmaIGvoElJqOIqnT92aVw+F6d9qhEXPDa0os0cTxMxKpye
         9wvkTH+0/yqzQGqM5N8UviBMvDyGx1bYHJOTW4ZelAzj0S5GZqUQTyNBcHi53llnmra0
         7ar6VwBQ7L2C291Uruz2bN5Mu0gGzImfpH4/oY9l6fIZ28Rp+YVjQT5fs7p4kBBXYhXv
         K4Ex1Iif9oETSYQ5p85o1Q5G2ONBgeY972vRJMFyOIA6IMPGmLKzX4ebT+cUg4J72MhE
         /4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836137; x=1745440937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/PC19z9s7DGRWg7r1KoqgXBtiHi+mWDJPXbJcIe1syY=;
        b=CdotMGnw+/kB8tqOmt3KSJ1NTZPZoykScz3NHhqjMm4OgVtjlcwM1xG3PzmUvgp8Or
         ScvXC1CU8DDRp0iMmSQjflXM1Deqo8rEz4NwsK7YS1Sdv497DYfue4ejOZWmvh/VvAcK
         GR84EbTZkmZpZT9hVjUKFJ2Ul6FonhFg6iDcy9G5z2d8sKTerfRFlO8cJRIJPDJVYC55
         +EbWf0Xo1Xdb/TQlVxn/YQSGBKyl4CgTAHOGHSCHSQXPD+Dr2uZfEAcDBXlq9ZW2T0E8
         mxKJbdIuDBbBRRx5saHHWCwvtrwC348quV6DSgXJ4HJN9Rsg5HHHipRclY4kpojHbCDR
         6UIw==
X-Forwarded-Encrypted: i=1; AJvYcCX4/D4+C4PhPRcc2ziK81u+MxnyeZxVkC4FeYIFIu8T/zBdz9C9BgJZAyoRIJCuAUQ2kYa4wzlFVVdK86A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyouePenkee7DPyHu2yj5IRjT7nz6uuGmatyyajiM0+PNP76Mlj
	7GKePpj0tZqefEoaQwqhXDYrPrSX+UXshpjXtpxd8TjowDNlP2qcZUxCe7o1mg==
X-Gm-Gg: ASbGnctAFfxCrgRDymDt81OSbPffFXxtO90jwxBllbffc7iMyoKPD+Yw7khDBadhvlz
	Qqx8ifSdlDA4TMnKtmeQ1gdTkNsbHQIwzelMUDnEx6AxoxePT2nLifNt5/1DLK79BJCYYoJeIeE
	J1qrVHbLKHCC+nFVdp4/u14wG8MKoK+0HiAKtpQhKvaYAKPT54PmqObtC2WrJe9hLAJANbpsXNX
	IJOP5ZBW4qfbIMAGlNicNSfvaQQkOG/Vt+oPqrXWedNHJcfyTmXD3NEYbz76ASg3TwulmIkYtdL
	CY4kXD7a87phI7RY0NL4P6tDEFLCOj89yFZtJL1w6ijQKbI77qBWgFB5kfOjcZL8MhBW4L2hQTh
	Y2Sai8P0jQMNuxl2y
X-Google-Smtp-Source: AGHT+IHBteJH2v20V1lmTQzL8B1zGnM5GZM9eoxGCjBQbuzUCZysUXj11FDjtxFQ/yxjkH5moF7Phg==
X-Received: by 2002:a17:90b:2549:b0:2ff:64c3:3bd9 with SMTP id 98e67ed59e1d1-30864167fb0mr4020279a91.23.1744836136888;
        Wed, 16 Apr 2025 13:42:16 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308613b383csm2319913a91.37.2025.04.16.13.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:42:16 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 08/18] staging: gpib: fmh: struct gpib_interface
Date: Wed, 16 Apr 2025 20:41:54 +0000
Message-ID: <20250416204204.8009-9-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416204204.8009-1-matchstick@neverthere.org>
References: <20250416204204.8009-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
index a7be878bd3e4..ca07e6ecb0a8 100644
--- a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
+++ b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
@@ -1031,7 +1031,7 @@ static int fmh_gpib_fifo_read(struct gpib_board *board, u8 *buffer, size_t lengt
 	return retval;
 }
 
-static gpib_interface_t fmh_gpib_unaccel_interface = {
+static struct gpib_interface fmh_gpib_unaccel_interface = {
 	.name = "fmh_gpib_unaccel",
 	.attach = fmh_gpib_attach_holdoff_all,
 	.detach = fmh_gpib_detach,
@@ -1059,7 +1059,7 @@ static gpib_interface_t fmh_gpib_unaccel_interface = {
 	.return_to_local = fmh_gpib_return_to_local,
 };
 
-static gpib_interface_t fmh_gpib_interface = {
+static struct gpib_interface fmh_gpib_interface = {
 	.name = "fmh_gpib",
 	.attach = fmh_gpib_attach_holdoff_end,
 	.detach = fmh_gpib_detach,
@@ -1087,7 +1087,7 @@ static gpib_interface_t fmh_gpib_interface = {
 	.return_to_local = fmh_gpib_return_to_local,
 };
 
-static gpib_interface_t fmh_gpib_pci_interface = {
+static struct gpib_interface fmh_gpib_pci_interface = {
 	.name = "fmh_gpib_pci",
 	.attach = fmh_gpib_pci_attach_holdoff_end,
 	.detach = fmh_gpib_pci_detach,
@@ -1115,7 +1115,7 @@ static gpib_interface_t fmh_gpib_pci_interface = {
 	.return_to_local = fmh_gpib_return_to_local,
 };
 
-static gpib_interface_t fmh_gpib_pci_unaccel_interface = {
+static struct gpib_interface fmh_gpib_pci_unaccel_interface = {
 	.name = "fmh_gpib_pci_unaccel",
 	.attach = fmh_gpib_pci_attach_holdoff_all,
 	.detach = fmh_gpib_pci_detach,
-- 
2.43.0

