Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882C32153D0;
	Sun, 18 May 2025 10:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747565940; cv=none; b=UxK+CEBjMLPsxzcbZPofu/gCHvIWMktaEQ2GrAAsPh53IUEkV+g9UaLrk1WpIOEDBZz7nlF5+99oBYdFtWC7NvNEn9nZgx8YMbQkHSSDS+bM+S49zP4EZa9OQL+slr+JTOVUNOgsyoeF2BqxYwin3fMWJk6b4Orkf2BOZzbFK1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747565940; c=relaxed/simple;
	bh=+B72IZFw02ArbQ8uQ70t9KwfeGBjLrHsMlrlHwl77mI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=KGL0V8Z1jNe/mhzSWAwi7DPo8ipjev69ZIbmclSyoIehsZLbyylSdSk20jm4tx6yTKiFOIECN0/2MZejW4P2CzgW1vvDEhMURbuVMeaCFZvKOUNAK9VtSXDlbsqlnbkXjeYY1uYZ3DL7zRpWJSk2AxhjS4niaqd7dZYlSVi+AJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VfWcevTV; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VfWcevTV"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-4e1aa5d8039so712472137.0;
        Sun, 18 May 2025 03:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747565937; x=1748170737; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8n+H86ZLL5zAR4uGMu8GS7+ruBBphwvspKCvbQPyTDc=;
        b=VfWcevTVrJXMtK/X+Wn8oR5Y9/BraihBGWku0+QZIlyZo0kZNgJIacM4ONCDChcyHC
         d4AEafzfhHnxN7TPl8iAF1MYOJ/EV+djVnlPXG/ZNIxO0Hh1kuPFAUT1yCnme0j4Rd0I
         dc/uUy6/W4kZEcR2cB4PmAJwYllml9/yeTqluydfjObD9oAoJfy44AxPmc1LO6DkdNcE
         9YQH1YyU6A7663DtZkLDbgYeZA5tNXtr5NaloXbjrDlVTo53NRfAf2Y2wKPvBb6+raRx
         bB+cwJFBrWr4R1GPYsas9f5lnHp5Wg6Rp7timo6FLpCnkCnJP0JO3NH63gC4VlSuEk06
         xdtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747565937; x=1748170737;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8n+H86ZLL5zAR4uGMu8GS7+ruBBphwvspKCvbQPyTDc=;
        b=q8VOBV3z+Ikdyq0x6lUCrv9kZ1inFS7lAy5lj4pefQMrMyEVeadOcstGtMvGlSOZmd
         iFdyGvitXkQ0evg3a2aYWGOpOlzj91sc3qTw9+QvNzL7nw5IRolmZLCCWDalBTmevMQj
         QNjhF9z6yRVtyrDT+Gl8S+zI4Au03cQjbl3DzgIbZj19ajpaKqmib8jU8WAK/ot4ZCci
         U85NfJO3GN9TDvwEdyZRrA8Ql+Zs3E3r1IkrEP7RwLvTbtQ39eZD15Lsf/frE5ftL2ZG
         eAhljBI308+qecizR91g4dYRXRjh0xf+1J3P/e0foTFuJVycvZlG4DlV5VxTzeM4t0Px
         K6gQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHo4dgI2Q/xZOXFZdoJC+41Ezt3kkgWfwWm+d1Jy73zur4IrCd/2gL9QI7DfzcCouyhdKCG90t+bfH@vger.kernel.org, AJvYcCXl0xjL3saSWzuN8HtolOZsepSzCXWRbt6oC5bDaAMypJqFxXwHDhPbMnN4CAaIbXZfB/g/Is+m/PBr8G4=@vger.kernel.org
X-Gm-Message-State: AOJu0YySUYk01CgXBMBJhABrpPqxBCCdTw3gRKokgracbfKn5oQYvvyI
	iJSQm2gjAFixldxn8oHkzpAiJY4QUDw8wVPQTm14dya9TnDWOlKy65ndJ6jc/g==
X-Gm-Gg: ASbGncsGhsF8z9+JqPDr8PqgHizJxtFiU5InoeP4VhFx6WTAYHeSlWkXlo0soCjp7UZ
	QjsGB/BIf7gah8EXWbT1qMBmwnCQtmvr31zQdHX5dUMoYfG6//EEt8iR52PIX+p78PrmHIPHaZR
	z6jsGTfnoPhoBI7bPP+6jEl08R/tiUGpuoq1WFJLSRdV3SiL1NM4kofKuPHpOEm0aNvV4oIl39U
	XBsvfJ1r7CillTg07T91tfHvdywxNyPyd8qliGzif5ES3O88ZSm+ZHHKlY7EXA8Gam2yqZzX2Kt
	2wC+9vaHShdBkudMXcBrvt46HWj/gUrvJrUDAnjN5iLen/qL19RIygXD37MB3IP59ZF4EpOQJLp
	zHwfatRQhoT9raa/qb1rAs7G9jVa1uQEYx+8AkoT4ZvoX/4mOVCsWjzc4PA0P9cvICvKOFAC9LQ
	==
X-Google-Smtp-Source: AGHT+IEl9irR0u6FuLfHhwoXtd6mLOFkEUPaa1IU6VPGWTz5l/8h3UQP6qS+XRUO9guQyyiuysQbEg==
X-Received: by 2002:a05:6102:1587:b0:4db:e01:f2db with SMTP id ada2fe7eead31-4dfa6944a54mr10717885137.0.1747565937158;
        Sun, 18 May 2025 03:58:57 -0700 (PDT)
Received: from smtpclient.apple (2603-9000-d600-0325-05ca-4eab-4fb3-c377.inf6.spectrum.com. [2603:9000:d600:325:5ca:4eab:4fb3:c377])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87bec1220b5sm4393735241.11.2025.05.18.03.58.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 18 May 2025 03:58:56 -0700 (PDT)
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
In-Reply-To: <2025051804-cherisher-rage-d7ad@gregkh>
Date: Sun, 18 May 2025 06:58:55 -0400
Cc: Thinh.Nguyen@synopsys.com,
 linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <230951E4-7C86-4ECD-9D61-B7936B445A71@gmail.com>
References: <20250516235447.17466-1-jonvelez12345@gmail.com>
 <2025051804-cherisher-rage-d7ad@gregkh>
To: Greg KH <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3696.120.41.1.10)



> On May 18, 2025, at 1:48 AM, Greg KH <gregkh@linuxfoundation.org> =
wrote:
>=20
> On Fri, May 16, 2025 at 11:54:47PM +0000, Jonathan Velez wrote:
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
>> --=20
>> 2.43.0
>>=20
>>=20
>=20
> For obvious reasons, we can't take patches without any changelog text =
at
> all (and you wouldn't want us to.)

  Agreed! I=E2=80=99m sending an updated patch with change log text.

>=20
> sorry,
>=20
> greg k-h


