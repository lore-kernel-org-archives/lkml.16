Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39609255E29
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739208518; cv=none; b=ULSVB4krYPW/VsTLnBWlzZNM37wyMlGQJTsOw5DC7qO/g64fQH7N1/NqX5svs3bKOkGrue11xxfW81WGnlNb3/P7CuC5RQRIpH0RLiQzQvwx3YPiBH1b2z6Un/huheD5tw1BQsMwOQwO6LkwaI9FlscvGoLQ4EyUckjEQV1utEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739208518; c=relaxed/simple;
	bh=2Nw/AacHDb2aqKYOa/O/hvqfNG8hO63Y4h1KLLx8pB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z4NyOa1ev0RNJ9Q+cLVA+G9Q67DXT0qKNZKmA7ydwHzyhbbOEzf0mxsszh5KQVx8ByyOKvww8S+84nBuaT4vTUqwUdVcLQUCb8n7CReV4OrpQQ67elgnMc2HVOsA2WI9jX8XNgnAWlu02eS1Ma5yTclUQLheBzj6fMFGoFAVC3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fkZpSBvr; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fkZpSBvr"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-47190a013d4so305741cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739208516; x=1739813316; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k36iM3YatV0dJXBrZoUSe8xNxLDu9xBXOFK2f+hfdwQ=;
        b=fkZpSBvrkCdS6PgtbTWDP9ksvzYT0IHg4/c9EMI/MvzlzGVBSE6y1lX6W/NA+iEgr/
         EWJYaS4IPjBKo9j2Ttf2W4neMAgwU6reBzVBle/L8x2GwPo/fH3+bIUND939pqzOFqkh
         ZdGhaLOkm4/4OEUTR/fmFHIq3o9B/5R5WGqeBSDnCcQ9NVesJ+7tzrsVaUHi3tnXM2lA
         FYza0I77FZ2nbpc1xhmDHyazGzo77BOMTAM+YsZF+a8Z7fhsVAcMjUJJtIp9HZK6/ySP
         0MG2X2wLeLEnaYDHUT4BnBwGbp8griBvCu//6mbLRQsEWN8ktNJCMHtY50ozPMXwdYak
         EGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739208516; x=1739813316;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k36iM3YatV0dJXBrZoUSe8xNxLDu9xBXOFK2f+hfdwQ=;
        b=RT3+JRmaICX3PPaX0v0TyVh4cuuoGp9Gp/FLr6/Gfi/i4Daqyh2RKsH3LlrdZU6LPd
         +6z6bFUb6bEuR7l9Z642lUDxg1btG39YAZ/GtB+erqk6UROs1K3KyOqHXaqLLRiwjOA0
         SJn/nDFGJrIjqTLg3mLh3rpu17wYMXqDZebHPxbB+FIzt5Ljj1T+NwbwosMacp8phOW2
         nHnJoJJ834ngXREKt1dAQT+l2gNJ1EfZUw0N4uHL5/K1qY+YzzvIAs7n8xQBSsw0r5im
         vpEZgVIGv1TwDPgunZaKLN3yp5GHYMJMo3QnXkeULuW7VyMmQ8su4EgriMEZB+UmvIOj
         VN4g==
X-Forwarded-Encrypted: i=1; AJvYcCXi/46lmbAblqMKWJ+j76/SJQ3Rk6ObeIp/EhmBAhJZq85kvULP6TGUefchLcxVdiaepHSon4JLg4i31a8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIC5aI5xZCrkffpytmVnZ9BKbG3ytaNi0+Lx6MWXlSDhQZwgcu
	1b6mvl+t2ij8YSYpW9uEjxLXctmOMe71pdwsiZSMjH0zN8vdJVL0vkgR7gWc4NC6hHqoZLJ1FqP
	F3RqGPNyk/mHGhOzokCSKp3vg0XCCMWAnCRdQ
X-Gm-Gg: ASbGncsFGJKxCpQlszttrEzc5u1keP8Q48/vlBrwkryO6HDRWIbc0jhOd0MLhveg3pC
	a0UL2pduGO4wCMgWVHy7r42aZY0QS6TBeEhm7bwWgLuHKjQsXCXOUS+T7Ng23g6DXnpkCAjFpN1
	fqg/hcxy28hMwSBHuY9n0ZefFJlyk=
X-Google-Smtp-Source: AGHT+IGv9A3dbVcuEsHQEMXuAVPqpbKtrrKK3Z+rdIX+o3bxSddn6inNTNEFg/oyxWmM7K92Wo6zHyOHXVW1f6kttFw=
X-Received: by 2002:ac8:44ca:0:b0:471:812b:508 with SMTP id
 d75a77b69052e-471812b08ffmr5045591cf.14.1739208515813; Mon, 10 Feb 2025
 09:28:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250108202515.385902-1-david.kaplan@amd.com> <20250108202515.385902-5-david.kaplan@amd.com>
 <CA+i-1C2B-xupi4cRT-AGMegYepUxhaJ89iG_J+Toa6z-Axp3uQ@mail.gmail.com> <LV3PR12MB926547CDEDCFAE3612F0AC2494F22@LV3PR12MB9265.namprd12.prod.outlook.com>
In-Reply-To: <LV3PR12MB926547CDEDCFAE3612F0AC2494F22@LV3PR12MB9265.namprd12.prod.outlook.com>
From: Brendan Jackman <jackmanb@google.com>
Date: Mon, 10 Feb 2025 18:28:24 +0100
X-Gm-Features: AWEUYZny7iqZqUc6PxV1wOkmXoJiBtyt_J4JsZ2Q9FjxXMvHQYqIwNtWiazn2DM
Message-ID: <CA+i-1C0AV8pDU=bwBShfERAVmUhMpHF9WXjGStb7_5BG-sUkdQ@mail.gmail.com>
Subject: Re: [PATCH v3 04/35] x86/bugs: Restructure mds mitigation
To: "Kaplan, David" <David.Kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"H . Peter Anvin" <hpa@zytor.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Feb 2025 at 18:17, Kaplan, David <David.Kaplan@amd.com> wrote:
>
> [AMD Official Use Only - AMD Internal Distribution Only]
>
> > -----Original Message-----
> > From: Brendan Jackman <jackmanb@google.com>
> > Sent: Monday, February 10, 2025 10:14 AM
> > To: Kaplan, David <David.Kaplan@amd.com>
> > Cc: Thomas Gleixner <tglx@linutronix.de>; Borislav Petkov <bp@alien8.de>; Peter
> > Zijlstra <peterz@infradead.org>; Josh Poimboeuf <jpoimboe@kernel.org>; Pawan
> > Gupta <pawan.kumar.gupta@linux.intel.com>; Ingo Molnar <mingo@redhat.com>;
> > Dave Hansen <dave.hansen@linux.intel.com>; x86@kernel.org; H . Peter Anvin
> > <hpa@zytor.com>; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v3 04/35] x86/bugs: Restructure mds mitigation
> >
> > Caution: This message originated from an External Source. Use proper caution
> > when opening attachments, clicking links, or responding.
> >
> >
> > On Wed, 8 Jan 2025 at 21:27, David Kaplan <david.kaplan@amd.com> wrote:
> > > +/*
> > > + * Speculation Vulnerability Handling
> > > + *
> > > + * Each vulnerability is handled with the following functions:
> > > + *   <vuln>_select_mitigation() -- Selects a mitigation to use.  This should
> > > + *                                take into account all relevant command line
> > > + *                                options.
> > > + *   <vuln>_update_mitigation() -- This is called after all vulnerabilities have
> > > + *                                selected a mitigation, in case the selection
> > > + *                                may want to change based on other choices
> > > + *                                made.  This function is optional.
> > > + *   <vuln>_apply_mitigation() -- Enable the selected mitigation.
> >
> > Maybe also worth calling out cpu_bugs_smt_update() here?
>
> Hmm, how were you thinking?  The 3 functions above are defined for each vulnerability.  So this is more intended as a guide where if adding a new vulnerability, you should define the functions above as needed.

Yeah it's not really needed for people adding new mitigations but it's
still helpful for readers IMO.

Just something like "see also  cpu_bugs_smt_update()" to highlight
that just coz all the *_apply_mitigation()s are done, it doesn't mean
we've finished setting up the mitigations yet.

(Like with the naming bikeshed though, this is very much a nonblocking
suggestion!)

> > > +/* Return TRUE if any VERW-based mitigation is enabled. */ static
> > > +bool __init verw_mitigation_enabled(void) {
> > > +       return (mds_mitigation != MDS_MITIGATION_OFF ||
> > > +               (taa_mitigation != TAA_MITIGATION_OFF &&
> > > +                taa_mitigation != TAA_MITIGATION_TSX_DISABLED) ||
> > > +               mmio_mitigation != MMIO_MITIGATION_OFF ||
> > > +               rfds_mitigation != RFDS_MITIGATION_OFF); }
> >
> > Since you defined such nice terminology above, why not use it here and say
> > verw_mitigation_selected()?
> >
> > (Obviously if the alternative was a respin for this trivial issue alone I would prefer to
> > merge with the current name!)
>
> I do like that name better, I'll use that unless anyone else objects.
>
> >
> > > +static void __init mds_update_mitigation(void) {
> > > +       if (!boot_cpu_has_bug(X86_BUG_MDS) || cpu_mitigations_off())
> > > +               return;
> > > +
> > > +       /* If TAA, MMIO, or RFDS are being mitigated, MDS gets mitigated too. */
> > > +       if (verw_mitigation_enabled()) {
> > > +               if (boot_cpu_has(X86_FEATURE_MD_CLEAR))
> > > +                       mds_mitigation = MDS_MITIGATION_FULL;
> > > +               else
> > > +                       mds_mitigation = MDS_MITIGATION_VMWERV;
> > > +       }
> >
> > This is changing what the user will see in sysfs. This seems good to me, but it
> > would be worth calling it out in the commit log I think.
>
> Does it?  What is the case you're thinking of where it is different vs tip?

Oh, no it doesn't - I forgot about md_clear_update_mitigation(). This
error is a good justification for this refactoring :)
