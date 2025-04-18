Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD6B21A43B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 16:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744992824; cv=none; b=Bra2Ao2UINrk0x+3DK7GByWdYsl5gXFvmAL9ih6bRcd5HXJfXsFwuC0MFqvL82mpH2c52qrYjSJXznsdqIsX2VAYav6oaXdA2N48mwq0jZ1zhLorYpZnBymApqgUemCskfm+6Q3Dmo9Nkh92gV2HGXdwVpl58lYeAwLyswuS174=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744992824; c=relaxed/simple;
	bh=PFsVeDzfjNXpckvVtRZ9aDuOFct7fDdGwwko3GzCdks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tbaO4o70jY38a8IKGJUa8gZHYqegW40MRsipWBA9rXe9WPStY2XdTuBfkJ65+AQDC4ElufPE8uJb4onpcbuRH4LNT5DO88xx9GnujP/JOYCfRPA34jcU5z9e3T9clltPmM4ljyd+s5RO0f6fYOQdit37eSfOjEITOXj+rKhS23g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=OFoSb3o4; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OFoSb3o4"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2c663a3daso371287066b.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 09:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1744992820; x=1745597620; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DjKOuF0LawJr9MXck81w1cjBR7uD0wLAWY1r0WgV90U=;
        b=OFoSb3o4Ve0ofXZ7S8YE2AZpJaQzcYrhAZyVdzdPunXhobOO/QGZcNsRV1vzAMHW/0
         wHkqnyZ8so13DRb9B/zOkLszMhomswobeEY/v6lc0AHaL9pUZojoq+EQ56t+mfvcuF0i
         zKy+wfIgAor/exJSWeSlhz0Wqfs/OgFIKSp2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744992820; x=1745597620;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DjKOuF0LawJr9MXck81w1cjBR7uD0wLAWY1r0WgV90U=;
        b=ZtjhiuY878RJrYf0vMF80L1R+w7V/01U3WlN6zGqblNd59vwJsevxsirx1nZkEswOR
         yE0GLtIKOQuTGLuGsIrRQhk1Lw5ugCnoTcZTOmPhp+07JccwmOQ6v2ASNxgHY6dlahgB
         g97J/0cSVFy4LCtcIF8l+AT8V0O/DH1qcMCAKGxH/DnQJTp7wx5JzEEimV3riS6fZ98d
         Z0a7yzNJdbfTgoHnAGZU5cQ4o/vssxQj4fai3ZufXyOZKQlj+E/QvqRXhl9pqPf3cnAp
         DpW2Wzxz8ZbOVkW8Dt+uJPk9xlesjEoAX4NDHJzPhYYvgNia3gh08+2/psW7sXBWRSug
         Njxw==
X-Gm-Message-State: AOJu0YzzC2cd3a+SYbI4nrlAUPydVX3DG5RRtf49zMISBlDvTrDCrqoZ
	NBi1lVbhtoTnk47EEGr28ziDOHnnro7liMDXf7Q63YSzNnHRduAtP+jaGN3JL6jA6cYlDGbwyKI
	DiGQ=
X-Gm-Gg: ASbGnctSwzSXe4VacyIfHAgaeclyN8O1iow9Br9J29k4D/96UUxezL+jup2h223aVNA
	O7Y4XsVyRXw7Sp8uknIz932ARdPlXJMauC0JWRkSLlnSehdJAIgOVA32wpEl09ssl+pKUkERcLn
	xL7ii92dyw/H+ZV3nnXUfasELGgq7sxYyMb/9Ues5ieHefvBZSnfNGVwXgv09L1soICqNeqXDUN
	QSmF80Tics1GPxKnCIuVQvZrJVu2i8S3t0nYaKkCZzNzh0YM7Zmhk7YTht2KruZqZAd/RenAJWW
	Rp/bO8QBG/hgUe4t/6QX+lbVawXhyFNDYyEps5tAlnXpIE/IwT4GF8Ib/Hp8j7c0Bi3d49nSIiB
	hFclnHnG/aJFGhuk=
X-Google-Smtp-Source: AGHT+IHiqY/QJxZSJa78b18i0D+4/YX3033gqG5M1zsA8H3ISo4m6LikBUWv1GMlEQZhPHrlTyEceA==
X-Received: by 2002:a17:907:9404:b0:aca:95c1:876 with SMTP id a640c23a62f3a-acb74b364admr314861366b.20.1744992820230;
        Fri, 18 Apr 2025 09:13:40 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef4799bsm138461566b.149.2025.04.18.09.13.39
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 09:13:39 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac3b12e8518so376322466b.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 09:13:39 -0700 (PDT)
X-Received: by 2002:a17:906:c10b:b0:acb:6081:14ec with SMTP id
 a640c23a62f3a-acb74e8da8amr303015066b.61.1744992819058; Fri, 18 Apr 2025
 09:13:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250418130644.227320-1-pbonzini@redhat.com>
In-Reply-To: <20250418130644.227320-1-pbonzini@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 18 Apr 2025 09:13:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg8VBjy=yrDUmFnvBKdo6eKNab6C=+FNjNZhX=z25QBpw@mail.gmail.com>
X-Gm-Features: ATxdqUERjeqMmefrjujlpH9FygUlViVaOKvtbBM9Be9kRonBwkP0R52Gxhjg25A
Message-ID: <CAHk-=wg8VBjy=yrDUmFnvBKdo6eKNab6C=+FNjNZhX=z25QBpw@mail.gmail.com>
Subject: Re: [GIT PULL] KVM changes for Linux 6.15-rc3
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 18 Apr 2025 at 06:06, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>   https://git.kernel.org/pub/scm/virt/kvm/kvm.git tags/for-linus

I pulled this, but then I unpulled it, because this doesn't work for
me AT ALL. I get

   ERROR: modpost: "kvm_arch_has_irq_bypass" [arch/x86/kvm/kvm-amd.ko]
undefined!

when building it. I assume it's due to the change in commit
73e0c567c24a ("KVM: SVM: Don't update IRTEs if APICv/AVIC is
disabled") but didn't check any closer.

I think it's literally just because that symbol isn't exported, but I
also suspect that the *right* fix is to make that function be an
inline function that doesn't *need* to be exported.

So I'm not going to add the trivial EXPORT_SYMBOL_GPL() line, since I
suspect the real fix is different.

               Linus
