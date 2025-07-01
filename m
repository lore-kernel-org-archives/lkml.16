Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F951A0BC5
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 02:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751337139; cv=none; b=ENKJaiGASa/N4ZfeE4LRSJDDN0XqDevEA/Yuo1uQUlyy49wDbHauI7OKUDbxtJ8s3qDl6Hm0qyO+HXu6QCB1JZjJ3c6c+t5DYG2u6zHCHJ5CyrZkMnhRLyhOaPsiPxtFCfNZObSB6dwBwr+4KDYQoAKk8MXmcuvEXrOIJD2Q/vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751337139; c=relaxed/simple;
	bh=rRVdG5V5THof2kVFbuGpoPO6Ew/jSkC8Uar+R290sas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rFT3sh6dhHVCATFFAH5egNI6rt2a8fET2kBKCOf11Vsty/JII4ytxHv0U1ixcQLjUehq+5gZ6Q2SytTrDFvz6GtHCo36Weo4jScqQ0omNygJjdL6ng/6wkYzRMPFpdrHiOda07CW6Q8g0E2kEEhmF63VEB6wPrufHF7NxRkh9VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B1Ug2UxX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B1Ug2UxX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751337135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rRVdG5V5THof2kVFbuGpoPO6Ew/jSkC8Uar+R290sas=;
	b=B1Ug2UxXuxBDK6RomLCi+pF45h4AuxyNB0VRNZ2e86hWhcKagkkXZ+AyGnX44vCgfsbp2j
	M30zpuuJyqRIlQ03SAJYCdFEMMOU42yKwZVc2raTHPB2dB2nDwr6r7pTdZ0t32lk85n0o7
	hjsH5TzPxOj7tA75CjTjY47CBPIkhYg=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-DbIXytX8MrKFuv0Yx5x4jQ-1; Mon, 30 Jun 2025 22:32:11 -0400
X-MC-Unique: DbIXytX8MrKFuv0Yx5x4jQ-1
X-Mimecast-MFC-AGG-ID: DbIXytX8MrKFuv0Yx5x4jQ_1751337130
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-553addbf0beso2764195e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 19:32:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751337130; x=1751941930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rRVdG5V5THof2kVFbuGpoPO6Ew/jSkC8Uar+R290sas=;
        b=AvDjvN+tn3FKHF17bpINWmaJAT99saxhAGwJGwqrUk36Fb6H49mPX9m3deqUH3+DI+
         BdWB0Z4gpZa5ikNan25spZm/Woi+QzQJ4f8h5zGUcC7PIeXPGM125uszF1oEY1IO5PZb
         3z7ubRFGUvqdaqSTbivI9DRpd3ZkLXm2vyyFxjJeQr55BvlOwUT4vb7vxoFqr3UQKOtW
         EMu33qIUPff2AmKNVUOrS1wjX2ZvJeAacDYgu7gY+8WjiV7xIlvgkJjkgSFdMUADS28b
         GjknbhTr7qyWeLNKYWOH6sz8UodHdu+SFCn8mK0rdl7StHJPn9/TfVhWt09LdXmA9SOX
         LPLA==
X-Forwarded-Encrypted: i=1; AJvYcCVC3IBv8zk1ehpp9RvXf8mDxpiErlwnENarXlIpCqcF0r4knOzh4QOnjCLuAN4PrSp1dbxqWVq7TADGa4M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWEMBW8bnL7tXzDgIAVgakw1rRhTojcrz/j0OmCIk66IQdDKmR
	V0o6O5DeiCHGug4oM/MpYp+A6OLa41bspahQWqLvJLeLTTrc9gJX/hAQZUW+QlYDUfJE1KcyPC0
	hTKULly1P0qdgw3WLjXei9I9kVP8uPcpFAlAzAewFEq2lFaspMVJBNOmCMlP5sWw7McET7Sn/K4
	p0/aWN90AFLm31MyYq4A5QojMuK9Myz37tcyCHyKVH
X-Gm-Gg: ASbGncte4MtXm0vzvXUVCj81wqipkHRLfEhn9U9tL2dlBPvWAYomKL3LYdsvlJ/nhCt
	c/iolIS5T8azRWbLTWcX/1Wn+S/eRvArX42rV77YeuKxqQVZhX56WHnTeuxsa5j9ER2vLbMOZ0Z
	XifYBT
X-Received: by 2002:a05:6512:3f14:b0:553:33d5:8463 with SMTP id 2adb3069b0e04-5550b85a6aemr5124502e87.24.1751337130031;
        Mon, 30 Jun 2025 19:32:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYxhicPvjsrYMTzNnBgN66EEIC9O090pHpKX6MSHN6FdUCZQawP5ktZNml7ohAaKF8rzbjcIZejG5Mnsuzl5U=
X-Received: by 2002:a05:6512:3f14:b0:553:33d5:8463 with SMTP id
 2adb3069b0e04-5550b85a6aemr5124492e87.24.1751337129620; Mon, 30 Jun 2025
 19:32:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250524061320.370630-1-yukuai1@huaweicloud.com>
 <20250524061320.370630-17-yukuai1@huaweicloud.com> <c76f44c0-fc61-41da-a16b-5a3510141487@redhat.com>
 <cf6d7be1-af73-216c-b2ab-b34a8890450d@huaweicloud.com> <CALTww2-RT64+twHo3=Djpuj81jArmePQShGynDrRtYab3c1i2w@mail.gmail.com>
 <93166d88-710f-c416-b009-5d57f870b152@huaweicloud.com> <CALTww2820X=HU3Zuu+z19oCaPL+oQ4bMNostoAgfDk1-3nB3aQ@mail.gmail.com>
 <ede16ca4-96ef-e8e6-45fd-1c88cddc7f4a@huaweicloud.com>
In-Reply-To: <ede16ca4-96ef-e8e6-45fd-1c88cddc7f4a@huaweicloud.com>
From: Xiao Ni <xni@redhat.com>
Date: Tue, 1 Jul 2025 10:31:56 +0800
X-Gm-Features: Ac12FXzhMQGjHMGlqGWC7dqp0aHNgDpMVdT7Q6bEMzZcdixQ6dP5r4Yqwzr1sd4
Message-ID: <CALTww29r76X9C2-AEVGLqQ=BaWba8yrCCLcwkwVdO9ZhpkvWvA@mail.gmail.com>
Subject: Re: [PATCH 16/23] md/md-llbitmap: implement bit state machine
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: hch@lst.de, colyli@kernel.org, song@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org, yi.zhang@huawei.com, 
	yangerkun@huawei.com, johnny.chenyi@huawei.com, 
	"yukuai (C)" <yukuai3@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 10:03=E2=80=AFAM Yu Kuai <yukuai1@huaweicloud.com> w=
rote:
>
> Hi,
>
> =E5=9C=A8 2025/07/01 9:55, Xiao Ni =E5=86=99=E9=81=93:
> > If there is a filesystem and the write io returns. The discard must
> > see the memory changes without any memory barrier apis?
>
> It's the filesystem itself should manage free blocks, and gurantee
> discard can only be issued to free blocks that is not used at all.

Hi Kuai

Thanks for all the explanations and your patience.

Regards
Xiao
>
> Thanks,
> Kuai
>

