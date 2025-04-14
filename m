Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4D8258CF6
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744616345; cv=none; b=Ya9wA68cLaZlQFSoA9yux7PAVkGFeJd0yyTsyg1l2yAlWePG6WfjAiXNn1ZfZUPgZoBvgy97nJ1cW0oN9bo11HO5hbi3z/PlW4rjnYPRcgz9jYm97vItRizKcK/s0h7G1Pd1/gGMbwJR8w7mgN7qfrf5egTEQQZWxPJzPC+M9Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744616345; c=relaxed/simple;
	bh=vRX4lPBBhSqLsj/nl5x+IlRfr1EccgtzdZwc6VAotbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YDNgNXJD0MP+2wK3Ov/sYS5u2tCAq27pYhIbboIfJz+zkTqUmOyDPKu7lF/gZ9BmjLBK7LPOT5Y2Kuf1LLsHAEiGzvF7KiyOsiLyFzOHJK0jMIHyOi1Mwc0z/oXLz0MByZCEe+B2nFeHAT0k7CjtoIAB4lh4bSrIyY8kobMJh8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0+HXcM/; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0+HXcM/"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-51eb1823a8eso1748810e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 00:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744616343; x=1745221143; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/z4nJEuqHuyUrFdt7zlS31Za3WCQlJE/qrLFA2Dn1yo=;
        b=C0+HXcM/7cRk1179iZ5Zb3cwnmgMWCEW1kwRqTxqhOEwGYVcpoh3KJnrMTJYvxIGQ7
         ovrdeEETsThTZkRf+FfqdI/WWhFBFKMDBNtnjhbLlerGC1BJw+H7GyMgmYGB/FkBu/EG
         75R1HLfcf7TSCW3yc+UGP4qX5WOKne9v2uvZLUKB1zveiHbrhOOtJCOesDT2UPtBjuUG
         8fFV7UZPFIYuOIkvnKaSEifeDq8FIqLiv9toJ5azgf8GjWCPoPfLySZJzmFgOcAxKosx
         ym9Lddl/mHt0pOUzZhge8eT/OikRcanbKB3X6MQxQ+cU/JXfRsdB4hU/OFWpfgc7U49A
         DrDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744616343; x=1745221143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/z4nJEuqHuyUrFdt7zlS31Za3WCQlJE/qrLFA2Dn1yo=;
        b=VkYrM0RWMv8xoh+8IduwL0RTFqtP10cslmbUtZ11qP3zGHLr7P/KAY9In4WoWQahca
         mNWSG27FfyEE246nHohHlbpaJjRaRchbunSoJ8ENoFPj6idr+3BbOQ5jG/gVXbNGeIg3
         Fe8UzMdJfgX5Nb/McW0lJ5zFVqv1x9F6kd9KE8BeSNlcIuqdJb82pHwaziNPlkTnn9e9
         ugmE57Rjf4jQA38EVAuFGYvSa6PqZl0UgGXtpYihMcHAVEhcg2Ttdnf2ToJkyrgtVVYN
         fqs3rBiJj/2UDr81sfkJik/3AAmz9bXU5HUrf5YoNU9/4Z7B0x8m0MPtd3TKwY+dZRIP
         YQ6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUs9qjdb2DWREDYlFWcuQTNh3HoYBvpyatrv0tQiN/a3XMfbpZlIrMYWmQwPY6bYwNRshn1SXD5VWQPdfo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/sgnXmIPvB5M8BO2ihyS+WiFPPwcx2YzoAi+IWupGJAAAk0Gp
	UJ3wSVOW6M7Cr5rcpKqQa3rED6sNC2Hed9mMdkEEW1SFytKZ+Uy0kgrsGNQ0ImiK/eVOBSVGOz9
	l1sLJz4P8dJJZcA8GuqXUELYWZC0=
X-Gm-Gg: ASbGncvCt9VfHCpBCm03RzvVGPT3InpF9KTO+tzmpe1hVUc/IecLxiDBxXG6HSQMe/3
	VcLfChFppWGP5WaEfx2ighkRaMI6nn1fnEFZgcrxr+LequYmai9M7LHTJkbPpSpAqv7/790JmG4
	54errpwTgB/m6is10hKFz7Fac=
X-Google-Smtp-Source: AGHT+IFdvo68lByhsQGJ+yQpLL+Zv3BA7pLibYHmDS7I9fwBd0wKSkpga5s6mS9FNHuP1yK0qZH2x9+K4MI4eA3urWM=
X-Received: by 2002:a05:6122:887:b0:524:2fe2:46ba with SMTP id
 71dfb90a1353d-527c35ec74amr7513304e0c.11.1744616342793; Mon, 14 Apr 2025
 00:39:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z/bA4tMF5uKLe55p@ubuntu> <2025041402-colonize-rocker-1db1@gregkh>
In-Reply-To: <2025041402-colonize-rocker-1db1@gregkh>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Mon, 14 Apr 2025 08:38:53 +0100
X-Gm-Features: ATxdqUGeEyod9zeh4I6bChImmbBoTpYytq4sq4D941FelSGmmAGI54ZczFSbCXk
Message-ID: <CADYq+fa18G25hfTeWTxwyxc+A=xHmk_je_9kjWbDdwbo0seaZQ@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: Replace `& 0xfff` with `% 4096u`
To: Greg KH <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	david.laight.linux@gmail.com, dan.carpenter@linaro.org, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2025 at 8:23=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Wed, Apr 09, 2025 at 06:48:02PM +0000, Abraham Samuel Adekunle wrote:
> > The sequence number is constrained to a range of [0, 4095], which
> > is a total of 4096 values. The bitmask operation using `& 0xfff` is
> > used to perform this wrap-around. While this is functionally correct,
> > it obscures the intended semantic of a 4096-based wrap.
> >
> > Using a modulo operation `% 4096u` makes the wrap-around logic
> > explicit and easier to understand. It clearly signals that the
> > sequence number cycles through a range of 4096 values.
> > It also makes the code robust against potential changes of the 4096
> > upper limit, especially when it becomes a non power-of-2 value while
> > the AND(&) works solely for power-of-2 values.
> >
> > The use of `% 4096u` also guarantees that the modulo operation is
> > performed with unsigned arithmetic, preventing potential issues with
> > the signed types.
> >
> > Found by Coccinelle.
> >
> > Suggested by Andy Shevchenko <andy@kernel.org>
> > Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
> > ---
> > Coccinelle semantic patch used to find cases:
> > @@
> > expression e;
> >
> > @@
> > * e & 0xfff
> >
> > To ensure this change does not affect the functional
> > behaviour, I compared the generated object files before and
> > after the change using the `cmp` which compares the two
> > object files byte by byte as shown below:
> >
> > $ make drivers/staging/rtl8723bs/core/rtw_xmit.o
> > $ cmp rtw_xmit_before.o rtw_xmit_after.o
> >
> > No differences were found in the output, confirming that the
> > change does not alter the compiled output.
>
> This is version 11, right?  What happened to the list of previous
> versions and what changed down here?
>
> confused,

Hello Greg,

I collapsed this patch to the previous patchset I had worked on that
made the same changes to the same driver.
So this patch was collapsed into PATCH v10, which is the last version
for this change.

The change log in "[PATCH v10 0/2] staging: rtl8723bs: Improve
readability and clarity of sequence number wrapping" explains this.
This patch was collapsed into patch 2 of this patchset.
Thanks

Adekunle.
