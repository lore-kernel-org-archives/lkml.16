Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020CB29C32C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 17:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750698123; cv=none; b=mgViApBIW8F16uTXM0wKxfThNJWQqwOQCk1CSOHGxs8xrh+PY/m9BIbjCyroTD2+RW1soav9rPI/dYgpK7+YnI+jnECnfhavIx+WrBLlPu9owuneWDo8TT25Xd8JIBNiHPai9g1qu57VUhSP1hOIYBQzhkRl4bVOet+yz6j1GW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750698123; c=relaxed/simple;
	bh=taqM6M2yCTAkigZXwCzc8+OLPoroFfNThxW7WCtpr+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G5m5/LRNliCSMQvHmmoZBhUrQmF310aVomKC2las8eUXR8q3l+0NXMx2dr9n3sepL7IJw+f6Jqsv1y0iGhqacQDDNLkB9DJA/FoLUsonM1759dcrSisAIxXBv3WT4EBcySHiih+6SFa8oTrSgfp4mXecn94k4YsQCu8i/LNJmBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=awlvsOOx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="awlvsOOx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750698120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jq5JtTNSTi3UbB2t2zf1v906mYuPWMRbjCVCINzsyvo=;
	b=awlvsOOxrswfeet6OkNH1cd8KlJrN5amsr1/EM6//haKobUJTg3awi+3vd+ayRd5AhKBsF
	M6NLuwAAcN8OyhsPwDOKvI0yTY1a4XyrNH0CQtsoxI+r2LQ94CmscYjkO4tcSJUE1E93qb
	xiTjKFmI5HebRnILryiMTlfrf6maaP8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-QY4FUpeRPK-J17016oSH2Q-1; Mon, 23 Jun 2025 13:01:56 -0400
X-MC-Unique: QY4FUpeRPK-J17016oSH2Q-1
X-Mimecast-MFC-AGG-ID: QY4FUpeRPK-J17016oSH2Q_1750698115
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a6df0c67a6so1103762f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:01:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750698115; x=1751302915;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jq5JtTNSTi3UbB2t2zf1v906mYuPWMRbjCVCINzsyvo=;
        b=khaM6ATZ3EDdwqlvxw1tkU8yKAnH3e9sWiK92Xo31u41ELv1uUc2eDncG+SybEXpBs
         xnVZc1RmwSQqmvziJj0emsY6jHp5XE+ug+3OhLq06c0+t4vMTvmYXNXZo1bkL/ipjENt
         FfE++tdxIkyhEKXvJbdp7kMt666kCsGOFyDQ+CHAiGqITsY+KJkaWhLNKF4b+8IFY63p
         7/C4L6EcGRut6w+sZfn0OtFk71ng+NPgQ0Mq+J7gzv6B3jlixCEbziJOGqQpNoBSK3YI
         EVjpqW2hVBfuHWU7Ar6UDDBmoLDr0rXoWOM5v8wPX0h5uvvCRSPuYDB5HBz+C9HKOU6Z
         bYbA==
X-Forwarded-Encrypted: i=1; AJvYcCW9dX+pR7QE9zwN+KO1kAt1E4lq3r8wkPvmemxoqznU9F86Wy+sDXuerMFoBKxdbYKvgS3i1xGQ1qJGslM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCkcEso4KeO9UIvx6mPpMXIgMRR816ivhlrTrOh6K9yXFoDhPF
	oWW7Oom2VUaft8/0T1qbN0p+RHMmlj5BIiKblqZR3VBNoz74AwJFWmFCLd9j5asXmeGOzgn0wC+
	IBSOrJZFgRycnHSfrI0WoIngKRpZve8fBG0X1MB5MvLS+elsmeFJ5/ePGD8B8fXrqNA==
X-Gm-Gg: ASbGncuGB9lv5RYM7utazUfK9NAA1p/ElrsGi4wWzT1UAWBn9XoWg28oH3q1+sfy4sS
	AEI0thxm52d+xEyo9uWqhabSrrzjByiRQxft9LP/rIEL4Hq5HUGTAz3CrChTPU5YxQM857AL5tJ
	fjsbtOe/EB6xe6RU3FM6tBsw2l0mcAlU//M5zKer+Qro/GPuXnUmUtZ9piUrIzpsW2pi9mxCol4
	87EVL2rjosd4mZS1n2r8DCbYkFqN44YWUPAPAtUUIyvLSEoZENCXT5Ai3Joxmuw/Jr6KoK0pruX
	JAfJyDjvdGKqN+1X/5WtjeaDgXA=
X-Received: by 2002:a05:6000:288d:b0:3a5:8905:2dd9 with SMTP id ffacd0b85a97d-3a6d1331316mr11150046f8f.51.1750698114868;
        Mon, 23 Jun 2025 10:01:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgLc1G5fHA+5OCdohy+RX20t3SZJ3zi/U76KcD2RoeCTL1jtFDfjcLkndhINDFJCXPqEyFPQ==
X-Received: by 2002:a05:6000:288d:b0:3a5:8905:2dd9 with SMTP id ffacd0b85a97d-3a6d1331316mr11149981f8f.51.1750698114073;
        Mon, 23 Jun 2025 10:01:54 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.144.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f10411sm9667235f8f.1.2025.06.23.10.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 10:01:53 -0700 (PDT)
Date: Mon, 23 Jun 2025 19:01:44 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: davem@davemloft.net, decui@microsoft.com, fupan.lfp@antgroup.com, 
	haiyangz@microsoft.com, jasowang@redhat.com, kvm@vger.kernel.org, kys@microsoft.com, 
	leonardi@redhat.com, linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, 
	mst@redhat.com, netdev@vger.kernel.org, niuxuewei.nxw@antgroup.com, 
	pabeni@redhat.com, stefanha@redhat.com, virtualization@lists.linux.dev, 
	wei.liu@kernel.org, xuanzhuo@linux.alibaba.com
Subject: Re: [PATCH net-next v3 1/3] vsock: Add support for SIOCINQ ioctl
Message-ID: <opt6smgzc7evwrme7mulwyqute6enx2hq2vjfjksroz2gzzeir@sy6be73mwnsu>
References: <y465uw5phymt3gbgdxsxlopeyhcbbherjri6b6etl64qhsc4ud@vc2c45mo5zxw>
 <20250622135910.1555285-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250622135910.1555285-1-niuxuewei.nxw@antgroup.com>

On Sun, Jun 22, 2025 at 09:59:10PM +0800, Xuewei Niu wrote:
>> ACCin hyper-v maintainers and list since I have a question about hyperv
>> transport.
>>
>> On Tue, Jun 17, 2025 at 12:53:44PM +0800, Xuewei Niu wrote:
>> >Add support for SIOCINQ ioctl, indicating the length of bytes unread in the
>> >socket. The value is obtained from `vsock_stream_has_data()`.
>> >
>> >Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
>> >---
>> > net/vmw_vsock/af_vsock.c | 22 ++++++++++++++++++++++
>> > 1 file changed, 22 insertions(+)
>> >
>> >diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
>> >index 2e7a3034e965..bae6b89bb5fb 100644
>> >--- a/net/vmw_vsock/af_vsock.c
>> >+++ b/net/vmw_vsock/af_vsock.c
>> >@@ -1389,6 +1389,28 @@ static int vsock_do_ioctl(struct socket *sock, unsigned int cmd,
>> > 	vsk = vsock_sk(sk);
>> >
>> > 	switch (cmd) {
>> >+	case SIOCINQ: {
>> >+		ssize_t n_bytes;
>> >+
>> >+		if (!vsk->transport) {
>> >+			ret = -EOPNOTSUPP;
>> >+			break;
>> >+		}
>> >+
>> >+		if (sock_type_connectible(sk->sk_type) &&
>> >+		    sk->sk_state == TCP_LISTEN) {
>> >+			ret = -EINVAL;
>> >+			break;
>> >+		}
>> >+
>> >+		n_bytes = vsock_stream_has_data(vsk);
>>
>> Now looks better to me, I just checked transports: vmci and virtio/vhost
>> returns what we want, but for hyperv we have:
>>
>> 	static s64 hvs_stream_has_data(struct vsock_sock *vsk)
>> 	{
>> 		struct hvsock *hvs = vsk->trans;
>> 		s64 ret;
>>
>> 		if (hvs->recv_data_len > 0)
>> 			return 1;
>>
>> @Hyper-v maintainers: do you know why we don't return `recv_data_len`?
>> Do you think we can do that to support this new feature?
>
>Hi Hyper-v maintainers, could you please take a look at this?
>
>Hi Stefano, if no response, can I fix this issue in the next version?

Yep, but let's wait a little bit more.

In that case, please do it in a separate patch (same series is fine) 
that we can easily revert/fix if they will find issues later.

Thanks,
Stefano

>
>Thanks,
>Xuewei
>
>> Thanks,
>> Stefano
>>
>> >+		if (n_bytes < 0) {
>> >+			ret = n_bytes;
>> >+			break;
>> >+		}
>> >+		ret = put_user(n_bytes, arg);
>> >+		break;
>> >+	}
>> > 	case SIOCOUTQ: {
>> > 		ssize_t n_bytes;
>> >
>> >--
>> >2.34.1
>> >
>

