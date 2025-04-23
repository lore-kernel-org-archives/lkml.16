Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA8F26FA59
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745407537; cv=none; b=U640BL0lBDb/TQlQYIYdVvKnev6dtun4BVzKo/rLZ+8M70Izv8M2rNWbIcSlpCHYBL/sKWxJZZKAN+h3fnbdKk+q8VbZ0WvBEieAciPzY8wwMh27oOzdb6JU/yyVX9oNxosMLpZRCt29zmFgWryvET51ipq2UndiUuIg3MPHJV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745407537; c=relaxed/simple;
	bh=HD70lglHo/TfDa3Vk0n7O97xvVgFb9j6CD+Dg2TjOQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o8X2vcfBUExj7783wXZZI4Juu7klq2zyO0xVjkvooVF5ss22Fsg3xloKO8iTD6idwa//vtb1VSLclZrJUiGKxngaG2U7DEFQ4NuUdo7MZTq9MhV/CNpSGXZwjO2L3iVD5gjf1y7/NgKbU/1+XSaT8FR5RV+DFU+M233lacYoaNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IVjC9sTr; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IVjC9sTr"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so890770666b.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 04:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745407533; x=1746012333; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aWGxSkVSh8s0WJx6DmPaKustScqNiBh/RPsp1KBtxsk=;
        b=IVjC9sTrSDtXGuZism3utTK875aho9TCOE1tEshyg7IZburk9GnHmcgJHufBbuP2hh
         fTsRfo+k9mVVhiOZywYXVncl+AmLnxgn4VHdMfmb6IvniprAsB1H9VVX3KwG20ftUcfC
         DBDChI088eIaFj3DqMNF/aTl+JMII5KxZ+6wlsU3UcoqjcGN8vqeAmcxYSYe3vOX43aW
         eARpOQbxKpYDGpbeTmkI45oLx1fiJF9iZ/Pv4wDoMDpcKwk2tUFZJpikMZh3CEthWkw4
         OnfEkxJChTtmncnatRoYmucyzSYOXC0GC/1GH6941mratsn6N6NSpMsUEFXIUYjLATCH
         Ntxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745407533; x=1746012333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWGxSkVSh8s0WJx6DmPaKustScqNiBh/RPsp1KBtxsk=;
        b=VIo1mAAP6hPf4R0x3IYJbZXiMWl94lv7Ygvhvq0Br/uSqYHguz2n4bvGtBU6brVqHq
         6REzoBTJIwGkD1wnzo8oA0Pq3tfbGeATKW8pf4TU5XJvhr/uIx3PnCeyaIsaBycGT3YI
         d2fetyjh3clwK6OZn25RO2G7OZUrEd+LmZ3ZiGg8whmLyVS6hRdeAaLxxEkzFAau5wOr
         GnaePasjaeb67OE6e/UyUZ3nJvELxIscE0m7jg0OEHMhaP66waHzXnetUPwaruN+xDKL
         bdWiOeI5Saklz1nE4xGGNQbxR9TbPh1iYtrJ494sfYF55RJkWug+GQg83b3qe8Ro9L6N
         y/VQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNNnuiMYZklID3o89njF2v8hL0+Q4a/wgtUlVVry/U6Y8Q9WV1glirGSY91O+xXngOt0+7qtTWdl3cX5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvLgmLLGQXxaqdORoWa8boqV6x1W87xDqFpyW10PqraWAkosW/
	wnGrE88qQ3RGET38daHQNU3VOu2EbPtOnWs0qaP+tBlbKzy2RS06HsctBLkz3lk=
X-Gm-Gg: ASbGncsMmriQk27MKZMLzTwjD464cECQuPro0IEYFUK+3Gksudv6nS4XEvsnShi7NaY
	5KihKkSEbNOLLZ6jBfyytDob45/LOCZ9ZExwOXr3nuOZbWk139k57btERUW7Cy7Bque+Hd94YML
	HF9Vy9e4YybzkG1/yW6ottniMdRsdlL0T/4IAsGO5xT173lFefr6IKxQydZtK7gR2ibHDiqczRQ
	yFTSVQEsIihP5pZi7nOw0m740mlXH09w+ceq4Uh9gnRLmxAqUeaZ8L4GoabVZZFhwQmlNAZ7YRB
	fl3w1y9lGO20peMcIIa9x4b8RQDsyhA=
X-Google-Smtp-Source: AGHT+IEYYEoiPeht3k6gfpywnrmcwc6m//t5flrh63sC9Rj8rnJcbGCa2vDM8kPATKJFgLfL5emxYA==
X-Received: by 2002:a17:906:5496:b0:aca:d6f0:af0c with SMTP id a640c23a62f3a-acb74dde4c4mr1369691166b.59.1745407532929;
        Wed, 23 Apr 2025 04:25:32 -0700 (PDT)
Received: from localhost ([193.86.92.181])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-acb6ec0c64csm803973066b.13.2025.04.23.04.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 04:25:32 -0700 (PDT)
Date: Wed, 23 Apr 2025 13:25:31 +0200
From: Michal Hocko <mhocko@suse.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: cve@kernel.org, linux-kernel@vger.kernel.org,
	linux-cve-announce@vger.kernel.org
Subject: Re: CVE-2024-56705: media: atomisp: Add check for rgby_data memory
 allocation failure
Message-ID: <aAjOK_f-GPFHIdWK@tiehlicka>
References: <2024122837-CVE-2024-56705-049b@gregkh>
 <aAicoAmxX0B_O3Ok@tiehlicka>
 <2025042301-flammable-masculine-ec48@gregkh>
 <aAiwaM5ru-FJG2fI@tiehlicka>
 <2025042329-mystify-dramatic-dcb9@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025042329-mystify-dramatic-dcb9@gregkh>

On Wed 23-04-25 12:20:47, Greg KH wrote:
> On Wed, Apr 23, 2025 at 11:18:32AM +0200, Michal Hocko wrote:
> > On Wed 23-04-25 10:21:04, Greg KH wrote:
> > > On Wed, Apr 23, 2025 at 09:54:08AM +0200, Michal Hocko wrote:
> > > > Hi,
> > > > our internal tools which are working with vulns.git tree have noticed
> > > > that this CVE entry has been altered after the announcement.
> > > 
> > > Good catch!
> > > 
> > > > There was an additional commit added to the CVE entry. The current state
> > > > is
> > > > $ cat cve/published/2024/CVE-2024-56705.sha1
> > > > ed61c59139509f76d3592683c90dc3fdc6e23cd6
> > > > 51b8dc5163d2ff2bf04019f8bf7e3bd0e75bb654
> > > 
> > > Yup!
> > > 
> > > > There seem to be handful of other cases like this one AFAICS.
> > > 
> > > Yes, we had to add support for this type of problem.
> > > 
> > > > I have 3 questions:
> > > > 1) What is 51b8dc5163d2 ("media: staging: atomisp: Remove driver")
> > > >    relation to the original CVE which seems to be about a missing memory
> > > >    allocation failure check?
> > > 
> > > Removing the driver entirely from the kernel "fixed" the vulnerability :)
> > 
> > What is _the_ vulnerability? While I do understand that _any_ potential
> > vulnerability in the removed code is removed as well I still do not see
> > how the driver removal is related to _this_ specific CVE.
> 
> "The" vulnerability is what is fixed in the last commit id, and is what
> is documented in the text of the CVE, specifically:
> 
> 	In ia_css_3a_statistics_allocate(), there is no check on the allocation
> 	result of the rgby_data memory. If rgby_data is not successfully
> 	allocated, it may trigger the assert(host_stats->rgby_data) assertion in
> 	ia_css_s3a_hmem_decode(). Adding a check to fix this potential issue.

I do understand this statement.

> That has not changed here at all.  It's just that the ranges of git
> versions for when Linux was vulnerable to this issue has been "tightened
> up" to only reflect when it was possible for this to be a problem (i.e.
> we now do not count the range of releases where the driver was not
> present at all in the kernel tree.)

But I fail to follow this. The commit itself says Fixes: a49d25364dfb
("staging/atomisp: Add support for the Intel IPU v2") which makes it
clear since when the issue has been introduced. If this tag was not
present then there is CVE-$FOO.vulnerable which can specify the same
thing. I do not understand how 51b8dc5163d2 is related as it has a
different implementation of ia_css_3a_statistics_allocate that doesn't
have any unchecked kernel allocations AFAICS.
 
> > > > 2) What is the process when a CVE is altered? have I missed any email
> > > >    notification?
> > > 
> > > We do not do email notifications when CVEs are altered.  You have to
> > > watch the cve.org json feed for that.  Otherwise the email list would
> > > just be too confusing.  Think about every new stable update that happens
> > > which causes 10+ different CVEs to be updated showing where they are now
> > > resolved.  That does not come across well in an email feed, but the json
> > > feed shows it exactly.
> > 
> > I do understand you do not want to send notifications for that. Would it
> > make sense to announce a new upstream commit added to the CVE, though? This
> > would make it much easier to see that we might be missing a fix that is
> > considered related to a particular CVE.
> 
> As this has only happened 2 times so far, it's a pretty rare occurance
> given us allocating over 6000 CVEs.  And how exactly would that email
> look like?

We have identified that CVE-$FOO fix has been incomplete so far and
extended list of fixes required for this CVE. Please make sure that
those are appplied.

Or something in those lines.

> We are just changing the ranges here, we change ranges of where a kernel
> is vulnerable all the time by adding new .vulnerable files to the tree
> as people report them, and as fixes are backported to older stable
> kernel trees.  That's much more important to you than this type of
> change, right?

Nope, being aware of what is actually the CVE fix is the most important
information. Which kernels are affected specifcally is something that is
downstream specific and stable tree ranges are only of a value to those
who are using stable trees. Updates to vulnerable files is helpful
during evaluation phase but once the assessment is done it acts mostly
as a double check.
-- 
Michal Hocko
SUSE Labs
