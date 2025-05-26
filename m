Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCFE1DF26F
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 07:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748245241; cv=none; b=mCBmosQphXlS8ch+amE/1LEnCefqpQo47A7oi4pUzDuZXszwbERfjEXtySxIan5NENuUdEz2ZUXVtuKNDSNhIDJeVx8OtF51BJcqmb1BXZqRVT3Z/B2cismbsMItlMv4mYHURx7QRrEtkAZqkTr8khm8N7on8VC/vbK2DKeom9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748245241; c=relaxed/simple;
	bh=KRUpYZvebp2gnS2ohX+VG/NoILCSLWt+BQ82B+4vI4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DxAqjL8DpCyJBZfWjwAxJAl5XfWRpurl5udDCj7oRxQTGJHEBzkWVoFjn4xinRboctg9tLpIcRVVdTJA7Fa8Ifynm0wAPeF4wb60azI8IipVUMcaWkbNrZZmfOAH4EGbjzanoQ+uIdQUh8XaePlPFv+oXSZOOCcTHZfL/OHV0IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UsezSDSV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UsezSDSV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748245238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KRUpYZvebp2gnS2ohX+VG/NoILCSLWt+BQ82B+4vI4U=;
	b=UsezSDSVqjXp49s/3GF19NhHXhrGBlue8iNnNWBdgfbpT8SogKzRtj/eTqv0zjC2SbouDX
	E8q/jqXG80/tOjZ4CprOzbdhzM/FppeejMZfQyhh3Yx+Z3pSATqd/lO1ULSGbvXt+JOy9O
	I7SG4ro/V3wscwlOqr5NToaKmZo5JCU=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-XTtyNGOoOyWJifkTIpp7xA-1; Mon, 26 May 2025 03:40:36 -0400
X-MC-Unique: XTtyNGOoOyWJifkTIpp7xA-1
X-Mimecast-MFC-AGG-ID: XTtyNGOoOyWJifkTIpp7xA_1748245236
Received: by mail-yb1-f197.google.com with SMTP id 3f1490d57ef6-e7d90f2b129so2658778276.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 00:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748245236; x=1748850036;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KRUpYZvebp2gnS2ohX+VG/NoILCSLWt+BQ82B+4vI4U=;
        b=T9cK15aoxZ0WXjQHXm44rGa4p7pbUjRgiL/tVcWtRf8xUHuMBHnxEqMpUFWhLNaMCw
         3NIlD9ft/mjyx8x2Kt6FNLZIaZhYOsZ+BoiXoWB1AQMX5ITB50GZoIvDVpLxXOtKY1qg
         TuVmiQ9/WdfoawLVnFWqTgGxmelLo/VXI1w+diLjlrpGuRXXM5witIQwXkWRlaGUMWZ6
         FcynM0bZQRZL+vFgx+1qNpvmb9HPQXu4+PbcQ8LNw5NnVZxGnT55FONmjzvCrkDxRAPg
         W8USdIJma3kdlsyJ3RC25KSnd5OW/tChLC/rwsintqbAKGy/e/9KXU16R29JK6VOKINh
         Da5w==
X-Forwarded-Encrypted: i=1; AJvYcCWhEJoi6PkeNVo1vUAHoge9KVcpM6sRD1X2dAybb3g548qC1VeY/D3sF1/o2iHGuUSJzRywHOjVL/4JzMk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT/UVwEajQ3Ny06PeqezCWplE85d5CjtF5zXZrgmXkBOCLdOmj
	LOjkXzSJ317J0P+8w0XFD1il8/QZ7AUSyrbVecbgRA9uhKuP18t8jiLdUvDlvWUZyVoZRxQKP9h
	3/PXoKd4qFSmvFxl5BU6CX//8aOvgVfaRlS/Oy6UmCPMZycH0iKaehg5Nuoi8EKg1PNZlXVz/fj
	n05JH//wCG44+HqO9/ZoUrv3wvUEHAGdzE/Jt+s0RO
X-Gm-Gg: ASbGncuEJsh726IxN6RkuvIfnNhqGGLhmZetuxeoVDCDfKuZF898cWOIv6hmXdBbVr9
	PyWVSpuO+g0CC406XFhenmMlOjBySPXy6KtYWaY7xEtdmifIcLx30HeESf9iq2+3QAR4=
X-Received: by 2002:a05:6902:1503:b0:e7d:89d2:a2bb with SMTP id 3f1490d57ef6-e7d919ff94bmr8974764276.3.1748245236236;
        Mon, 26 May 2025 00:40:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFS7Pp/XoXNFVlvnyTUc1K1XXQydWSpcpTrFXtXpr4SnhnenRHHP8SHUydPH75wP5FH91MrTTW9j01EIYlJd6g=
X-Received: by 2002:a05:6902:1503:b0:e7d:89d2:a2bb with SMTP id
 3f1490d57ef6-e7d919ff94bmr8974742276.3.1748245235915; Mon, 26 May 2025
 00:40:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514134630.137621-1-sgarzare@redhat.com> <20250514134630.137621-5-sgarzare@redhat.com>
 <aCVHQ-LRqHeEVEAW@kernel.org> <CAGxU2F5AsNY5mQPd=qajW1seFYHSYpB0Fa1iuR_f2QavtoB6sA@mail.gmail.com>
 <aCzf6aoJAC-IdS_n@kernel.org> <CAGxU2F6rfqGV_gJk-JxrCk3f9dWtYn_3o9RODh7cVG0X_oQWaA@mail.gmail.com>
 <aC2nBCxkvWWz5y5E@kernel.org> <aC4CVUXpThAyKQdf@kernel.org>
 <CAGxU2F5zQJR4GvZ9ovtQBqMFGs-wBMoCRks=JYQ1JF6qMKK-6g@mail.gmail.com> <aDCb-wkHGoLQ-IGg@kernel.org>
In-Reply-To: <aDCb-wkHGoLQ-IGg@kernel.org>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Mon, 26 May 2025 09:40:23 +0200
X-Gm-Features: AX0GCFsNxPiQg4uBSQzNKiQ-b9RZogg3WHbWdCxyQyCynKE3SGVLrqvJ3a7shh4
Message-ID: <CAGxU2F7bS7LsUTVihKdFu2UE20-HfqGk+T8j5fUaX=wMu7R1OA@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, Peter Huewe <peterhuewe@gmx.de>, 
	Jens Wiklander <jens.wiklander@linaro.org>, linux-integrity@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Sumit Garg <sumit.garg@kernel.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, linux-kernel@vger.kernel.org, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 May 2025 at 18:02, Jarkko Sakkinen <jarkko@kernel.org> wrote:
>
> On Thu, May 22, 2025 at 10:26:34AM +0200, Stefano Garzarella wrote:
> > On Wed, 21 May 2025 at 18:42, Jarkko Sakkinen <jarkko@kernel.org> wrote:
> > >
> > > On Wed, May 21, 2025 at 01:12:20PM +0300, Jarkko Sakkinen wrote:
> > > > > I tried, but the last patch (this one) is based on the series merged
> > > > > on the tip tree, where I introduced tpm_svsm.
> > > > > I can see that series in linux-next merged with commit
> > > > > 16a56ee59ab8ee05e67de35bbb5782ef9cfb4f07,
> > > > > but I can't see it in your next tree [1].
> > > > >
> > > > > How do we proceed in such cases?
> > > > >
> > > > > Just to be sure, did I use the right tree?
> > > >
> > > > Thanks for the remark. Lemme check tonight. Hold on doing
> > > > anything ;-) We'll get there...
> > >
> > > I just rebased my branches on top of latest from Linus. That is what I
> > > need base PR also on, and:
> > >
> > > $ git show 16a56ee59ab8ee05e67de35bbb5782ef9cfb4f07
> > > fatal: bad object 16a56ee59ab8ee05e67de35bbb5782ef9cfb4f07
> > >
> > > I'd use git cherry-pick on a range to take them from linux-next to a
> > > mainline tip...
> >
> > I see, let me know if I can help in some way.
> >
> > We can also wait the next cycle if it simplifies your work, definitely
> > no rush on my side.
>
> Let's do it. At least it will then get a full round of testing before
> ending up to a release.

Sure, I'll send v6 after the merge window.

Thanks,
Stefano

>
> Thank you!
>
> >
> > Thanks,
> > Stefano
>
> BR, Jarkko
>

