Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3C13C26
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 00:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749773196; cv=none; b=DeiTioQ2O+Y0OX44KL7HdJxc/5yyD1Crdh/LTUXSqLWJNKVYDrGJZOPbqDJYlc8znrw8HXeO67ET03h/7SpCGg77361HdH2LDkrPs2nvE6G6Tf8S8MCGVQzN2j1djxBk5tyoQ6FoofPu8a+WuYRQNeJG6/NohwqGV6svq3ig6zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749773196; c=relaxed/simple;
	bh=ZLUVLq6ZMae4ILViuvnXnlaNGnyYVL5EvQU2zGv7KHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HolFiR51ZTiiHqflW8lwlBCffP6BvdZSgcU8IemOSCqZJePZG70XJ5nYj7/ZeJGjGYukTwgEzQkBbs2/q9zlTHnpv2UmYBLquRQd+CxYAjHd9NhGG8DyXtRGKizeBdatg9EoHmvGtkLkKU2PWOdikSyaGlysVjK/mP6Is8Nod/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J5Jp7sia; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J5Jp7sia"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5534edc646dso1608938e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 17:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749773193; x=1750377993; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLUVLq6ZMae4ILViuvnXnlaNGnyYVL5EvQU2zGv7KHU=;
        b=J5Jp7sia5WTG2/LVu3RsY5FnuGoJDgKrN2rYWPZk4U6/BkobOxpCTEQwtL3Wfq2/ns
         AtQZJWtbDLpYxDyEhNErKQ3gwAS0Y2HlnkTjDft1FDZHwHSehX2vkRv+vecZxNVc44sg
         bMi8A3M7mpvKU+FC2upKtAyf4Qw+6Qxhdn2JTqFZl7WQiSI+BmwYPwDmW2w+Np8JUv86
         +4YiR4aGZqqA1qIFHZhQSRU4lxlRUAJQXRy5TrPerFJ4aFLegoFkYl8rZ1FuC7jRKfne
         EBayOBtymFCQlcJcBeFpKKkf1XkPIV8FQ4DUcQ65awBQ3tVD01T0fLlsnbpqqG4jWC5H
         Y43A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749773193; x=1750377993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZLUVLq6ZMae4ILViuvnXnlaNGnyYVL5EvQU2zGv7KHU=;
        b=VxXFFqRyniLPqg/BXn+WPQCXut4DQFOW+Ckb8tg13UzKRO8JnGlay3+1Pjn5M/nsAw
         Xlxx5N1zoXDO/mVNv/8uvvhhej2E8P0rARIAsCLoq3eNLeesgJ5fofiJ00SibJLhXMff
         U16POynM3rjqpKoqtngJMkU/rE6hLESpDQVChXkYESQc85OfkIQe5Jw2A0ZEg9LQybkf
         GPQY/pI0wAP+VZi8t8Eykp1C/sNMc4EGJ9o2RiQWpctaFCF5EaxiQtZkle4kH0ijGKaC
         qrQIrtHcqgj40sA2cirVVfbKO+9hOXqRam3PtmSUyndZnqPUJDH1lKgb5JBwvLgEeiWr
         EAoQ==
X-Gm-Message-State: AOJu0YxsBmXcGDEeI7JHMa+rrfjfeCPeWCDjPMfQpAy1adI7alUlqcf6
	ZcOHMe8jSJHwlQDp+UJblbPgKzVwHf0GAxraSmmqpAeajLokvP0n75OpOfq9UhBaQGVj1D68jFA
	7VRCyzcce/ghdVyGSlDNJzErDRTTT46qnCdEkjp/tapAbRy3Enn58U8g=
X-Gm-Gg: ASbGnctTIiwki8Js00BCkmwTlJuXlJYDG5z7b5zDXsWF+NfXyaSlb3XPF5MsM5L3Wj/
	tG8hzOY1Uj4EdTYCZQPUR+Ib0Slsr0HQ5PP82JwOnRqJ7URSEI6G0YxSVcKF8bRHBap7lhg2eId
	Yz68uEm3Hi/0F/SX+f5HqNPPTWBKyx/rI1zVYusN1GWn/9K0209Ku/pNmQDsOfyFx8ST0d6X2F
X-Google-Smtp-Source: AGHT+IHrEg+ybJdcpWZWIVUBLy8G0/MTjrY27t22H91RsC9IYefq0lqnA7Sz5zwnWvTkvn7s+HRj380Nj1zbba7qjA4=
X-Received: by 2002:a05:6512:3d8d:b0:553:28f1:66ec with SMTP id
 2adb3069b0e04-553af990214mr235784e87.31.1749773193289; Thu, 12 Jun 2025
 17:06:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519082042.742926976@linutronix.de> <20250519083025.905800695@linutronix.de>
In-Reply-To: <20250519083025.905800695@linutronix.de>
From: John Stultz <jstultz@google.com>
Date: Thu, 12 Jun 2025 17:06:21 -0700
X-Gm-Features: AX0GCFt5aLTih3d6dZUnHL1BbMpxOZ5rYd3fDRpWeoi6bk5px2yuSvTUdeBo7Uo
Message-ID: <CANDhNCqSbz39AN5Pp_1+YzW4jgO-089=L5WzgBrb077KTz4LYw@mail.gmail.com>
Subject: Re: [patch V2 05/26] time: Introduce auxiliary POSIX clocks
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org, 
	Richard Cochran <richardcochran@gmail.com>, Christopher Hall <christopher.s.hall@intel.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Miroslav Lichvar <mlichvar@redhat.com>, Werner Abt <werner.abt@meinberg-usa.com>, 
	David Woodhouse <dwmw2@infradead.org>, Stephen Boyd <sboyd@kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Kurt Kanzenbach <kurt@linutronix.de>, Nam Cao <namcao@linutronix.de>, 
	Antoine Tenart <atenart@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 1:33=E2=80=AFAM Thomas Gleixner <tglx@linutronix.de=
> wrote:
>
> From: Anna-Maria Behnsen <anna-maria@linutronix.de>
>
> To support auxiliary timekeeping and the related user space interfaces,
> it's required to define a clock ID range for them.
>
> Reserve 8 auxiliary clock IDs after the regular timekeeping clock ID spac=
e.
>
> This is the maximum number of auxiliary clocks the kernel can support. Th=
e actual
> number of supported clocks depends obviously on the presence of related d=
evices
> and might be constraint by the available VDSO space.
>
> Add the corresponding timekeeper IDs as well.
>
> Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: John Stultz <jstultz@google.com>

thanks
-john
