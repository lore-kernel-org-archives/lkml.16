Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D47278E7E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394855; cv=none; b=ivjD9vmaxE89ggBFW8mfe3wUfJnwOWKK4OUF/osvgAdzcwQ8aLUFPSEVMT2Bbd5j/kVUwRT5a9VvcPMDXHkS7F84CcSs3NtueMIN9NHzpUuPd9N1lN0Q39opNE6k1hLKu01JsrEsDZtOX8h6K0fBzIoWO4mDbIFxyHN+fu8pmo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394855; c=relaxed/simple;
	bh=ODkKc9w5DAH5YPIV3Ui/p7vc8dyQNmpHNTi579avV9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LIKLSPV4/akvLTC82okGb1ZVwjESFXCxbbPgcl5c8yRNtmd6v95pi2irflQrSQ+IUZu53JVSboiQIuz8JyMee7CScM6NjD4RMrHAlUl6+CJm0YtnxMrwnDa7iT98SnamP1/Kso2TD1VTHDVoZmr47JuejFIy9sUqDqAzEIGqj6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TPfbqkkM; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TPfbqkkM"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e5e63162a0so9338328a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745394850; x=1745999650; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2nqMLdKqIS7/vudO+K0aCSoNHv7ZBATh/BYxTws4kcI=;
        b=TPfbqkkMrU+1t6eJqxkvu4HR+PffOnCElxmte4YUtGD76Z4AnylDg4FSBSCEpt0XC/
         90mZvsFrqWywv7Ea1xxyggrHZb3okG5nGHuO5w6Gc64PzuMHv58Vq33eCSjUwvJyT/ZJ
         yY+ii1EkqVOtOIDOVZB6ypOh9pSwkC3VVN46ngJKoMYzbrNZcgxfsE+DmSPfiZCKPZkc
         S1BYAMFdZfnHaZU2Nf6jU4mRExuBeI8QLKqWOQqKQWUAS6kzt9vmtmU/B4X9Owps30n4
         ZtaDjI+bscMbRxqapAgLH4MufZGVuyWU9r4IrB/zPH106hWV/W0n0t359VimqyHEYoL0
         CZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745394850; x=1745999650;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2nqMLdKqIS7/vudO+K0aCSoNHv7ZBATh/BYxTws4kcI=;
        b=c70h5+th20N8838lAa3vW3Wh2oGZIBW634FtoBpPJa28ZfqEt11rlinfYxlTPUmRbK
         duA7rpkf34hUWgM6QXIni8aPePuBtVAOLG+NZIj/YjTIl4hQu7+7dENtoVrF7bzrl3BK
         PRqwLQ9TgU5RiExb5U69YdnkRzcEScHNrPpmeHU92OIlkwoBkj/jAI3naVFv1hLuKSKp
         upfCx9w8bKyvUl2vsxO+Z935Z0VoqH6/aFTmTBezWO2+Ti37Ky595WMQdO4S66+lJNnS
         BqWS47Pxv9iuANYlNvNdNFptDXOU/Os7U4Y1EZbsh1H0cXL3y99/tgOk/1OIJy+4GmQu
         OdFg==
X-Forwarded-Encrypted: i=1; AJvYcCWRFyJqoxlhHpf5HRVFjaXZc8kQyE3oHAmPGEOr+hh5Wo3tOCOVrhJp1WknFRTLxd6q71K2n62QOIyJtWM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxsrvHCpsXQltDsG57kxqUOlgIUz0LDfpGSOebwlqEM1RR3eEK
	hA6FEyYFmPke4qT1wjviS6qqWkyiTq6sfCjhB6th851VA1a8D0k0yWt27WAzJNbTtMHerX7uktK
	2
X-Gm-Gg: ASbGncuQzDCAf1xo61ii8nZ5KEK4CgKY590pwXc/4RCSbNvW4JaSHLP+byu2A8OGaZC
	45njLxGz23dqxB+CRGWF3dtxbC93+LbbFjaHKSDyDgQmF2u3jiedXNx8VYVaCp5QGrpvoNTX6ma
	YxO381TWpne1nPEz5QFfaNKxaWP4pOiMldm6GREXaI7rp/WFBsjLpBPkfpOhzwB+Y/qM593Ha6H
	hzh0Fu3pD9+2ufHTAAxtkc0j/sZQOyFKxDDkoi1RBbBbHxOych5ompMtm00xk75leo5WD7ZUc/V
	do+3+ASg5r6Jz7tuRp6pAUwUfEOsqK8=
X-Google-Smtp-Source: AGHT+IHmXmgSOu2wPnbZzY+Ub0Gp+ArzZ1ZZDgHAjJdTh9TPLQ4EXkWlzoSi+QNcSE0lhT8bkWL55w==
X-Received: by 2002:a17:907:2ce4:b0:ac2:dc00:b34d with SMTP id a640c23a62f3a-acb74e0ed59mr1576701566b.53.1745394849267;
        Wed, 23 Apr 2025 00:54:09 -0700 (PDT)
Received: from localhost ([193.86.92.181])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-acb6ef41605sm756431266b.124.2025.04.23.00.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 00:54:08 -0700 (PDT)
Date: Wed, 23 Apr 2025 09:54:08 +0200
From: Michal Hocko <mhocko@suse.com>
To: cve@kernel.org, linux-kernel@vger.kernel.org
Cc: linux-cve-announce@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: CVE-2024-56705: media: atomisp: Add check for rgby_data memory
 allocation failure
Message-ID: <aAicoAmxX0B_O3Ok@tiehlicka>
References: <2024122837-CVE-2024-56705-049b@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024122837-CVE-2024-56705-049b@gregkh>

Hi,
our internal tools which are working with vulns.git tree have noticed
that this CVE entry has been altered after the announcement.

There was an additional commit added to the CVE entry. The current state
is
$ cat cve/published/2024/CVE-2024-56705.sha1
ed61c59139509f76d3592683c90dc3fdc6e23cd6
51b8dc5163d2ff2bf04019f8bf7e3bd0e75bb654

There seem to be handful of other cases like this one AFAICS.

I have 3 questions:
1) What is 51b8dc5163d2 ("media: staging: atomisp: Remove driver")
   relation to the original CVE which seems to be about a missing memory
   allocation failure check?
2) What is the process when a CVE is altered? have I missed any email
   notification?
3) Until now CVE -> sha was a 1:1 mapping. Can we expect this to change
   and what exactly is the process here?

Thanks!

On Sat 28-12-24 10:45:57, Greg KH wrote:
> Description
> ===========
> 
> In the Linux kernel, the following vulnerability has been resolved:
> 
> media: atomisp: Add check for rgby_data memory allocation failure
> 
> In ia_css_3a_statistics_allocate(), there is no check on the allocation
> result of the rgby_data memory. If rgby_data is not successfully
> allocated, it may trigger the assert(host_stats->rgby_data) assertion in
> ia_css_s3a_hmem_decode(). Adding a check to fix this potential issue.
> 
> The Linux kernel CVE team has assigned CVE-2024-56705 to this issue.
> 
> 
> Affected and fixed versions
> ===========================
> 
> 	Issue introduced in 4.12 with commit a49d25364dfb9f8a64037488a39ab1f56c5fa419 and fixed in 5.10.231 with commit 0c24b82bc4d12c6a58ceacbf2598cd4df63abf9a
> 	Issue introduced in 4.12 with commit a49d25364dfb9f8a64037488a39ab1f56c5fa419 and fixed in 5.15.174 with commit 4676e50444046b498555b849e6080a5c78cdda9b
> 	Issue introduced in 4.12 with commit a49d25364dfb9f8a64037488a39ab1f56c5fa419 and fixed in 6.1.120 with commit 02a97d9d7ff605fa4a1f908d1bd3ad8573234b61
> 	Issue introduced in 4.12 with commit a49d25364dfb9f8a64037488a39ab1f56c5fa419 and fixed in 6.6.64 with commit 8066badaf7463194473fb4be19dbe50b11969aa0
> 	Issue introduced in 4.12 with commit a49d25364dfb9f8a64037488a39ab1f56c5fa419 and fixed in 6.11.11 with commit 74aa783682c4d78c69d87898e40c78df1fec204e
> 	Issue introduced in 4.12 with commit a49d25364dfb9f8a64037488a39ab1f56c5fa419 and fixed in 6.12.2 with commit 0c25ab93f2878cab07d37ca5afd302283201e5af
> 	Issue introduced in 4.12 with commit a49d25364dfb9f8a64037488a39ab1f56c5fa419 and fixed in 6.13-rc1 with commit ed61c59139509f76d3592683c90dc3fdc6e23cd6
> 
> Please see https://www.kernel.org for a full list of currently supported
> kernel versions by the kernel community.
> 
> Unaffected versions might change over time as fixes are backported to
> older supported kernel versions.  The official CVE entry at
> 	https://cve.org/CVERecord/?id=CVE-2024-56705
> will be updated if fixes are backported, please check that for the most
> up to date information about this issue.
> 
> 
> Affected files
> ==============
> 
> The file(s) affected by this issue are:
> 	drivers/staging/media/atomisp/pci/sh_css_params.c
> 
> 
> Mitigation
> ==========
> 
> The Linux kernel CVE team recommends that you update to the latest
> stable kernel version for this, and many other bugfixes.  Individual
> changes are never tested alone, but rather are part of a larger kernel
> release.  Cherry-picking individual commits is not recommended or
> supported by the Linux kernel community at all.  If however, updating to
> the latest release is impossible, the individual changes to resolve this
> issue can be found at these commits:
> 	https://git.kernel.org/stable/c/0c24b82bc4d12c6a58ceacbf2598cd4df63abf9a
> 	https://git.kernel.org/stable/c/4676e50444046b498555b849e6080a5c78cdda9b
> 	https://git.kernel.org/stable/c/02a97d9d7ff605fa4a1f908d1bd3ad8573234b61
> 	https://git.kernel.org/stable/c/8066badaf7463194473fb4be19dbe50b11969aa0
> 	https://git.kernel.org/stable/c/74aa783682c4d78c69d87898e40c78df1fec204e
> 	https://git.kernel.org/stable/c/0c25ab93f2878cab07d37ca5afd302283201e5af
> 	https://git.kernel.org/stable/c/ed61c59139509f76d3592683c90dc3fdc6e23cd6

-- 
Michal Hocko
SUSE Labs
