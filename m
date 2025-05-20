Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5E32517B9
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747775389; cv=none; b=dx8cqi266TgCYCY0E8Z6HUSNf90ecBwaO4qS/SwITgPcZRnc47NGFb4WhmbghCQkJZlerIYoybzwdbZe/vaLoAAB/Tk7M/ZNsoZ0y2fY1lrhpYuV5WmrQDTD0c4ioeFsDLKbEoG0pAmpMCRmOCDgs1rb63hbqcxlmV/wNjDfUD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747775389; c=relaxed/simple;
	bh=+5SNG3Yvej6lGoDZ1n37aC4gcnvTVOUVfNd8IuytXYs=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=ZryOm/y5ILaxKP5mOXiSabSA9LdkSpVqigGbVhjtG66UaCM6k+GaQHvX2r+NU4nSfjiKq0hwPEOz0V5MPwK5gH+aOBcCwnpBGSoTaV2/wkBANfZcYEG9PbA9QDjNU/TSqtB5tzQ2YlAmKPzxzWxNHRb6TH7ZSHQiX+MSiJi+v3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=KwJYoC0Q; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="KwJYoC0Q"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-476ab588f32so88920071cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1747775386; x=1748380186; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LdHU9NAnIZSNyB1gPfdJ7lBAFUVsOw0YgwN3CBHTzFg=;
        b=KwJYoC0Qcj3mGkQ9jHRuvwuOavDRjpARYpIT0h5Sp//QrMeAbhGWz6omlKWdrcNNGu
         YhplWO8S6iw1JHFAtymWlkLEJz87DAE5r5q8K7OlhC9QH9J1kltkKvVsnQF85QI8i7Y8
         aqc6vCsAWDvYLFbb+vnjPmTvxcQ/LA9a5I1KLjXC10DvSYqFvshvr+cOVNc3g19Z1DqN
         XMrFfpbj+mumsgBgRNbbODQVe7zXRn7scRo9dPao4gL6eB4rezmbQ0qcKjmTX5UCJHWg
         Yd1h2m3NvO2iuRU7/d0O6QBCY8NrgzjqAr2haVe1/Vb7qGvF6hxgE4+d/Fyb1GAF9Bn2
         rVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747775386; x=1748380186;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LdHU9NAnIZSNyB1gPfdJ7lBAFUVsOw0YgwN3CBHTzFg=;
        b=n1bYRarOvcKCMQhSkgAyfwJMgeOzUuDtONNyy0L9R43HhEL3hfLIkkwEDttyllp74c
         KrpeS3yMysEYzSg9hp6DQC5aXBxskyz1tXsImYWcuQizEp3vYC7zUVUWGFiot7ZcTxCS
         OmsejGlBbxJ5ZSvHOiSfSSRqPYINpTRZ0Jh5Mcm9wVcE+FPgr4uiOJBMvUnu4jCeSAjK
         QzNLVJF7ued83Tap/bl0Z8ikSSAfTSWZfXz8r4QIL/IrXzVKV+7OYLyZpqP0X8ynDvbN
         uAmeuM3/PW3skEWdz+k02tsQu8flry9kDN7AosRqoiHJdnGif0r1QbHgf4riiqVJ2h06
         woGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWjO8MMPcQIET3gRrDV7osNC1XHVSR1BTP1KY0I/dYsHYGADhj3uAPGBERzzLDG2y51q1KyijE/Y4XzOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzVQAGuTKUhpa7etVfm1DH2NGU12Rh1g2YXvr5xBWA3iyYsayR
	LRohHpDWJLgbTpuJf1cVre9TDYCMioJfZCqWtV+MHANhkKm2aBW0IKAUPnfeZuJpIA==
X-Gm-Gg: ASbGncugcz7IZgvBU/XbUBuMsHT3WmcFrIgVtrWd+ywox3YUvP7JF7cHrQa89y/D3UC
	OrFHdNHoTRFhV1fOEt4U5Pyh8keCX6udQ94q6yw3+A+A53Fk7ExLB4wvWTYVCN4dhJgWEdhEXVL
	kY1SqDztvYwdetO5Pzpi+g0+4T1PdrQEixWkVlNi51GGOQePEIfokGQZaOLTHrCMkTeivNREHVa
	WjvrbWsicoW3RPt6zi8XdkfcDlq/kAGIEOPZgXdB6ff/0R/45KnqoayhdYpOPtH+2VRyNqfehuw
	L5r/LliHEvpfo7KjPh6FPG4XqCWZh7ttsuNmjD7KLfC+9s9x0WDOabRg348PZ8OZZ2rbrF8fXGi
	zIiAbf0k+/SsxQFweq2m1
X-Google-Smtp-Source: AGHT+IEPCw01sIbuF5SmngYqGtpHeiqojHH7hAJQaj8XDvszrqolVTvZ5tPwSh7SKcyuBpsl/vgcbQ==
X-Received: by 2002:a05:622a:1891:b0:49b:464a:3f6 with SMTP id d75a77b69052e-49b464a0469mr32816631cf.4.1747775386599;
        Tue, 20 May 2025 14:09:46 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-494ae40023asm75509301cf.32.2025.05.20.14.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 14:09:46 -0700 (PDT)
Date: Tue, 20 May 2025 17:09:45 -0400
Message-ID: <81d0fd707b7c7811411a9dc1caa42516@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20250520_1533/pstg-lib:20250520_1521/pstg-pwork:20250520_1533
From: Paul Moore <paul@paul-moore.com>
To: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de>
Cc: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, =?UTF-8?q?Thi=C3=A9baud=20Weksteen?= <tweek@google.com>, =?UTF-8?q?Bram=20Bonn=C3=A9?= <brambonne@google.com>, Casey Schaufler <casey@schaufler-ca.com>, GUO Zihua <guozihua@huawei.com>, Canfeng Guo <guocanfeng@uniontech.com>, selinux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 4/6] selinux: improve network lookup failure warnings
References: <20250318083422.21489-3-cgoettsche@seltendoof.de>
In-Reply-To: <20250318083422.21489-3-cgoettsche@seltendoof.de>

On Mar 18, 2025 =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de> wrote:
> 
> Rate limit the warnings and include additional available information.
> 
> Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
> ---
>  security/selinux/netif.c   | 8 ++++----
>  security/selinux/netnode.c | 4 ++--
>  security/selinux/netport.c | 4 ++--
>  3 files changed, 8 insertions(+), 8 deletions(-)

My apologies that it took so long to get back to this, comments below ...
 
> diff --git a/security/selinux/netnode.c b/security/selinux/netnode.c
> index 8bb456d80dd5..76cf531af110 100644
> --- a/security/selinux/netnode.c
> +++ b/security/selinux/netnode.c
> @@ -228,8 +228,8 @@ static int sel_netnode_sid_slow(const void *addr, u16 family, u32 *sid)
>  
>  	spin_unlock_bh(&sel_netnode_lock);
>  	if (unlikely(ret))
> -		pr_warn("SELinux: failure in %s(), unable to determine network node label\n",
> -			__func__);
> +		pr_warn_ratelimited("SELinux: failure in %s(), unable to determine network node label (%d):  %d\n",
> +				    __func__, family, ret);

Let's leave the message as it is currently written.  I don't believe the
address family is going to be very helpful, and @ret will likely always
be -EINVAL in the error case.

If you wanted to add something to the error message, you could consider
displaying the offending IP address, so long as we can use the pI4/pI6
printk format specifiers to do it; I don't want to have to have a lot of
code in the error path simply to properly format IP addresses.

>  	return ret;
>  }
>  
> diff --git a/security/selinux/netport.c b/security/selinux/netport.c
> index 7d2207384d40..dadf14984fb4 100644
> --- a/security/selinux/netport.c
> +++ b/security/selinux/netport.c
> @@ -162,8 +162,8 @@ static int sel_netport_sid_slow(u8 protocol, u16 pnum, u32 *sid)
>  out:
>  	spin_unlock_bh(&sel_netport_lock);
>  	if (unlikely(ret))
> -		pr_warn("SELinux: failure in %s(), unable to determine network port label\n",
> -			__func__);
> +		pr_warn_ratelimited("SELinux: failure in %s(), unable to determine network port label (%d:%d):  %d\n",
> +				    __func__, protocol, pnum, ret);

Let's drop @ret from here too as really the only thing an admin can do is
ensure the policy has a definition for the port, the reason for the
lookup failure likely isn't very helpful (and looks to be mostly
transient, e.g. ENOMEM and similar).

--
paul-moore.com
