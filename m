Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA0F1EF38F
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 05:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748410696; cv=none; b=qbgfvggXlrs9ZpEsvBGLDvgfSFklWrQAuhNTGQxDF6xZldwCgIFOmB5h3CLHjLXDOVb1P1Xlj1vQC80ElZM5vLKt6Kz5tTreijeOVjsAYdpp55ocDzN2FGzPfzzX14og43yQNegerRe2DujPTs1O3RedpLm/3mU5JzztDw5EQpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748410696; c=relaxed/simple;
	bh=vtplRbHf5cYdnrsURj8lTuNjyZSxPZnaf6G/k5Uxyl8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=heB8sIFDujqKCFIZDKr+0Bcx3E+/ivRRtXB0Y8LNgRyUXtPuLe24M3Ec+BmT73jIsprm8Vd0IlxQjZyWq2itCIdNyaHvbkpsFyoVW+xn0to6y9r1lVi1PBrhszsFTQgxxN4bz9/V5WNHMZ0IIGgyBCyRKN9Hvlr3ADLvOPlwrxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ePxtgwHT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ePxtgwHT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748410693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uGpKYH25qdwO20Qi6WljMpSm7CxKxO2i5GmgG2oMcQM=;
	b=ePxtgwHTzRpd/g7HkBMW4Jo+MPbWnZ450vIUyDhoUoAcI/JZA8YBIWajg3a9Aw71f5urNE
	rcV8UZwPfn4ZbHquYxUxBywR83momyMFOn747bTyx3mLc5O14VjcqspQ1G7h3GMvBKgqbZ
	7Yz8sXk7SCTnEF2liDeIC/IC8CLWvY8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-eisqkgOoMlKFi-LkR_2IhQ-1; Wed, 28 May 2025 01:38:12 -0400
X-MC-Unique: eisqkgOoMlKFi-LkR_2IhQ-1
X-Mimecast-MFC-AGG-ID: eisqkgOoMlKFi-LkR_2IhQ_1748410691
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43cf44b66f7so24222315e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 22:38:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748410689; x=1749015489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uGpKYH25qdwO20Qi6WljMpSm7CxKxO2i5GmgG2oMcQM=;
        b=sPS+PUJ8vSTfInfkT7gx/2sFBj1SXkkSWvEdQRl18nEVMyMpv3KgZY77mu4X4L032O
         jc4BEQCuNOUkaj5m7p76CKz69E9V2KIEbii6R9lK4uPf0Jh69hbRlJ1PrMYc1F/THvHh
         zByzGo0js86vk+9BDw2MX+uEY6lp88ILD2AzeqZ+AFl4iwuHv/nF3yIeDhhEznE041mM
         DfHbaRyYQ+b5/4293kWF93/fG7/9IOlaui1CW730+HJr9Gz7ehAxtUxgbUQWCRFdEGkB
         btdZIVrgaWm9N7YRNRRVyicrKzVrkvsj/ZCUp4L2jpHt3RzWRhZwwO7xyLonOTK4QYZJ
         oXlg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ40W+mDvcGzxpksrSnRscUXn6dxuyjo7DsU/o0yWNybAn8394u7ftJmQsv93WPU6gdKDQA0uz7yEH/qM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyX4hcKnwXR8ArL+TYD/UX7LSvwPbRPNLrU0ZQlYJA7DlilHyBe
	/rIFfNCUtAzRzCtTTNTisJ2VruWwm8UtQu7z0ogCvFyEQAMyyLTXKj2AbRTnFlCTq3bhABjREYN
	ROZNDaMUjPgAgxrPnPi17AtHyKVwqArwsfaNAjMvkBtUnteXiFDaBXnxrLjMuqKR7NPamxFZk6I
	/JCAnr8V2s5PToJqP6WPsItA9yMXzKoYGETAt1gsyozMXtYtDO
X-Gm-Gg: ASbGncuIQ3LIXuUDIfHO3VXw5YHHWrR8fTR1rz5+964ixelsMq+7/nvYylMfbfX62fe
	XyTFe1kCh+kVk5g1vi8R/KLRf3Vl6M8a827XRGShw1CBLDoHlZSn25U8jDbiguKFacWM=
X-Received: by 2002:a05:6000:40d9:b0:3a3:5c7c:188c with SMTP id ffacd0b85a97d-3a4cb4a9b05mr12776053f8f.57.1748410689401;
        Tue, 27 May 2025 22:38:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/DjgyHmTi77sz4YL1AcotxWGV19kkLeazwVyYNyUm5/Yz03U89VIiuny/iYpw0zaxNaDubEkcm3y8xMlS5Ng=
X-Received: by 2002:a05:6000:40d9:b0:3a3:5c7c:188c with SMTP id
 ffacd0b85a97d-3a4cb4a9b05mr12776036f8f.57.1748410689059; Tue, 27 May 2025
 22:38:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528152832.3ce43330@canb.auug.org.au>
In-Reply-To: <20250528152832.3ce43330@canb.auug.org.au>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 28 May 2025 07:37:57 +0200
X-Gm-Features: AX0GCFtOIWFnFVkSToM6sYIdGjE7Y3_nseIDAEn1Nlq5PJJ_ber9SzlILoUMcCY
Message-ID: <CABgObfbCg1wiZJmnXFihmRLvPiJq2bCQH3MNVMfiUJphz4JW3g@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the kvm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Miguel Ojeda <ojeda@kernel.org>
Cc: Maxim Levitsky <mlevitsk@redhat.com>, KVM <kvm@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 7:28=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> After merging the kvm tree, today's linux-next build (x86_64 allmodconfig=
)
> failed like this:
>
> error[E0425]: cannot find function `mutex_trylock` in crate `bindings`
>    --> rust/kernel/sync/lock/mutex.rs:129:41
>     |
> 129 |         let result =3D unsafe { bindings::mutex_trylock(ptr) };
>     |                                         ^^^^^^^^^^^^^ help: a funct=
ion with a similar name exists: `mutex_lock`
>     |
>    ::: /home/sfr/next/x86_64_allmodconfig/rust/bindings/bindings_helpers_=
generated.rs:265:5
>     |
> 265 |     pub fn mutex_lock(lock: *mut mutex);
>     |     ------------------------------------ similarly named function `=
mutex_lock` defined here
>
> error: aborting due to 1 previous error

I thought that since Rust failures wouldn't have to be fixed by
non-Rust maintainers, they wouldn't block merging of non-Rust trees in
linux-next?

In this case it's not a problem to fix it up at all (I'll send a patch
to Miguel as soon as I've taken the little guy to school); it's just
to understand what's to expect.

Paolo

