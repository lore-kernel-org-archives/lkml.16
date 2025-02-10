Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0578C2580F2
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739205754; cv=none; b=APoA7YWMk1u7on5hX8spXSs47m9k+o1TbsusFUxraZjCjki6ZWsKrQ4cv4wCbZGEfC2ifCuSsYkLjl4G5/tX0USpQ9/BPRfZrbR2+yRjDvKg48fcTsR+FfVwyVNB64NZTlYWql9qA3j8ibFPcUounGReswry9DqxjRnL9dchyNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739205754; c=relaxed/simple;
	bh=3A/5txKePnE+bFHN9agZm3XzacyCS3QH3yc46hjCYok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X25hfEWnBdMjw4StLZNwEwaFXJ+j1DdlDdUMKFeBJziTKUfyxD0uI6/Li7QU/mKJPkkxnmIK2DR1VDBA+j4gJHKTQ7fneHkGj/czXdwZvXzeL1lwWbvov3lElWrm8a3B/tNY0rrv+ctAeHsWixtcGYCtJx7oRnqE5tv6hNI8jp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xVdVePtG; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xVdVePtG"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-47180c199ebso424421cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739205752; x=1739810552; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FoGOa6536dw9XfYHdmwfemz+oprZuceUA2r4sizKQH8=;
        b=xVdVePtGt1fM0NbQsmJVvRornrPFHJ/RgLjQLpUG4Ki1+BzxPb7mWBtSXj+enCU706
         dIiyf2whHYZ9neGo+3ZZIqDCEMbERZ2dE1LrA9xxcxOFmSVWVHzvGNUvpzUn33Hz+Fb5
         AOQ2s+A2wx6JXek3su2Nc5gPO/riNByGrmw49Wh3hJ85EVm4FvrsLDoqv3lGzFQrfuIu
         Cqizqg0TNQ0tOleGEbM6XdyGMdxbUPfTEyBO/hh84sYZMCHLGiel/L/iSA42HxKo/aul
         ICcnf4sLUV5go/qbG5q7YvUuQnu9ke6Hk05+o6bgeEmUf1OkVtZKIszQmWxpfv8px44N
         35Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739205752; x=1739810552;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FoGOa6536dw9XfYHdmwfemz+oprZuceUA2r4sizKQH8=;
        b=axx9TB6DQYBILEQfBpknVpq2yqPTPEOIpyo8SYaC7PaCaDBYlI4aqaqRwqnUkZV2di
         IW5WEFm4Hsr+jzKMZfgD92afZ9NS3VR7LCKy2JDG3QGmiWJ4WC3meZkY1DpSfB02aMBP
         oxA2kGRISZrSIUIwj0QIYJmb1J32R64EX4LhDEwUuoY9AmPREXTClpjDcmrOaHlvnlBK
         fREmOZv39DUn4jGODYWxHBS/oRqy9OEnHRLKuzPCpq4iwMyNaAgTf0Rmt5DKhQUK/Dd5
         xna55CCKyOiV+OATvvghKpkCZnkH4dpoI82ZPuOHAOnn2jOjmPtPihW11FqWJsOaN18y
         vh9w==
X-Forwarded-Encrypted: i=1; AJvYcCWtgufEztr0Q/W5nwKUK8EkZrUqxdRUmu2QQR9Usn/5Ajyg1z7NEZVShALkH+1eiEMGDUzjsMit+skhnXw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXorzMppGqjSBmGoRcRHW1p38MGQOF+ZuliRQq/8j3OWEj4CX5
	ji8Dt99zVPkBV2iusBT2Mpx7aFjH2wBTvZ35gHAaPbZgBpXd3mTDPq7RoMdqmOkBv2ze4Sr8Wf0
	Kvrm4L5qey76kfnuvHnB+oYWwAWzUDxaxwQoM
X-Gm-Gg: ASbGncuzzSnt533bF39JKiQxFhrknHHNX1mOaJ76v5NvtOhPJCAtwTe0XcrtrCZFIDu
	Y5wAgxjCO8Lh94hLcf6gmn5mijmBOBp/9SSTdtFxn78MNlnPlM+PGnMx9arMXmZ10oZKr86ryRt
	XAQlpixZa0i9n4RmqmtdXS3MRh+FY=
X-Google-Smtp-Source: AGHT+IE7XzWneNXcOWEkx19GaIDOPnTl5B+bd7ziah0NdNeDzpAF5ZY/Mxj5J0lrFzRnIZiMGfkuXMDvMTIjrQz7aiU=
X-Received: by 2002:a05:622a:3cf:b0:471:9ece:b13b with SMTP id
 d75a77b69052e-4719eceb702mr1190141cf.1.1739205751579; Mon, 10 Feb 2025
 08:42:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250108202515.385902-1-david.kaplan@amd.com> <20250108202515.385902-7-david.kaplan@amd.com>
In-Reply-To: <20250108202515.385902-7-david.kaplan@amd.com>
From: Brendan Jackman <jackmanb@google.com>
Date: Mon, 10 Feb 2025 17:42:20 +0100
X-Gm-Features: AWEUYZmdIY73x66jYawxLKqw7YOJg4mvggj-pKalIWuInJOptyOzDuD_ouqU3rs
Message-ID: <CA+i-1C2RnU0DOX0ryYMGZt8PXUD0BjBMpNDBHfX2HpDB0kBgCA@mail.gmail.com>
Subject: Re: [PATCH v3 06/35] x86/bugs: Restructure mmio mitigation
To: David Kaplan <david.kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jan 2025 at 21:27, David Kaplan <david.kaplan@amd.com> wrote:
> +static void __init mmio_apply_mitigation(void)
> +{
>         if (mmio_mitigation == MMIO_MITIGATION_OFF)
>                 return;

> /*
> * Enable CPU buffer clear mitigation for host and VMM, if also affected
> * by MDS or TAA. Otherwise, enable mitigation for VMM only.
> */
> if (boot_cpu_has_bug(X86_BUG_MDS) || (boot_cpu_has_bug(X86_BUG_TAA) &&
>       boot_cpu_has(X86_FEATURE_RTM)))
> setup_force_cpu_cap(X86_FEATURE_CLEAR_CPU_BUF);

This is still peeking at other mitigations in _apply_mitigation.
Shouldn't we shunt that logic into _update_mitigation?

I guess this would need a new enum value but that doesn't seem too
bad. Worth it to have all the inter-mitigation dependencies localised
into *_udpate_mitigation IMO.
