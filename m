Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0893A2BF014
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 01:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750122030; cv=none; b=C6ZDw3wd9GA659xAnhGM1J348dyue4QjPlOpqV/Nsyb21vxraZIYvwBvYd3Tk9WnPrHvYvOYsGLCzIyMh02dGSTA9/18pN+FQUOudkclQSk63Y9O9l2Y7CRUQUjYeV6jCpoYaGMFI/VTTdtfAlXZstPWVLfrqBSlRnfnhjwmDc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750122030; c=relaxed/simple;
	bh=rCJZ6Rqv6x39AZNnhWIkJ3xXooq3Nkcuhlj6QT7sXAA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KzZqH0gr4OpW9rxxFX/9NcL6s1Aw1Me++lwmKpJZJBSCJMNPvPUYWl7V4GArKjo71HnlkLkEqfSjt3+8GlqYKFlgi9qIvbZvWgzeEfc3l3VHDScl8KWAg1V4IHOmpZuD+Iocx2xfngjG3oyswQH+OPopFRa4Nz+BvlPY4daUTC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZOBjTVJY; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZOBjTVJY"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3ddd1a3e659so33715ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 18:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750122028; x=1750726828; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCJZ6Rqv6x39AZNnhWIkJ3xXooq3Nkcuhlj6QT7sXAA=;
        b=ZOBjTVJYaXSTy46DDAMVCLH/cCXuqN3wlM1MQOpCtG/5aoSgoC8BNqKy1VdO0Gu1Dt
         NYn3N1cTC5liNF3KupGuTcup/GRaNj1E029gZhgOASIxdvziRmm/zQRpxDzHRo5m8M7M
         Oufm4Bk8feJpqWRjdp8/ecIbtU3K81wr1hnHFec1Z06zrsgXJeigPQ8BWECxQ+71gTud
         f0CAuZ8uD58rQ0gKhP+v0PDNoJmdmvTSbXexhLDLJyaAwNg0y2Du3HiHkx3fir53k9OF
         g4LheQvhP5BNZVyEvp/lIgcUolY3J/6prUdf1scUNLrrU6oFIUgA8+zIJ1iEjr94V5EN
         a75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750122028; x=1750726828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rCJZ6Rqv6x39AZNnhWIkJ3xXooq3Nkcuhlj6QT7sXAA=;
        b=uO82pjVY3/M2Z5S87tFXOa0V14P9pvAfLAXkjzWVx5ltqH/bsNuHkqNngZhTZKgKAV
         i8IVkXMALKONlhZfecM36HySD+sbXoVgBIYpMXusDIBWTdVkhQaPwBUw3FzFgahf85MH
         /XIjkLT1n2EOU/DiahlOCN7BBs0GWdAdDqfzw5X/ljWWwfBeuK2rYba9WmtqOTnvPWIt
         fxjPPbTF+MtkG7jTGV6SZ+f8RAcjN39AaLvHUpdBBkIEuT5gvwd03X1bmLkkDJCDfyR1
         IrTW/FriWRnj5Pcu568Qi3bsclr3AxGXwsmeo9dra4CDUMmBpYjkZMdy/PNSOohUGxKj
         E9Mw==
X-Forwarded-Encrypted: i=1; AJvYcCV0haVUf6WF6egpBTj9tJR9ZR0OQ9qz9YSIIOYQexSuE2+/poUMXQNCW/MMe+Rkkua9vrBUoW6m7L/o03Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8ypxlBtlBpz0YHxldeBXLyZqXHSh/uF5Maki4ZDlTTYp3AF82
	yCMgkdqsQ1TEHa1StR8apafiIsX/1qCoir3hg78eusElB/bRg5CZ8SRO6W+IrxxTn9+c411WIHw
	+wr8ZN7lF3Yi7X+83YswueJzUCaZMqDoiY1VWV71C
X-Gm-Gg: ASbGncudrl6IbVQjzidrc6TgweCvb6MW8gBXN0uaugPpp2Ieal/BXxoRF37ve5auHwx
	2/rCtJyHC2NkcIrVkT40PvZyKTl61io6cmFZMnfBFo6bYLvbeWNyG3Ifq+XF9mVXFpu9+NxPbzD
	Mc++OLKz/0pBjeeGJMh3RLPbV6tM3jozxXlniJW7ED3GgOZhVm+LqZbS1tcj79fWw7JQTp2z4=
X-Google-Smtp-Source: AGHT+IFWGG1GvEPulDx+6oNJ7f9HQRdMOh99zpdWks3kbOikvI4fMesxkMc8GTdGuC3PYyPK0BdP8LykZjEQ8Q2gM3I=
X-Received: by 2002:a05:6e02:378b:b0:3dc:7e19:fcc4 with SMTP id
 e9e14a558f8ab-3de08d958aemr8594435ab.8.1750122027976; Mon, 16 Jun 2025
 18:00:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250614044133.660848-1-ebiggers@kernel.org> <20250614044133.660848-2-ebiggers@kernel.org>
 <CAP-5=fXLCAN_8PpPRYcLpLXG0oPDqGMzn8VwuxPdg63+zFNTUQ@mail.gmail.com> <20250616011353.GA58711@sol>
In-Reply-To: <20250616011353.GA58711@sol>
From: Ian Rogers <irogers@google.com>
Date: Mon, 16 Jun 2025 18:00:16 -0700
X-Gm-Features: AX0GCFuoBbLWShxHQk1-i-SRmkr0kDu5TzkmagUdaARsIve2zgwyVQ68YjUwUV8
Message-ID: <CAP-5=fUA-AvH29tS25P3-C4U9Wbou931P+A-K=yTpULdxcaRbA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] perf build: enable -fno-strict-aliasing
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Liang Kan <kan.liang@linux.intel.com>, 
	Yuzhuo Jing <yuzhuo@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 15, 2025 at 6:14=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> As far as I know, the packed struct method of doing unaligned memory acce=
sses is
> obsolete these days, and memcpy() generates the desired code on all suppo=
rted
> architectures and compilers.

Thanks Eric, I sent:
https://lore.kernel.org/lkml/20250617005800.1410112-1-irogers@google.com/
let's see how it goes.

Thanks,
Ian
