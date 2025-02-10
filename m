Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4261F4606
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739204712; cv=none; b=Mo5Vg+P/enM7bMYm3fOajtgRBpk8umEOXRD9qRyvX+lXmPQkLWoPyUREqkmJxTohZyqhA0AYtWkhWwdmky0doeLkI3NjEgfNLDbxdnyBpIl/4pUTXa25PGc3UNCl8HcEOIREBcsnpjExFbRMu69uOEafCCOd+Vfr5VRGIjWGrLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739204712; c=relaxed/simple;
	bh=FCiYJE3m6dJEp5E9AYYZVvUr2U88AURFgv082f+Ob8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lCbu0X9cF2p824jrPrtnQz2MoSNv59i7r4zISPMcTZ6BuZW9a7yC23dfhw7YvaO5AwXnnN7n6TdVnqzXwAe6l/DDKSSevalXDqD4hqvxJMYQ6cD0fro1FTXAQdb7UqfH4FVu1alNGNVXlVw6yC/FPHUe/amJLAp18j0MYauAwYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CKur/CDX; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CKur/CDX"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-47180c199ebso416991cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739204710; x=1739809510; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XCRQwJ1QD7FEc1KzbgN8T/wqMvuH/W9jsnGYGuIgbn0=;
        b=CKur/CDXZC0Go3Zfeskw8V5da3A6rC9/VpR8UXR9Gqrqnscb+6FSI3mSm7B9AWYeOp
         96Kh0NJfEb8zOqWLIia1lNYKkx5IsBdB8xfX9NmK1ehmM4LAeULPna9nuNbVWI9vdNFA
         XY6wBh0o4fdhxb03WLf0osCemWDIBZ4sQwCPPiPZ+F9bryrDIdEJh1RaWLg6RUupoTV+
         v7NimkvTsCJ3Ev/Y/uQ/WYWN/10nPf1R02Sy43ZirqMFw2MFZHDFwozol3ZaX9/gGhNK
         Q5B07KMSJL5XxlY7R+Eehk7fAs7KvPBrmY3zHaAntmQaKdx/PiTJAtb7R3vZYguR7Nbr
         POHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739204710; x=1739809510;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XCRQwJ1QD7FEc1KzbgN8T/wqMvuH/W9jsnGYGuIgbn0=;
        b=mRD/EZTnTgjFH2SbaaakNkzuf9agnvYdMpIDe63+5VmmLj0iLBO2t1jIf9ZFb7TYsQ
         wg4lRapGEAyzjK8/6Ut0E7vhV2NuCF3yyWh5h8lvpUHUOW/aekuwad2v8L0Jzks7efTH
         fYmXPRs7QbDt3wy9Whhtx/4vBIwC5aQwtedw7yTgqxtJ4qbDZ9aKl+mf5uD4lISwAnrW
         Z5fdEVpJorH8qrL8PBEpkNkrNL+/u42yTfbWDgUFV356OOSxTu8Kx3vYE0l0bhGHCvZm
         1CM2IoodrPRaAuVU54HP08D4ISMV76/7UbUlvQ96UsgWyt4T9W1v4oehyfM8XVlWuEwj
         CktA==
X-Forwarded-Encrypted: i=1; AJvYcCUBDBhw8WFXiDxcscQAtsQEv/MfCy3TInOltV1aPwtqCWfhSAL47dXWAUatnIc+KwoTi+5oEgvVfmlfxDM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUCFIkkY6lX1O0jxTtKb4bXGUMPLsNrtOwBmr3Joz33CUerpEV
	b2m/eEz5t5qQuHR4eMtcZKOqMIYYBSfvMpGXHXWq3hMiYLEJT7oT0WSePdBkm3tZupMxd27+SKs
	wziO+uKoCmKIQMtfsCLx3/FqzUQZXkTjbzO8l
X-Gm-Gg: ASbGncsWOVYHM9hDa1lZwTbGyB5tW8L0xZR2a/9UFy4sqvauRFmISjxKZ16PjNfkayB
	fBPWBjMZ3Pd85zE4MhrdtugZdOykHfa8PQlPm3xMYeCqTcTcGlce1qz9zScbZVg9dFy6iuL4nrC
	UHkWnoI2CmRoXuvTdzapYKNZSMMJU=
X-Google-Smtp-Source: AGHT+IGw2na8JVDqeF0Oa0LW5AO6mEczz1ZHISYXlQz8W8ohi84aCaK0ct+BLsHDZhsL8fadhckfa1qgS4Vdy16lQYk=
X-Received: by 2002:a05:622a:1992:b0:471:9fd1:92ed with SMTP id
 d75a77b69052e-4719fd1994bmr699061cf.4.1739204709846; Mon, 10 Feb 2025
 08:25:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250108202515.385902-1-david.kaplan@amd.com> <20250108202515.385902-6-david.kaplan@amd.com>
In-Reply-To: <20250108202515.385902-6-david.kaplan@amd.com>
From: Brendan Jackman <jackmanb@google.com>
Date: Mon, 10 Feb 2025 17:24:58 +0100
X-Gm-Features: AWEUYZnmQ398qxLyW56FW4LeHT9hlmSWAS4jGnKUmsXPTICz2WHJQohQb25KrWc
Message-ID: <CA+i-1C2g=8ALQ6nazX1P7Cpz7PmSC49yMAFO69EmjhAfDv1rCw@mail.gmail.com>
Subject: Re: [PATCH v3 05/35] x86/bugs: Restructure taa mitigation
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jan 2025 at 21:27, David Kaplan <david.kaplan@amd.com> wrote:
> @@ -400,48 +402,71 @@ static void __init taa_select_mitigation(void)
>                 return;
>         }
>
> -       if (cpu_mitigations_off()) {
> +       if (cpu_mitigations_off())
>                 taa_mitigation = TAA_MITIGATION_OFF;
> -               return;
> -       }
>
>         /*
>          * TAA mitigation via VERW is turned off if both
>          * tsx_async_abort=off and mds=off are specified.
> +        *
> +        * MDS mitigation will be checked in taa_update_mitigation().

What we are actually talking about here is the new
verw_mitigation_enabled(), right? I don't think this block/commentary
adds any clarity any more. Maybe just delete it?
