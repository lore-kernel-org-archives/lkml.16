Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294FC30574E
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 02:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746498580; cv=none; b=bMjH/6jDSAchVzL0CvS0FQeriRH9SQaE1oEhTWebHsISpi6Dx2fZqBFNob+nnSVNyKq/MnLO5Q2LIF/fSYlH9gP0g/bG3fon7QDD/V6YOe4woK41U11E/P9NKR7Qeo8Wy97zEia6hsioLagVIeGmnKw6DIuGCJvHLIlmP3yyEtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746498580; c=relaxed/simple;
	bh=PsnQASBAnD7+WYr+/pn0BHaFARb70S31g7EPNqlgdMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ERFoFh1WpNoRd8NaQNLoAO+sLHJrKQUbP1U8RQCb01NGXouh4tE/8gEWWLdSqX/vEvZJssMamk6s38hdywjG3rDrrwuWqtCGee+WEaADzvKSymMN/ShqcDcKg8vL8k/Ilfp7xUi+Wdc6tbK/VFWZWuYKbqIYlvGPtW4f7eqaTpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XqH1zksp; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XqH1zksp"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-22438c356c8so49817775ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 19:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746498577; x=1747103377; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WTS19iX60vkQyuATtUyaY3DQwn/cOZ8fHQvq9hje1YY=;
        b=XqH1zkspEAz9I1NMauuiOEshBtKtCQyAN2VElhBTFybYEZQZSMmc9V3uReoPIUG/RK
         P6TexyRWDcHAd2wKGvpf83SYLU+0RyarwZr3R8fe6PleIfmgtKHVjLUHGPjAPfsQUtUp
         uFCXIREmK3H9tSZcygHzrmdSxcXzEnGNPtAkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746498577; x=1747103377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTS19iX60vkQyuATtUyaY3DQwn/cOZ8fHQvq9hje1YY=;
        b=nNchQ7PxqnefGeSHgi1In9NIBMkYTXxHil7/0a+SGaypCoqwxN5+tid5HDhcg14PdX
         JJMVMZUS2Qu0SIqrmbB2ex0f/4wJmhpuomU/i7uYNO72CoQFSS9XgzxAlgRxssSJCPsv
         SJF0ztO3zpNhm3fjdgl7qSnxXuma+wlQNfwxTu+KpWLe4iyGaNE5YIoKOCulo+GMefna
         tQJlatI+s4eVz47apMcbgtAfgsHiL1LFx7J5HIA7sUKQuMFQK6u7nYlSnXQ3N4p2rQNr
         QnGPCDQSxhNzHRf1kifdM0n/9Rtuj7YpDHrBU/PL9XHIa5IuJeTcXuPDSgyiRDCu9EHI
         JFFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeIHV10Gft8cpLtR19QIABgICifAlR+26FyHW2rif5zOsdAINov804zbq6s/+mZL9Usb5Ot8sskfSlcJk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5AKMZIG8OgKN6wkNZMhRo/c8P0KWI5i6YFPZKWvZGzZYBhlbQ
	iseDBlnMz6JGdiXRg0qmRFRcxUmgbI6JfIuITz4C7jPgXqu3g+Eh8GGU/SyY8w==
X-Gm-Gg: ASbGnctGrgATD5oCr4ndmwQ+xgnRUwTW643f5FxD9Pth2lrZYXasSIs3tYIVdFlTSq/
	5acou1UEOTzl4KnIUclPF2F7vlE36DscQFmHUm+xHcAyg1+7tZTjHUIWCzMkFsUY2abnm4YRL/G
	fwTh1jzqgLgl6LisQB4n+Ui7wm0XTMVDUCEGkeqtyxToOzMq2fR92lE6kU7AjGaPRLrfbngYr4B
	VcFeTOJhIL0A8U2fmBOIuWVQccpj86D0K6qZxdn+fG3b1Xekc7Dzr7EXc5swXY8j/9IHDVqd47J
	kxmRcxE+lcNnTwcZ4kKxbQgwjdvmsHEVhat0gocfDDsx
X-Google-Smtp-Source: AGHT+IHwF3eCuzC4949H469KnTADrIIoIwm5PQiSNQSIhwK/ekUJv67Hft+qCKTnlcKaEFbr6/FzeQ==
X-Received: by 2002:a17:903:d5:b0:22e:4203:9f33 with SMTP id d9443c01a7336-22e42041dd8mr4891825ad.33.1746498577504;
        Mon, 05 May 2025 19:29:37 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:4dd5:88f9:86cd:18ef])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15229137sm62596985ad.203.2025.05.05.19.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 19:29:37 -0700 (PDT)
Date: Tue, 6 May 2025 11:29:32 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bpf: add bpf_msleep_interruptible()
Message-ID: <nvaiideqcaqjvhdshhrcazg6g7horprlwa5f3fkk3x33f24wdq@zvqe4p6s3bpb>
References: <20250505063918.3320164-1-senozhatsky@chromium.org>
 <CAEf4BzZkVg39JqGeuAjypf=WXsOG8JVDS8SSkVLDjHUuHzxoow@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEf4BzZkVg39JqGeuAjypf=WXsOG8JVDS8SSkVLDjHUuHzxoow@mail.gmail.com>

On (25/05/05 12:55), Andrii Nakryiko wrote:
[..]
> I understand the appeal, don't get me wrong, but we have no way to
> enforce "is expected to be used for testing only". It's also all too
> easy to sleep for a really long time, and there isn't really any
> reasonable limit that would mitigate this, IMO.

Sure, I understand your concerns.

> If I had to do this for my own testing/fuzzing needs, I'd probably try
> to go with a custom kfunc provided by my small and trivial kernel
> module (modules can extend BPF with custom kfuncs). And see if it's
> useful.

A downstream kernel module?  I guess I can give it a try.

> One other alternative to enforce the "for testing only" aspect might
> be a custom kernel config, that would be expected to not make it into
> production. Though I'd start with the kernel module approach first,
> probably.

Something like `Depends on: DEBUG_KERNEL` maybe?
