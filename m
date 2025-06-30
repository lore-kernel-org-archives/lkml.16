Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B025827055A
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751286843; cv=none; b=HWDk0DedIVsHyzyqrN8YAh0aqidusEU86TCY31rfoQ1YTGsgy+2Z9vWdSfbctmINqoSFWpPtDPhpqxVPnK4X06cVMkKhBETtx0zSkK8RqIynq6EPE0lHouFLRS0N5BqNudh5grB9Ter5p/7DzsFoLus8MRqkVI4WZfUAMa+ph5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751286843; c=relaxed/simple;
	bh=Xr7o+AhIe8W/kujSZ0TmudTZC8WByMRIydCsP7iETVg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HuxrKy0lzENwVC2B+mrqnj8S0fslOTlcsjNBqJ9w1LFse5JUkxE8A7g8z/9wwmXcduFDuOwmBTdG6pO1muV6cU5m3kiH0rQD2y0VTJeyqNcSrPmlmi2ttLfFQwM3Vv9dwXwMxvLBK4wICp+T+iiAqbjWzv4m2n36e9nJBkwTn5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jIV0N4bX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jIV0N4bX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751286840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xr7o+AhIe8W/kujSZ0TmudTZC8WByMRIydCsP7iETVg=;
	b=jIV0N4bXeoyT083KM8zGjNDh5NxA0lW0YvRB6j6AbBklYkJcVovEgTmTxupADHk6fQ6hx3
	bKHT8MF0QpA8NljHGCVOxXT2P3msJ8Ef+M2bQuaUadzspLahOpXavZd81f4ePNu7Xag2e6
	e+B36rksMPz0pfhoWD/KU8c0IwhfiuA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-spDXMkUNP6WhF0iWVptYKQ-1; Mon, 30 Jun 2025 08:33:59 -0400
X-MC-Unique: spDXMkUNP6WhF0iWVptYKQ-1
X-Mimecast-MFC-AGG-ID: spDXMkUNP6WhF0iWVptYKQ_1751286838
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ae1c79fb8a9so283828866b.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 05:33:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751286838; x=1751891638;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xr7o+AhIe8W/kujSZ0TmudTZC8WByMRIydCsP7iETVg=;
        b=ts+2jTKrU93UuvZaLJg2eFUZbj03Dnv+zJY/HJ9B+93LzRkaclDYFaT9hmoXf30ruO
         kVAS8W73lqSLklISzSXsh8gykWsRC+9P6+/gIRmiwL2L54zBUWPquV4twTBPGWkddPHS
         5pyxJIui1ycyGIf0DdN6aKM47qwymI0TExddWdaRV3f8Wq1x2O8KqiEO3VRc7/wHjiiH
         EjfLTaoVuU4TZT9DYj6YzO3QZH8g2HARZcsZ9c6BkfW5SbaFh6+fH/wRbhl8+kR4c/2T
         utBSkHpGjaBgWQqmC/wBRlPsYte4K3g1OVsBQqCjjPe5iHdNoZVMN8LiGng5oChMuBOW
         NwjA==
X-Forwarded-Encrypted: i=1; AJvYcCUzOgD8KwZNWGxwHf0X0V4i/uZkvvRfj2RzBKeFVvCm5t7Ryqs/vYidr0eb4taK90CgimiWjgaiNCAMtxU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYMhRpwxttOyYbj6cGzj5WOD9y5BdVvW3MM07gyihMYUD5WLxu
	huKQH6UtTH9oYG8s1qi5Jt0Kod9kKmoj6CkObkvq82Fh+ObH/GLQwI27iU/KSuLxCk9zDsuDD0L
	y4IhzbRrTU4G76BKX8pFfpJX8YXVzNPNQuZ253socfLnIS8sh6k9IKXaRy5s7VgoHFg==
X-Gm-Gg: ASbGnctisgVDJYDA2F4CoyXBZbjJxiuWoxDWX3rOg1oU2gm5BvhKBYwzjev30T1szWY
	NKKpSWZEuegxHTOi0ytz5rc6FwV/Q9zlTdfNt5J1mWwd5csTRz5xBBYg35qNYsJ3ncS9L65ybv0
	E04JYj+Lc/68BaMdZp6pQVnNSaFmF8iLlZZrnJbrLgOxBqdQknEPKO6s2WYiF2rrAE2zMvOVGAn
	aLfqI1xpMhau41re6hjGEWJ2LomlZDwr08VsB8Wu+lGumcyF+Xh42yMcdTgV1ZOI0oAw0ftepL3
	d2NY42VS4c9XDeUGRxo=
X-Received: by 2002:a17:907:96ab:b0:ad5:2e5b:d16b with SMTP id a640c23a62f3a-ae34fef316dmr1364967866b.27.1751286837867;
        Mon, 30 Jun 2025 05:33:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuQ/3n2JvnKt441v28aLfjQg9cxjikB7S9KyuXgCMAmI7U/YvHsnBgQ7OKUwQQwaMZ+a9ETg==
X-Received: by 2002:a17:907:96ab:b0:ad5:2e5b:d16b with SMTP id a640c23a62f3a-ae34fef316dmr1364963966b.27.1751286837372;
        Mon, 30 Jun 2025 05:33:57 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6bd2dsm667503966b.113.2025.06.30.05.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 05:33:56 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id E0FEE1B37D1D; Mon, 30 Jun 2025 14:33:55 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, Jesper Dangaard Brouer
 <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, kernel
 test robot <lkp@intel.com>
Subject: Re: [PATCH net-next v1 2/2] selftests: pp-bench: remove
 page_pool_put_page wrapper
In-Reply-To: <20250627200501.1712389-2-almasrymina@google.com>
References: <20250627200501.1712389-1-almasrymina@google.com>
 <20250627200501.1712389-2-almasrymina@google.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Mon, 30 Jun 2025 14:33:55 +0200
Message-ID: <874ivxh0i4.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Mina Almasry <almasrymina@google.com> writes:

> Minor cleanup: remove the pointless looking _ wrapper around
> page_pool_put_page, and just do the call directly.
>
> Signed-off-by: Mina Almasry <almasrymina@google.com>

Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>

