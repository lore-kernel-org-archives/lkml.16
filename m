Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8801BF37
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 02:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745893402; cv=none; b=lQAN/xVkfh+4OXZQKO+8qgKu/AUsYkAsnCsfwWa/7qa9ekGNCh+FoyPVzpjgzlQcVk0v/Bh8HEUiinAH9skUHI8YXFFn37d5P25dadYsRWL3a2cxt2Wj56gWe4sH8wuGz2+0Nz0t0WMR0KiDcWgmj20nbzNjMl2PZU8JEtzBlL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745893402; c=relaxed/simple;
	bh=V8YH+r7xMbMWEj4VSxpV/83K1jvY0jqLxF5+hSyC61U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=keanUxg3EApS+VuARPz4M5OMCZKzjlBvlCdBtr8dw+BX6BGapNssNIAIfKtBeGMWF2uVggjxXlJS9ZR+qKHOgX8Br+ZaolZ/O1i+pxc1kqEPQ7TLU0PRW29TLFRNBQIURj06Aq8+WF5AqXR8JP7FWUxA0444PRDXFZC23KaRUFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=XQEnGoFU; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="XQEnGoFU"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac6ed4ab410so857805666b.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 19:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745893398; x=1746498198; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OnBKvw2kgpkCx0VRoBE8FRrW9svaRVFdZx7JKWWKbs4=;
        b=XQEnGoFUjRIe58z4fCa7O7XYWQHG8w2E6LVtvqSCbKxKhDKlgM55Ic1U82bClf8ue3
         0859Fsj+5BixukUnboylhYnoIdck8SHKofMqyKmQSKbWyEDM6Q04n/BxOV9N/iylLDHG
         E84kG3gsowR9j4UV/Oo/PhYAp5RpYKp4dZz58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745893398; x=1746498198;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OnBKvw2kgpkCx0VRoBE8FRrW9svaRVFdZx7JKWWKbs4=;
        b=tmWsPR+tAdyBFVFM4o/SfOKFC9y6t6t3EZq0ONHT4XTmNyF3in9jngz0sKnbGPly+Y
         Sy98HJeVmhPt35SNbNRVLxQRWoAeQYMe8vS5HVO4uKJ9K+nFosubQWkTwQQkuPvB9r7+
         BjREkAixUz+U1GdtFv+AAxbAMlKNvHn2xeBEJwf+Hml+Y2kigGZM8EIGJR/6uR9CzwFW
         DIzq8siqNOpwH4xMeHF7jW27SXf327+UDhI5Aak+XTzoT43BSE46UN5aFbzctT+c1yhM
         WjWN+FPpzFF0bNUUKPvAV3hzwZWkHPJcYo7vVPVkm7ITwhKGLROKmTlbsH5kX5Mj5w8u
         erzA==
X-Forwarded-Encrypted: i=1; AJvYcCW8qn9UK4GQAcRj+mYnaGPqx6RMqZjAJFC6ebXgwwde1jrkdE567Rnq1CQObwTnqojUNmMUF0rGwK1EK2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy30vDqZiQisAdzCKYnR/Nm2OhMZEXHoiqWF+Uy++kt7GWGwfC
	2Y1S+ZlJZEL2LePA3mrUHdmuC+opM8LsB7sKhPDW3dX+mdUCUJxW9IrDI+iv1BwAQRfAAsQbWVn
	VaDBU4Q==
X-Gm-Gg: ASbGncsPa8IOGXOFfLLSW3Rh7vA1O+ogVm4Tkr7OQ44FzhmNqmCBre1SaWec5LljOhW
	UKmmAbokL/pX4UVUhvTgQCQHEVgrnTCSUy2b6QhKp1eD54id1bpuPqUncaFnXlbNTzGXf5Ma8jI
	i0L8JhcY8V23gTEHw5c+VtdQvQdbzsDyS2gGs56J5xd1tgUVGvYBYRwPrNK8vrwk+enJKdkpaAE
	+htSp44d6E93BS4vC9u8mz4WswIZulUvV8xyUVcESbN8qYPTJgS8AHNJbmzNXLMJP9NCcsvUb6f
	gn5etISZYM0Z3WymN47xhZ9c2vpVE5orqCVu7QAPvCtvMf2jQFgZoLAz330JuJAIcTLLCpk2vK9
	UTegfmtsBwGsCIIs=
X-Google-Smtp-Source: AGHT+IEilqnYbV3Snu7rBu3yQkokX6g+dY+6ES57ZoELdpuomdP+TDLKQOHMvUmZW4ftvJLuLz67cg==
X-Received: by 2002:a17:906:f592:b0:ace:5461:81dd with SMTP id a640c23a62f3a-ace848c219bmr1030591166b.3.1745893398215;
        Mon, 28 Apr 2025 19:23:18 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edafec7sm704107166b.165.2025.04.28.19.23.16
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 19:23:16 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-acbb48bad09so1019621966b.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 19:23:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVQFgbHNKvaaVUiP7is5vwrphdCwsOYFEpR6NAT3C0eoOrfUeCEWTljChiDF15lFWLXejfiwwNt9kjyVc0=@vger.kernel.org
X-Received: by 2002:a17:907:94d3:b0:ac3:446d:141 with SMTP id
 a640c23a62f3a-ace84aacbabmr901645166b.47.1745893395747; Mon, 28 Apr 2025
 19:23:15 -0700 (PDT)
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
 <916BD58C-E6A7-495E-9A60-722E130AC7A7@zytor.com>
In-Reply-To: <916BD58C-E6A7-495E-9A60-722E130AC7A7@zytor.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Apr 2025 19:22:59 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg34q=Mp7abB1zgL1GnXJ9Z_dOoZiBxqyXRtHipCpuyiQ@mail.gmail.com>
X-Gm-Features: ATxdqUG_ghGMO55z_hupmo__0S_CBd8urm2dTp6Qs-e2EcpEWp5VhXjCeavjAEY
Message-ID: <CAHk-=wg34q=Mp7abB1zgL1GnXJ9Z_dOoZiBxqyXRtHipCpuyiQ@mail.gmail.com>
Subject: Re: [PATCH] bitops/32: Convert variable_ffs() and fls() zero-case
 handling to C
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Ingo Molnar <mingo@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>, 
	Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Apr 2025 at 19:00, H. Peter Anvin <hpa@zytor.com> wrote:
>
> Now, question: can we just use __builtin_*() for these? I think gcc should always generate inline code for these on x86.

Yeah, I think we can just use __builtin_ffs() directly and get rid of
all the games.

Not all gcc builtins are great: I did a bugzilla about gcc ctzl some time ago:

    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106471

but for ffs() that does sound like it's the simplest thing to do.

               Linus
