Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0653C27055E
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751286837; cv=none; b=Gvrek653qMo3XbXLGlTBzznrcOTyPeO+gVq7+dZDp9tQxvSbXjyavcP36VmVl82/8gYCqy3m2HGGCAK96XcmzeRO/wmUMOF/VfTwbrPYdcU16RZN6iar7OKDWdE96PCkCwE0EFyCbD5yzYhwC1IVjWzJCLdXDJw6rHhvU8q8d54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751286837; c=relaxed/simple;
	bh=gJ0wiD3rWl8CogZdAiED/KOkAPi3Q/uO3S+KjMDCmBY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=r2Ong24xBT0WyrNY8zsKkD2pRvuk/DrlvYmS17frveM265RNK4mI5FiiC4ZkQQ/rH75x/s0j82KAUTyIvuy2N/ywGGQNZR1PcLGRf8Br9qCgnW0Ln8gKqztc+Xbwu7iq2bahgjPPPXVuZthftnNsWyqfhfJpPmn7FrkQJvOdm8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rf795Doa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rf795Doa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751286835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gJ0wiD3rWl8CogZdAiED/KOkAPi3Q/uO3S+KjMDCmBY=;
	b=Rf795Doa4okwsmeuQYg4LADxRBqEQKaSmtTR0mqfXj6zjA954NGYn7HcrllBMAXzwCcaKS
	3/ELOsVCAl5cG2tV1kTDHZ4mav/SE7g6Ax3P922z0giglL9VuDNplJGSrQToruhIJ4pFz3
	IWzQMXEqR4MNOapWHin7P3/b3leigG4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-PV_2HLr5OrKrKdNAEo9RSA-1; Mon, 30 Jun 2025 08:33:53 -0400
X-MC-Unique: PV_2HLr5OrKrKdNAEo9RSA-1
X-Mimecast-MFC-AGG-ID: PV_2HLr5OrKrKdNAEo9RSA_1751286833
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ade70c2cfc1so382366066b.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 05:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751286832; x=1751891632;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gJ0wiD3rWl8CogZdAiED/KOkAPi3Q/uO3S+KjMDCmBY=;
        b=V5eM+iJiDpWw6TKRnyom8N2qHu20g0zpY40kbcM1lfkIBt/E78ETKftfwrpGQ5la3x
         7DUgPwDVViggwoV2CmwFraJZPCgg6Gs6JayYXJcskUVOMdQjCjzdG0ptF0RTSto12Rfi
         X88eNtUDMWhGlq4mAJ9ZVpgw11TTASwkzM5U/jt/uo4Z1Kc/4GDTHh+cCtEF9rdLDpOy
         ZdAv53qoYyP9gPkkPG1VwhsEDyLboEaOJw9uJK5cv5LFU8OuGWoqJUOpWP+51nRPyaNM
         WwLaoFWVofUXiPLTnv6TLYYJDM0vakNA5dVQd3H83sNqjtglqDwhZHYz56QwR5krL/go
         P8gA==
X-Forwarded-Encrypted: i=1; AJvYcCWHje2tcE1jYVQs46lDQO2fxYW4BVwrfYuKTXT3x4dmqwhPfmZRewItaAHkIc8iktAmVrybutxF/gh+6Jw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzlvL5kfsJyKkiRopjx1rVTqfd4n1dWf3u6935jdEAp2pM8tQc
	KiTcABfmNvGcQfpoFErhMEmMzevGnitV6hwrjz8PR+U+PTbAN9zCHht6O/Mdb82LFPOFTxCvuFX
	prLQgB5YR9jiN+SXF6Naj4OYQ1ux0bz0wIsXH+Ou26EyHX3V/Bu1eS6sTwzKxr04afg==
X-Gm-Gg: ASbGncuGWIo+86uhhSiCaBPkBQRhySCMvTbXmPDQKx8Tyr3q2uKhhdaeOO4zP2g/ffD
	E3Cwm2tE56UouHAksG61TImwpdBOh0Q1Qa/hxLWjZPGdh/9eoEWe82M6UaOqBT9udWcyhFkKukA
	bDjuAcUWblht54f9D7ll11pv0KRhXWLYGBgz+MelqH8LTwHhaRBZRDm3Xt1tDj4gMLI5w1HQyF9
	IDa2U4N14ZoZdAw0A6tL7AQNDtvy3WMkGndR4wXUPk1h9U5wrDNp8wbb+EbT8aQPc8H37+T0/AQ
	FCu2BVKqiEEVaUYAeQw=
X-Received: by 2002:a17:907:608e:b0:ae0:a351:49b with SMTP id a640c23a62f3a-ae3500e02a9mr1046995366b.34.1751286832222;
        Mon, 30 Jun 2025 05:33:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcjceK9RvEHC88OQB5r6+jBRwjCnSu1XO6IF/59hEXlyuOAfoc1Cs5C8c3NNtvik13ennRiw==
X-Received: by 2002:a17:907:608e:b0:ae0:a351:49b with SMTP id a640c23a62f3a-ae3500e02a9mr1046993066b.34.1751286831785;
        Mon, 30 Jun 2025 05:33:51 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c01237sm678103266b.98.2025.06.30.05.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 05:33:51 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 14A7B1B37D1B; Mon, 30 Jun 2025 14:33:50 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, Jesper Dangaard Brouer
 <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, kernel
 test robot <lkp@intel.com>
Subject: Re: [PATCH net-next v1 1/2] selftests: pp-bench: remove unneeded
 linux/version.h
In-Reply-To: <20250627200501.1712389-1-almasrymina@google.com>
References: <20250627200501.1712389-1-almasrymina@google.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Mon, 30 Jun 2025 14:33:49 +0200
Message-ID: <877c0th0ia.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Mina Almasry <almasrymina@google.com> writes:

> linux/version.h was used by the out-of-tree version, but not needed in
> the upstream one anymore.
>
> While I'm at it, sort the includes.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202506271434.Gk0epC9H-lkp@i=
ntel.com/
> Signed-off-by: Mina Almasry <almasrymina@google.com>

Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>

