Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D181C13774D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750435981; cv=none; b=kkyPmZFDZTqZ15qfV505K/XLEYyLYikngJDE8PQ70wnhG91MX9Y+D+ccFnbTawZaDnMC9ilQGige1OhxfKOtjLHGGJGqpProjDzyr7mXPm/mmd/lHLIY6zEaC1aLiNAIptnD46uUCKQKcyg2iM0oy1dA60Kh9+5NL0DXbsN0+lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750435981; c=relaxed/simple;
	bh=o/PDhYBLFV0Jd9O/4xdvr//PP/eZn5Jae6HmO5vzAHg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=QmTlmgNjXMwsQ46G9mibVqkdZAocwD/4VeMGm6hihLkVCp1lFxeTOb0Da76onBSebG6jmMSY/Ta/6uOrxlH41+yX71qnPoMQoUrc4HV2GdT4GasBKYC+kjHQjP1PW9o5QM5cZLCRxOtsXoN9gBl8rIS9fzAOCz1uzwiaQzuNscI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maine.edu; spf=pass smtp.mailfrom=maine.edu; dkim=pass (1024-bit key) header.d=maine.edu header.i=@maine.edu header.b=JzvajXlG; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maine.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maine.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=maine.edu header.i=@maine.edu header.b="JzvajXlG"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6facf4d8e9eso23493666d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 09:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=maine.edu; s=google; t=1750435977; x=1751040777; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=o/PDhYBLFV0Jd9O/4xdvr//PP/eZn5Jae6HmO5vzAHg=;
        b=JzvajXlG6VXYfNdyCmL/A0w+XVzLLhwy33OUayX7VMcY7gMZ2TLf2lhcRsPzsN3SXp
         79zqvEVycxJre50sQSA/HkaZfeodwP4KRsCkQTFSKBF2N7cAEiaxzDnsHhuteOqyv71M
         Lzh04P5Ozuou7IXIYGpjJsykugFUrBscit4iI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750435977; x=1751040777;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o/PDhYBLFV0Jd9O/4xdvr//PP/eZn5Jae6HmO5vzAHg=;
        b=kjKaLNMbIwqvQyYhIbTiDWPNe1hRAPTSSHr+hNPfcCDv2HEiouBgT9r2duVlvnFzlY
         uWIaduScI3eeuCT4sed7WKaX7TVnxA1BcNZodAp/RZuCWXojOX8iQVNmmvnu54QQ0/tt
         gOnjv+FncN6KkQmuSXg/cIl3xqL9e6z3FefmGDzrJVfIrOrg/prZavVA05KWIg2vsEhH
         6eUGenb0c69v/uNtzdFy0/j1gN5swI83m+ERbVC48UUcjHdr3IPBsCW9DW4irA12LjIm
         Oewce/RueMRiZcmYqmzmIpyLCx7I+xlA58A8f5JQcdbyWc+MRPSvuOmjQVmFUdIw3Rij
         jt4A==
X-Forwarded-Encrypted: i=1; AJvYcCXeOy/H81j9YSiduDgjVPKB0SxraM84a0WkBOa3CJBBTnvresX23gYSeT0nG0q+Idm5ahLwRcy96owHgPw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPiR7P9hmch1eepi5jRX46HFO4G3pvMUp6papoWdLramqy/sX6
	eb1ldzGGg8Z2vuXG88GE8FBbfmkgC6pA3jG2yyK1UULytotWXQDox+Qw5Gq/KuwRRg==
X-Gm-Gg: ASbGncuMYk5FIsv/JOWUehY8DXQX+TkD9tmLC9iBthhml5JROMToCJr4Edr2Eu18S/t
	YKO+UgVsIAXcE1irWjLGaf+lX/nzHswED2cjzM6GtpF9aM5ApVXEKJpmYVhEv6UY7DMkTGg5cfr
	l3Y3DnQSl1qH1i0dh9a7t1EebD3XvE/GH6MWOTc8ZHFKDLxY2EYztgpLS22vtY67mJzgVC9H8sJ
	elnHSW+ZSyYmYlwC1vdNTGMPXQky4050+swm8v6I8c2W7p0s0HNLD4b2FvNmSGtPuQrS2onauGf
	aGsyxmzWjja9uSydn5vfbLHESGNkIiyW+w+KszAN/KLry2e01mQkxIrfJOpdIhARJaA9yTh66sI
	RypMIrQ==
X-Google-Smtp-Source: AGHT+IGoovvsl19mY0vCtYhvu9E/Pp3ZVzXJ4Ykxp/GDEUA/7TwOQGC7TYT+H9Qq8AVH2lCTzNqJTQ==
X-Received: by 2002:a05:6214:2627:b0:6fa:c0ca:c75c with SMTP id 6a1803df08f44-6fd0a5fff0fmr62574406d6.42.1750435976837;
        Fri, 20 Jun 2025 09:12:56 -0700 (PDT)
Received: from [192.168.8.146] (weaver.eece.maine.edu. [130.111.218.23])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd093decfbsm13710906d6.11.2025.06.20.09.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 09:12:56 -0700 (PDT)
From: Vince Weaver <vincent.weaver@maine.edu>
X-Google-Original-From: Vince Weaver <vince@maine.edu>
Date: Fri, 20 Jun 2025 12:12:55 -0400 (EDT)
To: "Liang, Kan" <kan.liang@linux.intel.com>
cc: Vince Weaver <vincent.weaver@maine.edu>, linux-kernel@vger.kernel.org, 
    linux-perf-users@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
    Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
    Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
    Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
    Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
    Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [perf] unchecked MSR access error: WRMSR to 0x3f1
In-Reply-To: <ef72c8cd-5bed-44ce-b950-d64dc1c22baa@linux.intel.com>
Message-ID: <5a53490f-d4ec-85f7-4175-e148e02c3e67@maine.edu>
References: <14d3167e-4dad-f68e-822f-21cd86eab873@maine.edu> <574b8701-9676-4aba-a85b-724c979b2efa@linux.intel.com> <7e8bb736-3955-c479-99de-e08efb494bdd@maine.edu> <8739c2c6-a27c-4ab6-ad74-8b95e258737e@linux.intel.com> <c04824b5-5697-1de5-0003-f2c5b73ed006@maine.edu>
 <52656281-ab73-baf7-0a80-ebcbe79dfca2@maine.edu> <9aee2b65-e43a-4fcd-a929-a98269621315@linux.intel.com> <d12d4300-9926-5e58-6515-a53cb5c7bee0@maine.edu> <ef72c8cd-5bed-44ce-b950-d64dc1c22baa@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 20 Jun 2025, Liang, Kan wrote:

> Thanks very much for the reproducer! The issue has been root-caused.
> I've sent a patch to fix it. Please give it a try.
> https://lore.kernel.org/lkml/20250620110406.3782402-1-kan.liang@linux.intel.com/

I've applied the patch and can no longer generat the issue with my tests.

Thanks!

Vince

Tested-by: Vince Weaver <vincent.weaver@maine.edu>
