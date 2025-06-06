Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3BF2356B8
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 07:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749196251; cv=none; b=ta9cHPvRMWHelrZwbhUxT0qVuSq+KNnaTTzGcMpL55umlMxVihwjCdczjaHVa/E85wSv9gb58BskYOK19h+EF1Ti6POO25jDGhQiIQHMzGWAvXiDqKojvWw0TZAVmj4KyIoNzv73JrGdqJCdkRZLKHFgveGq0JOfQV3vFUzXqkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749196251; c=relaxed/simple;
	bh=wPoBJxhkcFhcU1dhyc7aep8kuC84kUm5vq3DmgKJjwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i1vs2OkGZpIhdIeUupsBN7tcqIuDYxmLznBw1Tu3A702mXHgcVUSWdscdSUavnSd/tQ0p0b/2grP3T8vOozjpHIAV1iD6FmGoVFihzFiaXvE9VBuSGGfl0GeLz1yq/qU0RuG92ZqDvjZdPpB2+DqHxJk6tiikzsbmc0Wx09574E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Lno+lJX8; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Lno+lJX8"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5534edc6493so2188594e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 00:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749196247; x=1749801047; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rm4T5ss5l6d5YD6Na8dlxdY8BKrMjQHyc2yVXx42+4w=;
        b=Lno+lJX8WqJR+mzXAc5AGTxJUjEoAaFEPVXyvQGDidocvtFCUJdAPuIaz57V6+nvA9
         YEbvPLN/g8PHUapmW8JcNIaXJQeBD287qC9hEF+1v9EULlM4lkhcV71GNTfYPZ7iJGwg
         kSVIBqL5imCO/8sn75cF8urdO1BsYJSnk1jvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749196247; x=1749801047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rm4T5ss5l6d5YD6Na8dlxdY8BKrMjQHyc2yVXx42+4w=;
        b=Cc9BXiudgWg8mf04/Kwa6YG9l1OemAKK4ddysg8gVRRbT5BeGJaMsUAdtmtWpCFUmB
         Ni6Ux21EHXK/oOtmklQtTZmKCyLLYf0CwcYOWWnla2/ktJX+OH5BezPtMDF98HbW36fY
         PFXnwCWVnHi8/Y8qMBpLeDC/KjJfgoPbu1DKn0eqXH3EbcL3eBW4nfUZtP7JUWSb6fj6
         B/vZMHjjzVrdrCHUNIOCRZekbDcrNXYzHiBe9Y9wFQKOkf67YcTdmvUZF0xYEupgBKlK
         tk+lt4QnZoRXI0Y/FIZTnO4DdjT/RHT06/if7fKsXejZDaEHkyMhAG2E0cQaKnNVQMz7
         WYxA==
X-Forwarded-Encrypted: i=1; AJvYcCVE+2HGP/NHg5skKyAgU3VEUdp6IuoN5QHetrI8wbCBLOE9cz3meMd1hAmIa/0LNnKM5unSFJeZaEEYauE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEUH+SxrCNnxI33tIyetWu0fWxC6u7VYyzLuwB95SgkXhktFqj
	J5Uaz31viMzxyQ4YDmpE1faVdlEHWQMPly/1gI8J51uq9J85ONVbU5jvPsNrOKvgWu3adUXSkej
	zlfdx8M72SAGT/S7nNbQtxmPnGDFRNlvKFjUbNttbyPadaCnP4cE=
X-Gm-Gg: ASbGnctRiTVt1ykqRDeC01L+DGnchddJ04WBBrGosxdcvAPh1Fq2wLv6QLMXHqX95bQ
	dBMo1hSz0D7M1PdHBL125uMNB9AcKtIwj+3e7fQ0GvwpBenbFGG27iyqfNHpV9e7YtjSDfQqDCW
	YMlYT5VwStAlLym4lpCFW+2QqaWu/++2g4JJKQQr/8MgASc830fn96N2vulGyoBNcMKlTvH3g=
X-Google-Smtp-Source: AGHT+IFbKR4s9CitEfgNJcsl0QhC9Vk4xSWEUHEwXIP7bIcoci9LebkzJqucGfI4/l4+Z99afgP92CHraRrtTZAdj/I=
X-Received: by 2002:a2e:b8d6:0:b0:32a:8846:9776 with SMTP id
 38308e7fff4ca-32ae70d541bmr2192651fa.22.1749196234912; Fri, 06 Jun 2025
 00:50:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250421101248.426929-1-wenst@chromium.org> <20250421101248.426929-2-wenst@chromium.org>
 <CAD=FV=XLonF5qM+f6diESvnqAHKm4Y7wwPsNssdNqZfkn2OzSw@mail.gmail.com>
In-Reply-To: <CAD=FV=XLonF5qM+f6diESvnqAHKm4Y7wwPsNssdNqZfkn2OzSw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 6 Jun 2025 15:50:23 +0800
X-Gm-Features: AX0GCFt9WzCgD2IIEFQ5utFqrLWuXwM5tZhCHvVXVAvSJ22GZSGtAIfEBPnfCtQ
Message-ID: <CAGXv+5E3bJf0o8y4kve_f+EefKqcOeW99VA_HcgKRm2+Bj+uhg@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: HID: i2c-hid: elan: Introduce Elan eKTH8D18
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Doug Anderson <dianders@chromium.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

On Tue, Apr 29, 2025 at 3:34=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Mon, Apr 21, 2025 at 3:13=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org>=
 wrote:
> >
> > The Elan eKTH8D18 touchscreen controller is an I2C HID device with a
> > longer boot-up time. Power sequence timing wise it is compatible with
> > the eKTH6A12NAY, with a power-on delay of at least 5ms, 20ms
> > out-of-reset for I2C ack response, and 150ms out-of-reset for I2C HID
> > enumeration, both shorter than what the eKTH6A12NAY requires.
> > Enumeration and subsequent operation follows the I2C HID standard.
> >
> > Add a compatible string for it with the ekth6a12nay one as a fallback.
> > No enum was used as it is rare to actually add new entries. These
> > chips are commonly completely backward compatible, and unless the
> > power sequencing delays change, there is no real effort being made to
> > keep track of new parts, which come out constantly.
> >
> > Also drop the constraints on the I2C address since it's not really
> > part of the binding.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v1:
> > - Reworded commit message
> > - Dropped the enum for the new compatible string entry
> > - Dropped constraint on I2C address completely
> > ---
> >  .../devicetree/bindings/input/elan,ekth6915.yaml     | 12 +++++++-----
> >  1 file changed, 7 insertions(+), 5 deletions(-)
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Can we get this merged for v6.17? Or could you give an Ack so that
it can go through the soc tree?


Thanks
ChenYu
