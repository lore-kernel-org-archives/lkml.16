Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D75D1FF601
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 20:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744056305; cv=none; b=hrXZrdCrd4ukSebU7sWSCJTZKhBSoTjx6+/qKCyRRHlKKzRVIwJKKhnkEfZ0mNm5Q7wDSKV2ZdIPOTMqECYQ97I68rV+Y63HIU/8aLuteV7heTXApsS6rgOqCEeWrECF0zVt9JHDU3SeYS4hK3nevtpLtbl7aJsedG8+hdCaYPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744056305; c=relaxed/simple;
	bh=fm73ijbA4AEhWXK9NGxQM7eAAsPeIxu3JLQ+krLfZx4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D3cwe0bQAylk2H5jd6gre8tJFRcOiAYLlc0BRpA3d6DdbjfKQxoQdSrctPSqp8heLwJBDKdpL9tspdbcxAYFSbgaMM/ljfhsVUixz1Wt42QMzAWzXqXc1Aqjroivx9/OPw0UqJzZ9nIpHzhWPV/Lh1QTahHXTwasGvkE2f2TLm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com; spf=none smtp.mailfrom=wkennington.com; dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b=RRmnUKe/; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b="RRmnUKe/"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6f0cfbe2042so7277056d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 13:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1744056303; x=1744661103; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fm73ijbA4AEhWXK9NGxQM7eAAsPeIxu3JLQ+krLfZx4=;
        b=RRmnUKe/T28jQUWp7c23qKeB6ac7OvjHRc/7BrOsUqUK0g1un9FuG8Z1b8xzU6Bdhf
         aFAS7UVl6bqPWbfsVENMArDhs61usHkaoS39CQ01NaqwCXhuO+69yDZOBouFDlA9/de1
         WcKcxPH+eifumw553IiY2J4CQoYbRiZzugf4P+3pZuv1kn8fUSV9VjoOXtHtZeNKYVg7
         Wl1H37e1CzJkHNIB+jh0RKRxbnZMCJDSmsaSIe/FLsNL+q9R7LAzTIgMuWJuBFFQx5Yp
         gYRXvDs34qd2jlSXXVKuswBsSUGbIYTogNch5FMvf/bOsxNe7D2ZpAOtiFL/ymvbnvWo
         FjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744056303; x=1744661103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fm73ijbA4AEhWXK9NGxQM7eAAsPeIxu3JLQ+krLfZx4=;
        b=kFyfz/L8n5l2vQmXz6mg3sb3jRS0dMdkkyEh9NgcllqozNZst+8biVq62H4TVA66/A
         ArmaShxuV3oMC1Nk0xI3LVOFe+h28wXQg5CXUHD9MiyJoxmFoeaYqfOC9L6luTzEIO6c
         qEIRJUYJUEdWY/04/NEv1polRT4L1sSelNTdW+nBtyKSXFF0lAaOElemyjaqbsI6HKE7
         QT5XOVuBMQgzem1jtvxeyswoNMOEkckvGG/AGe6S6rGrGvOJB0cmR4FT8/RFyXN4pOu5
         fBMzOhRErKLEyP7YR7hp+vyAWXjnNw+h97P/7gQgbSwNxnEt3+kBIxNluoOUndervw4+
         9dsw==
X-Forwarded-Encrypted: i=1; AJvYcCXJIDFrWdqSXSPI0uNfN6GAUluDwHTSUqaX9qUbbLbPJlzgNKRI0yF2amSxjhldeWh6mXxZqGRNrra5TpQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZZ/F7YtTQNZxVJfAb/GgM+jwCXqPGl637sLhbL7lZ05Q3OPPl
	Zdow4KszeNNPFt6bqlCMa4lyOGUVqVdo2nzMEiPoZ/v0RJBwsroNuef/jrLgydcSi/9k4WLPxXe
	tPv0Swn4fJ64Jfduml5GuoSdrB2MhmeI/kwlMGA==
X-Gm-Gg: ASbGnctEeNXw4k6EvFpsSCr00A/BBwKGcaQCASRXn3MKU6iW6A/MDwQRm1rmH1gJIfT
	/NHhdfrahy1Q6hGUxRtT81O+GPdlp8FdI9ArFjwrb50s7xUtxVmEVaWdbUuoU/gatp3bNKa59nE
	hcXxUWco44lnWtTSatJ2x8KI4XJ40go+X3KE+gYzLOqzzfIa+75JWwFOOe+W3n
X-Google-Smtp-Source: AGHT+IFtx6dT5DSs3sTterG6CM1nKdqGCIiyPeM9wRE0wJgaTgDILFCrLS32GtEnAfJmptq3sO5lQq/wSnSv9pf2Juo=
X-Received: by 2002:ad4:5bca:0:b0:6ed:1095:e9d3 with SMTP id
 6a1803df08f44-6f0d254f9c3mr10640966d6.14.1744056303132; Mon, 07 Apr 2025
 13:05:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403211246.3876138-1-william@wkennington.com>
 <20250404193103.4174977-1-william@wkennington.com> <295ea363-dbeb-43c6-b8b3-3992776b84c0@roeck-us.net>
In-Reply-To: <295ea363-dbeb-43c6-b8b3-3992776b84c0@roeck-us.net>
From: William Kennington <william@wkennington.com>
Date: Mon, 7 Apr 2025 13:04:50 -0700
X-Gm-Features: ATxdqUHQCR7kbQwR_HHylO85SDnwjBICFfQfX39-VfWHJyd7A0SEVwKQP1JYsKo
Message-ID: <CAD_4BXgx0Np8XU1afhybtC2cTUMYPm1ajiT6F3S3Gk6RGmVZUQ@mail.gmail.com>
Subject: Re: [PATCH v4] hwmon: (pmbus): Introduce page_change_delay
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 6, 2025 at 10:28=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On Fri, Apr 04, 2025 at 12:31:03PM -0700, William A. Kennington III wrote=
:
> > We have some buggy pmbus devices that require a delay after performing =
a
> > page change operation before trying to issue more commands to the
> > device.
> >
> > This allows for a configurable delay after page changes, but not
> > affecting other read or write operations.
> >
> > This makes a slight behavioral tweak to the existing delay logic, where
> > it considers the longest of delays between operations, instead of alway=
s
> > chosing the write delay over the access delay.
> >
> > Signed-off-by: William A. Kennington III <william@wkennington.com>
>
> I tried to apply your patch, but it fails. Please rebase to the upstream
> kernel and resubmit.

Done in v5

>
> Thanks,
> Guenter
