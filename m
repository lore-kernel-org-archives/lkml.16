Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1B32EF662
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 14:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751465804; cv=none; b=DxpbEKKwlkA49jGDhbAp58Cmq7BNqmdVGSBsMtH1izGOQAOE+l+0igxyQb2t77ROLyT1Z2Eqz3NlLkldpUAKROWu20Dl2+8hvmDtYRtRwlvu4ObFb5+p03iT6Yd14eFt/66Go0bfxa6xJl7EQrr2kPac5QKoUixs8pPsGPTn2T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751465804; c=relaxed/simple;
	bh=tNQbo97LbzX5ZaNglX85pgNLYN18HQeZxfnHfOkxn1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XkfYr6vxZXAMUIrHEEkcXlOiszPKz+d91e/g015vVZeW4tdVCRN3qtXFc6Xt9IjAUbTbTFnRbMwwpNKt8AqOGTK6M5tLv6GI5/Hl0lx4wA4Xn/AvTf17zvgoqzNaZfrN8u1tLJQ5oiy4KBa++1klZAWpvoioZqo0JrXnABlJtx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EogEHlTQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EogEHlTQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751465801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tNQbo97LbzX5ZaNglX85pgNLYN18HQeZxfnHfOkxn1U=;
	b=EogEHlTQQMiIMauEdvvva8KbN7mHG/Rnhyf79xWG7H9HRqt8hFDaovflQ53bkh3CYeBHqd
	MNaGpHgRQPPCQtgg2Lm0QVmePCuOYw4f7F5WcoRKayvxS8Zy8Rkx3+QlEkYJ7npewqjJHB
	PxCvYCt5BOC5F14vDDOzpaRj1hP1ZQ4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-VG4MHBPzOPiRSiqxDxUukg-1; Wed, 02 Jul 2025 10:16:40 -0400
X-MC-Unique: VG4MHBPzOPiRSiqxDxUukg-1
X-Mimecast-MFC-AGG-ID: VG4MHBPzOPiRSiqxDxUukg_1751465799
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a71914dd25so111427891cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 07:16:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751465799; x=1752070599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tNQbo97LbzX5ZaNglX85pgNLYN18HQeZxfnHfOkxn1U=;
        b=cjvAwVQkxHUxdlQKE/suSRYosttkhmznSkMpOlmvVZfaW5/Bgo+TQ8CS0KkTR/RRif
         dItA7xWTRZDvPWFgfUZOw5MkCIHhJ0gUNJ9RoWpbdq1DFWemldOuTih9epm6yvmB7Wdb
         vHNk7av8eZ+1duHMMSEenKZfMn1sU74gIPpfsk01Br0qtmRvJZAc7/cFbfxAxG1ZZQ5O
         6Zmq+b2SvoPAjwF8YM2uDJRE4CGSvQ3t11YvurXse9akwij3CLMBxPUSJjsavHsH2sMG
         PrCodKimQ2EJ5Pf4P6t0jm+X+n0GwDZNlNPnzklptV8gCpuTg0t23NXTC9O0/scgSC2K
         RzsA==
X-Forwarded-Encrypted: i=1; AJvYcCXIQVG0c4lhoJjcEUpK7Bc8WIpe/7YFHh76YWc19+NSbCXj+UlbF1cYC7QQ39oN2lWsibOIRACeeXhwUG8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxluQiVVDADxI8N8Rvi3xfqAvR1/V5UzV3kePJv9C+NgwJakZTs
	8Yg3dNp0anUo/ugu3W/wKH8tLxuQ1K6IxqKfmastyFfTWTB6ZaWyu608G/+nUGCPiqrMLgSIMt7
	cQam+T/qpeoOby73OwMJS0rBNS6t2kqlvxbjQ6EAyJsOtkfshLLd9n3moaqEm/V/JUATqFtqdQ5
	mx8L0o0IRhaZQQeogFiB8rkSuKZ/3ST9PFw3bamrHI
X-Gm-Gg: ASbGncsBVYC+LSSmrSX0swyeCeNffXTqazLEwNwGTUUyVBwYHrFh4BwC9Da5fvN4VnK
	bFjEaXTLHlZAdXRCuvbMLLV3HQ6Q46GLQ+1JPcViuvYGNOJ86qielbrnRRlKWoMffkBc8uYGkWj
	ZtIDJ761YilK/ywYpjMpOOnEXVr5FF8SySNQx2
X-Received: by 2002:a05:622a:1441:b0:494:b924:1374 with SMTP id d75a77b69052e-4a9769badc8mr51474021cf.43.1751465794077;
        Wed, 02 Jul 2025 07:16:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHX5w9jng/ZR1ywwst/46yrWJUGZinoQ5Odmtit+CDr1mDil33vdxFF08u52zkDS4qeA1JDEAm04peNXJcoI0=
X-Received: by 2002:a05:622a:1441:b0:494:b924:1374 with SMTP id
 d75a77b69052e-4a9769badc8mr51473351cf.43.1751465793526; Wed, 02 Jul 2025
 07:16:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612104349.5047-1-gpaoloni@redhat.com> <20250612104349.5047-2-gpaoloni@redhat.com>
 <20250613114527.7e27a9a0ecc2b59d98677b0c@kernel.org> <CA+wEVJa0jL-JH_4=5sR+Mvb26n4mPPudmOL0LRBDV54nMZcw8g@mail.gmail.com>
 <20250620183503.6c84eb22cca206cd10418c04@kernel.org> <CA+wEVJaQcHdpVc3Za8qy0+Z-CGNeaDTrXtjJg2j7J6qsW4uAkQ@mail.gmail.com>
 <20250701175826.429a7b4b@batman.local.home>
In-Reply-To: <20250701175826.429a7b4b@batman.local.home>
From: Gabriele Paoloni <gpaoloni@redhat.com>
Date: Wed, 2 Jul 2025 16:16:22 +0200
X-Gm-Features: Ac12FXyfEtePa0XxvqJu6sGqCavh_IyDuIhKaeWfAiYCVIb-sDPUMESrR81HL5o
Message-ID: <CA+wEVJZ1BpwKOApGmmv=m0yoTypJd22XFOGD9kpG1yRErEvikg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] tracing: fixes of ftrace_enable_fops
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, mathieu.desnoyers@efficios.com, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	acarmina@redhat.com, chuck.wolber@boeing.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 11:58=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> On Fri, 20 Jun 2025 15:26:27 +0200
> Gabriele Paoloni <gpaoloni@redhat.com> wrote:
>
> > I think that from my side I do not have comprehensive answers to all yo=
ur
> > questions (I need to read the code more in depth).
> > So to be pragmatic I can split this effort into two parts (documentatio=
n and
> > redesign); I will propose documentation first with the TIPs that you me=
ntioned
> > above and later, if we find a better re-design solution, we can also am=
end
> > the documentation as needed.
>
> Just to confirm, I agree with Masami. The enable file is quite special,
> and I don't see the use of user space playing tricks with it, which
> even includes lseek. Maybe to keep rewinding a read to get a new status
> change?

Well the proposed patchset was aiming to prevent the user from doing
stupid things (e.g. reading 1byte at a time or reading after a write has
increased ppos). However documenting the correct AoUs would still work

>
> But it usually contains a single character (sometimes two) and a new
> line. It's not something that's ever been reported as an issue. I
> rather not touch it if it hasn't been reported as broken because
> there's some hypothetical use case that can see it as broken.
>
> Documenting its current behavior is perfectly fine with me.

Yep "[RFC PATCH v3] tracing: add testable specifications for
event_enable_write/read" is already out.

Thanks
Gab

>
> -- Steve
>

