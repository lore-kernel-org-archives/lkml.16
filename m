Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F272459D1
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 09:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751450191; cv=none; b=udczJnzx8xc1ZvQlv//FvMT9n+1oSu7ped8Jj40bVyfhjFmjBbM2OwkIHw961X7wTFqwCKTsp63RqDE12T5+/9m/186Q+wp/abkZ5cUduWlUFCDmfAs6lFp2SEFY3ckV4JnXfZVn4pwY4oIxAefXu5HnEt3G5LBFadMnctOiD9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751450191; c=relaxed/simple;
	bh=R/vqF8mtqR3Q5cYK/qFuLfD77vbI1Wt5cmIml3gcsWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oflpV+y58oA9jbiTEbWaNX5WZA04As+Mea3aI2GqmsIYwRX92FVupUewsHcHkLRIc+7f9uPViyCszm6xbRt5lOTaGIn5fkH2RCNwWFlwIjbLQ6gJqVDz4A4JPq6SUSBRsyJwHDhjatUEFMS88cu2LHrCvPHGlWwDDvqi28Qe+9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GXwtQR05; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GXwtQR05"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751450188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vNl7Ngt3KhiRiuYDlu3AWhmnMill6bJNFUWa6YlfZWo=;
	b=GXwtQR05pERJ4pTj5yZLrDcWZiavDIor+yGTECTxi3pCuLteBxgKk21Xhb8/peb6aVDoon
	RHZRTfGVvkCmusc6d7DtYH+mDEUIallmWbzaTU3bFREldZJuPkuhbX3ZOCcSCniFCxM9NE
	03MXgvGq/2xxpw3YVC4CnqywTsAqCPQ=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-KkmuHVfnPoextfKuiVePbw-1; Wed, 02 Jul 2025 05:56:27 -0400
X-MC-Unique: KkmuHVfnPoextfKuiVePbw-1
X-Mimecast-MFC-AGG-ID: KkmuHVfnPoextfKuiVePbw_1751450186
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-2e8f1365181so3625015fac.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 02:56:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751450186; x=1752054986;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vNl7Ngt3KhiRiuYDlu3AWhmnMill6bJNFUWa6YlfZWo=;
        b=w9VsFdD4yLZr1Q40ANq+BDBt0RdopPhCGU3MrtaNL3/l5A5tv7+3Buz8Lt9jiJdEh6
         h0xLlv+cfhXCFxqihQBqb2O/4dquYC6wbErZ9hQbrtABfCJaco7j0VSZyZHtSpgpxyAL
         PyTWMjbsI5Q2/bJBKsSrS9Mq/jLFC9MFrX9aNSZu0A0A9Nh1OeMcyaMr1EyB6FMTABWC
         Do1Y8yeZuvzFqoKYRWYhkrxoxsQON9yBxGuOQGJV3cIctMowk34+l08VSrP0qGmAjhoP
         0r37tMNiywbFgoBYBGw4GhK2gmna2j03dDXpEZ9T6PKaa5+8R0I49q03Y1+mun/5Ak07
         loqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoQ3szHBVUny2s1nakIthRp0UuoemUs/2ftdTeYSupYQuUWK3bNd8cmdS7jrQHHhTRtK1N7ZefZSNJBMc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUVvTGTdHeZXkd+Ev+WBA3ZhLMc0MkxRMqPrFQJ15QLLLUEFkm
	ouCkbKDj5uEwsKN7YC1nBCA7zrO/olHJGl5MJE3+EP+IRPuKdOTUtwEziB5hPmRtq57qvylywhf
	ZCv5MrNv1pjuqAyFQAEczkM2m6MPPYZe7ME9PB3IK4AlLr+yipXR9VM7TblsciPsKxg==
X-Gm-Gg: ASbGnct8kZjVgNzQCGZB2qBPnHjqN6EtSYHOQfmW1NCmg01VAYczMjK/DcGXp4ImTKR
	uBasBYIgqd/g40sOn67HcPR1mwERLms3tgWGa9ocaLFV4EeNm+ZtmUF5zFCoeQ1wK+x3DmsKR3R
	B0v63tR+hc1LxYQw7tkPuwFOc7XUbCEkRNQnP8ZAeHJFED+yaolXykRq8/cB6RhbtfSpofOAoED
	s2iV44tWXhCoIZZyq3oj6BH9E5YYqaZWyQNrDzaCKBoTqbUx5jWusLhcArIiONVi7+YS2O7etmt
	3EZ/rO4J8K+9TKrxXF+F0haKHo4R
X-Received: by 2002:a05:6870:ac20:b0:2e9:735:91ba with SMTP id 586e51a60fabf-2f5c7c334d1mr1422469fac.25.1751450186323;
        Wed, 02 Jul 2025 02:56:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpqQrlTLKRF3KccZ2PdIYCRT6eIHGjwWaj9AB/7CS8NfzugBebe1UFmRYpDGfYy6NDhWabBg==
X-Received: by 2002:a05:6870:ac20:b0:2e9:735:91ba with SMTP id 586e51a60fabf-2f5c7c334d1mr1422456fac.25.1751450185945;
        Wed, 02 Jul 2025 02:56:25 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.164.126])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73b29fd918fsm1247562a34.36.2025.07.02.02.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:56:25 -0700 (PDT)
Date: Wed, 2 Jul 2025 11:56:06 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: mst@redhat.com, pabeni@redhat.com, jasowang@redhat.com, 
	xuanzhuo@linux.alibaba.com, davem@davemloft.net, netdev@vger.kernel.org, stefanha@redhat.com, 
	leonardi@redhat.com, decui@microsoft.com, virtualization@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, fupan.lfp@antgroup.com, 
	Xuewei Niu <niuxuewei.nxw@antgroup.com>
Subject: Re: [RESEND PATCH net-next v4 1/4] vsock: Add support for SIOCINQ
 ioctl
Message-ID: <gqjvhl6rftfygatheyto27kpbqsfc4hixcv7g52nle6grjkrkq@f5ey4iyu7swl>
References: <20250630075727.210462-1-niuxuewei.nxw@antgroup.com>
 <20250630075727.210462-2-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250630075727.210462-2-niuxuewei.nxw@antgroup.com>

On Mon, Jun 30, 2025 at 03:57:24PM +0800, Xuewei Niu wrote:
>Add support for SIOCINQ ioctl, indicating the length of bytes unread in the
>socket. The value is obtained from `vsock_stream_has_data()`.
>
>Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
>---
> net/vmw_vsock/af_vsock.c | 22 ++++++++++++++++++++++
> 1 file changed, 22 insertions(+)
>
>diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>index 2e7a3034e965..bae6b89bb5fb 100644
>--- a/net/vmw_vsock/af_vsock.c
>+++ b/net/vmw_vsock/af_vsock.c
>@@ -1389,6 +1389,28 @@ static int vsock_do_ioctl(struct socket *sock, unsigned int cmd,
> 	vsk = vsock_sk(sk);
>
> 	switch (cmd) {
>+	case SIOCINQ: {
>+		ssize_t n_bytes;
>+
>+		if (!vsk->transport) {
>+			ret = -EOPNOTSUPP;
>+			break;
>+		}
>+
>+		if (sock_type_connectible(sk->sk_type) &&
>+		    sk->sk_state == TCP_LISTEN) {
>+			ret = -EINVAL;
>+			break;
>+		}
>+
>+		n_bytes = vsock_stream_has_data(vsk);

This patch should go after we fixed vsock_stream_has_data() for hyper-v.

The rest LGTM!

Thanks,
Stefano

>+		if (n_bytes < 0) {
>+			ret = n_bytes;
>+			break;
>+		}
>+		ret = put_user(n_bytes, arg);
>+		break;
>+	}
> 	case SIOCOUTQ: {
> 		ssize_t n_bytes;
>
>-- 
>2.34.1
>

