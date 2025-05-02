Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798521E5B93;
	Fri,  2 May 2025 21:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746223130; cv=none; b=CC6AUJzRfBrp+Rc5oybVRF6BnHFbvGOuXccpHDI9CxFdBWHeVTSh2HFsG+2bp5jQzPX2QrTtBg0UWBX9kOOGV7MTCZR1HEORK+4e728dubN5D1OXVhyMMWZnpIaz4t1G2eHWCwWDKvlPJ+adXkw8IJRazEOd2AwDZfKbzRgcFdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746223130; c=relaxed/simple;
	bh=PCGL9Cy9K5EDQuBSei/ZViLPfLdtAWtDnEbrjy7hlCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sDniOleeS64uLzRNE6M89k9vbJ+Y6ok3yAdLU/dEx/caRUp32TQBlMraD4pUOcSqR5SptjRPT9xJqv9iMcJFmvwWnKQcxnqX2xm6nbmcnEHMGBZ4y29YVR6fFmdBDN4gBafTsl64GtCqExJTVej8FRlcgATWfQcZ4mRILjxZ8IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eCJWM7C3; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eCJWM7C3"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b1f2a3bf3c8so369599a12.1;
        Fri, 02 May 2025 14:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746223129; x=1746827929; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQa9hHRKRfwkVMnDyppAIh6RlIH0ezHMAOxPF4B0VDw=;
        b=eCJWM7C3dW44NQcVLI831sc2mv+WE7JaKljostcTyQCW39fSLTcr06JqgBDyR6TNDB
         pMiS1+iLxBOF2SL47odKNMCzAx6TbvMPRRF1LxckgA0eTRxKDZptKy2zj2Cse4wbSIl1
         GdGNm+p/qPbhRmlgS6lAfkgB9UoZkNsmMncPjFHPF/sJLPVxUjs04mMscCemLXlCLhRp
         nKnsad4ZG2cY9Q5+tvFAs0tsj6aRKRgojhQ2F85+1JvcKcyoSSLKp+exz3LlPpivUA4o
         NF1z1gVuth/kyYjiLpzi/aHzS7936gHJXPoiHpxcIoMXygeQLjzcRvnG54JEWWB6vQTj
         yKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746223129; x=1746827929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oQa9hHRKRfwkVMnDyppAIh6RlIH0ezHMAOxPF4B0VDw=;
        b=rxF1tGRAMwAPi7fa32U3wIKYE1iKsnjbK1NgX/lCDN61CWVdc1kX0y3y9mpWlXtPQ0
         ZIPGgyPha7fiVXmwUui3FDpf9sD7uzl+O5rncRzK4KEO6p1O1O4H3jG52eTfB6R2/Ub3
         dfKUVbJDEyc1TI2xCMRYghPwghDIHz6rqUuY7D9KIZc0NVjx+aClP1/EiAynZZEFVCc2
         3tLS2iij/ocPdCUiP55JTe7Zmgg+LG4w/LSnZ8uIZL00TuxuTRnSwFTeBFf2V66Ze56c
         OoSOSnL3dtkYK4yVxjf93YPvL9IHSNxbYGDWyCSRuWtIRBkY5F6niW7/1vkjv09KajWw
         Fm2A==
X-Forwarded-Encrypted: i=1; AJvYcCX8kntrCluDTcEcdt3qb0Fw651FgBl2ckYJB4n8Mi4i0Mp+afMjaHgUZdPzVGWzkMAyJAe4TYja/X1eUs1JhCc=@vger.kernel.org, AJvYcCXMBgTdBK8699/3KeGpwBPhLhuN+l+RuDSr5j+KFVg5LY3A8XvmUsCUtff/5OQSZvhlCGP7Q11Sbf21Jpw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdtvtrE6VPQ77Y2OiSK0ccVOig39xYOECU0z7vyW1Xsq+jGkAs
	abTdQD8R7esrHQfZOB0VTpt1Ylp0kW80ufmg2ImRWLudkdT4jxLGSh95oiu76egiyLFXRrHFyY8
	K29q5SztVtSncUYYyH8HeFLprxcONGupAyFM=
X-Gm-Gg: ASbGncsc9sjRPiGpQWgrJMz9+jv0AAzt5LI/ftr/rArdhg1V/6B2nx7CNnuHtEImNER
	W1RAUrdPlIYyO7V5SX1hsf4V1bd5NwderCiwI3ScDayLd6Do8F7HdRBvUt8FGdHGRRQLmilRsf9
	xKpOkiS/HzNiyWeIzsjKvKBA==
X-Google-Smtp-Source: AGHT+IEVVRhzqIeAEqPnmTQ5flBVpniw4O0YlZHLnqtHSSeE2jyjspRRVXcOBOpujALvGnFEiqqtfSXrNHonE/4F6Dk=
X-Received: by 2002:a17:90b:1652:b0:2fe:b972:a2c3 with SMTP id
 98e67ed59e1d1-30a4e42fabdmr2495603a91.0.1746223128619; Fri, 02 May 2025
 14:58:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-vec-methods-v4-0-dad4436ff82d@google.com>
 <20250429-vec-methods-v4-5-dad4436ff82d@google.com> <aBJPHUDYBGyAgUNf@pollux>
 <aBNWlC6uSOiFrQDL@google.com> <aBNbTL2dIOFQq8yG@pollux>
In-Reply-To: <aBNbTL2dIOFQq8yG@pollux>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 May 2025 23:58:35 +0200
X-Gm-Features: ATxdqUFCXQN5ukLv1Tk2eMea1VEFPNuPw6rPrIyY_vZSnoH7N5pprspCXNM4CpY
Message-ID: <CANiq72nbxnGNgRNc62mejxxJMe3ZrLQ4kO4xaPxi51GVy6iKjA@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] rust: alloc: add Vec::retain
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Matthew Maurer <mmaurer@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Gow <davidgow@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 1, 2025 at 1:30=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> I really like the way doctests implement the assert macros and how they a=
ppear
> in the kernel log compared to panics through the "real" assert ones, unwr=
aps,
> etc.
>
> I also think that avoiding things that directly panic in doctests (i.e. e=
xample
> code) is the correct thing to do. For KUnit tests it's probably less impo=
rtant,
> since they don't directly serve as sample code.

I hadn't seen these earlier messages -- thanks, I am glad people like
the doctests support :)

Yeah, doing the same for `#[test]`s was planned (see PR), but we
decided to merge roughly what we had from the original author and then
build on top of that (Cc David).

Anyway, I sent it -- hopefully it will mean more people writing lots of tes=
ts!

    https://lore.kernel.org/rust-for-linux/20250502215133.1923676-1-ojeda@k=
ernel.org/

Cheers,
Miguel
