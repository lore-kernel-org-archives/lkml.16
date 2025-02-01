Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009F117557
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 02:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738377140; cv=none; b=DWzFZdVjA0mG1N3aii3Ra1mdBZO//d+ghrRIFLpHBGfYZCLXwXeISPOfThht9DwqEm8jFxwjtpVmU5Rom1MvDzzk2Q8zThFBebIqmL8+G2Sb1RyWhuOSNlc7bwnrsZL0lBP5b+gD01BXQLeymGXcP9iGs3nZiBwZCiycZ6ypU8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738377140; c=relaxed/simple;
	bh=YvUJr1IlpMallDUUXqLZIE2yKMx495vfCWgRkrRQMXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QocwFT5eii3nL3nZYvTjyU6vRTE0h5jLvZCE9+4Yxw/QZCP9jyo0BpFjF86ha1W4apXfdPnmzH5aKuC3nZXuUa6aIUkr6UA+ZYrdSTEb3vExGTfQj1hz2cyjZ1rl7ZYVdhI5nBImwK2jYVsqDKz7oyZEs8Siqma380fLtT0C3yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4H574ytS; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4H574ytS"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53e3a2264e1so2975e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 18:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738377136; x=1738981936; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pG4VfCSV2vZRH8VFu+tXkb/1AcO1THW/axuTYVw/Lrc=;
        b=4H574ytSsuT3cVotvtpy1/OQWQM25WHhDwfjFjpY0Uznz7wdG0b0/XXqVHs6y556A2
         zxJLHVcGvehKVdAw2nRGnWl0tcsjiYYYLfIIUXQsgaLoP63+Pol4tDUjaZuRlczNZCcT
         vMPumzgbPI33a7sQbCq31gTA6wGF4OAqc51hmjyMzfz3Mg4BKhMZcyZr1/pJfEbWXK/K
         mSt+ZaNT5MKaaaQJAAM0vmA7/DBxbYziu+1XC3Z4bdzBDPb1hat8whW+C8sZigsrLmpL
         QOx3y6/H7oLoilfAx7snKpSxtG2ZtXnqggqooQ1BADtrwLZQd+Q1jsMvf7biY/7WZHL3
         bWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738377136; x=1738981936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pG4VfCSV2vZRH8VFu+tXkb/1AcO1THW/axuTYVw/Lrc=;
        b=UfvUnMbxJKUaMLTWJFebM/W0vexh63oZEsee77dEra/3jNiiP0bayXoIQP9ZJcJxhD
         isinAv8DCXx9wWCrGs9Zh2NQI0Qc3jPZYSRWwGbxI6s+tk/T+ZkYs/sfcrSOTTuDNou3
         CX9enzJ9uO8hhz3Fulje5CiQBOTZOrfk9jTLcKaaGIwJzJnEuLnzgtEqtV02aso7SOj0
         DgXT5HNLhd16/prYRvCIYe0FCcm1UDu0S59r3IRFPv2nJsPY/RHxAuj1XcA92OCPOdEm
         zTUrY8Gt8L1DFpzwzM0h0jZIU3cB4H97U2QCSDdktc2Sv8CF3U+KctSFyQmmRQLLgatS
         6pmg==
X-Forwarded-Encrypted: i=1; AJvYcCWOMmFzce4xEd4MtBxbaqQmSHjhh6WWUi59MqxkNLVippngRSA2mRIQXPUG4QSNWeHPrXT5kZOXl9zMC/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPw1jNBUCyTU+hp3/7KBMwtZ9w5uZtg1UNhtBJgxGFCeEMm0dL
	Ddi3ke9gcZieXuG4aFdz3XReVOF31FQVFSPooqbcW67JjH5bOWS7qeW2onICpQhzJbbklUnbyv0
	ZIkfSe8ECEQve/Bs4OaO972yc9GPBjAiX+zbf
X-Gm-Gg: ASbGncuV9nMB8ltw7rmWiP+CgV9JrH3jnuOW6rISmSbfib2/+o4SGdttlUnW6wQfTff
	jZLd5vlhq+kq1Z+sW+ZK3qnalylQN2c9c6qgYraGtoPaTtWbSlFWgC9aE2YCmrVyUpCM1xrCoJa
	VdlaBOkgk6HdApBPdvbpv57w==
X-Google-Smtp-Source: AGHT+IGDm9JPvGLHbtjFN5gsiaTc6QnwCtkwno/1ZV6/IPpxaNeuuM5xrnBDIsxDQcK/xH+cQ2IfrP7ilTJxIVl7kD8=
X-Received: by 2002:a05:6512:220a:b0:53d:dcde:395a with SMTP id
 2adb3069b0e04-543f6160274mr132911e87.2.1738377135702; Fri, 31 Jan 2025
 18:32:15 -0800 (PST)
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
 <CAGtprH82OjizyORJ91d6f6VAn_E9LY7WptN-DsoxwLT4VwOccg@mail.gmail.com> <2wooixyr7ekw3ebi4oytuolk5wtyi2gqhsiveshfcfixlz3kuq@d5h6gniewqzk>
In-Reply-To: <2wooixyr7ekw3ebi4oytuolk5wtyi2gqhsiveshfcfixlz3kuq@d5h6gniewqzk>
From: Vishal Annapurve <vannapurve@google.com>
Date: Fri, 31 Jan 2025 18:32:04 -0800
X-Gm-Features: AWEUYZmeERapyJbLH5q17LnS9dbTKeBXAlIs3Ezuwk-Df4kRvcx2vhlD0t9pkOs
Message-ID: <CAGtprH-n=cfH_BJAmiNMoRbqq0XdGCf3RE67TYW8z7RARnsCiQ@mail.gmail.com>
Subject: Re: [PATCH V2 1/1] x86/tdx: Route safe halt execution via tdx_safe_halt()
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, pbonzini@redhat.com, 
	seanjc@google.com, erdemaktas@google.com, ackerleytng@google.com, 
	jxgao@google.com, sagis@google.com, oupton@google.com, pgonda@google.com, 
	dave.hansen@linux.intel.com, linux-coco@lists.linux.dev, 
	chao.p.peng@linux.intel.com, isaku.yamahata@gmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 31, 2025 at 12:13=E2=80=AFAM Kirill A. Shutemov
<kirill@shutemov.name> wrote:
>
> On Thu, Jan 30, 2025 at 11:45:01AM -0800, Vishal Annapurve wrote:
> > On Thu, Jan 30, 2025 at 10:48=E2=80=AFAM Kirill A. Shutemov
> > <kirill@shutemov.name> wrote:
> > > ...
> > > > >
> > > > > I think it is worth to putting this into a separate patch and not
> > > > > backport. The rest of the patch is bugfix and this doesn't belong=
.
> > > > >
> > > > > Otherwise, looks good to me:
> > > > >
> > > > > Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>=
@linux.intel.com>
> > > > >
> > > > > --
> > > > >   Kiryl Shutsemau / Kirill A. Shutemov
> > > >
> > > > Thanks Kirill for the review.
> > > >
> > > > Thinking more about this fix, now I am wondering why the efforts [1=
]
> > > > to move halt/safe_halt under CONFIG_PARAVIRT were abandoned. Curren=
tly
> > > > proposed fix is incomplete as it would not handle scenarios where
> > > > CONFIG_PARAVIRT_XXL is disabled. I am tilting towards reviving [1] =
and
> > > > requiring CONFIG_PARAVIRT for TDX VMs. WDYT?
> > > >
> > > > [1] https://lore.kernel.org/lkml/20210517235008.257241-1-sathyanara=
yanan.kuppuswamy@linux.intel.com/
> > >
> > > Many people dislike paravirt callbacks. We tried to avoid relying on =
them
> > > for core TDX enabling.
> > >
> > > Can you explain the issue you see with CONFIG_PARAVIRT_XXL being disa=
bled?
> > > I don't think I follow.
> >
> > Relevant callers of *_safe_halt() are:
> > 1) kvm_wait() -> safe_halt() -> raw_safe_halt() -> arch_safe_halt()
>
> Okay, I didn't realized that CONFIG_PARAVIRT_SPINLOCKS doesn't depend on
> CONFIG_PARAVIRT_XXL.
>
> It would be interesting to check if paravirtualized spinlocks make sense
> for TDX given the cost of TD exit.
>
> Maybe we should avoid advertising KVM_FEATURE_PV_UNHALT to the TDX guests=
?
>

Are you hinting towards a model where TDX guest prohibits such call
sites from being configured? I am not sure if it's a sustainable model
if we just rely on the host not advertising these features as the
guest kernel can still add new paths that are not controlled by the
host that lead to *_safe_halt().

> > 2) acpi_safe_halt() -> safe_halt() -> raw_safe_halt() -> arch_safe_halt=
()
>
> Have you checked why you get there? I don't see a reason for TDX guest to
> get into ACPI idle stuff. We don't have C-states to manage.

Apparently userspace VMM is advertising pblock_address through SSDT
tables in my configuration which causes guests to enable ACPI cpuidle
drivers. Do you know if future generations of TDX hardware will not
support different c-states for TDX VMs?

>
> --
>   Kiryl Shutsemau / Kirill A. Shutemov
