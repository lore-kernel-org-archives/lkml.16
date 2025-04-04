Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBD61494A6
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 18:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743791186; cv=none; b=XmehPiW1/Xyj7qpZqxyMzGlGRvr41v31yALxJ2IRc/NbTSYacjRhS7xO6YX5+XKibIbE3l42jXNGWsRnSnQR3m7YbhfpY+2K4488vE1tJBPEKjvQkuWjvW1aNmaKmGT2LfL7u4xnX+56lrY3yfbyhhy4Qn8bJ2fT5gGArqBChMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743791186; c=relaxed/simple;
	bh=ZOTccLSgfI9cTOLRpsnzj9bwhsvfPOgW3jKDNeC0EZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CnqpiyrND9hvyNDTGiSoZNftM7DDsa2reMXZJaA2TZQxv8iHU32IDAi2HrOLtqhr+pLAIHRXpTjKyK64n5dYd+yIyj1tHtCZDcTITc6QPECoVwzonBch+RWMTM1rHtnUtzvcvWdGU5IWeGmgDjHoRmlFURmuhu55fmQ1z8NrdPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KHnCteTS; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KHnCteTS"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c31e4c3e5so1341995f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 11:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743791183; x=1744395983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TLhJnFT3Gwgfc4DYQiW9AZKUF72F44NtVJtW3JeRxAo=;
        b=KHnCteTSyAw1pbj3+oxle6j5KlpYwwHRbQ0kr4eNBN/n8jasO9nCtGCQLG1VeViHr/
         ELJGHfW7G+bZY+8nonSO9a1hQZVZuesptbz09xQnBYUSfmGRSBEySoKD1IHWxV8slmLQ
         iU0Ow83iZFBq/TmVWZEUvrgMVxAJ3k7oZYNOKVDwORAtjhN4/eMET3PWbL/NSf5MPc/B
         rAb6p7j6YrarUERYXlbnffT7TfSQb0As4FJDWW98+cdoxTPEFNUPENWRviM/eLKR0Pja
         YsLLuVgGi/d2/Wl8NfefrK0EHwQlQ0f9mtmCfrNZJerdtYbFTOISpR/lNm2NvBwsiCmg
         yxXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743791183; x=1744395983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TLhJnFT3Gwgfc4DYQiW9AZKUF72F44NtVJtW3JeRxAo=;
        b=sMNl1/HzyWjgtwJfjUJdQP9CkUn/kxcL36a0G24M+fckO9oGpzE20ZQg8kxyvY+EJe
         JOoef4m1g0fM126MJkCD8Aky28S4tS5lHGZ8nQcliZUv/mD3kzbxKaQY/zRVFJ1+Q6ag
         EDkX2Hum51VzcDf/Lx89CtIUvpyBm+V/C3cQQVHxIwEn630tytCf9CwL4YgjypGMfucp
         zsiE9j+BzolJmP2whtu/2oAcu5OXLeqlc3twcHj4ROkHGMgkbOkHKbownzuRtYyEhqOk
         Yl3rkGFCxqgtfZfldgBmKXvs+TXPhG48DU/S8/sRrMBBkFWtL/FvTtJo/5/Unin/Rx3y
         anJw==
X-Forwarded-Encrypted: i=1; AJvYcCU7AR8N9QhVkYQ6E7zXzCGTE6YkkFW4wFEMppqm8LHb2eZd5p9WzMCkotbmh7qYeCbpVzqzScma88ePrU4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmJwaLeURjm1fuZpHNUF4Rvoa4B3d4cq44OqYhg7lBjj22bPKx
	y471m4qaN1FEklhz/g/8MwzpG1l0bSHAT40C5Cz5ycbeUHE92GdVwynbW9+J/HY=
X-Gm-Gg: ASbGnctIOSnDyuiVdelvmJQo7coGRvTMZAZnKjT7KtOLSLEYniTVuy/x9z+u+Sn88J8
	Fb13/u4R9igRPYcpsx+Ghk/znPWY75+TaDfnELTwDvgA+R2SMUjui7ots2uCt5vev+D6VtLF8qu
	OcjapD/M7T/i0mlZ9slAvnNeKsR/sfFdT7p7Wf6h46Yw6GobyRMO3nNnFw00jWqDCi1YiOB97SD
	VtB/uHr0Py0YqJOBmMO5lUOtbyYf/FftAJaz2Mkxx2q9OU4rV1FgVMFv4dEHFscz3oJ4OiZv7Z+
	aBrGR/Kky9kOx5Aa5tpVFdmVDV/1z8uT0reIjO0F9yJXuec=
X-Google-Smtp-Source: AGHT+IFVVzcvCxUkq7QqYrnEsRDzq8Ic4YqHD2DrlGgpG3HTOI3DOpixIDGv0syuaug71lzZJsL3oA==
X-Received: by 2002:a05:6000:2406:b0:38f:3a89:fdb5 with SMTP id ffacd0b85a97d-39cb3575d97mr3948931f8f.11.1743791182544;
        Fri, 04 Apr 2025 11:26:22 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d975sm5041239f8f.75.2025.04.04.11.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 11:26:22 -0700 (PDT)
Date: Fri, 4 Apr 2025 20:26:20 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Waiman Long <longman@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Tejun Heo <tj@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 1/2] memcg: Don't generate low/min events if either
 low/min or elow/emin is 0
Message-ID: <aopkqb4bd6sag5mgvnvmoojlsz47lxrgxav7lsywkzeqtb5pco@ptxoqnloplzi>
References: <20250404012435.656045-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3ezm3guyzo3fa3j5"
Content-Disposition: inline
In-Reply-To: <20250404012435.656045-1-longman@redhat.com>


--3ezm3guyzo3fa3j5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/2] memcg: Don't generate low/min events if either
 low/min or elow/emin is 0
MIME-Version: 1.0

Hello Waiman.

On Thu, Apr 03, 2025 at 09:24:34PM -0400, Waiman Long <longman@redhat.com> =
wrote:
> 1) memory.low is set to 0, but low events can still be triggered and
>    so the cgroup may have a non-zero low event count. I doubt users are
>    looking for that as they didn't set memory.low at all.

I agree with this reasoning, been there [1] but fix ain't easy (also
consensus of whether such an event should count or not and whether
reclaim should happen or not). (See also [2] where I had tried other
approaches that _didn't_ work.)

> 2) memory.low is set to a non-zero value but the cgroup has no task in
>    it so that it has an effective low value of 0.=20

There maybe page cache remaining in the cgroup even with not present
task inside it.

>    Again it may have a non-zero low event count if memory reclaim
>    happens. This is probably not a result expected by the users and it
>    is really doubtful that users will check an empty cgroup with no
>    task in it and expecting some non-zero event counts.

Well, if memory.current > 0, some reclaim events can be justified and
thus expected (e.g. by me).

> The simple and naive fix of changing the operator to ">", however,
> changes the memory reclaim behavior which can lead to other failures
> as low events are needed to facilitate memory reclaim.  So we can't do
> that without some relatively riskier changes in memory reclaim.
>=20
> Another simpler alternative is to avoid reporting below_low failure
> if either memory.low or its effective equivalent is 0 which is done
> by this patch specifically for the two failed use cases above.

Admittedly, I haven't seen any complaints from real world about these
events except for this test (which was ported from selftests to LTP
too).

> With this patch applied, the test_memcg_low sub-test finishes
> successfully without failure in most cases.

I'd say the simplest solution to make the test pass without figuring out
what semantics of low events should be correct is not to check the
memory.events:low at all with memory_recursiveprot (this is what was
done in the cloned LTP test).

Michal

[1] https://lore.kernel.org/all/20220322182248.29121-1-mkoutny@suse.com/
[2] https://bugzilla.suse.com/show_bug.cgi?id=3D1196298

--3ezm3guyzo3fa3j5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ/AkSQAKCRAt3Wney77B
SXLwAQCLHjkGHqdonWWfAZmkRMLnnd/9GLDwQHs1pDPkdB+LygEAv1ILh4buquz3
RL8ZpTYF0zHvtsUdp9Ow556iY7pSSw8=
=fCfQ
-----END PGP SIGNATURE-----

--3ezm3guyzo3fa3j5--
