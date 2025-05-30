Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DED186284
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 17:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748624781; cv=none; b=RVe5CPpz1pHG9nSip21IJOcHfy8ZLqPDkebvIVe4yZ/Cd6eyBIgWdL0T6lDnwN/4LFHjEfGh132BEowVJjFEqqtq1v+V5hIWoxk1xfJc/5BC04l7t8vP3nYOWVTNbUFIMh2I4c+1a9gyvd7OK7hsWFIQ+ffti1pPQaekVfj7+Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748624781; c=relaxed/simple;
	bh=QFqRIohx+gg2gSDAWM54O7rFkDGLr0wlaiWyj59McBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=qZoRdgYncmW61FwonYq+VZowrJ9Y9NUSFaryQOxlqkMw9gS6bH0DKc/9x3DQsnzKj350pBaeQXI903TPTdec8SBC/Mna8yRqrTTsPdmnJg8CCELzfUgvL/UAkmI2Rr4Z9eCarwGO7MwMu3q77/OTLui0wbwsH1FM9hiYa8Vsdb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=bS7wcDPV; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="bS7wcDPV"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-604f5691bceso3928288a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748624777; x=1749229577; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U/o84Yr6SF+pAOxckVsdedEwv8np9xFOiTbTyVF24CE=;
        b=bS7wcDPVvFX0PuncWp2oNKfvls+ZCLjQZj/niMs81XnKmNijjSNsLNswJkpl/AhcMY
         jCq3zSEnjNGzto0qqiKXuX6Drl7aqmu+E1FfDEaHoqJXvZR5nO2TLUXGYWS0EpxBP2N6
         7Z40fgCrlEZqD2sw4yFkhiqpYJpqhpVDQDV00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748624777; x=1749229577;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U/o84Yr6SF+pAOxckVsdedEwv8np9xFOiTbTyVF24CE=;
        b=fGdVmbaP7XE7j28GsNvAtVxR+KKT5KQmVKA2GueuZr0ARj9Nq8CTa6d5MsPfS1gXhy
         /g8REBYySgybtHOdaAQc6Q08xwbrbpJ+5R064VsBm4bfRSiu2Xb0xZhROHBy4cRObgj+
         VoOBtr503pyjADEkViDbz/SRdcrcFkL2EYbFcx8TbrQFyK99MZK/RIwuYLQaZq7tGLhC
         sh62O9bdTP3SfBwnV4s6pBxqFMafRfyuKrUnNuFm04ZLDX5j526uDxXusEqBFv3/JDZF
         5NYpUzz8uRmC03WRv7XnjZRziy1p/d8SrVJN9X5cx3CLbJBpxn5g8uDH0z3ciueO8Pi8
         6ueQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXVqU7hq2r8o2yYvnigJN9uxyL0118SmlJZHFODrYb3uG6DUNweRJm/sNasiJATmpAwO/1uVwyEOvY+us=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAhsvXYsdI5lAlDO5UwPepyoduDayp2xhi1QVH4/V3H3MR2eUA
	lKS9n3rrDIl/MQ0CcxUyg/Oc6qkxTtmPZiGvFTcEsvWholt1yPVRSaMP6GtZZVoY5t+3l7dEgM2
	EbfrP2lo=
X-Gm-Gg: ASbGncvNXnqmXCwpnM4qw3MFPN2ObwYqTlyj4OiPM3ssaWJrD3JAgqk5iR7wiX99vWT
	rp9fgeV4ZBjjdF3q5VtOahZH2EqjsgstCwKoGSdPt/SBoBD1GplhxjfS+aRJMMIpIzsmKE7tuxP
	35DErb7u8NMi3pv10M3t7fEWfrG1gttawdWxzfuXvUSYVhgbJA4/LOB8lfGJHl6raiYBKPIc5z2
	XMfYszPx4IgP0FNvQgkxagXrxFVv/LtiK5/wh4GdRQPcfU7W3bVOpA8YkaA34By8SNrJ4hGdusN
	nui2+7OvqG2l5YJ3b8ZXXXAPyF8k7eUfsQ3mBsO73eTkHl+SLGznMC4eQkMkgVGVmlDrJF4deQS
	mFWz4TADrwIuUdUrpNXiekUX/nA==
X-Google-Smtp-Source: AGHT+IEk/lY76fDnB9Ez92IeocfbHi8sdFCfe90v9PBdEc9tQ4tp11Epzgo6eghuEcWqF3VAcGA+IQ==
X-Received: by 2002:a05:6402:2346:b0:602:4405:777b with SMTP id 4fb4d7f45d1cf-6056ed04375mr3353282a12.24.1748624777608;
        Fri, 30 May 2025 10:06:17 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60566c5c8easm1927583a12.28.2025.05.30.10.06.15
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 10:06:16 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5fff52493e0so3142988a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:06:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXulxayK6iqa46TBFOzcbYE4Luol0V4UIvhsmODCakYOwQMHlLMCFzmwvq9IacwCr/xXliUBw91RYCgD5k=@vger.kernel.org
X-Received: by 2002:a05:6402:254a:b0:604:abcd:b177 with SMTP id
 4fb4d7f45d1cf-6056ef01facmr3657145a12.30.1748624775458; Fri, 30 May 2025
 10:06:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aDnYz2PB_euziA01@shikoro>
In-Reply-To: <aDnYz2PB_euziA01@shikoro>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 30 May 2025 10:05:58 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiKW=BPcDvBAsVDemdWBR0uh09A_WMOCoceqj3w3doGJg@mail.gmail.com>
X-Gm-Features: AX0GCFuuCFRFZ8MrcVzGYWvM4KfXKhf8fbmrBC19F3Bg8T7nLuy_7WQutZTXu08
Message-ID: <CAHk-=wiKW=BPcDvBAsVDemdWBR0uh09A_WMOCoceqj3w3doGJg@mail.gmail.com>
Subject: Re: [PULL REQUEST] i2c-for-6.16-rc1
To: Wolfram Sang <wsa@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 May 2025 at 09:12, Wolfram Sang <wsa@kernel.org> wrote:
>
> this pull-request will have a merge conflict with the media-tree. You
> can find a resolution from the author of the I2C changes here [1]. The
> diff there is mangled, sadly. I already asked for a better version. Hope
> it arrived when you process this request.

Oh, that resolution was wrong in other ways than just being mangled.

That

                mutex_destroy(&rxport->aliased_addrs_lock);

is wrong - it needs to be "mutex_destroy(&it.export..."

                Linus
