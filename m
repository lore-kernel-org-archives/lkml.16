Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D144A0A
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748345953; cv=none; b=RY3EEFwoHOyrpzI6GjXcbcVQtRBoE6k9QhDvwXxpR0W1LR1DjvJboYzJx9kQZDe5GPNyNi4PxaU4HB6AdIQtCjyt0r/sluHvRaKqz0/tvJFDx5ksaaZRFln1ixJDtgTH9E1RytLDDP72/Gaf9RwRI/PqhSGX4MJMqq2dPFWGHsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748345953; c=relaxed/simple;
	bh=9+2YBfiiiMqleewiO3f4IwLqSyA9jGkwlr2UI25u4MQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dXtmyiy/pMspWaNsYExA0Z6ep/5Qg/am0utueiutRaTYkHR/2I6EjNeHids8oeQhr47vyD3zrG0nu3d4sfi2vx/aDBlCQpxqeUyEQ0OGJVR3HKZnOzGx0GL4yupZEgHsbKMH8c80++Uj5S854aTl6kGNIe95UoFH2DkwlbiP92A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mi1K2ey8; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mi1K2ey8"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so25399715e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 04:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748345950; x=1748950750; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=g0MAQYS4M77jxWNkT71QFnLtkooGsJDXRALLpCMZkcw=;
        b=mi1K2ey8/Xnra8h8U0RaLEzof5oGitBtplyUrs6GTMLEhhht7ZphPaRofKLPJa5eU+
         yT8pwUI0vVnTKJciQO7yNH3h57ZLBdN9VhG7dELt3/Ra3Ov+Gp1mvoP3u2VPENUuLsAz
         eKbOrlh7Du2CtWsAarVCkaYFG9ZySVkJ5mZCHAvuWbWKNzH4SRwtIbMDVeRYW8oSFP6/
         w84FztUN0KKFM6v1g3dAFrH7FrwAXMtsx4CfRRLuIeG7muI9s6K2l0tY8T61GgPFbORF
         l9qtgaUvszIKGCSZx4URKBvn3QT4CgHMiDtnkt/+/EIAj+2UCN9TA9qjh2kFDLm79u/Z
         EmQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748345950; x=1748950750;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g0MAQYS4M77jxWNkT71QFnLtkooGsJDXRALLpCMZkcw=;
        b=n71CozJoBM9pD0cCTcJjF7YkiQ14HAHHVNImMMB947D+N/ELzOC7utXGfciHO6XUq1
         JUYTlyJhP0rlY8E/QMiG9Y2UlKzYtlFKUaAH1Xwy7nNKr0ApdHGRLSP3/YYAkyDKM3C7
         QOCYxdi/S0YKKt/S1Fe5EUHsat9YPOK7C0L688WsNqagxJF710YY/xoPW1t5GUm8HU79
         caQW0JwT0K+U22rt1K3GmpBVU3WCvSERxwYLUNOKXpjCbtDxmYT5OHUCwaxiBt4dFnJ4
         7RLm6IhUStxnYRqADQH168hw0/zRnxjFcML0/auyI+98WqTwEdt8DQRsHpPxQ+EmGmIN
         w9kQ==
X-Forwarded-Encrypted: i=1; AJvYcCWr6ql22P+SEZxP1kRem00eQJdv2TyPqo4umARsN7lS6huPWzK/ROFf0Pxw/5cth9xphEEvhpPuLaD/ZUE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGWKz9+2VQQfvrbc4OIFpcWCDMajKJSzNjE9jhTFSNSjuYIxIh
	genjcOXJJk9gtRzOPqneySBQfNxpQ+H7+A85kR1piLCmPaxIVL350c0XnvhIghS8UQzcl8X6TFZ
	uB27efHbFFuc00o3IiQ==
X-Google-Smtp-Source: AGHT+IEtY72Ut24TUfi8A+NQcG9IFZgNNOho7lkI8zuGQsCJOo2RFpVOgykkWl+BYEC0e0TUSJlKQC8vtb7BA9k=
X-Received: from wro14.prod.google.com ([2002:a05:6000:41ce:b0:3a4:dc80:cece])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2008:b0:3a4:dcfb:6713 with SMTP id ffacd0b85a97d-3a4dcfb6836mr3950943f8f.18.1748345950187;
 Tue, 27 May 2025 04:39:10 -0700 (PDT)
Date: Tue, 27 May 2025 11:39:08 +0000
In-Reply-To: <20250524220758.915028-1-cmllamas@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250524220758.915028-1-cmllamas@google.com>
Message-ID: <aDWkXI83EyznGG2M@google.com>
Subject: Re: [PATCH] binder: fix yet another UAF in binder_devices
From: Alice Ryhl <aliceryhl@google.com>
To: Carlos Llamas <cmllamas@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <brauner@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Li Li <dualli@google.com>, kernel-team@android.com, 
	stable@vger.kernel.org, syzbot+4af454407ec393de51d6@syzkaller.appspotmail.com, 
	"open list:ANDROID DRIVERS" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"

On Sat, May 24, 2025 at 10:07:58PM +0000, Carlos Llamas wrote:
> Commit e77aff5528a18 ("binderfs: fix use-after-free in binder_devices")
> addressed a use-after-free where devices could be released without first
> being removed from the binder_devices list. However, there is a similar
> path in binder_free_proc() that was missed:
> 
>   ==================================================================
>   BUG: KASAN: slab-use-after-free in binder_remove_device+0xd4/0x100
>   Write of size 8 at addr ffff0000c773b900 by task umount/467
>   CPU: 12 UID: 0 PID: 467 Comm: umount Not tainted 6.15.0-rc7-00138-g57483a362741 #9 PREEMPT
>   Hardware name: linux,dummy-virt (DT)
>   Call trace:
>    binder_remove_device+0xd4/0x100
>    binderfs_evict_inode+0x230/0x2f0
>    evict+0x25c/0x5dc
>    iput+0x304/0x480
>    dentry_unlink_inode+0x208/0x46c
>    __dentry_kill+0x154/0x530
>    [...]
> 
>   Allocated by task 463:
>    __kmalloc_cache_noprof+0x13c/0x324
>    binderfs_binder_device_create.isra.0+0x138/0xa60
>    binder_ctl_ioctl+0x1ac/0x230
>   [...]
> 
>   Freed by task 215:
>    kfree+0x184/0x31c
>    binder_proc_dec_tmpref+0x33c/0x4ac
>    binder_deferred_func+0xc10/0x1108
>    process_one_work+0x520/0xba4
>   [...]
>   ==================================================================
> 
> Call binder_remove_device() within binder_free_proc() to ensure the
> device is removed from the binder_devices list before being kfreed.
> 
> Cc: stable@vger.kernel.org
> Fixes: 12d909cac1e1 ("binderfs: add new binder devices to binder_devices")
> Reported-by: syzbot+4af454407ec393de51d6@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=4af454407ec393de51d6
> Tested-by: syzbot+4af454407ec393de51d6@syzkaller.appspotmail.com
> Signed-off-by: Carlos Llamas <cmllamas@google.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
