Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780C52EB1D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 10:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743589067; cv=none; b=Pl9X8kywyttoKJfIo4uulIF6H4fHxy5isrjY9k+0lHGqklNm0XBmX+PkHc+FjLTfevB7pm92RW88DmuFXTdOHtMgvCsr/DrlkeS3nVDbVjdlRBEXLAYMrcxKvb/ngh3udJJt1zZ3SAbkgTTp/gOOlrnRko/YGEueYbOVAdf1moE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743589067; c=relaxed/simple;
	bh=ZZSTNmBOfT4Nx0GONHsYAwg/gVKbfd4PkCBpKCshoGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TkyshN3rdkDetn3Kwr5o4QmgwWSfLf8cxOsozPpBgxjapFe671lfjCERuvKfMjG6az9nhmNyRnUE1m2mrDuYZymCXe7un/MuutJEcL9UwBwrjUX+5DUunA9PLeT6Vlx9JlRNVi5YqjE5tzLMnD9evSxVA7qrz2s4Ps8CRjrPSZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=eCeJ3/Nl; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="eCeJ3/Nl"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c266c1389so952099f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 03:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743589064; x=1744193864; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BoQN/cbdRb3bl+R0TruVM2i+azMwDjjz8Hy3l7cGhO4=;
        b=eCeJ3/NlYwLNOWRnlcbZ5Ty4EMF4maUJ18qYMuhbIs6FKm91QPW8REKT5vJGr7LnPp
         2wdCIFzSM1P5VSxPaAn4VcS085oz5bOKX3o2ElwO9soSbkfM9eyBnACgDU3uD6l2/Fb5
         NLGx2PCBL8zfm3sCUUNKX4JqJlYyk95mpWCXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743589064; x=1744193864;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BoQN/cbdRb3bl+R0TruVM2i+azMwDjjz8Hy3l7cGhO4=;
        b=SHhUG6kRn8yrcst4MK/Qh4poZUc0cGf1b24cNdtxQlFH2MmUqX/WKvI4Nr6qCl/oXa
         Ct8nAamBbC3nWeXruBr/GfBaEaA3OKneXggdoJT/EC+/vhSBijT2CDU+7mv2HcvPSrJ+
         JcKYX0Wl4PRfupRvKhcJXF1R0h6ZOZlhPMfazwZCu7HGTseGo8YorNdJA44T/ooa36Ew
         Bdi+0KkmP8FTvcsOMvcY+rdJdB3Zz4zJ7L3NCjYGtVCH15vX1n+tENoBE7nluXttgvnR
         P/cUNL4RUghm57jfcSNShuMnfcI6xs03OgBQNfVmZ1QB7kAqlLFn5hqRQw+x/RMbPWJe
         DNyw==
X-Forwarded-Encrypted: i=1; AJvYcCVoHkjjXFmkDBznhTv131Y3HgbdbHxOsULJ0FY3OOWdrU6Q8/xEYX1+NRsri+BWTKLIRRv+4Ve/+AcTDfE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1PLpWV9uMEHE4dRYtilgaBBDqY+wG1n6hddsgaHoPGT5UZY0l
	JIHOjZ/lc0JsH/5ezQDVp84ERgQwXHukcq1bFcBTpTpUErjZkcmP9L9ULeXRc7c=
X-Gm-Gg: ASbGncvb7UDxnXpRp65vDYNYtcHPqnEtPkMh9M0mWmVRBa+xqFyEXuBfejzHaHN3qbl
	DT0xrJrREOdtbeD1qF4eELYyGjDbOlMJv+ODZ1+G2oQgm8GLymbggdNbPMt05sdU9QgwzWPCNrj
	ENziu/JeuyeujOozdxG/bVY17/NtpmfNnfa8qvJdVRGAJURbSWHDm3zhXDmjvxzL6tlGD7dGckU
	bzEToXBvk/+OuWd/eRFobl8y676j71HN6aeu6UTyoh/2OLfWBhWFffzRx9UPGpGIc5t1qdBs18/
	tU+yIg5vn9aT3VOxtpjmCJqb79KfXDuHiDVwcWM/vNOCWGaa+UYHGc0xmm7+vG3/C/JhIJFVmw0
	6ONboNsYJKw==
X-Google-Smtp-Source: AGHT+IFKbv76Zb/vVr8KmUnWnp/XarFsP9YTgpQakXdkCwmU4iiDmtZ7r18nIo32KrZiYQpJ6mdzWA==
X-Received: by 2002:a5d:47c2:0:b0:38f:2856:7d96 with SMTP id ffacd0b85a97d-39c120ca2d1mr13273123f8f.1.1743589063733;
        Wed, 02 Apr 2025 03:17:43 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66cb3dsm16844958f8f.57.2025.04.02.03.17.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 03:17:43 -0700 (PDT)
Message-ID: <8f2a6d7a-cdd4-4742-9977-0bc1c1e872e6@citrix.com>
Date: Wed, 2 Apr 2025 11:17:42 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [tip: x86/mm] x86/idle: Remove mb() barriers for
 X86_BUG_CLFLUSH_MONITOR in mwait_idle_with_hints()
To: Ingo Molnar <mingo@kernel.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Rik van Riel <riel@surriel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Andy Lutomirski <luto@kernel.org>, Brian Gerst <brgerst@gmail.com>,
 Juergen Gross <jgross@suse.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, x86@kernel.org,
 linux-tip-commits@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250402091017.1249019-1-andrew.cooper3@citrix.com>
 <174358864842.14745.908324129810950623.tip-bot2@tip-bot2>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <174358864842.14745.908324129810950623.tip-bot2@tip-bot2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/04/2025 11:10 am, tip-bot2 for Andrew Cooper wrote:
> The following commit has been merged into the x86/mm branch of tip:
>
> Commit-ID:     90a22a5f841490790ecb17166633582681d44945
> Gitweb:        https://git.kernel.org/tip/90a22a5f841490790ecb17166633582681d44945
> Author:        Andrew Cooper <andrew.cooper3@citrix.com>
> AuthorDate:    Wed, 02 Apr 2025 10:10:17 +01:00
> Committer:     Ingo Molnar <mingo@kernel.org>
> CommitterDate: Wed, 02 Apr 2025 11:54:51 +02:00
>
> x86/idle: Remove mb() barriers for X86_BUG_CLFLUSH_MONITOR in mwait_idle_with_hints()
>
> The following commit, 12 years ago:
>
>   7e98b7192046 ("x86, idle: Use static_cpu_has() for CLFLUSH workaround, add barriers")
>
> added barriers around the CLFLUSH in mwait_idle_with_hints(), justified with:
>
>   ... and add memory barriers around it since the documentation is explicit
>   that CLFLUSH is only ordered with respect to MFENCE.
>
> The SDM currently states:
>
>   Executions of the CLFLUSH instruction are ordered with respect to each
>   other and with respect to writes, locked read-modify-write instructions,
>   and fence instructions.
>
>   https://web.archive.org/web/20090219054841/http://download.intel.com/design/xeon/specupdt/32033601.pdf

This link isn't the SDM.  Its ...

>
> With footnote 1 reading:
>
>   Earlier versions of this manual specified that executions of the CLFLUSH
>   instruction were ordered only by the MFENCE instruction.  All processors
>   implementing the CLFLUSH instruction also order it relative to the other
>   operations enumerated above.
>
> I.e. The SDM was incorrect at the time, and barriers should not have been
> inserted.  Double checking the original AAI65 errata (not available from
> intel.com any more) shows no mention of barriers either.

... this errata link, no longer hosted on intel.com.

~Andrew
