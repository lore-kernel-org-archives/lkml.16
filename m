Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8494A225407
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744012417; cv=none; b=H70LJTna1ozy0YdGR7nlpI/hmA1y9XBj3OgmznPT2by520+xH7Bhx9LMKgXJJsxN4Yid4WhvVHXJ8pBF3YZGCwUk7dl+O2rGv0anI9Hz7OuOPb6ZLAUF5EtA6RvBlr+q7mlY9SFn3p1wRMH0LIi11VR03E3FdimQMYX1X7Q/EW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744012417; c=relaxed/simple;
	bh=szwnXOzOSOjBOch3SoWaXXjO3Tlak50jw4MvIJHciKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gaUIjL7SrnFXwy+VfbMYeahwbKv2NeMAk9+2czFnT0arnBlNvdDHYip3os7KaGl3DM3dUeATRS9VTRsHTaaGiNruPMquPEoUKBc6UXwhRSuEUYF0Fpi9cwoGZH8UQ2bP21+9sbbQ9McQocSiJ3PEC7MWpvJaq7qWst6wPrzVs4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L0NUK7Je; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L0NUK7Je"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744012414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ofsy77ssOrCPdPnwbpfIBh3i6M18rOr/4yXwZKj56Wg=;
	b=L0NUK7JeD1sQMw4xDSvwNBx9w7BkhnJzcFVg2Cl6vnp9uCjeNaVN9h49J8Sr28z8D/Fj5Y
	aPLp0ugrnkAqmxjJQgj8guIyAddGDXLR/wlg3gVVXRb4lFI/ApCM0lYq9FvAuNwyZeIvFv
	rZrbmNhEo9EMObyQnCFGLzvXnRvP08g=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-q1MNDHHiP-yAq6CI5KH2dQ-1; Mon, 07 Apr 2025 03:53:32 -0400
X-MC-Unique: q1MNDHHiP-yAq6CI5KH2dQ-1
X-Mimecast-MFC-AGG-ID: q1MNDHHiP-yAq6CI5KH2dQ_1744012411
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3912fe32a30so1585748f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744012411; x=1744617211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ofsy77ssOrCPdPnwbpfIBh3i6M18rOr/4yXwZKj56Wg=;
        b=tgujjKZqp2XhxYn5DZKiw7t/ZozFeq6hX6eKTvDXghfhV0l9HEuvIf9QcGJY1i/9Y9
         jb5GMhGCGxELK8iBKVIZgJqckWsunVuWNqTGg3GHN2cFRqX1UemgPHwuaC4eMtj2kPlm
         nUcLM7AfbCWMzEI3VLOA06iBgVpRVgdLp5I703dCs0Y2u7ortnJZ4mDjKaucOSfQX4tQ
         38rgHjmuHDn6tQvXpcWc1znq4vhuLkkzG79X/16GheigTOO2TeigSIoU3EpxH1NZs/7b
         L866qRlPfxTBIfvUp496JFsaVWnRwdMeAlsPCK2UbdUQ+43GxWfTRPHX4Gz7c7Y05py9
         ctBg==
X-Forwarded-Encrypted: i=1; AJvYcCUQyUbqRSWur2NQVWdu0KexW6oExnqdh6aO6dLRz6uTxtxoRf5cx5aW4ymgE5gDC2fYs8PmkB8ptOgaVYg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbMSW8+fkpHbIb1gITfGEDjqGCvb0PGFt6Nibvd/x36GG+Hal4
	V4YimJTrUizCZBEqQ1L0Wbl8aDcJ93DdilqH2vXMBBP2sM6eV58KTRKiZDEACHVhTTjp1Dr80x3
	CfGJuLnzJNuJDv3ehAeeBPlUQpBALVy7pSU87DhFsAkQKtrH2kWtEidVcdgv9JgwuZNT0PQWd1w
	stQlHcT8bBj+50MKqDriKUUXKxWiTcPy52rpfb
X-Gm-Gg: ASbGnctH+jbYw2OH1mHlK0i0wY4ODEs3+6RDwxXdgXbbfRI0MmOEADS4ihFU/oKV0Wo
	7nqHaZlvkF3HPKCsfZv9UWgOC/breIb53+XRgUybKGbvKoQQiQs2FH3QwK9wfwJ9PPMi7J18=
X-Received: by 2002:a5d:6d8b:0:b0:391:489a:ce12 with SMTP id ffacd0b85a97d-39cba9324c4mr9434685f8f.26.1744012411512;
        Mon, 07 Apr 2025 00:53:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEucAUDP41Wd19TJhxmtFTNd5L+/2tfINDx0SVCwJt1Ss7gnd+Nfa6ty3EOnVN7dms57jS4L4Bva0CX/NdTT8g=
X-Received: by 2002:a5d:6d8b:0:b0:391:489a:ce12 with SMTP id
 ffacd0b85a97d-39cba9324c4mr9434669f8f.26.1744012411222; Mon, 07 Apr 2025
 00:53:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1742850400.git.ashish.kalra@amd.com> <Z_NdKF3PllghT2XC@gondor.apana.org.au>
In-Reply-To: <Z_NdKF3PllghT2XC@gondor.apana.org.au>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 7 Apr 2025 09:53:19 +0200
X-Gm-Features: ATxdqUFovAPd1YyW8urz9uvodd5Msi-Jyl0y3VBXdc00kyPAkug_xTk1qmoKSKs
Message-ID: <CABgObfa=7DMCz99268Lamgn5g5h_sgDqkDoOSUAd5rG+seCe-g@mail.gmail.com>
Subject: Re: [PATCH v7 0/8] Move initializing SEV/SNP functionality to KVM
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Ashish Kalra <Ashish.Kalra@amd.com>, seanjc@google.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	michael.roth@amd.com, dionnaglaze@google.com, nikunj@amd.com, ardb@kernel.org, 
	kevinloughlin@google.com, Neeraj.Upadhyay@amd.com, aik@amd.com, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 7:06=E2=80=AFAM Herbert Xu <herbert@gondor.apana.org=
.au> wrote:
> > Ashish Kalra (8):
> >   crypto: ccp: Abort doing SEV INIT if SNP INIT fails
> >   crypto: ccp: Move dev_info/err messages for SEV/SNP init and shutdown
> >   crypto: ccp: Ensure implicit SEV/SNP init and shutdown in ioctls
> >   crypto: ccp: Reset TMR size at SNP Shutdown
> >   crypto: ccp: Register SNP panic notifier only if SNP is enabled
> >   crypto: ccp: Add new SEV/SNP platform shutdown API
> >   KVM: SVM: Add support to initialize SEV/SNP functionality in KVM
> >   crypto: ccp: Move SEV/SNP Platform initialization to KVM
> >
> >  arch/x86/kvm/svm/sev.c       |  12 ++
> >  drivers/crypto/ccp/sev-dev.c | 245 +++++++++++++++++++++++++----------
> >  include/linux/psp-sev.h      |   3 +
> >  3 files changed, 194 insertions(+), 66 deletions(-)
> >
> > --
> > 2.34.1
>
> Patches 1-6 applied.  Thanks.

Thanks, go ahead and apply 7-8 as well (or if you don't want to,
please provide a topic branch).

Paolo

