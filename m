Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0BF84A35
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745851576; cv=none; b=NnMvNtywbVd+M2fr3bhNpQMpKLAuBYAxyi55Cthrhi0b4uDs3aPWz4W2p0OENElCy+Ar4YDmxufIByLlSiN00I2oVE8/8Dvjjal8BdQiSAzK59CzWzQLdM0i6HPcZvz/6bSM1A1aXyfTQI+TzKjS8CHeSdUQINByXeykfBm6oYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745851576; c=relaxed/simple;
	bh=REEy6b10z80FpJq+c7VBu9J7y5yUHNB3/QON7VBOWJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CfnLaJiakQ90mePfT668fpwZouwZjZWuoa6xRqjGrUA0YdxrGBC296KC6KlrirBrfNEJKnNjBbcWiNNYoaYlNVIbuN9jGdzQ3Ob1+OlsbLW83rc4qWcbWcgMvyfSoJ2Iad41slcrkHuPPgIKpgcVTmq82+N8NtXZDYY/gsNJ00E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TkkXDPOj; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TkkXDPOj"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54d3ee30af1so4971183e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 07:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745851573; x=1746456373; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=REEy6b10z80FpJq+c7VBu9J7y5yUHNB3/QON7VBOWJo=;
        b=TkkXDPOj1fA9jk4Zs5OhpCaSwkEhu3pzmog8iNuOlA3POIuC5FcevreneL4oeIxahg
         RE8Q1jHt25p9sKJuswVzFdR+SaXUS1sjSf48wsTgByFcwrVIuXyqISiSpUb+lsfwlz1G
         pUhoimeTYSvy4/doKHWVE2DuaoNiQfPR/OT5oBkD/xLZQ1P57KVV+asz8bdGdKOKNH85
         tJB1+pdiWOPcBk1nIBD8RD9HdZ+PuuU0kkTafwpGECNfDj03zUdtr+R+PhzPNtRxAMY8
         7O2M8gIAT3CENEa7IkfUAxowhnO1CnptXLXtIu1LZ6qMJHARd/K5CibOowHPeKGZJINc
         Dq3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745851573; x=1746456373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=REEy6b10z80FpJq+c7VBu9J7y5yUHNB3/QON7VBOWJo=;
        b=BQiWHLnr+RQtKRlFnmoTzs6RBdigvdS9phQIGA9/jczONsS/QPyYODmzb/e8FiC/cO
         Hk1cylomNiX3k+uPiKuesPi80ws8xCO8ldViCa+oNL3a2m3ilBSu8tmJLxJgILecXdJU
         32+/PstfFxkpXWYb28uD5ThIla/q63bRcuV0tuVURUlpbOP/IPi4E0Dd5lNThKmfXc8s
         Q6oyvYnOmLoBBpQapWeRvq9Pcy2H6HyzlRofRxWuAqUCHDFyYWwXjomh0vWdrtQwMdf7
         DWFrUb2b3zoAYpXiqGaRQMtqcHt9gXKUfTkAVGxN3DHZaXtoo7p0BtK8Wz7nFstkTV5Y
         0Aqw==
X-Forwarded-Encrypted: i=1; AJvYcCU5jXJBJStDr/dKBkncTkTf8/lG8l60pvJ4OpMDP8IgSLN8BiUzrZ9o+OBuPa92pKLEmP4Z1tpLe4R7SPQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrbYGABKUK+VulaaKtmB/wG4Rn7wBoSH0PlxYh8Q6PZJHES2Yt
	U35PJqzzV+OFMlK3Xf64x0kO6MVRLoXqdROTZtD5t6fwwP99Hgk6lmv1nQCWidYu+NSdsOrrhDa
	4OgIOVA2VVcZeKxXKyXQrFwqOWM/JTPZUUs8t9A==
X-Gm-Gg: ASbGnctcYgFLqn0DJCX9WEOkJbSJ00jGnuoK1Ujf4X1Vm8uLlV0de8PArAljjGfNiuC
	KLtqX0KsjyxBAvM2C4DDkQm2gbj9WQlnJm+LcpYLn/QR+tPYYRk9bVRQhB4XtegY/PsPWrRwX79
	1Yye1diPBhoCMbZij4WB0tmw==
X-Google-Smtp-Source: AGHT+IFWNrvY2zhmFhQG3VtbUYY9jXh+oGkUXjhJfnL+1hK9N6b7ww8hmsko5k28gYHwQ3NKVlNFSCIpmpyiGZa1dOI=
X-Received: by 2002:a05:6512:b27:b0:545:1db5:f224 with SMTP id
 2adb3069b0e04-54e8ffbe01bmr2371285e87.11.1745851572916; Mon, 28 Apr 2025
 07:46:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250213130007.1418890-2-ruanjinjie@huawei.com> <20250320142612.396250-1-linus.walleij@linaro.org>
In-Reply-To: <20250320142612.396250-1-linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 28 Apr 2025 16:46:02 +0200
X-Gm-Features: ATxdqUGsQaqXShJ-EtsBmv3W1CufmpuxHhPZaYdywlnyB64XCFXLSvzLTFyW4v0
Message-ID: <CACRpkdZKaUtnv0HfTci1-_WekNkmJyNA3znx7cUgJW5NNDAYVg@mail.gmail.com>
Subject: Re: [PATCH -next v6 1/8] entry: Split generic entry into generic
 exception and syscall entry
To: tglx@linutronix.de
Cc: ruanjinjie@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	oleg@redhat.com, sstabellini@kernel.org, peterz@infradead.org, 
	luto@kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de, 
	paulmck@kernel.org, mingo@redhat.com, dietmar.eggemann@arm.com, 
	linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, 
	joey.gouly@arm.com, kevin.brodsky@arm.com, dave.martin@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Thu, Mar 20, 2025 at 3:26=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:

> > Currently CONFIG_GENERIC_ENTRY enables both the generic exception
> > entry logic and the generic syscall entry logic, which are otherwise
> > loosely coupled.
> >
> > Introduce separate config options for these so that archtiectures can
> > select the two independently. This will make it easier for
> > architectures to migrate to generic entry code.
> >
> > Suggested-by: Mark Rutland <mark.rutland@arm.com>
> > Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>
> If the generic entry maintainer (hi Thomas) thinks this patch is
> OK it would be nice to have it applied because it will also make
> the ARM32 transition to generic entry easier as we can work on
> exception and syscall entry each in isolation.
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

Do you think this patch is something you could queue on some
tip branch for v6.16?

I don't know if either arm64 or arm32 is going anywhere with
generic entry for v6.16, but having this in-tree makes it easier
to split the task going forward. We can always pull it into some
branch or just wait for v6.16-rc1 to get this patch under our
patch stacks.

Yours,
Linus Walleij
