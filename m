Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2911A35970
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 10:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747305444; cv=none; b=DDhwl4ZWnL3AvGIfpRMLK8nXMfz3ciHkEEflL0MD8AbyEDZtLUnkQJ6GBZlEORFzdIDZpoybdUMdmjeOM7nYs4KuLo8BTegn6VVElorpqlkYQtQ0uhU+tOFZEXo9uXpcmKykgdu27qKOU8I76aerYiseBL1RAN6fvresSkHhzjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747305444; c=relaxed/simple;
	bh=+wjRAScXSzgvB19BpIhCdyPPtsTxpd4gXe6wpMfeGZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mXC+8ajCsLYEpfRRYYp2LV6jHNrgHA7BanQIHv46FxSBROLBvJETES/5+Qe4+lUb7LlJ1EcwuW8iDc+QebE770Hr3VlJBNHUBZIjMXRJuHoNV5+LpS/JwUkqrkfmlqAAYZSMxphMZddh6gX4fFMy8+IDyx5/S48jRmYfX6bUUs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q4ZUFp8z; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q4ZUFp8z"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso6067a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 03:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747305441; x=1747910241; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IOyEGIZY14Q0QON40JEaClFOg/37Fd68MqO4E+e/KNU=;
        b=q4ZUFp8ztm8y5JOckHCbYP+jgLfbXAsfCq1Pdt5HTNSn7su8+ngIM9v17vwqjs+8rz
         lj7CVn+Krh5nnn2KMPlTgerDXzuQRML3gauzsp2Jgn0GeSuibcwO3nzblgr2ZKzmbgey
         ybJurzhZ9EIPF7SIPcPB7+KUHDiULmfhHYOg7fOy2Zs/3Lsf0NJvP9yV/I6unlGLAjXn
         TU0OLGYAz75n6XJflUNRveWidFSdHqvF83xrcDEETmJFpNG8pl2pB1A2fw+Ma/ACw5rf
         qYuhl5kGC+5eQe2UlaqjHfBjTsQHA0QAavexLEQbpS86q06bOSXk06IGB/RzNdNnXUyQ
         8cfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747305441; x=1747910241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IOyEGIZY14Q0QON40JEaClFOg/37Fd68MqO4E+e/KNU=;
        b=HBQ03DFdnQ1S7sr94qEk4IV+jIvsPppOro4PRVL42CSqdnamcRP0J/tZaVxoq1vRuq
         R3Am4nvLfC2Z1D/FbTXE+VA8DsoEgzD1Xu6WUtg2AB0mjUQv4kW5apVSVWbdSCok1LE/
         1X/MqQqblXThzN2IVe8+E/bwh+HHQWpXZ4eG1Qw4pZbWmYwRKntSqVbBTFEMIVLwt1NU
         31H/o54eFOPia4GkkKQlLYPNhiE/f0QujRuReIAjUEp35Lxd+9fi/XRJ9zlsgpXCqZIw
         yCg1Vm6qRDJjNbp5zymXSSwqNv7D63EvgkC5XTTeKtrcmL0UWbjLV1Pc2xfMe96V/tM1
         jPzw==
X-Forwarded-Encrypted: i=1; AJvYcCUQJVU4nLAo/FXUU/OHivhVyWEDS4OtCsvV/ADK9hNHy4wlxgzX38Z19ma9mSsBijuGLEgz1dv2qTrFP9A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9MWFLdlzETx13N/yx72NFt5ndcShNImpAbD2NCw1yw/omLYB3
	Biyz+6F6/NJdEcOwQcnfZZxGb3eSUI++B+yuQjVsIuFl0UjlNexEcugnnIM1QRFUxPOXGnFsegZ
	FSrFizfl/aArflcupHKhu2sKVns8U4HJmN4XblGLt
X-Gm-Gg: ASbGncut1TB+VCdZAM/OUzUldERdwbjpJLnlltzWsh43/tLLlDM6XHhtVMdWoa950Md
	4DQjRN9NXvJnC1236qT41iX9oOWEPiI3YYyOeTr/d4pNpoL+pJBZlFCOcZoO/olUTrKzdK9XRjv
	RWyCWRIV0iQqyd7LVjxnbOKlXV8ySspcWllILLcPMV6buoE9n6ffYvt5zjMmkJ
X-Google-Smtp-Source: AGHT+IHVZ9dwdfOWvJnGOjqhvJ7yNFKAbT/ygs03kjgwko1r6U4Op4G9H/hFpPY6KpGZsbCOfJUupejsk4TIyVbQ+L0=
X-Received: by 2002:a50:fa8e:0:b0:600:77b:5a5a with SMTP id
 4fb4d7f45d1cf-600077b6b0dmr17921a12.1.1747305441255; Thu, 15 May 2025
 03:37:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416144917.16822-1-guanyulin@google.com> <20250416144917.16822-5-guanyulin@google.com>
 <2025042543-unfocused-whiff-fa7d@gregkh>
In-Reply-To: <2025042543-unfocused-whiff-fa7d@gregkh>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Thu, 15 May 2025 18:37:00 +0800
X-Gm-Features: AX0GCFs_IH7rNznpdcjmKTqpZlpH9xy3qHAYXHdNiVTjH3SSwW9wTPjVkKFUNKI
Message-ID: <CAOuDEK1uRyxHo90TUTyyVVV3W+ubkmyGvehxTdZ6NRg8LWbXbA@mail.gmail.com>
Subject: Re: [PATCH v12 4/4] usb: host: enable USB offload during system sleep
To: Greg KH <gregkh@linuxfoundation.org>
Cc: mathias.nyman@intel.com, stern@rowland.harvard.edu, sumit.garg@kernel.org, 
	gargaditya08@live.com, kekrby@gmail.com, jeff.johnson@oss.qualcomm.com, 
	quic_zijuhu@quicinc.com, andriy.shevchenko@linux.intel.com, 
	ben@decadent.org.uk, broonie@kernel.org, quic_wcheng@quicinc.com, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 7:15=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Wed, Apr 16, 2025 at 02:43:04PM +0000, Guan-Yu Lin wrote:
> > @@ -724,6 +725,8 @@ struct usb_device {
> >       unsigned do_remote_wakeup:1;
> >       unsigned reset_resume:1;
> >       unsigned port_is_suspended:1;
> > +     unsigned offload_at_suspend:1;
> > +     int offload_usage;
>
> Why is this moved now?  Why isn't it in the proper place from the
> beginning?
>
> thanks,
>
> greg k-h

Thanks for spotting this. Let me address it in the next patch.

Regards,
Guan-Yu
