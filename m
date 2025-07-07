Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE10B2D78A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 09:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751882396; cv=none; b=DyDHMK6HFLT44JRB7ThxpZ+s7VTHYIgktUOW2ZbmuqGRilPvzt0GTKl8VuW11Q6Mf34Mr01wwUNKvnre7XPJ2ENAe+sGXOTwVK0P3NlJ22rjIT8J6obx3O7qCRAor/GfDjZ5M9RQfI/QAMgGD1Di7omPdBlRM6+MdF7QVjnBAlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751882396; c=relaxed/simple;
	bh=7Yz0bjI0WWqTDd5wMmn0BB46jE5RLxxJUDmNLhFW3Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iz7Jwq+NGfODLdrTqvnxjkbJdJCsxfVzUPMNvx9qghwBWfI8R7OkWpkJt+rs8V+k7ciOw+n/kcxOkuDcya4440MzWChk3M3flNRvAh7bEXqt4M7mpZgAI5HgSvdY8WeSHng04j0Clw+snmWBDzHjh01W8S7XeBgWuMTxU3onQLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eYWwkCgf; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eYWwkCgf"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-453398e90e9so18766055e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 02:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751882392; x=1752487192; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d82/2ial6v9ccHeZaghL3hLg/dzpt/+BNJIXRihD9fE=;
        b=eYWwkCgf1Y/w6vxyp+NoMkTUdyBmohRGRfP67QIPZ/bEQRMOVJNmmkJV4uBf5Ze4Yh
         y2Mx8WDVMAzwwiz3ndyChiSga+RGBDQIVVjRTPCZ7QoXWWLFjd3KVaXmJSghr3NMaEH+
         99eEbKkNekpPUQI0zGDrc1N3pZNuVmlnNm/ndJd15QihssI97tUVB24T7drju25z85pA
         sPjWsKjEOaMhxwXVuQo4Tj4gkddxl+xNTMDtYDccw+KwTK5qQ2xkCzNGRqfg26NYf0f6
         iNWrb5tg5B05IhwKJ34MNQiHOAnS3jNXy0joGLg668meOYfnmtblaJSryT7OgWd6bO+0
         95Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751882392; x=1752487192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d82/2ial6v9ccHeZaghL3hLg/dzpt/+BNJIXRihD9fE=;
        b=bq5GRuv7Xk+uk1QUrMiVVQ4xgYAfgE0+BHMYSzkwxM506/T6t5+s8jMtHKnYmrERar
         bVQFYGddicETzcUx/DeoihwGOPuO6Nh1vXjHP7QEfgOdKlcCdnQotRZHKDRNMJKuz4ox
         QzE+5shP27aZCaDGiNvEnTXCAF2O34etEjxzlecq1d+rb7vxVKkHNG2eYfN4YJ1ztyrP
         XtecSG6pPkr8GKU76ww02wLbcKJIq216oBcSVWlZxefB5Q39VSL2P/GWvBk1TjHgGhfM
         ayvCydDCtTEII+3AAXUspakDJfPdAg0MOmnkPBJsc56RwdTs9kdLbYHu3ZJffC0pM+to
         fEAg==
X-Forwarded-Encrypted: i=1; AJvYcCVIkckmvYN/aQyTa1ZKev09/rv0o5t6i6DLdOFC784K+6dlas0zD1HffoM4VavZuWNhOPeS/Sxbz/3nJyk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1ixKpwjjd6yjiKBR+yforMVIOFyIpPNGVz/ls5kvFXYgSs1Xi
	M9cpgZKdS1zUjr9BYcoBAIqHY5jPbrwRtQLo9tj9QSvd7MqZf4M2JYs1MdICkcm7fFs=
X-Gm-Gg: ASbGncurPHrc3J6Wfdq2vEBxd82q5VENdJftAgiPnHZgPhYaM526hdtlKLW8SMyPOeH
	PH7oK+Ck7uUkCA0ZIGdMg2AYz7are15KDK1jsTDLoIOsVRglOzqQpZSWPVAmwMMNL2uDFxFoJo8
	r19ZCSxLpGJn4d4Im5Rf8UF4ufdj+xuSmIYWgELyKpo9midXU809evhBlcbIzVDSngXCfBYbpTv
	LYDDYALXIpBsmANjdPE+quMwDLOv0XgbrHGotxZkixsGSc6vPjsvQNuOB5yIOg3A5uMgut6twKT
	PDX0hZidF2b+jMLhSOyT7/+wcG9YHapZcSOFBDGUrcN+RiCRgzVHjC0cMPzvNuwG8oaT2ngimYI
	=
X-Google-Smtp-Source: AGHT+IHRjy82W3krhF0E3ljOItCoie8HVrp+8y0T7w/WP5rEf/zip2ygctxQu9zwoA/kbRgg/9MwOA==
X-Received: by 2002:a05:600c:548e:b0:442:ccfa:18c with SMTP id 5b1f17b1804b1-454b318d9c0mr86326645e9.32.1751882392003;
        Mon, 07 Jul 2025 02:59:52 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9969058sm137832675e9.3.2025.07.07.02.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:59:51 -0700 (PDT)
Date: Mon, 7 Jul 2025 11:59:49 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: YoungJun Park <youngjun.park@lge.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, hannes@cmpxchg.org, 
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev, 
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, shikemeng@huaweicloud.com, 
	kasong@tencent.com, nphamcs@gmail.com, bhe@redhat.com, baohua@kernel.org, 
	chrisl@kernel.org, muchun.song@linux.dev, iamjoonsoo.kim@lge.com, 
	taejoon.song@lge.com, gunho.lee@lge.com
Subject: Re: [RFC PATCH 1/2] mm/swap, memcg: basic structure and logic for
 per cgroup swap priority control
Message-ID: <nyzhn5e5jxk2jscf7rrsrcpgoblppdrbi7odgkwl5elgkln4bq@mdhevtbwp7co>
References: <20250612103743.3385842-1-youngjun.park@lge.com>
 <20250612103743.3385842-2-youngjun.park@lge.com>
 <pcji4n5tjsgjwbp7r65gfevkr3wyghlbi2vi4mndafzs4w7zs4@2k4citaugdz2>
 <aFIJDQeHmTPJrK57@yjaykim-PowerEdge-T330>
 <rivwhhhkuqy7p4r6mmuhpheaj3c7vcw4w4kavp42avpz7es5vp@hbnvrmgzb5tr>
 <aFKsF9GaI3tZL7C+@yjaykim-PowerEdge-T330>
 <bhcx37fve7sgyod3bxsky5wb3zixn4o3dwuiknmpy7fsbqgtli@rmrxmvjro4ht>
 <aGPd3hIuEVF2Ykoy@yjaykim-PowerEdge-T330>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wdwglhs4zrm53st4"
Content-Disposition: inline
In-Reply-To: <aGPd3hIuEVF2Ykoy@yjaykim-PowerEdge-T330>


--wdwglhs4zrm53st4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH 1/2] mm/swap, memcg: basic structure and logic for
 per cgroup swap priority control
MIME-Version: 1.0

Hello.

On Tue, Jul 01, 2025 at 10:08:46PM +0900, YoungJun Park <youngjun.park@lge.=
com> wrote:
>   memory.swap.priority
=2E..

>         To assign priorities to swap devices in the current cgroup,
>         write one or more lines in the following format:
>=20
>           <swap_device_unique_id> <priority>

How would the user know this unique_id? (I don't see it in /proc/swaps.)

>         Note:
>           A special value of -1 means the swap device is completely
>           excluded from use by this cgroup. Unlike the global swap
>           priority, where negative values simply lower the priority,
>           setting -1 here disables allocation from that device for the
>           current cgroup only.

The divergence from the global semantics is little bit confusing.
There should better be a special value (like 'disabled') in the interface.
And possible second special value like 'none' that denotes the default
(for new (unconfigured) cgroups or when a new swap device is activated).

>   memory.swap.priority.effective
>         A read-only file showing the effective swap priority ordering
>         actually applied to this cgroup, after resolving inheritance
>         from ancestors.

Yes, this'd be definitely useful for troubleshooting and understanding
the configurations.

=2E..
>         In this case:
>           - If no cgroup sets any configuration, the output matches the
>             global `swapon` priority.
>           - If an ancestor has a configuration, the child inherits it
>             and ignores its own setting.

The child's priority could be capped by ancestors' instead of wholy
overwritten? (So that remains some effect both.)

Thanks,
Michal

--wdwglhs4zrm53st4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaGuakwAKCRB+PQLnlNv4
CPFYAP4ydDKYFygLh14WYhl6pOkLrwj8JkhclU3yKqmmebJVTQD/W+JB5AMQ7qu3
RqhHDUL/M9s2yFNaz+QmdaSUTCcsNgk=
=X9yq
-----END PGP SIGNATURE-----

--wdwglhs4zrm53st4--
