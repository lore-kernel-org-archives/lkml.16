Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3B91C68F
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 07:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743837164; cv=none; b=opmxU8zMlDTRZvEETTSFirQrhB/hDfh55jQOMIenScxTQ6OMONEOIFf7Zz1SY0Y9XEsZyYDhzxWK0Sw7djoUS92vMaFRVqbBYkaFFnIphZqPLAajPu/03/EJ+wjofCXjnOeHT5aZceYX5HkVrjca/jrzBg+6vNO8rT0deyKrA8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743837164; c=relaxed/simple;
	bh=+CLtaAqxyY1kCkSI/TbT0Hpexgft+vPPXfaxQR1q6Wc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=dd/DhCOVAczao2DVK+NXWT58smN9G5hsAJOuhkRoPF0eIiM3ZE4kkAiVbSjKhrqs60Nkhw7Xq2P3DN8zd8CvZ7NNzDZjiHAkDqlZtVds+nW5t95P9RA1WOPFTVaiu1KB5X7L2ckc6hFwseB7gsUXKKOi/VJkIQ5+bKK/dEqiJMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-85b41b906b3so331743839f.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 00:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743837162; x=1744441962;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6SLEoDZmTy/XerrBCsldm2bLs8g5zzhOp22FWJJvKtg=;
        b=reVkEicvd/DSOO83WSDHJRVBpmU0ij6gJiqPTPCbMBb0Rzwwvz71ue3F/XEbauX3CQ
         3C33yM6CKWNimliGXwTxT1OwVEz4+r2jFCrtAw0b3Ps6vbckOS6vqyC73Xy+BefH5P0/
         E/hjhxXAqLGfSKAeD6mhtp/xvZaAE0ZS1vwOsXiV2R+PUdVjNVIkJkoUct/9b+ObPxVu
         VXkCPgkk4twAVKWq1iYjSC4Fe6R2mrfBJO1B0ddzcANCOsKdgGjjXwVqeJuhe4nc7t96
         3aK+rS9kzuQxNGjsDBwZYCVT/psNmVY8hgQb9RPw5Jo/6IBoQUJ0Fxvn1bSTYqqoYSb5
         NRfw==
X-Forwarded-Encrypted: i=1; AJvYcCWznnf/vftWVgFEhZ1pLqSAEuI2KwUcMgiIck67kltKQjwebOgpm2AzUE58pnLfItomoF6FuMEgPjETIwA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzuYVn2nbbO4V1jTx4IOxX0s8MR+0cE1lgm+me99KbjXx8hn9/
	wf8uNzqsQdw/wQDpJL6W+Im5mMw7Ag/3OKyYlw5WcZWgNCCHMkak8+Umw07ZnW8W1JiF8gKd6eC
	o6Wp4d5HR9Wjb8VntR6nN/VPc7ie/ugc8n+yKPmLrkyth2Yg6v2Ns4oo=
X-Google-Smtp-Source: AGHT+IFEg8/USpU309g8eg2t943s8651rBDNT1Wm17z63JLZDAtKE1TqBqOiPjzmYG4ywF2yLevYwqkE30xcnMDywaiAbk8sp4Ms
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12cc:b0:3d4:3fbf:967d with SMTP id
 e9e14a558f8ab-3d6e3f01680mr64748535ab.7.1743837162230; Sat, 05 Apr 2025
 00:12:42 -0700 (PDT)
Date: Sat, 05 Apr 2025 00:12:42 -0700
In-Reply-To: <20250405071234.16795-1-richard120310@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f0d7ea.050a0220.0a13.022e.GAE@google.com>
Subject: Re: [PATCH] timerqueue: Fix uninit value
From: syzbot <syzbot+d5e61dcfda08821a226d@syzkaller.appspotmail.com>
To: richard120310@gmail.com
Cc: richard120310@gmail.com, syzkaller-bugs@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 1e1ba8d23dae

This crash does not have a reproducer. I cannot test it.

>
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> ---
>  include/linux/timerqueue.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/linux/timerqueue.h b/include/linux/timerqueue.h
> index d306d9dd2207..a42fdc83f694 100644
> --- a/include/linux/timerqueue.h
> +++ b/include/linux/timerqueue.h
> @@ -30,6 +30,8 @@ struct timerqueue_node *timerqueue_getnext(struct timerqueue_head *head)
>  static inline void timerqueue_init(struct timerqueue_node *node)
>  {
>  	RB_CLEAR_NODE(&node->node);
> +	node->node.rb_right = NULL;
> +	node->node.rb_left = NULL;
>  }
>  
>  static inline bool timerqueue_node_queued(struct timerqueue_node *node)
> -- 
> 2.43.0
>
