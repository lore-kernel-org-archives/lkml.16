Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B70C281370
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 16:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745426984; cv=none; b=F6vkZO4A+lkFxGAWkb/qhRJwNC6O01q30Z/KO2u7W+tmakfjZJtgIUm9qt/+xEOifsta2w9PBM/CAq9ePy5wYKIaEZHq2uagjlUVRFiuc0p4e2JG4fRa52ig2W/Kf8DReG2AmaETUlYpX8U2eOUNfNAOrXSSEJWyPjUTn9sZ+MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745426984; c=relaxed/simple;
	bh=oQNZMJTmyhgvizGXpzduup4GcugHaOFijzv+8dpnUr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cl17aE07HpThlSyDRpjZ7+BsVv2V9ShPHUN1coFnVcnE2sWK07l0bfgklCNZvLOE70ktFygHgSZXY1F9dZrpgKt3I6eNODuDwnEPt3S9K34mDfddQ+3b2aRlAtSPzbLeNVxaM8LH6/TKw0yqsXBN7vxqPtwKehSYjILLrUqZFjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Oo3A0fJQ; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Oo3A0fJQ"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5f62ef3c383so9815910a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 09:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745426981; x=1746031781; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sdvq3dgbND2yhqAcp9bTHmeHLzUTNkf08e1f0uJeekA=;
        b=Oo3A0fJQXRgyg6jLDGabva23rjMgdtDT3xGkTq6eAgwihuGOcEYE75rYp5p8Nf1fzp
         HY/G7fo9WaGj4fsjS5Mh2PVwNHGYSolR4iAn85Zqx3ZetCaqDPO0aDEWKYIV4Edv/mPq
         faVzivNbpXF6tKhQaCkIeB4hzjii1O31SDi1E13swJ+taBMDDathkSk440RljSWMa6da
         oMwUNCZ4C/vqFcxBs/1ny3NxgZbpLqrt0J0slxDOhxp8a3ynQBqljS9eW/qpCCzKUv69
         bZ2dPWuhx70l/O2qze9LFtL7YfEAc5C5+yZGLblkE+E3rbeIr/quhQBKfaRKBq9eCKX4
         MkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745426981; x=1746031781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sdvq3dgbND2yhqAcp9bTHmeHLzUTNkf08e1f0uJeekA=;
        b=ilJaxXrwMME0EYCP5OJ0Foa18aejCL7xAJ5ixbMVjlnQ7zdbMZjfAbhnFDSv/csMQh
         QN9QHxs9UTNtzOi/2Twtrb4wqp1TMw+DMLtrJ+ZZkpHwOhG2iTMme3MZBNg2SDxM9LPW
         5tdAmYAFycFmiDEvePidwQmb8Yuqq6mzxCKc1QY6YHaaKYIherbqNImRqNwag4FXJCX3
         FoWJHocRY2HC1lbc7CPTLmwPmyJowg5952y2cEKsYKTEeUqRAf0oi0WUdTxhJv45IQ07
         faQtUrfzzkNac2bXwkPlzF5cjuSJQsN5aaO8bK8VTt0S00X/3JguaWrdpiopXF3KfTG7
         Xz9w==
X-Forwarded-Encrypted: i=1; AJvYcCVLIZ5A+iDZqO0qmzuYGifeXxMX+MCjVkOM9NxGoVMDnbVA/XkUWi4wNzV141I1vwz2BeIrni3CJKikPos=@vger.kernel.org
X-Gm-Message-State: AOJu0YyS9xm9kT/XM9SzlRSlJuaJWCBIVRXWiKtILt/1ApNVY8JxicI9
	u4AWa1N+Hmz42gHfFjaUxZyngNbL0plFpENGfuGj5LJGxFeWyejXXFPJpj7LJ5k=
X-Gm-Gg: ASbGncvE0b8MZ5WUrWtcJt7FAKHPl9vt+Opk16FGmEOh9co5FEHJo+m3I73oHhGqTzP
	XgvAckfdfuFCX62MZAifn4CoA+0+pjF5fTNQ67K+U1tPGLC7H/OJG/EEzoxt1ripQ134XMFnT4T
	8TY0N8IJ/fI3a+Y4CY+KwUNWjMbROmCMkbNIjpqZtrvvTGogsNXe5yBVD4bbzbXqt7gVk2DpYRn
	qo5Lr4nu579DWL9Ciq8aL9tnZqJUkJXxBkh/CS+c0aiCzHmobIqlILQFj+TuGhcqdbD0wznLWx0
	qLPMkhgW6Dv7ih4hX/f+p1Kzlz/lvDNR6LVTVBtE01I=
X-Google-Smtp-Source: AGHT+IHt7B/iOlBt7pmSJ7gzikFeMN6S/s93IPwCoTUeOdD3rWwMpgm1NgxIFUsDLPuDw5HktCTMuw==
X-Received: by 2002:a05:6402:510f:b0:5ec:9513:1eaa with SMTP id 4fb4d7f45d1cf-5f62860f525mr16307356a12.23.1745426980642;
        Wed, 23 Apr 2025 09:49:40 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f625549cc7sm8007048a12.3.2025.04.23.09.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 09:49:40 -0700 (PDT)
Date: Wed, 23 Apr 2025 18:49:36 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Waiman Long <llong@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Tejun Heo <tj@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v7 1/2] selftests: memcg: Allow low event with no
 memory.low and memory_recursiveprot on
Message-ID: <d36jhvahtoqqtuw4y2k4rjzmxnu4ejbffvimrnffvcu3raby6l@asjm6h6r7w3k>
References: <20250415210415.13414-1-longman@redhat.com>
 <20250415210415.13414-2-longman@redhat.com>
 <psbduszek3llnvsykbm3qld22crppq4z24hyhsp66ax3r2jji5@xhklroqn2254>
 <0033f39f-ff47-4645-9b1e-f19ff39233e7@redhat.com>
 <h64z4wl6mw3qxfwmqsvlddsie62ehkoag47lm2in3nda7dhloq@rjxpkggawqem>
 <d32c626d-1c93-47ec-8b01-1c085b4bf2fa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="anb7crrm3nolrfjp"
Content-Disposition: inline
In-Reply-To: <d32c626d-1c93-47ec-8b01-1c085b4bf2fa@redhat.com>


--anb7crrm3nolrfjp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v7 1/2] selftests: memcg: Allow low event with no
 memory.low and memory_recursiveprot on
MIME-Version: 1.0

On Tue, Apr 22, 2025 at 07:58:56PM -0400, Waiman Long <llong@redhat.com> wrote:
> Am I correct to assume that the purpose of 1d09069f5313f ("selftests:
> memcg: expect no low events in unprotected sibling") is to force a
> failure in the test_memcg_low test to force a change in the current
> behavior? Or was it the case that it didn't fail when you submit your
> patch?

Yes, the failure had been intended to mark unexpected mode of reclaim
(there's still a reproducer somewhere in the references). However, I
learnt that:
  a) it ain't easy to fix,
  b) the only occurence of the troublesome behavior was in the test and
     never reported by users in real life.

I've started to prefer the variant where the particular check is
indefinite since that.

HTH,
Michal

--anb7crrm3nolrfjp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCaAkaHgAKCRAt3Wney77B
SQzZAQCIfMkqhFvSUMRJRs1nSND5RQHJzEcUbEd4lZSX5UqoYQEAty8vhN2bhzOm
8ceCcBpCY2lqn5eEbe8xSjLCAE/WZAI=
=fQl9
-----END PGP SIGNATURE-----

--anb7crrm3nolrfjp--
