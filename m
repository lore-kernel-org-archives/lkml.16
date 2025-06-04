Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF861FAC4A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 16:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749056127; cv=none; b=DRSS7zScKCfjJS6IGhe5r821UPXArWN4zQJZMvJJ+R3sD59WgnRfkWb2281ZhQyj6Ef6jeq1V+nCaHpCAnmxCh+DUYuFnAhtNQ4do7IHCBWPzXgTV6l5OXgMWt7BmRtWVctXITuwrADYKk/v9j99SpRIdaNJupFa1VDzh0TEm0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749056127; c=relaxed/simple;
	bh=EnhN4jFQnJm7PRT0iNbSmd2PcRrtPdhuDjTVGsmqhS4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oZX1f/pHebqVRhev5rK2Tw4d6O3DmEol9PfBSu9UAxr6U6k+Aj9q1HFqXcEb1z91Sj6eMlVzIfI0zt7u9ToxXQyKN/3oOAok0dqqgOYW5VjBgRZQ+Y7V8ly5MRRrjyE2oIV2sJ9UDV+AuAzOhYVWLOBXTZ51Lh/rP3VyYjRcI1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e+JY7lRk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e+JY7lRk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749056124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EnhN4jFQnJm7PRT0iNbSmd2PcRrtPdhuDjTVGsmqhS4=;
	b=e+JY7lRkeEFH1WDkkSgZX4cdKUaYz14uMpxSe9UBmezBezA3Yqe9f7NAjfna6JLgne7K6B
	lWXypxLVS7i0Z7/qt4PV5S/aLiEATVaF1QOjSkQhpxI7wWOf8lWFI1XGLfzw1m8QfqqEsN
	0+aesdrky074C/w2gOD6czvCu870s7w=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-50-NIooSwK4NLedkY1Et2X7Yg-1; Wed, 04 Jun 2025 12:55:23 -0400
X-MC-Unique: NIooSwK4NLedkY1Et2X7Yg-1
X-Mimecast-MFC-AGG-ID: NIooSwK4NLedkY1Et2X7Yg_1749056122
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-60498322443so7171407a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 09:55:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749056122; x=1749660922;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EnhN4jFQnJm7PRT0iNbSmd2PcRrtPdhuDjTVGsmqhS4=;
        b=Iuv/lWWnWXW8ibUOHUqv6ilP0QIVVK/DKxlCcrEH7xgKtYfM1lOnRYvyOd7xnoU82E
         nXLWXovsFDEnS1Wes3aBVgsVOOaCARfPF9yETHT2XtdaaTdRnCmJgy2dipuEnBEZMHxE
         xIMo7Q4YGxBgNwSTAT+rGH5++atzNsgb39YRL3LhbFOxo7T0ZI5sVnhhXhYh5JFrm9sh
         MWN2wai7esyhAAdiEB1VkCbUhv3llq1kYsNCi16k1lSPa60THIWAKij14G3zVxbqpJEP
         Wffm/tKSnDsQiWQhXtaVzqNb7f9ZvvQ3ySSdMFwl+WYBkBz1k88Ta5XxIRamGn+pm/J2
         9IMg==
X-Gm-Message-State: AOJu0Yyh0yn8x6pKUiyy3/zNtBQF19ExSc++UbMDKL5Lm5Uq+1ECK4hF
	T2OadO56yoxGlcLBvB66xwUWtgOBqqnA0tNv9pVWFkp/38vpeFPGlKNXNE/vkmG9wHhoS7en2tO
	zZqv7/c4OEBEsTeLBQqgF2Izy+Yf7K0x1VOOTEtjYhy8XUhuml07wFxpjqCoCo/xDCQ==
X-Gm-Gg: ASbGncsgU0ibn8SEFPNnWJUXtz3x4OK2Klb77tEtXpNK6hi2GfaGPruSvEBaIaXu6JP
	GuWvFkyW2JsaCyBMuTQWH1oFIIAxrs+yGycj6+djGailTsuzFVLTAjy3RL/VEsA+LXYhpcYfF8m
	Ve7ryEyxyY8YKBWEFWQ/U/jxe3YHzb0Xpc4qLsZ9KubOwgCPPcz4rVh4fkjbjbA56jQsiOf1Tn3
	MbcABsdr81rw3seBKGF2vmMU11be7GNs99xYwdhO9KJFgkOIVHIVznxkl6fZR5pHSGT+vXJP7Pz
	otM64oSz
X-Received: by 2002:a50:9f8a:0:b0:606:f836:c656 with SMTP id 4fb4d7f45d1cf-606f836d433mr1955694a12.19.1749056122169;
        Wed, 04 Jun 2025 09:55:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+BjJ2HDUdmh+5/RYHtCz7LviWdEXcE1ZllvhVdcERGB6/R14KgQ+G7LcqUq87LQrs0WIhnw==
X-Received: by 2002:a50:9f8a:0:b0:606:f836:c656 with SMTP id 4fb4d7f45d1cf-606f836d433mr1955643a12.19.1749056121651;
        Wed, 04 Jun 2025 09:55:21 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60566c5a8f1sm9163889a12.20.2025.06.04.09.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 09:55:21 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 0ABE61AA9160; Wed, 04 Jun 2025 18:55:20 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Byungchul Park <byungchul@sk.com>, willy@infradead.org,
 netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 kernel_team@skhynix.com, kuba@kernel.org, almasrymina@google.com,
 ilias.apalodimas@linaro.org, harry.yoo@oracle.com, hawk@kernel.org,
 akpm@linux-foundation.org, davem@davemloft.net, john.fastabend@gmail.com,
 andrew+netdev@lunn.ch, asml.silence@gmail.com, tariqt@nvidia.com,
 edumazet@google.com, pabeni@redhat.com, saeedm@nvidia.com,
 leon@kernel.org, ast@kernel.org, daniel@iogearbox.net, david@redhat.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, horms@kernel.org,
 linux-rdma@vger.kernel.org, bpf@vger.kernel.org, vishal.moola@gmail.com
Subject: Re: [RFC v4 09/18] page_pool: rename __page_pool_put_page() to
 __page_pool_put_netmem()
In-Reply-To: <20250604025246.61616-10-byungchul@sk.com>
References: <20250604025246.61616-1-byungchul@sk.com>
 <20250604025246.61616-10-byungchul@sk.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Wed, 04 Jun 2025 18:55:19 +0200
Message-ID: <87sekfv43s.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Byungchul Park <byungchul@sk.com> writes:

> Now that __page_pool_put_page() puts netmem, not struct page, rename it
> to __page_pool_put_netmem() to reflect what it does.
>
> Signed-off-by: Byungchul Park <byungchul@sk.com>
> Reviewed-by: Mina Almasry <almasrymina@google.com>

Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>

