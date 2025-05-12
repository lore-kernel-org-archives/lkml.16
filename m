Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5932E1A3BD8
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 06:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747032906; cv=none; b=l01+HvF5kku7WkP2mDOjAmC+6JeSsJKodBiCI1f5WnC7e+atkY+5UGxjR8Z9znnNuf6+cka6LHC72vHHWa/3ejbmJmXlcniAOygXyZDdhyaErmRtaQM8/CRARtjQwuzQZRrcm0JPWH/ocSaAC5/KH0EeImtnde/Z0pIAxDWXJ1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747032906; c=relaxed/simple;
	bh=6IVJOCu4G6FOFgbNBeN1z1zvG5MAPs3qdDS6njuvv2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G1SVbjuE4tqDLNbNDl/60dzV5moLRtQiBsCE+CVChC22XWBhbOe3ianePmdu96Zp7IwesFdQbXMkAu1MoLn2cWxLhVl6jnDpkoQjP8ayv/q43LIM1Mpz4LSpSVK/nNVCpGmf5wdInIATv4WJVhwub6kSW+wSc2ay9cxRc1OnyGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=NUdfBMgf; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="NUdfBMgf"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4769f3e19a9so27751511cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 23:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1747032903; x=1747637703; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6IVJOCu4G6FOFgbNBeN1z1zvG5MAPs3qdDS6njuvv2E=;
        b=NUdfBMgfNakJbmIjyCVXcsjFFRfPblBq3gpA1BJoexiINy3BXAX+rgYk3hPjV/nmOq
         rbDPuC615JOwArdktW6KwRUtsocYjBs1WY8vs907PFCnXPfZ7gHDGV+rQ0c6VMY6ox/R
         e4vrfKIHI3GpMdbekVJl8bLoFJTHt6bf0sLEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747032903; x=1747637703;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6IVJOCu4G6FOFgbNBeN1z1zvG5MAPs3qdDS6njuvv2E=;
        b=Dy4VefkhAX2aTznr2fk1Ydj4vy32Tgv38eBDPDeumnlyFs5ytIp4v+5XpLG7mTDB1k
         7sh8eBpAW2IinkteGFGsGPWLer0mf/8z15RGyImwzRBK3mhErfYncNVtAD30tyy1ZXwl
         so7s31PxpNxvwUNtgRSR8dRT+XTuTVX44Yse/IZG1L66Fpxv8/ulVM7+dEeoqaTLfhUc
         25zpCc8IgBWuXSpXfSwAdBSsjI2zqXszEKB0vb6BPy4xfwChTsV0ARbfs1tdS2sv5jb0
         1tc7Qm0evMoD0olhsw+i2gmvzLPLi7BOeoxZi8R2Y2TlCrXe7xx9WQUL+xh9CE2STU44
         yAYg==
X-Forwarded-Encrypted: i=1; AJvYcCWczz+WN6JsadMHW7HKyP1Q+rVZMDWWmZYmXZXZTuDEHB7w4JO80wHc6muKpTpKnTvzMsZx6YC21OFRZx0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqDVCOxJk5FOK9J6E6PG4CBYWyHPfyRS2Thifunw1NN7DREmE2
	mJJN94JRjUFBW4XY4Ujek3gd5TAaTevlQHcuzJUzoIOR24k/4eXPOp/EJZUMQVSEYlUBgb2jK0F
	XXeSqYzwsZelWgQb5PqhxNTiDNhJoBzCT62d4PHR0l4+TpW/6
X-Gm-Gg: ASbGnctnvYhXk0XJ8DoJOVGfcCLKdEuFT/ruQGo5hF9IxknSpIxpd+lN5v+BAW0U1zQ
	8QHTFq3rnK4BS6448SMo4r90wCQV/1K2FCqJDuklVLjHPAAtCOiDuEE3d4IU+Egh5XjYMY+2H2j
	TX5drGfMxkbA6+/EXyaNNP9nlC9do6dw7IViNEiTbwd4TTWw==
X-Google-Smtp-Source: AGHT+IG98ZamC/T5baoB3zZX2nAzAST1wIcODI9NyEeFS8+OHJHpGTVcVAVuGpVBW0W22bDVSInjxKumR35tgcQjFTs=
X-Received: by 2002:ac8:7d51:0:b0:477:5d31:9c3f with SMTP id
 d75a77b69052e-494527d4685mr212493061cf.42.1747032903049; Sun, 11 May 2025
 23:55:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511084859.1788484-3-chenlinxuan@uniontech.com>
In-Reply-To: <20250511084859.1788484-3-chenlinxuan@uniontech.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 12 May 2025 08:54:52 +0200
X-Gm-Features: AX0GCFszN6ImaT0QVnL7Dcrp2g5QJ13gSl_ygXKLhPPtb46d-8dQph4VoVYGgyE
Message-ID: <CAJfpegtJ423afKvQaai8EeFrP4soep6LrA3jZg4A1oth3Fi2gg@mail.gmail.com>
Subject: Re: [PATCH v4] fs: fuse: add more information to fdinfo
To: Chen Linxuan <chenlinxuan@uniontech.com>
Cc: Amir Goldstein <amir73il@gmail.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 11 May 2025 at 10:50, Chen Linxuan <chenlinxuan@uniontech.com> wrote:
>
> This commit add fuse connection device id to
> fdinfo of opened fuse files.

What I meant is adding this to fuse_dev_operations.

Thanks,
Miklos
