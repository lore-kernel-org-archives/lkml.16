Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E7F33C9
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 15:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746112382; cv=none; b=tRUDtXecv+SrpISfA1BUb2qR8obBDlVKXRG/tGVkavZq+osXduPB3NCZOUgbmF8LB38jGFoVu4xBIrTXaRnAoG8E4zHamE+iI1n5jN6FnoqsNnPJDfcXRrtWpf0Of+9f4YsC0hzQOvXxXuzmAIUYhtivOvlF2QHgJzngjPg2R/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746112382; c=relaxed/simple;
	bh=xQYoQ6blzMcLADqk42repQh467cCu5FADPOPWsPwKR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p1wwEXzbmRmMmtph5QpZJb3FpfxBRqC4voxKdfwYGW/txqbH14p8DXDpAtx9Iw9miacQYdvfPVCKyXo9otL+g6MPqHCP0KmX3XR+wF8qrav1OA3aDNHDBIWjwy+Xg2WdD8mZ0pT3ZfH+7lXXorASCVmDBslWbRtr5t4xfemR8HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V97jI2o6; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V97jI2o6"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6ecfc2cb1aaso12732776d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 08:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746112380; x=1746717180; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQYoQ6blzMcLADqk42repQh467cCu5FADPOPWsPwKR4=;
        b=V97jI2o6ciTdQpRROpxahdN+hKPRb+XbbZnKGb7FnCWp0KNCSdQN6/9F1KoFcQKblA
         4kel0X5Nhi6AN8NKjSOS3Fvonkgls0NMk6c+c1PHI6DHUOSVZKKnURb2avRCLOO1ksyb
         GulKS7YyXzBKSYPcjVyJWH8/DyAOcDrCoZc3YVh6WEVee20s8Dqsfc9J1rA+KsbGGHoj
         1vns7nZfmarpImx1D5JKERzUSuyiULp6Pye00ouItZvKU1atF2yqC2P7dPUVLG3X8YVs
         d3bWSBnju+1AIsgwbIeISrT1FzP7ps3KPDMfzRCrxoSPvrfaSqJhIycF/NikAoiUMNe9
         6BAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746112380; x=1746717180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xQYoQ6blzMcLADqk42repQh467cCu5FADPOPWsPwKR4=;
        b=xQySJTpw+3Df1UfHB198XLwzsjO11DrkeR8XOZnTA6AKy7jrQiY0Q9LJ1jApn8RlhE
         UCG1ydB0co0PMM2qkFPK6lTIUUeeSeR65cykJ2Fkpz5GL40YPt/O/FgBb2Rj9fTnf8CX
         DQGygu1XJzfxfM0hjjjEsVDad65pma9ibr9WvJtdF+t/Jbt5bpGivWhV0cDmvFamuQY6
         FQeae5eqqyf/n4wNyZW4A6ykwcjJn9HAJ402RdAsc5VSgBhotJ+vR2RfVCdBUcfdHW6R
         zrkHeFqWQRzPaDDCvwqHstoK/6ta2WUm5/eE9i7uKIbgzn0AQj1pTWJURfa4Jk1xQXrV
         z2AA==
X-Forwarded-Encrypted: i=1; AJvYcCXbQv5T7Pcyfr6qcHgrsFAMAvCOU5GwRBtB9Xh9Po4Akf3P1uyqx3iomZd2pAxbVClCgNWEAsbnSTA+jc4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDUxasPb5C3UQ/ppuyu45ZqPWvB2FK35g+ChBKPINuzvFU9j7O
	c5BbNaT1inhkrAB2TmlbBcV0jzyUtT4rll/kHJc5hgXqwmrsLXOXioo1NwPEqLR28DouWLYolE+
	Xptc1k4ejkuF8dfl72Shnown7tQU=
X-Gm-Gg: ASbGnct1PDuXq6nNJMnYSg6A2n3YpEY5NTBUQSsM63JUW5q+ULcxICZCmVKt/4Qza7l
	yLr1QO4/G5YS2v9QXY+SEUbvbFKcTEmEiO3YVODFeHwn20Q1Yy0KMlN36UZ1T9lI3/Em1j5KnrC
	L9zhX6uB1txbU+tdb1XJ9YOBo=
X-Google-Smtp-Source: AGHT+IGAdTAkywowhkq9htFUL863njyM7arTMBHIbku24t5R7jVNw6BjMXmXswwZnPdgrERB600zafxI6/iVqN/kPo4=
X-Received: by 2002:a05:6214:410d:b0:6e8:fbb7:6769 with SMTP id
 6a1803df08f44-6f50a91ffbbmr48422286d6.14.1746112379547; Thu, 01 May 2025
 08:12:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430082651.3152444-1-qun-wei.lin@mediatek.com> <20250501140226.GE2020@cmpxchg.org>
In-Reply-To: <20250501140226.GE2020@cmpxchg.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 1 May 2025 08:12:48 -0700
X-Gm-Features: ATxdqUHwMXp9jU8G8_cQ9P3g5XjhCdDwSp9AbCfZOwreqQLiBgW7BVs0NuAIwgQ
Message-ID: <CAKEwX=MsP6LGjMRNyaHnO5MkE_ne-u-cKLbGfVQcSR-ALoxBwA@mail.gmail.com>
Subject: Re: [PATCH] mm: Add Kcompressd for accelerated memory compression
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Qun-Wei Lin <qun-wei.lin@mediatek.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Mike Rapoport <rppt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Casper Li <casper.li@mediatek.com>, 
	Chinwen Chang <chinwen.chang@mediatek.com>, Andrew Yang <andrew.yang@mediatek.com>, 
	James Hsu <james.hsu@mediatek.com>, Barry Song <21cnbao@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 7:02=E2=80=AFAM Johannes Weiner <hannes@cmpxchg.org>=
 wrote:
>
>
> The way you implemented this adds time-and-space overhead even on
> systems that don't have any sort of swap compression enabled.
>
> That seems unnecessary. There is an existing method for asynchronous
> writeback, and pageout() is naturally fully set up to handle this.
>
> IMO the better way to do this is to make zswap_store() (and
> zram_bio_write()?) asynchronous. Make those functions queue the work
> and wake the compression daemon, and then have the daemon call
> folio_end_writeback() / bio_endio() when it's done with it.

+1.
