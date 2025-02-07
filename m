Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54BE15E5B8
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 17:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738949668; cv=none; b=Wsmln/fcIlCMHSrY/FqZ9rIFcW6tdyFB93NJhSP25MrM4M4zAhD8mS8j18/joYR3Rbp9Gszb+fBkRZxG/d5UcWNeCoqy7Oa1NGSQk46I78mM/YIF5l/CWRFtCyyojPgE1vX0pVEAP2WR6PCkVlDLx/2fQ8hpe0hkGVG7YEpfNV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738949668; c=relaxed/simple;
	bh=iql8ByA/m1WXSEGKkfIomUCFpvj3f9cpEMqIrp5z/1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ASmA2jh2QpvXmPhLgyKlYD/ANBWgkRqlDRCTRiIvLA6f8ldoSXiNpSmQeV2Nks3hMm8/jgAbtWJZZ1khkGeVH9yvGFUVEhOcR8mwR44e1ftmi1VmQ7PMjB6uCtrEZmCzwe0XAOD66svqMUC/Si3vK24ynZN69tGypXlWEmWaW4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A8hpSZ0T; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A8hpSZ0T"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4679b5c66d0so307621cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 09:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738949664; x=1739554464; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wQE/r9oYQJeUmSQWFL/fUSETW6FOuhLgjtJx4q8CYEk=;
        b=A8hpSZ0TklQv0y5jzF2Nzrt2yU9SRkV/sRPGL1YV9Da3OuTkuFGO3BdCbmkw7kvS4/
         LxBvoT0YEGdwzGWhPWM3y5P9xCAW+QI8gbnJY4Jtuym9ULdBcGIuHvkpX0RIQEHQYAyl
         Lp/jkHoOZaafwTj+/XGD+fcSVzScik9D0VfIZZSE7h7isyHdWjnwEqekpbfQZsbUhlWr
         9REA5/orABBB6hR+3PxHRIlhEMn/8IR43x8ojJrDFp2i1mbDh5sv1axV5IavHbgIoRob
         QGyqWWz3cRG6V7kZhvBQXLZp78LN6v/BWQSnBSizRxsVIFJQciMykuInrp2bhdZC2yap
         4hDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738949664; x=1739554464;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wQE/r9oYQJeUmSQWFL/fUSETW6FOuhLgjtJx4q8CYEk=;
        b=WTHFieRVdJ6y8p1JR+aKbt7xaXVPTpUsZsw3RiN6Eqyrd9b8Y+PsxJ3b7FQ8zcZ1oG
         e7umQpBgQJwb066Vcm4z884GZCnZpXXGK+KFJUqQR7xTC79V6qYulkf/QDn3mtjpqsQ1
         B6eHCkBHcjIgFRCntLWC3ywAVqQyrQ+qsgblWJgFgASO0b+bYsjAeNcPw00gm5d3Bp1V
         66btlyyp0o7jNqPXhjsmyfrvr3HbcKlBGPTC5APHr4u3Zll1OTVrQ/fPC81KNxwk/WAm
         5kqZ2Jn/GvN0GVzLFZI8IxtFnwSZgb89yWaQBw8SH2ADsNbzZ9Zd/NiWSyxYUruVWguT
         a/hw==
X-Forwarded-Encrypted: i=1; AJvYcCWAB+WYqSNk9BXYkG6TSOMqhq852aX4q0+92Ex2BK6xTN1bCYNB+XDMZ9QHCzUxGBs0EhUIHq1nNh4Gx50=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGG7AEQzWVWvV4eEDWT1XDK2ao7egAHoKOP3foI2m1q0KxEW8M
	wpoSIftBw2RAsHAWToI0n8K4x5O4pjqeiLHuMhuA+qSJQI7qRJITdEwWq/0shaTSqVJZZc7wbpX
	Gpd+F+IorytUuRdVujZikQt6A8GiTv9Qy5yq7
X-Gm-Gg: ASbGncuXRCQDjC76oIQh/gE6t0V9PrgBk9Jnw22PlqiwsyM9G3iODTgD6gLBzpMDWJA
	3TRK8wX1zwIMYUzczuicYCCJ7JsnxAlcYFz+HNV2sFTd3cuClkQdWlvltrs51hpweCdrspYclPg
	ppItp3xdNZcDBCHVrEB234w3+tez4=
X-Google-Smtp-Source: AGHT+IGP5xByBnMnsz1fxipvvMqkn0zzoEHD6jB1AzohT/QYEtRmmMdQi5qgtDbA3s87t+kZfrKGdzCQXcuR9RomnvU=
X-Received: by 2002:a05:622a:5a05:b0:463:95e2:71f8 with SMTP id
 d75a77b69052e-47169c92487mr4136691cf.15.1738949663503; Fri, 07 Feb 2025
 09:34:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206044346.3810242-1-riel@surriel.com> <20250206044346.3810242-5-riel@surriel.com>
 <CA+i-1C2NAFTrmZBFfBf8PFaji9YxQm68pV2qc7VbgHWFTji+Xw@mail.gmail.com>
In-Reply-To: <CA+i-1C2NAFTrmZBFfBf8PFaji9YxQm68pV2qc7VbgHWFTji+Xw@mail.gmail.com>
From: Brendan Jackman <jackmanb@google.com>
Date: Fri, 7 Feb 2025 18:34:11 +0100
X-Gm-Features: AWEUYZnHHj4McI-lzpCIOVXfXTGju6fU2JsdGSb5pzfNxaB1ZLb4jDphduY0gKc
Message-ID: <CA+i-1C3EwgvO_tgEvReDK8K5FMWYGeQRuvCu6Xy31oiS6WgcNQ@mail.gmail.com>
Subject: Re: [PATCH v9 04/12] x86/mm: get INVLPGB count max from CPUID
To: Rik van Riel <riel@surriel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, bp@alien8.de, 
	peterz@infradead.org, dave.hansen@linux.intel.com, zhengqi.arch@bytedance.com, 
	nadav.amit@gmail.com, thomas.lendacky@amd.com, kernel-team@meta.com, 
	linux-mm@kvack.org, akpm@linux-foundation.org, jannh@google.com, 
	mhklinux@outlook.com, andrew.cooper3@citrix.com, 
	Manali Shukla <Manali.Shukla@amd.com>
Content-Type: text/plain; charset="UTF-8"

Oh, sorry

On Fri, 7 Feb 2025 at 16:10, Brendan Jackman <jackmanb@google.com> wrote:
>
> On Thu, 6 Feb 2025 at 05:45, Rik van Riel <riel@surriel.com> wrote:
> > diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
> > index 17b6590748c0..f9b832e971c5 100644
> > --- a/arch/x86/include/asm/cpufeatures.h
> > +++ b/arch/x86/include/asm/cpufeatures.h
> > @@ -338,6 +338,7 @@
> >  #define X86_FEATURE_CLZERO             (13*32+ 0) /* "clzero" CLZERO instruction */
> >  #define X86_FEATURE_IRPERF             (13*32+ 1) /* "irperf" Instructions Retired Count */
> >  #define X86_FEATURE_XSAVEERPTR         (13*32+ 2) /* "xsaveerptr" Always save/restore FP error pointers */
> > +#define X86_FEATURE_INVLPGB            (13*32+ 3) /* INVLPGB and TLBSYNC instruction supported. */
>
> Why no "invlpgb" here? Seems like having this flag visible in cpuinfo
> would be worthwhile.
>
> If there's a reason to hide it maybe add a comment to explain the
> reason? Sorry if this is a stupid question - I also can't see an
> obvious rationale for why existing flags do or don't get a name at
> runtime.

Oh, found it:

https://lore.kernel.org/lkml/20250102120450.GNZ3aA4oVPnoJYRVUL@fat_crate.local/

Sorry for the noise, please ignore.
