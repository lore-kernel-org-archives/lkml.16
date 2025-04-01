Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B599EACE
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 13:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743512723; cv=none; b=VfZ/RKticOkSJdUlwa3ucGmETH6L9v0kjagcp8UdR08O52xsq9HSzzgurOHlMKVCWtKzXSiP5E/7DjyGd/6DXmfPa9DuNtMci8tYw1wmglUVtrRSGiwdPNOlspNAyzvdyR9dzHb4FsFJPbCQNvo3UGRg9n6n00Uuh2K0aTDZ9s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743512723; c=relaxed/simple;
	bh=ZylEpy5ghunQJw2QAROsarSDI2GQsIljU6rIH62rq9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i9l2l5CqF1crQliuw6MpjKBrVlli++O+a8FVimB4AolgQXyrCZ8jz7ogb0Ap3Qe9ViAjuvUBYfdTDPhYD60cKMFS4gBG62sOWJE+PvtxeeQV+WJqZO2iMdu+HakVdApyYIPMTbAQqKeB7h4RjOKnCYUJ90XaNqKtZFqwjt+4G1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qpzu0Tan; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qpzu0Tan"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so831182366b.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 06:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743512720; x=1744117520; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZylEpy5ghunQJw2QAROsarSDI2GQsIljU6rIH62rq9Q=;
        b=Qpzu0Tang9zvuLeksmgBItnLraZoZV1JKOFI0+nuKOArPF8qAvQZMvqv5yv9BYulms
         OagKZyp/nX9/th6diM2/Np+9am7kgbE5U7nmGJKcVcciQnAvL9nxzv3QPpEy+7gXWyNL
         Y9aoCdmWeYXW905x65R5QS/mF+RlagBP1pE8PidIO25q2NMLEc86uVkO49BEtMqePmqB
         uMY4f8/SNgfPRV1kicSIFPJZ9+KUxnq4BnEcegRjkJa8squY66f7WwwPF5eXAgCDePQO
         /dK1C+nUL6SbP2EhYDOUE3aKwqKzQ8jAVG2c5zYO+REesuSx9gigUEQ9jty8/cPUph/+
         sGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743512720; x=1744117520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZylEpy5ghunQJw2QAROsarSDI2GQsIljU6rIH62rq9Q=;
        b=kgsHb6+TAbN5V4RKV0bRslwW5atWHeKWwznru1WCu0yYlZy4PaJxm/cErEzCc0RSe2
         oZ4Ld9p/p8bgLoVOCCTuFKIuar3YYxxUHM7dgJlgjbTt9aV5sOVKmGHU7NHxPjHRDWQ0
         lA6V2EG9eWQtPB0oGJgEZZW1V/JsxTLSyeTChkcs4PMC1+iEnMRvZen3HNoclFzTOp8I
         zYEz2hyVBfU8EQxebjFqIMWdRduZSJdYMDgYGm5IV/7Yn6t8HelFLM4cQvZRHeahw1Mv
         rmquYSHvSWIBDz4vKPcEHdHscWpcwvY49aiqBX6yOZTXLCtpUUs1cJyQX0Hyy3gM9i3M
         Jncw==
X-Gm-Message-State: AOJu0Ywu52GXy5B+NQ9CAISzjGWQQ8HHHq91lAknEq2o41A1yoVprPFE
	PJA5tYETpQUn8onCduT8bUp3ukVmd+YDXIuj+NVyhrFlgV2mRL3J1KYNlVEkK5N2VuV1TUtt2ZY
	HfQAPURA6RcYLPf/3pAIkC83OiB0=
X-Gm-Gg: ASbGncuk73BEb12VHoUIgojcX8GiFu2hkI+SuPE5pDqW3hbaK6OfmGuRo2UDYQBCypi
	etsZ8hUfcjsCeq8ckVGSyBoK7UC4DXtLKB3TkP6txDJTDmeDIKoX7WLuklXDR67pcUIY22nM5f4
	K+qQbtTE3Q+5NpSz0EhH++l3gP
X-Google-Smtp-Source: AGHT+IHTWNN2DaaGZlYl7AJLr6sx3xpMsxWG2twxDimnzl7ct6CjD/8gdlFI+zCpDRp24pN3pPA3UaquhJhKEgX/c74=
X-Received: by 2002:a17:907:9307:b0:ac6:d9fa:46c8 with SMTP id
 a640c23a62f3a-ac738be3abcmr1288367566b.39.1743512720083; Tue, 01 Apr 2025
 06:05:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319195436.1864415-1-mjguzik@gmail.com> <20250319201100.GH26879@redhat.com>
In-Reply-To: <20250319201100.GH26879@redhat.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Tue, 1 Apr 2025 15:05:08 +0200
X-Gm-Features: AQ5f1JoO8v_ZDD2ob1-t_UJMNWAIhZ4-R8G_MbLHsrT6Vj9hu2EkQxy0TjwZiN4
Message-ID: <CAGudoHGzG6stVcsJRHFBhrikBFDFP+6=wRzpDoY5qFqEydksow@mail.gmail.com>
Subject: Re: [PATCH v3] exit: combine work under lock in synchronize_group_exit()
 and coredump_task_exit()
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think this fell through the cracks. Can you pick it up? Should I
prod someone else?

thanks

On Wed, Mar 19, 2025 at 9:11=E2=80=AFPM Oleg Nesterov <oleg@redhat.com> wro=
te:
>
> On 03/19, Mateusz Guzik wrote:
> >
> > This reduces single-threaded overhead as it avoids one lock+irq trip on
> > exit.
> >
> > It also improves scalability of spawning and killing threads within one
> > process (just shy of 5% when doing it on 24 cores on my test jig).
> >
> > Both routines are moved below kcov and kmsan exit, which should be
> > harmless.
> >
> > Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
>
> Reviewed-by: Oleg Nesterov <oleg@redhat.com>
>


--=20
Mateusz Guzik <mjguzik gmail.com>
