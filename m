Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADB425CC73
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 22:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747779977; cv=none; b=bHOXFgZgtQM6MktL7JdPFMjA3lIQbaeXZmzaB89siGSfrf/73PmJc3OpZPMqH1MtgRezxqIqqXattiISeqqFRRTD4Jg3yH7dqxv3fIk4bBuzi66EUVXuUaH0Jm64CPEHI/Ck6pSmP/SKFMLNeGTFHSjppeD3qxmyEb0fCO1bkeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747779977; c=relaxed/simple;
	bh=7zIW62S8FT0W61WJ4qnpKEs5q/3hT8q1Eo/7ZVtyKtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=obgSOv/KOVQnkbdmQf0M7K6OW43N6QGYvYMoLIgLjfev12QrV+HxO2SsjSw9KUSYD9OKzpenDfjSc72q3taGzZp3i+qQIhX6qNfAJlhLi5JiiWwD2nRiiJ3mOBi/KNwBiF8YaXOKNDfeOrTF8rXmkmq1NbojvBJA3L4NDq9VMBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=aK4Wx6kT; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="aK4Wx6kT"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-476ac73c76fso88683221cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 15:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1747779974; x=1748384774; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qTt4YG/1vRUxTQuaxShMs9T/QiIlq/ei1whZCWMU2pI=;
        b=aK4Wx6kTXvy8ycxeBZkYcgOfFVWcwCDOmwDU5rRLjzcDdhVd9TOz5ChRSqrqVnNRDC
         KhpyVYyFZOvDVWgUkwlWHsRf/tu70VoCpqIUUO9CY6cV/bzTuTXQdDnXPCdzv7guOF2Z
         rJiljyXdBLv2bj4CaOFPJRjfOKS027zjgvXTeYcyBQgaa4VDtv5pf5DG7Bp1wu2yXduy
         jmzEPwZ2xSpn9cJOVkYCqZP/nmmIz+Zd3k7oSzwXdB7r+J7GdZ1c+4oCDPS8xtasF45C
         EBGcPeXwKFaElrzetsCin/Vm+19OdoFDMbI1ScF4KrqPTaP6JB4stU1oJj0GTTrvoMjD
         Ftjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747779974; x=1748384774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTt4YG/1vRUxTQuaxShMs9T/QiIlq/ei1whZCWMU2pI=;
        b=EZTh0kH+6DroZ1HWZQQEobizkvSQwCL38/CO8VkbPqizkN2I7FgNLf8n77U7OaVbzb
         OWbeSZ+hVkKVG5txY1A8WG74KYIZXCMJjFmB/8XA/QdAoOwdbHVpNpe2vUf/6zMf7ee5
         fVRsmfTXCrdcxW+OqM3xuRWujKk8v2v/LmIahe4tOr2ehpF+j5I2LVPajkCnV7gRy4pH
         XISCfJVk4hP6W4+6fNdZBSGtw8xejfPCdgnVLflTQrRKrWFNIignN1Lye9isbeWBHMlm
         yUVhCmAl8hQ7H1pG5I9Kvsrs+AbHMpieKWEBQqJW75QOLDoTCZre7YexAn/R//8wJgqL
         ht+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVUT7KYyzTZKpzSC/tHceWT0ZtBs7/Qyq57nAETVVHg32RsXBwOyVZ3FXvMAXtAyy56QnhBes7+FWOrXWM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9WEGNE3dkyfBFIccPl8ExmMG8cHFnBDzT5UeTnapkzU1EoMJv
	NR5kNIyad9raFad1X0fYlLcxwlBfP5HXuqjQXsM1yjIS0Fj/Ohl/+M7ARe51lJ/izUE=
X-Gm-Gg: ASbGncvxVCH2mLtkkr32LRvQ33CyNBdVadHsB8k4YB5YSjQUOiRwtgW0o1AolTmfsUM
	8KD4LYz6MuegK4cb2Dz0UYFZ25N8Axodn6qR8dQ3nTr5tPaSVfldLQPq0DK9RNYR/lPQOkJ0fg2
	DqlwcD+hDuckLSt91hEitCIYXzPfNHpFx0BsxmWO2PW9+jg1sNOEK86CoQ1lbrMoUwoDYYnqBcj
	uAEAcSURzNY3N8IsKs7LpH/SjvhRup+1iobyejhaOxdRkHv65OML0dVQcUMYd8VvyTy5qC9tlKZ
	1YbCJa1NQWk/cywAFIAjoJPO6Ejqop/04L/V/TNTaXoW9kUKkdQMGMCjXZtM
X-Google-Smtp-Source: AGHT+IHMBmeI7kQYoN9s4JX0ZSBxX+F3xv2rOANEi+wTad8PvFB/MkLVXNhM3peN4djRz8GJun6CxA==
X-Received: by 2002:ac8:5cca:0:b0:476:a03b:96ec with SMTP id d75a77b69052e-494ae47d89emr378227251cf.32.1747779973665;
        Tue, 20 May 2025 15:26:13 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:365a:60ff:fe62:ff29])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-494ae3f89a9sm76683591cf.20.2025.05.20.15.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 15:26:12 -0700 (PDT)
Date: Tue, 20 May 2025 18:26:09 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	SeongJae Park <sj@kernel.org>, Usama Arif <usamaarif642@gmail.com>
Subject: Re: [RFC PATCH 4/5] mm/madvise: add PMADV_SET_FORK_EXEC_DEFAULT
 process_madvise() flag
Message-ID: <20250520222609.GD773385@cmpxchg.org>
References: <cover.1747686021.git.lorenzo.stoakes@oracle.com>
 <617413860ff194dfb1afedb175b2d84a457e449d.1747686021.git.lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <617413860ff194dfb1afedb175b2d84a457e449d.1747686021.git.lorenzo.stoakes@oracle.com>

On Mon, May 19, 2025 at 09:52:41PM +0100, Lorenzo Stoakes wrote:
> We intentionally limit this only to flags that we know should function
> correctly without issue, and to be conservative about this, so we initially
> limit ourselves only to MADV_HUGEPAGE, MADV_NOHUGEPAGE, that is - setting
> the VM_HUGEPAGE, VM_NOHUGEPAGE VMA flags.

Hm, but do we actually expect more to show up? Looking at the current
list of advisories, we have the conventional ones:

       MADV_NORMAL
              No special treatment.  This is the default.

       MADV_RANDOM
              Expect page references in random order.  (Hence, read ahead may be less useful than normally.)

       MADV_SEQUENTIAL
              Expect page references in sequential order.  (Hence, pages in the given range can be aggressively read ahead, and may be freed soon after they are accessed.)

       MADV_WILLNEED
              Expect access in the near future.  (Hence, it might be a good idea to read some pages ahead.)

       MADV_DONTNEED
              Do not expect access in the near future.  (For the time being, the application is finished with the given range, so the kernel can free resources associated with it.)

where only RANDOM and SEQUENTIAL are actual policies. But since those
apply to file mappings only, they don't seem to make much sense for a
process-wide setting.

For Linux-specific advisories we have

	MADV_REMOVE		- action
	MADV_DONTFORK		- policy, but not sure how this could work as a process-wide thing
	MADV_HWPOISON		- action
	MADV_MERGEABLE		- policy, but we have a prctl() for process-wide settings
	MADV_SOFTOFFLINE	- action
	MADV_HUGEPAGE		- policy, but we have a prctl() for process-wide disabling
	MADV_COLLAPSE		- action
	MADV_DONTDUMP		- policy, but there is /proc/<pid>/coredump_filter for process-wide settings
	MADV_FREE		- action
	MADV_WIPEONFORK		- policy, but similar to DONTFORK, not sure how this would work process-wide
	MADV_COLD		- action
	MADV_PAGEOUT		- action
	MADV_POPULATE_READ	- action
	MADV_POPULATE_WRITE	- action
	MADV_GUARD_INSTALL	- action

So the vast majority of advisories are either one-off actions, or they
are policies that naturally only make sense for very specific ranges.

KSM and THP really seem like the notable exception[1], rather than a
rule. And we already *have* prctl() ops to modify per-process policies
for these. So I'm reluctant to agree we should drill open and expand
madvise() to cover them - especially with the goal or the expectation
that THP per-process policies shouldn't matter that much down the line.

I will admit, I don't hate prctl() as much as you do. It *is* a fairly
broad interface - setting per-process policies. So it's bound to pick
odds and ends of various subsystems that don't quite fit elsewhere.

Is it the right choice everywhere? Of course not. And can its
broadness be abused to avoid real interface design? Absolutely.

I don't think that makes it inherently bad, though. As long as we make
an honest effort to find the best home for new knobs.

But IMO, in this case it is. The inheritance-along-the-process-tree
behavior that we want here is an established pattern in prctl().

And *because* that propagation is a security-sensitive pattern
(although I don't think the THP policy specifically *is* a security
issue), to me it makes more sense to keep this behavior confined to
prctl() at least, and not add it to madvise too.

[1] Maybe we should have added sys_andrea() to cover those, as well as
    the SECCOMP prctl()s ;)
