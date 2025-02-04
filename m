Received: from common.ash.relay.mailchannels.net (common.ash.relay.mailchannels.net [23.83.222.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479FD13A258;
	Tue,  4 Feb 2025 09:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.222.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738662951; cv=pass; b=VNoDfOTukyvhTiYltFg08Sw1Z+aWZdCijuLCm8KkLRWK2Rm0sPXGbBwbyKAZ8Y30z+3V5kRlc0oda5vp3tJbWY+ESQOet78ljpKvF8QSWlE9uz9FfQAU9oSKiPuFYyOyjFBPd+31M5zhRpZLy229mo9tgGNGmi9Lb1XDMOBMBek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738662951; c=relaxed/simple;
	bh=leCM//w8m7SIGivS0wwRw7YlTdHUZPVYAQ52is56yZE=;
	h=Message-ID:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Date; b=J1C8HNnscgYcK5eREMMU8eZgq4D+vaNJlar0lH49kNQovAINoWO/g0j21KOb6q0CtGZVhU5jdG3zaoWsar2idN+tT6Z8NNGu2FE8prpHECCHLek/O0sHT4SOTQdsbN/HNX0unZxYPACX2TZKhywF3NcqBSON3m+QIzjb4gK1p98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arinc9.com; spf=pass smtp.mailfrom=arinc9.com; dkim=pass (2048-bit key) header.d=arinc9.com header.i=@arinc9.com header.b=dQ8p8nQ4; arc=pass smtp.client-ip=23.83.222.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arinc9.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arinc9.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arinc9.com header.i=@arinc9.com header.b="dQ8p8nQ4"
X-Sender-Id: hostingeremail|x-authuser|chester.a.unal@arinc9.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 614E88C3422;
	Tue,  4 Feb 2025 09:48:31 +0000 (UTC)
Received: from fr-int-smtpout9.hostinger.io (100-122-225-139.trex-nlb.outbound.svc.cluster.local [100.122.225.139])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id A419B8C19D5;
	Tue,  4 Feb 2025 09:48:23 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1738662511; a=rsa-sha256;
	cv=none;
	b=ko83ZFeJZCLnfCNv8oLWWhlRyLlzi0S5YK41WCDB0nKycAAb4ZGNeCHd2k7Q+gMYT8fQy/
	E3kYSa9/WC4+Nm2LIg57h6c0lMvAJRMxALuLNvbg9yRrWMOXEWTHJw7b2bl2HgV0Aw18g8
	qZAyXdOA+PFBqNnF5P7LewBFikSsw1S3v45ubhPtGxyFbhpjp/YJhnCty75x+iNl7nLxsZ
	YjRCrgNVPyvnvhI00oz78Hv/LOTyRATZ9pPhUb1+NoYlnDdcsZ9v0L0ScdbHxS5sk9vvKv
	7KMFVKXh/4cvzyTqVB7R9zvzNkvdeEQS7pzJeiSvQoqXCp5GWOSY/0sfTl7nqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1738662511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=dmUwV1+lkQOftGoMtu4xLI3tP41KkWphDDQnQXVrr6k=;
	b=RRBoAm1LDbyKoK8e2rSN/1vAJIDb2XckyysnmkAy1D0rpiwqwtCoj2BfCwMob28GhZOHod
	mCvK39dX0PVenyzy/TXJRIGbpRqKuLFp6y3rAL3DOf6L9uh3AxieeGl3KVi8CtpdvTEYCo
	P+Ng1Hkl26s04dgvYRNNZoNQNEbuh0Gr0mZTZ/eRTyq3TEg5GSZcFnQj/fcXmKYxXuS2pE
	TUwbohgBiQUFrNeYnJqbvXFYwtPSLxbHVPvTxc6H4smuNPhMTLnWzHzdooTInaIPNGgfxl
	FVnEbmXmPTsZZRTzP02+agUbw0JXgULd6X2v3Y+k3z58LVxdXCkJwvjfP2pxsA==
ARC-Authentication-Results: i=1;
	rspamd-854f7f575d-2jbtq;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=chester.a.unal@arinc9.com
X-Sender-Id: hostingeremail|x-authuser|chester.a.unal@arinc9.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|chester.a.unal@arinc9.com
X-MailChannels-Auth-Id: hostingeremail
X-Turn-Hook: 36a03b8123b2479a_1738662511257_1804304046
X-MC-Loop-Signature: 1738662511257:883016486
X-MC-Ingress-Time: 1738662511256
Received: from fr-int-smtpout9.hostinger.io (fr-int-smtpout9.hostinger.io
 [89.116.146.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.122.225.139 (trex/7.0.2);
	Tue, 04 Feb 2025 09:48:31 +0000
Message-ID: <55228e28-9370-4eca-8ea9-cc836a066254@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com;
	s=hostingermail-a; t=1738662501;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dmUwV1+lkQOftGoMtu4xLI3tP41KkWphDDQnQXVrr6k=;
	b=dQ8p8nQ4zNtwbeWCLAgFD2mJ4ZKSE5vPtWGmXv3xFEGxRIeowT0pJhoXNZRLifJ0nQbwwO
	ieFaTGjhr+A9E8n0u7K41hxphVBNZ73HzE+HkFBfqn4OJoUstmhi0+h/ladVfCSbHXzocN
	z2wSihbR8UNpYABN8bElt2HoVgkn6q/CqeOSZSXJKFgkrgxh8UgTmKnAoEOaVu65IHjUeU
	YUC22wDx8w5qFIuUBdTOviofFlZo4TYl87uEr1iL+rXOlqAN4i+ilaEYZkzegeMDI3AfXE
	N5CYE7groeWOKfXYorhxrXb7nXyiPgz3CfPDPbaoot2zdb4Rb3bDJnN66lAyCQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] USB: serial: option: add MeiG Smart SLM828
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dwayne Du Preez <dwayne.dupreez@xpedite-tech.com>,
 Alexander Scholten <alexander.scholten@xpedite-tech.com>,
 Zenon van Deventer <zenon@xpedite-tech.com>
References: <20250124-for-johan-meig-slm828-v2-1-6b4cd3f6344f@arinc9.com>
 <6e2c4db7-1325-473b-9999-2b1ada418119@arinc9.com>
 <Z6Hfx4KBeVHCNQVS@hovoldconsulting.com>
Content-Language: en-US
From: "Chester A. Unal" <chester.a.unal@arinc9.com>
In-Reply-To: <Z6Hfx4KBeVHCNQVS@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 04 Feb 2025 09:48:18 +0000 (UTC)
X-CM-Envelope: MS4xfK8s6hRN5GvcZHLwc9C1QdII8ajxror0DIA13KNqBwq/xqgth+3+M7vawk5dr3Lv5mgP+l0d2bRQWEN6fT06Hs4onf1jgLYvCb/g7sXtaXJJ0DY/kp1y Xa+aRL+n6BoPSjZbqnixnr1WqRW6GOmCAKlPtp+EvjGfcOJMyy65/uLgmVy9zb+wIUwm+N0F7HjuDn6RGfk6VOiUn1eltSwpbOS0j2+VQYp425KXxg14EZqW TsYYXmkhrhKWLJUTYa0t95uDjYBGO6mcqudzV9Mk266Gv2D94AL+MI/YQIppXqaDkAikY3A3Ryl3f97Rzjm8JnOtrFtirjcy9G905yHSx5+ldwDl+FL5GyjG sQImDIyPwMkjM8swyZjdRUdpVt0izw05Jg0dhZdO6O5DXCmJmQ6RStlXnL36EMML08kbHBCb5aQ6TIX7qMLQfwshMer2LQbQPr6lmGIajEMyZkrNU4U=
X-CM-Analysis: v=2.4 cv=PMNd+uqC c=1 sm=1 tr=0 ts=67a1e265 a=xK2r8zoKF9vSrBIo2YuqYg==:117 a=xK2r8zoKF9vSrBIo2YuqYg==:17 a=IkcTkHD0fZMA:10 a=A6Sy_z46XarSiW2s0hoA:9 a=QEXdDO2ut3YA:10
X-AuthUser: chester.a.unal@arinc9.com

On 04/02/2025 09:37, Johan Hovold wrote:
> On Tue, Feb 04, 2025 at 09:15:02AM +0000, Chester A. Unal wrote:
> 
>> A reminder for this patch to be applied.
> 
> You submitted the patch during the merge window which ended two days
> ago. It's still in my queue, don't worry.

Thanks a lot for keeping an eye on it, Johan. Keep up the good work!

Chester A.
