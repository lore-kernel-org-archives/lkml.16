Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0CE1E51FA
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 15:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749828369; cv=none; b=kpS/zj6o/WqNGJkHPaiIR2pYc+W+OVmslGPdoxizssgPE4p/zQIPqumlrEOgda5zh9yOMBzmvdllIeo6swNnstWFyvQWI5P4gcpYv4UG0x7X09QPAURkZs7VGKI2U2KV0dsA60snbxAbJfCfl2DKI2c+d6Jp74ddxoJpzWg0GCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749828369; c=relaxed/simple;
	bh=4e0gp9uIV7MyzxlvTTu7qZW9G/t1tf1C48sZL1Ybazo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lUmlikJAzolxXPvT9mJ0YLSoLUljPd4qF0HRgbqR0/1chycCLSpZuiJYWkfylS0JrbnEOSvtP/9PpHL6bNkHtHeLH6M/E4OtL8UfhOTNObdk+cfkcFrTDZZm7rqnHm02MuZjGpP0YXnbb5VnZBJl+cTsEjWzWNMakXiYDn9wdJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=IT+zgK9t; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="IT+zgK9t"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-861d7a09c88so69982239f.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 08:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1749828366; x=1750433166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJyEx9SEtMoT9W574jcNh5RLLtb5eK5nBGN8Lv2U/V8=;
        b=IT+zgK9tshirZFdcjv95do9YnxYi+asmrxVUqSX9K3SiLvuXrg/csjG2Lz2iD4WDrD
         KGpO+RL09zdoGwAA7pn2wTseKl563bEVBiO5D6DWo+1E3LcdmIewF5rFEuaW3bC1hFXh
         fu9l0iN/iKGsoGvuvAGr3/imrSfjAdbj8Yn9ov37jukVDRVnrSIL7p1HxhIFIizE+Agn
         XBHgbrENP9pWBPGEMK+AKSzl59y9akCH0JyXU0pOJmcTp4G4wdyFZY5KIx9aTeYGx8rK
         VfI+6GIEjBh9H5fPc2FPvCWdYLGV5Q/o+OqO+DBldp270/TiWNGbLGPnWcwp9zCVKiub
         vIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749828366; x=1750433166;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJyEx9SEtMoT9W574jcNh5RLLtb5eK5nBGN8Lv2U/V8=;
        b=DAqKNqd1D7lslHsP6MD15YHJWVmTzHuI66RWtsBHB7CQT2/B6z2V9DoaFALJcw4r0K
         Nm0vZ4dHhayES+3UV3vJU8u2+YxKXukCui5O9oNBUyAvY/yrv5eH3eqQcas/N+U8PBzg
         JcNPyt+sNfYM08KGHNNVvlZnaRbYGo9t2HrtjhSY/gHSGYFZI/jP4dv3e1TQdejWZRYk
         1KgD23vtcBLEV8cwTShU6Rmng1zrj54rT6n+NJmwP0tmM4lSkbzqU3rzoRS2oU7Dn4Tq
         yfibEwjSnBGjDW1lAJDRPRcUNpJKowWmhY+Zv8utdPbaIKzpT7s2oBggiE9yZBXL5x9z
         GTeA==
X-Gm-Message-State: AOJu0YycmxMvm68lf6pAnYGgxhokYBhs8mLUyVxhol7LvK+L2oV9qITq
	vjHHf5rmi/74hQOH4xavwC/WttxrByWZsch5pCnQly3okVxq+Z7jFTPRB0oRH0to5II=
X-Gm-Gg: ASbGncvydpdTjKidzNUoBkP86LegoesPBPZGvbN2I/5QQWUOd6Dp+sZSHyfH9BXZWB7
	dvN2KDbg+gAwd7Pfo0dd+3BT8eMIA18EYRtbvPGZst8ImfxREAm3Vu77bQYvknqgtt7/USTjX81
	t4xvBcEPoSFsJGST5dzgSE5HAPQWdahdQAmOsHJi+aP01ilirHnmUeWkzbb1+ioc2fl3LESxxoj
	3oA7ClUyIvJHpIdvA0TZJbWsuGYNcMbo6/nnJh4xivTaD5cbhwcTnYTef4knN1yE3m1QBey7wpg
	DzCwL//8VyddOOP30cgkWsv6iycdWDh76fKmw+UR2VoNPP6kUxjl
X-Google-Smtp-Source: AGHT+IGYvJK3/OvP02MLHyARtWzj0lGmzWqmFxziBjJCVW+F8NXt7Xn4uM0PaH6+Trrm9TNdqvfACg==
X-Received: by 2002:a05:6602:7504:b0:866:217f:80a with SMTP id ca18e2360f4ac-875d3c88149mr444305339f.7.1749828366385;
        Fri, 13 Jun 2025 08:26:06 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-875d570f54fsm32817239f.10.2025.06.13.08.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 08:26:05 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Documentation <linux-doc@vger.kernel.org>, 
 Linux Block Devices <linux-block@vger.kernel.org>, 
 Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Caleb Sander Mateos <csander@purestorage.com>, 
 Ming Lei <ming.lei@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Stephen Rothwell <sfr@canb.auug.org.au>
In-Reply-To: <20250613023857.15971-1-bagasdotme@gmail.com>
References: <20250613023857.15971-1-bagasdotme@gmail.com>
Subject: Re: [PATCH] Documentation: ublk: Separate UBLK_F_AUTO_BUF_REG
 fallback behavior sublists
Message-Id: <174982836505.723307.4689076506739660480.b4-ty@kernel.dk>
Date: Fri, 13 Jun 2025 09:26:05 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-7b9b9


On Fri, 13 Jun 2025 09:38:57 +0700, Bagas Sanjaya wrote:
> Stephen Rothwell reports htmldocs warning on ublk docs:
> 
> Documentation/block/ublk.rst:414: ERROR: Unexpected indentation. [docutils]
> 
> Fix the warning by separating sublists of auto buffer registration
> fallback behavior from their appropriate parent list item.
> 
> [...]

Applied, thanks!

[1/1] Documentation: ublk: Separate UBLK_F_AUTO_BUF_REG fallback behavior sublists
      commit: db3dfae1a2f662e69d535827703bcdbb04b8d72b

Best regards,
-- 
Jens Axboe



