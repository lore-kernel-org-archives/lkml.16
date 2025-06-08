Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5C219258E
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 00:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749341260; cv=none; b=OP14XAsMXpDHvnHUypQQQw0buxmT+ouHiLGAlIDi8lqlGerzfXvzk3eSXN83BMsHhZN6xSuSJsgkKCg1ibyw5YO3PzGkFLrBIXBfPm/Rhq7DVTL2rxNG8e7RJP57GdkuSVX81P5Z0LUYX3uNEeKt/P44xnYVRmSt0CoyvUmY6nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749341260; c=relaxed/simple;
	bh=0UHtAUcnJfFf44KjoiEAzK/GgbeDg6XEKPgsifKNFJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=teosi8pihm1b9b2AcKgNRIo0V237yOEl7JfH7gbJB4gd32ESWHLJ9i8H5Wi3XhBgVlFdvsl16o4qLpaMETnPfi62B2ZcK1ba8L+p66JILDWIGUQcjkbUh29BilMLhWdfoONzDfnc7gr5IAjHBxNPk1XCXs6TaQIv281px8G/h3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=bo5ZRkmi; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="bo5ZRkmi"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4a6f6d52af7so4554511cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 17:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1749341258; x=1749946058; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0UHtAUcnJfFf44KjoiEAzK/GgbeDg6XEKPgsifKNFJI=;
        b=bo5ZRkmi673wFRTTZdjmi2VX+/ESFRowURL0Xy3X2kYxQmK9Ij+JLv7xGoaSv0N4i9
         Qc+DoysiXzeDzW1zONrbKWziPyIp2Udv2KGvHsqbFodiADzcq8DW3vnWfs4wwuAieJhR
         z91O2ivXuTsrMCVshK1xS/kFZ1PoACHbYsMNJN2RnRnwBe34AZmfcpDSKoC2HQbhBfgk
         sXtci7tVscfGRaqS+EWVtwrQoWVRCRDtODlUNEjl5dLEjly1/ZZ/S+UR3hmCzFiQS+Ho
         dT8bMjf9N8nBhltzA2oW63+TeI1z3irlhAOwGQX6jkS/V8F3sc+fYdFna5tWsQAurx/M
         gjLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749341258; x=1749946058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0UHtAUcnJfFf44KjoiEAzK/GgbeDg6XEKPgsifKNFJI=;
        b=PYm9gMgwHPy7Jp8wahNpaNUGrh+AbYseOm0cgJ+fqdlMQw9Na7U3HLdhPbQ+Mu65UP
         duuuwjweaeUXoiHaoNPHQn/kD9mZNhzTV7u86/DaRhmSye6QsLcwywl7sxigtdH/GR5Z
         i/f/BcPNYq6UTA58+CByxIRljK/kVzF4Ih6Pi+66y6L5cP/Kpo/9WKZ/pSmCovMbvmf4
         8rtbg8B1Z6Yo8DOZ9QhonBqGSXrdtMNOd8aktVROBNIaQG/7KNeluJhUGMluYatS3EyL
         zNcCHh0X77U+sGp6U9qC6yy6umGvZ0Wqm0cEHblX3ngCWSfwai8MC1dpClHcHKtfjWnc
         x04w==
X-Forwarded-Encrypted: i=1; AJvYcCWpikR0PQkiilNiw1DB5BWv0UF1Eucjys5YBcQcQM99kQ+LQnd4IyCPOvPuZfYi1eNAmvJYe0L8bLYbjko=@vger.kernel.org
X-Gm-Message-State: AOJu0Yze/a2ATAvGQrm1k9J7Ux1AAZyMcNWyHXJW/M6V2sddPTgATf0c
	EoupuhHWsbyjFQs7fQCFiNLkepsX/dEGd/GA9QUycj2xHhkfXtQW/LPISoQoy08UYRVTkbCF6NQ
	pb6R+u1uRv4TRKaQVgk7+SQ+HN8CV7rmCU9UzagnloA==
X-Gm-Gg: ASbGnctyMS4EHkjdt9n+c/yO9ZernKcePlW/34qFyiiSVAw/IOVqSDxhNkor5MWBcYz
	eEIRMSXGBdvYR4sMxn1jNy3VrTsDYIF5wk6Gm3Qq7eDluCc+g8VGd2WU0ILlRV+U7D4cUwKv3KZ
	nmW7ud8LbQzvdX6AH+9DBVhm4B8EjWW7UltpYSLqmd
X-Google-Smtp-Source: AGHT+IGZXoZIxS9/yln1HGP/gC39IRXpdwmbCIccfIgA/QRPKVyeFdcL/3Evwv4wy0rGEIkAT0IK7awaOmhPrDGklrU=
X-Received: by 2002:a05:622a:2287:b0:4a4:4da5:8b55 with SMTP id
 d75a77b69052e-4a5b9d39e8cmr156784701cf.28.1749341257836; Sat, 07 Jun 2025
 17:07:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+Sjx0XP2A+rsA95NVwX7czQGNREXcFT=psedA7fawwKJb5rkw@mail.gmail.com>
In-Reply-To: <CA+Sjx0XP2A+rsA95NVwX7czQGNREXcFT=psedA7fawwKJb5rkw@mail.gmail.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sat, 7 Jun 2025 20:07:00 -0400
X-Gm-Features: AX0GCFt1ImFK2hsbn3A789K1X_AfOKzUxJEaw3s1RQYNVvl-mWg1uEajt-sMD-4
Message-ID: <CA+CK2bDJ6eYrVh4qewzH63HUUwKwGjcw=e8NhTF5AQ3f3N01cg@mail.gmail.com>
Subject: Re: [RFC v2 08/16] luo: luo_files: add infrastructure for FDs
To: Anish Moorthy <anish.moorthy@gmail.com>
Cc: Jonathan.Cameron@huawei.com, akpm@linux-foundation.org, 
	aleksander.lobakin@intel.com, aliceryhl@google.com, 
	andriy.shevchenko@linux.intel.com, anna.schumaker@oracle.com, axboe@kernel.dk, 
	bartosz.golaszewski@linaro.org, bhelgaas@google.com, bp@alien8.de, 
	changyuanl@google.com, chenridong@huawei.com, corbet@lwn.net, 
	cw00.choi@samsung.com, dakr@kernel.org, dan.j.williams@intel.com, 
	dave.hansen@linux.intel.com, david@redhat.com, djeffery@redhat.com, 
	dmatlack@google.com, graf@amazon.com, gregkh@linuxfoundation.org, 
	hannes@cmpxchg.org, hpa@zytor.com, ilpo.jarvinen@linux.intel.com, 
	ira.weiny@intel.com, jannh@google.com, jasonmiu@google.com, 
	joel.granados@kernel.org, kanie@linux.alibaba.com, leon@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux@weissschuh.net, lukas@wunner.de, mark.rutland@arm.com, 
	masahiroy@kernel.org, mingo@redhat.com, mmaurer@google.com, 
	myungjoo.ham@samsung.com, ojeda@kernel.org, pratyush@kernel.org, 
	ptyadav@amazon.de, quic_zijuhu@quicinc.com, rafael@kernel.org, 
	rdunlap@infradead.org, rientjes@google.com, roman.gushchin@linux.dev, 
	rostedt@goodmis.org, rppt@kernel.org, song@kernel.org, 
	stuart.w.hayes@gmail.com, tglx@linutronix.de, tj@kernel.org, 
	vincent.guittot@linaro.org, wagi@kernel.org, x86@kernel.org, 
	yesanishhere@gmail.com, yoann.congal@smile.fr, zhangguopeng@kylinos.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 6:28=E2=80=AFPM Anish Moorthy <anish.moorthy@gmail.c=
om> wrote:
>
> > + token =3D luo_next_file_token;
> > + luo_next_file_token++;
>
> This seems like it should be an atomic fetch_add: I'm only seeing read lo=
cks up till this point
>
> (Sorry if this is too nitpicky. Also for any formatting issues, I'm on mo=
bile atm)

Thank you, this was also found by other reviewers. I have updated this
to use atomic.

Pasha
