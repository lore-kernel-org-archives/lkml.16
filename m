Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8922451C8
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 18:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745949944; cv=none; b=aSOSsM88Cyj5B2+D2Ag+On8MOytOpLt9KMiaiPYwDaDLfZ7CNGWomScwrqwPHW7bRR4c7kIT5aW3CaYyzKNoqXbq4kT+2eOASRwByOpCy2RGF1ZrrmXsf0E+uDwKJ3tsYkFiutqcNkU1ETHPWs943PlKtA8r4VzxXDMzS02G1tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745949944; c=relaxed/simple;
	bh=Lyq/S1Ycbav0qnNhNcOJVaHIcrRRLEeAl45r12sbYpA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B38JrSkBlZQMijdW7haPzFu83b3QtSAX+sUEIXS674cMotnKoCnHu/i3h7QAGVMLd4gseoXsyMaOsXaZMEOEy1L3BmJoRXk9vUCntAeXAJSAGCuvalNd/TK9exEYgxBcTI9dkYAx9sprlkBEPdk12B70dYCUxif7IDAIaDg+u8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=L6V/x+QU; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="L6V/x+QU"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so719676a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745949941; x=1746554741; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Mga3Rq70LqXw/l3aYagru3Xh65JFPJSy1XpGB2clVXE=;
        b=L6V/x+QUz/Rdx5HDssUkkLXQQXe/efUUetOHS4L2VbH5K9chWctN+35tf+WDKLzvHQ
         Fza0qyMKI1c9sr9pC22HDjQcFdJE/Kr5mwC9WGyt6mpBgt4++am2faatW9hoHnUDqbZv
         hMb3MqEr6G6mOSxZJ7X3HIbRohtwxLOOULgx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745949941; x=1746554741;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mga3Rq70LqXw/l3aYagru3Xh65JFPJSy1XpGB2clVXE=;
        b=arlKu8cQOmcvP206jho1pdVZyi/DIeRq8chBTdZ+ETtlkmqw/SbNC6yl+ozH0skyJ6
         8ZrtTyRP1BGjm05AscLAXye5Cxen4COm5Q7uX9s/JH+bV0F5Mo6DI6O1b+B86ALOsh4Q
         BBgle0vHDPavLij1XB5TE7vSfgIscsMDT9yG6EmO+uDkgKm8leIwQ/0966tiOusN0lpj
         IvS+lFSD+ztMqNJXWE6KCX0v4ntriBlWReFx4Thqw31UHFssZrEP9O6xV0HMBbmhVAuP
         xen0KGSrc3HvDa7bMAMC8qg9ud4qYZ5VsuuuDeFEWwvXFcd8fWj9I5+eDcXbIqno1J7R
         sFnw==
X-Forwarded-Encrypted: i=1; AJvYcCX9Al0blg/jjicTtME6GJMTfn35AIxIq2h5ewGdd/IJK5z3erkgrpXXsBYZhxsNHkpbIBykNgjm/QZpRgw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKCnTWKQABD3eDFGmy6LsUEvpDbNUdRqu085A6NukXW5RS3KOT
	wxESJnbGfpkxJKyFrVQIkP187nHwcYo223db55iUQTc6sGM/OD+F4RNBiWRLTvEymNt0mtE9skC
	WZZfzEg==
X-Gm-Gg: ASbGncsMgrwZiBBQhXraNdRLNM99loLUjCSMjK/V+OjQ0BHOhthP+ynJguP+7nasWMS
	Or4dO07avSuL3+wrO63qnF96fsD0/YMYZW3U9AH+C37URQuQL14I8qfAwndefRMIuOELttbF/sN
	MipJ0Eip73HIW9KXXJbYQxM6P++HP6YD/jGd0W7/xmwdtYcIjfAzdaEj63NJF/lCMQri2f33cS4
	87Gu7ccrPSsF0f+wBFh4h0qHDypHZwLGacnopiUPsoReWarQBBKw4Gv9uTl7/7l/tisHfvw8KK8
	jIIAcAbDrSTqsTDkstNzl6Mm/FatQsV5otZtI79m9rq/7ziR9mWziF40IKI1pSmqIA3pbDGhkn7
	CBTi6a4ZwWT1sYpo=
X-Google-Smtp-Source: AGHT+IGDflZkrazHfxd9VnQOCkGUEZEynuBn/a8nLg0AtmIWWTqetPZXqGNrv6li3GD1FUQ2uNYD7A==
X-Received: by 2002:a17:907:3f18:b0:ac1:db49:99a3 with SMTP id a640c23a62f3a-acedc73396bmr35692566b.40.1745949940775;
        Tue, 29 Apr 2025 11:05:40 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed71ff2sm820060766b.144.2025.04.29.11.05.38
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 11:05:39 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac34257295dso1076454266b.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 11:05:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXylaUx561cI4AbIusmITnivbrMiN5ivn74QnacDXaRlI/5z9CB8Ak+YKPkjSUkqtx7897TffSYSRKB08A=@vger.kernel.org
X-Received: by 2002:a17:907:60d3:b0:ace:c2d1:9761 with SMTP id
 a640c23a62f3a-acedc623882mr34288966b.27.1745949935745; Tue, 29 Apr 2025
 11:05:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425141740.734030-1-arnd@kernel.org> <aAyiganPp_UsNlnZ@gmail.com>
 <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com> <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com>
 <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com>
 <e54f1943-e0ff-4f59-b24f-9b5a7a38becf@citrix.com> <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com>
 <aA8nF0moBYOIgC5J@gmail.com> <aA8oqKUaFU-0wb-D@gmail.com> <CAHk-=wgJfWfWa2NTiTmev+Xr=e8Uo=aFkrXujLAQBVAVN-VigQ@mail.gmail.com>
 <B364FF6D-DFCC-42A7-ACA1-6A74E27EE57E@zytor.com> <67be5eee-b67b-409a-8309-829f891b9944@citrix.com>
 <916BD58C-E6A7-495E-9A60-722E130AC7A7@zytor.com> <e5e97ff8-9670-40d1-a0fa-69504d34c4c4@citrix.com>
 <956DB0ED-F3DB-456D-8D06-6F40DBDB815A@zytor.com> <06d04c13-76e8-45fb-a563-e365e1f19362@citrix.com>
In-Reply-To: <06d04c13-76e8-45fb-a563-e365e1f19362@citrix.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 29 Apr 2025 11:05:18 -0700
X-Gmail-Original-Message-ID: <CAHk-=wig1E4B-e1_6=it1LfVQ64DJsVgO6f6Ytnbzm2qChbAdw@mail.gmail.com>
X-Gm-Features: ATxdqUFTY5mdGhFc4ArUUSgC4AOenPGa8voKgtO-ChPuKuk16Y4sxjRuZZC2Fww
Message-ID: <CAHk-=wig1E4B-e1_6=it1LfVQ64DJsVgO6f6Ytnbzm2qChbAdw@mail.gmail.com>
Subject: Re: [PATCH] bitops/32: Convert variable_ffs() and fls() zero-case
 handling to C
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>, 
	Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Apr 2025 at 07:38, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> I tried that.  (The thread started as a question around
> __builtin_constant_p() but did grow to cover __builtin_ffs().)

Maybe we could do something like

   #define ffs(x) \
        (statically_true((x) != 0) ? __ffs(x)+1 : __builtin_ffs(x))

which uses our "statically_true()" helper that is actually fairly good
at the whole "let the compiler tell us that it knows that value cannot
be zero"

I didn't check what code that generated, but I've seen gcc do well on
that statically_true() thing in the past.

Then we can just remove our current variable_ffs() thing entirely,
because we now depend on our (good) __ffs() and the builtin being
"good enough" for the bad case.

(And do the same thing for fls() too, of course)

               Linus
