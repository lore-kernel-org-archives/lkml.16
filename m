Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C4529115D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 13:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744638601; cv=none; b=OlKHm281FxiACG7ClqJR4kHFFJIGS3vq8sAoc1SFCR/uFVq/8BxRzjjAoud3ZSGsnfoz9NIo3t9J9aypmuvU6TNVritQmeeADt293ppX/t4A7J7e1lXskR6MmSn58I7+LbwIhjvyf2JUxdiT7ujQXN/Qr1I2bXd8zLiKPF5U/bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744638601; c=relaxed/simple;
	bh=9bY19X6s1XcHU0Bp+zVhPyp51N++cEtOnYIuBK8fw2Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qIfLz58JPtt7+DHKFpKXJy4P+1/Qjy4qbjECOgZEiAKQOMxU7hmY/p72ISSqXFNK9PR3MsFOO05KuJiu1KveHQtumtSt9lOsc2c5FAFLKrNSANa5qCNj2PaailQFZpeAkANJ3vsMa/yBbiMSfU6ScPQjTI7EPYlr6USUrgfGWoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=e/ZwtEiL; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="e/ZwtEiL"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-477296dce76so37219281cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 06:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1744638597; x=1745243397; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9bY19X6s1XcHU0Bp+zVhPyp51N++cEtOnYIuBK8fw2Y=;
        b=e/ZwtEiLPSuRgSFQlJwVQZDV+qAt41LrLjenc8rbwxaijIhqHcmaOe5xUg8whGjlb3
         7VKRtZxJtZSgC5s2VmZ9oZ8kPqXpDeI6K4LJ6PQup6pbN8sHVg1VdwwXLzlqxm4m8reV
         YkwxuQhOxu8YQl8+My2ysPba5f6S014DbRyd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744638597; x=1745243397;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9bY19X6s1XcHU0Bp+zVhPyp51N++cEtOnYIuBK8fw2Y=;
        b=nYHOD4XB0dpNecdQ+9PkGrDn/M8nvHvEVqHPYERL2kEQogT14qPOiZACdzsM4kBvQY
         Qo7rc37T7N02VAORRGDx27RGZ5mA/dld7lko5o1L3AcKwwPsSd1sVIQwmqUIt42jVtV8
         MTuOyuN9syF2n5aOSw4mzPgYdHHQSB92a44cRzBtvqeRsc2KHS5t1Fg/uqh6tYcP/lDb
         5sOdCMozkgyHDMy0YrDo0b+y3Kk4ccLLxMjAGbHnBCLTgM/TCDQ4v7c8hRPJFv3EgVr1
         rebZC9euPu1f/OyPz19vDEZt9j5goOgechKQpPLq3A/3BZsXsz4So5zrky9OhBpTcdJw
         61tg==
X-Forwarded-Encrypted: i=1; AJvYcCVt0WZB7eM0U2UW7RvQPFugD/eQQDzc4/Hv0BK8w+byVWKXf+4dLBjwJPg6fpJoOtU8kvVaLGYQC+QS7mQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrfoTK6+ID34G0qW0ZP5uyDyVzYol/xhpQl38ek3LihCaO3W0s
	ZQWCPsbIJzGRPF49WP4RZoaisXhBO9VuQFlw5zbRWtLLrfWirtA6PTeDvRpQMh3R+8oMiJUHhkK
	dX4ZAnvF1ZBv1K0qGWybkuGFs3FYZGxtpQQx4ow==
X-Gm-Gg: ASbGncugH+IWCJCqbkA9eJV5amoLrn4OxO942Q4ebLJvm+FCo9eku2Iz2bMvhy2cptv
	7dUPgRdgu2QYsLamQPJxt86mIyLDXfr7scvAlRPk2f8o3ZKaPStRp02imhwujNkcEJdg3ziKYJL
	y4cNcA8L9qopE+KePmALE=
X-Google-Smtp-Source: AGHT+IEZnx2ua4BNTwwSY90xVl9/DsFfXFO/2jCY0FjwTjZbpcGwRMsGVneaA3gXMQIvMPRCpa5zRDyI3qKpKbF/JuQ=
X-Received: by 2002:a05:622a:652:b0:476:9b40:c2cf with SMTP id
 d75a77b69052e-479775eaa53mr209840541cf.50.1744638596951; Mon, 14 Apr 2025
 06:49:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_F1DBC4D1F22658222170020AC7DB0B4CF405@qq.com>
In-Reply-To: <tencent_F1DBC4D1F22658222170020AC7DB0B4CF405@qq.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 14 Apr 2025 15:49:46 +0200
X-Gm-Features: ATxdqUGVRx8qh1Vx9I4nLgse8lILHVF6-1K_zzvhAe6AotPhJh8_DJGed1KytJk
Message-ID: <CAJfpegv4eAj7OL0AZJhtyvGenet5iF7cp3yKA26BuWucRW+hNg@mail.gmail.com>
Subject: Re: [PATCH 1/2] fs/fuse: Change 'unsigned's to 'unsigned int's.
To: Jiale Yang <295107659@qq.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Nov 2024 at 09:30, Jiale Yang <295107659@qq.com> wrote:
>
> Prefer 'unsigned int' to bare 'unsigned', as reported by checkpatch.pl:
> WARNING: Prefer 'unsigned int' to bare use of 'unsigned'.
>
> Signed-off-by: Jiale Yang <295107659@qq.com>

Applied, thanks.

Miklos
