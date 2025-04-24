Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B46F510
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745488781; cv=none; b=auwugS5kyHzmyDMjdw4aOim3OgA4g5k3Zasfa/gZR5HJAzIGpyRhkCBGLT2W1yA2cakZgwUzJWKT+sKdLVceURcz1f5E05HviQjCqyxLYb27En942dqfoNDBPsW/moP5zBY5iZ7ZXReOYSxf76ta20Y43c5v7jo6zUeZae+9gHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745488781; c=relaxed/simple;
	bh=DsHDOHAiyweGE3xuJo6sPKz7K38kwOQr+Pj0SGAOu6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M8f4x6j4sh+qH3kZsD/E7RTlrKSMlgzO9EyyAh86W1nwd+Btk1WQjN30lKIQpMpAMkgYHPDag9qJko33qdmmy78VkEhuLUMmyHkBwoEXG9sYByPxPVZ328dv/gZn7mvYBj8LH58ftAcqvJ4Kt6TbfXOjLw0TlzSLC+7dvTx1ZvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NS5lSPsV; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NS5lSPsV"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5eb92df4fcbso1477292a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 02:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745488778; x=1746093578; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oFqdPI0c6cw77F7CtZwPzPYgrloBfIhlMVBW0aHPkRc=;
        b=NS5lSPsVennaxXxgZfWkyju1lohanR8ODKlwgq+sr3mRlCB3O0/EaFDwruodnIk0ie
         vI1Z5qZfpvy8XriyzlKaGlYff72O5HjjRBH8KuxbA1nJ40Hmtw+yQc8UNsjDV7d074xA
         DZ7n7DCuf2kLGI1aEY8/DQVl73F8WE0R0J8Wp5MKrkp9cOrOu57I6OMiMJvOHSECnAD4
         dH0Zn/JRfBCXZLA2HxVmAlehAriXvmgj8lNEom2jGKiHzJPHoshERW7Hx2tPVD2M+ai+
         HepQs430mM+nDHlmBemsQnyUp8I8a9YNVGDXKUfWnJZ24SAg6OFL7xsKF56zmxqEkJX7
         ucKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745488778; x=1746093578;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oFqdPI0c6cw77F7CtZwPzPYgrloBfIhlMVBW0aHPkRc=;
        b=DKFCZm7JXM1NMaVzpcZw66MY0s4LVSyuIMlznu26/1bhquR730p96b6/J0IQHVWW9w
         3kdfkS27IdAqkVRDHhMzhsxC5CPcW++Uv2htUCjxwCNOz7rXNbfAOHMy8647U/OcOqFe
         SUJxifnUDQlhBbkRj4nNlHkrm06O2JcRXsh0gtHACCcNi4MLtJB6WJkkwoYLZYaDjMC7
         0AyEEpzwKxPki/7bHh9bxy779uPEJblfF7878AS+K+h/N+O9Sajh9fIqOXgEsVJS9lop
         Go5gekyhNsDqvCtZQncAHAerfPhOgrLcEbggC+r3CMlmL7oWs9TNi4eWZxlRmsEDw6XK
         0aDg==
X-Forwarded-Encrypted: i=1; AJvYcCWSokVEdh+CWpVs0e1L+SOzexP2YEXDp2F49nCD+DQUiZw+ibbQirKeJLhOIzZmDOrGgrXo84ZPVolk47U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU3dKanFplrbdGEB/Jt2qw/lGlZdegA/uDUdZthpHw4O4rZtpv
	ss9R0qv+1irZHbsafwS+7RuyK9aJnHVhi4ie1IWVSf22C/LUtziFiExg/XnWpCw=
X-Gm-Gg: ASbGncvgP7Oulrppa4d/cqpdvHjRH/twzUAKgxrh4CB+IghC9dYtZDvQbSeYnScwGvu
	pH+cS6sc0ylFv7eVLHOw7ENMT1Lf3Jx2HpRpVIzJaxe/2cFw++uuzD2hZieYWsLexlK+7Z1IbMx
	aToi8FNjH+SpocyNXg6zmsIr6tpvro3rWjO6+ZnVftGT/pXakqshrQqfnGpp3jeWMa5GYQiPeER
	cmKKCYxP74looC/V2aODhBZ4bk1vb1zAj3mEBU77NHfyRX3OyBfL27I7KOIK61OTk2gjHHK1BAF
	M+byjynIbK+saKar3ZyuiUp+3t1pdd/t4HTeLBuv4wRGToETy1oPLw==
X-Google-Smtp-Source: AGHT+IFlfureBgxWcdI92vxd5ZQQxmkpTShw2FAfhABanJ/v1G26JEAvpTJM8UL5S48yrJUiOSoSrA==
X-Received: by 2002:a05:6402:90b:b0:5f6:4a5b:9305 with SMTP id 4fb4d7f45d1cf-5f6df53e64emr1890257a12.33.1745488777705;
        Thu, 24 Apr 2025 02:59:37 -0700 (PDT)
Received: from localhost (109-81-85-148.rct.o2.cz. [109.81.85.148])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5f6ebbfa7c2sm891711a12.43.2025.04.24.02.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:59:37 -0700 (PDT)
Date: Thu, 24 Apr 2025 11:59:35 +0200
From: Michal Hocko <mhocko@suse.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: cve@kernel.org, linux-kernel@vger.kernel.org,
	linux-cve-announce@vger.kernel.org
Subject: Re: CVE-2024-56705: media: atomisp: Add check for rgby_data memory
 allocation failure
Message-ID: <aAoLh_l-cEI4fDTa@tiehlicka>
References: <2024122837-CVE-2024-56705-049b@gregkh>
 <aAicoAmxX0B_O3Ok@tiehlicka>
 <2025042301-flammable-masculine-ec48@gregkh>
 <aAiwaM5ru-FJG2fI@tiehlicka>
 <2025042329-mystify-dramatic-dcb9@gregkh>
 <aAjOK_f-GPFHIdWK@tiehlicka>
 <2025042355-hypnotize-relight-789f@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025042355-hypnotize-relight-789f@gregkh>

On Wed 23-04-25 16:50:48, Greg KH wrote:
> On Wed, Apr 23, 2025 at 01:25:31PM +0200, Michal Hocko wrote:
> > On Wed 23-04-25 12:20:47, Greg KH wrote:
[...]
> > > 	In ia_css_3a_statistics_allocate(), there is no check on the allocation
> > > 	result of the rgby_data memory. If rgby_data is not successfully
> > > 	allocated, it may trigger the assert(host_stats->rgby_data) assertion in
> > > 	ia_css_s3a_hmem_decode(). Adding a check to fix this potential issue.
> > 
> > I do understand this statement.
> 
> That is the commit information, and as such we deemed it a
> vulnerability.
> 
> > 
> > > That has not changed here at all.  It's just that the ranges of git
> > > versions for when Linux was vulnerable to this issue has been "tightened
> > > up" to only reflect when it was possible for this to be a problem (i.e.
> > > we now do not count the range of releases where the driver was not
> > > present at all in the kernel tree.)
> > 
> > But I fail to follow this. The commit itself says Fixes: a49d25364dfb
> > ("staging/atomisp: Add support for the Intel IPU v2") which makes it
> > clear since when the issue has been introduced. If this tag was not
> > present then there is CVE-$FOO.vulnerable which can specify the same
> > thing. I do not understand how 51b8dc5163d2 is related as it has a
> > different implementation of ia_css_3a_statistics_allocate that doesn't
> > have any unchecked kernel allocations AFAICS.
> 
> Ah, ok, that changes things.  The person who said that we should count
> the previous version of the driver said it was vulnerable at that point
> when it was in the kernel tree.  If this isn't the case, we will be glad
> to change this CVE to reflect that.

OK, so I have dived into this deeper just to be sure 
	- fix ed61c5913950 merged v6.13-rc1
	- breaker: the commit says Fixes: a49d25364dfb merged v4.12-rc1 which
	  indeed adds  ia_css_3a_statistics_allocate and uses it in atomisp_alloc_3a_output_buf
	- now we have 51b8dc5163d2 ("media: staging: atomisp: Remove driver")
	  merged 4.18 mentioned in .sha1 file which drops the whole
	  driver. The driver was later reintroduced by ad85094b293e in v5.8-rc1
	- that being said the kernel has been vulnerable since 4.12
	  until 4.18 and 5.8 until 6.13. There is a gap when the code
	  was not there and the kernel was therefore not affected. 
All that being said I do understand the second entry now but considering
the first entry and its Fixes tag I believe the second entry is simply
redundant.

CVE-2024-53204, CVE-2024-53205 are the same situation.

CVE-2025-40364 is different. Both of the sha1 entries are stable
specific commits (same change) with a references to Fixes: c7fb19428d67d
merged in v5.19-rc1. This one has a follow up fix merged in fc9375e3f763
v5.19-rc3. 
So this CVE seems like stable specific (probably a misbackport?) or is this
a mistake?

> > > > > > 2) What is the process when a CVE is altered? have I missed any email
> > > > > >    notification?
> > > > > 
> > > > > We do not do email notifications when CVEs are altered.  You have to
> > > > > watch the cve.org json feed for that.  Otherwise the email list would
> > > > > just be too confusing.  Think about every new stable update that happens
> > > > > which causes 10+ different CVEs to be updated showing where they are now
> > > > > resolved.  That does not come across well in an email feed, but the json
> > > > > feed shows it exactly.
> > > > 
> > > > I do understand you do not want to send notifications for that. Would it
> > > > make sense to announce a new upstream commit added to the CVE, though? This
> > > > would make it much easier to see that we might be missing a fix that is
> > > > considered related to a particular CVE.
> > > 
> > > As this has only happened 2 times so far, it's a pretty rare occurance
> > > given us allocating over 6000 CVEs.  And how exactly would that email
> > > look like?
> > 
> > We have identified that CVE-$FOO fix has been incomplete so far and
> > extended list of fixes required for this CVE. Please make sure that
> > those are appplied.
> > 
> > Or something in those lines.
> 
> Again, that would happen every stable release, and every -rc release,
> could you really keep up with such an email flow in a way that wouldn't
> just mirror watching the json feed instead?

AFAICS there usually are no updates to CVE-$FOO.sha1 file and that is what
really matters to us to identify all the commits that are associated
with the specific CVE.

-- 
Michal Hocko
SUSE Labs
