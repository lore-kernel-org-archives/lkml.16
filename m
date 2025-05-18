Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F0072639
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 12:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747570131; cv=none; b=HA1Zalf/e4ZIMNHq+niJLuJmmssQmyRuCy48mP2Ghj67fbtUWzyzkfsnc1XSqZsZWFFLjn0p5pwtI+eeAep/nMtG4w4IEAtxQWVILY4mkV8vL8Kzn/20Pms/E/OW3y5unkGQ42BT8RxAd2tlkthXM1+k3a81rz/dtmQKdXuUBtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747570131; c=relaxed/simple;
	bh=Npe858BekUnVIk5PzeJ64ZANo0H9SOsJWq37Yy+QnKY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=tqfr+eWLJCFbG/nZ2T+VY19BNjGEVPf+kG+mCEvvcOqNye6LaIjJ6c+hZodrhnAB6cKNWAha0HoKaKOt92aKsBKRiPA2nVhhqxzEfMR2+eftNWxn6sKXARm6pACdzd8fyLXpm990bz3hh/BOITISHXK6ClYl1DzB0y2qTCp/cfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BoJyysoR; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BoJyysoR"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5240b014f47so1163620e0c.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 05:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747570128; x=1748174928; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JrZna9+ZWF3qbwQc5Xg3cyXj0jZRogn32eLuP/fcMbs=;
        b=BoJyysoRH6Fk0397q0DWlI1oJVdgvDdPppszspNKiE4Y7RT6KDK8pnzF4gghy7AinE
         FwzRTJac9lEqBZ/+Fn5GK4nM+7GOwwzw4FiKzpBMd8kPMMaZhfuY2XULmvA0KZyAVnym
         mn3oAeORY3FsJja31tYVh1K+pJge6E2hPf8qUUKozTqIqHYEIi40wUM75gJw23pPW2bO
         BlUNBVqjrETguJTkP+glYz5GtQaJ5p1fFcCGxpQCKMMQRnstmkkWXgWaxPyB/t+2S6gi
         V4WPlcrKCQhBw6udd9MP7dGvVNulUofuZ2Hu8ZorXeZZteQXf0Ofs26lYLiPpS3pHtcc
         T+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747570128; x=1748174928;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JrZna9+ZWF3qbwQc5Xg3cyXj0jZRogn32eLuP/fcMbs=;
        b=Vprtel56tGzE3srpU3C+INJfHEVurp+l+G6cE1EiIapDeS2PzEM3belCrep5EF3tem
         wZwBGh9Qrt1hTiGsHzaG250BZtDIkk2hBnFNczpZyV4yy5+6cizmT0Chgq7CsO2m8DS9
         5hiHeY4sMPa5cUMZR11+J6mCqEkn3McqoUuhX2TAqSWHPszC4TWQqNA8ArwGEyMEyGer
         C1boMlfNdMojD1DWaC3IfS1CvH6y4rLGXl6GoktnyAwxkJ4rOpkT7Q/dEwt8Q5e3IkEp
         bNyfNg8+uHAZTEA7O4qixBvbZy0J2Zm23LHrWeWPNecJVDJGsId3qhTEyvfCWpaNoQJs
         twzA==
X-Forwarded-Encrypted: i=1; AJvYcCUVLm0aB92QvJnbn2no3rUZWflsIQtHW+1bqimhUw9DkCiaAPSS3cygyhPRD4xj0nmso0xVeJSMUlG2lE0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdRD3LIa5m+w0nWuvf/itfJZ085uxogG92MgpPabafz9hi5YTf
	YMk/ARVGrU0jPalWgoyhkBN+LkK/ktHGJyQrYAif9WKFH0VRTGegRUXgbrpFkA==
X-Gm-Gg: ASbGncv5rNz4Bn1EzC6dt1giqM6QBwn+CfOMwfSvOaxbD2mJlMCWD0NrvD4I0CZduN4
	IcdohTK+Rj/Y7+SK0i8oqJk0k3e0d30u4kL0g5uR2dGbzlBWWhcECwWvUjT0HyqtvLrowGnmXUZ
	1xvyxRPzwjQmYx4X4OqYyjp7k82nhK1ubUGkci3iSSz3jVgFsfdL8GwabXSuAeOs3m9pj04sCd9
	vrPxAiXhQaFeBAPDP2IEFExjMPPIonMq4bWqi5VKXPgIoTv6Ew4Rp6Q0etO1ExQnDcTW5OCYPfb
	TUiEsu1fshh8LfQ/IU/kW+JOasksFnNd/D3+vGODT1Ki6LvdLbPlSQm0F6ZAV+SBQy+3IoefUfr
	Zlr6SZktDvvf3gH/FvqJCVimw9FI98CwGMkoSENK6ZsdEXxh6sjl6wNI+VPP4gjeM7hSdI2DBP5
	XS5Bmff/UriIH8Aq8=
X-Google-Smtp-Source: AGHT+IFZiLcWIFJjodiOpXu6k28mwx3TR0VOAKMbHbt96KofzA+aXp4qZw95iGbV/oxJ2CCsKxGxGQ==
X-Received: by 2002:a05:6122:a1f:b0:525:aeb7:f22e with SMTP id 71dfb90a1353d-52dbcda0399mr7569375e0c.7.1747570128204;
        Sun, 18 May 2025 05:08:48 -0700 (PDT)
Received: from smtpclient.apple (2603-9000-d600-0325-d07d-cafc-1c50-99b9.inf6.spectrum.com. [2603:9000:d600:325:d07d:cafc:1c50:99b9])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dba940919sm5123240e0c.17.2025.05.18.05.08.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 18 May 2025 05:08:47 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.10\))
Subject: Re: [PATCH] docs: usb: dwc3: add documentation of 'sg' field in
 dwc3_request struct
From: Jonathan Velez <jonvelez12345@gmail.com>
In-Reply-To: <2025051820-unspoiled-rift-31f8@gregkh>
Date: Sun, 18 May 2025 08:08:46 -0400
Cc: Thinh.Nguyen@synopsys.com,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C49E4FFB-81F5-40DF-8DD6-5BB4A3B782B7@gmail.com>
References: <20250518113330.8976-1-jonvelez12345@gmail.com>
 <2025051820-unspoiled-rift-31f8@gregkh>
To: Greg KH <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3696.120.41.1.10)



> On May 18, 2025, at 7:58 AM, Greg KH <gregkh@linuxfoundation.org> =
wrote:
>=20
> On Sun, May 18, 2025 at 11:33:30AM +0000, Jonathan Velez wrote:
>> core: Add documentation of "sg" field in the dwc3_request struct.
>>=20
>> Signed-off-by: Jonathan Velez <jonvelez12345@gmail.com>
>> ---
>> drivers/usb/dwc3/core.h | 1 +
>> 1 file changed, 1 insertion(+)
>>=20
>> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
>> index f11570c8ffd0..bb140dde07d6 100644
>> --- a/drivers/usb/dwc3/core.h
>> +++ b/drivers/usb/dwc3/core.h
>> @@ -942,6 +942,7 @@ struct dwc3_hwparams {
>>  * @request: struct usb_request to be transferred
>>  * @list: a list_head used for request queueing
>>  * @dep: struct dwc3_ep owning this request
>> + * @sg: pointer to the scatter-gather list for transfers
>>  * @start_sg: pointer to the sg which should be queued next
>>  * @num_pending_sgs: counter to pending sgs
>>  * @remaining: amount of data remaining
>=20
> What commit id does this fix?
   I pulled the mainline and worked on the =E2=80=9Cfor-next=E2=80=9D =
branch. Is that the correct process? Should I be using the =E2=80=9Cmaster=
=E2=80=9D branch instead?
>=20
> And are you sure you made this against the right tree?  I do not see
> "sg" as a member of this stucture at all anymore.
   This was the last commit on the =E2=80=9Cfor-next=E2=80=9D branch:

   commit ffd294d346d185b70e28b1a28abe367bbfe53c04=20
>=20
> thanks,
>=20
> greg k-h

