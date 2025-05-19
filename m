Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E62326AAA9
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747644115; cv=none; b=CKANm4Y0O2mAjg5GaN+Mmu5cU0bEQd4m8mrM/23FiFmwdfD+6Qk6K+uXSZ3KOTV9nksJmR/I9q3FxVGn41yi+CilhzRV1x8zWGvTaohBsYZSutD3rsHTVGqUjS2j93gTvdh5SmJxUxiknqWmYXOhLlxrASvgVLwdgFNTSOwvWws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747644115; c=relaxed/simple;
	bh=0nx/oTHIkqejYfsAptvCrdthiDzUdgABWyjbNFLntRU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b8y/cqBOPydQM0IhIR44s7sIc/NbIRRGtMDQORKJ9Fn5qOkiGreTZx7kfwAl4WbSwD83jv0NEsp4tkieqNxbjesVc34G5IsNBaKVdduepV58sGYVn6wH38ZC1Fp9jyOAF0Rk/51GO59Zn6ARKJNb5JHDQiuUivfP2Zaq3wJgT1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TpWVy7HQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TpWVy7HQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747644112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=5/93kRZ04MljWKTXpgSsuqhHDlJ+9nDlXduLY3K5LE4=;
	b=TpWVy7HQNrzSEUDAaECFmbXP/Y83wZjUCdxZyzn8zxxFisaXy2dzhUue0OODOLeLyu4QTk
	YRdVVIW2ZR0EPw5K5X21RcQEVIMMfAcCNSQ/EmVgdFCqKJrEZCcGq0f/JlfFlJK1X1C5Sr
	+/loolJjRlllZyn1Fd8w1jArY0fNsv0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-3Qt5Nw2kMx2y4NqR_nm8FA-1; Mon, 19 May 2025 04:41:50 -0400
X-MC-Unique: 3Qt5Nw2kMx2y4NqR_nm8FA-1
X-Mimecast-MFC-AGG-ID: 3Qt5Nw2kMx2y4NqR_nm8FA_1747644109
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a370309dcbso294893f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 01:41:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747644109; x=1748248909;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5/93kRZ04MljWKTXpgSsuqhHDlJ+9nDlXduLY3K5LE4=;
        b=ePsJb1UTLdYCrILRbXFrln6xbRV1HyM0kdtuVkcg4Qb3Ez3sozyaY3BvM+1aBWtGCj
         vveiz0eMYeVHW8Dl6aSqTYXiBkCpEphh1mdYLsDO19Rj+h2GWlk17AEeTPvN/TCciEoK
         i8uc0Ce5sNEBZeXVspcmR+eb87QELN4ZwVLuCcDWn0S2ZBcstSyjtl/APhzvuQmYMYUJ
         NI9pzEciOS+2ECDC2fSHRp5+udVNdGd8dgX7Nlc4HCY5B2787j7TaDLVjwbJdcambKCY
         vjqUHmvGzawkNq1JufWjPWIcwhQK6g12s3agLGTEMxgD18/yIqkh3S7zKpPI849lRYSw
         5TcQ==
X-Gm-Message-State: AOJu0Yzn5R5cioj0E+IxB7Yqt6LZejdbMfa4CTwWlCct/lJGwrWBot4O
	Q8cvkmZwiktKcbnuLF8zx+pJd7TUAe+97R/7STANppijqn4NhyksoyGQL8Rjtu1f9Yjhdk9EQbf
	cxORdc5t/SqSEx0jOE0NdHl09arIjoH1ZKW6dHIkLviyC0c4E2nOIfg411gh+gJZd1Q==
X-Gm-Gg: ASbGncvS6biTAMSSIdsJ/MFyaNnxHTj2hUL6od2aCUm9QumBxZY9r2xbKC+iG+6gEnA
	SvFxQwmdAxQ7+bFwSr7emC51CBGyGBBUYwmg8jWZeBioCWUZG0dTbCiRPsT8dfyFVopL6WpZV80
	TfnvSpIdhRtAY1jkv0DQxtGVaN1lNof8mZVBcLPcrOFeGq3cbBjEXML4zzOd3km6FPLWpfhscjJ
	/sI1ysCipfiwsYVsyxzrteXWHfrC31tjegaad0Pv98+zljTYTUURABuQ5lTFvSfpx+KldfDbzob
	6VynjXTJcDdGYFn1FjJczRHRqEGXZaO1o3KIoA==
X-Received: by 2002:a5d:5f4a:0:b0:3a3:6c61:9d52 with SMTP id ffacd0b85a97d-3a36c619e19mr3264654f8f.18.1747644109319;
        Mon, 19 May 2025 01:41:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH28JFnGXE2eWgrYdBC+axL242T6gdtGDhErZoZ6MaHmnwYhN6EO7AXsV9hXveJ9/cPyNzopg==
X-Received: by 2002:a5d:5f4a:0:b0:3a3:6c61:9d52 with SMTP id ffacd0b85a97d-3a36c619e19mr3264637f8f.18.1747644108994;
        Mon, 19 May 2025 01:41:48 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a366e08747sm8498929f8f.95.2025.05.19.01.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 01:41:48 -0700 (PDT)
Message-ID: <5385360f8f01a213ec3918dbc341f48339d7b8e5.camel@redhat.com>
Subject: Re: [RFC PATCH v2 06/12] sched: Adapt sched tracepoints for RV task
 model
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu	 <mhiramat@kernel.org>,
 linux-trace-kernel@vger.kernel.org, Tomas Glozar	 <tglozar@redhat.com>,
 Juri Lelli <jlelli@redhat.com>
Date: Mon, 19 May 2025 10:41:47 +0200
In-Reply-To: <20250519082908.Nak_YDaO@linutronix.de>
References: <20250514084314.57976-1-gmonaco@redhat.com>
	 <20250514084314.57976-7-gmonaco@redhat.com>
	 <20250519082908.Nak_YDaO@linutronix.de>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-05-19 at 10:29 +0200, Nam Cao wrote:
> On Wed, May 14, 2025 at 10:43:08AM +0200, Gabriele Monaco wrote:
> > =C2=A0DECLARE_TRACE_CONDITION(sched_set_state_tp,
> > -	TP_PROTO(struct task_struct *tsk, int state),
> > -	TP_ARGS(tsk, state),
> > +	TP_PROTO(struct task_struct *tsk, int state, bool
> > from_signal),
> > +	TP_ARGS(tsk, state, from_signal),
> > =C2=A0	TP_CONDITION(!!(tsk->__state) !=3D !!state));
>=20
> Doesn't this break the build? Because the monitors still use the old
> signatures?
>=20
> I understand you adapt the monitor to this new signature in a follow-
> up
> patch. But every commits in the series should be buildable, otherwise
> you
> break "git bisect".
>=20

Yeah good point, do you suggest at least fixing signatures in monitors
inside this commit?
I can keep the other commits to actually fix/adapt monitors but at
least allow building from here.

Thanks,
Gabriele

