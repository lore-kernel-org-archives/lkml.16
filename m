Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18F485947
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 08:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738311520; cv=none; b=PIuqszDzgkD15dUk/walEDKH6uqaNiMQkO0PpqiTr5BoL11W+XJxyhft5vmEF9l/nZ6ep32ZwTDK7XW6e3nj9n39gzD+0V9g+/6ZhD3Tw3VKwturGIWQkikIerLLUQ6bKV2dR6grsBi4VbHGZ6Umkrpnl1XBG+7+R1bbnVgylFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738311520; c=relaxed/simple;
	bh=XQAyDEsftPjo4BUnpRrzUo4hXISSwy4f0FYmQpPlKmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R+b6cXCHZMqiSfyQPCaAfcESQUz4cpGKyzT/0q3CWuQClfeami2IJJ/f51gHw9UpocPOfxxRfefPcTMxpC+QgK7gTVkMaSSOaTLa5wRqT/cY2k8fBYoc8ChsPKEsFwJMiNMzqHGhNLJIw7ovUhp/hevnyOuNyNhO6kK1ebkBjFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-518a861612eso1382618e0c.1
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 00:18:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738311517; x=1738916317;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O7YJgHULp2WAjtiPEkDFTcvV/zsoNwPARiiJx2ktMxk=;
        b=jjz5BWKCZXjoycygqOr/v4lrop5nUzDPIqiZzALOdymgLr1GGl0QeyHzeHytkVQjki
         c5n3ybK1uTdFgsw/Fpe1bpF/I2p+ZLLP4eC2Y+iKdaYDWt2M28QUyaXUPFO5euAmiHfm
         38Zymulxk5QjKchPGt1NxRdBvF6HCI0U0LY4bhVKwtS14n7pBr4VpR8TUc6sseEzFE/M
         DSkjpY5YX17LxqJx91UWrl5bkhdVWSwtaYHTOLF3l7x16ezuQBPBAHBwaXmi4KkTgFDF
         NAPhelpBtiP3Sg/yMb6JvmuAVlf1yypeD5/p4X0DE6bL73Z135M+k2+EvPnOHXrEqnG1
         B0GQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw2nsTAUVB525rgBaGt5ukxskH6PVUX1heq95R2WUPjNqeslDyT4ei5VZgk1lEOLFsF0pxEsWsIExSJbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBk0hjM6/sYwC5yoas7gxcyiHF1YKFntzNIhslW1A475BQu4Zc
	STD87zWP1geNE7Btm6p+NTz8sDxsAQgvbeGm8IyJbjn7s8NzlW/AGFpOeeOMhtM=
X-Gm-Gg: ASbGncts39SH3nXVTmmjjZEWO7AkDzsjnREXXU2sq4RAfWfN0LtH5yT03WtVZqu9NGH
	bwnKeTy6PRmHUtewBJTY1rFmpmL2UJrAtoKQIW78JVgL5Dz8DrTw3JKEn1uztFT59fNcrfr2KMk
	4rVJjjti4A4W3EYzptv6kVHPv1E5Cx9912tUmOXGuyKPW927b8j1BNV7jS48JK5F5JD320oVskf
	gHIvcMgX/r37kgLIg4u7o7N6isGtZeFTjScpHv53oxqCDPmHjGtTdFp9jBslMiBRI6VN7zP9/tm
	V3NeaOvm5UoRHzFiUS1Falq6xEt0IC3ESo9QqZu505vQzhTReVMiwgayQA==
X-Google-Smtp-Source: AGHT+IEAkmPxg6j9dUQ5+kw6purEnrtMEPvcb5lOW63S7aKt73SPl8neKDDc/lzwpy4kxAP87E5gBg==
X-Received: by 2002:a05:6122:11a7:b0:516:1e32:f8c7 with SMTP id 71dfb90a1353d-51ebe3d2a6emr1563874e0c.0.1738311517090;
        Fri, 31 Jan 2025 00:18:37 -0800 (PST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51eb1d8adbbsm447671e0c.39.2025.01.31.00.18.36
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 00:18:36 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-51873e55d27so1017177e0c.1
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 00:18:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU6JrkQ07iu7aV8pJAv5ok1QYzYLBCySCRARJUuv64XSLegTcvVkQ08+7gjKcwQsXs1ykZXCkqEYettdKg=@vger.kernel.org
X-Received: by 2002:a05:6122:459a:b0:516:dc0f:c925 with SMTP id
 71dfb90a1353d-51ebe666828mr1912542e0c.6.1738311516552; Fri, 31 Jan 2025
 00:18:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202501310132.oGDmspPN-lkp@intel.com>
In-Reply-To: <202501310132.oGDmspPN-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 31 Jan 2025 09:18:25 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX9=KRJ7jhzrMdnjCiTpBhqJT6fC5ZR=HKUVPzdygKBsw@mail.gmail.com>
X-Gm-Features: AWEUYZkLT5ckFgNiGcY41nm9el4Hb73i2R4W479F_ewOJKXPN37hxSWvlqWURJA
Message-ID: <CAMuHMdX9=KRJ7jhzrMdnjCiTpBhqJT6fC5ZR=HKUVPzdygKBsw@mail.gmail.com>
Subject: Re: net/ipv4/ip_gre.c:141:22: warning: variable 'data_len' set but
 not used
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	mptcp@lists.linux.dev, matthieu.baerts@tessares.net, 
	Jakub Kicinski <kuba@kernel.org>, Matthieu Baerts <matttbe@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Kernel Test Roboty,

On Thu, 30 Jan 2025 at 18:55, kernel test robot <lkp@intel.com> wrote:
> FYI, the error/warning still remains.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   72deda0abee6e705ae71a93f69f55e33be5bca5c
> commit: 010b430d5df556d5d232e3751ac691ba9e88c041 mptcp: MPTCP_IPV6 should depend on IPV6 instead of selecting it
> date:   4 years, 3 months ago
> config: csky-randconfig-p001-20220406 (https://download.01.org/0day-ci/archive/20250131/202501310132.oGDmspPN-lkp@intel.com/config)
> compiler: csky-linux-gcc (GCC) 12.4.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250131/202501310132.oGDmspPN-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501310132.oGDmspPN-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    net/ipv4/ip_gre.c: In function 'ipgre_err':
> >> net/ipv4/ip_gre.c:141:22: warning: variable 'data_len' set but not used [-Wunused-but-set-variable]
>      141 |         unsigned int data_len = 0;
>          |                      ^~~~~~~~

https://lore.kernel.org/all/67956320a8ee663f2582cc75f0e8047d69da5f6a.1737371364.git.geert@linux-m68k.org/#t
Waiting for the merge window to close to repost...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
