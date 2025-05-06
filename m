Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8512016E863
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 18:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746556242; cv=none; b=SltAo7a6P9oIVnlcjnI7Eo6uNN6dtFEdzvw9e6p87eKPVqOvi7rIWgry1Rtb3zOczJjjuSdT0GQLNzSRcwNDZ+OSyvjpGoK7yroJsWWLtH9hgHkO/WOKla3tgfy2m4SM2n23GjSQO/4wLrImjK+4nS/V633A6Uh78EHGOwIFEIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746556242; c=relaxed/simple;
	bh=+CdqUnqpPsBT8Ikuvk2DGQ2ns+/CRvwQrNdVPzzfcVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qoo9lLH3+CFxNxFF/QRJFFryUixqZCm2icr5oooKaE8Lk/D3szHYeI57ZeSoJiMzy8yCwemGwMUQsaAS4amsAi08UjXb+gDvNQ1kIle4tVM0I+KxfaCWjdUcCdkOlW84PUlSWaoiRomyPtlRgN3chFLr/KTuiPaDoJZ+sygodso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=Bt8VNeLV; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="Bt8VNeLV"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-acb5ec407b1so1070873866b.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 11:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1746556238; x=1747161038; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/EPECJ8zPRZ8QavbMmpEG45MjwM0JB0cVDbmkrf1s8=;
        b=Bt8VNeLV0NzvVBCjX2Sr3TI+II6n5dl9fkJ17LH6fXrJxxR7xjR9vglfHJsXW3qXwo
         Q4Jk0CYD/rWpJBQ8RG7c5RsMeVCV48qHXskYA6zlHXsmKneWOk0T0zPSPP0HEurZoQV1
         XlGktJcArEU9MJ6cRtniPCvlvHltpINsq/5vJaXPjifYf3Lo96KbsebX6gR3LjSB75OQ
         G5+CYuF/WmCXhEq6UFL50qnUBpRIitg4IWmRZ5jHv0IsBaaH2hPHNzSXMNcWbDXOUp87
         08USDPULgJFbjlnhUXF9naeXAuO5K7aiKF8rjmv5B2cnMcutxUPVI3oWTS3M5++rLMCl
         mscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746556238; x=1747161038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/EPECJ8zPRZ8QavbMmpEG45MjwM0JB0cVDbmkrf1s8=;
        b=GVGN/ZwstmW7uA6kWqZG5gglGlyPN5p69ZSzk1/99Z53TbSU2c5xDkfUV3KAafP+V3
         adGZbLAQ7huPpmg3d82DotNNHsBJdG4r4Gvs++k1PpjxdwxTtlbXsbctKCMmG6p5e9Vg
         WAp2FEPoc6FpZlCeoJGjpNDqEI9KkhkFbewQjvkcRInppB8CjlXDTMrROsK1DvD//AN/
         TMib29KOASd4eYNAbFdCqR6mup1SEqJvGloEiUMZRxoG7W3P6iiINA7Ru/+B/zTQkP/4
         SWGkx6u63uGu+ocZH2S+4NLYn3YRqn+Uou+xT/5duvbzU4UoRLBLEjcOkCuVzT+NAGMV
         gwWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTY1hi+ktSpQmP1WZgi9TpNuE0upyW4W6YOuAhGz+W9h4PSCq5k9CshMFZg4OnU6oMxlAKwpsGNPqg5nY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2iEo38LWhWmNEDfn6c8/SF/V0LiCwfbrqccF+6GcnyaCI5EjG
	glFtctYg6nwACb1fhKCTf17VjYJdBujyIJvVvRwhtkDsQlENNRVWY06a/Zcq3MtjrAim9/IClUi
	9vi3wG6vEeByEPg/jLgdN00JTs9VCzXRur0J/1Ladk8EaIUqlOrwwwA==
X-Gm-Gg: ASbGnctEB3b9hcVQTY7ynZ2DGlO75ubl7o9Z2LxNbvdYuYMpQ0wChYUKnlnftEM7zRj
	XiZo/rkUqdf4+MItZGg0oEDnpO9hfMl9qHMkZY0Apx8WQUoqjYJCaBO/GRhRVE/fRp85B6HBVrs
	UYwjTnz/K55X5eQla9vKQNlDnDq+tCDeLzTiHtoMXIbo3nx4NNLHs=
X-Google-Smtp-Source: AGHT+IHfpF8X85L8l37c8wqm972832g7AzBMTXZ0/O2DLMgWY8M7Tg4kQ38PIs5PLwaaxC6lpc4jChwuU/VtKyzOWhU=
X-Received: by 2002:a17:907:3f9b:b0:aca:d5e9:9ce with SMTP id
 a640c23a62f3a-ad1e8befedbmr44412866b.9.1746556237717; Tue, 06 May 2025
 11:30:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506164017.249149-1-max.kellermann@ionos.com> <2025050600-economist-display-2d25@gregkh>
In-Reply-To: <2025050600-economist-display-2d25@gregkh>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Tue, 6 May 2025 20:30:26 +0200
X-Gm-Features: ATxdqUEdIBJPrcapfIha2IuGQw-8Qf4QDzQ_2wFzEFJgImtWYfq65b-RgqZfE4g
Message-ID: <CAKPOu+8c4Z_Biie3R6LP3pz6u-bpzBZjfoWv4XAQ5AreziDccg@mail.gmail.com>
Subject: Re: [PATCH] fs/kernfs: implement STATX_BTIME
To: Greg KH <gregkh@linuxfoundation.org>
Cc: tj@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 7:44=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
> You did just make this structure bigger, which has a real effect on many
> systems (think 32bit s390 systems with 30k disks.)  Are you sure this is
> really needed?

No, it's not "needed", and I understand that you question any increase
in struct sizes.

If you really worry about memory usage, kernfs has a lot of potential
for optimizations. One simple example: embed struct kernfs_node into
struct kobject/cgroup_file instead of having a pointer. That would
save 8 bytes plus the overhead for a memory allocation (i.e. that
alone would save more than my patch adds). Would you accept such an
optimization, if I were to submit a patch?

> What userspace tools want this in such that they can not determine this
> any other way?  What do they want this information for?  What is going
> to depend and require this to warrent it being added like this?

We have a process that reaps empty cgroups and reads resource usage
statistics (https://github.com/CM4all/spawn and
https://cm4all-spawn.readthedocs.io/en/latest/#resource-accounting),
and this process would like to know when that cgroup was created. That
means we can measure the lifetime duration of the cgroup, and for
example we can estimate the average CPU usage over the whole lifetime.
Using the cgroup's btime is the natural canonical way to determine
that time stamp, but cgroupfs doesn't implement it.

Sure, our container manager could store the birth time in an xattr ...
but that feels like a lousy kludge. If we have a concept of btime, I
should use that.

(It's okay if you don't like the patch and it doesn't get merged - as
always, I can happily keep it in our private kernel fork. I'm only
offering my work to everybody, because I'm a strong believer in open
source.)

> And knowing when a device shows up in the system isn't that, sorry, the
> kernel log shows that for you already, right?

That was a theoretical example that's of no interest for me currently
(just a side effect of my patch), but it might be interesting for
others.
But are you suggesting that programs should read and parse the kernel
log for that? I don't think any program should ever do that.

Max
