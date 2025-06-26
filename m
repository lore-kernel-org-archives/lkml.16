Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805222F0C4E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 20:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750970649; cv=none; b=M5uhdugYk5Y1ZlHVwZJLOKIBxJzVcJl2cpG4vj5++3nZ//PbHRtC/v3PUGW7LwoqHPKDLtaS9Sun38OfDH0mOMSrHAfIaMvx0CSfvBDB7U6z/wRYiQLcoFV8kWleFAMkZpmOcubak3bCBUP4TX9kQMlsav1S41Tjd5sbWhBmK8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750970649; c=relaxed/simple;
	bh=6AfxQUVh5YrbfQXfMMEOfqQHhWV7YAeM70L9oR6/MOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lt2ebZdgRjdTbJqvgWlxVaDU/naQgl56elPfQYHxCnfVCus/cpjlDaKvWKfRjOzG4H1XwrKcgbDGMfjrp2qC0LtXamO/OJu4w1L1Iab0nNg+f4qsT89xDHE2o7u66XM3sf1dPydkX4bqNk7WFKQBAykc9LaXLTamzzvMko+LZes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NSlfl9Fk; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NSlfl9Fk"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso1409a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750970646; x=1751575446; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6AfxQUVh5YrbfQXfMMEOfqQHhWV7YAeM70L9oR6/MOg=;
        b=NSlfl9FkeqAAs+xi0Ep1bSfwYoJDBBxzDhHvs2Sd79lY3ieV2cOendxwbXOiPz49Pl
         agVKaHuigdib23vZXRVwFEThvPTtVdhlankz+jhwyNjJqVa/VZP0/oLBoE9Z/tr5c0dy
         GKOAhm/Sw94PKeRfUDta0NPJ/Moqp0dwmNYyjjhVqDfWcwthT04KKAuV28GlXyQ+K8ln
         /Oi8TQPT9JQ6ifKTuhjFE7SE6i/xCvDJYJ6+xbulV+j2o3yZD4GS1R5mEjVCMeuC5Gnk
         k/Y6uIqpF1wAwfGATzsPYZyh716B75Q5T7I05pFKQoxSC5J5k2Zj7bBM4XwDilvJmsY5
         jqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750970646; x=1751575446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6AfxQUVh5YrbfQXfMMEOfqQHhWV7YAeM70L9oR6/MOg=;
        b=YWtuKm+CPCUnOIPoDXVJYF9azjeoO1IMmKCd94vNlyhs1+chEUgPyCbAiFeXRvuB3o
         gS3hBGaSlyjSIhRNPnvS3tOTsGggK0ACYQpyA5OVhmuX0hi+9GwKiNEUv6coygyOtdIc
         vve4XeW2ifiCcJOsmyMjOrc/CKrfvY1t/4tkwaz15cFPC7vJs83bPgnfG9qX3dD80Mg4
         ctUJY4NjBXaljOTF8X8v32T/qZFyoIWoPDu68wLBngXGV1wVCfZMp2M22/wOF8ukJQD+
         GB9tG6mbNZQIWv5ImvWuOzI/Gy3iWHY9Oc0eXhbuaBIp1Fboca8K+LeSyHJwnwB4ubqk
         uOWw==
X-Forwarded-Encrypted: i=1; AJvYcCXZRoWIfuytaKzW0aBIs6IwEJi5G0/p8oqB/ovllwSXgus3OY1z4XBH+6hNnKBuOV/oy3njUfu+YiHeY1E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbFZ9Lu82BJvuYPXnZCVnF0XJjsuCKcFBokfDM1ZIDysVslYRi
	OzC5S0xQN+hbvI1aUhUTUwoY/kb4OOWcPC+eix3/558NHQTDY0JIiwyJj6lYxLzypzZKQ7yo5K+
	0yUvLkfAmskwK0UwztknCAtq0guSoDFhPBCyKTHjP
X-Gm-Gg: ASbGncul9dpVklYbEzPzEaNJ+dDnip4IEBNMRJdvF+W8WHSwrkMoRosOHDELQpZTEFS
	Gp+u+a3pFmwZUSHgT+1CBSDlTz30rFMdRYqfloAm+Ann8MhGuhRQ/FnPGGdfYnrysQYmxlfZziN
	NpnQcUtu69xKqPip6FhZGqM60Uq55qvykhdhJe6b573nc=
X-Google-Smtp-Source: AGHT+IH8BULP6tAu0/3WdkDsshXgjY0PeHI7oDdXj6geSIlN82xNwEgewL/ZIIFlgcnyKvWjE7iQMlLR2ZL+9a3lNOE=
X-Received: by 2002:a05:6402:4542:b0:607:bd2:4757 with SMTP id
 4fb4d7f45d1cf-60c8e19f563mr1044a12.1.1750970645680; Thu, 26 Jun 2025 13:44:05
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626145122.2228258-1-naveen@kernel.org> <66bab47847aa378216c39f46e072d1b2039c3e0e.camel@redhat.com>
 <aF2VCQyeXULVEl7b@google.com> <4ae9c25e0ef8ce3fdd993a9b396183f3953c3de7.camel@redhat.com>
In-Reply-To: <4ae9c25e0ef8ce3fdd993a9b396183f3953c3de7.camel@redhat.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 26 Jun 2025 13:43:53 -0700
X-Gm-Features: Ac12FXxQf31QSY3c-WNUJVKfbSYSN58wqYVk4ZyE_IkOT-pI4A3uvkUnKaq-8Xs
Message-ID: <CALMp9eQXkd=3nAaWzg_V4rM2wx=bxyZhXgGLXN4x9CAZG3_O0Q@mail.gmail.com>
Subject: Re: [EARLY RFC] KVM: SVM: Enable AVIC by default from Zen 4
To: mlevitsk@redhat.com
Cc: Sean Christopherson <seanjc@google.com>, "Naveen N Rao (AMD)" <naveen@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vasant Hegde <vasant.hegde@amd.com>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 12:15=E2=80=AFPM <mlevitsk@redhat.com> wrote:
>
>
> I also have nothing against this to be honest, its OK to keep it as is IM=
HO.

I would like to see it enabled by default (when appropriate) so that
we get better coverage. Of course, we should not do this before we
feel the code is ready.
