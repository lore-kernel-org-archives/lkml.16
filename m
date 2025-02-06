Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D952253F0
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 12:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738844822; cv=none; b=pLXaU6mwisJnwTuGObzlTs52zczJlrlgZe20QnMbs4B5GXUZF51SAe0jVwv9G5xJCNUbXu9ZO0DJJ7vI1qa8SuNr1dS+zaBPRqLb9BJqv/5MkoQVMnBoKb0haAqQEci7Ft01jYon2931W6rrW6v6kGn1kdEeYxxpmmcr1Xu6mA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738844822; c=relaxed/simple;
	bh=FmVuyo7J1UIS37hmHDk2aCaFQ1BM1miP6doTc/aUOIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fVMCFSDSGSReFBa3aZ57C1IzYXizyyGxRvN8jFtm3SlS7YxPMapp5plIGx3CSF/ZTZQ0pHtSGPKXU6kOKvZ/Ui8WBrRXrf9Ute4gkCNYHvn0uK2lEXMlway0HrK3/HZIyzYIG/oLE/9uhYwDhFrhBQHW0sEBJhCJjXpgEZx42GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AaOb8QeC; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AaOb8QeC"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2f9e415fa42so1384029a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 04:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738844820; x=1739449620; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aYbODeMThtwO7AzFjGUKnV2FNIfB0WdLU2NQSNL7YFM=;
        b=AaOb8QeCQwPoaR8NaS2Luz50t4xPqyZ2aglCY2ljULf2S8X9ZkJPM287q3uk5X2mcV
         tY0ulaAHsh7PkYUWiaGnYTMge6tVAS67r83K45Q6sRzQPgl9PMyVSmeSSwREgMLm6EHw
         Zbsyaq5Ru+spilGjmKecIDoxAbTE3G4iU15e4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738844820; x=1739449620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aYbODeMThtwO7AzFjGUKnV2FNIfB0WdLU2NQSNL7YFM=;
        b=UJ7UVwC+7Uvf3zSFLFwF6RfOi4cVqw2+d3dti313nphrVzkBxKxgeNGij7oBLIT//d
         dWyr2SoUbXlojyT5E4ErSFMsFzXCWKaCG6XzRSYp/RgD4ovW8I14Ih76LqsGenhU2ZUw
         h9CIn4PjRhg772Pkw/POuDlGY8X3eo9R9/o2zgmYSzEImfnNpqrBTyFcozVUAcKWAakE
         6qOIYpG68wBaTsRCjRwNA+I1nfHqhjglKN32ojavVz3hk25MLD4vluIz2Vb49TKGn4k4
         8TXVV6A/8oAUXpeUEmOnjhj2vYCK+Wa9HKX8Sa22Bp/sdJQqDNvT3QWrsP2bYfs+47Ic
         RdCw==
X-Forwarded-Encrypted: i=1; AJvYcCXlFTBQiQGco7aNjaWo6RiLWR1mH7x0mOQQhM3MSUxHknXkWl87u8tV4BuQyCCE/+KjfDSA+jahd8bJbMk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+zyCaho3zUDYctU8H3mbeazRutSLK5HswQoMRszCsu58Zn1SW
	F75wXtwyBDxLCaHbvIe5mgacX+8ykryADjMPq3w35Bd3BLHXENmGUmOVA/cWhgDeXtP/rYozQOc
	=
X-Gm-Gg: ASbGncsziGSfpkKnPc7Vt3JFMP/Up7jm/WKEQoo/qHzW0ogEMmy2sk66JoiYBhqypP1
	u/GUluTx5gPl/mxA6MT13vUggUCBFeDfTU9R9l0Ueb/nTdCa6f2ArdGAa8F4tRYJjGV5N2UEEDt
	Khh/OB3DoH/HCFmTB4twUKGCJhVRAf1KDzY/MuSrqo7Hi/cBHzXAZ25vz1G5B4ADp14wUKruLT8
	Ugl6qJKzrPsaSNIeBy1JpP+7/AljaKL7RoOgTQ9TqU7PxWCPaILHSs5SMh4jG9IqeH6P96VLWyF
	txQCWbHpNGlFesp8Wl0=
X-Google-Smtp-Source: AGHT+IHIWWb5em+bk4M0TeqsHxcvcjMaUycRJYd5VLi014NtN85Amc4U/et0/hqOWXTssd8etg9Dcw==
X-Received: by 2002:a17:90b:3846:b0:2ea:a25d:3baa with SMTP id 98e67ed59e1d1-2f9e0753d70mr9559452a91.5.1738844819928;
        Thu, 06 Feb 2025 04:26:59 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:28ab:cea4:aa8a:127a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653c9a2sm11470325ad.77.2025.02.06.04.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 04:26:59 -0800 (PST)
Date: Thu, 6 Feb 2025 21:26:54 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Kairui Song <ryncsn@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 02/17] zram: do not use per-CPU compression streams
Message-ID: <ramywnizfouh7iimkcbvpzeevzdveljwcplyptvica4vsd6b4c@lfjfezhq6hwq>
References: <20250131090658.3386285-1-senozhatsky@chromium.org>
 <20250131090658.3386285-3-senozhatsky@chromium.org>
 <CAMgjq7BFUrUY5Xq5Eks4ibqbWgJcca1vqB4kq=otQVyG=23FRw@mail.gmail.com>
 <ryc3rgu567q44d3ck4un5itf77i2os4rqx3ruohivaqscn3rrt@ms5xoipyi72q>
 <Z6EuZPYy_OOKu8JC@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6EuZPYy_OOKu8JC@google.com>

On (25/02/03 21:00), Yosry Ahmed wrote:
> On Mon, Feb 03, 2025 at 12:49:42PM +0900, Sergey Senozhatsky wrote:
> > On (25/02/01 17:21), Kairui Song wrote:
> FWIW, I am not familiar at all with the zram code but zswap uses per-CPU
> acomp contexts with a mutex instead of a spinlock. So the task uses the
> context of the CPU that it started on, but it can be preempted or
> migrated and end up running on a different CPU.

Thank you for the idea.  We couldn't do that before (in zram), in a
number of cases per-CPU stream was taken from atomic context (under
zram table entry spinlock/bit-spinlock), but it's possible now
because entry lock is preemptible.
