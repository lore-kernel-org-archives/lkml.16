Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650791448E0
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 04:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744433030; cv=none; b=aMCPZyiCnJfW+HakuG83sZOLYrcoL5HF2MWeqpf1vUbq47kX59DKUQtTpwjyz90m2MjUvkInAhuiw6gqI9kdcAYCmvOrhEjyglVhfWhT0nuCCYSCrOWaEUY8fGrGP2wPXMMcLrlROkpCxwoID9d7/kR6qIDBfXWKRRQnfdpdAV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744433030; c=relaxed/simple;
	bh=EylllJImv3qhzLeg7Hz3ocN2fi83rwMC9jhdkJm3RDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UGvk0wb+btzAptxVsW2TNHNz27mOe/1cBce9S5L4qs7+o+5924GiBJ/+sbYhCSzVFbhmu2djjehLlUQxS6lVAzUTqbTJtoM0y0m4TMwbQjXXSXCx+xrJ+NlEH+3vP8603UMk2Cb3B3CgU6YxUo7DjP6/Mwz6qE+UDtJkmQu70+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SEpzgaz+; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SEpzgaz+"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54b0e9f2948so3598e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 21:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744433026; x=1745037826; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HnTCsDVWU5J4Xw4ABLK6h0NzKq/dBZzCAzPAZFSnhMY=;
        b=SEpzgaz+3DEDWH3RUZ0cxdmerJuDZzGejGEcdGDo1PWNdM48Hy15Tn6Wy2dA0AGzdI
         Ht/NzzfAvawgMF71ST+ak/PozYgQ8PaZ6SP8pOUJcLdcDwbvzKamGpjs5LyKiPssPiVz
         ZWIWj8uIOQEY1GUVmLKqxlv1he+/SJi4RjpLoHaT2YT/AmrJInH3NpbnP5vUZfOs/DaC
         ht80H1KWevkt3mu45tQ0RjKv5abpFpJeWWK/OA4tSPYKJ0x9nL8SHjTIXS8CC3QfGydZ
         j3AMg/RyLknEeuofucC3kV54uLzNYacqPAW5PwM4RF4PNaoWHHGTYUfDm44ZVQ820cYQ
         hjRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744433026; x=1745037826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HnTCsDVWU5J4Xw4ABLK6h0NzKq/dBZzCAzPAZFSnhMY=;
        b=Q3JR8vd+p9Ibs7z7MLevv+ngBA+MMeDoeRItWzP23t3PLZWeXtHivLyTW1Y3hjbAIk
         F1N51bxLW/VnurBpR0ZdPbZVitWZN2RT2jrYnEx2hcFoC2KxSX0yMMCrt5G5OY4bKoYX
         zhxdIRqGtcnE5JiaoeW8SLTL0EavOGr+wLTUrDJdvQw2dUrw0F3biQxAvYNNnorn5Arn
         2kHkA2Vx8DhOUvmUeW5v54DsOU5Gki2UT4Bhpm1czTq0kga3eCeTgppCcCrrEMXbMU5a
         FL9QlXgOfcXI4PGr1CujaMWE8AxXmVWcoKr8S1pSZIEqipiLd6ri6LmoIQOMgu5jSiVb
         b03Q==
X-Forwarded-Encrypted: i=1; AJvYcCXDnDf4QfJXNpX3EzI0PlYlfC4LxAW7DKjhy+cOze1h5aO2V0ARhyiDuR6WCIO82itDlnnPU+dOHoMNKYg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIXLW9OfLoxxuBPhqJe+s57VyzHBkytNw0trY1J4VhBRJNORIO
	P42nIWPcqsvP6bbhygF7JG6lY/VY+O/QGvjD0Odksgl+RLr1l6jvWVMOT6UE+Uitv+MQSL7W3lH
	Qgf60ZlTuYnqlP8jRUUslCejGNkly4wTsv+jS
X-Gm-Gg: ASbGnctANikKYU/yVG481D/hbPMf3xZ3MflVMVlO5dpbJfpzjTpM5X4JFD6odOtmvkk
	07rZwSAB48VIxY5QVfvVBidymu8u3PY6bynWlEMHfxR/tdt/+G66wC/ZM4H1M3ZNZYwwhjFkA/R
	5hk9/svkGOk9PeIJrMJZzbBgCo
X-Google-Smtp-Source: AGHT+IHnstA8OniMve4EXZITU1zVCY4y154h9HimNAz/Uo0RrhTicjqylKIFQodk/tjVtUv8odT9lNWzhaGFZHXckDA=
X-Received: by 2002:a19:4307:0:b0:543:e3c3:5a5e with SMTP id
 2adb3069b0e04-54d4b942080mr108384e87.4.1744433025987; Fri, 11 Apr 2025
 21:43:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327133233.2566528-1-khtsai@google.com> <2025041149-krypton-rejoice-bced@gregkh>
In-Reply-To: <2025041149-krypton-rejoice-bced@gregkh>
From: Kuen-Han Tsai <khtsai@google.com>
Date: Sat, 12 Apr 2025 12:43:19 +0800
X-Gm-Features: ATxdqUGbABxzaqNR9ApS36LdZlULbILlznZJz9K8NT1T8kLwQpJDLD7xl2RobSU
Message-ID: <CAKzKK0rDnEzeV0CuQdki3Gzh7yCvx_roHo4axfTYpN0V1Sv7-Q@mail.gmail.com>
Subject: Re: [PATCH v3] usb: dwc3: Abort suspend on soft disconnect failure
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Thinh.Nguyen@synopsys.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 10:23=E2=80=AFPM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Thu, Mar 27, 2025 at 09:32:16PM +0800, Kuen-Han Tsai wrote:
> > When dwc3_gadget_soft_disconnect() fails, dwc3_suspend_common() keeps
> > going with the suspend, resulting in a period where the power domain is
> > off, but the gadget driver remains connected.  Within this time frame,
> > invoking vbus_event_work() will cause an error as it attempts to access
> > DWC3 registers for endpoint disabling after the power domain has been
> > completely shut down.
> >
> > Abort the suspend sequence when dwc3_gadget_suspend() cannot halt the
> > controller and proceeds with a soft connect.
> >
> > Fixes: 9f8a67b65a49 ("usb: dwc3: gadget: fix gadget suspend/resume")
> > CC: stable@vger.kernel.org
> > Signed-off-by: Kuen-Han Tsai <khtsai@google.com>
>
> Always test your patches before submitting them so you don't get emails
> from grumpy maintainers telling you to test your patches so that they
> don't break the build :(
>

Hi Greg,

My apologies for submitting patches that broke the build. I'll be
careful to make sure this won't happen again.

Regards,
Kuen-Han
