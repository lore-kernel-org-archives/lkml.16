Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516F02F4321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 05:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749792313; cv=none; b=Yygs3Suh4pqTbzijnEiPVabT8qrlktaNOvijfXghCi6e8Y164wB28GsvZuiKZ+gz/QkSk13CDw7/2bq3dGLKAShdSsnShRQtpjnkhtJ5xLfpAS93UXUOMbOyIjPCd/0BVeh1swwUjnr21z1pRVnx04h6kJdvAZL69peTqdrorMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749792313; c=relaxed/simple;
	bh=LqGi/GVuiJuKzx6sAg0njNn+GQDScv8Mw1vCnScSIEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pij2bLtQEPaMB9RgYnFF0A42vawzcORCnaSKDVEtjT16Lu8dTU5kQjD/+wab0mI7YA201JcHsHyPZ0r7aEn3LzvdDHxaVNGw0MuYnRgVnaAXKgS5AjByc25LA5iUkioxCuzHDPUtUBnD1OqyVhmpsFCd6911kb8GZKjRcskACzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oz2BrUn1; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oz2BrUn1"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-74865da80c4so1131736b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 22:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749792312; x=1750397112; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SGSmVyn8JVOsse5Q+wWmIXSSI7N5bPKSTxyET9kQl64=;
        b=Oz2BrUn10NvZgT2RAQAB19+e6Y2N13A+JfoqBDpFPuI4OawAJc8ip/1gi6LUqU8vTy
         OUekozdKw6FBCEJRcq7ZTjJM7ILJqds/DBPsuQR85DxTwGItEOFY465Ch6uuOVBuI4IW
         CLDojUN1F54OnMjmXu+qI0F+8s17WwvLqOPzLEZqssisW6tf5lxy3wg1F6f3f8FFHaes
         OGHqwE3OPH7cyGKMVVTBsuVBIUIcyUrHUTnrOIKOz6UipkH7g+G4S5yWZwud9YYdv/tD
         K9CyMP1SghkOvlqqaZpeAVb7sfj4FBT74J4RnKy2NfJmYHvPskrZnxz0rtIDqJ9CE+MO
         E7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749792312; x=1750397112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGSmVyn8JVOsse5Q+wWmIXSSI7N5bPKSTxyET9kQl64=;
        b=CA/6uNSTQ86azTcQHSNWcss9BPz4H1iCD9U//pUU3zIwoVUGNyynys0IuYGooQwNLU
         ajE6KeJhNK4SjAknRVxfBDJQVWqLFx/YE8wUm7bBkUOd9Sagmqd2dCezZXP8Why2hiD8
         LbMDOBc0BEj6uc5QKtOO2zcoYgGSDfA6+//CeV1lmjm9aoflVL3THio1/OmE2q/8Wv20
         3FN2qClg1GX9AYBZBCbUbM233wMbIWpQ9pBwU9SFDZ6LAqiB5UKNoV7NOOhN0GRTaqXr
         V1eFN0bMLUVuGLL8kxPkBtCkoY3ThebQWloW2tVm5IP+jjnQorkL+y6xdInu/mGOY1ZY
         NQ4g==
X-Forwarded-Encrypted: i=1; AJvYcCVkfIUhqJVDZz9pVfZrDEsKeo3EgaQ2OOyU//j3s+GbqwdW+udV2xJ/H9KYvn3AC8dQSPInI6/FFoo0l5s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqJY3ke5+UN6h5XWvGIJTCoFV54vv9vNVUYeT5LK2O9FXU7G7f
	NnQRly53Bfk/jAP2dymTF4A3xS0A4Fm9ImsFD7rUsaLHw1KU9lZV3LfC
X-Gm-Gg: ASbGnct9jloVapCHGUg9makaa/K4VC5INdJDB+MnNchrt7WCdmClIwjLlYjk9B3rrTE
	NMR+1W4qjltTk19+lcT5rre9pfyNPR4mOdQcm78+haIGHNzVwUObJCuiQf9Hc4wq/n/L09K2YfP
	GFZWww8qU1sH705ajMQsZYx4ubIHFgivNV0UOEx/Z9J3iBYZ0WVc1rUoeuZl4uUvLxRpopr3K1l
	7cCbhGeQYjgoYECY4UeXL0m76AWqUy2B2vhr3GgJGGrhs2iteUz8nRClYjgQJ2GGGDz4qWEtK1w
	lpREbiNel5e1NEZD171w+o+zq1BYLFkcOup6m1KKGt/yuY7WX23Bf9IUgQcqauXw+RrMRrq1Eq5
	K+LI=
X-Google-Smtp-Source: AGHT+IF/woDHkJ4tnpyarFqr6T68PWGIh6rQiQMAvWFFF+F0teh1Jdkz9fJ+Q3BPpThuQbP9fTiKTw==
X-Received: by 2002:a05:6a00:3cd2:b0:742:aecc:c46d with SMTP id d2e1a72fcca58-7488f6e7e26mr2383065b3a.5.1749792311676;
        Thu, 12 Jun 2025 22:25:11 -0700 (PDT)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:f20f:da05:7371:bb5c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d24c6sm699177b3a.168.2025.06.12.22.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 22:25:11 -0700 (PDT)
Date: Fri, 13 Jun 2025 13:25:07 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: John Stultz <jstultz@google.com>, tglx@linutronix.de, sboyd@kernel.org,
	linux-kernel@vger.kernel.org, jserv@ccns.ncku.edu.tw,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] clocksource: Utilize cpumask_next_wrap() to shrink code
 size
Message-ID: <aEu2M2jyU3wbviVc@vaxr-BM6660-BM6360>
References: <20250611104506.2270561-1-richard120310@gmail.com>
 <CANDhNCoJ_MmpEfyuL+JWav+NUfQDH3dm196JSE-Mv3QrPUzi3g@mail.gmail.com>
 <aEnTSuVy2Aq8jRk8@yury>
 <aEqFoNGGu3eOKBEL@vaxr-BM6660-BM6360>
 <aErzPhCYGLqOdlTe@yury>
 <aEuzgmClrimyc0RY@yury>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEuzgmClrimyc0RY@yury>

On Fri, Jun 13, 2025 at 01:13:38AM -0400, Yury Norov wrote:
> > > > > I think Yury submitted the same change here recently:
> > > > >   https://lore.kernel.org/lkml/20250607141106.563924-3-yury.norov@gmail.com/
> > > > > 
> > > > > Though, I think he has another iteration needed as Thomas had feedback
> > > > > on the subject line.
> > > > > 
> > > > > The bloat-o-meter data is a nice inclusion here!
> > > > > 
> > > > > Yury: Would you be open to adapting I Hsin Cheng's commit message into
> > > > > yours and adding them as co-author via the Co-developed-by: tag?
> > > > > (Assuming I Hsin Cheng agrees - See
> > > > > Documentation/process/submitting-patches.rst for how to do this
> > > > > properly).
> > > > 
> > > > Yeah, bloat-o-meter report is good enough to add co-developed-by tag.
> > > > I Hsin, do you agree?
> > > 
> > > Sure thing, so do I need to apply the tag myself or we'll follow Yury's
> > > patch work?
> > 
> > I'll send v2 and include your results.
> 
> John, FYI.
> 
> I Hsing submitted another patch that duplicates this series. You're in
> CC, but just in case:
> 
> https://lore.kernel.org/all/20250613033447.3531709-1-richard120310@gmail.com/
> 
> I think it's pretty disgusting. I will not make him co-author, and
> will not give any credit for this work.
> 
> Thanks,
> Yury

I'm really sorry for this, I really didn't notice others have already
send the patches.

I didn't mean to copy others work on purpose, I am very sorry.

Thanks,
I Hsin Cheng.
