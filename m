Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5B728C2D1
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 11:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750158066; cv=none; b=gqqhZwHZmxvnykszmUkwpIJOpUDqc4O7UrfdRl1MIt+ASctkQaYr6sT8qKo1QLVdUxy4YaArv34B4SF8BDmdZnAiWJZQDKJgDcKWElVuWA9LkboYUoM3cZrSF/TViAjSZQn05F5kw0la3YN9steIyzv/6y7BMltWGMePfYrNjA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750158066; c=relaxed/simple;
	bh=Jy4lsrusakvX9u6DHHyu1tpppoeRSJrKpQOBCTREiTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e4uFJaBgT7nfgiAsytGsNnKthwJmvBmTpDAJ+tVpQ5NQ4aNeUD6Frc81pgJWZB+L9w1DYlOVtd966XjaOT95r/iccTzYA0JW2yLHy5TZgYw1BeRdtS7foULL+bc4xzK+/wbUCvTK9WaDrGGmbvJGT15ve3Pv4sNXUYVeXanDjuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iO39BHbf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iO39BHbf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750158063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rPzSBRIX8lNbzruQuHcxrBhpa2JtXIadSLv81sT6P6c=;
	b=iO39BHbfCPo0S0nb+VqXNP5ZXDGV/7KCBH9XktSXLN0o70ULkmXFFyYEvnskiTya+DOdHz
	fB8OXrmXsrufHPTVpDiii/15xNGa3WItadA1gB0xb5mtYaWLQpLhZDHub9UL7iT9HEC5Tw
	/4a1/vS2IWJeQh+4oqt5Hnq6WGp16h8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-KPsvAo6bNleaT4uwMuxypA-1; Tue, 17 Jun 2025 07:00:59 -0400
X-MC-Unique: KPsvAo6bNleaT4uwMuxypA-1
X-Mimecast-MFC-AGG-ID: KPsvAo6bNleaT4uwMuxypA_1750158058
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a37a0d1005so3357190f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 04:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750158058; x=1750762858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rPzSBRIX8lNbzruQuHcxrBhpa2JtXIadSLv81sT6P6c=;
        b=oJXD7OWEtb1CbCIbfSqM6OqZsEYZWM0Sly5IurO/mjJoZxYeUNQeE7E+L38LzxjU3c
         VJmi2+WZxYNQ0X2DrB0+QzkyJP1EC4AMG9pkGYmYRyTXcSgUTpTryE6jlf4DlfE+IBW9
         r3RSv0cQrvs1Ux7rUt2X6uaQMmhP/FQUK+PSsu69CBay2HjeVyaiQlouboSzPahJhUg/
         UlQYsGTeNcEeCVgYZPoFaTBeJOv/7Av/NCtmCh/saAy1yObE+xmfbbT9YFqt+rpmItUk
         PlLSjzhXTN1IfODiT3GR6cSLS0AKCkqGLjgJy4CvXEllcGXP0o8U13+K+JwovEQw5JW7
         FqOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV0+bPqtbtb09ClW5iqSrmGwjDZlLa/tasOy6W/xT46l0ymZJqkL0f74clO7SlnNxfGKUxb3QqTWXRGUk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuW7Hoiim2U+GL0c7J/zghXWdEvpGtLtOW5cl6kwaSkhVQsXV/
	dH3FIRoG3jtgwaEOfFVNHCUA9zDTWYgc5hPeG2JRsp4MFqhUXKvx72L2AqslXgf2RlhmgweyE0s
	KRpNb1DGGRKnLoOIotr9yfV1gsRT85kswCy0wAygTtfxTePUQVdm7gRbSmHdeGp8r0w==
X-Gm-Gg: ASbGncucQCfqFyWEHD985GxA/996JcALpqNLhwGQxurX0EiKgUUDH5I9BB9n6VwuwU8
	TnSjJ8Tfn28+gTpU4PLYltMm8aMpYR0LU30W6Qirva5TbIBqjc7QEmHVI2sIlJd7dgsTEtOcQk2
	kM45qpP2W36ZBap9de6g/SqUYTdP/7fG+lTjS/ehFI4T0x9VZtny99TkNjN2zVJmoPRfWgZFj0s
	j2dc6CKtoQlPgBDrm9dCBF8jmctu3nD1xO9k7dPMQNY4wOcCYpepmO9a0jwclgKhuSdoDKbm55y
	K6Bokj8VQOGdkvmgQleaDi5i/IgFWPconvONAGJRMWghQuiImZwIOpKmzdCfprcvCzPBNA==
X-Received: by 2002:a5d:64ca:0:b0:3a5:34ea:851e with SMTP id ffacd0b85a97d-3a5723a15ccmr11339903f8f.25.1750158058255;
        Tue, 17 Jun 2025 04:00:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCaVw5kHOpYYCnYDEK29xi4S4qdkGakFHB4vHzCbXbbNO46yHFb/HC43oPZrbhbnAnFGzcRw==
X-Received: by 2002:a5d:64ca:0:b0:3a5:34ea:851e with SMTP id ffacd0b85a97d-3a5723a15ccmr11339824f8f.25.1750158057393;
        Tue, 17 Jun 2025 04:00:57 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2448:cb10:3ac6:72af:52e3:719a? ([2a0d:3344:2448:cb10:3ac6:72af:52e3:719a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b087a9sm13905989f8f.55.2025.06.17.04.00.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 04:00:56 -0700 (PDT)
Message-ID: <da990565-b8ec-4d34-9739-cf13a2a7d2b3@redhat.com>
Date: Tue, 17 Jun 2025 13:00:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 1/2] tcp_metrics: set maximum cwnd from the dst entry
To: Petr Tesarik <ptesarik@suse.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>,
 "open list:NETWORKING [TCP]" <netdev@vger.kernel.org>
Cc: David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20250613102012.724405-1-ptesarik@suse.com>
 <20250613102012.724405-2-ptesarik@suse.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250613102012.724405-2-ptesarik@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/13/25 12:20 PM, Petr Tesarik wrote:
> diff --git a/net/ipv4/tcp_metrics.c b/net/ipv4/tcp_metrics.c
> index 4251670e328c8..dd8f3457bd72e 100644
> --- a/net/ipv4/tcp_metrics.c
> +++ b/net/ipv4/tcp_metrics.c
> @@ -477,6 +477,9 @@ void tcp_init_metrics(struct sock *sk)
>  	if (!dst)
>  		goto reset;
>  
> +	if (dst_metric_locked(dst, RTAX_CWND))
> +		tp->snd_cwnd_clamp = dst_metric(dst, RTAX_CWND);
> +
>  	rcu_read_lock();
>  	tm = tcp_get_metrics(sk, dst, false);
>  	if (!tm) {
> @@ -484,9 +487,6 @@ void tcp_init_metrics(struct sock *sk)
>  		goto reset;
>  	}
>  
> -	if (tcp_metric_locked(tm, TCP_METRIC_CWND))
> -		tp->snd_cwnd_clamp = tcp_metric_get(tm, TCP_METRIC_CWND);
> -
>  	val = READ_ONCE(net->ipv4.sysctl_tcp_no_ssthresh_metrics_save) ?
>  	      0 : tcp_metric_get(tm, TCP_METRIC_SSTHRESH);
>  	if (val) {

It's unclear to me why you drop the tcp_metric_get() here. It looks like
the above will cause a functional regression, with unlocked cached
metrics no longer taking effects?

/P

