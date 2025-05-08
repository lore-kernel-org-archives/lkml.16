Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A522853F6
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 15:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746716791; cv=none; b=Y1oVz2krcSpl/+3uQHG5TVCdH8sT8VC9zQLiGd6HiKmQI7EVuMMH65yZd3QxVB47TQIF1zLZBjtMV4S5McmP4Wbm+YUOzcgSKdaxfLromjGDj/INdfJU6m/oJMizTLgt2cFby8R/hvGiiRrGcUb/Te2lNuCvD5V13sN/DmmaGz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746716791; c=relaxed/simple;
	bh=iJCHBHoCmU3LnmTUsPRCCACILpFptrZktkIZpiUYwrk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ULPui/elwqdKQSrd146gahrp4GAFmB80Dk7SWCfkaVCovDX62E4aeMzkjqXLWWFWcdJ8sAVQddlDlDvUYn89pBI2dPCOMpe3Q8H58zNUKiBzyj6jGS2MHOFFLg3JmpTfHmiHzRJweZVOHHupGj5G0igFVwNu9UWxQmfyk+OtFHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=OPyDAfD2; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="OPyDAfD2"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-85e1b1f08a5so34529339f.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 08:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1746716789; x=1747321589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMtew850gCDT2aUsP+c5rPIUjWjMK4ntex+714PkH5s=;
        b=OPyDAfD2PFGG5Zt+tqOg3UMwmWeLE9FD7UULvEFLXdHTrupoNBEHlXy8h/hivshpIm
         RL0ayMQb5/3c9yqEjzagsycsHtat8TM5eeIvhMugxmB9bgkQffGyvWvE1iOqaXqRyptX
         0qrxT3I6vERC8DqS3v9Cp7vfkoA4rQlR+Yki3MSrlABqOayw3Y19MNoR27G57vGNFgqe
         dJN18G/R1CpzXF1Fj+NApIbCLnW+30GKEtwR1JUcXDxI1AR0ohzYsJLcbvm9Zv6Ra+25
         d6Ne7xIL8Cc+9J8MaFXYv4lAJztWyXopUTJ0AdZCFglr+R1FyCxP/1hWhZGqNupkuu4n
         wFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746716789; x=1747321589;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KMtew850gCDT2aUsP+c5rPIUjWjMK4ntex+714PkH5s=;
        b=we3UlkKYPavjYASa/R0eQIF90/d/7cy7cysRL15qPdfLgILc3ttUCrUPv0Gpi/WVOk
         u97dkwEtPdcv+cXn58w0jMLmjIoEii/0EC0NmNa0bTzlS7Vdos65e5feb0PJE2O+kxwN
         gW1nEsCKtnc9nuxXJFkUskqWPOZ1GC4TKbgFn8tlrDB0QOs8Nlx/09pXgRlZ5poeAPMg
         9bQbtLi8Gt0+6wRMQ5Qwc0+dWUzzSQV2gZPoryeqa+diYaU4Nseud1QFP0x6STSWkKov
         0qJleR8+CqXkfc+92oh5BeZtjDXWXBssUNjHz6RJqZYD4JxKsyj+c5tSsOc8zYM977Q+
         YkzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoA+14pgZDwQl/IvavPb3DKENALMeD0fM2BTflu1vJ2UKw9RsJ8sL+E8JIkmuhx23l8zXgnA0WznaCaCQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+ABuEVwbBiRHSxqlGuE/7n2zBbqFOh3UmaZ5Ca0Bmz6CWKEwH
	qz+nExIclE58DhaYBX49Sbg3N186f5sR32ZUUwBnym3fM3vfiRwFlENZGzEvyrM=
X-Gm-Gg: ASbGncvsOvBb6tGvFLkZmXu3gpAjZkcuLZW3VuesNN1GPWIL7y+ZXTqqmuK+Xo4DFtH
	nHR28XkmtyAJuqlCpTdCZ7sfobchIHAlfiiWl0gQrlScrYyG1qtwRNNoCpjjgNkHvfBRQce+/1b
	lv42bq/F3bcKqrPvI9cX9FAprk51wXJX/6Q5n5qiZWOAeIBqmCfS+e828+nK2Q/yY/K/O+xIG0y
	JLwEu5caC2Jar8kTKfszINEcmhDvt7LORN1l/hKBR/rECZ+oIhRa8YpwrI5C/Rl7NenWzXJxzwv
	/U+Xh7Uz2oQJpppcwjFy5b7iQh4a9TJBkT5UwZmizw==
X-Google-Smtp-Source: AGHT+IF15lgmSBn6LT2go0n0pbsbPQb/xkfcKwB6egXRZqw8jaQYzzFp6AaizybDz12LOq70AFnmKg==
X-Received: by 2002:a05:6602:26cb:b0:864:552f:eb26 with SMTP id ca18e2360f4ac-8676352147fmr1812639f.1.1746716789575;
        Thu, 08 May 2025 08:06:29 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88a9418d8sm3110872173.63.2025.05.08.08.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 08:06:28 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Aaron Lu <ziqianlu@bytedance.com>
Cc: Damien Le Moal <dlemoal@kernel.org>, Kexin Wei <ys.weikexin@h3c.com>, 
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250508083018.GA769554@bytedance>
References: <20250508083018.GA769554@bytedance>
Subject: Re: [PATCH v2] block: remove test of incorrect io priority level
Message-Id: <174671678847.2122953.5548552861160934372.b4-ty@kernel.dk>
Date: Thu, 08 May 2025 09:06:28 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-7b9b9


On Thu, 08 May 2025 16:30:36 +0800, Aaron Lu wrote:
> Ever since commit eca2040972b4("scsi: block: ioprio: Clean up interface
> definition"), the macro IOPRIO_PRIO_LEVEL() will mask the level value to
> something between 0 and 7 so necessarily, level will always be lower than
> IOPRIO_NR_LEVELS(8).
> 
> Remove this obsolete check.
> 
> [...]

Applied, thanks!

[1/1] block: remove test of incorrect io priority level
      (no commit info)

Best regards,
-- 
Jens Axboe



