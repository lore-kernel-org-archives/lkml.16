Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1E723D285
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 10:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747822172; cv=none; b=d9wdzz+yCca0zf9M03Dqf0ytcOAAGIG/lSjHoK0SNd0dRj4phnhY3QKMTqBYsbvwmuO5gCXVm3RwoYDLr3xe/dQZJKS6DyWotBpGCOdyTp2Nz6jsCysPU+sN3n2dWOdU5V9H/sLGO3zhp3zNN2RwQfbvnyir6kpRrDFJF4l8f4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747822172; c=relaxed/simple;
	bh=T2ohZniJWBi98PVxpm8ErkwXwbAvhGQujUtaKkLYYH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l4ojBSvanjaFEvCyornQx3nrswWRMBgHVqyDOZf7ACNlENiDCIHUq6pozxEm4voqlH/w7G27h06M18fE7Zsu0oh+woqhel5cnCZYogAu09xZOCH+404p0+fs7bUj2WgZ5man0kB0MN5KyiRtsK+9D89jku7wrBfQXM8OBbbucLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omnibond.com; spf=pass smtp.mailfrom=omnibond.com; dkim=pass (2048-bit key) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b=IjDzG+Dk; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omnibond.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omnibond.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b="IjDzG+Dk"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b26f5f47ba1so3270908a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 03:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=omnibond-com.20230601.gappssmtp.com; s=20230601; t=1747822169; x=1748426969; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QYGknq2XTmKqZ9GVMDYnnP5431Y08W1eWrL73PlrmDQ=;
        b=IjDzG+DkhkWIOAF0mvkcvdLqQsTtX9XN/BNRwiKdhp72NpstjGYvy8iiYiP07/tT0E
         AhiUcA1SPIRi8p4htxlxZZiTw+GDF82MzDoAvjm1KtZS7q4n/uTAuVdnvOUyi4dP18VU
         3s4yWjB8qU+PqzJxq5w78FreNTLDy3CJ/WDM1mQbAga4yNMb/8X4QdV5sX/N2isl0OiS
         jDNUYs0CoDeE+0EexqocgXYf5m+DgVEx18UThBNV6jztjDrl66ixnbEHZYK6d4/tR6rJ
         DWykcVcPbAI3wIjnAw1nVh3FTQqLVY6mHNe+aGc9BT3esY+vvS4B8Bd68E0pX9T2BQr2
         MhyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747822169; x=1748426969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QYGknq2XTmKqZ9GVMDYnnP5431Y08W1eWrL73PlrmDQ=;
        b=HPIdRQcJwyhHk6VB4GQyDSqqQQEg2MMYpRn9czAGo+FC6b0R9f0j+oot/PAbGfQIKF
         V+RWf3c/4Q/WGFZriT5rxunMIG3Nd9MxhkW6MzjmvpBj/p2nfc0WTV+4jYq+bRH+xQve
         36BiNsl28vNCD/8vE5sQBprzyJPBc9Pf3fl9MQDpTcsSBvZ+y/F035NaN+3fmy3g6o8t
         3Ql8KlpBeXaoT2arscKPJuw67V31Jbj2IQP6nqrqirKJ8HChul4hsiPB8DKTYK5Yp9pU
         YKXZJLiVFzkYmT4gsubpGyTcBXfyOB0fsVgcdmlFK9CD9AjHPSar3TTJEht8Mx856ESl
         PN7A==
X-Gm-Message-State: AOJu0YyeGhaUAd0Lgn4F1ifHrChfOC/dO/4V5WOuR9ECZyZa56/znchB
	Ph4aPCl+OPaNYIrTLdjsOs2x67zO3tgNfmCI7kRURhE1GIMUSx96RZLiaBYpAgwOWkOUAowjeuq
	v9Z1hSJrgcu9Z8FAi49pTZdwcXy7y/PK/D8wngo6M
X-Gm-Gg: ASbGncuTpEVO2zKr1p04xoih1wBRR1zt0eHTT8CopOWbfVpsVTATNhS++kSndXdoayT
	xFr4/pkQloyqD8S20dJW2jHPashwPWu8auXX9CRV4JZyCh0zwpl5U+VNukRfUspUusJmfzjVPzO
	Eer5+GRG92AWclQPxKEvRwXkllYDyc1T/xHKncI//nTvYL
X-Google-Smtp-Source: AGHT+IHxaq57x4qvgJ09saZBZQthjkNcpgYB/gaf0cvHhyJ/IV0TqlMsd6tqs8OeJATTJ07pkvn5esWsPDCQY49Kk84=
X-Received: by 2002:a17:903:11c6:b0:21f:7880:8472 with SMTP id
 d9443c01a7336-231de370156mr298025245ad.35.1747822169450; Wed, 21 May 2025
 03:09:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521075357.0e34ded8@canb.auug.org.au>
In-Reply-To: <20250521075357.0e34ded8@canb.auug.org.au>
From: Mike Marshall <hubcap@omnibond.com>
Date: Wed, 21 May 2025 06:09:18 -0400
X-Gm-Features: AX0GCFu4Vg0xRrfR2zj0EthKnbD8HeN7pz2lAAiEnN1jZW6HflKtoS-jmJ8jA7I
Message-ID: <CAOg9mSRCmCY6zSDGwFz=+XDvJQcwe6k7s27h5uabqD4A0592Cg@mail.gmail.com>
Subject: Re: linux-next: duplicate patch in the orangefs tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mike Marshall <hubcap@omnibond.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stephen... I asked for one of my patches to be
pulled early because of a regression... I'll get the
extra commit out of my regular linux-next tree today...

-Mike Marshall

On Tue, May 20, 2025 at 5:54=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> The following commit is also in Linus Torvalds' tree as a different commi=
t
> (but the same patch):
>
>   ddaa7202a930 ("orangefs: adjust counting code to recover from 665575cf"=
)
>
> This is commit
>
>   219bf6edd7ef ("orangefs: adjust counting code to recover from 665575cf"=
)
>
> in Linus' tree.
>
> --
> Cheers,
> Stephen Rothwell
