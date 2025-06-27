Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1331BBE4A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 12:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751028658; cv=none; b=LNQnmS5PvsZv7CR/teIbKwhEAaxPsrxdpKQJUWbE8dFQ6q57C/Bf2i3IYvju8YQvwxYqM/qtwe4sPXtQvZuYys+K885Z4k1WEJb3KA74/UHKzmy7ihReaZxd0iuoblA8UCs7BFKzEav+v9z5QVDSzEKJICuUvoI2PYrzyMv2jUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751028658; c=relaxed/simple;
	bh=QCJARtglO2LaY2IHKh5t2U/Tlklxb0ibISPLcSbmuzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m2SwxhQa5salepn08KP9t7X8vb3qYFwA/Oc8T9DCvjnAmm8u0qe9YlyNjdVSTmhZF6H8RZHSPVovaWpY2cfNAEP36z+Eyi8hiuf7bW1KDuJ9O1XfN1Ym6TpuYbUunXzYplCVkJRbRFq2rodfnMEMYb6+VLiWNaHvEiRqWdg70m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nGUio8BS; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nGUio8BS"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6ecf99dd567so24407796d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 05:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751028656; x=1751633456; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=idturYgqav2RqhmzofSv+DJRMZDL8II+nd4+G+NHC8w=;
        b=nGUio8BS6ZlpExukdx8F5eRR6u8EPnB6A4rMQ0cs9cYdcQQKNn7KIpobF07TbqpCdS
         kAr85FID+gXteQZ62QDRuQdm8Cvp+kzD+s5Wwc/FKmPCk9QXPGHp50EhwXeXLne4H5Q7
         Y7rz4pbrGRALARcJkKhORsSCV6tIS5AAI/zvU3VG7BdQZkdlmM4iA/4UpXkI/L5xzLyS
         9ohdDPGoeJ09gygD44xZlj484s7plGa/KLosYmI4s7iz4wagD9QxynMW6l/oFZFPNQND
         84zGA7J5mDEdM3J1fc+/mIbFbbFaOkqaUdhPehtaTkSgUwQR6gzvpTtFNY21FUD4OD+T
         KfAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751028656; x=1751633456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=idturYgqav2RqhmzofSv+DJRMZDL8II+nd4+G+NHC8w=;
        b=ncrsBQFf8tZD1ckIAbMy8EqdyDQehoEkU8GEITCa7Mbwzek5B5hdKKuld0KixDloxV
         CZmj/aaYtT/RZJ87Q/V977DAHaKZtscX86eqlR7rE+SwrmnagWdCJ5Nw3TOFRsopjc0h
         QFdMjOYl7sL+RqkIsYMTIo7Z3usfJT/l0M2oTSHWTNjwAV4lEF9adKCcPhFcfrMUiuv3
         JZQY1wnE1sCllqT669mXcu79islg7x5DPm5eG1qvC725NY2h6BXwvQdNaNDOdrGqMFS1
         jRcvot2wH1GxR34G23bz5vEsVQIjIDmif21PdMrzWHleT38CF8+K/Xgx7Vsl2MgbVzK/
         16zA==
X-Forwarded-Encrypted: i=1; AJvYcCXBcdgVLNuUn/fHhhquCw+sFwudN47nwCbLWtrqhhTm6ga1I+rxF++qyGArLq4ZCBusZesM1DOt+LTv2l4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuinMj3x+N9wyYbuVvGdhUEw0wZIo8EiuoEvHYr8gPU0NXZleD
	kvugvimSJ+DLX3ZJPbrPrG0A+m8pUE3M3hbBFnR7yXtMqN9qxCIyLOKgPSeefuNicem0tDiRQHQ
	XZX5YBB7z8cnPQM+KYe8C/xy5tuHOJCSHz1CTc6oB
X-Gm-Gg: ASbGncvVy0pf7K0hW9DmyGHdDoV1DkA35JpljQkZ9U+Q77kMQk/BzKyVrP5BpleSDcz
	C9YIaP4KTL/+EbKbZQGVuRhud11iYpV0nvM7/1q50qA+1LRrsBUg1nrn0CbA5YOeZdR6cGFVTvs
	S8q/znaw/zONeGs/bPWg4ZnEdMJLuiqK6IV1sCOvZEcNW6XwhZ+Yv0tDDciMM8GTuDYQMCcauAe
	zDuh/rZvT42
X-Google-Smtp-Source: AGHT+IHIU4LDEs67YWr+lK5C2TD7HbosAimrfZGq5Uf+Lz6Ud+fdIxcudZiyYZLVcgNSr+MlK/m5GD+tabyL7OnlGNM=
X-Received: by 2002:a05:6214:459a:b0:6fd:a382:f86f with SMTP id
 6a1803df08f44-7001413116cmr59746306d6.34.1751028655727; Fri, 27 Jun 2025
 05:50:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626134158.3385080-1-glider@google.com> <20250626134158.3385080-3-glider@google.com>
 <20250627080248.GQ1613200@noisy.programming.kicks-ass.net>
In-Reply-To: <20250627080248.GQ1613200@noisy.programming.kicks-ass.net>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 27 Jun 2025 14:50:18 +0200
X-Gm-Features: Ac12FXwxKj33euY6ZH-yL0eZIHyMTugesDF-zJKSuw4473Kt_nozRUjRKba6tvg
Message-ID: <CAG_fn=XCEHppY3Fn+x_JagxTjHYyi6C=qt-xgGmHq7xENVy4Jw@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] kcov: apply clang-format to kcov code
To: Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, Aleksandr Nogikh <nogikh@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Marco Elver <elver@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 10:02=E2=80=AFAM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> On Thu, Jun 26, 2025 at 03:41:49PM +0200, Alexander Potapenko wrote:
> > kcov used to obey clang-format style, but somehow diverged over time.
> > This patch applies clang-format to kernel/kcov.c and
> > include/linux/kcov.h, no functional change.
>
> I'm not sure I agree this is in fact a good thing. Very questionable
> style choices made.

Adding Miguel, who maintains clang-format.

> I had to kill clang-format hard in my nvim-lsp-clangd setup, because
> clang-format is such a piece of shit.

Random fact that I didn't know before: 1788 out of 35503 kernel .c
files are already formatted according to the clang-format style.
(I expected the number to be much lower)

>
> > -static inline void kcov_task_init(struct task_struct *t) {}
> > -static inline void kcov_task_exit(struct task_struct *t) {}
> > -static inline void kcov_prepare_switch(struct task_struct *t) {}
> > -static inline void kcov_finish_switch(struct task_struct *t) {}
> > -static inline void kcov_remote_start(u64 handle) {}
> > -static inline void kcov_remote_stop(void) {}
> > +static inline void kcov_task_init(struct task_struct *t)
> > +{
> > +}
> > +static inline void kcov_task_exit(struct task_struct *t)
> > +{
> > +}
> > +static inline void kcov_prepare_switch(struct task_struct *t)
> > +{
> > +}
> > +static inline void kcov_finish_switch(struct task_struct *t)
> > +{
> > +}
> > +static inline void kcov_remote_start(u64 handle)
> > +{
> > +}
> > +static inline void kcov_remote_stop(void)
> > +{
> > +}
>
> This is not an improvement.

Fair enough.
I think we can fix this by setting AllowShortFunctionsOnASingleLine:
Empty, SplitEmptyFunction: false in .clang-format

Miguel, do you think this is a reasonable change?


> >
> >  struct kcov_percpu_data {
> > -     void                    *irq_area;
> > -     local_lock_t            lock;
> > -
> > -     unsigned int            saved_mode;
> > -     unsigned int            saved_size;
> > -     void                    *saved_area;
> > -     struct kcov             *saved_kcov;
> > -     int                     saved_sequence;
> > +     void *irq_area;
> > +     local_lock_t lock;
> > +
> > +     unsigned int saved_mode;
> > +     unsigned int saved_size;
> > +     void *saved_area;
> > +     struct kcov *saved_kcov;
> > +     int saved_sequence;
> >  };
> >
> >  static DEFINE_PER_CPU(struct kcov_percpu_data, kcov_percpu_data) =3D {
>
> This is just plain wrong. Making something that was readable into a
> trainwreck.

Setting AlignConsecutiveDeclarations: AcrossEmptyLinesAndComments will
replace the above with the following diff:

 struct kcov_percpu_data {
-       void                    *irq_area;
-       local_lock_t            lock;
-
-       unsigned int            saved_mode;
-       unsigned int            saved_size;
-       void                    *saved_area;
-       struct kcov             *saved_kcov;
-       int                     saved_sequence;
+       void        *irq_area;
+       local_lock_t lock;
+
+       unsigned int saved_mode;
+       unsigned int saved_size;
+       void        *saved_area;
+       struct kcov *saved_kcov;
+       int          saved_sequence;
 };

(a bit denser, plus it aligns the variable names, not the pointer signs)
Does this look better?

>
> Please either teach clang-format sensible style choices, or refrain from
> using it.



--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Liana Sebastian
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
