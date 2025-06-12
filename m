Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FCC1F3B96
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749710040; cv=none; b=ZdBFaGWYXsxjDHGajkrCPZY+dGgHtdNUiSsbQcIkLHxXzcs89/Yrd5lGgEZ2/b64Wx8eETsUg9x0/3Jg37kno4Lq8JoPtDfbhROMiJ9RMQUqS+njaqItsonr6CScoqF241lEMx8PuBT162oKC7okIpybxz/hBLYqr91rrAOa47M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749710040; c=relaxed/simple;
	bh=0RFsYK4/bVTOu8PeXbzz5JHWzOqZR66/rgr6E+bl00g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LbJw153o8BryoGspVgORgcU4mv4UfA8h1zYsfqWLX/7CrYuhL8rNQ8FsbmwNjJUqmLoSWuG7ZXyMpa49GjgXyKu1vlFQxYihI6bkOBXXoFtvHTaV8X95OwHr7XY5tnT0fHl6z0+I15wfYQ9KkylDDqnmA98IpeyV3DbQl5k2VV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FG1YAw4d; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FG1YAw4d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749710037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Nm9TV6R7Y41QOfPJ6MP5oIIesRRVBP6gVfG7mX/j6mc=;
	b=FG1YAw4d5dkWe3aoJEA7k7DHsnFyilE+sHssLrobtcImsqeN8yXlGpYSL8GTHTbqZVtcwp
	0O8z1LOLDlxi4boGFzxM6Sg8g2H99Y5m5Z96AEz9AP7sJD87Riht5JMfic4YiS4c6F7AQ0
	OepoAyps9JWEDcVbG9IWYoz5EiZXFxQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-4KgT8TcmN9OSjNtfwl84nA-1; Thu, 12 Jun 2025 02:33:54 -0400
X-MC-Unique: 4KgT8TcmN9OSjNtfwl84nA-1
X-Mimecast-MFC-AGG-ID: 4KgT8TcmN9OSjNtfwl84nA_1749710033
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45311704d22so3159655e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 23:33:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749710033; x=1750314833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nm9TV6R7Y41QOfPJ6MP5oIIesRRVBP6gVfG7mX/j6mc=;
        b=TMAAWFKsooqIXHI9e97nRFVSCPhf24Z9HqAyDp7Fa7uQt7sQ5V5WqIcjrEW2/gZFBI
         j3pswUEn9XuWegP3Z4vLbU0XxqWY1ixhx06vqaUdwueSQEL4ALJUa42A6TeSS2mZbruq
         eMd2BYY+jKl8MpkQ/zmCLeNr/8ZexV8JNRARMRRsz1THfe+AA0zHQN3/DlyN+aH9RZcX
         rz73/qCI5zU+uCblMeT6q7Mi3Q0sZ1BP4y4/RDAjNcoaE8ZerpG+JXj+QjrQYpCmJ0eQ
         Lj6/GtHYXmTwODdHFDkK+UcKBjmxemrEtlYlIG1IFHeSPKZEWVThypzzP9Y8kHJBgXC9
         cznQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoga+SUHljJ+BAnQGiuMcUX9o/NEBQUO0LBObIDm1WUvWbPIfxXpviKwipCY0D79HABc8XaOfuMoFdzAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyMKobiMAtdnk6BBqU5sCFQefoDhmfDOpFnGhdniCGrmEhscIX
	K6E+xrW6pmTchgM0pQzFaw8EzDbdvwzfT0QCgJQ4jR0THmPJTu10Tr0ONCXYPJc4q+iYQtH1raZ
	AcenWOCNhNu8v2KnNAAMa0iu+dr392fhkC/dIqdxCbwg3IFDisORxl3RI6IDCJvSb3A==
X-Gm-Gg: ASbGncttglkyUFR6WNJBHJL6fPT0gUzPpV/Ir5Q2QEbnhB0zTCZMH7Fm645bN9XZkX9
	TXE69thGUJTcQTH0UZpegR75STJA+OiR+zBqSkINKr5OH2LDa2G9mnIgZI/XG6c6SgwGB76dWaH
	dV3AwyDVauNMj71lp0euWjRRNFrTlXDM8Lk2RATAqCYTyf6fQpCyyxvqLx/PWxYFoS6XL2AN7Wy
	pSPewHYiQIra+6vGBcWDV/gcU0QBFry14J8o4GcRhIFC0EeH+seoPoRiyA75YMzGJw+I0B7t34I
	mIqPqUXos05BCYNh
X-Received: by 2002:a05:600c:c162:b0:43c:fffc:786c with SMTP id 5b1f17b1804b1-4532d2f7108mr14039445e9.19.1749710033345;
        Wed, 11 Jun 2025 23:33:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUPXH7B83FgsgIbWOCFa8wLAry7d4eNcJALWMalXCx0ZQ4ODVUAv9DRXGbLvxZDae4zuYiyw==
X-Received: by 2002:a05:600c:c162:b0:43c:fffc:786c with SMTP id 5b1f17b1804b1-4532d2f7108mr14039215e9.19.1749710032990;
        Wed, 11 Jun 2025 23:33:52 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4531fe8526bsm43377245e9.0.2025.06.11.23.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 23:33:51 -0700 (PDT)
Date: Thu, 12 Jun 2025 02:33:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: sgarzare@redhat.com, Oxffffaa@gmail.com, avkrasnov@salutedevices.com,
	davem@davemloft.net, edumazet@google.com, eperezma@redhat.com,
	horms@kernel.org, jasowang@redhat.com, kuba@kernel.org,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, pabeni@redhat.com, stefanha@redhat.com,
	virtualization@lists.linux.dev, xuanzhuo@linux.alibaba.com,
	Xuewei Niu <niuxuewei.nxw@antgroup.com>
Subject: Re: [PATCH net] vsock/virtio: fix `rx_bytes` accounting for stream
 sockets
Message-ID: <20250612023334-mutt-send-email-mst@kernel.org>
References: <20250521121705.196379-1-sgarzare@redhat.com>
 <20250612053201.959017-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612053201.959017-1-niuxuewei.nxw@antgroup.com>

On Thu, Jun 12, 2025 at 01:32:01PM +0800, Xuewei Niu wrote:
> No comments since last month.
> 
> The patch [1], which adds SIOCINQ ioctl support for vsock, depends on this
> patch. Could I get more eyes on this one?
> 
> [1]: https://lore.kernel.org/lkml/bbn4lvdwh42m2zvi3rdyws66y5ulew32rchtz3kxirqlllkr63@7toa4tcepax3/#t
> 
> Thanks,
> Xuewei

it's been in net for two weeks now, no?

