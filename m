Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746D51F61C
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 01:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739150976; cv=none; b=ZyCZvxajac1yZO+oXoeNK8JlfaJreOSLp9GaXXWvkHuYOVDwGso9HwqdYXv1WCt+bJg8qKquq3dZxE+ybfDttRbU1fNqVuaJibcB2sf5ntdQVtulDwWW7MjSP232SRnyh5p5Z+GvFJf7+YhAUpuRuPhBH2BCl+QHzDF192UwylA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739150976; c=relaxed/simple;
	bh=07o3I4HbYlJica2FANHzS2eFyyfsfbFG9rhm1kC1orc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=knDawa3uy8+lCtSmQRZ5wMxRrHXBVWYOzinX5E8mm56FTOGf7G7Q6X99A7eC7Pnz41ll4EnHcPBvW8ddOtHDD8zRBfuVgTH4cwes4c9bOpsuCC6L7NPeRCM99FIcmdIDRAEZT5V9ia9oeD6DgWYpthzl0ql0husE/2DA1J1dbRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io; spf=pass smtp.mailfrom=layalina.io; dkim=pass (2048-bit key) header.d=layalina-io.20230601.gappssmtp.com header.i=@layalina-io.20230601.gappssmtp.com header.b=1V/Fr5r1; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=layalina-io.20230601.gappssmtp.com header.i=@layalina-io.20230601.gappssmtp.com header.b="1V/Fr5r1"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38dc5764fc0so2626670f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 17:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20230601.gappssmtp.com; s=20230601; t=1739150973; x=1739755773; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=07o3I4HbYlJica2FANHzS2eFyyfsfbFG9rhm1kC1orc=;
        b=1V/Fr5r14jSE7yWvVlRdfWQZzJYtp2OffCLt3K2b2UiaoyOWYAyvEaVNqYIdJQetoB
         7E3DvgomyW3tYwtJIQ8lkksKn++7PeXahrsDaXUL9ozQ4FDYdwi0k2N7oMngPJISqlW/
         6OBMj+9MEm2LYQfyft6fJ/o4u37+KNXq4Ch8zKj+m2KvX08JclF8ywwOd9YgdWqbgiKs
         cmYNbJ20lofdX3vb3Ba1PovmpmOlrPQDSxpI0We3C0UvJqwY/lL/KPXWFdfbXo/ovKOu
         X4FMnYz7MtrFwl8fdRc+3/hhSR/roZboMxJIEzQsVBtWh1gsUN3p10/b16BApogOm5l5
         +fig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739150973; x=1739755773;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07o3I4HbYlJica2FANHzS2eFyyfsfbFG9rhm1kC1orc=;
        b=W3X4kwDiIjSGW/purl36zn5nc4AjpayXj8iWUvGBm25NFgdVc4ttf4M+Olqp63nohM
         /wqIIwAEyHfUSu/ySUDPD5J2b9QHLEhLM6iMd75YLt8wbLBELtRaTgEzWeYBbgmZFGpx
         Gefqwfi+kOP/weBJ4VkRcfRAHmwotswmq2+PjYViwmY+rmbh94GPLKd0q9kBT+FGsrtL
         CnKsXOCiuIskNA3NNkD9d+BLJVazHO3FXtrzJaxvk+MpjXMGX7QeCn2GPsx9kff1EJFZ
         MlXBpqXtJuoXX7iGwM4WKapV50tH/FO+shLbAJgc+Ypl9QlOaBLozg2JGKVRVNZNM+cN
         8DnA==
X-Forwarded-Encrypted: i=1; AJvYcCUBlmqNUf+l79kzG+1cNjB2SicSqwPdy1Le0ChPScbbNOQba6vpks5HC8T/3g1PCwIZg93jqylbwt0shh4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa/AgvRObXYUnzzCXs9ItpBkctyLjLFhpKeg8FsqolcQCjrr37
	8u6Vrnw5FYSF3nyAMhdPdKrDWUIudEQbTpmbZ3yX48h0OhsJ7oNF9djiDyJSI5M=
X-Gm-Gg: ASbGnctwQtG+qRhDGZGTOhFxWAOev1u0p0PxJjr7L9KwhcvlQXa8Ti0m24cQetuMNlE
	DcWRMs2mjOYkddEa36SWzQP3ec+iRvPlIhqG67x7alT5nSSgJ8M2BSuw22+4cCgaXwPk9QNuUV8
	0GmsvnFZlVteb7Eeou9w0SYZDqHbXT8JwqNwmyOKcWzjE+oLDEaMz6H5ZOISEeDuK+07k0K5iqp
	A2tQACgDyUyeUmQBscEHlyGnGoYllOMUD90UhOcDP2fWv1Eb1VOzIuKXxvhXSgtmds6q2g53pSK
	0y5uYHFm2ZJQDGQDT0FLQVpteEH276C5+jh4oD225ebgf0mEFyGuNEWvbvSkV91/iDqY
X-Google-Smtp-Source: AGHT+IFYUIyDwevBfJtWM7u0O8PeQ8NTrReFXYV+cCtuH80ZcC06C1A2DIhIt3PXfhDjajrlX8JlkA==
X-Received: by 2002:a5d:6d0d:0:b0:385:fa3d:1988 with SMTP id ffacd0b85a97d-38dc8da6410mr8135110f8f.8.1739150972484;
        Sun, 09 Feb 2025 17:29:32 -0800 (PST)
Received: from airbuntu (host109-154-33-115.range109-154.btcentralplus.com. [109.154.33.115])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc17e278bsm10048041f8f.48.2025.02.09.17.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 17:29:32 -0800 (PST)
Date: Mon, 10 Feb 2025 01:29:31 +0000
From: Qais Yousef <qyousef@layalina.io>
To: zihan zhou <15645113830zzh@gmail.com>
Cc: bsegall@google.com, dietmar.eggemann@arm.com, juri.lelli@redhat.com,
	linux-kernel@vger.kernel.org, mgorman@suse.de, mingo@redhat.com,
	peterz@infradead.org, rostedt@goodmis.org,
	vincent.guittot@linaro.org, vschneid@redhat.com
Subject: Re: [PATCH V3 1/2] sched: Reduce the default slice to avoid tasks
 getting an extra tick
Message-ID: <20250210012931.ym337oexdcjmwwzv@airbuntu>
References: <20250208074821.11832-1-15645113830zzh@gmail.com>
 <20250208075322.13139-1-15645113830zzh@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250208075322.13139-1-15645113830zzh@gmail.com>

On 02/08/25 15:53, zihan zhou wrote:
> The old default value for slice is 0.75 msec * (1 + ilog(ncpus)) which
> means that we have a default slice of
> 0.75 for 1 cpu
> 1.50 up to 3 cpus
> 2.25 up to 7 cpus
> 3.00 for 8 cpus and above.

I brought the topic up of these magic values with Peter and Vincent in LPC as
I think this logic is confusing. I have nothing against your patch, but if the
maintainers agree I am in favour of removing it completely in favour of setting
it to a single value that is the same across all systems.

I do think 1ms makes more sense as a default value given how modern workloads
need faster responsiveness across the board. But keeping it 3ms to avoid much
disturbance would be fine. We could also make it equal to TICK_MSEC (this
define doesn't exist) if it is higher than 3ms.

Do you use HZ=100 by the way? If yes, are you able to share the reasons? This
configuration is too aggressive and bad for latencies and I doubt this tweak of
the formula will make things better to them anyway.
