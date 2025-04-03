Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016CA24E004
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 13:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743686091; cv=none; b=VJx3HB3GyK1nPxTKT/2ohrg1K1Dipx8Krd8+lATgcXxIcV06t14Ft91W4AZfziy7nzPV8SHgpnoiSXUj2NiiqiG6MzolwxEkFgHSb2nchLkc+h6XmoIn5umRFkLyE5+CaO6Am7c3W0N04B4OSEcBomReSKuuPrJS5mIAzGU+Xw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743686091; c=relaxed/simple;
	bh=bt6gJlRwPdO08tG7YpNnHL783vydCw6J7TOqDlJK4lY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H/WM7B33DOOLzqSiIu8jWnE4rB58kzHbW8w5++ehX06fgo5naCAIfDygiKuYoNDrStwyyyjLuKO0sgYOCR/PA02zSXBurG9nTOg/wOjf9JapKVdVfbXB/RN6yaZimAThDYMTLCE2N4wPuaMLfz3GRberuX8vOuAgpHd6/X/lw20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/k4rMUo; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/k4rMUo"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so1093127e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 06:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743686088; x=1744290888; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mqMLUJ3h8FzGpd/ZaU/PCx5lcDAym3sCL++s8q8O5tA=;
        b=N/k4rMUo32yUBXl9QVhTahgmmntNtbzKwpJ81Vy+7YsHBKmGkDTAaQTAuRJYWP0DbZ
         XD2eN4F1zwv74KKnYljJi8we/x4i8vu7Es3AQnxiu8/l4TAzDsClFS4h6E7Vzp/De72T
         sXZ++uHhebAneEXFCPxG5NUgjSjrIPhCF0eREkEnF1BqsXYQ8kN/Ru8/JfmyKN/xwPn3
         E73gy8NdgxD+ALCjPUO7Oi0Vq/MRYCxawgA2fI27xp9bOS9G5FNyoyzhmZrBaXcwiQvP
         N/rscgUpFBHBMm8OckZyX+vuOssv3oAXEorYRYdqnUGqHe9pFEESHVeH90ZEqJXNHbdS
         W3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743686088; x=1744290888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mqMLUJ3h8FzGpd/ZaU/PCx5lcDAym3sCL++s8q8O5tA=;
        b=u8oIpgnJNUL6Y9D1YGagJpXMgvRawcW2ZiRjnuFh6wQO917sYfmt1Fhj+iSW1iRojX
         afOVZTrfF+ag6o6murujEsx5hWyI5G5TUQOL+kUdHBoyfX1WLkc8iYOfY8S9WQIFjWgU
         Ti/tGip8yuRzzkUAf5bYBf0Pzi+WqcQB0q97Q66m6/IznWc+OJS62FRBe0rXggNCuO5j
         9GH1QIm7uR2MOJwV5P4d3Gy/C6AVwp0Yi1lkcgFpTIbBp/9IWLYOCAOt0ZBCrpp4Qa5W
         kF/C1c3ftqB7dl5YcUIy6KoSeuk/JL3IMvOngwX1iiB9j21VfFB71G+o6T1L9gShTKIF
         hVfA==
X-Forwarded-Encrypted: i=1; AJvYcCWJCKRXXhsgWJzDVx3t6gDm2aEw95iAeGw1uZi6BLvuLt2I7AnZmebYyE+nuRlpKGA0V4VrnNZD6aeyRq0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdEbdlg4BU7ni6w0Ssz+clCEMy6XAxq2fHe6caEjZYfLvMBqXL
	i+5Dyn6Pqjb4tqf0dP+8l3ZUg5Wo3EweyUX0JVwrggyU8e9+KI/PPyKXthGfI4qjWsUEjpupq94
	35muHPTbRhu0IFVKx18hF09ZdBCU=
X-Gm-Gg: ASbGnctNUqlQEUlm8EbkKrGF6+Dy+gUpJ/JhW/ipwtG2ClGzWwBPTSB1dppMUIrEeWI
	0/PGsRUmq6YDpK9tsa2rIYckg2MXN+ZtFeL87jrqVrPQg6fFshWnpgyCONTN6HCzstDQx6Nx4M/
	XH6VwOsP9aKEmyZ3sfSghPc0wL6A==
X-Google-Smtp-Source: AGHT+IH2kqjkmBjqUVw+MY6DzQ6KHWR2nn2MHZ+KZ+wf1sfvHxHjTtOFBN9OSvv16ji1RnKxxsfo9uZGmtKo39z6yEo=
X-Received: by 2002:a2e:a803:0:b0:30b:d35c:4754 with SMTP id
 38308e7fff4ca-30de023b4d7mr75558381fa.10.1743686088024; Thu, 03 Apr 2025
 06:14:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <81a25a60-de78-43fb-b56a-131151e1c035@molgen.mpg.de> <f8ab4b21-0afc-4956-a324-12c0c67bb5de@molgen.mpg.de>
In-Reply-To: <f8ab4b21-0afc-4956-a324-12c0c67bb5de@molgen.mpg.de>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Thu, 3 Apr 2025 15:14:35 +0200
X-Gm-Features: ATxdqUEKWFLktRli5xE5aIw6_0Thxu_wJ1HESz_7hFAvSvyvA3lIFGGomnedZ0o
Message-ID: <CAFULd4Z48Vh_UW6+Q-BJ3c42eo7QaKhAbhZRX+Eegx0Te4+z6g@mail.gmail.com>
Subject: Re: New warning `cryptd: no symbol version for this_cpu_off`
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, regressions@lists.linux.dev, 
	Brian Gerst <brgerst@gmail.com>, Nadav Amit <nadav.amit@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 3, 2025 at 2:30=E2=80=AFPM Paul Menzel <pmenzel@molgen.mpg.de> =
wrote:
>
> #regzbot ^introduced: 6a367577153a
>
> [To: +Uros, Cc: +Nadav, +Andrew]
>
>
> Dear Linux folks,
>
>
> Am 03.04.25 um 09:35 schrieb Paul Menzel:
>
> > On the Intel Kaby Lake laptop Dell XPS 13 9360, updating from
> > 6.14.0-11270-g08733088b566 to 6.14.0-12456-gacc4d5ff0b61, Linux logs th=
e
> > new warning below:
> >
> >      cryptd: no symbol version for this_cpu_off
> >
> > I haven=E2=80=99t bisected it, but could it be commit 06aa03056f90 (x86=
/smp:
> > Move this_cpu_off to percpu hot section). It says to have no functional
> > change though.
>
> `git bisect` led to commit 6a367577153a (percpu/x86: enable strict
> percpu checks via named AS qualifiers).
>
>      $ git bisect start
>      $ git bisect good 08733088b566
>      $ git bisect bad acc4d5ff0b61

Can you please post your .config?

Uros.
