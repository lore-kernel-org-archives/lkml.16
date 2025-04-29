Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0BB2C10BB
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745928120; cv=none; b=iJUnJaxngk5X0jzaqaw/FA/QBvYNtJ+tokkxpaLi5rueIMWF6fgcDoEt/rNzC+lEBwICSpcCEMhZKSDCrOP6eh+BH1zEAOKRGZMoAXE3GboOJp36Z9GC9ymvQFDymk9Q6R/slf+qZpuaVVylyR3xrVc/Fg2Dcta8TTqdqCwbrgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745928120; c=relaxed/simple;
	bh=ao1pG8xhYeDrlKtgpmsWKo/niLkQ0arUYilf/2iWnFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BbNEzA+LH5LVioKFC/yPoWpw5SB6A2IXz2WdRh/T0hDfzshjuCUJm+xnuokOd5GEUeic6u53ZpwAoBXKfvrZzHKjHnqrBUVmsQuGNGcQu0gFz/Guzlx/UC29jYKKamX4THsz+RPBhRPgx8MXYez9l1pPe0E2KzRdDCwWhT+Xkao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=Z6huD7J2; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="Z6huD7J2"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-476f4e9cf92so43563701cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 05:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1745928116; x=1746532916; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U2C+WyWVVVa2JqNDp2AeRXzuWB0J/pFCLydODe/2Eyw=;
        b=Z6huD7J2DjLq4W3OQ4gAUeLOK82VVD4MtnWmI/d3+m6cWLyGzQRLbYn/qWWJ2iWgac
         AQF50X/ZFhaznz0Bwr1dCHpVRsFrlHcIL/eizTlg4qwt5AlFXCuJBTowILiurN8CGmIB
         ZA8Wem5pbSkLJ7Wq8Pg9sSappa/vUne5cTLT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745928116; x=1746532916;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U2C+WyWVVVa2JqNDp2AeRXzuWB0J/pFCLydODe/2Eyw=;
        b=B8KCtclUWd1LgL/HzMn+ZwifbjbHde2UztFuvcTGkH9k6myNk9OWYyK2SEBWFh7jfP
         CjyMV0Sp1avGdw1HlofEyTJ3ro0ILHZ8u1e8b5gGQJy2a7n3SvviF+o6x2m4E5uro/kz
         FYyiUOJ6lnfw7csz//Kq4gqkcTSw0SIxmTQRREuzdWp8QFkQDCIiNNi47for1la343Tn
         h5MrGngvgGHl+ZtsBmBluOdHDFhgklxL5zAigpmctpHoUvmTUXuHooFfaR2nSx5LwJw4
         NUlElvuilgQsxF5H5v7NfYz+BOJUd0Vwh2BK3a9rSc5ucM7INdau8Y1QsWD7qwnyDTqZ
         wk9w==
X-Forwarded-Encrypted: i=1; AJvYcCWbgD+hq+GBy6Q9p3254KhWUh58wqXuu1Yx4drVheUIc2eKLZCvCLGL5bkZa2iiClGp17ctbB1gnNXMKs8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIJNYa0KRTuUDXikqg1HCn9H9TE3uGnkEv0mm+aOBW3NtmSYUJ
	tGgEbgnRlg//lZyPRXYpjVOlDa17ltS/GGNKecoshlFyGc8dcXPiXCjPBvRrD+S8JESA5AWQDsA
	3vvN9dJx7LHSAcXkKRjWCj1ss7C/Vg6w6gKM40g==
X-Gm-Gg: ASbGncvj2L6wk5+1Kbde89VgAAG2Xk0BgFmw+fahXqNFXDrwKdwT+qnxhBQohLp5UPi
	72rBLGUaZSMGEAqLNYtymt3tDelaaBrUTs5MUeIxtEHhvUt2V/4S8BDYehgkgqFgBomi9riTa1w
	NOH/DA1SSBbq7SOBjP08anufRgHqsOrVSMHDU=
X-Google-Smtp-Source: AGHT+IHtR0+JbnanHFoFNW3uUELpcVbTzvD1m3twXqQrhYcmg7AR+mplyFjKirXIjZYvLUyB55nqkepgR4/GRIsTmWI=
X-Received: by 2002:a05:622a:4814:b0:476:b078:c41c with SMTP id
 d75a77b69052e-48815b5675bmr58341191cf.35.1745928116035; Tue, 29 Apr 2025
 05:01:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429001308.370040-1-wangzhaolong1@huawei.com>
In-Reply-To: <20250429001308.370040-1-wangzhaolong1@huawei.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 29 Apr 2025 14:01:43 +0200
X-Gm-Features: ATxdqUGwOSTF8hneO_shhAQGO5y9ZfnMLfqdtkQss91tvFlxelq0oMRW3_Ijdm4
Message-ID: <CAJfpegvKvHwU69F0wazk_TyrKPCcrcVU+Z+5=UNpg29CJGH84w@mail.gmail.com>
Subject: Re: [PATCH] overlayfs: fix potential NULL pointer dereferences in
 file handle code
To: Wang Zhaolong <wangzhaolong1@huawei.com>
Cc: amir73il@gmail.com, linux-unionfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, yi.zhang@huawei.com, yangerkun@huawei.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Apr 2025 at 02:13, Wang Zhaolong <wangzhaolong1@huawei.com> wrote:
>
> Several locations in overlayfs file handle code fail to check if a file
> handle pointer is NULL before accessing its members. A NULL file handle
> can occur when the lower filesystem doesn't support export operations,
> as seen in ovl_get_origin_fh() which explicitly returns NULL in this case.

Have you tried to trigger these conditions?

If you find a bug by code inspection, try to recreate it, by that you
can also verify that the patch works.  If you cannot reproduce it, at
least prove that triggering the bug is possible.

Without a proof the patch may turn out to do nothing at best and
introduce new bugs at worst.

>
> The following locations are vulnerable to NULL pointer dereference:
>
> 1. ovl_set_origin_fh() accesses fh->buf without checking if fh is NULL

Hint: fh->buf is equivalent to &fh->buf in this case, the latter
obviously not being a dereference.

> 2. ovl_verify_fh() uses fh->fb members without NULL check
> 3. ovl_get_index_name_fh() accesses fh->fb.len without NULL check

These are called in the "index=on" case, which verifies at mount time
that all layers support file handles.

Thanks,
Miklos
