Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C117238C20
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751269642; cv=none; b=d2TYt2NzXWlA0aoYKWa0FxtRzt2dFIJJuqmsoTRVAd7S+kQ3Du2mSTn8mb4qzoalhppjIi54JOWIDIwt34fekCp9jnH09E9aB3zvrFl0xCwLNtOgHzFr+AymFrIWai+tQH8EgaFY9YC6Ay0AvbyRPw+scM4om3mgOGVCLTyK0LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751269642; c=relaxed/simple;
	bh=3WCJLLv4RhnKEvcl21V/JHUYDcouCFwoRzhLS4CQ9mA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LQ1+bdV7hXbwxwLZePHeYxGWOuWwY8nLScjLPMHfMR6jWgvY0bRuCL0+Dp/XfOROLrjzsh7XrCtCSfdJ8x4T4P47OEh0NDh0FudUgLGxtEV6kFoEmZyMg2D8zWRtCBUhZjFIRVRYSlOVblL5HFgLz6QEcc1mQXuB/Lb3veMrOQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eAR9HS2J; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eAR9HS2J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751269639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7ktNPhfijuEzODMwYTiQC+VuJwh6IE4+mAtetQ6pS/E=;
	b=eAR9HS2JIH/1yTCatFSoOxyUm3JbHatFgTTUJzabdGWgC+yEdaroTSZ2HwpbeZgfwb/yzR
	i/kdlXqIW9itMHcelTvuazzCbvsj57PBACa34aI17r+bMIDdqzigHbmiY8SCvqQPE43Mad
	1LG7N4fgzejNFAyjBjVtN2mdgN5Gh3Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-543-sedZvx-JPrmrEvS75R_8Yg-1; Mon, 30 Jun 2025 03:47:16 -0400
X-MC-Unique: sedZvx-JPrmrEvS75R_8Yg-1
X-Mimecast-MFC-AGG-ID: sedZvx-JPrmrEvS75R_8Yg_1751269636
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a503f28b09so2082632f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 00:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751269636; x=1751874436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ktNPhfijuEzODMwYTiQC+VuJwh6IE4+mAtetQ6pS/E=;
        b=Ux3tlSK2PQbmzBOdGtvjtX3arrQaiRFyy3rvZ+G1Y7FzGj/dgu69/GdrV8QFMB6Wjs
         4Cuac63l37dG/sAsaobA1HlETSnH5vKweXNHXveDxXbNEWZ6alCSpFv6og2vcf/2GZIf
         eZxOmSCekr6BwYe73yUwvf1TS8v+iXejnMPR5bkc0ysx9ee9YDyOf1lJbi4v+qPVJfL5
         27tFYr5KHEVJWwbJEneDDA1Xw+tsiq3n6gGrOVNp69BNJNWQVddEXqlrHy8BtvHmBMSo
         0AjY/Y6DSzHN+QISXsXa27fbF0oN8vZhenm3Rgn6S00Y4bLfuBSPVeXJxoQjnQ6vPgZf
         bDRA==
X-Forwarded-Encrypted: i=1; AJvYcCX/xOa2utRySeh4MpMe24jyJy4P2tl9YIELgdyTUdcbo1Fik6moIlSAhS2ItRNpZUwc6Sl+BEy4GxdLg5U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8vn6owDWQbVVozzP+pwIG3zz2ubHFwdf2jmg39fqZ/3hpCctT
	qCbAnWY2bQhvaTPp8dBikthlColCSaXbuleT9sTNE2N1+57CPjr5MX5hbd/c0nMKIxqoSofw738
	0v0MKfgjFN6GQrJSGnfrhESHcnl2uzKN62iaUuXpE84yakmxf/zoqcsYJBtu1Ys3G/A==
X-Gm-Gg: ASbGncsFRupXpcKNmh7NbHxXbgmXbC6sFRVFc6xb/r7ebHF/TGVHFw/3DfoA0J3wMAn
	37JQl5bhnx59P1snXXgJEo+PsLRn43iYd1DUXVHhG173aDAIKt69hdl3e+C/WrpG8B6jZ/PQGSf
	BOQiheACAj2PQtadt9hp9nHmlS8JjpwWVvqABuLa56qMyIENqN2UVa6NcanMNCsH68A+ot3VbnI
	YB5UEjXYF+N+BJXXd5x3i+wemRh2xsJeNhHgk8XKT+WDiO9BB49PM9iyNN0jP1ogkHvDWceqCII
	bouOMTUDzuSWWvChsxS8BV/3npbx
X-Received: by 2002:a05:6000:418a:b0:3a4:f70d:aff0 with SMTP id ffacd0b85a97d-3a6f312df2bmr9022658f8f.14.1751269635638;
        Mon, 30 Jun 2025 00:47:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxPyEI4vtDCAHmMrt9Bgdg2700Ez6oVkN9Z1NlWqAtZ1aXzxk700hjPBCX6uj4jbe2vAmlKg==
X-Received: by 2002:a05:6000:418a:b0:3a4:f70d:aff0 with SMTP id ffacd0b85a97d-3a6f312df2bmr9022638f8f.14.1751269635049;
        Mon, 30 Jun 2025 00:47:15 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.177.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453814a6275sm105907065e9.1.2025.06.30.00.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 00:47:14 -0700 (PDT)
Date: Mon, 30 Jun 2025 09:47:06 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: mst@redhat.com, pabeni@redhat.com, jasowang@redhat.com, 
	xuanzhuo@linux.alibaba.com, davem@davemloft.net, netdev@vger.kernel.org, stefanha@redhat.com, 
	leonardi@redhat.com, decui@microsoft.com, virtualization@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, fupan.lfp@antgroup.com, 
	Xuewei Niu <niuxuewei.nxw@antgroup.com>
Subject: Re: [PATCH net-next v4 0/3] vsock: Introduce SIOCINQ ioctl support
Message-ID: <gv5ovr6b4jsesqkrojp7xqd6ihgnxdycmohydbndligdjfrotz@bdauudix7zoq>
References: <20250630073827.208576-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250630073827.208576-1-niuxuewei.nxw@antgroup.com>

On Mon, Jun 30, 2025 at 03:38:24PM +0800, Xuewei Niu wrote:
>Introduce SIOCINQ ioctl support for vsock, indicating the length of unread
>bytes.

I think something went wrong with this version of the series, because I 
don't see the patch introducing support for SIOCINQ ioctl in af_vsock.c, 
or did I miss something?

Thanks,
Stefano

>
>Similar with SIOCOUTQ ioctl, the information is transport-dependent.
>
>The first patch adds SIOCINQ ioctl support in AF_VSOCK.
>
>Thanks to @dexuan, the second patch is to fix the issue where hyper-v
>`hvs_stream_has_data()` doesn't return the readable bytes.
>
>The third patch wraps the ioctl into `ioctl_int()`, which implements a
>retry mechanism to prevent immediate failure.
>
>The last one adds two test cases to check the functionality. The changes
>have been tested, and the results are as expected.
>
>Signed-off-by: Xuewei Niu <niuxuewei.nxw@antgroup.com>
>
>--
>
>v1->v2:
>https://lore.kernel.org/lkml/20250519070649.3063874-1-niuxuewei.nxw@antgroup.com/
>- Use net-next tree.
>- Reuse `rx_bytes` to count unread bytes.
>- Wrap ioctl syscall with an int pointer argument to implement a retry
>  mechanism.
>
>v2->v3:
>https://lore.kernel.org/netdev/20250613031152.1076725-1-niuxuewei.nxw@antgroup.com/
>- Update commit messages following the guidelines
>- Remove `unread_bytes` callback and reuse `vsock_stream_has_data()`
>- Move the tests to the end of array
>- Split the refactoring patch
>- Include <sys/ioctl.h> in the util.c
>
>v3->v4:
>https://lore.kernel.org/netdev/20250617045347.1233128-1-niuxuewei.nxw@antgroup.com/
>- Hyper-v `hvs_stream_has_data()` returns the readable bytes
>- Skip testing the null value for `actual` (int pointer)
>- Rename `ioctl_int()` to `vsock_ioctl_int()`
>- Fix a typo and a format issue in comments
>- Remove the `RECEIVED` barrier.
>- The return type of `vsock_ioctl_int()` has been changed to bool
>
>Xuewei Niu (3):
>  hv_sock: Return the readable bytes in hvs_stream_has_data()
>  test/vsock: Add retry mechanism to ioctl wrapper
>  test/vsock: Add ioctl SIOCINQ tests
>
> net/vmw_vsock/hyperv_transport.c | 16 +++++--
> tools/testing/vsock/util.c       | 32 +++++++++----
> tools/testing/vsock/util.h       |  1 +
> tools/testing/vsock/vsock_test.c | 80 ++++++++++++++++++++++++++++++++
> 4 files changed, 117 insertions(+), 12 deletions(-)
>
>-- 
>2.34.1
>

