Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F56886328
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744996020; cv=none; b=NSLEgwyDggk/JvIOT4JZ8V2Yi+0+Lbx2JONSF8zSuwlDnUSTk5MUXOffvileJ4c1nnzMoM6/YR+i/jHqX1GmMomw04GRsLc308KbwdRwFzrux3qL8tcPz3O+1X6mNT8DQ6ff+NVaR6kAUBppnVU4u1TX2zGLJDizcM92rLn2juY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744996020; c=relaxed/simple;
	bh=dY93s5xlNPJis5maikqoc3nvWotI3/prHpevh2OqyGA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CuCbfRGrZQAXn6NthCcn7OEYAS5f48TEn1+dIfVJlPYGtbXr8CwDNmPwoAjIUIVS5IaLO0eZMPpkl8U9h4BNj8JDOEt/ort89eeKRH9nOKHeIw6HNX5L+slEIm0JZc2NPitZxVu8gZW0lXhVLf9+mepdhjuDhpa74P1br2izIV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ADlXCjlI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ADlXCjlI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744996018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JCApZ9bDM0mTQF/sV1g+0OzRggEcnamk2IjV7dXhr3g=;
	b=ADlXCjlIhwJJNfPu5Pf6fOGO9IcOQz+K66760d+cqXFd1lnvgKwXMgUWLE0mmMgrm1fcfe
	XpIgVZjWuyBLPzCrAyL+H9I8bcc0HVEn15sRKLGXFLOiQfA22AAXPX/9wmn2XmYIWa55NI
	Xygplhj+u47YnijzeqrcA7d8wkwSdRo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-59p-TotMMMqVEJSWT01VYg-1; Fri, 18 Apr 2025 13:06:55 -0400
X-MC-Unique: 59p-TotMMMqVEJSWT01VYg-1
X-Mimecast-MFC-AGG-ID: 59p-TotMMMqVEJSWT01VYg_1744996015
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-440667e7f92so8726335e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:06:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744996013; x=1745600813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JCApZ9bDM0mTQF/sV1g+0OzRggEcnamk2IjV7dXhr3g=;
        b=bpXHBPp/PY32bzwvrGGt/JUDAhrMhB9t/UVjsgMPLBNWf+3E5SARv7G7peL8E0qOXj
         W49kgGsRSmEeIFcofxzUc4VhBR/tZH/Xf9N8Ky+DCH+yBgh8FdBy/N3fQNP5w+Jzyjqb
         iczQTop5oIrYOEBUVkk/Ylg4nveyThTOnQcepvPhPEiP/bdRhnF0ed77R9ggczrNT8fs
         t04CyFM5xMd4nIjSDNheP2gxnl1Rjgo3NAN4uPSGrK8dqt/vKNKNGaAxO8z02lFOMJ4F
         5sVFXZzSbwdM7piar6TrnyIYDfR9X5yV67vHg3BFyywYdOX3QbfepQSC3Yl2HUm9N9SS
         yDsg==
X-Forwarded-Encrypted: i=1; AJvYcCURKXun8x18lqRRjz/CLjhv3HJm4RmUiWmvlv3+hl785E41KSxepjgcmfr6H8Jc86WRA6aHrKajSla6+8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIDkDaUaUEbz5R6SNj1DWUdzqsJB0hYYsK7dzqMHh+XYNw7gA7
	Elde3++/E0PIVE/kcOGDnXNkojBq/pDoiaR9cKAIAivmNsy1qoIpje10Rs86Xx8cl9tjWPKQN/w
	TJI0RyghtqpvMNrU4e1mMVq9BFvzAuJjSTaApGrFSqK6rsI/6EGgEv07KHg+tV1oiRSGOc9uO5l
	W4tDVmP79EMVq+0WZagge4Q8rXUFCgGjLOKsWKebz9jrEo
X-Gm-Gg: ASbGncviarAPdmotaImDRZZSL6JiAM0NaIiqhaPp/PdwwDceuOhGkPmhNR9b+H3fSPg
	N+x6NrX07E62VW0bzEtW8O9bxcMcnb1YmLZwC0+Zvk3AYDE34g34kreXfImLk5lx8SwtG8g==
X-Received: by 2002:a05:6000:40ce:b0:39a:ca05:54a9 with SMTP id ffacd0b85a97d-39efba5ee50mr2302150f8f.29.1744996013542;
        Fri, 18 Apr 2025 10:06:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGz7x52atyEeVRvyvfCStT64ya5TFPH2PFvDYUxHSgzy1LeCF8OUTI2yLx0txV76x4MJr2Vvi2ZGwH65zGFr4E=
X-Received: by 2002:a05:6000:40ce:b0:39a:ca05:54a9 with SMTP id
 ffacd0b85a97d-39efba5ee50mr2302126f8f.29.1744996013217; Fri, 18 Apr 2025
 10:06:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250418130644.227320-1-pbonzini@redhat.com> <CAHk-=wg8VBjy=yrDUmFnvBKdo6eKNab6C=+FNjNZhX=z25QBpw@mail.gmail.com>
In-Reply-To: <CAHk-=wg8VBjy=yrDUmFnvBKdo6eKNab6C=+FNjNZhX=z25QBpw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 18 Apr 2025 19:06:41 +0200
X-Gm-Features: ATxdqUE9eY3BP55w8JgLHlUqGeE4CFznuzmzKqca_g7BChXFjnTJn76AcUaASFY
Message-ID: <CABgObfYzbWspmaEsvSZYkBr1UQ7C5rD0NQ+=UsnSU3OG5tkcDQ@mail.gmail.com>
Subject: Re: [GIT PULL] KVM changes for Linux 6.15-rc3
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 6:13=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Fri, 18 Apr 2025 at 06:06, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >   https://git.kernel.org/pub/scm/virt/kvm/kvm.git tags/for-linus
>
> I pulled this, but then I unpulled it, because this doesn't work for
> me AT ALL. I get
>
>    ERROR: modpost: "kvm_arch_has_irq_bypass" [arch/x86/kvm/kvm-amd.ko]
> undefined!
>
> when building it. I assume it's due to the change in commit
> 73e0c567c24a ("KVM: SVM: Don't update IRTEs if APICv/AVIC is
> disabled") but didn't check any closer.

Yep.

> I think it's literally just because that symbol isn't exported, but I
> also suspect that the *right* fix is to make that function be an
> inline function that doesn't *need* to be exported.

Yes, that's possible since enable_apicv is already exported. Sorry for
the screwup.

Paolo

