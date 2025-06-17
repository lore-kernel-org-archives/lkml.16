Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5372155C88
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 21:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750197420; cv=none; b=dXICcufOs2nui179eixP2acFB1TYEBm4dWB2BDusd/DdFzeTYYE16iOijyeZPxloAafK+S/sNDJftF6GjzTvYXms+4q7/jeH5jmhoHCzFNw7qSWWOQmdx+kKtBxJ5kaO/mdYaNIve+uPiE1f4OaztpMgdolvxAEL46MW+sjR/V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750197420; c=relaxed/simple;
	bh=Kp9DI+2v2LShpJweRToRLsuNXfdRv2B57tjdewX2aF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rBuAIL1HX8A2NOOWfrbap/PrxzP77KZw+hz6eix/GbYJwDxzkuPzF/g9F/V5UU90cI+fC2GIHMlpFKDQvgsj6WO2oJ+YgAegWnNMmd+WRwjynromM34hrIF5WlVxaYhozOtD7CmlfFj3ym4lfbKkJktHFkA1roxQOFchJX9MwJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ic+AaCtl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ic+AaCtl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750197417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8MAberZB82Z3SmBMhm5B8kfRhyx/yzqVg3f57rHIguU=;
	b=ic+AaCtlLf3EuHrXyZv23CMjW/89gw2c2D1jmT9rYGejrQNgHx34v/BxL2tkOXkuY2Qebd
	C7kaXxbLYPTkmLaRlBj0KJf97oFLRkGlh/ueZfrfhOtTg6CvVZ0vEoMJbn90cFZBjRsJyq
	IfCYDpMzEECyS0oXhE+onZQu2Rwhrs4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-oKYcMawtPN6do2GINOGwiw-1; Tue, 17 Jun 2025 17:56:56 -0400
X-MC-Unique: oKYcMawtPN6do2GINOGwiw-1
X-Mimecast-MFC-AGG-ID: oKYcMawtPN6do2GINOGwiw_1750197415
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4eeed54c2so3941865f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:56:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750197415; x=1750802215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8MAberZB82Z3SmBMhm5B8kfRhyx/yzqVg3f57rHIguU=;
        b=ivIWb3fNA38BOMTS7YX1Y7OPzoNijDXLzeMVID/eZ+96HpVWwanl0evyDXqYOZdlVd
         WVX7pg5RUePCSIEl4cCAxAX7kyHi4nETJW4+IKqaylxyNiGwxjCiazHS3ovb+tgYS8LU
         oEFexpkoM0Ho8SwBPtWFXLIwVhU6HfVO4/WuiMxzyOPQRkOJWtdn9tm+vmt6UxejgQFC
         csG/JPaYJFhLDOK+a08s9zjgwLMip33suoRbRDJY9UR/ctZDDGyvelvkHvNSs7d8gU2N
         a/tkCjoNPVeShNDJ7InstyPrN//unl1WWtKTSYfRmVUZ/mFrAbjE8W00v06OdBZcRWaM
         o63Q==
X-Forwarded-Encrypted: i=1; AJvYcCXvpDjEUNesZCaqtV9YLBFnmYEeCE/ImDxGKcynBIURL0lAzLGVJu7xll9Dso+FayJwb7tg6802eXC/erQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8uLEITRklpxNxNOD0V9KvnUeapTzPliTik1OKSHg6iO1n9Ed3
	PQCeCTiqsf3d865omn6kz5lNSVil9bOCqhUG0lZzwtO6DNN8n+m9ZutdSaL36nX5B/mv1d9xQ4l
	rSkrafrNMnPzYzq1lE9l/kgIxwwp3kWQWGn/YtwHIa++2kWrUJpKliOiGfAZhTB0jvw==
X-Gm-Gg: ASbGncvNwl0FI/l6rRUHJWJsEAOD760+GD9y/qH8lkrnLEGyQHQEqhIFDFcr8zxZzJu
	iGUf0wFLqsLdWGMQe9wO5YWJi3qWLK0EozpzfRZWPn+BbC8IEImEKbr7zLf0dDkzoJp/9ZPkjRM
	RIq3+/NITlgQaImbILsWwSAmw2N0F/tTMpM5es9dMiqLDBkBhCdhmGtPs14VU7k0c4iFgTDV1l8
	KTy777Q+FS5H2LXy+Y9JB021wbrrhuUyIY71qi2YFU9S+RFq//8xofIwW3bmm5s5rFVaKCu5wxw
	wLsCJBJEdY2zoEwMrlMtlYGza8eYtCpIN7Yyi3WSRDdZosspvuqoPWNzl31VL3BBfotJcA==
X-Received: by 2002:a05:6000:25e9:b0:3a4:d994:be4b with SMTP id ffacd0b85a97d-3a572367d55mr11055142f8f.1.1750197414926;
        Tue, 17 Jun 2025 14:56:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiebOmEYk+uqov68RgYSGzETTCjeLdec14dBe0riZts1tKLupIn7pTXi12Ct4usn7f1R5b6g==
X-Received: by 2002:a05:6000:25e9:b0:3a4:d994:be4b with SMTP id ffacd0b85a97d-3a572367d55mr11055124f8f.1.1750197414493;
        Tue, 17 Jun 2025 14:56:54 -0700 (PDT)
Received: from localhost (net-130-25-105-15.cust.vodafonedsl.it. [130.25.105.15])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c4e8sm184972735e9.3.2025.06.17.14.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 14:56:53 -0700 (PDT)
Date: Tue, 17 Jun 2025 23:56:53 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: Ratheesh Kannoth <rkannoth@marvell.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, linyunsheng@huawei.com
Subject: Re: [RFC]Page pool buffers stuck in App's socket queue
Message-ID: <aFHkpVXoAP5JtCzQ@lore-desk>
References: <20250616080530.GA279797@maili.marvell.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oKdl6g1Fns34EoZE"
Content-Disposition: inline
In-Reply-To: <20250616080530.GA279797@maili.marvell.com>


--oKdl6g1Fns34EoZE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi,
>=20
> Recently customer faced a page pool leak issue And keeps on gettting foll=
owing message in
> console.
> "page_pool_release_retry() stalled pool shutdown 1 inflight 60 sec"
>=20
> Customer runs "ping" process in background and then does a interface down=
/up thru "ip" command.
>=20
> Marvell octeotx2 driver does destroy all resources (including page pool a=
llocated for each queue of
> net device) during interface down event. This page pool destruction will =
wait for all page pool buffers
> allocated by that instance to return to the pool, hence the above message=
 (if some buffers
> are stuck).
>=20
> In the customer scenario, ping App opens both RAW and RAW6 sockets. Even =
though Customer ping
> only ipv4 address, this RAW6 socket receives some IPV6 Router Advertiseme=
nt messages which gets generated
> in their network.
>=20
> [   41.643448]  raw6_local_deliver+0xc0/0x1d8
> [   41.647539]  ip6_protocol_deliver_rcu+0x60/0x490
> [   41.652149]  ip6_input_finish+0x48/0x70
> [   41.655976]  ip6_input+0x44/0xcc
> [   41.659196]  ip6_sublist_rcv_finish+0x48/0x68
> [   41.663546]  ip6_sublist_rcv+0x16c/0x22c
> [   41.667460]  ipv6_list_rcv+0xf4/0x12c
>=20
> Those packets will never gets processed. And if customer does a interface=
 down/up, page pool
> warnings will be shown in the console.
>=20
> Customer was asking us for a mechanism to drain these sockets, as they do=
nt want to kill their Apps.
> The proposal is to have debugfs which shows "pid  last_processed_skb_time=
  number_of_packets  socket_fd/inode_number"
> for each raw6/raw4 sockets created in the system. and
> any write to the debugfs (any specific command) will drain the socket.
>=20
> 1. Could you please comment on the proposal ?
> 2. Could you suggest a better way ?
>=20
> -Ratheesh

Hi,

this problem recall me an issue I had in the past with page_pool
and TCP traffic destroying the pool (not sure if it is still valid):

https://lore.kernel.org/netdev/ZD2HjZZSOjtsnQaf@lore-desk/

Do you have ongoing TCP flows?

Regards,
Lorenzo

>=20

--oKdl6g1Fns34EoZE
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaFHkpAAKCRA6cBh0uS2t
rJciAP4kr3mXRHurFuZcWturaTMGISYAguYrukCV8U9yWHjsAgD+MxhlvONcverh
W/NGSNtKhX38Yr5Ys0hqEb1xMzSGjgI=
=Y9Ae
-----END PGP SIGNATURE-----

--oKdl6g1Fns34EoZE--

