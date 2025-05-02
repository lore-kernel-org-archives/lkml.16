Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA13255F36
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 13:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746194151; cv=none; b=TCZuMm0LWKaIy0280XpyeuJ1gwdyFFDQNnqUk26Ue/yhQDqbp1C9Rb4O4lXcxcCWL1Eon0f/5q9KfibCTJSAPiI3frqaYQ+Dm3ltOv5Z/kMu80H0rIabqiTWHDo8FBzQ7HnXfsin+STYbvGWkKpBMGDDsosfEQtPz2xJRAKo3js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746194151; c=relaxed/simple;
	bh=xtsadScanyy21OGPXs5whLRy1Nubm3B/4Y8vR090BCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CZ/mwHRk6mQYmN1jGhHKq4fMVIQE+WGpqLFI3B3FMaWtTY9jEScyc00lSZcPPsw+MzolZZwiCtrMw0y4AmvIC5XVt4JniL3ae9r4KO4arI/TQ9adRv3eOLuHKynueLhvc54Plul/v/szboTGnFcbVl+o+ql3Js2bD6Ub+w6xJz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X/87KfNi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X/87KfNi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746194147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VHVoVhWndS//4Y/H+k0iT/I6qUt/tp6Ym9jq96jqMfY=;
	b=X/87KfNiMsY9BWaPu7badxZ1YeynqHgnNDQY9kW8udObPs0+DT1FIzzK6sgcDbE+Pe2PGe
	zD3O+jJuYz4gU5w7akgBsuBywo7m0XdUECQ5XloCJScbzOQXxd2HdVuIN3ZEpFM+DKgN3a
	sKdikfWzMTJo5DIB722B76TKAlkkC/4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609--8E5zoyrOdW31BnT5hw5kw-1; Fri, 02 May 2025 09:55:46 -0400
X-MC-Unique: -8E5zoyrOdW31BnT5hw5kw-1
X-Mimecast-MFC-AGG-ID: -8E5zoyrOdW31BnT5hw5kw_1746194146
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d733063cdso14810255e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 06:55:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746194145; x=1746798945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHVoVhWndS//4Y/H+k0iT/I6qUt/tp6Ym9jq96jqMfY=;
        b=sIFdTwY6EFFa2qO9XHhw5/F88SrVjkk33T4HRXceMTt4HfNLrZrL+qaCS2wYIUCVIP
         sv0uZvjP1/aqI9e7s8SL6phTX/QPf4QEOkco8Rc3yFubypuJ/e+pfwPl3xQV91bk34C/
         SJSBZN+9KjMhKtXe63zfe7bKlUyPI39FCz/OyWo21PdsL1zpmlMTB5d+ynlmR7/7Eghm
         GgQ38GzN1PAYhnGC0bq6wjV0QYUrLC7YB8F0o6ENfEdA6mxE5VJ4SRX7+pAS5q5yNtyn
         AGdb4IHqHBMxq0oxHDRo3etO251h0d7JgeF4kBGpraFJO0tS6yUIW8pK0XLWVa6Y4vPW
         GJdg==
X-Gm-Message-State: AOJu0Yy4JpQdKWqTHC0HZKh4VHSv0RSi7VgZEcfAxYuPlHuGugRCjAeF
	linTtSsAEloaPnrZmnZ2GjSTgDEHPnQ+/slu0An2gWqVVgFuZDYofRf7naFVsik+bGhsBHJ7ZUV
	yD+vS21LbiF3rYqKgQO5H5GqmA/b/3HFBQfKjvvGupXc5hL+tKob3L8wLvqqhnMVITcNprw==
X-Gm-Gg: ASbGncsLJHKjYti3pxRQ187yxfcacD0zytOzYwxPELYHlofASeT1JEcRiQYP0oVeYha
	AbBpoYfGSdW12FtStGJaPPPiS9lgh2Wei+pP+3u7X0UV0TEMZ7HRDEhPL31EyoIgi15wjDyPmpc
	RD6fV3mrjgxC1KsWHNI0KEmkQINqDG4w6mXAnWKq9p2iBZltINwR6b8fCGp4ZpAFSk8poxvU3jx
	UZx1ysDQnmL66IvLM3gf1iVKneeX3bqaC4H4rlIMg7K6Xo0/QH/m9p5FUzm5u5mU+YQnBz3Ul2d
	I6AkrDejQwWp7Wgr0tW/R8apF7/enoN9cFVzAND9ww==
X-Received: by 2002:a05:600c:4ed0:b0:43c:e7a7:aea0 with SMTP id 5b1f17b1804b1-441bbf355d8mr23082265e9.26.1746194144959;
        Fri, 02 May 2025 06:55:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhVuVLbwvidY3Ji4/aZFzKHjJyjnHUES4hkHRi3pK5IXnnkhWBX9fq17ROqAzaOQ8TnZWjtg==
X-Received: by 2002:a05:600c:4ed0:b0:43c:e7a7:aea0 with SMTP id 5b1f17b1804b1-441bbf355d8mr23082015e9.26.1746194144571;
        Fri, 02 May 2025 06:55:44 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([176.206.10.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2ad76a2sm91899515e9.6.2025.05.02.06.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 06:55:44 -0700 (PDT)
Date: Fri, 2 May 2025 15:55:42 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vineeth Pillai <vineeth@bitbyteword.org>,
	Luca Abeni <luca.abeni@santannapisa.it>
Subject: Re: SCHED_DEADLINE tasks missing their deadline with
 SCHED_FLAG_RECLAIM jobs in the mix (using GRUB)
Message-ID: <aBTO3r6Py_emwf1Y@jlelli-thinkpadt14gen4.remote.csb>
References: <ce8469c4fb2f3e2ada74add22cce4bfe61fd5bab.camel@codethink.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce8469c4fb2f3e2ada74add22cce4bfe61fd5bab.camel@codethink.co.uk>

Hi Marcel,

On 28/04/25 20:04, Marcel Ziswiler wrote:
> Hi
> 
> As part of our trustable work [1], we also run a lot of real time scheduler (SCHED_DEADLINE) tests on the
> mainline Linux kernel. Overall, the Linux scheduler proves quite capable of scheduling deadline tasks down to a
> granularity of 5ms on both of our test systems (amd64-based Intel NUCs and aarch64-based RADXA ROCK5Bs).
> However, recently, we noticed a lot of deadline misses if we introduce overrunning jobs with reclaim mode
> enabled (SCHED_FLAG_RECLAIM) using GRUB (Greedy Reclamation of Unused Bandwidth). E.g. from hundreds of
> millions of test runs over the course of a full week where we usually see absolutely zero deadline misses, we
> see 43 million deadline misses on NUC and 600 thousand on ROCK5B (which also has double the CPU cores). This is
> with otherwise exactly the same test configuration, which adds exactly the same two overrunning jobs to the job
> mix, but once without reclaim enabled and once with reclaim enabled.
> 
> We are wondering whether there are any known limitations to GRUB or what exactly could be the issue.
> 
> We are happy to provide more detailed debugging information but are looking for suggestions how/what exactly to
> look at.

Could you add details of the taskset you are working with? The number of
tasks, their reservation parameters (runtime, period, deadline) and how
much they are running (or trying to run) each time they wake up. Also
which one is using GRUB and which one maybe is not.

Adding Luca in Cc so he can also take a look.

Thanks,
Juri

