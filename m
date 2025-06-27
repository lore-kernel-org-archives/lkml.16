Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183862BF01A
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 11:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751022093; cv=none; b=kJnf+aHPsY8YsTY/RYj8KC3Yq1Rpv1A6BXnQLA6DuAR/Y9GJrLHFfqMPb7EdiTNU+tQudcf3KAB54ij8DWE52/jKxHPsYE6T5N0GjQ8OvGRXKjou2kktVpC3ab3LYKynW5YWGhtPPEs/HP6QtNgZN/YquQoKffs3GpDBHlRnFy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751022093; c=relaxed/simple;
	bh=ZbJdgOIbkGwBeQnmkTbzv066EyMDgSE02LiXwxp50sQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N6BrsL+pjlBJ65y8GP5WCRKMKfGOH0GzZOAvH+18VudOTd+kMdjfJkNTN0zLsc/RNPKcstHeHWAiickrsuh6jO2S2HZ+hotu9jUOOS6rZtsdXlSDJhNyh5tCkyQbS86eucbR1faJkVHIt01axa7mduqteDCfG6fyjrRyXsp8b8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IdnQX3c1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IdnQX3c1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751022088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZbJdgOIbkGwBeQnmkTbzv066EyMDgSE02LiXwxp50sQ=;
	b=IdnQX3c18/HWhugUf1S+iutKZaJ6kMu/23Lor6UrxnX4yrqtHWk0qP9sxLWo1qvxYM5CsW
	GmxN3S4a6d4ld36jsoLIClbWNhIlhsKR03GddUws3xJfmq+SPCMp/1WIIunZLuSFXJl35X
	QX1yfz2o357KN2zAmrd5yqSPErkoUaQ=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-0Tp0NDKxNBCqaDCN76eSRw-1; Fri, 27 Jun 2025 07:01:20 -0400
X-MC-Unique: 0Tp0NDKxNBCqaDCN76eSRw-1
X-Mimecast-MFC-AGG-ID: 0Tp0NDKxNBCqaDCN76eSRw_1751022079
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a44e608379so66940041cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 04:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751022078; x=1751626878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZbJdgOIbkGwBeQnmkTbzv066EyMDgSE02LiXwxp50sQ=;
        b=RTqFuEHia0i2DwPa5jWRn8sIpxcJeRWxvl8rQkIYnIq8lzBQ7pAjFjdhPLN7agsJdM
         jvhXlXwMcJr4AiHLN94/Mxn3wN/pH6c5OX0himaokwRIc4/Aoc05p3awgqfl2yqvUWcT
         Gy8yh7nVTn3E9RLzL9P9t8dkhrTtDoZ+9yyKvSDomRRYTyqjSnh84dAzn2J9NeTsE5O3
         kkQcheuYX4KbCTCswQHu97/PVmzQUHn8S4Mpp6X4RoXB9nDrEu1jpVey9U0CL4BUY5oI
         EFtaoK9G5KgvJahr/SFwpsKZgM1i9VnxQnGGkGmOKaEIL+qWhQhztihvsNpZYsKBYjO7
         h1HA==
X-Forwarded-Encrypted: i=1; AJvYcCVKXhf7XlxjpGg+xW6kRPBs+tY0ZowM6mRpzjPvr/DWlUHQCBzZDpUcU6abo2wuTKS8k6S/r6apUc/VLjI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+QrXuBiI6xFpRKIbWv5RSiOkLJw8r2W+ZPaq/kiqTEyUSkA3Q
	tGD7MqVeeMH4sfzLyUITr8JDCjse7uoNJCUDjrXSPFxviw91Kr8Bm4wpHH2cOLGp4R1TSwkb6N0
	M8/0HZnOx0hoHFx87nAhHb6t8kxIBfzQi418f/3Yx6PPshv7AF4BhzEm83XI5BbedZw==
X-Gm-Gg: ASbGnct6yoPkiAMRTz/h6tpJ4YrJcJP4uFsROswIAbk5bfosoBTtEj431WdrqNn/MaA
	wTBxplmNpsS4vVNGyS8F+rm4KIJ4aK3x85EnnQMUimgBW1bhdOAFEkTFD7SaGM3jciYr9XuNzk2
	VoXm8qc9fupJTC+z6q5PVmflwScsXOroZbXBMvTHhtxuOaggfHawr6LTy19KS6AysO0YZZb6gbY
	0MtOs3HT6aTAtvF2KT6GDdJj5C9Vk0NwlAMo+FOamvYaWVrUhM4Dmj1Z6WLOR5EOjpz226vuL7h
	0h3fTam38CnrTT+cEeRzP447mqQs
X-Received: by 2002:a05:6214:76b:b0:6fd:d33:bf30 with SMTP id 6a1803df08f44-700033b6fcamr44379866d6.44.1751022078486;
        Fri, 27 Jun 2025 04:01:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEI8TS4H6eRA0UouWBKDumbd4mbbqZxeye6OCeaKrfLx9sLYI9IeIKljRoNoP6GNozp6MQ7gA==
X-Received: by 2002:a05:6214:76b:b0:6fd:d33:bf30 with SMTP id 6a1803df08f44-700033b6fcamr44378836d6.44.1751022077610;
        Fri, 27 Jun 2025 04:01:17 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.181.237])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd772e3f2dsm17994826d6.78.2025.06.27.04.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 04:01:17 -0700 (PDT)
Date: Fri, 27 Jun 2025 13:01:10 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Dexuan Cui <decui@microsoft.com>
Cc: Xuewei Niu <niuxuewei97@gmail.com>, 
	"davem@davemloft.net" <davem@davemloft.net>, "fupan.lfp@antgroup.com" <fupan.lfp@antgroup.com>, 
	Haiyang Zhang <haiyangz@microsoft.com>, "jasowang@redhat.com" <jasowang@redhat.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, KY Srinivasan <kys@microsoft.com>, 
	"leonardi@redhat.com" <leonardi@redhat.com>, "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mst@redhat.com" <mst@redhat.com>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, "niuxuewei.nxw@antgroup.com" <niuxuewei.nxw@antgroup.com>, 
	"pabeni@redhat.com" <pabeni@redhat.com>, "stefanha@redhat.com" <stefanha@redhat.com>, 
	"virtualization@lists.linux.dev" <virtualization@lists.linux.dev>, "wei.liu@kernel.org" <wei.liu@kernel.org>, 
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>
Subject: Re: [EXTERNAL] Re: [PATCH net-next v3 1/3] vsock: Add support for
 SIOCINQ ioctl
Message-ID: <ubgfre6nd4543iu5yybkmnd2ihbzfb6257u7jjfz4xqk4nhfdu@43yfocr4z4st>
References: <wgyxcpcsnpsta65q4n7pekw2hbedrbzqgtevkzqaqkjrqfjlyo@6jod5pw75lyf>
 <20250626050219.1847316-1-niuxuewei.nxw@antgroup.com>
 <BL1PR21MB3115D30477067C46F5AC86C3BF45A@BL1PR21MB3115.namprd21.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <BL1PR21MB3115D30477067C46F5AC86C3BF45A@BL1PR21MB3115.namprd21.prod.outlook.com>

On Fri, Jun 27, 2025 at 08:50:46AM +0000, Dexuan Cui wrote:
>> From: Xuewei Niu <niuxuewei97@gmail.com>
>> Sent: Wednesday, June 25, 2025 10:02 PM
>> > ...
>> > Maybe when you have it tested, post it here as proper patch, and Xuewei
>> > can include it in the next version of this series (of course with you as
>> > author, etc.). In this way will be easy to test/merge, since they are
>> > related.
>> >
>> > @Xuewei @Dexuan Is it okay for you?
>>
>> Yeah, sounds good to me!
>>
>> Thanks,
>> Xuewei
>
>Hi Xuewei, Stefano, I posted the patch here:
>https://lore.kernel.org/virtualization/1751013889-4951-1-git-send-email-decui@microsoft.com/T/#u

Great, thanks!

>
>Xuewei, please help to re-post this patch with the next version of your patchset.
>Feel free to add your Signed-off-by, if you need.
>
>Thanks,
>Dexuan
>

