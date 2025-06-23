Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A136253F13
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750688222; cv=none; b=kS9186aObCta5mpNa4lJx+0SnNmXWi6mc4l7VKCLUjADsPu+qtbYbbTPLinTfQ1FBRLwYxIVwnKZaBZNI7Ro8ooXQkrDXabng2VmgJp+xunp2xfvzJdex7lHaG4optiyujEAZHs+rEYTUigKEwRSe0aNkTtj0i+K3I+0K+6O79s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750688222; c=relaxed/simple;
	bh=4sigOS/urFG8brAKKfv6zzu5o31axp6lF2JzLxHf/DQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dXcW9v4WevKpbokeg/URDf8Dpw65YlegnwvzgHleeDPbniy2UMW5Bpu//edNk+ef5ZjAnMaeo40ipH1vEZIT88dxmKnen65iZx0fnqs2hffPrICpzCBivEq1bdCuPSeQK/oXv9fhU0fNnJarfesPhI/InnpGBYRB77Rn4SIvcz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GfyUCN2Y; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GfyUCN2Y"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7382a999970so2809922a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750688220; x=1751293020; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sw2KbHBZVpbmJppFl8KBxErcXGguWr7O6NCzbr+d6nk=;
        b=GfyUCN2YnkmBOxKHtEXURHv8upunjtrvcTe8akfvokanGkwcvAKyqUuYaSm2QNDVyK
         X++qOv3InLQ7MXqfIrKJWR4iZpPRHDHoafLo8qzQcjEYA38KBjBSj2Hs4kbBUIQovbd+
         EPbEoxfHvkaLM4KgC9p8U1Ow+fSlhAhR6GYZmvVvmQLSjjcDn8Ppf8rKyYWSI1/f9LmL
         6xwoOZPlABYYMNx6LATVH7ack5HJcGlRBq+ADoZ84XZ0ni983IM6N/VoM5DG5TJgPaay
         6b6XPqbXjS5Yi0futCyaE/eafMPwcbEOJ9mgcu1gKsQrVBdWVhKuqk1s8CKBCpZi5U1L
         U0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750688220; x=1751293020;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sw2KbHBZVpbmJppFl8KBxErcXGguWr7O6NCzbr+d6nk=;
        b=GpS5unarixhVpU2aUhKoMU7G/Ncvg5R3JnFvoeHOVzce0tvTwZaraQLY6cFGtZNN+T
         qycxsE4NCh9Hz6o8xzXXZNnzyjgxow/GAqu80Nr5UrL221mLkGcKS2DUUeAcAksq3IYu
         wgr0xAscGqeY6NA9ZdWMhoOx1OQ8stX3Z4mYId5rzA0MN5e2dy67RWiWcp/V8OSqQYsH
         YtdJ6fTrmVBimr0tygPZPy4RgKT3XjfS2p9r+JY9/IzxPzy+SVV/sefWCml/EqTqzPWz
         X70btrvoARl8cbiSBBLZcQsxFxL3H+OL3XtYfh+kzltw1nDAM7lGMQ9P7zw0P9o2cVXG
         GykA==
X-Forwarded-Encrypted: i=1; AJvYcCUfG0QNcruUaAtt/p2WlxdWlw39YTqvYPRQtptHDtFDtEVW8zOIISvP8F7ANkPFuyUgl0M79P15FnQpMvQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9yCihSFzTBeQ7XKcM2K/3KSxUD8fS/krz/4Mf8kFgFLM3nBKf
	5rSJGbn94WS+2qUY6kvrsqMxbh97UF1CEMKCXx3g1Uta0TttjHkRNbjz+WzXdphyY6g=
X-Gm-Gg: ASbGncsziA2tzdtpySNcZbE4t2dZ0Pj3NqO1Bt2eh5uovpd305GD+pjYWfN9zeRdjC5
	29cOcXaUPJ47tKYwne0zC51gUTtPXMApfF9P6bY0k97ydsD7RdyAXKu+jbH3SO37PD1kcwiGTtW
	OQ4+z8m+k3DjXDZCm+hYGKeISR7A+/BvA/pjrs6yNeuwxHYf1btYElP3j5UNgIEO1c7Sxi/hyuU
	pJ9wzdnHQVLVVfTjKgm2V4sgSzZwNIKMgrCr3CZwfsYQDjKKingIykM5teQ3kztYjKeeNP4744w
	A/PZEcBUdkFVH9H+pq7mXC7s92v82x83wEYKO+GwSpS7wTFwdJm0fcPzdeADUuYNGcTSPQ==
X-Google-Smtp-Source: AGHT+IH/W6bUwoQ/oCDqxzbkBFhhtZ/Fi6LgoZ05YDqiaOhVb1dp7z4SKY54nEy+7+CedB7z2NIslw==
X-Received: by 2002:a05:6830:668b:b0:73a:96e5:19b9 with SMTP id 46e09a7af769-73a96e5a6ccmr8122051a34.2.1750688219746;
        Mon, 23 Jun 2025 07:16:59 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8c3f:8b5f:5c74:76a9])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a90cbb5ccsm1418904a34.58.2025.06.23.07.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:16:58 -0700 (PDT)
Date: Mon, 23 Jun 2025 17:16:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>, andy@kernel.org,
	hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: Replace scnprintf with
 sysfs_emit in bo_show
Message-ID: <a2a67998-f67e-4677-a348-780bf640bfc3@suswa.mountain>
References: <20250621062944.168386-1-abdelrahmanfekry375@gmail.com>
 <CAHp75Ve3PWgkwncVv5tGxzjWkF+Nodtp=Q3dpCejfSRD1BFMig@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Ve3PWgkwncVv5tGxzjWkF+Nodtp=Q3dpCejfSRD1BFMig@mail.gmail.com>

On Sat, Jun 21, 2025 at 09:24:40PM +0300, Andy Shevchenko wrote:
> On Sat, Jun 21, 2025 at 9:30 AM Abdelrahman Fekry
> >
> > -       ret = scnprintf(buf, PAGE_SIZE, "type pgnr\n");
> > -       if (ret <= 0)
> > -               return 0;
> > -
> > -       index1 += ret;
> > +       offset += sysfs_emit(buf, "type pgnr\n");
> 
> This changes the behaviour in case the sysfs_emit() fails. Not that
> this is a big issue, but it should be pointed out somewhere.
> 
> ...

Neither scnprintf() nor sysfs_emit() can return negatives.

regards,
dan carpenter

