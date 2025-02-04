Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A8F153828
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 19:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738696039; cv=none; b=GMcU5BBHHUM4VB4+DZetQR5WQMe817A2NAgFyemtujMhthjM88kIaBz3LgeTcmzoDBwc5deTAByNCYMjQGF94EZCF/mK9HTx7o4mSUqeTGKeGwHjuNCg5XXdvj/0cNkrQdR1xzyYlCSJAsnJvLNDaCq1FufD6tYmdJUBm2DA8+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738696039; c=relaxed/simple;
	bh=AYlGV4N/PwEioPKGsEBzA6S6S2CCZ5/s2850fCFZcnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XoRXzOmGgJR8hc0pFr8zOBBgWhoknXu1DJok45bfj0dFrFBgNdXOxBOoT3HL/t4jR2aC3ukmdPV1lOC9KK+lT58ELgtWdFJKPeZqQYqxWXIS22LDCiUQhHYIWPqUdo/lDYEjUgI7QD5CWhiFfMq2oZ6lbkUQdzVtwYiofmBFejQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=GW0ezHVu; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="GW0ezHVu"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ab39f84cbf1so1077831366b.3
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 11:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1738696034; x=1739300834; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=umUjZRy1Z8UrcHwkenXACX6iOV8igB/wwX5Kde7mHbk=;
        b=GW0ezHVuTdV7PZ2lvXm3F79vXR4syr5l+JXQWbfEt3Nhas3pvLGVWfH/FveceSQuhA
         HSiqyRo//NVAnu0XDrTO31FCU/XneSgZ1+9D7u7BYpSQvhIw0Z4K3r9LJ8Ea833YbkmB
         LeLntmvGdOCFaR0LHtKH97dY0wQ50xTjn6Q24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738696034; x=1739300834;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=umUjZRy1Z8UrcHwkenXACX6iOV8igB/wwX5Kde7mHbk=;
        b=nK24V7YVcxUgjqeEc7o21GaEZ0mVyhjhl+GwnThjpPvZtSNOt3taIVKuRPdogzgHzi
         YqMPFngZUlpzYWQF8OadQ1/kzook+6fz70/T4SjPR3tf1hoz8XzpRYKhtbjLg6/Vp7S4
         cB8Bb56E6BiDRzWUzC1EAqg13FtZg7Iau3NcOyPGVbr+CeFybtFzawEDoW03YmCJiyrC
         DvfHYjRlNayzipk6RfJYfiyufvqV3rsJfnWV+g+IT/p1ww8Ov43h35sNwlt/ch5W5HYV
         8vfcjFjwPsKfhF/Lzd2KdZ6cviy8qf0ntIA4glSm33VcQiIjU+eWTDTLSlKWB4nsq9N2
         dIfw==
X-Gm-Message-State: AOJu0YywePTgYuMWMeAELGtIdHIl93dafgJelFTCCQA/wo9DzBPIr1do
	BvqC2XkPW3AaOG79GjnfFQXx2m3lkHbqJcT0eqNMoaAwtV9ToT4PZinLUHb5O+BcURvP2Mi63uO
	262M=
X-Gm-Gg: ASbGncvD9B3GeBpWd121RkGEdCPvwUVDRSuNHNLd5jdW02YkjhvSWsHNl6OYTnDiy50
	JqAa5zffUFiTNIDIlY0WT+22qyPanutq8FT3JHWeJZprCE2OPzZReG8kYnPc81vab4bZukbj6l0
	ygabzwWmQI/3xsS8BoBQpqBG48qTnR09NqjlaOhijp9aNmxfYEO57Zvspz5W1E89p5F9GhWfj24
	+1MRtHx7VeWZV1ux8NN/vy8i5n2Sqsc+XDQk6ra1JnXpEUShfNOLsvVQJrKDYzyNeUvocYM8EMz
	D6OJ8zIo851EP0YGVylA/5VtmbcZKU8WmEHRWyqbGZAcY/mgOgG4kvFWgqwS3MLeLA==
X-Google-Smtp-Source: AGHT+IEOyOCOwqYp1t4D0OnwLIUePQIFzSz3HVkTSVRLkqjrXYMPk5jzWi2isym75hxXs6WVwF2XXA==
X-Received: by 2002:a17:906:da85:b0:ab6:9d92:6d6 with SMTP id a640c23a62f3a-ab6cfd0d35dmr3031660966b.26.1738696034486;
        Tue, 04 Feb 2025 11:07:14 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab705f83e6dsm726478666b.117.2025.02.04.11.07.13
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 11:07:13 -0800 (PST)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5dccc90a4f1so1729320a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 11:07:13 -0800 (PST)
X-Received: by 2002:a05:6402:390b:b0:5dc:c869:da53 with SMTP id
 4fb4d7f45d1cf-5dcdb77f50amr164738a12.31.1738696033513; Tue, 04 Feb 2025
 11:07:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z6JjZMdbDoAX_AVW@pavilion.home>
In-Reply-To: <Z6JjZMdbDoAX_AVW@pavilion.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 4 Feb 2025 11:06:57 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiPQ8PTWZuWXw8s+OLNmgXSM3+DxmY=uKd4F-Nnu4TB9A@mail.gmail.com>
X-Gm-Features: AWEUYZnkracKMK8vD_LwPfs5uS-MPZzBS1pz9QywIT05ZThoNg2liDgbiTVFtzU
Message-ID: <CAHk-=wiPQ8PTWZuWXw8s+OLNmgXSM3+DxmY=uKd4F-Nnu4TB9A@mail.gmail.com>
Subject: Re: [GIT PULL] kthreads fixes for v6.14-rc2
To: Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 Feb 2025 at 10:58, Frederic Weisbecker <frederic@kernel.org> wrote:
>
> - Properly handle return value when allocation fails for the preferred
>   affinity.

Well, we have exactly one caller of this function, and that caller
doesn't actually care about the return value.

The function is literally the "preferred" affinity. If the affinity
setup fails, it's harmless.

Anyway, the fix doesn't look wrong, and I've pulled it, but it's just
all very harmless. I think the "set but not used" error could have
been fixed by just removing the 'ret' variable entirely.

                Linus
