Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CAA1DE3AA
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 10:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738925004; cv=none; b=PEHeqwFTtW35QTVOCPr8o4wRPLF20jkJeadO3qZUIipFvDlZwBSJHZdEc2GfIMPa/DFBZ0uQJU6hd4JQBV6A83FvNnYGOUyQLNT0wqJGblaYOIgS3Y7P5l6a0b+paFfVuftlfI8jGf4FY3BXY59fwaU7X868P2hjW49eAj38Qoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738925004; c=relaxed/simple;
	bh=Owr0YKtHdkqN7+hjoDD8i2kaaYELxg9xOxfJ6jW9Nv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lhteeB8KjRNuULhIzyhFaKZPNhgS3truyqbh9ZYy24waP9YqaEdh8YQm9SqWHNxDG7KrKn84YkUXDMFmwTPwpIXBnlYFtNmVGwHD7UvmMh73YvKT3arn3MMIw9/Yp3s0LixZLYVOcSQg8gi0aBp98lqG/RQfdGwnzRKnt3KAJEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=n7fZoZqD; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="n7fZoZqD"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-467918c35easo33023971cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 02:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1738925001; x=1739529801; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Owr0YKtHdkqN7+hjoDD8i2kaaYELxg9xOxfJ6jW9Nv4=;
        b=n7fZoZqDT4vk+0bdMrtxd/YI7dimv8kuM/grOemUcOVHkYMX0UpaO9EqD9YfsVmdyL
         FC7iG983FWjBUWh8Y1zA9gBM7qzwDNoTq6cbBzbpPqwFPgEFi7PGGJhnNvPmlwlA3vRN
         I4FHJFVQ6SfWOagLUSCAmaWejnU3QIVCudSZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738925001; x=1739529801;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Owr0YKtHdkqN7+hjoDD8i2kaaYELxg9xOxfJ6jW9Nv4=;
        b=GJzGTH6S0h5wJ86EobxLyU+b/NDhunXt8fhoTu2Ag6JADkQcAPQNs6GwhbcrEI1Jqq
         1Uj7omhdM2xb4sbF79cEiuscYOktUM8AmVxTLFfNKZ/I8qnZwL+a0Vv7U6L49TOooTmH
         MTSWJo8DHuCb4KS6OtjfPACu1fQw9036BsPckMtp5edG3LrMvfIEtV9alEJ+LmT+1C00
         F2L0KEER4uB5S2+2klnLYmvEO1F9KhV98gZUoVEczNwWlRx6rOXt2mu7zEAf/D2EJqbr
         ZEbSQElDu/q0uviWB9aUbyRl1PoO5+4x22nLhQg8rZQ6YVA8bwDYvSpo8UVpM6Zu5zgq
         H9mQ==
X-Forwarded-Encrypted: i=1; AJvYcCUK3zMW7yCluxkSzeKYPpUDHUKPuFirQLpcNdZjFLBYjQBW7ZoEftQvDB03Fbe+W5oK44hohwZZShJ+wPI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Pa1uWttBDeF37D3r37bJRe4jl19lwf79w3rXslz748hRMvke
	wJwSadmmMwMqk3+L+OUWLGJKWQZuF8NXs8YlbmPKLPeLrk3opVzPF4Zn91n/6J19scjqMNtEDic
	AoK/fhuCOAf0XGm/9tCkkVh1gRbJ6SaUR3LadXw==
X-Gm-Gg: ASbGncs4e/yj52LyNj024FCKf2qgsoxKRHHSxEo1TKlK9U0i0pFRi8ACwdmQNqkDTWw
	JwNoeFIuagN23MDudqeTY1zc9iH9nnsS9FB0wu/VZM9ql2Z7Ar6LnpUzM2YDOkt9a7GEaNA==
X-Google-Smtp-Source: AGHT+IGkFRBaRLP1f7W9gqHW6Q2AKQLytp/hmZC95VfJ6xO6/ON3OM06vkit9Bhnsvf31fWFt29Royhe6fq1H0cZIa8=
X-Received: by 2002:a05:622a:4887:b0:467:6486:beea with SMTP id
 d75a77b69052e-47167ae4440mr41388981cf.38.1738925001678; Fri, 07 Feb 2025
 02:43:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2f681f48-00f5-4e09-8431-2b3dbfaa881e@heusel.eu>
 <CAJfpegtaTET+R7Tc1MozTQWmYfgsRp6Bzc=HKonO=Uq1h6Nzgw@mail.gmail.com>
 <Z6XWVU6ZTCIl3jnc@casper.infradead.org> <03eb13ad-03a2-4982-9545-0a5506e043d0@suse.cz>
In-Reply-To: <03eb13ad-03a2-4982-9545-0a5506e043d0@suse.cz>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 7 Feb 2025 11:43:11 +0100
X-Gm-Features: AWEUYZlIBtfn2RHJWB88UL-DRtlyctc8WdFktH0eXJTCByl5CkmXjOsWS504hvk
Message-ID: <CAJfpegtvy0N8dNK-jY1W-LX=TyGQxQTxHkgNJjFbWADUmzb6xA@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] Crash with Bad page state for FUSE/Flatpak
 related applications since v6.13
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Matthew Wilcox <willy@infradead.org>, Christian Heusel <christian@heusel.eu>, 
	Josef Bacik <josef@toxicpanda.com>, Miklos Szeredi <mszeredi@redhat.com>, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	Joanne Koong <joannelkoong@gmail.com>, linux-mm <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Feb 2025 at 11:25, Vlastimil Babka <vbabka@suse.cz> wrote:

> Could be a use-after free of the page, which sets PG_lru again. The list
> corruptions in __rmqueue_pcplist also suggest some page manipulation after
> free. The -1 refcount suggests somebody was using the page while it was
> freed due to refcount dropping to 0 and then did a put_page()?

Can you suggest any debug options that could help pinpoint the offender?

Thanks,
Miklos
