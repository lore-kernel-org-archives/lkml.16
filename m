Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9075C1F5430
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 09:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745399917; cv=none; b=SCVo+QmbBDgRfEZvrkqvPGB3FuqTEIDd/80PShBcghlKR3p+vCJYnLQwZa9j9bIqlZgmiAYirSayQaOf6IU0gNhgY/qcdjymZBByR3cWjG8pxfVrqFdqNgp6m0CIBL2xELnpibds9oyONsvf/M1IK5fPAB+OPHJxbF3qQdEIwEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745399917; c=relaxed/simple;
	bh=DRFMe/xNRip1ceseE0adligGMIaBthdL8cS9UD9UAYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MsOzfEvfzMAE2SSdVXpXIRpMpdfPI+m4cn267Ssz8x+VuwRJklssTv8+3zakJMLvYRnDZFgzZMQtOw3gkplLFIkUKZCmNTu6wxWPdqLerFx4EKKYJlYPo+qDvuYrlU48Sg3h01GQpITz8LGlpEpf/wHvebFdamSSxGl/1Uk9mGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CUzr8xF+; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CUzr8xF+"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso1018766666b.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 02:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745399914; x=1746004714; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XS2IDLEZ+lWpFqfAYnZRqQbB8bAjfCDSuoTKAWSWV+E=;
        b=CUzr8xF+e5Ce3l5RkYAj7tv7zXclIBmyvcVeDDROnOzJAIOonP1XHgD+gcqK1D6EUB
         8jqHtt+G3ST7yeAvLEACxWB8w1njbfcvYFZQJSzXMPYAS5zq7tFMgbLKLgu5uoFJRqjv
         D5uXknZvqOQIla3hQL7gUguPkpgpVsVI8bZTuuv0XMN8hkSd8544Uoxo0a0tzpWE4oe6
         xpVGOo1On6zpJio1oy9+vnJ4WaXF9rkY+JQHZP23wMs9jHS3bmFI7jUZebpcMgsMFinE
         zYjP1TN55kEv8p8zaXw3dXZB+aY/hyOfG2bMf7frqqXS2LlMae9JnjogAuLixETcSozz
         qKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745399914; x=1746004714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XS2IDLEZ+lWpFqfAYnZRqQbB8bAjfCDSuoTKAWSWV+E=;
        b=FTa91kUHCzQY1b1c/94gyQMTTiphcnAikltClpQTY/OZ/ZXS/b1bKnh6Pf9YukAMtp
         /6nqeanj0kpDdoouG7a2ea+eLz2Om788u1FFLcTyFmF+cJ9X8+Pb6IhNVBHamuIBdHnT
         KM+I90exHrvqmn/2n7r51dvJMpJXt3iZe95RFyDnblhfEepBFmzWKaxfQnn76UAwKoTr
         kElQRFCBn1ud0X673Z6Jp0NxAya9D+vaKxNbIpXYL1O+R8o4fcMkVKfXKuVky1WnOGoL
         tEEvhjX7l9PQqZiSovaYzJi/jo/0vyWXG1dH76J679Vb8pUDI13AAonffvoCIOggO9c6
         f3qA==
X-Forwarded-Encrypted: i=1; AJvYcCVak2t4w0d4QP2cjNHyAdMoxVKk5LdMlsx5aCTJsov5OFj13/44B/+4KqJQLbRuLD8/c/XN3jesTcevt3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJdqmbGyGhilmzWYB6uC7iD+Yv6+dKS/KigWO66d/XeqeLbZfI
	BUVJgHuu1Aw5/Bykb9JQuQuQPaP5kscbKP4Li7q05rELOJ+MWuf2QHCnf5yLICw=
X-Gm-Gg: ASbGncsTiKwHH6Sy3acBl8rjfnv/ZbpY/xc4wmPDNRpgA7CbFVuJtgA2NlapvC+UXrq
	72jVpAi7AUikRSbW5gn9ZkCgUHoScWADudlsPP3M4Th3A+iHMDNs7bTSwI2HButAvcATvy0hogD
	greKryKhHX/fSd5zG57+EHwQf0fCtpBa0zvoK4i+yylDruKMfHgPsRIllpLQHMId+zUYSDG+4Jv
	5AOvaGB+inGDFe6+Sx1ObyeK8GSEkVNJsHCdKvFi72rx4URopcy7HPdWf9irgPkNnOceCh92qyc
	kFK6jbsu3OC8Vmgmb6lpB+sQJtDFvhE=
X-Google-Smtp-Source: AGHT+IGr7nxzRbH8bVQKYbkHXnAPI/7cdvmBWzI1Uo+ifStRK9qdqSMXAtz/Rs/o7ksm0lZdHmgH1w==
X-Received: by 2002:a17:906:c113:b0:ac4:2ae:c970 with SMTP id a640c23a62f3a-acb74b38723mr1817920466b.21.1745399913724;
        Wed, 23 Apr 2025 02:18:33 -0700 (PDT)
Received: from localhost ([193.86.92.181])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-acb6eefcf2csm767194266b.116.2025.04.23.02.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 02:18:33 -0700 (PDT)
Date: Wed, 23 Apr 2025 11:18:32 +0200
From: Michal Hocko <mhocko@suse.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: cve@kernel.org, linux-kernel@vger.kernel.org,
	linux-cve-announce@vger.kernel.org
Subject: Re: CVE-2024-56705: media: atomisp: Add check for rgby_data memory
 allocation failure
Message-ID: <aAiwaM5ru-FJG2fI@tiehlicka>
References: <2024122837-CVE-2024-56705-049b@gregkh>
 <aAicoAmxX0B_O3Ok@tiehlicka>
 <2025042301-flammable-masculine-ec48@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025042301-flammable-masculine-ec48@gregkh>

On Wed 23-04-25 10:21:04, Greg KH wrote:
> On Wed, Apr 23, 2025 at 09:54:08AM +0200, Michal Hocko wrote:
> > Hi,
> > our internal tools which are working with vulns.git tree have noticed
> > that this CVE entry has been altered after the announcement.
> 
> Good catch!
> 
> > There was an additional commit added to the CVE entry. The current state
> > is
> > $ cat cve/published/2024/CVE-2024-56705.sha1
> > ed61c59139509f76d3592683c90dc3fdc6e23cd6
> > 51b8dc5163d2ff2bf04019f8bf7e3bd0e75bb654
> 
> Yup!
> 
> > There seem to be handful of other cases like this one AFAICS.
> 
> Yes, we had to add support for this type of problem.
> 
> > I have 3 questions:
> > 1) What is 51b8dc5163d2 ("media: staging: atomisp: Remove driver")
> >    relation to the original CVE which seems to be about a missing memory
> >    allocation failure check?
> 
> Removing the driver entirely from the kernel "fixed" the vulnerability :)

What is _the_ vulnerability? While I do understand that _any_ potential
vulnerability in the removed code is removed as well I still do not see
how the driver removal is related to _this_ specific CVE.

> > 2) What is the process when a CVE is altered? have I missed any email
> >    notification?
> 
> We do not do email notifications when CVEs are altered.  You have to
> watch the cve.org json feed for that.  Otherwise the email list would
> just be too confusing.  Think about every new stable update that happens
> which causes 10+ different CVEs to be updated showing where they are now
> resolved.  That does not come across well in an email feed, but the json
> feed shows it exactly.

I do understand you do not want to send notifications for that. Would it
make sense to announce a new upstream commit added to the CVE, though? This
would make it much easier to see that we might be missing a fix that is
considered related to a particular CVE.

> Or you can follow the github cve feed, which shows this, OR you can just
> follow the vulns.git git commits which also show this.
> 
> > 3) Until now CVE -> sha was a 1:1 mapping. Can we expect this to change
> >    and what exactly is the process here?
> 
> The process has changed in that we have had to handle a number of CVEs
> where both the commit that caused the vulnerabilty has been tracked to
> mutiple commits (think of one-off changes that only happened on
> different stable branches, and then were fixed with different commit
> ids, like what happened in CVE-2025-40364), or this example you are
> pointing out where a vulnerability was introduced, later removed by
> having the entire driver removed, and then added back by adding the
> driver back and then resolving the vulnerability.
> 
> The original CVE had this information as you point out:
> 
>  	Issue introduced in 4.12 with commit a49d25364dfb9f8a64037488a39ab1f56c5fa419 and fixed in 5.10.231 with commit 0c24b82bc4d12c6a58ceacbf2598cd4df63abf9a
>  	Issue introduced in 4.12 with commit a49d25364dfb9f8a64037488a39ab1f56c5fa419 and fixed in 5.15.174 with commit 4676e50444046b498555b849e6080a5c78cdda9b
>  	Issue introduced in 4.12 with commit a49d25364dfb9f8a64037488a39ab1f56c5fa419 and fixed in 6.1.120 with commit 02a97d9d7ff605fa4a1f908d1bd3ad8573234b61
>  	Issue introduced in 4.12 with commit a49d25364dfb9f8a64037488a39ab1f56c5fa419 and fixed in 6.6.64 with commit 8066badaf7463194473fb4be19dbe50b11969aa0
>  	Issue introduced in 4.12 with commit a49d25364dfb9f8a64037488a39ab1f56c5fa419 and fixed in 6.11.11 with commit 74aa783682c4d78c69d87898e40c78df1fec204e
>  	Issue introduced in 4.12 with commit a49d25364dfb9f8a64037488a39ab1f56c5fa419 and fixed in 6.12.2 with commit 0c25ab93f2878cab07d37ca5afd302283201e5af
>  	Issue introduced in 4.12 with commit a49d25364dfb9f8a64037488a39ab1f56c5fa419 and fixed in 6.13-rc1 with commit ed61c59139509f76d3592683c90dc3fdc6e23cd6
> 
> And now it shows this:
> 
> 	Issue introduced in 4.12 with commit a49d25364dfb9f8a64037488a39ab1f56c5fa419 and fixed in 4.18 with commit 51b8dc5163d2ff2bf04019f8bf7e3bd0e75bb654
> 	Issue introduced in 5.8 with commit ad85094b293e40e7a2f831b0311a389d952ebd5e and fixed in 5.10.231 with commit 0c24b82bc4d12c6a58ceacbf2598cd4df63abf9a
> 	Issue introduced in 5.8 with commit ad85094b293e40e7a2f831b0311a389d952ebd5e and fixed in 5.15.174 with commit 4676e50444046b498555b849e6080a5c78cdda9b
> 	Issue introduced in 5.8 with commit ad85094b293e40e7a2f831b0311a389d952ebd5e and fixed in 6.1.120 with commit 02a97d9d7ff605fa4a1f908d1bd3ad8573234b61
> 	Issue introduced in 5.8 with commit ad85094b293e40e7a2f831b0311a389d952ebd5e and fixed in 6.6.64 with commit 8066badaf7463194473fb4be19dbe50b11969aa0
> 	Issue introduced in 5.8 with commit ad85094b293e40e7a2f831b0311a389d952ebd5e and fixed in 6.11.11 with commit 74aa783682c4d78c69d87898e40c78df1fec204e
> 	Issue introduced in 5.8 with commit ad85094b293e40e7a2f831b0311a389d952ebd5e and fixed in 6.12.2 with commit 0c25ab93f2878cab07d37ca5afd302283201e5af
> 	Issue introduced in 5.8 with commit ad85094b293e40e7a2f831b0311a389d952ebd5e and fixed in 6.13 with commit ed61c59139509f76d3592683c90dc3fdc6e23cd6
> 
> Showing that the kernel ranges from 4.18 -> 5.8 were NOT vulnerable to
> this specific issue.  Information that is hopefully very valuable to
> distros dealing with old kernels, like yours :)

Nope, not really. Specific stable tree versions affected is not the most
important information to downstreams like ours. We really do care about
specific commits that are coupled with the CVE. If the specific commit
doesn't have Fixes tag then we look a the CVE-$FOO.vulnerable as well
(btw. I have a growing list of those that we have identified breakers
for and I am looking for the best way to contribute that information to
others. I am just not sure how to do that in the most efficient way -
sorry slightly offtopic here - we can follow up off the list.).

> So now we can properly handle this types of issues in an automated
> fashion, thanks again for noticing, this was a non-trivial amount of
> work to implement.  Given that no one had ever done this before, we have
> had to create all of this "from scratch".
> 
> Our trees are crazy, hopefully this helps explain the lifecycle of
> vulnerabilities and their fixes better than before.
> 
> One other note, perhaps you just want to parse the .dyad files we
> create instead of mbox files?

We are not parsing mbox files. We do care about CVE-$FOO.sha1 and that
provides the base for our future analysis. If we need to expect several
upstream commits there we are fine with that. Quite honestly seeing a
stream of CVEs all fixing the same vulnerability just because those
fixes happened in many commits doesn't seem to be optimal.
-- 
Michal Hocko
SUSE Labs
