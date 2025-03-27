Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959C91482E7
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 09:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743068606; cv=none; b=IL/3+5h8GuvjV2Vfxf4I/S/eR24RZ+APdl0f3cTU64ImyjprbhysasiU++riNtg8OUe9BDlvwkNe8uHhJ9nAgx8dqNG8RsCLuoSxDecnmkt+iAQ90ow1R0Fga8NMt4pCcCW9tS+1gnknPwbZ2I4IbhXiqVkk7FUFSQd+3Su2hK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743068606; c=relaxed/simple;
	bh=RQI/b+5b2edO2Zw7Frn6Ca5fIDxB6ZihWM6BQJgkAiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bRmMeHgor0n16BeYr2HYPnwHq8rJeO27CIOBjZbhoHPddiypVEma+qTcStd9tfzwS8h4aisFrHLkrzFnLkOBjaer/gHCG/4tF+9JafuAj4jy8w2mQWYcQWBFDx3EBBEKOXsDCio7hNPqFL05dlgxTKkTm+JaUwnIJlRdsB0a9YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AohM6zpU; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AohM6zpU"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3912baafc58so535768f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 02:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743068602; x=1743673402; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MH3oLkZ3QoHPrfnbUPiT0wxSJtA1cLOkJbbbBEVhhYs=;
        b=AohM6zpU1vVZv+6TDKEGGgKFhtXqvoFpYBiE+bM3QOGQF8+YP8pydG5UMdnvE1Odnn
         rQ1Ykh+PA0bM4uFTgpdR+0dwVcsbz5yEpB7BxC470vTsgMjMrwMcvU+5kAS8Gn/qzTtD
         HscYRmgzMqSXZKW2ZIM/CBRI4bIVIK/1hCGkwsURXMkwedHiWXCGJMTX44Bl0nAcwz9w
         oE1N7nhVUqRYoAGm0pv9bRsJ8Faopme4pHLwEvn7HUf6BLOpCJ2ebwf1vpeOR3NButi+
         YyQjlmaL8mu+6I92atd5/SCFpaOlS2A1h/JtBlIH5jFQTeVxE2Us0njKcV1kL89Q/86D
         SSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743068602; x=1743673402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MH3oLkZ3QoHPrfnbUPiT0wxSJtA1cLOkJbbbBEVhhYs=;
        b=jwEAa4LsS40NAnI8IQZY4v8cmZax19vYNdFZdB5Mop7kA3A+pa3sHLurqZw9P8YWZ7
         dXbTU6Q+321hTt/fKXcSrhV7ePq7PWUdbiD5bcr5z198dS6F5gZN/wbIQviIo27GOI9j
         nt3h/EV0YhUj4IT7irqhTGYGd7tAs0bwpDYterO58Cx5DWiA1kHTXe+r+LUBSR959oV4
         ae83nODf5gXzhsrLYTN0klH/5jFp79zAZJG4P2Xzdgwxkap7Av4Y8DIVNb3WHacndD/8
         i8NR58ouVUzx+LvJuvzSHyd7pKsHgEr9h2BScs51WVH2zxg42s1tHxcLr3MPVtH68czD
         Eaug==
X-Forwarded-Encrypted: i=1; AJvYcCUktv2XuFr/4AUhdbgi3ohKaf6Fj1uuRK4qjuH28T3Bs4xqgv6YQrkpMnRxH/deTtVsJwtIASkUNjj+ThI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOvW9/MSXD5OVbLB6seyZ5HC/Md2ibHckPPzSqld2wmbqgZzYD
	UFMVjc0OUSkyPY5IPjF6kddPsQgZTg+Njtf0avxZONq04tthxnPxgzq0UraO07M=
X-Gm-Gg: ASbGncuysj8fo/YmHQbIP43MM4YvvToi4PspwqJhuLcOvFnp9Uw/4nQiSpttWO+ktBk
	tlC3fuc8+LnMmq0ECqah5f1D9f8RHi0BgmH06Cw/h+biRJgBaT+0Y0mUnxLIBHGcCvqxel42vQx
	wi5jeY61DX8gp/wrs5z7nZ7jj4Pcz295fNZ6rPYrvZkPWRYVpBVnqxd2hxEDhucr8lH6Y/KSCt0
	wk4acRzVd264gY1F9EeVuhEIsK9OVMlbmLDu2L+GOa3dhMHhaSKPIxG+9yLHHIJVw3Sl0HNmrqg
	jCq301NxHS3GUnTAY8KqwxpE20fhktbjGdftmWscpU1gfp4=
X-Google-Smtp-Source: AGHT+IH1WiFsXOivY3uNtWR03fqybSpj7EH4HsxNZKa+E51aIf//dEXmU1/S3e5uU474CO7buz/DFw==
X-Received: by 2002:a05:6000:2cb:b0:39a:c8a8:4fdc with SMTP id ffacd0b85a97d-39ad175c052mr2145200f8f.16.1743068601849;
        Thu, 27 Mar 2025 02:43:21 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82e6ab48sm32678605e9.10.2025.03.27.02.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 02:43:21 -0700 (PDT)
Date: Thu, 27 Mar 2025 10:43:19 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: James Houghton <jthoughton@google.com>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Maxim Levitsky <mlevitsk@redhat.com>, Axel Rasmussen <axelrasmussen@google.com>, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Yu Zhao <yuzhao@google.com>, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, Yafang Shao <laoar.shao@gmail.com>
Subject: Re: [PATCH 3/5] cgroup: selftests: Move cgroup_util into its own
 library
Message-ID: <fg5owc6cvx7mkdq64ljc4byc5xmepddgthanynyvfsqhww7wx2@q5op3ltl2nip>
References: <20250327012350.1135621-1-jthoughton@google.com>
 <20250327012350.1135621-4-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="emghnkmnkyymych3"
Content-Disposition: inline
In-Reply-To: <20250327012350.1135621-4-jthoughton@google.com>


--emghnkmnkyymych3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/5] cgroup: selftests: Move cgroup_util into its own
 library
MIME-Version: 1.0

Hello James.

On Thu, Mar 27, 2025 at 01:23:48AM +0000, James Houghton <jthoughton@google=
=2Ecom> wrote:
> KVM selftests will soon need to use some of the cgroup creation and
> deletion functionality from cgroup_util.

Thanks, I think cross-selftest sharing is better than duplicating
similar code.=20

+Cc: Yafang as it may worth porting/unifying with
tools/testing/selftests/bpf/cgroup_helpers.h too

> --- a/tools/testing/selftests/cgroup/cgroup_util.c
> +++ b/tools/testing/selftests/cgroup/lib/cgroup_util.c
> @@ -16,8 +16,7 @@
>  #include <sys/wait.h>
>  #include <unistd.h>
> =20
> -#include "cgroup_util.h"
> -#include "../clone3/clone3_selftests.h"
> +#include <cgroup_util.h>

The clone3_selftests.h header is not needed anymore?


Michal

--emghnkmnkyymych3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ+UdtQAKCRAt3Wney77B
SdMdAQCSfMUeyxs7jRY1DgHYPciU4P2a7+sr132y+/5NX5fJ/wD8Dp4tx7S5u978
BgGpkmbqxF6HcGVx9Y4bacdDAkqBbwc=
=kBp5
-----END PGP SIGNATURE-----

--emghnkmnkyymych3--
