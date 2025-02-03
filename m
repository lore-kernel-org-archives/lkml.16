Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FFB20125D
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 10:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738580157; cv=none; b=XyjEqipt1MN5SQMOfXhztIct13Mav2EFmayaqp3YeZuL3dg/5yWEzkCSteKp02G0GMLBhJFgMHr5atWuumMt1Jb5fBs/UXv3Pym6OHI621ZqpGOUoMiDVeGO9XvHsrMxjbJXlOnes7Eszz62gFK/rPcPmxLDRdtmS0ro5eUzdNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738580157; c=relaxed/simple;
	bh=/xMdp+OR8wwy6+XfSSMPDQAmvkZdV111tF4rmkARnCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LfHOXMo8+RnzKm2t3IPov1M2PkOHHYic6suxMgFzPRYPH6GpkPvRCGevVC7wbDsKkJ8wpng982amz60jmWEX0M6J0ahqwrRuRakr1fHidDd4qp695z6QC9x6JO0ER6gNI3lx6WEpAFqq6k7HcZ7E5VwGkpPZS7ssUAI37rmtCB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IVNl1CU5; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IVNl1CU5"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-85c529e72bcso756878241.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 02:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738580154; x=1739184954; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+rUm5KJHkxiBfXtuHfaxFq0/vaTdZZ4HaHQLNH5uKBU=;
        b=IVNl1CU55JIEkFisX5t66xbnt9ajW3J9TQlLvAooBXE4yIubA0P10aj9ybVbsAMnt7
         JxNETEGwbhngV5ifsvXgUhf12L2lLghZ/rvw6rTNLG8HmCzqXvycKbBLQhMqlLgOx+24
         uKNwe9y7VTH3VLNhtRa40JJUMFhlMRRUWtCRFAhuRqm4nwpUEx0S+i+CaHjChZrZHyFb
         4jNIFY07xUDRp4EAintBZbxjsjGFtXXbboGG7rtJVmWP/rIcH0EZAZuivvOlTUUjyrMx
         3kzDllI51iqlhSXUYYHeXAyqUVAi380UR5HuNZnNMT+F7MRca714WiT0FPcma3f9KJlx
         dIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738580154; x=1739184954;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+rUm5KJHkxiBfXtuHfaxFq0/vaTdZZ4HaHQLNH5uKBU=;
        b=OpJoCWFciL9wKWZSDenRZ/QjU6PmY5zt8so3FZS2kumhZtaIkc70zQzXKd/V3dBsx6
         ayP/8Zq+vDxIHKYcnSevog6Igcu7Mew38gbAhLtVKR17ZUeLT8kkKlXxzhJJ7jU9WUNz
         +FKqMmSljLRitEsvVY7td5ivPh0Ocmzp+Jl+Kr4bcBtRCPY5qUgHiEx7ASvWtahM18ib
         xeBWF++p8A5i+H1XwuW/vhai7oVHOoDWYdo81k4xIdohvn48gCDu08eDdbJNqzFC2Yk1
         9/eRSEMiqtTE9PAMILp29zvKPvDOWKBlXnAxLX89/A4gluaIaNBIbxW6js3rfvptS68r
         R4xA==
X-Forwarded-Encrypted: i=1; AJvYcCVX/SfPmSFCsF6x8fCDFmZGawW13jr8iVqARXxKYXLhf0FvfTYnYALegv5i63u3djVuRORAxcVVP2UpNQc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl8HKZd+yP6Ux8AVHLdNuIArFAFch/oRZEj/2ZM8FhjJvFLBWu
	AYsFcTTchWcwl1aPGBOU59lM4YkTrX2GzrMEN7dwnLNgY4RgKyQ39Couv2i7ypkIhiBxof1BbBX
	c1Aep5GkPSUFod1xpR8Ny9a8zxZ6JaIRhS5O5mItCf4wiq8Ff
X-Gm-Gg: ASbGncto9TZ3L+lig7zvgMSmqoeQrEZzzy8lkg2+cuJBLlQtjwmFezsTFj5Q4XqYS3B
	cPsYqm5ODMWB+dIEJbVlZpUUCsoyYihsWB/TS8myCySff1dotSIcXBV0FYI2nbRslZ318U4oBQg
	==
X-Google-Smtp-Source: AGHT+IFnW6Bcf5yEVNRCxppgIk0GIS+NVegSyfhXLF4jlT47dmkxc5NDclwM4Eh+voGMzwf6nGRfT3mSuUEktH+lUjE=
X-Received: by 2002:a05:6102:6c4:b0:4b2:5c0a:98c0 with SMTP id
 ada2fe7eead31-4b9a4d25380mr14983804137.0.1738580154344; Mon, 03 Feb 2025
 02:55:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203080030.384929-1-sumit.garg@linaro.org> <15a801d6-2274-4772-bbe3-5d2083b91b64@app.fastmail.com>
In-Reply-To: <15a801d6-2274-4772-bbe3-5d2083b91b64@app.fastmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 3 Feb 2025 16:25:43 +0530
X-Gm-Features: AWEUYZlHY3gLHyf9Kk9Dd9yJHRbDU4x0ELJaNO83enlNss8d1-v3c6HXdESb-lA
Message-ID: <CAFA6WYNJf2axMuxHmMP2OOdvTJc=YEMEAcSDHZDmiinkMAdcfw@mail.gmail.com>
Subject: Re: [PATCH v2] tee: optee: Fix supplicant wait loop
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, op-tee@lists.trustedfirmware.org, 
	Jerome Forissier <jerome.forissier@linaro.org>, dannenberg@ti.com, javier@javigon.com, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Mon, 3 Feb 2025 at 13:46, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Feb 3, 2025, at 09:00, Sumit Garg wrote:
> > OP-TEE supplicant is a user-space daemon and it's possible for it
> > being hung or crashed or killed in the middle of processing an OP-TEE
> > RPC call. It becomes more complicated when there is incorrect shutdown
> > ordering of the supplicant process vs the OP-TEE client application which
> > can eventually lead to system hang-up waiting for the closure of the
> > client application.
> >
> > Allow the client process waiting in kernel for supplicant response to
> > be killed rather than indefinitetly waiting in an unkillable state.
>
> It would be good to mention that the existing version ends up in
> a busy-loop here because of the broken wait_for_completion_interruptible()
> loop.
>
> A normal uninterruptible wait should not have resulted in the hung-task
> watchdog getting triggered, but the endless loop would.

Sure, I will add that.

>
> > +     if (wait_for_completion_killable(&req->c)) {
> > +             if (!mutex_lock_killable(&supp->mutex)) {
> >                       if (req->in_queue) {
>
> Using mutex_trylock() here is probably clearer than
> mutex_lock_killable(), since a task that is already in the
> process of getting killed won't ever wait for the mutex.
> mutex_lock_killable() does try to get the lock first though
> if nobody else holds it already, which is the same as trylock.

Let's follow-up on this in the other thread.

-Sumit

>
>      Arnd
