Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0481EE7C2
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 08:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739261547; cv=none; b=Ad2eH6e9fLwrvbz2hzpxTNxKsYk0cOYF4Xj7VD4XSeXj6GFArkGzD6tGsHCxyTsBMrEP/cbG1xm7RfeXykkTHWxI9EzF4xuhU+m1PeSvmhcg5KSP51hsPiNBt0NFIdv/a4Yr3bsaO47wlmKnkWOFSQ03KhZhKq3J6jUd99BN1e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739261547; c=relaxed/simple;
	bh=hDZF76s0+s3nQKWmMd335G35ca1BnoygOxqTHvKFjnU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sMufQUnZP5wm685F0POzrNN38lADVB0L9GXaaWh0cb9nTwrDm5pRY3Fvh0VTrB2M1Cz43jAZLwLaXAaDfWqEMeZXm/F9ohiUAbMspaXRx8C8Z2D3sx/yOPwZIJ92iXwBwsg1cCrcyrVSSH0boRNU++wpS4sorHU9i5kyUyEipzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Srii4Zhw; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Srii4Zhw"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-308f71d5efcso11005831fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739261542; x=1739866342; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZBPv6QOC9HyqG83lsiP8B3hCPsDW+zwfD1sc16aqzQ=;
        b=Srii4ZhwIpcHAV/jIHfFPmKfWk/E0t2DcWQ5xr3tqSSXwPf0gzdKhZ7P/9NfRSbNqh
         HNlcWekNIUwhrD5OBkeu5rnRkVPia6JIhzIJag2lx5/N9KNM0ZNp2308kS+guuYQxDZD
         zC5O2OaiysN+F9WW/VBtPFCNWPLptJel+mYVXpc7MkAQe0S+wdk/q7MV5mmatdLmWi/1
         mARSweym3rzCGN3ZFZ3002Mc8YKQ86J8SdkogDjk4G6vK838i3rpwJ0+JM2gxAJJ4HwR
         l16WxqA/jh5S8JnV20UxPB8C0HZmRwhZKMs44P/2T3UKxcWEyRHR/ZCyV+WehMWV9XWo
         ToEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739261542; x=1739866342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LZBPv6QOC9HyqG83lsiP8B3hCPsDW+zwfD1sc16aqzQ=;
        b=DM6X8tF4RCbsHj/Rk7yTWgaGuIf6mVm48E4Md0KYp/RV3O12drpOQDjt34M01GTn4T
         8mP2u+R9ZDI+wQedln921KtwsH64zkR1bu28y56Bf+ePYd5/VzviFanSho89dsMOwIBg
         7wXRiP9IPvK92+DzS/dlufIQ8U4ajFEi1hL77rKQ5H0tiMByyz6o67g8RLW8DfjehPVC
         OtIRj3FCmjGwRPklN04TV/PcbM2r3lFzsa/YktgVL8Z4aSWK8U1z6a8qiFHgqPxQabfo
         +l/19m7dBH4CX55/DBF3VnxXAzMJs2XjPart2z66sPjUH5PtBx4p+LqDTVapj4RKwPTZ
         gCJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxvADaZHXKV7VRyCqp5SxIK4IB8CQLzwXoGrskZKj2y5rd+ZGbH96/p2SPqNUSA2igKPvWaiM8OxD1yos=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZKrJDPfZ+TAxPa4FA76IO/b4XoomQvOcVO/xZs/vGj/vuiJsa
	T2+6wREQH0xYt2LHZ9hu4oN3lHv/rMG6oVna0kJqdgqVBlWyulGjp2RwhIX+IvrmNP1d7Hmjufs
	BNuMAeidOJzj0PXpxUBvE5GB+8/pC9QGkXinQEg==
X-Gm-Gg: ASbGnctEY2UE0IpdgR0Nm/Pje/vYa5JFfp9LTX+A5mjEgy6l7BBleBEGj4thkwLKrT7
	67GSSwQtRtP8E9Ssvz/fpZ6OXeyFTt5eOeEHco3PiFISnSg1LTcfR4HQsv3HyhIYY1wY3rQRoQO
	30OoOjHJTm89oWOcbYQ8luR/WpAPw=
X-Google-Smtp-Source: AGHT+IHsnSGZUFQMOoiXCGeHwOhkS4uzUDRmLLENwo/njPODTJnW3qTKSrQ7Ha1UrP2LHvzY0dNeNgevSz0lHNMxLPY=
X-Received: by 2002:a2e:bea4:0:b0:308:fd11:76eb with SMTP id
 38308e7fff4ca-308fd1179e6mr4836001fa.19.1739261542476; Tue, 11 Feb 2025
 00:12:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210202336.349924-1-ebiggers@kernel.org>
In-Reply-To: <20250210202336.349924-1-ebiggers@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 11 Feb 2025 09:12:11 +0100
X-Gm-Features: AWEUYZkUIVqXHClndXAUtENhhMz-NcIhEeDU_e0vb-Z-ySUsEFA2hwDxIAg98Qo
Message-ID: <CAMRc=Md0fsB7Yfx9Au1pXi+7Y_5DQf2z430c9R+tyS9e60-y5w@mail.gmail.com>
Subject: Re: [PATCH v12 0/4] Driver and fscrypt support for HW-wrapped inline
 encryption keys
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Gaurav Kashyap <quic_gaurkash@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jens Axboe <axboe@kernel.dk>, 
	Konrad Dybcio <konradybcio@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 9:25=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> This patchset is based on linux-block/for-next and is also available at:
>
>     git fetch https://git.kernel.org/pub/scm/fs/fscrypt/linux.git wrapped=
-keys-v12
>
> Now that the block layer support for hardware-wrapped inline encryption
> keys has been applied for 6.15
> (https://lore.kernel.org/r/173920649542.40307.8847368467858129326.b4-ty@k=
ernel.dk),
> this series refreshes the remaining patches.  They add the support for
> hardware-wrapped inline encryption keys to the Qualcomm ICE and UFS
> drivers and to fscrypt.  All tested on SM8650 with xfstests.
>
> TBD whether these will land in 6.15 too, or wait until 6.16 when the
> block patches that patches 2-4 depend on will have landed.
>

Could Jens provide an immutable branch with these patches? I don't
think there's a reason to delay it for another 3 months TBH.

Bartosz
