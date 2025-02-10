Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9675256C69
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739207195; cv=none; b=oWQWmk7oc8Do5XKbdvXaIKLlXgZUOvq2VoF6x9BQKb75z5of7GTC2gC7kcivFvIdKA73Nm37p2SutcwdU+AR9KbGy62DLw/DvTGLV3JFpXbY9EOXWw1dV/Bqr4e0c+9dJPgTZ4+n8cWw9Dv1xb/Zo68e0h1xZ+W7tSAXaOY+s+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739207195; c=relaxed/simple;
	bh=Tr6+7p5OdePu925uw+dzqIPWPS/3k1Zkz8tlNX0oOOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N5vPx+9FO/7s8iQVoU8+5UB9phwI8LqEu+I2EHcGq28mPpP27JvjuaXJHWkbKDTHVix7XZjec6AaActleEXIsc87nh07TXsCi/IiEW6MwK0BPY6IF3vomY4vo5vYKxK29w0eI2o6m8N4rGKyNCreMgBiDRwZCRq1+GcqPYKYPgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wkvmWn3D; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wkvmWn3D"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4718e224eb1so284831cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739207192; x=1739811992; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CCd552SIvrkvzR87WO74bUj+agOa/968bVR4a4y81ls=;
        b=wkvmWn3DAVG7UreIbt1x0OFOT79gTZ5UFevGkxHPrbPXZ98Hn32MedBnZ1iFR4HDE7
         P9/LczkfC5KwSegiQUyifiJU5dMcqMzTYV2fNyRaNjb9sWyJJgqGQwvYADgdI1bKrTU4
         s+QcOR4BHfRQBGvxJPR4ALBJewbfpdN5CWNc3Qv84hc8XO8NMd15lyDI3MTgmcJKwl5R
         BguJBfhDSkkuBG5fN3Imq1739K9uJrn6XTrpD2tnAiRu3pwfLTVggX3mKsV5h7ZSc9AE
         oiL/jCWH2aS+4FZPN5FyK0OQvqXogN8kH4OjucQzUlumUpwDvAxYWX0o3nq9IY4LrBHg
         8jsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739207192; x=1739811992;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CCd552SIvrkvzR87WO74bUj+agOa/968bVR4a4y81ls=;
        b=dnDfdD8GT6GcBA/AL6kG2aUmJvcVd658nS6NDJbCRFMXoq4oheUVeh1MwI8amX0UxG
         iHUdPAJIo0aygwde1MwOFZBSMYnyPOhaRH4TuiP9LAUWDvhKKIzb+d91mLhUnMA8gAxt
         QG6xxBcw/ucp2AuxhSc0SDZmMPOKa+fe6immfgrpg6oKOZkzI51XiaGEVnYXhGRXna49
         UWVM7eLPDfwaXRVvI+8szWXIZUmRYTaD71v7v5lWxCvRJr0ZKUtn+ctGEwEl+6uNbFQS
         sCO9Y0Ea8gqC9L44PBIx9HER8aOa746ksh17lPJdE3seMigoCmuAKc5R+IDo00vn6Rdm
         aYXg==
X-Forwarded-Encrypted: i=1; AJvYcCVBuX7tjX88BqY3Bdkc+daBUZaWUm5p9SEpCe3weIpsNTDJVGNzZ/bsUrSm3ZjKVIkyTrtxrc2lea5i638=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoNfJ5LSPLmGUHKMchDUMWh4H1cOk33El19bYjfv3t6tAb8hkx
	kev4kJ93lPx7B/NWZp5sslAPFuI5hXqfBCJrHh+G5yOjqT0pctteZFCE6o0gSo8k0y2Zd6h+OE+
	oWz6wSFzrnse2P8Mrg+SU8f3bUUp27QkI+MXl
X-Gm-Gg: ASbGncsO3toD3d+HcWS2MKJrm/7atNEVMOA6xt3ZXAwjjVz8LY6GxrZ7f2add4Tyabk
	VLOFf72JrZL0Ob95Y4xwuDD7heH1Gpy2wC4AF7LSKeo4caQx3crQ35t5wGgohEyIJesoXybKtm8
	nURYX2Vzv6fkH0oBM41cCy8CGsEO4=
X-Google-Smtp-Source: AGHT+IGxdNlUUgSn9lNtuNiD0Jufg0MRMOSa1L3z5YcaHUSzjHrT1fAcSlSknaMVqlI9+84dzO/xer8Af49nCRIWQIk=
X-Received: by 2002:a05:622a:1a02:b0:471:98ba:cb41 with SMTP id
 d75a77b69052e-47198bace2emr3352511cf.2.1739207191508; Mon, 10 Feb 2025
 09:06:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250108202515.385902-1-david.kaplan@amd.com> <20250108202515.385902-11-david.kaplan@amd.com>
In-Reply-To: <20250108202515.385902-11-david.kaplan@amd.com>
From: Brendan Jackman <jackmanb@google.com>
Date: Mon, 10 Feb 2025 18:06:20 +0100
X-Gm-Features: AWEUYZkO6keBQ8WkViCVcaGyW9JP3sQxr7rTjkQl_2iS3oZmUiv_lWjBJxfwad0
Message-ID: <CA+i-1C2LD1A-QjTmGv-ONB-1+jmecZSU7i__G7gf=81VUNMKCg@mail.gmail.com>
Subject: Re: [PATCH v3 10/35] x86/bugs: Restructure gds mitigation
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jan 2025 at 21:28, David Kaplan <david.kaplan@amd.com> wrote:
>
> Restructure gds mitigation to use select/apply functions to create
> consistent vulnerability handling.
>
> Define new AUTO mitigation for gds.
>
> Signed-off-by: David Kaplan <david.kaplan@amd.com>
> ---
>  arch/x86/kernel/cpu/bugs.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
> index fedd693b2218..58ac99b74bd3 100644
> --- a/arch/x86/kernel/cpu/bugs.c
> +++ b/arch/x86/kernel/cpu/bugs.c
> @@ -76,6 +76,7 @@ static void __init srbds_apply_mitigation(void);
>  static void __init l1d_flush_select_mitigation(void);
>  static void __init srso_select_mitigation(void);
>  static void __init gds_select_mitigation(void);
> +static void __init gds_apply_mitigation(void);
>
>  /* The base value of the SPEC_CTRL MSR without task-specific bits set */
>  u64 x86_spec_ctrl_base;
> @@ -220,6 +221,7 @@ void __init cpu_select_mitigations(void)
>         mmio_apply_mitigation();
>         rfds_apply_mitigation();
>         srbds_apply_mitigation();
> +       gds_apply_mitigation();
>  }
>
>  /*
> @@ -811,6 +813,7 @@ early_param("l1d_flush", l1d_flush_parse_cmdline);
>
>  enum gds_mitigations {
>         GDS_MITIGATION_OFF,
> +       GDS_MITIGATION_AUTO,
>         GDS_MITIGATION_UCODE_NEEDED,
>         GDS_MITIGATION_FORCE,
>         GDS_MITIGATION_FULL,
> @@ -819,7 +822,7 @@ enum gds_mitigations {
>  };
>
>  static enum gds_mitigations gds_mitigation __ro_after_init =
> -       IS_ENABLED(CONFIG_MITIGATION_GDS) ? GDS_MITIGATION_FULL : GDS_MITIGATION_OFF;
> +       IS_ENABLED(CONFIG_MITIGATION_GDS) ? GDS_MITIGATION_AUTO : GDS_MITIGATION_OFF;
>
>  static const char * const gds_strings[] = {
>         [GDS_MITIGATION_OFF]            = "Vulnerable",
> @@ -860,6 +863,7 @@ void update_gds_msr(void)
>         case GDS_MITIGATION_FORCE:
>         case GDS_MITIGATION_UCODE_NEEDED:
>         case GDS_MITIGATION_HYPERVISOR:
> +       case GDS_MITIGATION_AUTO:
>                 return;
>         }
>
> @@ -883,13 +887,16 @@ static void __init gds_select_mitigation(void)
>
>         if (boot_cpu_has(X86_FEATURE_HYPERVISOR)) {
>                 gds_mitigation = GDS_MITIGATION_HYPERVISOR;
> -               goto out;
> +               return;
>         }
>
>         if (cpu_mitigations_off())
>                 gds_mitigation = GDS_MITIGATION_OFF;
>         /* Will verify below that mitigation _can_ be disabled */
>
> +       if (gds_mitigation == GDS_MITIGATION_AUTO)
> +               gds_mitigation = GDS_MITIGATION_FULL;
> +
>         /* No microcode */
>         if (!(x86_arch_cap_msr & ARCH_CAP_GDS_CTRL)) {
>                 if (gds_mitigation == GDS_MITIGATION_FORCE) {
> @@ -902,7 +909,7 @@ static void __init gds_select_mitigation(void)
>                 } else {
>                         gds_mitigation = GDS_MITIGATION_UCODE_NEEDED;
>                 }
> -               goto out;
> +               return;
>         }
>
>         /* Microcode has mitigation, use it */
> @@ -923,9 +930,16 @@ static void __init gds_select_mitigation(void)
>                  */
>                 gds_mitigation = GDS_MITIGATION_FULL_LOCKED;
>         }
> +}
> +
> +static void __init gds_apply_mitigation(void)
> +{
> +       if (!boot_cpu_has_bug(X86_BUG_GDS))
> +               return;
> +
> +       if (x86_arch_cap_msr & ARCH_CAP_GDS_CTRL)
> +               update_gds_msr();

IMO it's a shame to be looking at MSR bits in here instead of just
relying on the direct output of the select/update functions.

I think in this case we can just remove the conditional since if
!ARCH_CAP_GDS_CTRL then gds_mitigation must be FORCE or UCODE_NEEDED
in which case update_gds_msr() is a nop.

Now I make these comments I realise maybe my expectation about these
three functions is not actually the same as yours. Here's how I
envisaged your design:

- select: Look around at the hardware and the cmdline and decide what
we think we wanna do in fairly abstract terms. Record that result in
*_mitigation.

- update: Look around at the other mitigations and potentially change
our mind (or perhaps just update *_mitigation to reflect mitigation
that is being done regardless for other vulns, which also mitigate
this vuln).

- apply: Poke the hardware/cap flags/static keys/etc to actuate the
decision we made in the previous steps.

Let me know if that's aligned with your vision or not.
