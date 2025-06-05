Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF1F188715
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 15:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749138629; cv=none; b=ZQ0O+gVOkBTfTkLBnW0jm4nEGyjibZ+YRCQnfmvkhoDH7R6fFMmNE3Vsh/jZj1/CqTMZVKQKLCnpziltCshSU8MjuXhAu8tCnq20LE0SoM7K8CwaRjLPOIwYFmv5/PpIHStjNHVW21wB2hRyL5Q0GHikeHWwZmzWnWxUWRE755I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749138629; c=relaxed/simple;
	bh=PH2gg5/25bWwXBMWyv5HpO0mhwg5KYPWfIuk4bNNBPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jGH0sIi92egazZz1P07bqWNIVSYYIaDQOBK38OBeOMB828TXSxmOqGEytCo0p32Wa5qEm23W5WwMQBTC9WF0yrwR7sAI24MCuP/oXp/iszw5+oTSulqQ1BZVXWP1SLE3KlNn2gAHKSZWXnjqD/QU6in6NL1bryFsC+1oGjozTFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Hvn1lwir; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Hvn1lwir"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a52874d593so990311f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 08:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749138624; x=1749743424; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JRCqLN5L4Rr3WE8pJIILtJZPUbBl7/a5g9L3/1Mvsfo=;
        b=Hvn1lwirJd9qggJQ5xoWI5LFYst7HV5ityrA7rsdjNxzkAPIBpTjqfjY1KWxr4wV79
         gE+ihtJ+FXEgQI6WUk5AC6rRnQlOGnqqKkasmxFkTdQr4M1dNCGeA00K9U9/KW7Lud1J
         MMJk8PYLCJ16TAK9mTM7LPfMKnAobWv4tUKSgv0uNbwGkva/je25pwKoCH0tem1KH4wi
         TnB/xLzpi3g0H1Sf76oXX0MH9vJrF5CxKe/Kc5X6vHJnPergEeaBjWJEPku2xw/pTeiz
         7IHhtNu7tczRUn0spjpWAa7hUPa7BsbDxTWbkUOy81a3rm2j13Ek5XLxF3uwfVuY6jTq
         /Y1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749138624; x=1749743424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRCqLN5L4Rr3WE8pJIILtJZPUbBl7/a5g9L3/1Mvsfo=;
        b=oo8swOa67LLcY+aCeu+RYXFbEim7gzgSv4TlLtS82x2Ruj0pEWbC0SMIb7U9QFTOda
         Rsmv2PnfDjkIqCiyxoGOg/zjOAyof9xtQr3L0ZYKLLvQ008DoYSyFH8jyuFlYQyGhl9A
         nyCxZGy+gvMlueH0B8n1nQ9qlPpHvw6OyilLigMs695yWBuzxCFuOvDvzg147EOqJzHA
         52XY3wi9XyfESQzg/OVJju5cRdbd23JSn9r0SDHXjuqExmiMDNkXeJVgSM+JD8lsFC0G
         O//vkK6mGXKW1tuDRu3z1p4CM+LEsJUOhur/dE4cBlj/nQSbVU4nOHID61ytuUyWfJ4x
         TFHw==
X-Forwarded-Encrypted: i=1; AJvYcCWaaBqJiKONoCXNoUdpipRn43gbTaJOxu6+RXZ2eb2TN+jTO6xH2JaGrVvuUEexNSyhAARDAl5zLiFQpWo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb/MIvVl7j8eZQOtZ3woFS82ubyHePLJQhCcOLRvxnryYKGLtS
	l47PFH1p6JFNG7J19v+sVJ1M447Eq7HWR77LDxKo1dI/GeaQxr7sY7eVJguQvxYzikw=
X-Gm-Gg: ASbGncsOx7uBjm5bwvQu6MYyBpJB+KeFkPt7ev3tLHV6e2W/erSkyBaXSTWqZBfCPUi
	kcp55zIn04SFaEWfJNhHRx/8OBFjE1d0oxZ8mhLT0A4evB/Myu4BVNpvR2zvlqh4XCD49FblsUm
	na4QVxRfGRlO74Zd85hCi0fPNy0Sz2bTaMY1A4S/GUA0cm1mwq/O39wtHJschKEtM8h+h2AgwHs
	QIOMJxxwwQlnUaByoj2BJri/fzmlfyFxf52lSFfbqktqpfJJoVjH4lDm42pyPnBuJ50Vmafbm7v
	313SG59CT6uyXl70B9LSqogHjtv1MOo6mTa8ipI9MWrG9tiyyo0fuA==
X-Google-Smtp-Source: AGHT+IELoMlwsCu+FjoJVCzoFEowpMUAlbq++KbjZI5GGOu59FebaVIM2y+qSY8qYZiSkvqrwc1U4A==
X-Received: by 2002:a05:6000:220d:b0:3a4:eed7:15f2 with SMTP id ffacd0b85a97d-3a51d96ae39mr6337955f8f.43.1749138624495;
        Thu, 05 Jun 2025 08:50:24 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe7414fsm25349729f8f.55.2025.06.05.08.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 08:50:24 -0700 (PDT)
Date: Thu, 5 Jun 2025 17:50:22 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Vishal Chourasia <vishalc@linux.ibm.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llong@redhat.com, bagasdotme@gmail.com
Subject: Re: [PATCH v2] Documentation: cgroup: add section explaining
 controller availability
Message-ID: <xn2sq6byy2qvylmnhzgzhjuac44t5qnndq5eo2rp23xjndbhlg@oymknwf3cxw5>
References: <20250605145421.193189-2-vishalc@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bayaay3n4q7jtjk7"
Content-Disposition: inline
In-Reply-To: <20250605145421.193189-2-vishalc@linux.ibm.com>


--bayaay3n4q7jtjk7
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] Documentation: cgroup: add section explaining
 controller availability
MIME-Version: 1.0

On Thu, Jun 05, 2025 at 08:24:22PM +0530, Vishal Chourasia <vishalc@linux.i=
bm.com> wrote:
=2E..
>=20
> Signed-off-by: Vishal Chourasia <vishalc@linux.ibm.com>
> ---
>  Documentation/admin-guide/cgroup-v2.rst | 9 +++++++++
>  1 file changed, 9 insertions(+)

Acked-by: Michal Koutn=FD <mkoutny@suse.com>

--bayaay3n4q7jtjk7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCaEG8vAAKCRAt3Wney77B
SXmRAQDPQPSQbPWaqiXwU4vsbDRInrcwQad8DauYGFYkN3J/UQD/RsuAsYUG7+pd
13hnOACyQdZK9AGRKldC1S4PUT8p6ws=
=Vr5j
-----END PGP SIGNATURE-----

--bayaay3n4q7jtjk7--
