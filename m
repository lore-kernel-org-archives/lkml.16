Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4B025D52D
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 13:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749476909; cv=none; b=Tr9nSSC/4oazj5RdyVrebG2xpyXpIqMxjju19jSPAbw3XQee5rkTLFNyYv116C3uhzPaci07dlXh7tjCCs1z1j/RmHTtWnuUq6EsRjRyUy8HryDFwuWKdoJbvDO5MFg7q1XsBaVPozWXZqvGniNMFTt1XBkxu2Qji0Izs4iuun0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749476909; c=relaxed/simple;
	bh=485fyvGXJ9MMD1/ohEoMDj2zFfDhnj7+hP7ypaSWGPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KrvNwKZKSWYBUeQ8gspQ/Ca3JdtW8bKP8mZHzcYx1aKYhoqK2sGnjQaOMG8/+XRjgLZx2YIE7r+yz89UtTOQ4c3+YwRSj3C4LiNxHCHjBMejBy+uQ5jes/+gHbVb2lwRCtjU6wvMnX024CsQj1KiPSJA9V5m7n+rhv1xYs1usKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TyRl+orA; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TyRl+orA"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4a4323fe8caso29099041cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 06:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749476906; x=1750081706; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=485fyvGXJ9MMD1/ohEoMDj2zFfDhnj7+hP7ypaSWGPI=;
        b=TyRl+orAdeM+kSyFtEn/rgN4TxHdtaCmhz/4184iew/t0sNu+BaRiKwEJZm701urXL
         RaWYRrQlaK4eIrhLRIytu30QBHbbX5sd4XWuNy6DUZPXhWPt8DpOwjV/UaDLITEzsQ5j
         /LVMoDmORxVC3d03NDO6ZCVmhkyE6utYUM0E/ivEdROaITOtq2+XxpZ58Rb9+d+2EhFf
         3rlyUgHZrC3Qzx8N0570bQcs7HfklPonFWNdE2qxmzbNmeuUGzlvNqS/y01HTNKRPC+6
         TbrumHaWrkq51UZxrH1jz0WFlR5NMYZ53DFkWQy2Xxmbf1J9jpHUU7EPeG6JejOG6/o5
         BPFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749476906; x=1750081706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=485fyvGXJ9MMD1/ohEoMDj2zFfDhnj7+hP7ypaSWGPI=;
        b=nT1WV48iQj0DtP4ipajMU1754A+zzVfCkcLRx9zqLN9yiL/qU4eWnQY2d5Mn67QV37
         KuWpC924Py4h7KhFJhFFa97OGTvZbQz15HMwer3yMttBB7rP4nZ6wi6cJGN2HenBhY4p
         9ZBwkOjrCqrV/cM9UNSdDGvKlW4CjbLDV+2Ityo2sOWAS0IFoX5ojgXQIl7KR6DvQXFl
         t0AIVcxZZ76lTyLmxgVuIbKbUfUPi10EliYkNzF5K7q7I8gm1w4jv9wuuad6BnjQmt4u
         sICFthebSo6lINlpH4Boa5LQAQRUCjDyqZsdeOWdxgIwyQOgJci0ABNEeq94Jay6XUbd
         7SSg==
X-Forwarded-Encrypted: i=1; AJvYcCVug3lenxCvO9cxNGFgNRI92Dov+0Z5Tko+seSRwXM4J411tdg263emEPLncO3lq1asD0UDL+ZVKK0zkuE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhxuwb1mQABYQP0ee8O6qNjsuXtMd9E5uGRDE6q6aNLUAxRDfZ
	g1UDSRfvAXt3ooLMO/b3LYy+bRXis9IuGqxw9Z5i7fDeO7EIOVi+cn0JeStOmNlhkctUvQxFLNc
	QjI04Q7KtuCaxvUfhk7iFErgBV2mNjCLGGmL/Hess
X-Gm-Gg: ASbGncsSJJhC/Va517vQiWn92Qa3pUxdeHRLmBThnQADgandU8uJprVBHUsnFOKAkwd
	Kf6M0soy/ZpFH9wsqtBcDQW0gkLIgq9vBTv1libw4ojUMQ5rqkNMaUH2BubVgKs4gKuWNRoXTRk
	U05Cs1/aDCLFAyu/NH2nqSvSQyROBUmmu9Lz9k6P5ii5Ndo3fx74TOJQ8skTqV7t9cpiMrboOD+
	Apf
X-Google-Smtp-Source: AGHT+IE3VXGpsTcil/6jK+ogtLHJlRhdVPrKlqQYS7O9rWrsXLIw0bXWqEqC3qusiBCZEvD2v85r+CoU+6GH74+Sv+w=
X-Received: by 2002:a05:622a:4889:b0:4a4:30f5:b504 with SMTP id
 d75a77b69052e-4a5b9d38035mr226482661cf.27.1749476906141; Mon, 09 Jun 2025
 06:48:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOU40uC6U3PS3cu7RmK71DPA_jbW_ZY0FBkBjCdjVArCiZO-fA@mail.gmail.com>
In-Reply-To: <CAOU40uC6U3PS3cu7RmK71DPA_jbW_ZY0FBkBjCdjVArCiZO-fA@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 9 Jun 2025 06:48:15 -0700
X-Gm-Features: AX0GCFvv8uJmmzoYzfjPQESNuX3bBtkvCudYICdz2lLUWLdVMF8b44y8kUhuTD8
Message-ID: <CANn89iKjjZ2rBBFjMZsPgGWi7-EwVUpJ=jMdkn2s-=BJEjvvuw@mail.gmail.com>
Subject: Re: [BUG] WARNING in sendmsg
To: Xianying Wang <wangxianying546@gmail.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 6:40=E2=80=AFAM Xianying Wang <wangxianying546@gmail=
.com> wrote:
>
> Hi,
>
> I discovered a kernel WARNING described as "WARNING in sendmsg"when
> fuzzing the Linux 6.8 kernel using Syzkaller. This issue occurs in the
> memory allocation path within the sendmsg system call, specifically in
> the __alloc_pages function at mm/page_alloc.c:4545. The warning is
> triggered by a WARN_ON_ONCE assertion in the page allocator during an
> attempt to allocate memory via kmalloc from the socket layer.

linux-6.8 is not supported.

Please do not send us syzkaller reports on old versions, always use
the latest trees.
