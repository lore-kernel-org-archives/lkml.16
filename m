Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BA95234
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 06:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738477653; cv=none; b=jhCL/RwxNrwRqHPKo8bu4geUdlbABsMjNo4SMWq3aOwETy5oEkKXcH3fyx3hRpxVZ3vX6y9Q68cKXplWEMX99/NoQIQRoxJYNp0clDBHgH+pBu5NeUxgGJdqZOz3Rybd/w1MGmPgUqN/jGFa87FjR7npimAyEaJgc5GqsHRaBPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738477653; c=relaxed/simple;
	bh=f+6PE04tBqUA7XgPrlbsy9d/p740lDsfjXrcmB6hwik=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aRUxjZ8RNIb4U+G19FLypWpoBhTFDXwXdUAFxwuML2xL2O/xswgkKUjrs61yZ2U22FK+08bQn9ZVLNR1TQDuxlNMMj6R1pIOaMRfxBT/GggD3zAOJCPmcijJvOKXPIdfq71iROh6yZVQvmOLz2S4n/JSz7qGaz0Kx468QcvS/iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wnliu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cbGOrHK4; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wnliu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cbGOrHK4"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2163dc0f5dbso74751155ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 22:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738477650; x=1739082450; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8S4uOKu9VVqEe7X7KKiTHi9neVV7GE5d6hnqB7Mqor4=;
        b=cbGOrHK46TqXbKspnIhxh1FTIjfBrQiXVjzRYq0jrZFskB1zk7tjnZxn/DbjNMFAc0
         HBVtQ2LWgVcGrXA0Ja09g8pHIwrx2MrKBsBAkxCrCZwIQs3fmcdMBJZw93ILdknftKIx
         PRQbWt6w2AM89d8PEMMNxqL4k+/GtskXPnfbpE4YS7sRjTVO/H+XtuYD1o/4BlA+6ngB
         cFUQm5QrjQEb6ov/EJyFYa+Z5+UmyBEEUH44vuAQWe0GwH7dGsOYPt9dWPXKK56hPW3k
         qVQZdxqlnwFpOOiJ4oRBA5WbJH+rnFCD6DUKzgSpF9m1V0MnVdvlCDfcuxaQPwlE3d0+
         bbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738477650; x=1739082450;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8S4uOKu9VVqEe7X7KKiTHi9neVV7GE5d6hnqB7Mqor4=;
        b=ZEUI4gV+ZKmrdUmvrfxyxcawqmv7O4UQmTzofGrzKW9ePIv5nBrlWVhvxahmilEsgZ
         jrvBrFXCFVzHSVTnRTbhHaNWzwR6GJlS827ZxdP5nadKD81WDikgIG/6qPdX+anO/Wok
         gnlfGDqdwzywyq3XuZfHz01eYp7XVYjrNnQ/dICJn+002IuUAktSOxe/AqkVTeUoTjql
         9onNBwr/F8y0/wua6kfvyRbWklnFnZ7j20asrlRhURO39hkqUJYyMsDa5YlF2YFu/1G5
         S3+wijSSygCbGF62vuPBY3l9LOy7BB4rem43SAUL9TeRUFaCZtf2Ucr/WgrieGPoR5/n
         hNqA==
X-Forwarded-Encrypted: i=1; AJvYcCVTSh6v5Q1nNUeSfJJNyVqjMQtaD6HaIw0sD7b8SxDhxp2fwvLsIHn34tAQmoJ2ZkDhSOYAaarbaJ2eT/0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrsej1SIbyfeTaRcsavIdb5/d7/PNjU4sJMMd3xOH0Z5sVeNa7
	b/vXcGft1Zcf/XrUxxVtHzJiagzSFyzfkb0yBorvUxzANvvYRIGv3IgpxN1MgD+SbbZqNezykA=
	=
X-Google-Smtp-Source: AGHT+IF3pmgNiuLZzWrgGalALOUS4W82S7JLp/JXMoTR3Y/cAA5r3Na5/8SbPDs9t8W/vbG9IazixpuGrw==
X-Received: from pfbjo16.prod.google.com ([2002:a05:6a00:9090:b0:725:f324:ad1c])
 (user=wnliu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9152:b0:1d9:fbc:457c
 with SMTP id adf61e73a8af0-1ed7a6e0009mr32711616637.36.1738477650356; Sat, 01
 Feb 2025 22:27:30 -0800 (PST)
Date: Sun,  2 Feb 2025 06:27:26 +0000
In-Reply-To: <c034b597-e128-4356-bcc9-79fb5e39a844@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <c034b597-e128-4356-bcc9-79fb5e39a844@linux.microsoft.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250202062728.753686-1-wnliu@google.com>
Subject: Re: [PATCH 4/8] unwind: Implement generic sframe unwinder library
From: Weinan Liu <wnliu@google.com>
To: ptsm@linux.microsoft.com
Cc: indu.bhagat@oracle.com, irogers@google.com, joe.lawrence@redhat.com, 
	jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-toolchains@vger.kernel.org, 
	live-patching@vger.kernel.org, mark.rutland@arm.com, peterz@infradead.org, 
	roman.gushchin@linux.dev, rostedt@goodmis.org, will@kernel.org, 
	wnliu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 2:22=E2=80=AFAM Prasanna Kumar T S M <ptsm@linux.mi=
crosoft.com> wrote:
> On 28-01-2025 03:03, Weinan Liu wrote:
> > diff --git a/include/linux/sframe_lookup.h b/include/linux/sframe_looku=
p.h
> > new file mode 100644
> > index 000000000000..1c26cf1f38d4
> > --- /dev/null
> > +++ b/include/linux/sframe_lookup.h
> > @@ -0,0 +1,43 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _LINUX_SFRAME_LOOKUP_H
> > +#define _LINUX_SFRAME_LOOKUP_H
> > +
> > +/**
> > + * struct sframe_ip_entry - sframe unwind info for given ip
> > + * @cfa_offset: Offset for the Canonical Frame Address(CFA) from Frame
> > + *              Pointer(FP) or Stack Pointer(SP)
> > + * @ra_offset: Offset for the Return Address from CFA.
> > + * @fp_offset: Offset for the Frame Pointer (FP) from CFA.
> > + * @use_fp: Use FP to get next CFA or not
> > + */
> > +struct sframe_ip_entry {
> > +	int32_t cfa_offset;
> > +	int32_t ra_offset;
>=20
> The ra_offset is not present for x86_64 in SFrame FRE as per the spec. I=
=20
> am wondering whether this struct should change based on the architecture=
=20
> or just set ra_offset calculated from cfa_offset for x86_64.

According to the https://sourceware.org/binutils/docs/sframe-spec.html#AMD6=
4
For x86_64, RA will be stored at a fixed offset from the CFA upon function =
entry.=20
The ra_offset will set to sfhdr_p->cfa_fixed_ra_offset during the initializ=
ation
of the sframe_ip_entry within the function sframe_find_pc()
