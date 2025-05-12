Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791F3C2F2;
	Mon, 12 May 2025 01:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747012415; cv=none; b=KJsPgIkBKwSkGYt2ttAofJOdCghGuyp9M4S+lMKJa//RYEylrm7y7JFIJDR7Ae2NPz/9nX095Qz5MciFyQdC86AFO1A1+TadW/SbWTYkKww9gRfm+JCj8BZS9vn+4QZvfoi9CRdR8/QnBHpo7xSY+rhMni3zYETb8/jTUGDyRZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747012415; c=relaxed/simple;
	bh=lPai4F2YaJC+0rUvM723XkeicNVwEfYMdjc0gjP11ms=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=HXn+/ZjA9veapWjNLAyLBklG0snWV211j8Wa0QRiZvC580dhwBU8fiVls2bHfVH2l164VEp35mxUTAYfKXDpnMvsqofpPgrk7f80SCCkvdldvoIQBTfeOla8g3SenHRgsQBTLAzHEylSyYlUzYi8R3dmAfJUsJKKNHIRKBZe5k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dfZs2KXh; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dfZs2KXh"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3da82c6c5d4so20970755ab.1;
        Sun, 11 May 2025 18:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747012413; x=1747617213; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lPai4F2YaJC+0rUvM723XkeicNVwEfYMdjc0gjP11ms=;
        b=dfZs2KXhy7yTHQ2C9L9X4Fighn7s6y6CU2FPgJlTt/PjW/Px2O6kSxXGPY3W1E/SAL
         gXmFpWfz2NysCwDTLHusGRKvtYiAiqG/LNrj0IFINipUavj5h4xziEdjkWHYmXi3fD3q
         bgDJpJKEJw206EbRMSRuqvohhJwO6QfmTEHbv5M/Ai76S/t7g2kiI3ovJ5PhfygfCKdu
         z9lFDZral5Blt5qPFujf6ntkbH8fp3kullVnakfN94Ri6JlW5fOPDn1w+2Ov0V/rAFS+
         TJb5FJm6jF6W+IBP1pQFGuJ2dkzQWYsHDkJtwm3q63eGAElRburQ/ULrC+Ipcl8vWUcT
         eHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747012413; x=1747617213;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lPai4F2YaJC+0rUvM723XkeicNVwEfYMdjc0gjP11ms=;
        b=ZPZdJwz4wR3U4owWPw9+idlEwG0J7loEPTo8LiBYB4yOJEV8eZCNHXAzTPiRQCoRQz
         ORrY2qipoyq3q1U0nS1Ye1t7Lbe3XGWBsweUCFR3oQGHSVpwAI9obxTLbNUAMRtHueOs
         d80pc0eCM6X4nAxdpedt6lKn0JQqXeUU6qalsGXAmiZpd3TunbT1AnlzxosvVhH3Wuto
         c7Gf1HLQGbN2sF9Tl8Q5q3gNomibSXCEVw06MvAZXNCYkf/WqrBF2GnGHQe9OnEWyD2S
         GBwa413I3s0sMLI5iDlO8wSNSBLRNMFMQJnOcH0Bq+2oJg0a/BmdFMN8vPVnELpcLpAH
         jH/w==
X-Forwarded-Encrypted: i=1; AJvYcCWX99Bg+XJlQmJ4gFoLWfNq7HxVgCnt/Yw8LerzPVSpH38krs7ihT7ir0kAl+iis+bGKBqE+bnOo9G+jxL4@vger.kernel.org, AJvYcCXiU0At+6KTb1bt9DPnwrf+nj2Cg8qtVmIuGgI8ZMUIwoz0X33oq9cLVFQKFu7PYjiYrNAxzEX+/T4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSg9xKfrB9UJkMrka5wAd8GT+SgfcWrbljBPTSqvbUQhPvZT3p
	/SNYzsJOfFAOMBmfSPS2vktz5PQokWvU0v8vZfqStqwZ27/nqUV7zCRmkWzuy6fJoc7p5b0IqE0
	5YdIw69dyTSPwEBAShRdJstO9h2UfE835QoM=
X-Gm-Gg: ASbGncuYzME1m9zWa/Jw5FIlQxscBfSWfFfxvW56AuDGhi1vzJMFY2B+ophFAvJNbzL
	XxoMGVNEzzXOyZAxE5XFnppWullrx2EU+2Rdnft3rpwu5BMpWJKS+j0Ah18ldLKGbinofDbBhgx
	9MoDBd9m3hMTxdVw2gwErR0ofWu8G21Bo=
X-Google-Smtp-Source: AGHT+IEkkEJVtv4IWosQLcMGjNaQcbnGBAUV4i/DBm7EWZ46uRyQb1+nLmn8GAwHv/brGP3V1OBdswake65odVronYM=
X-Received: by 2002:a05:6e02:1a27:b0:3d8:1d7c:e192 with SMTP id
 e9e14a558f8ab-3da7e1e305bmr139026045ab.7.1747012413462; Sun, 11 May 2025
 18:13:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Mon, 12 May 2025 09:12:56 +0800
X-Gm-Features: AX0GCFuMOHaXiweNfiOhOlQpTI272ng6t0PenL1AMWJeMRjZMo_ZJYGfE2jrTr0
Message-ID: <CAL+tcoCVjihJc=exL4hJDaLFr=CrMx=2JgYO_F_m12-LP9Lc-A@mail.gmail.com>
Subject: Re: [PATCH] relay: Remove unused relay_late_setup_files
To: Andrew Morton <akpm@linux-foundation.org>, andriy.shevchenko@linux.intel.com, 
	corbet@lwn.net, linux-doc@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, linux@treblig.org, viro@zeniv.linux.org.uk, 
	Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"

Hi All,

I noticed this patch "relay: Remove unused relay_late_setup_files"
appears in the mm branch already[1], which I totally missed. Sorry for
joining the party late.

I have a different opinion on this. For me, I'm very cautious about
what those so-called legacy interfaces are and how they can work in
different cases and what the use case might be... There are still a
small number of out-of-tree users like me heavily relying on relayfs
mechanism. So my humble opinion is that if you want to remove
so-called dead code, probably clearly state why it cannot be used
anymore in the future.

Dr. David, I appreciate your patch, but please do not simply do the
random cleanup work __here__. If you take a deep look at the relayfs,
you may find there are other interfaces/functions no one uses in the
kernel tree.

I'm now checking this kind of patch in relayfs one by one to avoid
such a thing happening. I'm trying to maintain it as much as possible
since we internally use it in the networking area to output useful
information in the hot paths, a little bit like blktrace. BTW, relayfs
is really a wonderful one that helps kernel modules communicate with
userspace very efficiently. I'm trying to revive it if I can.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?h=mm-everything&id=46aa76118ee365c25911806e34d28fc2aa5ef997

Thanks,
Jason
