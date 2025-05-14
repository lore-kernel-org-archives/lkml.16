Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42163156C69
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747206890; cv=none; b=FlL6jb2/T2yPKwq6i+ILMPYpyFN5cAtlCrK0WihLKdNR+HiNeGesI684HoUUX4DMWHUyubVCgE3ppsCbL8qm4g1akIFI4DTfHGGG0OaQ7HV/LAMRI2ZOBU0z7GiMCqprzI22rBSPvLwtsgpoxNZhhUBi8/aMM3hvC2G3W+TiNU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747206890; c=relaxed/simple;
	bh=FsUeariTaOtC3wOkS3Y5gBXTPIMGCYXsIwrCTIIHvzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iEmlXTTdlCXZal2Ukhyzs0lK2vogtPweyCjrPd0MECbfKAbaL3wW4qQLZkarra8uHa/sBYqKZbmWPJkevOpqQEf414zZwNc/b/zHtZ+lpAC5AelvRm5g77ENO21Smu0RurBckWkD24PMvXV+FNWxZ7LH5wZwSxRx/6pzWVFqyZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JCRM+Xli; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JCRM+Xli"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-30dfd9e7fa8so3141086a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 00:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747206887; x=1747811687; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ifjz5GrfGnsIJd6UPXVj+WXIBaf2AkE/6Ipgjj2efgM=;
        b=JCRM+XliYyCPctUOmbjdhPGPXzpf6odFOoCBxn3Mdv6aQaR4v5YQtYmLmXapkLmE5P
         smWnnFmqsoe+PM0IQ3tC0hMgAhah4GTJjd0KXfeNRwrHRrFiYMdlqExjI+3RYZXZKJRl
         z+jffw3TzcVlKwZ9iwentwSj1ibQkAvCBFJHbNdRHh4hAZ8qfnNckZAJE8kRCFYXCpGq
         NMbYPZoCYTo15A1PyMccu9bUdKsTflSLVwODLCmZBJM8RQ3q985KXSqanlcIUWb4Bh6M
         Wp2RfOeFmhRNxG3B1T1VscxdjN3swQtf5bSMaPrM1vaZbQr4snFrdgDoJC4LoOLdJWW8
         K7eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747206887; x=1747811687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ifjz5GrfGnsIJd6UPXVj+WXIBaf2AkE/6Ipgjj2efgM=;
        b=tdsDuG5o1czF1dlQzCBd+cyU9+bHNaSV+Yg7q3aHNU/m5JV5iP8a7vr6Z8jK6vXew4
         00oIPhl0H2JhwO+26uXufWJGqCDuSif6V0NRgQmSUtzlUUvw52jKD7KVp5+qiqPcGej2
         PyxxtARJb//OX1FI5+0TNeErkNvMWh8vduzzTtSUTa9A1somF4waltv4A8cterOFAzqQ
         5K/TCUtm19DuzVQB32QNcLCr9WPPcOKdXMpjGYKGJrU8ODffnViYGNu9dgWft2Cqpjuy
         bYH+iV/d8yzP79Ktcn3mkyH3wmZ76cOCq9PSloMRoQ4Fw/HkYzJSrAMhgVPJYDhd1MJV
         BsFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGZBuDy1/dwpRWyIR+uKBnp5ZSUu6akNsl1vD3ckD5SnB9OMQ4lelxDmuzHK0vYn7Ck5PUfGKtu2dQcHU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB8RiPe0FcSiqH1hdL7MwbvsWjp/efT+GMHvOFlcIR/oz4JiJL
	v6XPflGRJ6I64q259MWBiUl3ZMO/TPA6IP1TsuducqN8Xi7/H6dRqsyr9ePFZsFx7/oMUX5tAOw
	CbPUTrK6ZTQrA/RdztbpqTQty7rEqVIjypqQ=
X-Gm-Gg: ASbGncu6WweEadCNw72d7OUKBm8p/VPRrfpA6OYlLqq2MlGBMUyg1Qa6gdy8Cyc0Xo2
	2eLcO40KtRErfni1uvyrBGn38d1HHrtCXZByhkY66x/nsKjgOu5I9Pn9z4QaApj22KWP0uayopB
	ePo3HB33RFVpVe6ikQGRHiPIIhWhFH1jd9agk=
X-Google-Smtp-Source: AGHT+IHbxCATZM3WCqYmFO+OaM2v7VVUiLMbgTEeosU1KJCc3Dkfxu5HKL7CSk/AX6LPSu5VocV7mF0Hy//xy2+PjFU=
X-Received: by 2002:a17:90b:58c5:b0:2ee:df70:1ff3 with SMTP id
 98e67ed59e1d1-30e2e42c9d3mr5097691a91.0.1747206887380; Wed, 14 May 2025
 00:14:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250510102130.14710-1-amfernusus@gmail.com> <20250514053802.GA24939@lst.de>
In-Reply-To: <20250514053802.GA24939@lst.de>
From: Ilya Guterman <iliyagutermann@gmail.com>
Date: Wed, 14 May 2025 16:14:11 +0900
X-Gm-Features: AX0GCFs5X8zlzE4MagQ5ZIWTGUZQkvO8YqfbrIOXQ6gVGXtRZyvEcKJqaQY88co
Message-ID: <CAMraO6-rQsf8T_ocOKbe3yMP+91W=AF6WtRUYVPtNuq43H8qXA@mail.gmail.com>
Subject: Re: [PATCH] drivers/nvme: Add quirks for device 025e:f1ac
To: Christoph Hellwig <hch@lst.de>
Cc: kbusch@kernel.org, axboe@kernel.dk, sagi@grimberg.me, 
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've only been able to test on my own host system, but I found similar
reports from others online.

Let me quote from the reddit conversation
https://www.reddit.com/r/buildapcsales/comments/1e4tgge/comment/ldha0ye/

> If it=E2=80=99s the same issues as the Solidigm P44 Pro, don=E2=80=99t re=
commend. Has a couple issues:
> 2. There also appears to be a NVME controller issue where it disconnects =
or something. Results in a full system crash and the drive unable to be fou=
nd upon reboot  attempts. Requires full power cycle. Unsure if this affects=
 the P41 Platinum
> > I experienced #2, it's something relating to the power saving state and=
 it being unable to wake up in time. The fix on Linux is to add the boot pa=
rameter nvme_core.default_ps_max_latency_us=3D0. There exists no fix for Wi=
ndows.

Here=E2=80=99s a report about the drive disconnecting randomly, although it=
=E2=80=99s
unclear whether it=E2=80=99s related to waking up from sleep.
https://community.solidigm.com/t5/solid-state-drives-nand/p44-pro-nvme-cont=
roller-is-down-will-reset/m-p/24348
