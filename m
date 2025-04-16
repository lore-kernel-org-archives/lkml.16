Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0658F209F5D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805875; cv=none; b=lKIYNPD4mqgw5sKcRxeTOQ/JeMVYgzUyq3QJmupthXfXW5fXh81o00++2L5PNPnjcCTbrLS+Eh/URapE5xOlSkYUCTkXNJDPO+wxaD44RM8XJOSyFkmskdSoDoahGxV17u8xbkcDP+GxvzdGoX9KlxIia6E6RIX5YRoguBclwu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805875; c=relaxed/simple;
	bh=MVvx9T54fdEIGYtKwKMpuXHplfYO85cEEUEAKFTkBy0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=W6mxywL8DgOByE/vYuBe+mrH3J7GwYd9MgTGCD+D8q3HDNrO2skV8sXdYWmIS1IFLlw5/9ww/b9W+0yNjmLGXhZshoPf48ZIfU+s8dokIRw1iyweQbQcnKcWIHhdkXQY9ZYfoSm/mPFkRMxLNY4y4OiWt/jRTfAA6q1UBqUxRLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNHsN8nK; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNHsN8nK"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e60b75f87aaso4599366276.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 05:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744805873; x=1745410673; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wlP+HD1QHGE6iO/Q40BNz/pkmIckE06sYeotHoDiylw=;
        b=aNHsN8nKLP+v3Uv76mo3YpT8fPucbb3jqeukjduF7wSNmC7Xy8CkGRxmRI9FzUi3yn
         0Eo7Xld7VS+L87fHRVm9TS6JgL25rHkIdZiTq+poDk8F6+gm8BX1+4lo24BAlVqXe5Ah
         ZnVk6RfybrQqLVIYSrZVTvi+9ON48AOYQtFI8tpmdoFHqQyKqwINo5mnYWuQV5E0Tcsy
         KvBjWkrmqMBcA/IgYPD/k32MYsTc7a0vWc5BiY1YttQOxO+DuWZdIzlwnfLnzDhbcGAT
         07KhL1Tk1FC/Mc0lGJKD9JWDaJzxvkNNVkhisSU+HSNCwRw/ohOeu7qx3pkwgFnW0ezc
         0wCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744805873; x=1745410673;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wlP+HD1QHGE6iO/Q40BNz/pkmIckE06sYeotHoDiylw=;
        b=Zrq8l+L1Odnobr+suD4PjfQSHRR+uwTryyo1duaRKIHqON2R+PwUoVSvaDG+wQpalq
         i21BVs0oqwIAGY0Mk3+IpDxgpJEM9oVe0eN9Hl00DosxMNdL8HtZ6ENhB9WdUZ/h8LRh
         kFsO5kDvviVv/S3U+0un785b86swQ8Pe5ZE2NvxUumxvwBNdW3LaGPmFKLHZmaUzd011
         TqdfBxA3U2L1SV9+rF5yg+756exgudNnfK7hBpX9PZXumP8cYY15R5Ll5fEDSYuATeX5
         1rJRq2hSmCjY43Y+5RGBZNoAjaAsLuTJtnkZdWWUqjQmP+/j9fNUspiU14Y9RW1BrHAN
         fGTA==
X-Gm-Message-State: AOJu0YwtLaqeh2VTiX7LCBvXbK+ZxWSIxnGQT9Mvh4AQqJNTh14vNE1U
	3Oi5gHd2vF9Jgm6v7PdnYS+3Xf3mq38FQTOx+dB98Ff5tfs9tAMIr0V1YyChjBxxTlRihYgvjqQ
	k0hsn+uAIYbpJ2e9yBbCxxXw0lr7FsYo1
X-Gm-Gg: ASbGnct110oCch6PmzJODu4M67fxRQm2EFV06w4JfeaKQfFfi7Yr2enDFCtSMHHgcol
	zE+C1+cQPZELsBP3iLeSs+5Cg76IcThN8fc8Rrh14Bq4Umm8BtwzeryQ97ffZ7py8KBKYmFPk5Y
	m05ZoOtz/wl/LFm+aOX7PMqQ==
X-Google-Smtp-Source: AGHT+IFf7/9q05WuLCBinmHHyeGqSzOB+G+Hb0UXzu8jeUcFvWiFNYdqGcy/Eywb7M0FxO5atgSkOuOsVuLpd6U1hlU=
X-Received: by 2002:a05:6902:2e85:b0:e5d:c97b:78a8 with SMTP id
 3f1490d57ef6-e7275e0091emr1955667276.36.1744805872702; Wed, 16 Apr 2025
 05:17:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: rujra <braker.noob.kernel@gmail.com>
Date: Wed, 16 Apr 2025 17:47:41 +0530
X-Gm-Features: ATxdqUHrKwJ4jWPaIt1lbeiS0wqqDkS38kmrf-1Bx-1WG1dvU1m4yJHUelL3ApE
Message-ID: <CAG+54DbvpWHyX8+ucEQpg2B6rNTJP11CRpYxcYVrKpKehzrK-A@mail.gmail.com>
Subject: [FIRST-PATCH] staging : greybus : gb-beagleplay.c : fixing the checks
 as first-patch
To: ayushdevel1325@gmail.com, johan@kernel.org, elder@kernel.org, 
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org, 
	outreachy@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, rujra <braker.noob.kernel@gmail.com>
Content-Type: text/plain; charset="UTF-8"

added comments on spinlocks for producer-consumer model, rearranged the
lines on function calls where it should not end with "(" this bracket,
also removed white-spaces and aligned the arguments of function calls.

Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>

>8------------------------------------------------------8<

 drivers/greybus/gb-beagleplay.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/greybus/gb-beagleplay.c b/drivers/greybus/gb-beagleplay.c
index 473ac3f2d382..fa1c3a40dd0b 100644
--- a/drivers/greybus/gb-beagleplay.c
+++ b/drivers/greybus/gb-beagleplay.c
@@ -73,7 +73,9 @@ struct gb_beagleplay {
        struct gb_host_device *gb_hd;

        struct work_struct tx_work;
+       //used to ensure that only one producer can access the shared
resource at a time.
        spinlock_t tx_producer_lock;
+       //used to ensure that only one consumer can access the shared
resource at a time.
        spinlock_t tx_consumer_lock;
        struct circ_buf tx_circ_buf;
        u16 tx_crc;
@@ -642,8 +644,8 @@ static int cc1352_bootloader_wait_for_ack(struct
gb_beagleplay *bg)
 {
        int ret;

-       ret = wait_for_completion_timeout(
-               &bg->fwl_ack_com, msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
+       ret = wait_for_completion_timeout(&bg->fwl_ack_com,
+
msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
        if (ret < 0)
                return dev_err_probe(&bg->sd->dev, ret,
                                     "Failed to acquire ack semaphore");
@@ -680,9 +682,8 @@ static int cc1352_bootloader_get_status(struct
gb_beagleplay *bg)
        if (ret < 0)
                return ret;

-       ret = wait_for_completion_timeout(
-               &bg->fwl_cmd_response_com,
-               msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
+       ret = wait_for_completion_timeout(&bg->fwl_cmd_response_com,
+
msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
        if (ret < 0)
                return dev_err_probe(&bg->sd->dev, ret,
                                     "Failed to acquire last status semaphore");
@@ -765,9 +766,8 @@ static int cc1352_bootloader_crc32(struct
gb_beagleplay *bg, u32 *crc32)
        if (ret < 0)
                return ret;

-       ret = wait_for_completion_timeout(
-               &bg->fwl_cmd_response_com,
-               msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
+       ret = wait_for_completion_timeout(&bg->fwl_cmd_response_com,
+
msecs_to_jiffies(CC1352_BOOTLOADER_TIMEOUT));
        if (ret < 0)
                return dev_err_probe(&bg->sd->dev, ret,
                                     "Failed to acquire last status semaphore");
--
2.43.0
