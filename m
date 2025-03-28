Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983BD20E00F
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 02:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743129116; cv=none; b=VvRI4Qay7D/0+zDttfYTVe/m0fdouTOcyu32WToYbUm0G9fYChqdQzwBfMOwpvQ8uLPIkZPAfviW7TQXet2HK6+52hDCJ1aSssiI9kq85T6qHij1HUXdcBOxIDzMkCKijAv+YykwVDShsMkHlI9eGIVe8fbpKLfNVAQn2tJ78pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743129116; c=relaxed/simple;
	bh=BlnKdtCHHwcDRqIDbXZjVMQpGMJcd5wWccaXTlnWMQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aU9r4Qnnh0s3IGsmkZElviuC/NJHByu4y6f1UJmw7G1A8rif+qTs/vAH9iXb6NQlVeDjMLjQJV9dD0e/1Bu7TIz8t2MnAhXuU0sPuWfco85jG0ilV0a+YaUvrC4L41sfoEjsO7DDiJgxjG1XY54AVriBCjYYGYyOU1E7a6ksk2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kbuqina3; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kbuqina3"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf7c2c351so1008665e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 19:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743129113; x=1743733913; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIbhRvZjB+RFYfDjdQ1zEMI1vVgmcRuTUrVSTb+/szQ=;
        b=kbuqina351UBlE93N0j8jcaEjIWgHAAAAkMwNn9ykhQdHuP/P4VaTusxBfpp023954
         anJJeeUh+7D49AdETwgDUmWTEDZRJBGP4oUNlpMEGj1Qqn7kln5aq4JW4ZHMk5rACEEh
         STtmOV61rKEOrbOcHRwK4Sf/QEESyt2vso7dJqbEiYHxo5vD24fM31tPPzvf9VDh5cMB
         ZzR6iLgw/+4ldQvSBn8eLNI2x421GvtqUlVShj3xFeHzfMojFSq3b4Mj0ITLQOyRoQdH
         eL1IvjG+RXOlUfUQkqHqYXkqPcH3m/4BQyiJVxqN7Kkee2NJhiRjJ8qTKEfcWAApLDWh
         VH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743129113; x=1743733913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BIbhRvZjB+RFYfDjdQ1zEMI1vVgmcRuTUrVSTb+/szQ=;
        b=dXqHJZAOn5xb/TM3QW3cTDBGdA8TenDGZJ32W2soD/dlcrKDKSQbhlfJcN/ox/r5JN
         Hn476as6K6v42vyuscEmgxwsu9srirTDA+2do5TJRn9fuEqX/dTml0PBxPn8thUy35IM
         SRkI2XvcewxOp7QXGJQ1HcQuQ7h29LpNnu3SrKRj+QuyT9UdRTnNrKeK3amyNxeKb88/
         0Izz6Q81vDTfU4WLVaY92FbHkK3EL0Zrs7y7R8WFRW/yE/5M2LH9PU8DrpVxaTZenLQQ
         5+S5HEUn+2zYR5D7DYaX6pTMY3O32zMcqmgR2rmRsVfc3V2/XoxMPv1viAaRtMyUXoH8
         Q66g==
X-Forwarded-Encrypted: i=1; AJvYcCX9xP6/UPcO3bQTjYi7r4ch4XGrTqBtmKbQ/Hdq7uLjw4z0AaLu4c6rGpWKIdRzYmsXQ/uGNRlJ5lU/ej4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyyoSQcLF8hxq+jnlnvZ8LxHOQqqd04w6bK+lVXjkD/Z43frT2
	hsIwsPu3zRN9PvUlZDZUiJQqjrwG/7GxBH7wNs/pa82RTdeFRFEdnyCcXvLEZniydmuLuY5OZLt
	wpOVDO2H2k9bfHRp+snI9AsgnLeY=
X-Gm-Gg: ASbGncv5CDc1zSTSopuAIQpYkHRBR3J+Y8vZMqLA0jc9D5ZrDPQnSbu2AVu8Yi63hbQ
	oWbea+C1ETk8m8i/w8+K51d3b8RNpjgVLFDKK6MPY9ZpGip2pjQQkimAvtHR1M/FLp8uYqH4aeu
	IRPlzP/GJ3ws6PS5Rr0xXyRLMzVZo=
X-Google-Smtp-Source: AGHT+IE8QzVAlfTfUekPHL93gEjiZNeb2ZJi1C05uuwOAC1RciktnQWfP1vyP0x+EEI4/+gktAF1fRaxcIFPgMRD+uE=
X-Received: by 2002:a05:6000:1a86:b0:38f:2ef5:ede9 with SMTP id
 ffacd0b85a97d-39c0b5ec5c8mr591544f8f.12.1743129112559; Thu, 27 Mar 2025
 19:31:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327055607.3829954-1-chao@kernel.org>
In-Reply-To: <20250327055607.3829954-1-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Fri, 28 Mar 2025 10:31:41 +0800
X-Gm-Features: AQ5f1Jrfrr6XYlIRsZrzxyOK-R7Jzo36qzZK1SU--NLoA-QHUlkQ_GxrZEhaVBY
Message-ID: <CAHJ8P3LWvrJzrFNht7hzDEM3NBXpzDzGnHyKPjKk8rnUTRFQLQ@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to set atomic write status more clear
To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, Zhiguo Niu <zhiguo.niu@unisoc.com>, 
	Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
=E4=BA=8E2025=E5=B9=B43=E6=9C=8827=E6=97=A5=E5=91=A8=E5=9B=9B 13:59=E5=86=
=99=E9=81=93=EF=BC=9A
>
> 1. After we start atomic write in a database file, before committing
> all data, we'd better not set inode w/ vfs dirty status to avoid
> redundant updates, instead, we only set inode w/ atomic dirty status.
>
> 2. After we commit all data, before committing metadata, we need to
> clear atomic dirty status, and set vfs dirty status to allow vfs flush
> dirty inode.
>
> Cc: Daeho Jeong <daehojeong@google.com>
> Reported-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> Signed-off-by: Chao Yu <chao@kernel.org>

Hi Chao,
it is more clear and I understand, thanks a lot.
Reviewed-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
>  fs/f2fs/inode.c   | 4 +++-
>  fs/f2fs/segment.c | 6 ++++++
>  fs/f2fs/super.c   | 4 +++-
>  3 files changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index 5c8634eaef7b..f5991e8751b9 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -34,7 +34,9 @@ void f2fs_mark_inode_dirty_sync(struct inode *inode, bo=
ol sync)
>         if (f2fs_inode_dirtied(inode, sync))
>                 return;
>
> -       if (f2fs_is_atomic_file(inode))
> +       /* only atomic file w/ FI_ATOMIC_COMMITTED can be set vfs dirty *=
/
> +       if (f2fs_is_atomic_file(inode) &&
> +                       !is_inode_flag_set(inode, FI_ATOMIC_COMMITTED))
>                 return;
>
>         mark_inode_dirty_sync(inode);
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index dc360b4b0569..7c113b446f63 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -376,7 +376,13 @@ static int __f2fs_commit_atomic_write(struct inode *=
inode)
>         } else {
>                 sbi->committed_atomic_block +=3D fi->atomic_write_cnt;
>                 set_inode_flag(inode, FI_ATOMIC_COMMITTED);
> +
> +               /*
> +                * inode may has no FI_ATOMIC_DIRTIED flag due to no writ=
e
> +                * before commit.
> +                */
>                 if (is_inode_flag_set(inode, FI_ATOMIC_DIRTIED)) {
> +                       /* clear atomic dirty status and set vfs dirty st=
atus */
>                         clear_inode_flag(inode, FI_ATOMIC_DIRTIED);
>                         f2fs_mark_inode_dirty_sync(inode, true);
>                 }
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 9a42a1323f42..a5cc9f6ee16a 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1532,7 +1532,9 @@ int f2fs_inode_dirtied(struct inode *inode, bool sy=
nc)
>         }
>         spin_unlock(&sbi->inode_lock[DIRTY_META]);
>
> -       if (!ret && f2fs_is_atomic_file(inode))
> +       /* if atomic write is not committed, set inode w/ atomic dirty */
> +       if (!ret && f2fs_is_atomic_file(inode) &&
> +                       !is_inode_flag_set(inode, FI_ATOMIC_COMMITTED))
>                 set_inode_flag(inode, FI_ATOMIC_DIRTIED);
>
>         return ret;
> --
> 2.49.0
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
