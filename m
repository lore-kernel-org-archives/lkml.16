Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4370C26FDBA
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745497870; cv=none; b=rDUM5qeo3OrasAkVCihipQBKgyr9M5flatiYBWWh9iRTroseWFNs7FHSTuYI1zXxoz9dBJywMuYZ0HYsNN4v2KEAKO1N1Hzae1P0R58s12qyLz/oQHyW/yc/e5XfaD7gMKRGw5oUSLtnYH+E+ACmtj11YtJLufFRUY0EUD46Z2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745497870; c=relaxed/simple;
	bh=WPftREPW4/qo/5xHH+9LLqlgxhde25Fhn0/iIWIwpuY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=eJKlYGCIxxuwHtwYxHKBjCn9LQLWJKxqkdx/xEUHR873F+OkhVOBqwkR4xyiuqcAxC/F4pdF63GUIgMWAOskUxQvpZBqSB12tIydL/xbdhEo3jvLACLo5Ga2pr2LonDgHqD22pdYuCxzko5L9dYeT4NQT1sq1J1tS4A5NIRCQhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=eX5YrhpX; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="eX5YrhpX"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-72bd5f25ea6so284926a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 05:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1745497867; x=1746102667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pps9V8ncwYdRycRJbT3v3474lDbFCNoVouzd6mCKRd4=;
        b=eX5YrhpXLWESEHDAQA6W29/SJ6NRb7hcv3THQcMZZ5CoZ/HFJLJAtkP6gKZyw+nhZn
         O/clCzNY06950aNnz2byPPXcJcjU6/YJRNXPnMservILBght2mAm/BOZPKYaicULcZoq
         yq38fvvPTRo5uV/MiWPxSvNH1U7Yh2DiihkUhdC1fEbL+R9lvMIVRVM1LnxnOmV3MtaR
         Q2Z0kEyMW9csxK/JkM4hanYTPXkv9ZLZgyfkLP4+kYIEMl2pUsNOjlTIum5d0XmyLhiN
         SlkCIjqgTsXGaJ59ggN7wy+TVWlT5bq2F5J+Qyv00PYwe9FEB+3WoQeem9qPGdPeF8j2
         I/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745497867; x=1746102667;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pps9V8ncwYdRycRJbT3v3474lDbFCNoVouzd6mCKRd4=;
        b=qsi+R/p6F2ZeKIAiPVRQ/yOMk69VrawgRZMABt2Z4Gw1Gf5+Xc6kIokI3fmTnyutbH
         lPFncUC5wmPgB/WS7vTCxvQt4DggkBIEo3WT+AIzfQLDMxfgqNKFTi2B/IluFGbU3BBG
         r2L7iVDS7z6QBNBg2CaC3xJsymw6Elx69SMIL6yBuEIdkK3NdbKbTPk726MOpsUhn1Db
         q6VOhV9zGdPssd6bQEDlfsISVWgh2zXE7Nkcl3cucpFffP6eTHHGQs8GbKPgBJ/R2g1i
         qagH8KUEcfqz1ZKoDNFUKqWzP8eFftNQKKBd4hXY0RuBEN8u5K/CzCmgcNNjsJjnXf2V
         DsxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXePEIOBHTwQupa21jsMvRGOcUVFKZcWa52snQ4Ayqtk6xsvvN9V2dwqcMbPuwz3wA6RIMnZKHW3unytQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW9Ow1oku3OndDGaXMj/bWlXlLSR03xmIAUMaigtBp5iEC/Q/J
	JRc7SzPKNL4+Pay/i+i5ewFEUJyAWFsyeWq7WKw9qEJUY/JjTJ2JWM9JT89ypcg=
X-Gm-Gg: ASbGncvjj+f8XOZb/nZCo+ezX4toCmTSGgFnGB+Mw4jYCgFBSimebRmHJTuRHdOdm9z
	UVeLEw2vfXGqvXnKpTkdlyIWozjr2hf4PLSR6iPz1naa09c7C2YjCdEI09iCqBkOfhpI/ahbXZX
	UTDmx76lEeGVbj1phl+hXr/p7cd0ejxbjZv3VGCJBM9ge4NYrrBMnp8z9z6eOLB3lbXHhc5CdTW
	qevHCvqvG1NhLjqG1oaFgXpCwQF/x5mazLWDOBTJEBmaUTUnbLATpfOuFMIbhXMp/6wd/MBogcY
	9fXCuY3ZxwAldvLJlTIk7Sl+VDS5m8FV
X-Google-Smtp-Source: AGHT+IHcDAhbNIdVSY+XYgylitasV2oC9fI4HWvx3NtkldPFUlYRuJvXAwP5NGZRmvjfiIpdimj8HA==
X-Received: by 2002:a05:6871:5809:b0:2d9:45b7:8ffc with SMTP id 586e51a60fabf-2d96e21adf2mr1149904fac.3.1745497867264;
        Thu, 24 Apr 2025 05:31:07 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f8249f8c91sm259639173.15.2025.04.24.05.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 05:31:06 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Ming Lei <ming.lei@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Uday Shankar <ushankar@purestorage.com>
Cc: linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250423-ublk_selftests-v1-0-7d060e260e76@purestorage.com>
References: <20250423-ublk_selftests-v1-0-7d060e260e76@purestorage.com>
Subject: Re: (subset) [PATCH 0/2] selftests: ublk: misc fixes
Message-Id: <174549786571.628784.9329773694519239539.b4-ty@kernel.dk>
Date: Thu, 24 Apr 2025 06:31:05 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-7b9b9


On Wed, 23 Apr 2025 15:29:01 -0600, Uday Shankar wrote:
> Fix a couple of small issues in the ublk selftests
> 
> 

Applied, thanks!

[2/2] selftests: ublk: common: fix _get_disk_dev_t for pre-9.0 coreutils
      commit: 1d019736b6f812bebf3ef89d6e887d06e2a822fc

Best regards,
-- 
Jens Axboe



