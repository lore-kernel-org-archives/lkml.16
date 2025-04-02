Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B571D5150
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 21:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743630265; cv=none; b=n827lg29gROf4Y6me0CQkvK98/hERgOWd3WyRvEwcxp6IPeXlKJAfOz/7Ej72xLprB/hYFS0lIVN4H2R6MmsPgzYaeW9K+GbJ7hlODkuXMeGNF3iI/vAHZEPmXd98oVG1o6s3TbUyfPy566Lfxui+aq6JuUVHtpfhcS1Gya9dkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743630265; c=relaxed/simple;
	bh=FO3SVeco0QFm6hyLBiHLk8AMw/7y51N+SIbiCXOY8yI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pWqO7FrLMDi234+GnQZpqgsgpLSeJyKi9yJFyebwMOh9CiNg0THf2sfdK+FZg/LuD+6o1cks66c8lshgm2d7/gmncZhxESzwTwOcWGWTYc32pK/Vrbz2xCfTXM/u9H7MCet9FIi1gvYwX8Vcy0aGz6Dn+3JVV4IP9VBN7TZTEVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uwET3dMi; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uwET3dMi"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-736c135f695so159505b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 14:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743630264; x=1744235064; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5dc3S/NlQ1HoLivnHDrQdFtaRf+AOoi+dCBbMdqheqM=;
        b=uwET3dMi7X04arpId/FGZ2y/HJnOhexxSISUCkKksyeuBeADbyA85vijpNiUuaIYvU
         lwJW3QmE6WEIV3TgDdvGG3oAzBCiJXGfkQ8sbCEDaoTU32YkFWOmv1Bs5RgHuUa5doN4
         3xsk52KHVGZi8Kr7pDpb+4Aec9/0hQjKab9+ycMsSjEMd2I4Vidzvl+2pAO8732dACUn
         rQXMCfpIJqm1uhAGm+/Doqi5gH88KcWxTUhdquvQV+muS0PdWEgmrM+jjp7m1FjjqNqu
         1JfoAR6XZx1SA6qYdJ65YeVkHP/C/2u0xT6fVLR642iI7AWfSB+qXhNblORO6xBiIU3r
         8L1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743630264; x=1744235064;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5dc3S/NlQ1HoLivnHDrQdFtaRf+AOoi+dCBbMdqheqM=;
        b=Nm1w2TuDTgF5JFr8w193xubvozTxYB9w9gjwO/i/RzLZ5vgtQWFPSMvpX86Isjg48t
         lbyySxzFDDfxodTNOdW2rg6GJm5NruOghIfQBurSQADTPFihz2sKZGHVL1341oe/7qtK
         c1hDv+8IlgUWHXCUOR/qa4gRpA/3PZN2mbV2La9rwjcGdRCBofTv37mQ1an4hiQWF5Bf
         jIQqyF1nGZ8wkrXzjV/KXSBcOZhbFrRS1F36IFWo8gvNsprR7zPlo9ts8EaEJFYF+ZFs
         Uz+xv4alMTeLKw2dMDz8X/0PDHYlRCs2WoQPOa6lwWoeFTcV5DN2qj70tjECENB2I/fq
         dmIw==
X-Forwarded-Encrypted: i=1; AJvYcCWDFUukgwhcPbSO6krTvvlOYGdFUnqgXAIhKM/h7f1m+LkLczM+S1k8ZxLid+TW7RXV+FphXmZoIKe6mNU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNid1uHIzCfBrwPwvAu+Z8ewX5NbkKlQ38ytocunjkxUu8rYHO
	JRPe0xImceccxdhHfEglc/UiP6xPSbDPwRx8tgrUWm+aYdk4fQOArAOglzt2x8EiCqdfzTta3/y
	LIQ==
X-Google-Smtp-Source: AGHT+IFRZiukULQx/2fLXpoCzka/CF3jla1TGJ8jtcm6RRL0keYWCLj/mfa9mFnxvbhxlAP78zp2a3oigdc=
X-Received: from pfnx2.prod.google.com ([2002:aa7:84c2:0:b0:736:451f:b9f4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:114e:b0:736:5438:ccc
 with SMTP id d2e1a72fcca58-739d852cbb9mr388364b3a.9.1743630263625; Wed, 02
 Apr 2025 14:44:23 -0700 (PDT)
Date: Wed, 2 Apr 2025 14:44:22 -0700
In-Reply-To: <63abbc66-b237-4f7f-8aec-e32ebf6c62bd@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250318153316.1970147-1-chao.gao@intel.com> <bd391db213179a52d68bb84531775117805d6932.camel@intel.com>
 <63abbc66-b237-4f7f-8aec-e32ebf6c62bd@intel.com>
Message-ID: <Z-2vtnVhKZpKS9Gz@google.com>
Subject: Re: [PATCH v4 0/8] Introduce CET supervisor state support
From: Sean Christopherson <seanjc@google.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Rick P Edgecombe <rick.p.edgecombe@intel.com>, Chao Gao <chao.gao@intel.com>, 
	"x86@kernel.org" <x86@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"ebiggers@google.com" <ebiggers@google.com>, "vigbalas@amd.com" <vigbalas@amd.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, Chang Seok Bae <chang.seok.bae@intel.com>, 
	"levymitchell0@gmail.com" <levymitchell0@gmail.com>, 
	"samuel.holland@sifive.com" <samuel.holland@sifive.com>, Xin3 Li <xin3.li@intel.com>, 
	Weijiang Yang <weijiang.yang@intel.com>, "mingo@redhat.com" <mingo@redhat.com>, 
	"mlevitsk@redhat.com" <mlevitsk@redhat.com>, "john.allen@amd.com" <john.allen@amd.com>, 
	Stanislav Spassov <stanspas@amazon.de>, "attofari@amazon.de" <attofari@amazon.de>, 
	Rongqing Li <lirongqing@baidu.com>, "hpa@zytor.com" <hpa@zytor.com>, 
	"peterz@infradead.org" <peterz@infradead.org>, 
	"aruna.ramakrishna@oracle.com" <aruna.ramakrishna@oracle.com>, "bp@alien8.de" <bp@alien8.de>, 
	Zhao1 Liu <zhao1.liu@intel.com>, "ubizjak@gmail.com" <ubizjak@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 02, 2025, Dave Hansen wrote:
> On 4/2/25 14:12, Edgecombe, Rick P wrote:
> > In any case, at this point I think we need to either double down on pol=
ishing
> > this thing up (by pausing other work) and have a clear =E2=80=9Cplease =
do this with
> > these patches" request, or declare failure and argue for the smaller ve=
rsion.
> >=20
> > I guess I still lean towards keeping the optimization. But I do think i=
t's worth
> > considering at this point.
>=20
> I'm not quite feeling the same sense of panic and some need to pause
> other work. This is thing is at v4. Between spring break and the merge
> window, v4 hasn't gotten many eyeballs, except Chang's (thanks Chang!).

This particular series is at v4, but KVM CET support was more or less ready=
 to
roll 4 *years* ago.  I agree there's no need to panic, but some sense of ur=
gency
would be nice.
