Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF792417F8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 23:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751498354; cv=none; b=TFsIH4D2lhwyVorJz5SyvV4Btd4cOKnce/0Hq7bfG4MIJIanL8AOtSFOSFP+ksNR45ijaBHDSfzAFrGDguaucFpXTILjwNEakbcytPnGrXCau18iyCqrawXT7ZUgn5xjXY8iQIiiIPUl/QXjsPm9C1Vb2jEzWzMIbaHlTzsn6nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751498354; c=relaxed/simple;
	bh=UMFScJeOc6qsluI+E/E6pD8WSw4nf88dqWqk7UUMBrs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ndd2SBRhR5Aw3xkAPMWnm9D17I0XW0I6sr2TXS5vqCajWQrqi/cMlD9krp6jK922EGYvqzxs9df2rvZO2JK1lATMipwdZ69MFwc5g8WJsfNzUZ1nt+KrSmSuJjzknUxqrmuy4QZpVOzBSuj0YQyL8DwwYes0jfLl9lNW/mmohiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=3Rg8gRyi; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="3Rg8gRyi"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3ddd68aeb4fso62473255ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 16:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1751498350; x=1752103150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BfhKYUqRIGLxlhZ7kF1P70N5Tl1tZU5yK4O2SrkXhJY=;
        b=3Rg8gRyivchd3e2UNkCMR4+hWU4Z1HhRSm3XiTH0hha49q4fGJ0t8cMl0PYtpwn2hu
         Af3WZOlQwneYujJsksiFA5lZjlsZbkY70pAOsH/S/bn27Zf9lXY9pUX7puMUpPwx4d57
         tsFHRmqSl8yPHekui7q/jrTy//GIogcLdBAM3uzUeCwXafi08cg/EjRCwtv9uhfoOris
         eljsYc/4I7KXxBMMIxGFwiepNQUObGVzKqTM21gnyJvBl5qtKM1rcbIekLquAbT/e8C6
         PrE0eC+NbsRS63SN69IcFHgQbAC5FpzJNQnqsojkmFajvQ8Z/ysrHArg01KdcKrklVdl
         rHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751498350; x=1752103150;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BfhKYUqRIGLxlhZ7kF1P70N5Tl1tZU5yK4O2SrkXhJY=;
        b=O17PG1p+ebw8QNCZOZdXt1CnEybGCVCJvBw7OEw+zXzCXQWJADj7zVhK4b1psssBu3
         9cxQJerjGlK1Vp0je1WoOEKZJnvBC+6g0Yai64LQU6xoS2BXOdXHHsE8jtLyrfkux1OV
         RkWV0FqIlv2TDbbp6YlrfnPB4ZLPJcvMmZOWuLtzHfkMcM+bLCaeepSPRjGYSneMV621
         XPaneVtrk82/Sxn2TuG/50mW6CPUkxkA2FLlLY3Jhaz/aCg32HarH4Wp3k6I3N2YR4NC
         XyS59ldAzoaALDGr855y7Q7rx/td9gCjBTbRsFHd6Wif3/ABYX/+BgIou5X8dLWQjrpQ
         QjTA==
X-Forwarded-Encrypted: i=1; AJvYcCU2CQjCayCaktkxphpoVzfyBQB1qiMk1SnUtd+xFXebiLpF7X1GX2DZXlFVPSC68AqMnZNiy9oKpQmzmTI=@vger.kernel.org
X-Gm-Message-State: AOJu0YykXQcDYHIjKTEOe7iFdQu83bmr4V/PP0eH7oL0tKr5o5t9KzdL
	cQa9IC2ySPAL/vJX8tO2JhA54RVlBh9eXsayjPssSJ+NOrWDqh5MQscd59d8FyU32HA=
X-Gm-Gg: ASbGnctIAn+1mzIG2yD2c83oPdRS/61gV14sQoIWTRezBFEGXVHXX/HcaLWj/xurzlp
	Wkq0POIRparK2yiKhzwv3v7r9hiGq+kWcHVcZehBuVi4yYGBRb2eIz301AGfiksqdLF+/J4HfZw
	/8nTJNmYFXV9W9loNiqD/j95hO6EA+mPZzL6r8weiQO6PUauK+rKaxXWfjtxxOcEtEGVRkJjdZD
	sO71louZj8RbDL1hA925BG7NS7g0aU9SNFTvxWdQNeIa3UiCsYDQn3jtUCQjNAOZ9jxKze9KfGJ
	yJeelxaOYn+RJ4j7Aa76rxJ4CokuZ0kjwBYSu2EkSU4KqBe7F2JJmg==
X-Google-Smtp-Source: AGHT+IGDBXlZaxl8oIM6dft8hUFa8ZtyX3QM/pPU5YMkBmwPlrxqF/SzbV23u/xjhjoqV57aBpgyQQ==
X-Received: by 2002:a92:ca4e:0:b0:3df:3bdc:2e49 with SMTP id e9e14a558f8ab-3e0549e5af3mr63138415ab.12.1751498350422;
        Wed, 02 Jul 2025 16:19:10 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3df4a09165dsm38313005ab.43.2025.07.02.16.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 16:19:09 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250619143435.3474028-1-csander@purestorage.com>
References: <20250619143435.3474028-1-csander@purestorage.com>
Subject: Re: [PATCH] io_uring/rsrc: skip atomic refcount for uncloned
 buffers
Message-Id: <175149834929.467027.590610605534865564.b4-ty@kernel.dk>
Date: Wed, 02 Jul 2025 17:19:09 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-d7477


On Thu, 19 Jun 2025 08:34:34 -0600, Caleb Sander Mateos wrote:
> io_buffer_unmap() performs an atomic decrement of the io_mapped_ubuf's
> reference count in case it has been cloned into another io_ring_ctx's
> registered buffer table. This is an expensive operation and unnecessary
> in the common case that the io_mapped_ubuf is only registered once.
> Load the reference count first and check whether it's 1. In that case,
> skip the atomic decrement and immediately free the io_mapped_ubuf.
> 
> [...]

Applied, thanks!

[1/1] io_uring/rsrc: skip atomic refcount for uncloned buffers
      commit: daa01d954b13a178c216b6a91f8451a7b83b3bf6

Best regards,
-- 
Jens Axboe



