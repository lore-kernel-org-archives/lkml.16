Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4668C23C8D3
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 21:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744146252; cv=none; b=sV8BJ6UV97z71dg2rQLxq/JAHpqVOMD0ucSw/0WyQbI0gA1Yzwk1r05eoiqF2Hyx0Uo7miQl4aYPeYvG+a1uXK886npwD3sIzjJ8g8VdK9VFanBGcviP8CwqAR7rqdTxLNw5VJKXd9AmwQF0oDBQUXGkONItGbSnYc4fapKiV8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744146252; c=relaxed/simple;
	bh=nOhZRNfUVpq/cNGVu6ihTvvzz0Z/Et5J7mOf/q5xEtE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oet69Y4kHPUdonKWq3H+Yv6LRssretysNcChSIgYS851xwAa7fjWWJjKP0fMB4OgC84LGXqLBmqyR2KuMGHHWb3EaH1PUCbmXbYvdsbnA/ORUTgYDfywwg4xx/ce+axtcTZA73pB1eAjcsJtMOGQ3Byu1TySu4o544MS0IC5XYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kNm84h9o; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kNm84h9o"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5259331b31eso2845037e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 14:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744146250; x=1744751050; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOhZRNfUVpq/cNGVu6ihTvvzz0Z/Et5J7mOf/q5xEtE=;
        b=kNm84h9odD5QyTyvIkr6DDISD0HshsjnibHlulwC7rPGVAFGZdTAe2NzLB7jCTfexb
         3m2OSmwOALOngPpVW6sMRZ5+gAM3BnzLh8tFLCloRnLMCLyLFcd/+JnDxAgNgpHVW+3Y
         M4nxhbk7ciK0sgpDXe+vjFf/VuXylZHPx622k2DOUNqa91IVUEWdMUwhRAT6YKo/QWQ+
         zgw1+Tb7YW8wLkYalzCFguIRcv9WDAhw2J1O6vPYcWtyFgLk/HRG8LHt65FHLX3btg72
         trpTdv2ePSrTYVyGt+Tdav/T7hM7din4qCTQC49CHay4I6E0SfvFCLVBnRVngSq4q1QZ
         Iruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744146250; x=1744751050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOhZRNfUVpq/cNGVu6ihTvvzz0Z/Et5J7mOf/q5xEtE=;
        b=F5uyrQ1IvZk/PJseIqvKMVY+MDccx4qAewsG97PFLm2kTVjZFy/2tKe6caLAeKVcVP
         xjyR558gYwMB4vszmV4f2RHZiZj1iM0BSQJvmek5nYj0fYabWdzs2PYLHjBbsRr69MkL
         VAt89ou/OAXcH+UogpIx9kwMx4bmpzaNUQm7ywd77/QB8/LpE86qMgdlbq0x/EamtYBu
         oSASEb+WRELm52kGrVw/3PXgx6IhI4AJn/fI8lq2TsGOve5Qmg4zvASbx0CgjzriGcCw
         gZSAxJJzMnaYYITj1LrPf4ei5TA2sbtI25zjAst+VIqCNt0QlGKpq+Re+p4Dn+xq2f3l
         r1cQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsoqCu88+KOpU8yf8j4eT9iV3Xl/3o6OIMQKwzMC9s64rQC34wblm4zj/LGF+fTHuxaa18JgYldIeFLy4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8PSkwbMcbkU9f5QB2mJYpfwjwSZHlLc7PPAMkb+cV7t9WZiFR
	F2vtbk6pjaV8WhwK9A9uc2KSr1XYigWGhQilbcuBnm9f3/jJCCMniPiIle5DKMhCxFpZ71a3dU3
	ysj5OOSQtNlgrxcstX2yg7keoM+s=
X-Gm-Gg: ASbGncv+LcanHK2CQxy2rIRWOlG4yCbUBfr6M8dEFsRV95DEw8Fj5a5NUFmsDU66xDk
	WfYTpvXm12gENrhuSIPbXYaJG7eRvF/BgLl/MeRlTkN+RPH7tOxpXAfND76zvVp7h4V8bhEU2Az
	3HDk2LIkCCSDUtarntPDiABzok3M+1
X-Google-Smtp-Source: AGHT+IHSwCXizLtZV7QBBRd6X77VS19hoGOvi5qIAzv/QDy/1emcTcxElomM2yXG9r1ooAIJaTHNcizEJMwtjdGLeXg=
X-Received: by 2002:a05:6122:2205:b0:525:bf40:e628 with SMTP id
 71dfb90a1353d-527a9232b93mr428632e0c.6.1744146250128; Tue, 08 Apr 2025
 14:04:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1744126058.git.abrahamadekunle50@gmail.com> <Z_V70-9Bk-aZ914y@smile.fi.intel.com>
In-Reply-To: <Z_V70-9Bk-aZ914y@smile.fi.intel.com>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Tue, 8 Apr 2025 22:04:01 +0100
X-Gm-Features: ATxdqUFTqyzlTPM_qJevaC8MWGaUfHE0Wx7A07-A09KjJRRiYbrTf-cHJieKNAI
Message-ID: <CADYq+fanYZR1UNJVR0iapynQeXTVEe1xPMMJHXHHCGc-Sc3B_Q@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] staging: rtl8723bs: Improve readability and
 clarity of sequence number wrapping
To: Andy Shevchenko <andy@kernel.org>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 8:41=E2=80=AFPM Andy Shevchenko <andy@kernel.org> wr=
ote:
>
> On Tue, Apr 08, 2025 at 03:41:55PM +0000, Abraham Samuel Adekunle wrote:
> > The patchset adds spaces around binary operators, breaks long lines to =
enhance readability
> > and provides clarity on sequence number wrapping by using a modulo oper=
ation % 4096u, in
> > place of the bitwise AND(&) operation & 0xfff.
> > The patches are required to be applied in sequence.
>
> You missed my tags I gave in a previous review round.

Oh, I'm sorry I do not know how that works, please.
Am I supposed to add them to the commit message?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>
