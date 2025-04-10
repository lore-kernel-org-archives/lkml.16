Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9D91E47BA
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 08:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744272298; cv=none; b=Nv7IjwN8HaVzEG0DhNnzHA8ZL8g7fCpwWMOuGjkGa1d/SHtJk/vLGOpDbp3QSTbT9amF2a5rtbELkNoBOfZpXcq9U+MmmjE2DHVsp9qCpr56F2CzspvbAtFyP1OSOXC4Y4RVCRfMc89B9LOH/1gzhIHMmjrGpL1ZltnJLHQ9w0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744272298; c=relaxed/simple;
	bh=meSSP8a70ro5KR6XsGtVh/XPLlTjZJaf5Hv6He5tEls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ur+OxTY5TOwNTk6VH44ad6IZFruNhBE90iTMkc+k+/lgqSuvhnbbSwLM4zEeJdou/Nz72/CznqET2XXDodhn+0qm18C4sX+r9cFW5IVrDxkIPjzuWhy1w94czYhfe1WNr/E9iW2m6HMqK/VO2pWh8SNgpnLgLWgtOqvSfhxQAaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XRtgeq4R; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XRtgeq4R"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c54f67db99so162760485a.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 01:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744272296; x=1744877096; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=meSSP8a70ro5KR6XsGtVh/XPLlTjZJaf5Hv6He5tEls=;
        b=XRtgeq4RKH4LV9kVH3sSEl0m3vMEKdt2NbToZyyJ3JpgxQEXtaqIVFA82M0ZZYX1zs
         M77fOwOk1pjIuqk3K/ZRViC2/j/Hb7eZb0nppfuL71yqkn+E+wCqpxH1dPjWWheRlYyg
         b95V7H/7LWkG6IoyCgcGx83+soWgdEuhed8gKN0P3FTCgMyanHMujREll+dAg/AfjbAY
         J1epYTQjFtrF3KFYTDNvWzTLNlcWu9NT+O6RP2FM2HZuqjkGGARnzkinWRDbWVPEtIq0
         BQE0RhOcU2MqYQOPdwRoipWvxm8ESudZH8zkNZyYdD7PVNFuobiifV7j2MTsZWVFEluY
         FX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744272296; x=1744877096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=meSSP8a70ro5KR6XsGtVh/XPLlTjZJaf5Hv6He5tEls=;
        b=LVTbu4l5Nd+VVxzN++bq5eIm3boXRCx/Uh2MamTrbhUrmNVU+UnPs15Jt3Jw7emtDo
         u/NY77MiHt7RDixbch6/WpUUcveaxMgh2pZNbx1O1rwdJlsnj91teT1FumUPB7ao7NFQ
         T1kWM2fgIO4u27VytljsS9Y97fjTKauJ4IYmPg4raQv9TvidRJnTQEMqL3GhL3j6+uNU
         2QiWckpUH2hHW9Li3o2OKiBUUSJbPovhaDj1am7JILs8CT8sBxgJClyfVTYtqBNiI2nF
         6LliUL4C5ySOX91jYHgarhRweS04eopk9yb6ifBxPdiDhpsS5cWXxMRcAvKqmo4htRg9
         mBvg==
X-Forwarded-Encrypted: i=1; AJvYcCX7mo5lUldwBeH4HVzAOyvya99g2Rbp0zkKMZWOfzNXZI8jI2apmfRjgj2bhiMF1zFRkDevcJGPNgVjhCw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4MeZKXNaqdUuLbExguO0fTRA8oEYuT2Zb89FJjCBwS1RD5nkJ
	8j/AUhVVfs7nkY1sVPAi2XPj04HlxNq6vK6MMCXLfYtUJseuzloBIrminBtwLvcG7FrW6yo4gNb
	R/bycc8SsI1thXlRn8NZmmAZ2PYo5HV8hsuoB
X-Gm-Gg: ASbGnctbd6WLm/uwjLD59Xfwor6Y7mbeBuoNPMos1YYBT6M4oLkPbndILo03Qkbdcac
	HjQgZgC/ns/O3coHuzMH4ZuRvxJ8OV85euE2h1HmgDuRXbrfwR0CUWlMt7n8WrcBLlUkIHjSTR9
	OSZ7H5s976xkCFixl3j70ywg==
X-Google-Smtp-Source: AGHT+IHnRoD7AjtOsJpc2K3JrlbTQWZaQjx3IprtXz+uXHZfGGRJtSOFutrwzuUQicc+jUPnlbCkJ5k6h2a3aQNQnsw=
X-Received: by 2002:a05:620a:4094:b0:7b6:cb3c:cb81 with SMTP id
 af79cd13be357-7c7a76b9749mr250640485a.18.1744272295691; Thu, 10 Apr 2025
 01:04:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410-fix_net-v2-1-d69e7c5739a4@quicinc.com> <20250410035328.23034-1-kuniyu@amazon.com>
In-Reply-To: <20250410035328.23034-1-kuniyu@amazon.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 10 Apr 2025 10:04:44 +0200
X-Gm-Features: ATxdqUGT0OfB2mWkqNiahR6P-89QRZDY9kNVpov5Ci1k3NZwNDvCbVoDxpoCgdU
Message-ID: <CANn89i+-V5G7XTDEd01gH_+efCDMGA4hdF7uRjYv6bsEqkoQOw@mail.gmail.com>
Subject: Re: [PATCH net-next v2] sock: Correct error checking condition for (assign|release)_proto_idx()
To: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: zijun_hu@icloud.com, dada1@cosmosbay.com, davem@davemloft.net, 
	horms@kernel.org, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, quic_zijuhu@quicinc.com, 
	willemb@google.com, xemul@openvz.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 10, 2025 at 5:53=E2=80=AFAM Kuniyuki Iwashima <kuniyu@amazon.co=
m> wrote:
>
> > [PATCH net-next v2] sock: Correct error checking condition for (assign|=
release)_proto_idx()
>
> Maybe net instead of net-next ?
>

I think this is a minor change, I would not add a Fixes: tag and risk
another CVE for such a case that is never reached.

We do not have 63 protocols, getting to 64 limit is moot.

As a matter of fact, release_proto_idx(struct proto *prot) should
never hit the condition.
