Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8691E3DFC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 19:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744226541; cv=none; b=kCAuxjw25rxpgi5Z2JHl7xqcX9KuwQOJ0wKL66hwN0z4DvH4GsWIVV1RkWXAt5TgG27/ABlM+cLok3pXuRqBxKVBPSTPevtuAnIX2otLF0ZegzEWkM0f1CwXgRS30EoqD55eTacQUtUiOHOfOdF/qwFXyIFznJKdIeO9ZMAJcw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744226541; c=relaxed/simple;
	bh=cmNctPgE5CTHw/tO9Zr51B/dhnA9zRrqJS02ywdELvc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rgsycPM64DCXamSqmXGmvMtPvkEnm4N+g3O/YN6j7uLTXZYmysCqxNa2NncURrnv0UPu1Kz9LPOUYnB94XfZ5MZYpgJuRYgZMOMQR7weHjkaRXKJiwVTaL52YFJV6ILM0LnKu4y5N0xg8ykLAg6FPLD1Nk5vyVIcGgyZYCwfTdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=TwCQYgO4; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="TwCQYgO4"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-85b40a5120eso3033539f.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 12:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744226538; x=1744831338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RpmhxAFcMMXA3ewYDfoakLRc7cttBGIU/Z/F5aA9aBU=;
        b=TwCQYgO4jiAJYKPKOYVkWwyHzgY07PbApO/vuPDHe67VdgC+gjstcmXmm7bV1ByEo4
         7koxdgONZlbBiDVdP6amSXsR+tqG/T3SC5bRvDQTT4UrTgamSMEXnk/SrJopJx1sWYx7
         QndNfvqPUwWx2aMrcCMEv6wDoBzqK916sapi7JEqFrpk+GG7eIUOVHxlNdSDwH1pv4+t
         nEjick0WVMilIlUkuQWuM+zPVTqeOMMN/59/xEgJ6QcrlWgBHKKDGklOQSgYbg2Hhzdx
         wxrhIugZPrea6Bo753xVbXPWe7r0cR4O7casjRRa7KgRjK9pSNnCUmrPfM24VvwFcqXN
         D/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744226538; x=1744831338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RpmhxAFcMMXA3ewYDfoakLRc7cttBGIU/Z/F5aA9aBU=;
        b=fsvfUP8uiwwMfbB8MBWILWUvh24E6m4wmHFI2zY3bWUtEZkaTxHmngar27rZ6uBken
         aPb4wCnWG9nwVu4F2KJWRDFEtjeox9vgk4tkFuua4W2mxR7bZAIDcAfcnG32V/uRwbvv
         prmLHa1yDxECCudMLzqtMFbRzVavwStFsd5PNSOTKgyyKAngp5xJ9BKNReYeJLoZYmJ/
         FNnqe0MkJW5+yQ4S1LF3jXb/lvt4dSD5XqVrEH4nGfRNte3ZDG8wOCMoQlQxMkVgjrra
         g3ONufDEBvR2XOMyE0cR2jKQiteC9T4hHb/JMfVDBEMUNDVhNV9b8YmjEhnH5olOw/RM
         ejTw==
X-Forwarded-Encrypted: i=1; AJvYcCVmiz8O6Xcur83fmWfk89XSJ4gcybAIRru4ChmYBQYc8/sVfNQWaCGdVTdEhLlULfjsOggK6umZXiuIlko=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfSaKTXr23JTqGZglfF1QlPtVK1eeW3LdrDU50VTw1uIMjaPR7
	0R2TjfrQhpGvtiJNmRljHwQzHf5lEfXPt0rQJf2FiV0MxeuE1aH7LTRTT+zsbA8=
X-Gm-Gg: ASbGncv6vMG5PXRbE3DcU/PqZG8sqbNW863QEDPGovKO0DiMBLBbxzxwFl8x/738djc
	7/x8TiFVB7y2xLIowTsjVGmCmXC3OuK1BKFGwrBeEMxQ42KX+SC1GT6hfct6H5pwmk8Klrufpp3
	jfAaVu3wraDIJ8GKKvkodHLYnn0NqxwvvB6ccs9csxR2xiIaccNHSyw5+DYXxAN3cwO0gy8RsC/
	dNPykWo3Ppp3z9zsDS5g/PxW9oU1sAtkDYQjH34wfxX+nbOiS/7mELgdmp7CIf+t26czC3Chr78
	GvKE/iE8oT+0FlovbATGemy0/Vmkoed80JRv4ArygNYq5aVXVhUJUpP+WqMRbUmyonEKhCMYc/o
	otVEwbkfXnVCzWQ==
X-Google-Smtp-Source: AGHT+IHBIdM0sFVSXLsUHTwEjKCRbcHIGbDh+GVFxWpuuQ8TjUX92cXZCZ725TWzNK6m0iuJUoVS1w==
X-Received: by 2002:a05:6602:481a:b0:85b:45c4:571e with SMTP id ca18e2360f4ac-8616edbb21cmr9242139f.9.1744226538068;
        Wed, 09 Apr 2025 12:22:18 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505cf81bcsm373459173.10.2025.04.09.12.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 12:22:17 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	benjamin.larsson@genexis.eu,
	bastien.curutchet@bootlin.com,
	andriy.shevchenko@linux.intel.com,
	u.kleine-koenig@baylibre.com,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] serial: 8250_of: support an optional bus clock
Date: Wed,  9 Apr 2025 14:22:10 -0500
Message-ID: <20250409192213.1130181-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SpacemiT UART hardware requires a bus clock to be enabled in addition
to the primary function clock.

This series makes it possible to specify both clocks via DTS.  If a
bus clock is required, it and the primary clock are fetched by name.

Since the first version, the DT binding (which had errors) was updated
to properly define the number of clocks and clock names, dependent on
the compatible string as suggested by Rob Herring.

The logic that looks up the optional bus clock has also been changed, as
requested by Andy Shevchenko.  In addition, the bus clock pointer (which
was never used after it was enabled) is no longer stored in the
of_serial_info structure.

Here is the first version of this series:
  https://lore.kernel.org/lkml/20250408175146.979557-1-elder@riscstar.com/

					-Alex

Alex Elder (2):
  dt-bindings: serial: 8250: support an optional second clock
  serial: 8250_of: add support for an optional bus clock

 .../devicetree/bindings/serial/8250.yaml      | 30 ++++++++++++++++++-
 drivers/tty/serial/8250/8250_of.c             | 11 ++++++-
 2 files changed, 39 insertions(+), 2 deletions(-)

-- 
2.45.2

