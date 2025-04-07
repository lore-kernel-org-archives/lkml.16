Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAAE221DAB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 06:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744007551; cv=none; b=JbkzK0huLJU0tCdZBO/tcWUPLctAlxRLKrjmXTFU9n3FRd2KZhvCSKOTDJpZ+BWD/t6btrcItaQKg5bJLg/BuqZtVQlseQW/5wyn1UQyUFeqa6Ul7QkjUtTizsWdQ1kd5mIRIEhelmQ5Ky+ysp98ZZQFTnS6xryXBmkIYoXCQiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744007551; c=relaxed/simple;
	bh=oblhWxgwN0vg6hjBPTixU+LjIBwj2tbuN66nuPJZqEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ohb1u1KijC7NTFKtB+A7GO2SNV1yKNoMai3+2XdTM5sKC24qQkBvAc+nICRQWafpFSM2OQdJ30CLd3wBaQ6+pJrH21Ci+ILUow0tMdNEmNbWlEl2LF1m1kPzfRX3cpvhV6oSb3x9F9koidnUFKw5Se4nVFTzQLEARzkF9u+91w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XlhYMmlj; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XlhYMmlj"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5242f137a1eso1638748e0c.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 23:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744007548; x=1744612348; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAsH6xyP+BlqJ30TbZINVs3gH4R48kHTKbHXFCB8J1w=;
        b=XlhYMmljmI5VLAYB6kEGhGTeLw+xmRqvLgopmjT/PnSO4h/70cOU22Zzaq/PCDPqAK
         d98Xy+LjLqKRQ0jZ6ze+uIvQbLihgfurqUOp20TShos886c+P3+9lW4vBMC8ReFUmYB7
         Ids03CdwBFzm9seiNbQckB16ZcZylkp/RIxZZtLV5+OfKq1ZnTES55K1X+jZyNaMnkj8
         AAGRc0CyOIkAX8DkqBq8zapetmcAMRAomrZoXYx8fX6LE9o0Zw7MHXY5OQ/IxBtjT4/Y
         UcvsxiSPjaVaIFu0KzX2zIu7srCCQXtED429kr6o0vxF09JY9JFOnA3Bqv3v1gjN0Wdb
         ubMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744007548; x=1744612348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OAsH6xyP+BlqJ30TbZINVs3gH4R48kHTKbHXFCB8J1w=;
        b=swtdf3EZUXQ33Zkkib8wwtT4QE84fJnvOdwBfsrRUNYHKGWuMEE3nsQERe5N+RaHgk
         +0sqC5czrIDplqyGbb+hZF03w8cS0A20VxYIK6OfBTXwa4Xemykb+nsQFK8mlbNdSgWn
         nL+y0lnY/xaqeewRezlHjkvbB8gvFvPLFs3sWu0l1fpygtqcY3gtzmuu7b8Xb7pzun9g
         l3LzHQY5LtQ2vSLCa5UCxlqtkXKJn/TOdkOZTKe9X0N3lJiozBPl5oOXXTbANE998I3b
         JCsA6eK9ECMxGIgNkjzZJMsqaweern1Gpr9xTcRkDzy/+07mZj8Zhzw/Q+enLrICU6Om
         8BIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHtDUIXEcUWNgi3zK5vL5yErZEmvqYJZW3tcTuGYsKh1wqdMEbSx8HxSfxJwynUiOdzRkszQN6haTpa2I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrqXnYifsAiAXq+nQjRTKL/Wbs6Ho/feJr1sjH+/fbjCFrDpCm
	klxSNd/ltjyT+JAkl1/M8pgIV89Hi838FQHs1qShJfb0uPEDSME29IWwmWr5SmJzY8ShgmPWFuX
	vvNQijOAsJi25CCU+IciRTplFMcQ=
X-Gm-Gg: ASbGncvSzreWEHvTtLI3Lmt8+VKBnjqzKFOPR7UdgcCUoZb4Q41MVK3+H/ved86wz2p
	poMMCG5j3OmJnv29IEQG6dKdIS5CN2hl1pQalsEJe0NEJRtJVDWYi39Ez1Fvl5LIvsIn/hsWgyH
	Ur53ejjRa0B6f7M3f+jVZckSzs0n5yaPASj2DpWw==
X-Google-Smtp-Source: AGHT+IHs9ScGvj4OWEx4v3durvZDgeZiAiY8aul09WdPxrtj1Sd4XcK36me3zb0C/0zjPSYv6v57tKmF/FzwQVIxNQU=
X-Received: by 2002:a05:6122:f09:b0:527:67db:9cb2 with SMTP id
 71dfb90a1353d-52767db9cfamr7378492e0c.4.1744007548058; Sun, 06 Apr 2025
 23:32:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z/McCdceSpyL2A2p@ubuntu> <2025040719-utter-hydrant-b241@gregkh>
In-Reply-To: <2025040719-utter-hydrant-b241@gregkh>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Mon, 7 Apr 2025 07:32:18 +0100
X-Gm-Features: ATxdqUHlpQO0oh2sTMnp5Q5lmbaJmnkyhUOvFly-RL_CnRtc-y1iO9UEAGk3jdw
Message-ID: <CADYq+fZzzJTEvhbO9y=i2DA7fH_99ofcG-PZHP_7LR1pyhympA@mail.gmail.com>
Subject: Re: [PATCH v3] staging: rtl8723bs: Use % 4096u instead of & 0xfff
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev, andy@kernel.org, 
	dan.carpenter@linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 6:10=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Apr 07, 2025 at 12:27:53AM +0000, Abraham Samuel Adekunle wrote:
> > The sequence number is constrained to a range of [0, 4095], which
> > is a total of 4096 values. The bitmask operation using `0xfff` is
> > used to perform this wrap-around. While this is functionally correct,
> > it obscures the intended semantic of a 4096-based wrap.
> >
> > Using a modulo operation with `4096u` makes the wrap-around logic
> > explicit and easier to understand. It clearly signals that the sequence
> > number cycles though a range of 4096 values.
> >
> > The use of `4096u` also guarantees that the modulo operation is perform=
ed
> > with unsigned arithmetic, preventing potential issues with signed types=
.
> >
> > Suggested-by: Andy Shevchenko <andy@kernel.org>
> > David Laight <david.laight.linux@gmail.com>
> >
> > Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
> > ---
> > Changes in v2:
> >       - Changed the commit message to a more descriptive message which
> >       makes it clear why the patch does the change.
> >       - Changed the subject title to include `4096u` to show that an un=
signed
> >       module is used.
> > Changes in v1:
> >       - Added more patch recipients.
> >
> >  drivers/staging/rtl8723bs/core/rtw_xmit.c | 6 +++---
>
> Any specific reason you did not include the staging mailing list like
> scripts/get_maintainers.pl asks you to?

Thank you, Greg.
I have sent an updated patch.

Adekunle
