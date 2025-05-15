Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58AA2857DE
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 18:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747335394; cv=none; b=hk1GL+dRlxvuoscScPQW7/V2OiPYV1vllSqXbN58X6LeHAvkGXCafNtRun9EOb1CFtGq1nhnRYJhCuqHQCPpVrVyo3AF793F6NqtIuOpzN6SWYnjBIowvKmQP8ldMjU1AyHis2zGXEQcF0P1s5xJyUnX+EpZBSgDozfmyXx+TzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747335394; c=relaxed/simple;
	bh=MaR3vcUFP/5SWC4l3qZeTZr33UQcKSn7W8EVxThObbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DBH/EllsEOmC0BZfYiKmokF9C3Rjy2i4Y9J4YlYdCh5O5JgG+seXRloPFRvSq0RPz4OdUa8nQrfDcVyhcIIkH3RDXK0HO+2xfUHBjaFPU+XwnwCDKyRI5mjk83h3wobtHSD9MUPSkw5x68QOizaAv+g4d9a8C4qDhWEhuEGwZZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cvk4zs/K; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cvk4zs/K"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7c5ba363f1aso171046585a.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747335391; x=1747940191; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zg42WVQMGkCto8epsAlYZ31qKRFNW1xCVfxsff7xyxc=;
        b=cvk4zs/KGGO2H6+3wWIV0zBLsJIiE3yJIPTxcvDfDs6mfhJTF6jIoArIQC86yUH1G4
         jIHfCF9la8qBLhLhKCX+m1m3/hLVYHkRrG2HABcG6ZA7FrCrvQ6NRFKIMyVS/KQ//6T3
         276DcmQe/f6ryzg6ENmYwJWe5NCqdvYmuwV7dCHGz0nNJgWP2PYhZ5aT6TFczqQRxLKe
         2AsfXJXJ0qJ0Lo/wHIkihV+Nu/yZj5SjB6Tav3OK4ltNwB9DSpSkLvxg8AX/7AfaZYSx
         NWajJSCx4vP2hhVksl5vKKv8ANQxX1sLlpMdEyJfHaQoait1BmhU4QKI1oRgDL4pkC04
         +o/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747335391; x=1747940191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zg42WVQMGkCto8epsAlYZ31qKRFNW1xCVfxsff7xyxc=;
        b=sfIXuRxsuKqY2g6GxU/uEYM4E+E4DVKByCowt3IFzdozwGxUodm+gBbip8ejRUrB+c
         IKDT85yeRid2TfRECJ9UN9qvAYFMtu/iRTy2jLzACUt3KCxm07ImGxQaPub5/oJN0vX9
         9Mt1cBXglEgbZN82p4Qhh7xiwO8bcwdeTIQThBeEMCuSfem8rbMRZ1oJdpXvMekzYviI
         fk93c0k9MiLRrL8+dtrV7GZFLLtytgBZ+KQCPF7eIDX2G4khc61ZVP6mBRYtcsKq4JM6
         IMZSJdqR04rn7m4eHUk7zzrN2j+TkBHjxX8s53ilK26+QM/Es9JPW1a7zNjk9L1EhQT3
         +1EQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbnsfwpPML7bYsWKY0Asyr2PMBAGf0I1Om1awO+DeUFCA7rIS3ItFrR8L8pjhESR3a7jSgztVL4iO6Fsg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyY3xria5Hrf40umefrJaCt60tGJillsvonoxrvCjDx1n/ayqI2
	LYDwXKfvGPvG+EVDhw+uAlPS3e16UsmBXL0EaXBmKFPdmMBkhP4sd3PYWLyZrJwViBobEzv6bMU
	E1DSuXLiqz7nhjCSA1K8yLaXYDfUidVXFVXbHFTuk
X-Gm-Gg: ASbGncvix7sOjHkp/1ec30nRqYGobEK/O24oJiDcyp9hEvhMgiz9JwSJiZKxSERDdF4
	gUQ6bfLg8Lff+T4gTLEKg2A0H4LJP8LwQBh1Eru2v2+hW1u03j2YQb2/WogFdVUZ2E4BrbyDKk0
	lLdaORCsU9CN8EHkcPfdBX2vc+x15F8Hg=
X-Google-Smtp-Source: AGHT+IFp4DY6pAywa1qTBfouRmpQp3p3xJvflTnaE1+RwDrDccfZXBbkq5cfQBlYmdSf4Cl3uD3iA/Nov4nUWckfx/Y=
X-Received: by 2002:a05:6214:2341:b0:6f2:d45c:4a1d with SMTP id
 6a1803df08f44-6f8b08ab473mr12029796d6.38.1747335391173; Thu, 15 May 2025
 11:56:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515040207.1253690-1-royluo@google.com> <2025051501-civil-module-63fa@gregkh>
In-Reply-To: <2025051501-civil-module-63fa@gregkh>
From: Roy Luo <royluo@google.com>
Date: Thu, 15 May 2025 11:55:55 -0700
X-Gm-Features: AX0GCFu1lRyBz_42q7jdo1yhWmkZYoPKW-7xd5szs2yzz28wXmyXpvbAOEkBrWA
Message-ID: <CA+zupgwv-LPJJCwkwGUm69xtNTN91qp+gdbYnCdpwNoTNiHF=A@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] xhci: Add a quirk for full reset on removal
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mathias.nyman@intel.com, quic_ugoswami@quicinc.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 12:33=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Thu, May 15, 2025 at 04:02:07AM +0000, Roy Luo wrote:
> > Commit 6ccb83d6c497 ("usb: xhci: Implement xhci_handshake_check_state()
> > helper") introduced an optimization to xhci_reset() during xhci removal=
,
> > allowing it to bail out early without waiting for the reset to complete=
.
> >
> > This behavior can cause issues on SNPS DWC3 USB controller with dual-ro=
le
> > capability. When the DWC3 controller exits host mode and removes xhci
> > while a reset is still in progress, and then tries to configure its
> > hardware for device mode, the ongoing reset leads to register access
> > issues; specifically, all register reads returns 0. These issues extend
> > beyond the xhci register space (which is expected during a reset) and
> > affect the entire DWC3 IP block, causing the DWC3 device mode to
> > malfunction.
> >
> > To address this, introduce the `XHCI_FULL_RESET_ON_REMOVE` quirk. When =
this
> > quirk is set, xhci_reset() always completes its reset handshake, ensuri=
ng
> > the controller is in a fully reset state before proceeding.
> >
> > Fixes: 6ccb83d6c497 ("usb: xhci: Implement xhci_handshake_check_state()=
 helper")
> > Signed-off-by: Roy Luo <royluo@google.com>
> > ---
> >  drivers/usb/host/xhci-plat.c | 3 +++
> >  drivers/usb/host/xhci.c      | 8 +++++++-
> >  drivers/usb/host/xhci.h      | 1 +
> >  3 files changed, 11 insertions(+), 1 deletion(-)
>
> For some reason this is not "attached" to patch 2 as a series, how did
> you send this?  Did git-send-email not work properly for you?
>
> thanks,
>
> greg k-h

I didn't send them in one batch so the reference message ID is missing
in the second patch.
I've corrected it in v2, sorry for the inconvenience.

Thanks,
Roy
