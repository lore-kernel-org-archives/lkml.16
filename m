Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0BE2DF3F3
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 11:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750161380; cv=none; b=WM7NQHGtVl9MKLNdDNMH6qZutVrHknDrre02cOsLjOsWwcHAfrmJNZ3ap3Xz8Jx+f2TMyICDKovOH5r/MTgmuHyOj102GB8nDlcLBEBs8XjkDfds1udGXTeQQdbuTyQyfaYtp4KUcAr3bVkQYZNHsYrI7HkIzh8s4lUI8COrCXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750161380; c=relaxed/simple;
	bh=hUrh0JsoieyUUpS5QdFU0961KMMCdTuTI4vVH6J5pgc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UTc2x+HQRP+GP7q9kPme0eM1zCcZ1Lgbo66WtjCj6XXUL3+GwewvSy9PCjsPZb8uO1jMB9Zo6nGMHpUQwkgJI1wcCAeo5fVNKc2RLfM+52FHbcd/pmTNhf/qGUgv5vuX0fxdzNhND04zbseUQ2WeNjyDbS9S7RJLozcSGl1q6ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UiQBjNrW; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UiQBjNrW"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4519dd6523dso6347775e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 04:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750161377; x=1750766177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZib2EAxYXc6vAmfwD8FP6fgSUgLC3pCF4+8SwyEQno=;
        b=UiQBjNrWPIkE5t/uGZxytEBmAZ+U6oALS88kbK2M8mBpQB8QR2TqhN99Apc9Tyr+w9
         61aBuhuI5W+L2GBbA9qBjxBiKe5/Oiw71n8JtWkIiYy0AApiC8OwIVUXT0IYexeSHlP9
         t4XJHyPwtY6Xrzm556dgR7riQySaRikL4940vpqJMqYoXN3Q0LqQp0jqu4WASLt4b90z
         l2Zh5fsWTNDB67+xro+9VtkO7j2RPOERAbHiI0pK6Sk7yzq7LBeEBqEXtiFk6hP3Vx6Q
         EEErj6OC3iR7FqajVK3WhrhxCx66KE7ppyNb61cOTz3tQRbTqiU8RwTjOrKkmTtJM1Jk
         qH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750161377; x=1750766177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AZib2EAxYXc6vAmfwD8FP6fgSUgLC3pCF4+8SwyEQno=;
        b=qjy3UjTFNaSL/iwU+1OQMORKTq2AGjZ1ZiJI0MlGjlh5T7lg0ry0xWcgMoYS0eb9BZ
         eUMpL0GViBj7XDiBUJGtZchCBJ5/EteZk3n+IegGHggrSBju7sUhpgRbJJvnicvkNaac
         sVA0P9sn2HuPI4DmmFDjQEoRqiqztneZ7aNLt1ybeePeA8ExGWugXjV3xFS7NJdfkwA6
         cpvZ07xVU1FuKETvZgOQcaltMTgWgTK7f9s58FHHCCYFKx29TSXqSTAZwnqJ2nOf3zR/
         CTdxx9ndTw4CkBkfOFN4lAuizOOnQ+cn1NdR/t+wYodWrR1xkDbz02gMlbmu+JpQQH2B
         x4+w==
X-Forwarded-Encrypted: i=1; AJvYcCU09cpHNlMdCbcSQCNeOwZvHqpVFtm7FJHIkqgD1Qn1hKFiGnhKfVdEGq21A1Tt3BzezgTHNzZEZi/GcHo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7rBhyB0lA8jZx6qSoATxz6fs0ExaZs37H/F/2/UeIVnSMgaKL
	pGVcZQSp5/sYWE52fQG7osQ22SEdbGNippZvvJxPGMTO95n8ypAwSSZdxxh0jU+oBvs=
X-Gm-Gg: ASbGncuXkRGwO5D5jXiisCJIAgjLFhtzNBe2IW4OFtjgyyv7nGRZKDNHWec7HYfBv6i
	GuDFvgx7V7AVPKsR/ak6S/xUV4dtz0pk2K2475+F2P7blUrpZKVyqpABVzzbra7kbMleBujDVx+
	LMzscfG8L1lgt0O47GEbrgdP/6V4txGf8MlM6m2g7nPnnDHbRiAwpeWSnnl7B21W4ki8LXywN5Q
	5T+QQMXSkFJ9zez5C+v2xHAVxJp88UXiYFVNd2IQjY1UMOM4A/UR9jQ7ETgBENfSKjh05Y3BDEG
	wUGyz3IeuwMqMEYQbhPPyOb34NyJ04AK+K/o8C72KPvcYIR+GdBbLN+oT9ImMd7zQOq72g7/zWf
	UjKGU7mGrmervOS5uK32lEChvK0MzjyEZDIVPNPSo7Y+Yil5DN4oPM5AEvujrIUXoPMU=
X-Google-Smtp-Source: AGHT+IGAOuw0cWNP/dm6FxfczRCqze8gyHxlT9VqrXK6Km1ShSiz79wkJohNkjxqZiCQ0Et/w4COzQ==
X-Received: by 2002:a05:600c:4f48:b0:439:9c0e:36e6 with SMTP id 5b1f17b1804b1-4533ca60745mr46258825e9.3.1750161376622;
        Tue, 17 Jun 2025 04:56:16 -0700 (PDT)
Received: from mordecai.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b087f8sm14021612f8f.53.2025.06.17.04.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 04:56:16 -0700 (PDT)
Date: Tue, 17 Jun 2025 13:56:12 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Neal Cardwell <ncardwell@google.com>, Kuniyuki
 Iwashima <kuniyu@google.com>, "open list:NETWORKING [TCP]"
 <netdev@vger.kernel.org>, David Ahern <dsahern@kernel.org>, Jakub Kicinski
 <kuba@kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net 2/2] tcp_metrics: use ssthresh value from dst if
 there is no metrics
Message-ID: <20250617135612.26aed53d@mordecai.tesarici.cz>
In-Reply-To: <54d712a2-31a7-4801-aa65-53746edda117@redhat.com>
References: <20250613102012.724405-1-ptesarik@suse.com>
	<20250613102012.724405-3-ptesarik@suse.com>
	<54d712a2-31a7-4801-aa65-53746edda117@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.50; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Jun 2025 12:48:30 +0200
Paolo Abeni <pabeni@redhat.com> wrote:

> On 6/13/25 12:20 PM, Petr Tesarik wrote:
> > @@ -537,6 +537,9 @@ void tcp_init_metrics(struct sock *sk)
> >  
> >  		inet_csk(sk)->icsk_rto = TCP_TIMEOUT_FALLBACK;
> >  	}
> > +
> > +	if (tp->snd_ssthresh > tp->snd_cwnd_clamp)
> > +		tp->snd_ssthresh = tp->snd_cwnd_clamp;  
> 
> I don't think we can do this unconditionally, as other parts of the TCP
> stack check explicitly for TCP_INFINITE_SSTHRESH.


Good catch! I noticed that the condition can never be true unless the
congestion window is explicitly clamped, but you're right that it is a
valid combination to lock the maximum cwnd but keep the initial TCP Slow
Start.

I'll fix that in v2.

Thank you,
Petr T
