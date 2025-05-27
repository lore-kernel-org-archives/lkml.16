Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DB22046A9
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 09:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748338365; cv=none; b=Cb3tREiBmx/s0E72o5/rsynBK+Lc37+4NzEQ00rITOwpFjdqGeCn8SyopIq7vtbS6GmTwXRM1Qdl92IzkfzAKDz4nul5HJ9lp5PUbQytKf78EukfHtd7aRpAGa4DNqDDctn0sRGhoKwr5TpX3EPWL1OtAqlfvMuGcFM7yl7Deww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748338365; c=relaxed/simple;
	bh=kBOYzjEOA1UOSzxYusR2QCkHuynXvOslEyq8QhBHrQE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WtWnhbX6puQWbrZyi5W4n8+Si7gIZa98w2j4FNsxZRgquHzY4aVCDIOh8BQW2tMskfxU3VVoi/gd+KO7U1rOxqPlf05e5kx77ubysEaVB0wITxqH1CWSbGwSzhxkMu1vZjZxQNy2wscOmB/0HCGk7IsW+9Qp0722/ax3nM0h9Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UMjRnWj+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UMjRnWj+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748338362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kBOYzjEOA1UOSzxYusR2QCkHuynXvOslEyq8QhBHrQE=;
	b=UMjRnWj+6FuqwZLhcQaYBYKPXEA2GlKOe30FFRsQeJpjFx2n/oM1r6aAMoJQCsYZ/QJ5CH
	3ic/CqZDyctB7HTCgTqBneW9ZVH6y6P58P7YFGzrXiH2UwxAegd6GN27/WvZ7JDI5Yq2gE
	JxSsEJBfCxUv1/R30m1UoiJbw68+k1A=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-RtXTTK0bM8aipOb3_Nyj6w-1; Tue, 27 May 2025 05:32:38 -0400
X-MC-Unique: RtXTTK0bM8aipOb3_Nyj6w-1
X-Mimecast-MFC-AGG-ID: RtXTTK0bM8aipOb3_Nyj6w_1748338357
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4dcfb3bbcso712564f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 02:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748338357; x=1748943157;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kBOYzjEOA1UOSzxYusR2QCkHuynXvOslEyq8QhBHrQE=;
        b=MbxA7bN//9ZF4Esuee13jBFSU8+/l6tIPBYwJWFnjN/cyo5ufNtllKfe/NWq004mcr
         /f9afTQX3A6/2syni9Rqo57SJ0XkcTL/dN3rexBObLQTxhctz8H3zQsaocVLv3EOM571
         bKAnVGVXy87WNe3lORHLKcuA88Cb/XZFhkKWjZ2hccGhNnrAU0p0NpiXuvt+gru5NSoz
         Xv+7uH1cLGuF10ZzWdcOXA6sFuF59msTUrXezHj1cr9kq7+Proo+1h1lbc64v8RuG0uT
         n9XwalUag8j2KTYjVWYMjUfEWqDVCQFGuWrjGkcDtSgOAHeX/icTP9b/V5zUgaQJEa6u
         l2ew==
X-Forwarded-Encrypted: i=1; AJvYcCVt6bHMb53r9DQCrCb7jb3uVAq6SXrXYUAerGdGapyVy4isDg9EkqTktK9dgWn/3VPOlR3LKNOH9yQMbkM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqbDR5l/sVWr9fXf3Hmpk+GnTi0wo8wl4aTZBIH22vF7VVT1QJ
	xYTavsYlJBsZpoIHH9LmOv0QU/Id0bSuX7wIC1L3WpXl6sGjpQfNqW13Tb1RgFzW5mzaULa1r2N
	JR50TVds6uzlePpOA4tG980iDa8fzIm9fhmbVMOPDZ6TRnqMCTBL7I0YRPNO3FrCL0it1wvYIa4
	64
X-Gm-Gg: ASbGnctBuKcfqQYkbhQ+ZjsGv8rht5H0wGOq/Dpv9fKVIIOMiPTQIcl3W/XHtE0FRU3
	0WJjxudIkVjaWZR7LLTNiaLB77sXnN34Bimg5YTU6XDiMJYyz0+kfB10QRZHOmoVb1nBCzzPXZQ
	dJHfBu4ZX69X7yuCBeFMduuKg9aEk+l+NoZbAx1OXv4mcDH5T4CN8S+mI+zocIOcfWiPcgsJtXy
	M3S2GDc2MgKFpzYXfPzGHal4cQpLzj/WgKDeWMGpDjZWrvlT163BeDpOzVNI7bcSangduLvyh9Z
	NozMQtPTWxNCCnmSfx4fbiv8uxUg3KPtjBso1A==
X-Received: by 2002:a05:6000:1814:b0:3a4:cb8e:d118 with SMTP id ffacd0b85a97d-3a4cb8ed307mr7788279f8f.24.1748338357320;
        Tue, 27 May 2025 02:32:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOPw1yKFpRKpRR31/yCWnQYEpqGvfknCwekf03EA5lc6V5ZNABZ3W/T4ahko0a/4vA/rRcPA==
X-Received: by 2002:a05:6000:1814:b0:3a4:cb8e:d118 with SMTP id ffacd0b85a97d-3a4cb8ed307mr7788256f8f.24.1748338356977;
        Tue, 27 May 2025 02:32:36 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4e4f4d58esm206946f8f.28.2025.05.27.02.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 02:32:36 -0700 (PDT)
Message-ID: <91719ddbeca0e37617558687feb1191a69793dad.camel@redhat.com>
Subject: Re: [PATCH v9 12/22] verification/rvgen: Restructure the classes to
 prepare for LTL inclusion
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 linux-trace-kernel@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 john.ogness@linutronix.de
Date: Tue, 27 May 2025 11:32:35 +0200
In-Reply-To: <20250527092734.BgoHvn6n@linutronix.de>
References: <cover.1747649899.git.namcao@linutronix.de>
	 <c1dd325f5f8f01dd7c29ff90be22164c17f073a0.1747649899.git.namcao@linutronix.de>
	 <1927d98817cd97a70d177e0a3001603ee3e34b35.camel@redhat.com>
	 <20250527092734.BgoHvn6n@linutronix.de>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0



On Tue, 2025-05-27 at 11:27 +0200, Nam Cao wrote:
> On Tue, May 27, 2025 at 11:15:21AM +0200, Gabriele Monaco wrote:
> >=20
> >=20
> > On Mon, 2025-05-19 at 12:27 +0200, Nam Cao wrote:
> > > Both container generation and DA monitor generation is
> > > implemented in
> > > the
> > > class dot2k. That requires some ugly "if is_container ... else
> > > ...".
> > > If
> > > linear temporal logic support is added at the current state, the
> > > "if
> > > else"
> > > chain is longer and uglier.
> > >=20
> > > Furthermore, container generation is irrevelant to .dot files. It
> > > is
> > > therefore illogical to be implemented in class "dot2k".
> > >=20
> > > Clean it up, restructure the dot2k class into the following class
> > > hierarchy:
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (RVGenerator)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 /\
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 /=C2=A0 \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /=
=C2=A0=C2=A0=C2=A0 \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > =C2=A0=C2=A0=C2=A0 (Container)=C2=A0 (Monitor)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /\
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /=C2=A0 \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /=C2=A0=C2=A0=C2=A0 \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 /=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 (dot2k)=C2=A0 [ltl2k] <- intended
> > >=20
> > > This allows a simple and clean integration of LTL.
> > >=20
> > > Reviewed-by: Gabriele Monaco <gmonaco@redhat.com>
> > > Signed-off-by: Nam Cao <namcao@linutronix.de>
> > > ---
> >=20
> > Steve,
> >=20
> > since this series is quite /meaty/ and it seems the later parts
> > require
> > a bit more discussion about tracepoints, could we start merging
> > until
> > here (1-12/22)?
> > I'd be tempted merging also 13 (actual LTL introduction) but
> > perhaps
> > keeping it together with the LTL monitors is cleaner.
>=20
> The x86 patches have been merged through tip tree. My plan is sending
> the
> next version without the merged x86 patches, and without the arm64
> patch -
> it can be sent separately. Then the whole series can be applied.
>=20
> I will do it after the merge window.

Alright, sounds good too.
Sorry for being pushy but I'm have a couple of other series kinda based
on this one and I'm getting a bit crazy maintaining all that ;)

Cheers,
Gabriele

>=20
> Best regards,
> Nam

