Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DD81CF8B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222044; cv=none; b=bXfYmJwwVyAZ5WZwhvO46VSrDNJLHu4VOfXE/92PhKnw60Dzws2+K9FSXS1h+QJWxKY+otKNVbbeo5iLqW7gimwKP1wbcx/imGnyvfO+U/IrU90yLrDVRZ29diCg4M5ynSI30kIepTtRawb5HSf+2kmywsjSbUgg+Z6y/iWh1WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222044; c=relaxed/simple;
	bh=oWsq7pSP/6klRvXAToImCF1XB9i+hJ0svmrgcQBJezw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QRXxAfI+UpA7BXKyRitwcTA6tqbEJ5OagTZNgbDR8FqnhDDSKILYvxkgs489isSrnY300/op93cBCEuyjpXhhQCZ50Go9FBWBMfjfXiVouIhU9+q/S1Ho2WfZ1xNi4mG/7aBibDgLnRcznSMecGiOVwCFWd/E8HrpT67trBsVh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a/qu9XU6; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a/qu9XU6"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e5cbd8b19bso1222a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 11:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744222041; x=1744826841; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QtbTi3Z46uGTzgxo/COziy1stCKj2J4tTz5eDTS8Rvw=;
        b=a/qu9XU6868hI1YO61OgMX2qKNDsZU9HJNYLECcvCm54vTPl3roFu1dPG3o4j8KOrz
         VtzYZBxJcTTDkAj1U14hHJX4oT7s5B391ND8ZW81473m/7Ez4cQcZNTkFCw1nPVomvKB
         4M05bebJKjFAJugsa5KxiOaxHNUFJicEudPvK73usg+KZN6j1xocXhKuJwTVl0brvYaQ
         cDev1bGoyHKrfgapYi9kKmW+z0k+mSGRqc0UcvnFIH0D1XBv7p4N1Gm4y8mkIK2dnkkG
         nqD1ZYLJp+rOYNQKccSgeQV0GO+OVKhD2lmg8ayU/qnVUg3FqeMWMvaZkT/9oO4uARTP
         oj2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744222041; x=1744826841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QtbTi3Z46uGTzgxo/COziy1stCKj2J4tTz5eDTS8Rvw=;
        b=qnQbOLocwf+Li86VhAaK/fWX2k3hEX41eDZdsRi0RAXYkdClpy1Kcg6ed6oVSd3Hov
         nmGM9bMWD92Dxpkvjfb/kBclC2vP4j8oBnAfAuMHT+H6pVtUINfxWt9RMU5/MP9GhvGc
         PVOTJ9WWYQ/ZeD+KKXQJNvkXaoj3TUs6vl1SxVTzM1lGJC4yLJNNOLnyA5LJH7R2RzPn
         4Q9kKWoI3vLZAcy7xOCZEwIyL9YA53CJuIMG7JxZLVksKtOQ1XtfA/0R1mMjSoYlnRL7
         ooIC3kwD4g/aNz1HEGM2bFOB3eP1ZexIQVOvH7HfOWBV27BxGxxBPn83qRQ92lnwVhw2
         ydEw==
X-Forwarded-Encrypted: i=1; AJvYcCWFVQhn0vZilgWGUtU/gzatEFp4sj1lOYoopP0094G8hg7ePsN2or1FpVh7mNegVP5qXBEL2UpNScFN9dE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa5sRrRfd+84BTUuY+G5b/LlpsXBGFaWSNkGpqndKxv8l8s8kL
	HWTrKX/Ms7CYqI/s7ijgOsGDGONLVPXEyHW6h1N+sQRqjBO2dRJ/XpsokwLmz5p3JtVIs/hyW2b
	nsB3ZyuMCj7CUU+qgjMMUxy/AwM/2aCdtjEbM
X-Gm-Gg: ASbGnctDGEMDi3+PY6hcVSB9/OXC+m2xThWPZaMA9YhthfBXQZtr9DmNY7QiKqSeERY
	kfwlyRzjDewM3SXNHHeol1Abf2BUAY8h6Wt48nUAJg4GUEJJGRs/BcRT0De7+Nx5lfL05gwPGx8
	N+/GYT8+7rsiXx0QgFA53R3Q==
X-Google-Smtp-Source: AGHT+IFLXILkPvsN66UMgMow3edhrqHffiqmmr67EN0Hm4/JeFXIX+Q8tnRQcY8mh3z+oIpJxQXTe80KNTFeP5kc6FM=
X-Received: by 2002:a05:6402:691:b0:5e5:c024:ec29 with SMTP id
 4fb4d7f45d1cf-5f328aa7669mr2385a12.0.1744222040672; Wed, 09 Apr 2025 11:07:20
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1743617897.git.jpoimboe@kernel.org> <df47d38d252b5825bc86afaf0d021b016286bf06.1743617897.git.jpoimboe@kernel.org>
 <CALMp9eTGU5edP8JsV59Sktc1_pE+MSyCXw7jFxPs6+kDKBW6iQ@mail.gmail.com> <fqkt676ogwaagsdcscpdw3p5i3nkp2ka5vf4hlkxtd6qq7j35y@vsnt3nrgmmo5>
In-Reply-To: <fqkt676ogwaagsdcscpdw3p5i3nkp2ka5vf4hlkxtd6qq7j35y@vsnt3nrgmmo5>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 9 Apr 2025 11:07:08 -0700
X-Gm-Features: ATxdqUFkqaXdDHS_kQwtSnvOSFLjU2LBylVO7-mb8tueLlp0v7jRT7H5Uwt09HY
Message-ID: <CALMp9eTHsPeYi7wLaWtp-NuxE8Hz_LZUFYKUfzcx1+j+4-ZjmQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] x86/bugs: Use SBPB in __write_ibpb() if applicable
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, amit@kernel.org, 
	kvm@vger.kernel.org, amit.shah@amd.com, thomas.lendacky@amd.com, bp@alien8.de, 
	tglx@linutronix.de, peterz@infradead.org, pawan.kumar.gupta@linux.intel.com, 
	corbet@lwn.net, mingo@redhat.com, dave.hansen@linux.intel.com, hpa@zytor.com, 
	seanjc@google.com, pbonzini@redhat.com, daniel.sneddon@linux.intel.com, 
	kai.huang@intel.com, sandipan.das@amd.com, boris.ostrovsky@oracle.com, 
	Babu.Moger@amd.com, david.kaplan@amd.com, dwmw@amazon.co.uk, 
	andrew.cooper3@citrix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 7:18=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.org>=
 wrote:
>
> On Wed, Apr 02, 2025 at 02:04:04PM -0700, Jim Mattson wrote:
> > On Wed, Apr 2, 2025 at 11:20=E2=80=AFAM Josh Poimboeuf <jpoimboe@kernel=
.org> wrote:
> > >
> > > __write_ibpb() does IBPB, which (among other things) flushes branch t=
ype
> > > predictions on AMD.  If the CPU has SRSO_NO, or if the SRSO mitigatio=
n
> > > has been disabled, branch type flushing isn't needed, in which case t=
he
> > > lighter-weight SBPB can be used.
> >
> > When nested SVM is not supported, should KVM "promote"
> > SRSO_USER_KERNEL_NO on the host to SRSO_NO in KVM_GET_SUPPORTED_CPUID?
> > Or is a Linux guest clever enough to do the promotion itself if
> > CPUID.80000001H:ECX.SVM[bit 2] is clear?
>
> I'm afraid that question is beyond my pay grade, maybe some AMD or virt
> folks can chime in.

That question aside, I'm not sure that this series is safe with
respect to nested virtualization.

If the CPU has SRSO_NO, then KVM will report SRSO_NO in
KVM_GET_SUPPORTED_CPUID. However, in nested virtualization, the L1
guest and the L2 guest share a prediction domain. KVM currently
ensures isolation between L1 and L2 with a call to
indirect_branch_prediction_barrier() in svm_vcpu_load(). I think that
particular barrier should *always* be a full IBPB--even if the host
has SRSO_NO.
