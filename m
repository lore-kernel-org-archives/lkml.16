Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E79A1A23AF
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 23:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745190228; cv=none; b=nAkVSx48KW6NBXserWUwpYmJdMf0XYcwHSJwSjDB0/R2TytpYxJWLe+rHFnA2kDKtf79jSnFznMRDRbjJB1ifdAycWIynx56E96D4oNbxiVZuGnqKFl8ikcsE6Uc8rbqrbW64EvG6gA6eId5yR0WYQlTako+DQWQkscYO0qb2+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745190228; c=relaxed/simple;
	bh=LOdqESJ6+vaRZxULRq1zMNqWuKStARp1yitSYBxp3mg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=rdN/i4eSuLbyA11Vz7bO3K9Gqfu2fTfnxbvl4dLvmXl8CU1SS5OOH2jhqFhkvI4XCXBYqb3OWZBIe6zBfbSbMVqsbbdkEMsPs3D979ExisiqUSDj0t+Q5crkS1wjHmnlBky25rVR2vtk4b95QEb9vCVWbfipoeLbTV8RzedYmak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=iD2/KQ6g; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="iD2/KQ6g"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so5797345a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 16:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745190223; x=1745795023; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uc1SpWYdKUw86NbVOiEIz675x7c8RVBtZv7TBp2h0Q4=;
        b=iD2/KQ6gdt09JRTepCro3FAD4ZKGn9HZVjwU39qHxoNPztLL+vFuTZE4HIr5w+2K3I
         867Ji3l2l3Nk8Ei83dm1r22fTbJGUKqXChe/7Oz98poQiVpV25sTsBTYxJT1YtHsgeFY
         EqsczHgA7aExrOCsi+Mry4dD/a/PiU5O+f1mU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745190223; x=1745795023;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uc1SpWYdKUw86NbVOiEIz675x7c8RVBtZv7TBp2h0Q4=;
        b=T2BNIW7YIUxvv7mkqLv5NIj6FaNNX7Z2aFPmOvfPVQZWAfoSM7jJRT4AdxZ5vPoXiv
         nwrCc90MXdhviFq9L1sOKt1cNeVmh0QwC8i1Wul5Z3uapkHyVOpwFm5kJzIvxjpPfy1T
         5m0op/yWz7bSzqdggABUaAnJFfVvXbQfhkErSC+TdkPo6NvV4ql+qp8S3inytpmyRpmK
         kaZRo6c9SGtbXLunblSdSJHmDLYkMPoTiAzvBPFGy7TY9fH3A560vwAvZoVtkqASSSY/
         Ay7vocQYr6hnnyh/oKxcdVg5oPrR2+ICFgbXYjnELWRPU14xHorWAEDM2E7IrT1Bu2tY
         LznA==
X-Gm-Message-State: AOJu0YzR8lznWfs6gWmOVaVm1rEw4PE45zsSDNA78Jg1Ntjd3gefM2DF
	3WANGzMg6aEtDy8GiV/4nkochgafwXqrhqKBGHxHXrxwSW8stb0Rj0U0gBmq9fTZ3lerbYRGhsV
	/7Tg=
X-Gm-Gg: ASbGnctxWtlphpdMWWMXhDBN5jNS8J7agBkVjuTUjaGXWdZ/J6Frg2GQsPWY5+ox4GH
	0H0bIz9qmpfOTd7AijKnts7lJYYduHIFteHypZCRVIW/kPZqySLmrVcvmjM4/VkQtH+dAtvFXVB
	8zn1UIbSW+v1vNvAxJdgvnG/gFXbxZjI+HVl2USMMsvoiWQlulJ+yIP8sXUXOUr3wd6MFJFBqLc
	R65sgBXqMaVa3WvHlqCZ6l5r6pcMMGg0k8hq5Y5sQkNpiZMgLIv4PsxAbWXJ1g7gxKKKtAvANss
	LJ6vp1rrzZe8Lp9EC7ALlWCExty4yGpTePoCdFFiC6q7z56vBEjRR6USpzpdlU7Vd9xXQ46ZJ5K
	UZzjHC+M5e65kvfK4+Tl5DQ70vg==
X-Google-Smtp-Source: AGHT+IE6PPw1ORAvIQ3hJsSo+5qJZPIHRA3o/dLcEWpadRxBcoyykbfEk5jndS7W+tf//qwzwv60vA==
X-Received: by 2002:a17:907:3f29:b0:ac1:ecb5:7207 with SMTP id a640c23a62f3a-acb74b7f3ddmr1124003266b.29.1745190223417;
        Sun, 20 Apr 2025 16:03:43 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef47089sm436635366b.130.2025.04.20.16.03.42
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Apr 2025 16:03:42 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac2902f7c2aso531795566b.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 16:03:42 -0700 (PDT)
X-Received: by 2002:a17:907:944d:b0:ac7:d10c:1f39 with SMTP id
 a640c23a62f3a-acb74b1eba8mr1021793966b.20.1745190222249; Sun, 20 Apr 2025
 16:03:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=wgjZ4fzDKogXwhPXVMA7OmZf9k0o1oB2FJmv-C1e=typA@mail.gmail.com>
In-Reply-To: <CAHk-=wgjZ4fzDKogXwhPXVMA7OmZf9k0o1oB2FJmv-C1e=typA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 20 Apr 2025 16:03:25 -0700
X-Gmail-Original-Message-ID: <CAHk-=whxaq7LGfTcYH7-cG2PhHtSVVMGrfgviqOmqw7UNacaVA@mail.gmail.com>
X-Gm-Features: ATxdqUFinCIr6nSUWwraman_5VKu6dYnNRcqzXXpn-IrXQ-ZnUUO87DfEpiIaAk
Message-ID: <CAHk-=whxaq7LGfTcYH7-cG2PhHtSVVMGrfgviqOmqw7UNacaVA@mail.gmail.com>
Subject: Re: Linux 6.15-rc3
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 20 Apr 2025 at 14:01, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> So everything looks fine, and while the merge window was fairly big,
> that doesn't seem to have resulted in any particular pain. At least so
> far. Knock wood.

Well, that was short-lived - my last-minute fixes to make things build
for me with gcc-15 ends up having broken the gcc-14, as reported by
Chris Clayton.

I try to do my build environment updates when it's all very quiet, but
clearly I should do them on a Tuesday, not on a weekend when I also do
my release candidates.

Anyway, I pushed out a fix.

Hopefully everybody is too busy eating strange Easter desserts(*) that
nobody else even noticed.

              Linus

(*) "What? You're telling me you don't eat memma/m=C3=A4mmi all day for
Easter? What's the point of it all then?"
