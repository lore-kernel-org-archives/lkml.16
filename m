Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C059D226D07
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 09:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746178988; cv=none; b=bCMOgvxoj9gAYKbhhsm+EVdMNsrWEYF0Fxg+Hc+wnqZv8WRoQoFnJq70dAK6gU8Mk+ejZQ3jFWIB2OVaBSVqCMJHoij5XvnyVvHLayZAhIBvGiwfuh//pbidulVO9gRflIqzWhLVMYIuoNCmjbiyFVxaK8YwigWGuG8m+puy7iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746178988; c=relaxed/simple;
	bh=EOXqPqomDY5NAmOBb/66KqDnP+k/LNaa1HXt0xFQ2zI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U1Fmvo0nTGgQwGBtBN+L2GwuwGbMW6L3ARFMRo34IUzPTf6Jdp4l2jEvYwiyQOCBfTxTblPBTYKChMbO9EYokpk40qEa7llzuGdgSLq7l0Wkr8vh8qbaBBzUOz2A3DnF7NFyLdBJLo10QdL85Sn0Ajn57LdVVh3K9U0BqWHyZcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FNh6wRok; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FNh6wRok"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5f6214f189bso3371881a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 02:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746178985; x=1746783785; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EOXqPqomDY5NAmOBb/66KqDnP+k/LNaa1HXt0xFQ2zI=;
        b=FNh6wRokeH/ZCOx305hS36t3HW2+EwT+Do9ehclCuwwr+qGSa/GJbRNbSo96uup9MA
         Li4bnKCQCRy9YIIS2e/lT7F5Gvo5WsQHmOrEwdXsx9PRplZHbrZLmQ/f6wAO5vEp1cNJ
         8S/hqtBxJal+gGXb3n+j43uZKENhG3bdnMCLV3jZdVEg5EnA4XlhkRCiiru3cHhfYQ66
         dbEnFUUUUZWDuLg87insbdA0X9C/eUAknM1kuac6oUV4uvlBKmQg148blv2+ACJknt8F
         KEU97tU08Nj4/daV5QVi/yMqlQcLcSAT24sTu92N9W+UkAQx8LDPOrGPie/NK8PFC2LI
         Je6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746178985; x=1746783785;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOXqPqomDY5NAmOBb/66KqDnP+k/LNaa1HXt0xFQ2zI=;
        b=S2sG1bUvJ9w5jjWfB+9QAlg8fOqOaBjkWerLDBjHLI9n2OT1/sCMJZxgUcLNDqoBhI
         4jmaQYti8DWxqb2dboGuYBBIlguqWmVXm0+vGGykSrAU+Qk3EhCvBCqfEDYYCxFtdPNq
         X0U4abhw16rHcvFebcWmvd3k52iCE6OAJQN5rL/Q4QqyunZccH9vDWlJBPf9swRyXtO9
         qya6JwISKPR6BSIWfOymJjLYM8ah41hT+7MNVAnWJMJizYCYcao6JCfw4lSa7Cd2l6c7
         1k/jA4iPAT1r0rnXNmxB2QGOUpnvKJmCXO1bzDICHQhugA3OK6fcKW/YDpgWgnkikW1e
         pQVA==
X-Forwarded-Encrypted: i=1; AJvYcCVmSYi3GUuCeImgUxih/ZPs9EDkBKKep7CTp1Y3qNXJwcNtyLXBtwjvflPuAtmaGXVV67ce2Y0iU6sHvhA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8k9cStFB+HqQYexbepRw6XGmx4yuiOW6t2+XVMxjnxezkWkNk
	JuKWSuoSrWb4D/KGGPKFyiIrtGPy+idEHz3lCmD8fTypTd4+tz+Gt0hmXhrpuKw=
X-Gm-Gg: ASbGncuGXo68KsZs5mjsjTnC/j9p9ndb5CewXquOcbRe449LkUUtUxzCqQhqI3k0jSs
	oQmOpJerIM9WSgkTwXM5FvIDJqu2U+1UnkvBvu/jncYLAl9wRqmp7j7hjsX8FhfE0AezNzGqnqM
	fjb5UGnWTt49a1zH9bHe9y9271ZRKrf/wujB/40TM264ef3U6byWgQOGQx9DRvXybkynkyGhB7p
	zM27kd8r3+oJy4SWa11+aqluDa5ugY2IbX4c5y0TvuFxXKXVubKhcM67AxepVgkHSHXUFZjNzcW
	17ZDAYZjV6rMpYUL4iaWewOoRMN8rXFZCEmHWTYuJak=
X-Google-Smtp-Source: AGHT+IFgoRhv9PuW/EWdVGOS2zvRloJtSnlLvctJGmfk/l9H9pNgE/zk8qe2KUDmO+lth2FLCAP8OA==
X-Received: by 2002:a05:6402:d08:b0:5ee:497:89fc with SMTP id 4fb4d7f45d1cf-5fa7891aae1mr1661907a12.33.1746178985017;
        Fri, 02 May 2025 02:43:05 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa7781bf5fsm942719a12.36.2025.05.02.02.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 02:43:04 -0700 (PDT)
Date: Fri, 2 May 2025 11:43:02 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Waiman Long <longman@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Tejun Heo <tj@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v8 1/2] selftests: memcg: Allow low event with no
 memory.low and memory_recursiveprot on
Message-ID: <vki6asa3arxitfgio3goox6hiyzmytxskoje6e2z55j3xrskly@4jq4btqz5nwd>
References: <20250502010443.106022-1-longman@redhat.com>
 <20250502010443.106022-2-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="55lyjcmxpait3n53"
Content-Disposition: inline
In-Reply-To: <20250502010443.106022-2-longman@redhat.com>


--55lyjcmxpait3n53
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 1/2] selftests: memcg: Allow low event with no
 memory.low and memory_recursiveprot on
MIME-Version: 1.0

On Thu, May 01, 2025 at 09:04:42PM -0400, Waiman Long <longman@redhat.com> =
wrote:
> Modify the test_memcontrol.c to ignore low event in the 3rd child cgroup
> with memory_recursiveprot on.
>=20
> The 4th child cgroup has no memory usage and so has an effective
> low of 0. It has no low event count because the mem_cgroup_below_low()
> check in shrink_node_memcgs() is skipped as mem_cgroup_below_min()
> returns true. If we ever change mem_cgroup_below_min() in such a way
> that it no longer skips the no usage case, we will have to add code to
> explicitly skip it.
>=20
> With this patch applied, the test_memcg_low sub-test finishes
> successfully without failure in most cases. Though both test_memcg_low
> and test_memcg_min sub-tests may still fail occasionally if the
> memory.current values fall outside of the expected ranges.
>=20
> Suggested-by: Michal Koutn=FD <mkoutny@suse.com>
> Signed-off-by: Waiman Long <longman@redhat.com>

Acked-by: Michal Koutn=FD <mkoutny@suse.com>

(Thank you. Not sure if this can be both with Suggested-by, so either of
them alone is fine by me.)


--55lyjcmxpait3n53
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCaBSTpAAKCRAt3Wney77B
SclRAP4sVLHHxS41vhM1p+JYRz4x68kM1ToNUs7M3I1xd7X9XQEA9Lg0Obh9pUcU
RmcQibMDF9amuynS7EPQ0DQjGlQ+lQ0=
=iotP
-----END PGP SIGNATURE-----

--55lyjcmxpait3n53--
