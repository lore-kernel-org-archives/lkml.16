Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3198F1C2DB2
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 06:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738478269; cv=none; b=H1Qae2mnq9TRezvj2JFzCuoes92ghOljzgb3iXCMsC0esXwEjuToJx4Lx3mcnT+WOE55mKQsOATciX41s1Fl3P0YWFBtQsO8HfM2IxIHtGq0z8i68DREPcGe8VG31gP1oPtrpmY3epvBTE+earJ5VIgCQ8B+QyRqpBipVMmAmgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738478269; c=relaxed/simple;
	bh=ZE141DfKW7Je97SuGuDXiTvEfzvyFvIIlvmWSKHBrSU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tIG4UIuC6MUmhBrIZclOmNif1xYkkG/6Th2sXYYlwVvd1GNtAOi9KCXp7VItITIRZhjlkQtP2KzT+mPmDn7tx4gW75xcrG9iNgiL11CXuU1UFagkQ7xhQwttNHP6XP9iYvy2SlCYU83AJvv9gSL5Fh4x07Nhopzk1hoXy+BbhGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wnliu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qpMJ1YJv; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wnliu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qpMJ1YJv"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-216311faa51so59620745ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 22:37:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738478267; x=1739083067; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A9NvLmW/A6uUOB760Lj7I76Wak9fBpOpnPabjMwc01o=;
        b=qpMJ1YJvon2WPQJvkL1C2zLjBBKyp2zsPqOxqshF/mI2309D7CIhzanHZ9qjd3DNmy
         G/VYsb9ssLGLa8ObnnTIcAdkScD3g/FMfze36UM88KS4qnQ1HiWZTuPxh0XwCM4b4JFo
         hW2I/+kQzGtNdSOERNkg8pFB7zGWNTEBJJvZt+kgPFcszD1NmddllT4mjcIvxJvFg3Gy
         CBJUw1M5rd1pd7uCscKRxaDjsjEm4rBicQSG87bjAWZlSje5/rfmFIhVGvmBgbQyFoUw
         k+9Q7ycjlrjQeBlPQL2g6ZIdwQBK4PG3JskI2SNun91xq1toBucbHUrCP42j46AtZ4LY
         kGpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738478267; x=1739083067;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A9NvLmW/A6uUOB760Lj7I76Wak9fBpOpnPabjMwc01o=;
        b=K00QnLpmumiFyw/sV0VCOMPJlFy6vrLbUymHeRCYRNEGc8TG5SYKEWm6aPtwI/5U1V
         lomsSyZvE/wAyQNTxiKqVEvcy/5JpclqZOBBHV/J3TnqaoXImxohf/8HjsJJ1nsurNYp
         1s8fXQ7DF/ksgHFNHrryTZ1i+UEAFtA2+582m4GE1w/vH/BGLsbSOnZ2APO/W/SU9QRo
         8+7GAOw1Rzsmp96eFYgm+lM6N0zJGacp1T1zfv6BEDK3yPWMuU/woE1R97DXuTrUuAUT
         teg+N+QZlHbBqYur2l+b3J2S+uY8dhth5KoXbtyZiW1h4nfjEU/DWeX0ua8dJOCV/grG
         23xQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMNSKBcA2OfIHBV6w/ihJDDfKxmcMpZXW1FgR1+qzWxVgP1vKihLnpsraX3msTDtOtV5NsPen4O+jWTVo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGZOTwKpr95N77Hi7q9T2DIIzNYtnkp/grF+GuHUDQiSpwTbUZ
	HkgusBrWKetzWvnGFPdlN4CmmldrOml/T90DuDYcQR140KonwUWDWZmT+WX2mSMxDcvBr+bIVA=
	=
X-Google-Smtp-Source: AGHT+IEViwf7ftDA47jzjJ4JIFfkYBeziUL/Uim6LKs1f/dyvgToTVzbkfLeuhfa6q0+31njXbcGNfqpzQ==
X-Received: from pguy8.prod.google.com ([2002:a65:6c08:0:b0:8ae:4cf4:372])
 (user=wnliu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:240c:b0:21a:87e8:3891
 with SMTP id d9443c01a7336-21edd7eba4fmr152671605ad.6.1738478267463; Sat, 01
 Feb 2025 22:37:47 -0800 (PST)
Date: Sun,  2 Feb 2025 06:37:44 +0000
In-Reply-To: <20250202062728.753686-1-wnliu@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250202062728.753686-1-wnliu@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250202063746.759828-1-wnliu@google.com>
Subject: Re: [PATCH 4/8] unwind: Implement generic sframe unwinder library
From: Weinan Liu <wnliu@google.com>
To: wnliu@google.com
Cc: indu.bhagat@oracle.com, irogers@google.com, joe.lawrence@redhat.com, 
	jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-toolchains@vger.kernel.org, 
	live-patching@vger.kernel.org, mark.rutland@arm.com, peterz@infradead.org, 
	ptsm@linux.microsoft.com, roman.gushchin@linux.dev, rostedt@goodmis.org, 
	will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025 at 2:29=E2=80=AFAM Prasanna Kumar T S M <ptsm@linux.mi=
crosoft.com> wrote:
> On 30-01-2025 15:52, Prasanna Kumar T S M wrote:
> >
> > On 28-01-2025 03:03, Weinan Liu wrote:
> > > This change introduces a kernel space unwinder using sframe table for
> > > architectures without ORC unwinder support.
> > >
> > > The implementation is adapted from Josh's userspace sframe unwinder
> > > proposal[1] according to the sframe v2 spec[2].
> > >
> > > [1]
> > > https://lore.kernel.org/lkml/42c0a99236af65c09c8182e260af7bcf5aa1e158=
.1730150953.git.jpoimboe@kernel.org/
> > > [2] https://sourceware.org/binutils/docs/sframe-spec.html
> > >
> > > Signed-off-by: Weinan Liu <wnliu@google.com>
> > > ---
> > >   include/linux/sframe_lookup.h |  43 ++++++++
> > >   kernel/Makefile               |   1 +
> > >   kernel/sframe_lookup.c        | 196 +++++++++++++++++++++++++++++++=
+++
> Nit: Can this file be placed inside lib/ instead of kernel/ folder?
This could be integrated with Josh's proposal in the future.
https://lore.kernel.org/lkml/cover.1737511963.git.jpoimboe@kernel.org/

Either lib/ or kernel/unwind/ are ok to me.
