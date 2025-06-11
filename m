Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC84DF49
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 07:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749626148; cv=none; b=t5W9cz9+s7EOzWjml3CHJJDiSe8OE3MnEmF8gSOE2G1zP34iN/7I3nTqlyAsZ0/fiCr7sZFk5pttnn/0k6KsTUu75Srupbn63ANeLvAuoM/20lvjzoAfq8D/PdqAFAr16p50sRhnTbF7rhKzkQZnVNATlbatBlYKNAUQz1XU/nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749626148; c=relaxed/simple;
	bh=bDw8lv6DNJsD9dchwMOlh8L211qeg1CfzJ2PVT3ZHbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jo+GiNhnXIq+65OBCsDhHg8oJOQePzF7G5y3mFZd/EW0VDgaGPm5EPdm1KmsH6cX9VXjZYHjavk1ZO44P9szMDPDHjhdA7yRm8jPXH+e2i74ypjVBTyV3UcRh0BhhzpjjWJy7Jb4KUSjMjD39mmldDwvH8wKOBWyvqwm05Qvmqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=EDsOoTdy; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="EDsOoTdy"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e7d9d480e6cso4592099276.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 00:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1749626146; x=1750230946; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDw8lv6DNJsD9dchwMOlh8L211qeg1CfzJ2PVT3ZHbE=;
        b=EDsOoTdywA3JGa2AL/9SYg8S0Nw+LIhDt0sx3uS/47ZQqersfDsCkjptM/GxIOX+RZ
         P60q0CV7Yn29/sQ0VY6JOr5rrpZIA85lQqHw9pGmpvLxrkjDXuHzzVlbs5re7vezhLlH
         g3JAoyI+oDwQTVKThlcdzkb0hNcSUKV9SNVgcBp4A0rT5QtbTFAWMJt+6q6f0rYzaUmE
         qwD+sjtxzQu0vRw117E7aqJmcC2Q2EeDYq15EnloyxXaojhg+OpVxnHnnVnPyMEWB3N7
         CH/lpRzOdrTnro3oTM3b2RdlKuzyKOYWpNcCU0vL9fRrS9ykx0BUiAzuAZrZmfnCqnn7
         zFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749626146; x=1750230946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bDw8lv6DNJsD9dchwMOlh8L211qeg1CfzJ2PVT3ZHbE=;
        b=wgm6Dcig2jZbcnyEuYkXzdD/jlz1BYnanQ2DANDuUFFKGq5Wpm6wkBXPS8ScXpjfZz
         3Q2GO2SSp47rxgK0N+8RlGT9NAZJNvRHvz+cLfkhBSZ/8I5pzKbG1yl6Y5Ex4vbmNwx2
         ZL2B+dGl9Nt4x7dMT0M+ffQYfb7dINStqUlx9ojrxovnOMTt8128UWYcdykymSrtdTE1
         n0EBbsabL+e4+gDUe/1PGnQnpEAz0qbvbBkmpTU/6nENF1xQgo49kunUvGnracyXvPzj
         M2YWaFMSOaBViEihf+NSmd1E1KWRSxx9ueQeLUytOMUCEOCDQImG486FTMIY2f7boQ87
         AXmw==
X-Forwarded-Encrypted: i=1; AJvYcCXOuGQ+/OVqI7dsYj3G8PBoicoy0RcFwsWx2MKPhkDb2hsmnpC/dRvuTPHAVBb72a5AUYxGtUVqeGylHMQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdBqQqSpxA9u08AXQnhP946gkoKM7V+fXz5AqYql1jrLoKBfnQ
	tIlYfBQbDG1UXKbBH7qNhD6i+3mKrFlZCFwmfCxHclVobRtrdG7HbzD/RxVl8L5YDK8swe83CZZ
	MtIrlzL6qfCVsg6NAR+8urUmqG103zKLMzc28CDlrE2453a/rMOYeZ9o=
X-Gm-Gg: ASbGncvevhfE/XQRGcQHB+ca5WKDDyFYKQDt/n0K8DKFiCsTQjZyTfJq/skiD5wA83x
	Ez3kffeW4DSeOOrlEEILtCFq38+NqYmBXbtsGTfMZXT5/oP3AumBo77eO1ZrZOnI7BYxJ6DLLCg
	WNrhHoZvQxRITV5+1csUuxEPDA6RDAaffkq29VspVn2fAnlw==
X-Google-Smtp-Source: AGHT+IEc+9hppzJUUw3dhryHx4clVFd5aDegC77U3+FbbfhX2RUu0BijR2nlmCbtsFlav7Da7Y/c1YmFqqH/eQyJEGw=
X-Received: by 2002:a05:6902:2191:b0:e78:eb00:babc with SMTP id
 3f1490d57ef6-e81fd9b2f22mr3224045276.26.1749626145882; Wed, 11 Jun 2025
 00:15:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611031023.28769-1-nick.hu@sifive.com> <20250611031023.28769-2-nick.hu@sifive.com>
 <9c429671-8409-4911-8559-73a069d66964@kernel.org>
In-Reply-To: <9c429671-8409-4911-8559-73a069d66964@kernel.org>
From: Nick Hu <nick.hu@sifive.com>
Date: Wed, 11 Jun 2025 15:15:34 +0800
X-Gm-Features: AX0GCFt836Lo7RPXBqlCX9ju9k05WYmV2JoCwZYZlclqH9DiOrcuiHuFOhx2tAw
Message-ID: <CAKddAkAyvRdAz9X_rCGgfdxD0Z_Q7sAt8e5nuJe7=s7G-Y3+AQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: power: Add SiFive Domain Management controllers
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, Cyan Yang <cyan.yang@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 2:57=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 11/06/2025 05:10, Nick Hu wrote:
> > SiFive Domain Management controller includes the following components
> > - SiFive Tile Management Controller
> > - SiFive Cluster Management Controller
> > - SiFive Core Complex Management Controller
> >
> > These controllers control the clock and power domain of the
> > corresponding domain.
> >
> > However, Since we don't have a SoC specific compatible string yet, so
> > add '- {}' for the first entry [1][2].
>
>
> But you must have Soc specific compatible strings. See previous discussio=
n.
>
Maybe I'm missing something, but since we don't have a SoC-specific compati=
ble
string yet, I thought we agreed to include a `- {}` as the first
entry, along with an
explanation in both the commit message and comments [1].

Links:
- [1] https://lore.kernel.org/linux-riscv/c91d99c9-0ecb-4dcd-9beb-5a1e9fadc=
619@kernel.org/

> Best regards,
> Krzysztof
