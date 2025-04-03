Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAF22512E7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 13:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743687230; cv=none; b=pgyAd+nE++44vOWgOUXaQ5l1WyCVQ7PcyQc0VWVN08D/CqjYEQa57DwX5xu36JO0IRMfk739w8F7ZDoUxvW92YWV2OhpAtMJoZAakU6q117VmqeKnAVO9qCQq5ue0uie+o1DCt+4s8zlK3bTCBu/+yX2CF1BfDHqhRoXUxr/Mfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743687230; c=relaxed/simple;
	bh=lc2kPBAUmFssEFHlFoZTIb5ZMulQItOIPpogF+GOBDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fjavdH69w/B5evtPs/6lW3ifO/9sUXRGj/R1hzhpvi1YouCyhICyXUzTRthZ/0liioNN1DfhgCFIexfu/UcqwBqzs2Jjbbo80LIGuSRu07YjkxYc0hCGo2nSimLs+bK+cJ/YifKRo72x06oOW9g/KnO+OKFUyh5oXb7eYVwbXXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MS2BBpK4; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MS2BBpK4"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39bf44be22fso662907f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 06:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743687227; x=1744292027; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lc2kPBAUmFssEFHlFoZTIb5ZMulQItOIPpogF+GOBDc=;
        b=MS2BBpK4jF96H1cgO9M1r1+ao2T5RFgHwAJnpbz1/0lPyIUTnimEJW13nV4ugNUUIP
         lqcxa+eNdau4Ox+kneB6LMt6+1zpPMDjCTz39pQMflNmtKq0KCy4Y0LpgfPZT8ZH6DqY
         +mHc+XZIPyTMrc51qN6CcvIIyO9q5yCRnMoMMwYGZwwPZNx+aVwxzv8EhqJrXhqEKsYL
         HmKnOCz7tNHdOrd1W9RMDNlaX4XniRyJth8V+k2zJ9MWfGLnTkz8VdfPjJoY3H+LAAOx
         icVm5/Wy/Qt6xX28LmwZscnDFb+WM23EOwDFkvt60AxXY2YlDtTW5FH1zc8TeBZvHorq
         NoxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743687227; x=1744292027;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lc2kPBAUmFssEFHlFoZTIb5ZMulQItOIPpogF+GOBDc=;
        b=lcRdoSwyQY8YC6mYiGOmOUTnHCqHMTv+2B9gvMjMCYm5bykucQS45lsumglxPxSjDq
         xef9bJrpGxEYmgvZnQ6U5O55rAPxifeANi025P7RQKG/6u5598FCz/5J7o4pVD4Fs1+f
         H8wLCwwHnzgxFrW4W9DDyR0kqfBLMeuCVZ6XRgDbnHFOxk5+eYP0QUU9v7mkHrM+RGQN
         Ukl+E+v07KB/4eqDcUkWFtGHSHOYIpd3jXTACH9Tx6gF+e4t5qu1fY1k5bldVhrZXGM6
         4GXURHHcordobW/M3w3F3glxXIUDbpPFh3O48o2nio6O7pCTrLj04VgvXbcthQi6+0Ki
         F9sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXG/uBKKsZuuZ+JLZpt6exOIs/B+medBILoMUZegPJXOMY/ZP+C3Y4kf7h9uhKEvLVlP1Qzgfzj9cAxZ1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuEqziGtqJ5/9vVw7Hz1CaAvzMNxRff9aFwi86oROfspxzke4O
	tvYjKN/clphj1fKgiL5rXtmpK/GTuY8r9vdC5E69oFoOivs5on/iikTCaY0PRLY=
X-Gm-Gg: ASbGncuwzuv2yUgI05bM1QSBxOUbDVROn6pdHZqpw6a3YvRWaliAhIRoOJHWaEqnAIN
	Pay1F5oTka4OuroiGnycvQpcgYX8HxSil1VrJuWfRMX6Ppx8zT5LbpvtojTt0CpKNoutJqVu3zk
	2g/eVZv8qCpem9ovEm8BnFxAmeRBP7IJK/+sJ9c65usR9I84WMl56GQNgvpZGlU5GVJDEIHICNG
	Us0tIFjBCkonnQG2f72MjJimahGghRePNY/byqe1wtG1Nxbu+48UYMsC2KCb6x0jVL+ihmRleu6
	R2BYSuJX2i0P0Q1SRXzLU0Lu8yse4I4EcS5ri+Jtptp2Yuc=
X-Google-Smtp-Source: AGHT+IGPQ6nwxEwKgFP3ExKTxhy07cHsFvtpQAvnmiKOVMha0c8lkk/HwjAtM+b4ugng/LTLNl3c5A==
X-Received: by 2002:a5d:64e8:0:b0:39c:d05:37d3 with SMTP id ffacd0b85a97d-39c29769556mr6233270f8f.34.1743687226677;
        Thu, 03 Apr 2025 06:33:46 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226959sm1768861f8f.82.2025.04.03.06.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 06:33:46 -0700 (PDT)
Date: Thu, 3 Apr 2025 15:33:44 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Waiman Long <longman@redhat.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 05/10] cgroup/cpuset: Don't allow creation of local
 partition over a remote one
Message-ID: <c5akoqcuatispflklzykfwjn65zk7y22pq6q6ejseo35dw5nh2@yvm7pbhh5bi4>
References: <20250330215248.3620801-1-longman@redhat.com>
 <20250330215248.3620801-6-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pjejnus3mirkel3g"
Content-Disposition: inline
In-Reply-To: <20250330215248.3620801-6-longman@redhat.com>


--pjejnus3mirkel3g
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 05/10] cgroup/cpuset: Don't allow creation of local
 partition over a remote one
MIME-Version: 1.0

On Sun, Mar 30, 2025 at 05:52:43PM -0400, Waiman Long <longman@redhat.com> wrote:
> Currently, we don't allow the creation of a remote partition underneath
> another local or remote partition. However, it is currently possible to
> create a new local partition with an existing remote partition underneath
> it if top_cpuset is the parent. However, the current cpuset code does
> not set the effective exclusive CPUs correctly to account for those
> that are taken by the remote partition.

That sounds like
Fixes: 181c8e091aae1 ("cgroup/cpuset: Introduce remote partition")

(but it's merge, so next time :-)

Michal

--pjejnus3mirkel3g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ+6ONgAKCRAt3Wney77B
SU6VAP4ynbl5wnoim3pRoEDFYW9TwsFFO1oqvsJdRQbrLPKb/QEAsizzl8zjyzkV
3IT57x5+x3Tpe2KO9CLsl/Pj29WW2Ac=
=P059
-----END PGP SIGNATURE-----

--pjejnus3mirkel3g--
