Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF852580FF
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739204045; cv=none; b=ACLErXHLP1ZXqMkBBpuW9WyX5N2AAH66MuuIfAm0uWvB7fYmhoALji/rCL8uyAj5luVMs34JuJrEsrYmT/1ACUCTKsTobtbV4TF+k+CIwXXhCkHgJx+LuPbf5qzD877h0dg005YgoCTyt2qoorphfsUbqE4s1/PeeCWlSbCRI1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739204045; c=relaxed/simple;
	bh=49RmCXH55qkwU1wAJaXz9tVqf7rrG/aVwKrGf0DaSUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r0oSmZpk+6ZovrYSCxKDQ0KDHMVYXVS2z3zwtDJ1cdB5z8RZj84cTYWldR4LQc70aIRdc8OsnPhI3/vYoVQrBxDgB7kSCkBgvL1LU6Vo2iQZI4xAOLCDKiicEqcQa8kb7tYCX1mzgKfEmS+rG6Q0lyAqQcX5RMIETemew8PYGGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lgvB++hr; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lgvB++hr"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4718aea0718so354131cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739204042; x=1739808842; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hd+CWgqEvLJz+poxAAgtGGSmSP3turYp/hYB/LD8oHk=;
        b=lgvB++hrkfS4s6/nb3NZcV2yQkwJJobN5atV4PX2NeeNoJnIE3jsq7mCj7rxSNQj1N
         w5pldZdL8FRGPT4BC3U++qR9ZAvjMbPn2VEc1sADr9v0tmUqN+pzRf/a3J39dzzTBmbI
         ebw3EU3m9XOBsA5alYmSEZumNBoataWqQGCRiWIWrfdibxNcSWlwUCMXJ/BeK9q3g8/C
         J/YCgpWvPKRYHBgynL5Gmcv1ErgAy5Lje3dFPAP1oqxBCKdJwuHuNODWHp0Jmzr7ofSZ
         rqeW6Zw1g1iDHX3wgVHCSvrZKqvQ6pnP8PvZOJN7EA8sL6EC7TVv4XNfpSb40idL54To
         nKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739204042; x=1739808842;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hd+CWgqEvLJz+poxAAgtGGSmSP3turYp/hYB/LD8oHk=;
        b=c1Uf2lKlFrghSvzEofDYvSG6P+IzWHppq1jcy99a5fyEFNw+p95nu8CLo+1dVDelNR
         cAAttTJQahua6bWjufBDWL2Qo8cohavdV7mb+TsWuE7Mr9NaxTyBFeliUGmfB8TBJ/uo
         8hEjzRh3ws+gcpQ9VBFlt12xZ+NlovjOgogeQ4b9Uwts15i/rf6L8lETe67I3xhFxWZ/
         69PboVngXXkkyex3H7oqSZXqV2F4qnSNIZyKnL+uAR8cstLaChnm1H44FLBx8FOvNLuF
         ipSVcwbv+EKU1JXJFeK0JaCkIfujRu0RRWV5uofKEbzneUnqMl+anDBNmyKfgbO7vo+F
         JrsQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1xOanIMRAYZ7brzfHCkXzVuPG4uMZaRoQSr4YzIip4xtGChSdyYkFNHpwWbIocbnBRcc9OrCv7pNIJEw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzK+aqIw88Pqan/OflonfUJ7DH5X1rPd2I5W3406aShSNHXGPZ+
	RGyl0hn/qRjfjRxMmZZBRqLuZf5bBLGYhTv5bOyNtFL9JCegNDmMrBsa3nKtmZA1T7Rw5dDsDyM
	Yt0CnQLU055rgUsa6uO1ndKd9SKcfXi/9YB0S8H+50jKg9RDOghij
X-Gm-Gg: ASbGncs4SgN78NvwhjCR70GhCBpDFC8UgWHhFAVf1oxVkvrOzuFMYrU9pcOqv5pUsfN
	kXTcX7ALE+yBkpWgOiEf9QYxHJTfBqncwyA0QNpGVUg8qX1kagz52/ZUalCRr2oPul10weLbEg6
	6dhdkzcVxTkHeFh5Ln9sDU3bWJErk=
X-Google-Smtp-Source: AGHT+IEIGE+4tFD6LbgwOZivNCVHRJeHGATVIpS8Hkl2/896Azm9dt6kB7xGtncVxRoYYuCcNnQf1L3PdOsu6H/pm40=
X-Received: by 2002:a05:622a:145:b0:46e:2769:a4b with SMTP id
 d75a77b69052e-471759fd03cmr6747851cf.12.1739204042316; Mon, 10 Feb 2025
 08:14:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250108202515.385902-1-david.kaplan@amd.com> <20250108202515.385902-5-david.kaplan@amd.com>
In-Reply-To: <20250108202515.385902-5-david.kaplan@amd.com>
From: Brendan Jackman <jackmanb@google.com>
Date: Mon, 10 Feb 2025 17:13:51 +0100
X-Gm-Features: AWEUYZlByUyfDLR293lZUyisZvzt7QQZHILT0-0QqFWqYfPerO6R5cgx8tyVlME
Message-ID: <CA+i-1C2B-xupi4cRT-AGMegYepUxhaJ89iG_J+Toa6z-Axp3uQ@mail.gmail.com>
Subject: Re: [PATCH v3 04/35] x86/bugs: Restructure mds mitigation
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jan 2025 at 21:27, David Kaplan <david.kaplan@amd.com> wrote:
> +/*
> + * Speculation Vulnerability Handling
> + *
> + * Each vulnerability is handled with the following functions:
> + *   <vuln>_select_mitigation() -- Selects a mitigation to use.  This should
> + *                                take into account all relevant command line
> + *                                options.
> + *   <vuln>_update_mitigation() -- This is called after all vulnerabilities have
> + *                                selected a mitigation, in case the selection
> + *                                may want to change based on other choices
> + *                                made.  This function is optional.
> + *   <vuln>_apply_mitigation() -- Enable the selected mitigation.

Maybe also worth calling out cpu_bugs_smt_update() here?

> +/* Return TRUE if any VERW-based mitigation is enabled. */
> +static bool __init verw_mitigation_enabled(void)
> +{
> +       return (mds_mitigation != MDS_MITIGATION_OFF ||
> +               (taa_mitigation != TAA_MITIGATION_OFF &&
> +                taa_mitigation != TAA_MITIGATION_TSX_DISABLED) ||
> +               mmio_mitigation != MMIO_MITIGATION_OFF ||
> +               rfds_mitigation != RFDS_MITIGATION_OFF);
> +}

Since you defined such nice terminology above, why not use it here and
say verw_mitigation_selected()?

(Obviously if the alternative was a respin for this trivial issue
alone I would prefer to merge with the current name!)

> +static void __init mds_update_mitigation(void)
> +{
> +       if (!boot_cpu_has_bug(X86_BUG_MDS) || cpu_mitigations_off())
> +               return;
> +
> +       /* If TAA, MMIO, or RFDS are being mitigated, MDS gets mitigated too. */
> +       if (verw_mitigation_enabled()) {
> +               if (boot_cpu_has(X86_FEATURE_MD_CLEAR))
> +                       mds_mitigation = MDS_MITIGATION_FULL;
> +               else
> +                       mds_mitigation = MDS_MITIGATION_VMWERV;
> +       }

This is changing what the user will see in sysfs. This seems good to
me, but it would be worth calling it out in the commit log I think.
