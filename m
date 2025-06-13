Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6961D38DD1
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 19:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749843248; cv=none; b=q97vHXayoQeFNvVHwl9UqtsBcGPJ0i4hMtyWEzgypE+fa/B2e7ffLqsAupqMKgT0xny9llaUkC5dhmhNx/gBmumHUWhn9C1s/F8gUln5bCFHUeb/yE47YQJwSM4rBGDg8U3NYiQimf5QG+O5C0nK3K4/qWb7+nz97a2vP6UP87M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749843248; c=relaxed/simple;
	bh=rxt1KAMBjnjH8MC61jTFb7he7d0jDsu3+CsWMc/uBHE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b1H7yZ3F3xx0GDjzPLm5AKZhr4DVqU5HyRK8U9S6psYyyM9kHR0QJTE4imhkLIPd+ApVlFrdNVDkgq90boC/ZDig0lRjwE8nbkxHSvJzNYleljXJOWsU4/mwPurWLuUnJP+0YYGuWiINUQCw5G/jMHA++t3kYfwCH9P6CSo+F5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KoNcheS+; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KoNcheS+"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ade5b8aab41so516730066b.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 12:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749843244; x=1750448044; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QPLXuGSUiU2rTIntPNF3amOqIrT1L3d19zPW2yvFIFA=;
        b=KoNcheS+phP0wQHaEy0eiLqY7gIyCur8j3VNsKKeS0ChDb+FAIJRf73q/uGj2RcEIF
         wjX2OVnIWbFl1k4vLWV1gxywV0mpTzY6/n8uRe/hFkIMajjHcWNQIXf50l72BOeGgNE1
         OR8jmoEO5J1QQMNM2O8LxE53HIDe9qFx4+8LI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749843244; x=1750448044;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QPLXuGSUiU2rTIntPNF3amOqIrT1L3d19zPW2yvFIFA=;
        b=aK6JBZoHNLPl8UBQNNNsubvmSPJ+TIiF00STzlq0QGJx+Lwv75wBr2Jixic9GyNnbC
         LtQs1mNzBUGiKS5nuxnkvUhKR8AxuXxT6jwZiYZ+KcIZN/0ilS4YOgrQGBGx5cBqkFAc
         2FfjOhE9gpxICsDdFDWnK1BaGgSPGRzKrlb59saf5zveIc1PbDrEVF4cMt6isJ2aiWnF
         d7QfpL5/0bWXNZvJuB8Q9gHNND8DBF+o2zlyWRRETUTNQs+jevsKgIjNURSWXDTXeFDD
         FFEC9J60L3H3YuoADTYKZsMYEvbi5d0HUCzPt+X2XNfsMuFxnpc9tgeJog4jCz1WXXJn
         LBfg==
X-Forwarded-Encrypted: i=1; AJvYcCUBmeJVmxacDJynN1LkxSOu79sve8NQxugblHhQ4wlimgs1NAP2YLbNMmnjkFXyQ+rWmU2baJRtxzYl8sE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSuP9Zpyq+s+M39Rk9J0O9pHPb2iqF/EUjPZiPaG4l7IFfS7gu
	hUKTvOaRCvQixq/6jmilkhRYpODCpNQDb32sSGct3uGXuPJKPS+Y0ac6YLbXrqvSlqw/pPbQILM
	IYcIovW6vgQ==
X-Gm-Gg: ASbGnctOgQ3Zl16j4Fc8CtnVCznFwKFi+he09khz31q7n5MxZ7m0p4Yg9w70/78n/V+
	Ynwkev+2FvAeQE2lIicwStGirXeB4GVXWKZULfLcsG6tmkmuVCdgrgB0uIu0rpfpJ2G49iapOR2
	V2z6e9IsgkS481ZC+iLjoSpnwrPVSY2wZIYZxX+L5bS3N65grzjcsWSMvpx1fyqVdnqzlkupGtI
	Z3aAloJrT9eGJj24IZKjmimLfMhcS+kpbHJUKvKwF8LNXQs8R1w8RTzp4LUUIAC6el3me3tnem5
	bIlNG4oQ30S8h1m50FvApe8v0E3wnybew3qEu4jrpbg34E92lY+JYR2Cgj82Gipg7oA0a4HNMsQ
	KPcbcP3DEzl6dWVWxrO93jDQS17Nr7YQ2LNQ=
X-Google-Smtp-Source: AGHT+IFsQC5RoIBqm+qyolDH9/Cr5krlE5wUsseJn0eWaHjPZIW2VbYXPcL6KzaNw/zj2cgaTWrulQ==
X-Received: by 2002:a17:907:72d6:b0:ad5:557b:c369 with SMTP id a640c23a62f3a-adfad40c3camr41275766b.33.1749843244496;
        Fri, 13 Jun 2025 12:34:04 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec88fed63sm172357166b.80.2025.06.13.12.34.03
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 12:34:03 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-606ddbda275so4914944a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 12:34:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW2JCaJNiD6jdrr2f+S7bTeCH6U8burcs58+ZbU4MC9Z3bNB8qOuI9ETFGe8r7l/d5iq5bla1ZuGhWKp6k=@vger.kernel.org
X-Received: by 2002:a05:6402:234a:b0:602:28d9:d555 with SMTP id
 4fb4d7f45d1cf-608d099fd53mr428814a12.32.1749843243479; Fri, 13 Jun 2025
 12:34:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGCho0V0x_Y2+vg5G8-r45Xc6uftLbZK5K1=vpavd_4783fogQ@mail.gmail.com>
 <20250613172650.GA26022@redhat.com> <87msabphoo.ffs@tglx>
In-Reply-To: <87msabphoo.ffs@tglx>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Fri, 13 Jun 2025 12:33:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=whF=ePFQM-kmbQQoycR9ENjou36AJMwUGnXVMVhLkc00g@mail.gmail.com>
X-Gm-Features: AX0GCFup58zgutSUYxOqX7W79hqIpfGts7A7o3got_kTR8jiRsr6DwTRlNWyRJM
Message-ID: <CAHk-=whF=ePFQM-kmbQQoycR9ENjou36AJMwUGnXVMVhLkc00g@mail.gmail.com>
Subject: Re: [PATCH] posix-cpu-timers: fix race between handle_posix_cpu_timers()
 and posix_cpu_timer_del()
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Oleg Nesterov <oleg@redhat.com>, =?UTF-8?Q?Beno=C3=AEt_Sevens?= <bsevens@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Zander Work <zdw@google.com>, security@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Jun 2025 at 12:25, Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Linus, I assume you take it directly or do you want me to play the
> intermediary?

I already took it just because it was easy and I was following this
discussion anyway.

            Linus
