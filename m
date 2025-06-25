Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94821D5170
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 14:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750863161; cv=none; b=rWZcBDjFw94ETELxsd96pHGKvYSvr2Du1yjeGGOw473uEY2b1gMvZH7xij6CUjaP0p8kXoj8uxiznt7HLzO5bPlQvdKPVkoOeI9nm+zM6Hfie3YnaJRPQNN+16oVLilIruhVQkEGzbKB56AwLHNnpSBwSDPzRC1/3fMrkz4QcQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750863161; c=relaxed/simple;
	bh=blqNeUBeq4tjvuy/9Ly0dt0wfjN65t72jilSiX/+g7U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IVSJAfzZOvP2h7CshKgvr5wu1i1l8JAKDMSI5PXoFasAQ3CaUPbQ3kFJOhJfrJTmm9hRV9dKobhjzlbViCoKd535f8BTMq2bCYQE5BW5KmQsQbeq2qeuKaf2iPlt0i7JQ604sBjrxfUbtF8Pe3+Ao5z5zjTBnCqyGjxbEadTXvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=2LJqB9Az; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="2LJqB9Az"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23636167b30so66535035ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1750863157; x=1751467957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wz1Ak0wbeYwkM41lDzZf9Pz6IYC6aH7Ol1qRTwbIEuM=;
        b=2LJqB9AzZ/XP6a6SKHG3xY37oXE3RqXGG3LcZhJij6/Co6eFDabh/uXgLX8/9TWcC6
         Af0N4vTCc3YK1w1bHfG3NcA6cKhJGAzSiI3upkLqc1/X4zvCkLyitbeSBTl+hRDr7ifk
         jVtGrvO9grwELQsDwN19/LHdl70au5fcTVNwJW7TuANpqAGWi67bPoXFI1Ar1ImmxUoX
         ZiTIAeX7xyOBnYpJ7N1ly5Vq2h6/uh/VObTdvRcYbfahpm6c3rjYYcvNKDP4G+C4Hki/
         W9n5EgCR7ymNVFKz26fLeVR5YT340D9kW41vU+fbbhyuCL7YuydTrndVqJyR32gdhgwN
         Trbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750863157; x=1751467957;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wz1Ak0wbeYwkM41lDzZf9Pz6IYC6aH7Ol1qRTwbIEuM=;
        b=HN+pzJeDxIYzdk/7/6dvsBl+UMajKakEqCpGkcGDnkrnVqWeNb9oYkV8dBingzuSuv
         1liAZQn78BVizAsezjS+WJfTXFMi/VOQAAVL+nNQ+BCWpMMRhLDb5NefrYXGdh09CW3p
         DrRgaMMeD6Ik4XkS/YE0rARKYkuaEYNt8OojYyX5k2w6hpBAUS7nIhKqcSz2//OotSki
         vJ5FmKlJIevLZosDbx84at+2Wo4yk8RTFYtQE03GForH/2lf26sWojDnljHjb5FHuXQ+
         7Y+JJwmER2IqKP+Pxwwqj4l/R+LoVJldPhjxfXDiRqeOwOlau3BV4ewdZU+XkBJ8Zy7x
         /wCA==
X-Forwarded-Encrypted: i=1; AJvYcCVJ0RrbYKDCdtXea8BzPWO8jXGgy+pJr5KIgbnT6VFFQoo0Qu9JGmgf/WRca697l884GtsmFJqpfj6ltfU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeVfVdeAWAfw62TN8OtUVcikcr25MFVMQ/BjPWqfARPaGElT6P
	1N4SDdC6Kpe1uno1Y6ksXx7Zh1DZ7k6lGZRy64qtnxqaXo10/rZ47FTkZ2yeqr1umYM=
X-Gm-Gg: ASbGncuqLVyeF/DntvnKeBpwRG4QAjwMr+X25Rtu43e882GOYmvTwjLWVq+V4hJPdc9
	ZIGP+ox4UmFukAL7u7rR4+WUk/JNHSAT6QqJeRbApl/FtsnpFtoni+GsZkgyu57ibq/iQH2izzQ
	xbaF1Jnm/bThCYeVia370sxpjqBSDq2MCWpct7IZw0VcUfkcL+3FTbQJF0CHE+is04aWINM2xIu
	fVjA8Td5CwctxMwp6rKrMQ86QejMtsUHkaKb1zJqU6XQR1pJYXNVV+HTnKyeHPCUCdnqzSGCC76
	mXKMkGJ4480e7xIpqxOeqWWJ9NaIbu3b/zBQnkyrn38Is/X/EclVrw==
X-Google-Smtp-Source: AGHT+IH1ttY22NoB2TLT5LMAa1LZM20YfAQYpf+mdNR1+XahCsy7uPx4SRjp6id1ToSCVSVCJE/K2w==
X-Received: by 2002:a17:902:dac4:b0:234:bfcb:5bfa with SMTP id d9443c01a7336-23823fc4f7cmr57992235ad.15.1750863156996;
        Wed, 25 Jun 2025 07:52:36 -0700 (PDT)
Received: from [127.0.0.1] ([12.48.65.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d867f5cfsm133029065ad.181.2025.06.25.07.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 07:52:36 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Penglei Jiang <superman.xpt@gmail.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asml.silence@gmail.com
In-Reply-To: <20250625102703.68336-1-superman.xpt@gmail.com>
References: <20250625102703.68336-1-superman.xpt@gmail.com>
Subject: Re: [PATCH] io_uring: fix resource leak in io_import_dmabuf()
Message-Id: <175086315592.128628.9014300764157579909.b4-ty@kernel.dk>
Date: Wed, 25 Jun 2025 08:52:35 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-d7477


On Wed, 25 Jun 2025 03:27:03 -0700, Penglei Jiang wrote:
> Replace the return statement with setting ret = -EINVAL and jumping to
> the err label to ensure resources are released via io_release_dmabuf.
> 
> 

Applied, thanks!

[1/1] io_uring: fix resource leak in io_import_dmabuf()
      commit: 7cac633a42a7b3c8146eb1db76fb80dc652998de

Best regards,
-- 
Jens Axboe



