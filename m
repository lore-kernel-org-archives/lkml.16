Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C56C2192F5
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 14:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744207630; cv=none; b=PeldaVnIDJyB2eNi6rnwUUaDdSSY0LSBrg40h7jIjBCKusviu6XDsUaqujXYHF3EqszjSWjzJ3fm60UgWyvaijeW2U8GkT3iArZ5Mc3cRdhpWqBCizbbzD4D98j4zZ78WcXV99LP2+FfYGAWBNOJpS75ZrKAPMp3bnffXY3vxX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744207630; c=relaxed/simple;
	bh=PqduoJbYDtzqUC58ESv/YEoJVbnqv595vRc7J7Cqtps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 Cc:Content-Type; b=b6gFz0oqPL6iQCiNAOezrrA8StLvZI7D+gj91b9nUVHo50AqrXtyRo+fPjTmvsPw03DWMe9cLUb/XsZskDkX403Eo8OMKd5WL7bqb/i3MJcwvxFeAC0yo84scttI/GANSB9ZMrk9mu/F8HkfSWloxCOX3XaGcFDHzqbWKLGcAEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nluz7D5m; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nluz7D5m"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-52413efd0d3so2954921e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 07:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744207627; x=1744812427; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PqduoJbYDtzqUC58ESv/YEoJVbnqv595vRc7J7Cqtps=;
        b=Nluz7D5m/eF123QASuYRrpNCh5cWD77cD29eLMmJG8v67lMjGfPvpAdgKcGO48EfG6
         yV0qHNRaZBWsucb+Q1z4TPkI1XGHp9j7CP1L+kAGEwM2Mov6qc9KKYFbdc2ioaNqgmiD
         Y3WBilOlgrJWXEVan+eRUtlI3HsRJzMqEkuCPDti1f+G8l8AUpzphT3eMPOcGBY9k072
         TJAWM/2DimLcJvOgza4p17zJY8igvagFr4ZgZdyktWjA4Hn0evzWeDilHtR8te2/RAhU
         6zN8K0zLadr97rEwr+gL+sXGN/Gttn9/hS/LMZSxJrGaDR/pKVKRFVwIer+07bUbnAZR
         1XdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744207627; x=1744812427;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PqduoJbYDtzqUC58ESv/YEoJVbnqv595vRc7J7Cqtps=;
        b=OQL6lkyDiAp0wtPt8vCHSv0V0FrdOl/lPHFRdJpqiVrbylOnym7pS51mNC3+8l2uQu
         ENZmQiG/4/2AWbmYtliM7vGzG+2ybcvhKRRYVBW+Bkd0MEzxXx1bZM9w+VlRIK2xGpjm
         ZaA9XFAWe9U/w4auGNs+l45AwLXWjA4C8Nv27YczO0GjwdnYuwOqEfew/0dy4SFGQgMC
         yB4t446x3+iEtzkCgxoSvtJsdEBcMSsQ7uO0c46P0IWFAWGQqBI3+celYFLhBHa7FfsG
         v/aYb4/PjL4QH4C33RPrCI2NKIN2xH46pkWF1LN2nK18nnergpaH2BSFPetj3cqcsgHw
         Cocw==
X-Forwarded-Encrypted: i=1; AJvYcCVsRyjjEZcFg+jOPeL5Oae14qJPg52WKcxdHTkxc9FCG3ab+qv4mmL9YuDU8J2TbNdbT+5s/X5naB/IUrI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM8PNw0z4oetYMXEmGWNEZxDb3JVhGgk0If+/2G5rJX9ufLamR
	StAilV2PBB5TEOi7RyByL6idlXXRauM8yNwmnqeAK6IQXZ7izzNm2Gzr0mqbTwaTzrzEx5/NOwZ
	rgNqwDK4oXqbAVP9pdx1hPWgbybg=
X-Gm-Gg: ASbGncvCX4UqhGvkLow9AeXcW1ex4EJfKTm+b8+ejHEGJM0GCkKRZUmYBQeaO01hCBq
	KcpBY/wuAHIIZZNx6vW1HpZomszZX2b5EKuQbKTqOgkW6NJms9T08nPZWD3svwwARjaAQaxD/3t
	KfFCvwWEcE/1pBe/CHDV+ECDOD
X-Received: by 2002:a05:6122:6588:b0:51f:4154:c1b2 with SMTP id
 71dfb90a1353d-527a9cc8fc0mt1747773e0c.2.1744207627185; Wed, 09 Apr 2025
 07:07:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z/PyMXTjCHduOhKX@HP-650> <CAHp75VdtUhUBL5d103RunY5EvgmTQVH48S21N1-1KmDM0q44Aw@mail.gmail.com>
In-Reply-To: <CAHp75VdtUhUBL5d103RunY5EvgmTQVH48S21N1-1KmDM0q44Aw@mail.gmail.com>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Wed, 9 Apr 2025 15:06:58 +0100
X-Gm-Features: ATxdqUHsbnK795wVxw9QVhafe2Y6kUO7YKAlKUo58tUZnSRiPWCXFv7dunVORH4
Message-ID: <CADYq+fbbA+K6qsPSa73s94+Whe-_gZ0-ZquYjyx0S4RXFq1W-A@mail.gmail.com>
Subject: Re: [PATCH v5] staging: rtl8723bs: Use % 4096u instead of & 0xfff
Cc: gregkh@linuxfoundation.org, julia.lawall@inria.fr, 
	outreachy@lists.linux.dev, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, david.laight.linux@gmail.com, andy@kernel.org, 
	dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 5:17=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Apr 7, 2025 at 6:54=E2=80=AFPM Abraham Samuel Adekunle
> <abrahamadekunle50@gmail.com> wrote:
> >
> > The sequence number is constrained to a range of [0, 4095], which
> > is a total of 4096 values. The bitmask operation using `& 0xfff` is
> > used to perform this wrap-around. While this is functionally correct,
> > it obscures the intended semantic of a 4096-based wrap.
> >
> > Using a modulo operation `% 4096u` makes the wrap-around logic
> > explicit and easier to understand. It clearly signals that the
> > sequence number cycles through a range of 4096 values.
> > It also makes the code robust against potential changes of the 4096
> > upper limit, especially when it becomes a non power of 2 value while
> > the AND(&) works solely for power of 2 values.
> >
> ...
>
> Besides that I haven't found in the changelog if you have looked at
> the entire driver code and checked that all usages of this field is
> done in the same / similar way and no need to convert anything more
> that these.

I have found more cases using a small Coccinelle semantic patch.
There were also cases in the media driver, but I did not touch those since =
it is
not allowed for an outreachy applicant.
I will send a patchset soon.

Thanks
Adekunle
