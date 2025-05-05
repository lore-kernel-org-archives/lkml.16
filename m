Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B743155C83
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 13:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746450923; cv=none; b=fBKMnx5lKCbLxKzrZC7qS3bGRYs8i+xebGd5992kmp/VFDE9WhwleNlGW9aqdnZ2uhB1SoLyXJpdJQ/OpgKuYPoqvEUO8PZTQZJQubW+AI9LLB63BxJRrX9buMPE/Vt8ht7EHjEPF9MvPy55wKz1+e9B4Z3HhMBZcf3ZJNe6Fjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746450923; c=relaxed/simple;
	bh=lQrkN+4oEXoabNebRbEs2m8OZGZ5XRso7DP90cD3zRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bPcUSWmAyMymDMxOYRBm1bcyIPxxhL+QONQl4CN4InR9/tmXwFdYC3BzlZOGtYw1yW5kFukxXwlTNg+/ToJfqdaALdi09aup6d0VU6kMw29XBwc8kekamXMXyPB6bxdZvCV2e/C9pcRWJnTzMCzqPeDEFmc+5ggNyJo8Bb8RsMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=eaAdMAuk; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="eaAdMAuk"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3d7f111e9e1so50601695ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 06:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1746450919; x=1747055719; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JC2mo3/LlPLofco9In8VXGkCzE2KGJMSgE1KU9GTJew=;
        b=eaAdMAukShiqAA5d5+7pxX60uM515QJVM72l/9XEmvUyYs2yE/ARsc/y5d6ddmPF/k
         +oKJIOyFKsu5Km3uJyNybDmTj4HSOiCG18OgHlIIqdgBnw9lg5iMbpFV3adHpQjWoV3f
         hsZ50xtDu6M20dUV8J+uZbQjK7mNwGOpc8AgcssUi4BwIFGpJfPbhMGW/YzLEHsCPD5X
         yR7pWnDZliWKbXKi0l/Sxa9Rph2O9FSdbePRIW9aoFRUPclrQq+aOnl4J9eAvBgPfW7m
         Zhy5cJTGunlVIr3OxEGEs4zPdVEKzt/8hhpk8Pzs/gy2kiD/TmhRostWVTAuUuFIrMpr
         0Ufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746450919; x=1747055719;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JC2mo3/LlPLofco9In8VXGkCzE2KGJMSgE1KU9GTJew=;
        b=LECJCq3wcbAj2JsjoAMRrl6+xVDJcso89lGei4y9OfngsB6pikb28VSFtvRM0tL5KO
         8E2enacEFEQSBtQFMUYGSawDcATsmYG6+fMZ5R+e6TWZ3Pp+YAy5UW/TUGPoL4LNeb2R
         5hMTuO/XPzVy9ddqL/gvnEJ7DJlHf7dIerqTGD0LhnFqeBw+URXim6Gyol4ft0cHO/PF
         rdqxgkUao/kGgBJ84rLJ2vg6W6pTzjXubArw0qvHegMsWiiIBhbKzgovI1cE46gZoAF3
         tG+HYu/9I7oacDW6ixmpZRdQVfggIDUBMl7OBIUj1vLJ3CHElQv2BLNEk3ImaTTprW14
         lJKg==
X-Forwarded-Encrypted: i=1; AJvYcCV3f/iOXaqzZ/dzBEtI6ZSnKzR4f3ZeM18fdOUHanhIxilJKfffZnqOpgtaP8xKdN7GnfXsfWMFtUo2mnc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDLpdBktJA6lqgH8zrXh2080I+evB9xESnto//evxmPCX7HDFH
	e46rMRPnnjfG5jCSbta+Rn+Y7VTGR2anBvMOar8F8g6D7pLvq+CLPByRlOQ+5t8=
X-Gm-Gg: ASbGncsTygI98EjMZD+zLWPcOsDFFKaSRaLaRgPMDzqwfYKbc+v95J0YL2wmIuGm7GC
	/LtBYotD+c0XK01SfeSvQHC2IrOS+A8IspToqgZcc9Oxovry9MIDYutGIWP25XWDRKYgPzahWDY
	1VKRnyTMpiDJc8I4KqzHTSqyVorh4A+IyVz8sRtKmyly77YyYOVVMCrZmmqPi+tF436GPBhn/Wg
	yekBnlSGCqyOySkQlF42krQ7k7aN5KgpraKRqbFybI6TL2K/nInKHs2JBf4c0+QUwQ3OnTZkq5X
	tSAnZtzDj775c9Z5wFRLOS+vxhJucqeOmvejhg==
X-Google-Smtp-Source: AGHT+IFK4worD8fkVatd6ju3w0j+bUR8Z8yoarIsuUbwXVcwuUJnPu+7pcRFlTT3Bz4wpsAhzX8SLQ==
X-Received: by 2002:a05:6e02:2510:b0:3d9:6cd9:5079 with SMTP id e9e14a558f8ab-3da5b31d935mr65744215ab.14.1746450919401;
        Mon, 05 May 2025 06:15:19 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d975f58be3sm20308835ab.58.2025.05.05.06.15.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 06:15:18 -0700 (PDT)
Message-ID: <daba7244-ab22-460d-9b7f-7453b5c4670f@kernel.dk>
Date: Mon, 5 May 2025 07:15:18 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the block tree with Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Caleb Sander Mateos <csander@purestorage.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Ming Lei <ming.lei@redhat.com>
References: <20250505132520.0a33799d@canb.auug.org.au>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20250505132520.0a33799d@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/4/25 9:25 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the block tree got a conflict in:
> 
>   drivers/block/ublk_drv.c
> 
> between commit:
> 
>   69edf98be844 ("ublk: decouple zero copy from user copy")
> 
> from Linus' tree and commit:
> 
>   2a86eec6396f ("ublk: take const ubq pointer in ublk_get_iod()")
> 
> from the block tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks looks good, I've merged the 6.15 block changes into
for-6.16/block to resolve this locally. Current block for-next branch
should merge cleanly.

-- 
Jens Axboe
