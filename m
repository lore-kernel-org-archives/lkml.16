Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869D520B7F8
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 17:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738602118; cv=none; b=mZxh54k4U1ttyIIAcLwN35+o0Kkh19IfqUMXJCU2IGMYjaFEwmFgRvVJWOkCpxJyom/g1IVxHTl64fRsTb0yxV7Y7IW4Tzjc/HnVBuM9chSsPHoSK+KiTCZiBuhNcqGCCh75gKvWiMbzF0Tt06fSy2jYyXleMs+u1AfIuTdY/3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738602118; c=relaxed/simple;
	bh=zjXH5kws7+knI9DbmzEjGDquVdWrIc8UIpcNiHa4Cuk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jOQF1rkSD34CsF7L7z9OAsCntOkx7/YArkrAC5S4crxmWAsFWDbcuXnBwzKim1TSg1IDoS4YmyzuDjB6dSj9GG5H8FR1zqX7Q8SSO1RHNKs0R43h52dguqSsccRlH4xTsyRx/1YtI8ZNmXTqJNq6hwQsCX7pcg+aIKC0tx9bbbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t1wh9Oo/; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t1wh9Oo/"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5401af8544bso9201e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 09:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738602113; x=1739206913; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qb2BWOjM2AxjI76h/fY+Q764chvs+1zrd6CSA4WoxvA=;
        b=t1wh9Oo/wJM/NN0AkF00PPNx55xN0ddUy56xgPrZy94mOKU2k1w04PEv7S4WhPGb25
         zCKIg5+12ILkvLgIBFv9EHnCxjOWMcOqOySk6qIdg0z+EAHMlIU9u6QOO/B/3pV9wihf
         RdI5y2nyTqz0Rb/LwVbV7ykuOrVy+ijVQFlP7O053XSc7nUzpm582h/xJOPEk97Zh7Uv
         nWanz2VaAh7RNHxKqYwl1r/Ju31JytWtfS2aFqNJyhmswBXWP0G55sPXRAekZmcVJQIs
         yxlZxWFkJRDCPOIhSJfRL6METjSTpDHebPlFiKvebWxXpffyFCIzyWHuSzYOTNuglV8b
         Np+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738602113; x=1739206913;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qb2BWOjM2AxjI76h/fY+Q764chvs+1zrd6CSA4WoxvA=;
        b=Wahb/PJ5PTF9b/DKwNNNoOtWnMJ9SmQj7CJv3yVRQOcyoC5sQXCtKNUrwYjkr47oWX
         H3HBz3H8wbl6sYTSz/uEQKHaUvKhxAZOJKrhPansAwYTIT36FhKiTmtgeMcuq4Im2wLr
         Laxlij1i4pGqJEgf3lItnpL0h3TwIkaRdAM1RCwrGcxSLT6+SwWz0bXsEx1YN2P5ri7x
         khv5ar74J3i+v4RHa2JfHWPpchOJT5MtFi8lADtnJBQZnyqbG1hAkBLk3QxehaZLtITj
         CncYQcz7jaQLuK8TWcdPOfBrkeRyDpouVWAySR/3JNKD+AAXv5XAoBQORs7lS2i0lE+p
         GuJg==
X-Forwarded-Encrypted: i=1; AJvYcCVMl8ZViS/IXnxc1lGDlN8sX3oIMkPgBuUvCHpqRTGuP+6X2vfjALNJbf8PyVdxm7yi7KYAJMFHufgqPGo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx69/7HQESACCHhkn11ZptPEINQKimkM3RNlcvvTolOu2SdnKFA
	w6eG11M+Yq1fo97FsYJXJXehW+QGEL4EOhpQ0oxM0VvPFja+6Rh0FbodVOA0AFIJPc6XTpk2ZP/
	LpkkGD/vJIMhkJdMHmWGfeJPSNhHFgYblLDBf
X-Gm-Gg: ASbGncvFJfPWwr/XEdUnGkD548MIEXhcE+I0AZdZElzG84jtEaHvk+/QmaHm8/EkmZI
	IkSkBjjqvkNnFqnmYBCu8BQIu8I+lbFp1OlWkX9Xv1Vh/BIxxqGvnVLxYIuKqThf4y1s1G/aXQN
	6JeWVu6Ij+Ap4C2bclzvkdmn0gh2AYDQ==
X-Google-Smtp-Source: AGHT+IERgbXu4cZMbowmhVW8KSIRv9nsWeHKT5DJAWPkiUFMWjoeG2P3EHYpBuBLck0a8kHsQSZGuCEMrY5xfJ73NYU=
X-Received: by 2002:a05:6512:aca:b0:542:7130:badc with SMTP id
 2adb3069b0e04-543ffa52a17mr4941e87.5.1738602113129; Mon, 03 Feb 2025 09:01:53
 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129232525.3519586-1-vannapurve@google.com>
 <p6sbwtdmvwcbr55a4fmiirabkvp3f542nawdgxoyq22cdhnu33@ffbmyh2zuj2z>
 <CAGtprH8pJ3Zj_umygzxp8=4sJTdwY5v2bFDhoBdX=-3KQaDnCw@mail.gmail.com>
 <wmdg54v56uizuifhaufllnjtecmvhllv35jyrvdilf4ty4pfs5@y4zppjm2sthr>
 <CAGtprH82OjizyORJ91d6f6VAn_E9LY7WptN-DsoxwLT4VwOccg@mail.gmail.com>
 <2wooixyr7ekw3ebi4oytuolk5wtyi2gqhsiveshfcfixlz3kuq@d5h6gniewqzk>
 <CAGtprH-n=cfH_BJAmiNMoRbqq0XdGCf3RE67TYW8z7RARnsCiQ@mail.gmail.com> <baiv6tl2lkr25i2ry2q2jaylu5y6hhioqfwhc4yafk2uwqbgf5@sqxlpg2r6kcc>
In-Reply-To: <baiv6tl2lkr25i2ry2q2jaylu5y6hhioqfwhc4yafk2uwqbgf5@sqxlpg2r6kcc>
From: Vishal Annapurve <vannapurve@google.com>
Date: Mon, 3 Feb 2025 09:01:41 -0800
X-Gm-Features: AWEUYZm1pUNVQSKvKstcecqYl2-3LVWaTH9LroDV3vXolYlnD_tCGouWLYwnW2U
Message-ID: <CAGtprH-5bL44c7ZQHKsDuOQNNd4dsBd-uR8GT9OyqffEXW963Q@mail.gmail.com>
Subject: Re: [PATCH V2 1/1] x86/tdx: Route safe halt execution via tdx_safe_halt()
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, pbonzini@redhat.com, 
	seanjc@google.com, erdemaktas@google.com, ackerleytng@google.com, 
	jxgao@google.com, sagis@google.com, oupton@google.com, pgonda@google.com, 
	dave.hansen@linux.intel.com, linux-coco@lists.linux.dev, 
	chao.p.peng@linux.intel.com, isaku.yamahata@gmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 8:00=E2=80=AFAM Kirill A. Shutemov <kirill@shutemov.=
name> wrote:
>
> ...
> >
> > Are you hinting towards a model where TDX guest prohibits such call
> > sites from being configured? I am not sure if it's a sustainable model
> > if we just rely on the host not advertising these features as the
> > guest kernel can still add new paths that are not controlled by the
> > host that lead to *_safe_halt().
>
> I've asked TDX module folks to provide additional information in ve_info
> to help handle STI shadow correctly. They will implement it, but it will
> take some time.

What will the final solution look like?

>
> So we need some kind of stopgap until we have it.

Does it make sense to carry the patch suggested by Sean [1] as a
stopgap for now?

[1] https://lore.kernel.org/lkml/Z5l6L3Hen9_Y3SGC@google.com/

>
> I am reluctant to commit to paravirt calls for this workaround. They will
> likely stick forever. It is possible, I would like to avoid them. If not,
> oh well.
>
> > > > 2) acpi_safe_halt() -> safe_halt() -> raw_safe_halt() -> arch_safe_=
halt()
> > >
> > > Have you checked why you get there? I don't see a reason for TDX gues=
t to
> > > get into ACPI idle stuff. We don't have C-states to manage.
> >
> > Apparently userspace VMM is advertising pblock_address through SSDT
> > tables in my configuration which causes guests to enable ACPI cpuidle
> > drivers. Do you know if future generations of TDX hardware will not
> > support different c-states for TDX VMs?
>
> I have very limited understanding of power management, but I don't see ho=
w
> C-states can be meaningfully supported by any virtualized environment.
> To me, C-states only make sense for baremetal.

One possibility is that host can convey guests about using "mwait" as
cstate entry mechanism as an alternative to halt if supported.

>
> --
>   Kiryl Shutsemau / Kirill A. Shutemov
