Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294FD3B1AB;
	Sun, 29 Jun 2025 15:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751210020; cv=none; b=r6drBvGwxMo/QK6BGEC67jiRHECMVVJeHwiIe3PYZLkisiNpM4cexBhIu1z2sNG2nD0OO657/zS4rY5M1irwE89IvZW4YZnHFBZ+2kKbnFvxtkMIUtTY/ABwXAZYgJkCtf5ashFfn27Ky2Y0KWLqzKpC1Jy5efeNBrgnaGF+eMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751210020; c=relaxed/simple;
	bh=puuaFMMUUQZayupB208GrC8wHDP70K8r1qLFo0hCy44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kc3jmozPCjhSJLpy4QyqDo5s1etHSmCMhmc1wYcOSwfRbp2Q9uWG4cInGnsPgsrsWzxIwSmd9opIdsTgT6/XgMhAYGp0LRWhoPo9vcQbt6xwK+bZDmaMaH/vgBgjlPANkp/sya9c3eHOHco9Iyqh4jaEJ8po5nxl1IG63wfdcuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O7DHikXS; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O7DHikXS"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-31308f52248so478479a91.2;
        Sun, 29 Jun 2025 08:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751210018; x=1751814818; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RgmyvxKM5K1SUPLpkkPFsKb6VHLC7vsaSec08opdFHc=;
        b=O7DHikXSl1uPzShJZhMZAAHmCezmCTXzc+JOIDdTgNL80WLZ/2lS1l+4XyHrXCQ+y7
         WgZRLtz26FloMO60qX3y8UxZGJo7AOvw/xoGEqBA58JD0G+odSabhFg+kXfBngqCJxQl
         +FEY4O4gJRHDQpbovWdWxuan49H0cuDmw8UcZd/jpQBc7SdB4VtZCWFBjL85HMsSwo4u
         AP6+hIrYdLFPmqPI46kDVQCblPzHUf0wxmWBVBeEKsJErWp8Wlzn0V3vk+iXeByfVAIN
         vdtewx3HzSJl3pQL6iqp0ufaivU7n5R9c85+4AQzfh1vveFza6JSAoRcAGAV5pOHDafs
         6uNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751210018; x=1751814818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RgmyvxKM5K1SUPLpkkPFsKb6VHLC7vsaSec08opdFHc=;
        b=gTZBWsrysK3J+l9hjyhQgp4QkbolPQW0aN7T94KExfnLgPzkey8T/y+SUkqNlQSDk5
         PXlbX2lXqD60t1sf7a4+9U/xochXgJMqEUZYI5teEDn4VR5aJNvSqCzV0GCoQi4DyWkT
         5Ouo8bzeAC2g3UckKboZZ1Firm+AHMRKpHEiB7RDkJnUq4BcZfz7P96stw0djJM8JaSd
         ESUgeQCBCNr9yCm55tY1BHxtMAq23RSITLWPuF1K2wWksLC3R17EAs8W278ffa5TfNBY
         L0S04y9wGnq7OteaibJ4QdpanML4JNrtu+Gtxgj/4f+RaX4gH8a+qQrO6HAWrESyp+9C
         /wCQ==
X-Forwarded-Encrypted: i=1; AJvYcCU83aLezWUPGu6ku+Pkc+A9r9xw/SD+n6OEWj0hT4FQmbC0V501eHv3165ew9j5gF2bOkkaBYxyvMDrXrA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgxZguF65fkldXRv2yEUMzz/+8cIS/pqxwE1hnp4iBCjKQ1gC5
	vmAQFvNePYINucfeETlKhjTfuUlDl63P2GQzqLA2M5NfqbEjuiPia7alVb+i2eGrgVxDs63K2JS
	6L8mGhZR2wvcfN9JO0EwwlfYkV9KhdAw=
X-Gm-Gg: ASbGncvri5k6ABePDAJXweVtB91Eo1dQ8D/SzoibNZBcc6X8qXMLfxS+wu2PHWQz5z9
	i+HlFDVHHPbTRd6ps1Jo4kbI7j1OH0VeQ438sSLf1b4yxn9x8wuRK1EGihb/KVauapsKvR7qjaV
	f6+affxnYIYG8yMZ8zYhMWb5Y/UpEt0kI7vq6QGdwmERs=
X-Google-Smtp-Source: AGHT+IHl0Y8PLE0jKrn6aDF786kOcVr720VChpxwDzRKCoyBbhlUlrsDDt/qgR2D6e5xW/FpLcbEbsoeD/NSJMk+5hQ=
X-Received: by 2002:a17:90b:5105:b0:312:25dd:1c8a with SMTP id
 98e67ed59e1d1-318ec31b3dfmr3419352a91.2.1751210018354; Sun, 29 Jun 2025
 08:13:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJLqYhqwyX36mV3kpkcMkGB7_giE-kugfVVt=duWOVJyGbNDkA@mail.gmail.com>
In-Reply-To: <CAJLqYhqwyX36mV3kpkcMkGB7_giE-kugfVVt=duWOVJyGbNDkA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 29 Jun 2025 17:13:26 +0200
X-Gm-Features: Ac12FXy7Zt2gJwhhkEhlJqVHAnqtnLJZf5PMbNbCxCUJXMSOLOy9sMn_YEZfhgE
Message-ID: <CANiq72my84mx2Zwsteae14X+7L+WEZowsU9dh57t8b+cduJ4yg@mail.gmail.com>
Subject: Re: [PATCH] rust: helpers: sort includes alphabetically
To: Krikera <prafulrai522@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 29, 2025 at 4:28=E2=80=AFPM Krikera <prafulrai522@gmail.com> wr=
ote:
>
> Signed-off-by: krikera <prafulrai522@gmail.com>

Thanks for the patch!

Is krikera a "known identity" according to the DCO?

    https://docs.kernel.org/process/submitting-patches.html#developer-s-cer=
tificate-of-origin-1-1

Cheers,
Miguel
