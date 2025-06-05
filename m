Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1AD2F852
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 20:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749156358; cv=none; b=caAip997F9IHvwZyXGGf8Zx8evQT9B2nvObEOIfNkHm9YhjuR1u1wavjked6aJJjeCyU/+DC8MSHyoGDxV/Xve7tcb9pusjBoFTsqcC/7Nyx3+4VdedbC36nDJ2o0+xnxKEV9SGCijUvYXgAP6pOZTr9HeI+6ToDwBUr+trojzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749156358; c=relaxed/simple;
	bh=41UcQNF0NYZ5vOdfYZCJxGjidjDGnId0EGj2effOi6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UOBxpPGkL7nfYlXumiJ/wTQFLcNrliqTnIzMYgweD1KKKKb9f5BwNFHJA9xJQpEki6qqObfo4SEY4IpnFPGBuQRGLsLvyt5koka89OCik4DDXUbBgXw8/Jw4jMblWIPL/8W9sP4OAcv7nAadisQ0h5wqBqgO+k21h5aPjbY5UXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Uto0J2cr; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Uto0J2cr"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-311ef4fb43dso1211173a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 13:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749156356; x=1749761156; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41UcQNF0NYZ5vOdfYZCJxGjidjDGnId0EGj2effOi6I=;
        b=Uto0J2crCljqqfmD0qaUjZU2LNhnL6XiHZpL+RugKPP0fjsCuF0KsergQyKvfVRaj+
         FapgbQ5ZN2oAOI6XCmrsRvjFYl+zajtr+6wTp/hpxOBy/MDbDOMQm3I7sVCSG8cqJ/Ht
         es9hMeqA1V0sjFeyowy/5/pKNs3TQHtSpfx6Ety6lD7xsvudMNRtYp/0yrpiRy4m7yCN
         +ujpfkNUZouivGsfVxbVfp7XhnqY8Tm5P1u/FWuW/4r631UkIDDouNzRm5TarsHLq37o
         +meyQggTLgqF4XMmA08u3PoOWe2xQD4aV9ym+a2247nV07/VAVtoHrtABTmMbsLRYdZh
         JK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749156356; x=1749761156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41UcQNF0NYZ5vOdfYZCJxGjidjDGnId0EGj2effOi6I=;
        b=oKUzBCOO+pOO9CP2yfaxMBaxW/VoMhQLZJ2zKchnedE6l2SU0Gi5RoC7MqtApQOPsR
         ZbHZ00J5Pc9S1YtrBjFF+WxdPHbOWfSKVPg+qLw2yVTLrTWUPQ6mifLSIOVbYKYWuSk5
         29EaRXY9WTEYnV2ZRt1Wfk4DbhFVMQQJbVA2XTwCBwzZoUKI4KGdddVhMUzP7KvkCvn2
         hbzUCn+ZnjjTRacmm6uo9EdSBDQrumD8h0BTAP0R/6OfU1K5lumt7H9SemLBejeVHVea
         YnWq8nSabWqkuRGh8pMq9IvqLT4LsrSdYlOKTwZ7A+nu27LfyNDJ/d78YHQsFw0xsGG2
         ekcw==
X-Forwarded-Encrypted: i=1; AJvYcCWzcMm2Cm5WrXOSzFEdNilmDPHFBC3wdchWHGCGMpLrmmuPKMPwP9aGM219QFlm9zoPWVIj6YOJYKtOKdM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKs+tCHRb/qXxFjYIGkdMMeyx+BCaUjt/174RYIEEmbWw0/3ox
	dpHruewsJKs7E+GR63VT8mDkuC+99Jlh93pGhE0L0Xvil9xaZmIANWMN8MFKWpEBTavjCoUGvXK
	oRXTpvNfTHsbfQNSm+Nts2/DTTaPyK+G+oQkBo8Rr
X-Gm-Gg: ASbGncupofwqhjcWGKkx1dEpvQf5i+fAg5s2Fp477d+4dNrOtnJu1d+u7gHVdujrW7T
	Vc0eegdsgZtfj+llDMUzgsWaln8WT4xVDaqQgUVEGa+RQ6AllXtM7j1KtJnsAUHiBrs2QXJnLnT
	5JmoUhiKbDHE+c6maVtULVz6iThh8HELJ7NJvNij7yddbBr7R17rA7O930CUrQJSimaVNniDiOU
	w==
X-Google-Smtp-Source: AGHT+IGQEyQ7xC/2gN7AR6mQJWZcHfKlTjNOFZ0aNJuMVhtq7C8GdNK06ZCyXnyWEhtqlam63k1Qx8RM6OmlrSSS9Dg=
X-Received: by 2002:a17:90b:4b4f:b0:311:c939:c848 with SMTP id
 98e67ed59e1d1-31346b44fafmr1785689a91.0.1749156355425; Thu, 05 Jun 2025
 13:45:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605150236.3775954-1-dionnaglaze@google.com>
 <20250605150236.3775954-3-dionnaglaze@google.com> <b6b9b935-c5fa-dec6-ec82-56015b5dc733@amd.com>
In-Reply-To: <b6b9b935-c5fa-dec6-ec82-56015b5dc733@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Thu, 5 Jun 2025 13:45:42 -0700
X-Gm-Features: AX0GCFvw6StWYSjYMIhscpi25Cgn32D8l5h6WrL5Hb03D2NIE4-XGuR2mkZV11Q
Message-ID: <CAAH4kHaeMgzdNP6Y7zdkdODransNkP4UiQ8ROpCVgenpiveJ_Q@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] kvm: sev: If ccp is busy, report busy to guest
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, 
	Joerg Roedel <jroedel@suse.de>, Peter Gonda <pgonda@google.com>, Borislav Petkov <bp@alien8.de>, 
	Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 12:15=E2=80=AFPM Tom Lendacky <thomas.lendacky@amd.c=
om> wrote:
>
> On 6/5/25 10:02, Dionna Glaze wrote:
> > The ccp driver can be overloaded even with guest request rate limits.
> > The return value of -EBUSY means that there is no firmware error to
> > report back to user space, so the guest VM would see this as
> > exitinfo2 =3D 0. The false success can trick the guest to update its
> > message sequence number when it shouldn't have.
>
> -EBUSY from the CCP driver is an error, not a throttling condition. Eithe=
r

Ah, okay thanks Tom. I'll drop it for v6. I'll see how the first patch
is received before cutting a new email.

--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
