Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D55E24888F
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747752157; cv=none; b=oKmM6v4nu0pVLsBHg/QXP5xnrv+0VWL15vUFul5LgKtigonJYtumifwtyTKm8hCIeYMjlyGNZvFFpAgIFhwkRvb2n7rygEsplPu0EQedHb+6ClaPW6EO2lPth0ohtalcuMCg7TQfVUUDnkYpzOF8lAkqn8hQv1C/Ha3TIHCyajo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747752157; c=relaxed/simple;
	bh=Gra0+MZowr3WZSCCQG6L5yEo0PIjNdYOZUPW9byFFZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zn4MD7+bt9ub53Y/yo+fs8TbZeXabmOkpEpTBE3vmHjrDWBUUmdhOxGee7vo/A5mjDPTFIxv3dkxGGKSCl4qU9/NgZXTtX7Xwj0KJ1wz1v8PFK/Q99uAWErAU1ZzAwwl7yJ0xoaVQOCVQjXkiMuyltjVILRHEifQTsRlpPTjKrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LR7iBPhI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LR7iBPhI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747752155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gra0+MZowr3WZSCCQG6L5yEo0PIjNdYOZUPW9byFFZg=;
	b=LR7iBPhIh6yUyVsY2kSrE5Zs7Zcs4Z+NIx6cKfbQsCvEd4owaJG4XubNHRb1GSBHrKNeEW
	GyxjtDdfxr2ZKxrj2dANC1lq4ESe5KmiFWDF1mSHB4/BgR7fco/qxQM5QIQ976mQJyMYvQ
	YctjLpyBj7JhkCHgp764MsW1wNP9ZUw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-590-zn0JuS32Ox26_bJpYd5iew-1; Tue, 20 May 2025 10:42:33 -0400
X-MC-Unique: zn0JuS32Ox26_bJpYd5iew-1
X-Mimecast-MFC-AGG-ID: zn0JuS32Ox26_bJpYd5iew_1747752152
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a3696a0d3aso1209394f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 07:42:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747752152; x=1748356952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gra0+MZowr3WZSCCQG6L5yEo0PIjNdYOZUPW9byFFZg=;
        b=LYr+WSjt+MBtBmBimvYl8U9Mbx7MOjgGP57tTQlN88a+aHQ7BWFWhVX+F6oUdENkvs
         spQYJ08m0+ulQO3DO+mDSizRt/Tp1XVQsPxrj/25b9rQffnw2Sz3/R2X7dmlW06/oNr5
         stKcWxhCCM9dlb15DQ+kb6DdHXPnsjlVj9kwtSA+VG2BQlL4TIrV8g4U3ycyVD5/yiWU
         SjViOVjZO5/xciDhddkfkFbVb1urff/hglCp04lzV06Qo2q/MILOOzszf+DbTaVu21cN
         D7YaXVmQnmeJ9EHWezv7hxn01eWV420bWTK5Ur6djs5UCaqOnTt0e44o7fr8gQMrwhhC
         RCNA==
X-Forwarded-Encrypted: i=1; AJvYcCWp6vUvb9cmLZ8PYtNsxrHWiM1DGa/DPUC9CFYXzIlyuTjbuhrw+m6hLdNKcNf2XhN4Rn9onV7kFtcQcDg=@vger.kernel.org
X-Gm-Message-State: AOJu0YztkrUfyYtcBiOuSweJYRGgahS0eCn5x++QJmB/h96sZUvTIffJ
	nSbZSAt9C3YYVYEPucbWAzjy5ttZ+949+TLIkcOlpOeeGlFb3Puz+2dR9NuAFGACjjhcEqAesur
	v+trB0phgCaldhUMYSRles3/tSqM12JhviNd+iNlsxP0p9BxMMpXobad9Z9gCdoEwAOFEEea3Dh
	xNpEtwMvHJU4X0QS3d5Wxe2C9vy8APEstUmDDwC3t6
X-Gm-Gg: ASbGnctEYOMxU0VIjUzo5XWruC/G+Hkg0OmxGN9qSkteoCwnyAR+7PDBJ0BeJFxirj+
	q47INE1nZ1/WEl3pW/DDrqehXjylsOe/FDGrjjNRGFSBWKCMzcP1qrlshYvnHP8/3umU=
X-Received: by 2002:a5d:5c84:0:b0:3a3:7be3:cb92 with SMTP id ffacd0b85a97d-3a37be3cf2bmr1974447f8f.42.1747752152316;
        Tue, 20 May 2025 07:42:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNv6K3sS3FxTY6B0e3vzMwLrSUH4VeGRW7bxwLfDlRShdcMikfXMU3cfUseGSYV/4VsF8bZnz6jBIqfwQl5Eo=
X-Received: by 2002:a5d:5c84:0:b0:3a3:7be3:cb92 with SMTP id
 ffacd0b85a97d-3a37be3cf2bmr1974427f8f.42.1747752152007; Tue, 20 May 2025
 07:42:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516215422.2550669-1-seanjc@google.com> <20250516215422.2550669-3-seanjc@google.com>
 <219b6bd5-9afe-4d1c-aaab-03e5c580ce5c@redhat.com> <aCtQlanun-Kaq4NY@google.com>
In-Reply-To: <aCtQlanun-Kaq4NY@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 20 May 2025 16:42:20 +0200
X-Gm-Features: AX0GCFsdS-BiZSQg4j0UJ0s2A9xwkhZmjTwQusqPP4S_x2ekzeOBO7nXoZ6HrtA
Message-ID: <CABgObfb7Q_ya+OEPz9VVgFF2A6=x2pBqkPj0=QaJmkrRGpd=6Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] KVM: x86: Use kvzalloc() to allocate VM struct
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 5:39=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
> I'll slot the below in, unless you've got a better idea.

Nope, that's a good idea. Should have thought about it a couple months ago.

Paolo

