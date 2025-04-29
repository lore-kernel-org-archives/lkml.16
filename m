Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EE9252912
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 20:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745957591; cv=none; b=ZoY360QyKEDr7UWofHTMXNsJKCVLc9xM/1+lILW/CGtkrnrI+DZkofiuxj/lLtgUCL0k6unEJAOPUmdUH7tAEnVxMPSze77PLJ92QoXeCILCIfaLPRwmyuXq3ciIgvKRxsVMvl/uC2XyMlsl5CR+m6YXy8x86mhVMOpljtH/l0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745957591; c=relaxed/simple;
	bh=RY8CXnR5fy5tMeLdFHqQ85Fd6rdvi3i9+UG0d8LhAU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O6ydJZZITNfWeww3pdyha3JVGRd2IWboF9tPKbDi6JUCVP02f+4PHKDtYg7p1E6TbV8p/Gyh5txFKi1YOW2jJ6qe4ddv1DNM2pjv45lMRgvs3IX4LCeY+LrmIj7kAUoTGm+/H6tJ0lE7gm+zjw/7NhNQ0jS+YyEcgxA2zceZz8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=V7RbCp+y; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="V7RbCp+y"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac25d2b2354so978241166b.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745957586; x=1746562386; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GD6DJTcwCWd1erihJG2XGCn33fsN6axQdQziR16yUsw=;
        b=V7RbCp+yNnuzM4QWcC/7jF+X9W6XDpJN4uRkwcVFyWDn9VD1ikxv+eqcGpEmMATbU3
         nTArM+Dl/Q7FSzuzZSm+14pza02PyWZZtHfYYTqpn4bF3xmokmXOpoIWOqB0hKtavVNm
         h5rqL5DITd5wKzIc/BmSdvdRxuHXUPPB1uwlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745957586; x=1746562386;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GD6DJTcwCWd1erihJG2XGCn33fsN6axQdQziR16yUsw=;
        b=aakYtJvi2C7tlcQra/TVl+i2ThvvrzNr6G+v9FdUIvgbm5I1MS4IK7cxl3aoNTKdNA
         n6Qo5lbk96fLgniDR1U38AKXyp1RG0OynB3aD+Krrm19908cuPcVXgcaVWLGfUdu6aQP
         UoOFR5CaLPzM/cBcUimUUt/Gu1o5I/vGuaAy4+FbtZj0Sz5n2J2xFG6VvzOZpoCxaS8Q
         JB00kHEnjIbm8XLPm0LwQ3QhH54/SIIFShrgl70EAxM9ksTyce2VyGiDL1HwHQB/N2pL
         1PTiyq+1+ATUMi5qSbRsHPuVpORkER0EzbvlE3ZlzlVgg1i/x6NW5HnV8L2GL+Cqn2Yd
         9a1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWwhzzRwvvTM/Cl0yJEwUpJuEvp65kPqmeiuUeWKQK6L5ZryRXbqVhzhlleonWWHHBV/dZNQsGeLCies2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVYMLp0XlL6bbXJ9dSM1Yf/0jG2p3HCahwRDe15poO78WX1Qzq
	QgSjnko/LW4kFXJc84sUEMhiAB8AhspwHyG0QmzjpfRNxW68tJgwp1vpfJKig+YsCj3XdGvmoSr
	h/WM=
X-Gm-Gg: ASbGncuZbpjK5Iw3PFqQPbWMkpoPVku994rtQ7wQzVYGzbZk3kNQYObvqlstSZ+CDab
	jWstvqpzt70BEKK84+6OzZfonyLoXkyrOWenB3KJXJ2pfmQ2N4IHWJePDh76ySS3yE+Oqk/NJH8
	759p3BsBoBiAYok/UYkRgsYRHpmlQKScvrbHZn37RP7xSwTJLWmYV8zzIbfdN5BAhG4kTM496ur
	cESb22RulV7RToFvXfvDewkQtSNGCIah2kid46WnieR2XhMca/8jcJdm5sGQi9BwH2aJq+B0Kby
	owIfFaQdlpS5CFZhInPwuKKsenJ4A/EEsff4IRlhzPdKIS6KgbGkvU05VKB2PVdto8dW6WLVrsy
	YIN8cLiPCpZtMhro=
X-Google-Smtp-Source: AGHT+IEaNOqsf2zvOpQs7PpCJ6cNCY5ZNodHX31N7TH4yoghjIfVO1nxq6M/RctQ5ruZz6oqNAU6jw==
X-Received: by 2002:a17:907:9628:b0:abf:6f87:c720 with SMTP id a640c23a62f3a-acedc62902cmr74826066b.29.1745957586588;
        Tue, 29 Apr 2025 13:13:06 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acec4a84247sm197794566b.55.2025.04.29.13.13.06
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 13:13:06 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac25520a289so1029715366b.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:13:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV4Nvdf2mfESIRluag6/3otr0UyIUpMM6pXlkfrrmJQ4bFME2cAHQ8n+/69NP085yYhTmQ9WzwLmSENvMw=@vger.kernel.org
X-Received: by 2002:a17:907:6d1c:b0:acb:ba0f:4b12 with SMTP id
 a640c23a62f3a-acedc66e49amr67356066b.36.1745957586006; Tue, 29 Apr 2025
 13:13:06 -0700 (PDT)
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
 <CAHk-=wig1E4B-e1_6=it1LfVQ64DJsVgO6f6Ytnbzm2qChbAdw@mail.gmail.com> <81ed8b53-1a40-4777-ab87-4f4abe032dbc@citrix.com>
In-Reply-To: <81ed8b53-1a40-4777-ab87-4f4abe032dbc@citrix.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 29 Apr 2025 13:12:48 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiAPQFf-RUr=8ra1sYdfGPGLb4QbV8THE9zY3n820L94g@mail.gmail.com>
X-Gm-Features: ATxdqUGerTZyFJ8KMx9SH7AYZ47WuJ2Hfngvi8M9Z27cjt3IrNr0gN037dkObQQ
Message-ID: <CAHk-=wiAPQFf-RUr=8ra1sYdfGPGLb4QbV8THE9zY3n820L94g@mail.gmail.com>
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

On Tue, 29 Apr 2025 at 12:13, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> That would improve code generation for 32bit, but generally regress 64bit.
>
> Preloading the destination register with -1 is better than the CMOV form
> emitted by the builtin; BSF's habit of conditionally not writing the
> destination register *is* a CMOV of sorts.

Right you are. So we'd need to do this just for the x86-32 case. Oh
well. Ugly, but still prettier than what we have now, I guess.

         Linus
