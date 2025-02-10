Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEED824F5A4
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739208954; cv=none; b=Nr4XMwET+JCdMThtE45TG0t0GHA5K798hll0RUHEfcX+3PkBL+u5MsYaicDca8u8XReMr0fNU18eVVhehd/DZOZRztI0VeaQPtRDEDw8DOQTfN6bGhbuFJGbEK7J59I6TOpPCOvv7ggkIKQUvAj+2d53pJkyMlo+T3aLCTGYG/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739208954; c=relaxed/simple;
	bh=+S4/EaCET5jEVOSOlQm0sPnpyaxdk5+4o8t8Zx0/Brg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g+zmnubzI2OjJ86bqIiYoHcHTJP2ptGSPLSFYSe7QLQ/wR4hapYlpQ7geOMvElFsmYJW+7l3eZVL2gOTb4tEpj3lGi1OBEY2srDxVwOKJdwOOjBNSut+IMlbVeIT/7vDyqcfzMQIXwaNqO1Y9fY//BbMyke9KS3hGUKpy7Jrhfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dS78koGK; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dS78koGK"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4718e224eb1so292591cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739208951; x=1739813751; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/4zkHhguF7AJBJw9Pd80cZXo6YslEmoYoD7tcIv6l3s=;
        b=dS78koGKldSTEvDGHHFjyyAZMNZSzjCF7jiM7v3piJPjusszkhbk5aVTy3yCPqb0b5
         jFqXVGXkOVjg1AKCYdjW/cMy2hZQZbKvJJ5TnyDqOmc7MOHgs1uVtR7NxmTxZEpkOyZl
         nhCljoV6Z3iD0cb2bC1P8L3vCty5hqgoh9xtPSG2ivO7UzAJlXbB3g/OdC62a2t3tNsW
         VFpKJWJw9ZjRIE3g+O0tvsuxnupVSb+8p2a//pFQjn+va7SXseJZg4+xopZpkJUf0+UX
         +qTDfofuxBf5avujZ+BNuDujGh59f04drHWyKRApAyJ63FTy570hy/7v3AIj3cJf8xz7
         MpCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739208951; x=1739813751;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/4zkHhguF7AJBJw9Pd80cZXo6YslEmoYoD7tcIv6l3s=;
        b=E4oLegUlt8BfHJXXuQxwgDvc+R7Zk2ilAt/+aECDjcfKQdjnEf2jznu0mxDdBe8TTP
         xkMgfIYzF9WAyd0J+nsqPRPbhC8r2uemBC3PK5reNbfuR0L/XqkHH6hdN0VdLdouTIMr
         Vb+XfFXnI6YzdbE3cJ729rxjzWLqz2vm+XVq2fOB0Luo3f7qR6lqq+fn100/TKTzR48K
         a64FUpovT+1DmGv2EM592t6oGj8bTkd/KzuCIDlDV2zujoaVS7SbNF4GFXIwHG/2nCVu
         I/8KUOEVWio6ggrfm5/LEncro2M6lqhHRImcQesOIgWNCfKd3OicILd9T3cpZJgVk9fw
         2K1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUlDVa8Q3MOLLFDsTnpGx6oDjJXR/3SV3Ov3E1iL8NabkXpZYhG7vT+etIT2pdkNx6dhUTRQtxS+7lNdQI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlbtaoeeanGJj0HBUfc2pOgmbjZ3cLTUEHDzhIE50swqXwYgHv
	7hE8EYgvEFH794PNRe8uxCkI0Gw0avQ6WY+08rocuWVNTGDHJak3/JE6rjKb5J0WCrM1mNjVkPN
	YgwLrcMxc79EaopGXfj13cII93YWWBDioQyVo
X-Gm-Gg: ASbGncv8ostmu3hoH8eouhSbR477Qw+4zyfQs7luS6IajNc0IDXev5kbspT0QBqQ0Ab
	2fGed/pgczeCCmaQDR67CnPQdCc23UkdfWBSWVuVFAA/VKqO+SoiD1zFpQPwqhpmoSLYSke7Ul8
	mgVndAAwkeaJ01+PU4+qoWAPC6tws=
X-Google-Smtp-Source: AGHT+IHffoB8kGK18ouzhpZSXA5wkM5mMlqROfIpbkF69NlLmidFz7CQugZBp34QbxUx8aIQahguBeuhUyPnSYEYF7U=
X-Received: by 2002:a05:622a:1788:b0:467:86b4:4e92 with SMTP id
 d75a77b69052e-47177eecdeamr6977871cf.29.1739208951367; Mon, 10 Feb 2025
 09:35:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250108202515.385902-1-david.kaplan@amd.com> <20250108202515.385902-7-david.kaplan@amd.com>
 <CA+i-1C2RnU0DOX0ryYMGZt8PXUD0BjBMpNDBHfX2HpDB0kBgCA@mail.gmail.com> <LV3PR12MB9265E77DF764A37FF1ECD79A94F22@LV3PR12MB9265.namprd12.prod.outlook.com>
In-Reply-To: <LV3PR12MB9265E77DF764A37FF1ECD79A94F22@LV3PR12MB9265.namprd12.prod.outlook.com>
From: Brendan Jackman <jackmanb@google.com>
Date: Mon, 10 Feb 2025 18:35:39 +0100
X-Gm-Features: AWEUYZmJrwgziv_eE4JOHcviuGyVejZqNnxhHHsm9BiLuRGRQjHQK9PGgw1uRsE
Message-ID: <CA+i-1C0mMOSfycSMjpxhX_ARubx140dHb39FJ07FvR2rUOiK4Q@mail.gmail.com>
Subject: Re: [PATCH v3 06/35] x86/bugs: Restructure mmio mitigation
To: "Kaplan, David" <David.Kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, 
	"H . Peter Anvin" <hpa@zytor.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Feb 2025 at 18:22, Kaplan, David <David.Kaplan@amd.com> wrote:
> > This is still peeking at other mitigations in _apply_mitigation.
> > Shouldn't we shunt that logic into _update_mitigation?
> >
> > I guess this would need a new enum value but that doesn't seem too bad. Worth it
> > to have all the inter-mitigation dependencies localised into *_udpate_mitigation IMO.
>
> I don't think it is peeking at other mitigations, it's only looking at what other bugs the CPU has (which is static).  Looking at the mds/taa/etc. mitigation values is done in mmio_update_mitigation.

Hmm, that's true but it doesn't quite shake my underlying feeling that
we're leaving isolation of logic on the table here. I know I said
"inter-mitigation dependencies" but if we could even keep all the
inter-_vuln_ dependencies in one place that would be really nice.

But, I will come back to this once I've looked at the rest of the
series. Maybe it doesn't really make sense to try and fully isolate
these things.
