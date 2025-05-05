Received: from mail-qv1-f97.google.com (mail-qv1-f97.google.com [209.85.219.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1361C861D
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 20:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746477267; cv=none; b=ARLeOZ9QqlWkhXLlkkX5rfOL2pgrJmN0AoM5BxVbLlCSTg/P+Lxx/JFzr2HzwmHFfu4IiXmgmywRyTB1uTdCnEBL4kSlW4yrlOidgtAg4KV1Giye4DOMvGSNHogBCS4DKCfYHA/CdDAgm2xmdNfVLyIxWKabzA6wGdtkdKrFTFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746477267; c=relaxed/simple;
	bh=AQiFzZ+hioF3/4ec4StyGYUiDu4auMssToRPssmrwCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ifobu1oww+YHHRp1YZoOvQr61d/Sh/uraJej4HE+Hra+iHxFNgZIVwhhpSZtLgq2otFc/qufpp9NYZUHDu4Vecn04E1N9tIYX7QBoyJI3g8qJOZRlr2rW+uIIpkqIu12fQ6R9bSKcJmBkV+az7E+hvVrooggF4Nb6F+38IsLRx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=RXfuiU2B; arc=none smtp.client-ip=209.85.219.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="RXfuiU2B"
Received: by mail-qv1-f97.google.com with SMTP id 6a1803df08f44-6f0c30a1cb6so36051916d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 13:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1746477265; x=1747082065; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sjt5SetEQVeK+FSr50cmz95zo5QuMyYcarl0Ii5W2m4=;
        b=RXfuiU2BCnC37wgciCr7iHmhUKd6bP4+1IFDfwyTw66vCVCCqbZEao0yy1xaZwthmI
         27v6GVqW7vj1EJ8hFCc7gai1I5tWu881PtmUD7UkE7R8gHFLRXnaMWLkQMYvL/t+RmZE
         J+ikBAmPthXN87sVI5JouelGD9TrrZO3r1l88CcNMFJ3mXS8hK3lF4ZarGaXys1n5tgQ
         0a+JTX6Uqq3oAdaJk5yHY4hUJImQ9d2JNGc2fi0YqGNshlnNHu2KvkSnPkyX2bMPCDEN
         +ie59/N60uz9kSKpCY9wrJxV2ZTUaXlL78P6pTIszkGfXil7KRw8wSiuj0Ivb4B9ZXpa
         1bXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746477265; x=1747082065;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjt5SetEQVeK+FSr50cmz95zo5QuMyYcarl0Ii5W2m4=;
        b=F+qYnufr6/LFI4E2nd882xdTe8HnbY1kawgYdxIch0Cxejz2aD7snV55GzoUq6R/Tf
         wGKPPDtWLJLtK7ojKJRlANMtlnwRaQbqcxuEm2Tsc0mZLzpBiioiaC5E0XOg/3b16Sob
         IxMwXMyO/Ur6BovG4CF0PambiLzebOOvZQk3XcBMoUzeC+o/gRN+SUDoCKw1xJJdvQ4r
         5HnfVY5NsyKdWtAS81JUATtz5gdqfoNrkFDqMkYLiG56Zm0awzkUF35ZSv8qfSizbexh
         7KkddMX6XnKQqkiDPAl2FAZlPS022yWYBXZLsvI/SqPl1LBGi5ujWb+soWC+Sf7Mzkmh
         fBXg==
X-Forwarded-Encrypted: i=1; AJvYcCXbQbeKb/fT3fo58e72x1s3MZ5P4Mni005eoInbd8CdGZUwvKRXwCyP2UKXkrmACzi/Nx5/LPcW9p3RPTk=@vger.kernel.org
X-Gm-Message-State: AOJu0YycGSK8bXd8gxHk3gkfe90RuJixaBTQ8aqOkKFgnls6JpMVuurt
	70ozdfNkmx9qrUWLAfM3oj7gtT9XVS8DHICKWAA1O+KkHs7Nkxl9KJljqfDcApvJODAqgiNUSRG
	AGl32Xs3aEYI2Hyo/XfO/gZC0XWsTismZ
X-Gm-Gg: ASbGnctX+QR6LN/a7SEUL17D94hF+BgFXMdqKyTSXTuyl6q/MtekXI5EdeUiJrBYXbI
	0BcqAEL9Yl/y7MjgT1frH0/9g2Uy60h9XWNAiwQ2CVTrl7ur6Nx8T6QGPLO+TnIxicBjMErg/pE
	BtE3mUhcuG4f3SInicMJgBweCTZvmuX6XIwCKK1RA4n92122rzo85DLxbJvVgAiVZLmUca8Lk3O
	8lyB2uietsmLSc3HRdEDRN6EiR84oH9V6Mg0SBSuNHkCmcFRPY7l/4cIJzLnOKRxnxJWX0FnvmW
	xHOQl5k/Rb4NLikTQRLUYxOydIOv4PmgyDzBra72LNUy6Q==
X-Google-Smtp-Source: AGHT+IHDhruxKjn2niV28wBPJpKZJOMbtoa+Ime0L962AGQ61i+87oKEyyTGXvRQxnnGlsuLIRHOP/l8m+Wf
X-Received: by 2002:ad4:5c8a:0:b0:6f2:c81f:9ef9 with SMTP id 6a1803df08f44-6f528cf8e94mr138201146d6.33.1746477265123;
        Mon, 05 May 2025 13:34:25 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-6f50f3c3363sm22898456d6.27.2025.05.05.13.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 13:34:25 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [10.7.70.36])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 5D95A3401B7;
	Mon,  5 May 2025 14:34:24 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 52ACCE401BF; Mon,  5 May 2025 14:34:24 -0600 (MDT)
Date: Mon, 5 May 2025 14:34:24 -0600
From: Uday Shankar <ushankar@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] selftests: ublk: more misc fixes
Message-ID: <aBkg0LW5YO6Osdnw@dev-ushankar.dev.purestorage.com>
References: <20250428-ublk_selftests-v1-0-5795f7b00cda@purestorage.com>
 <aBkgLOxWLp74TShe@dev-ushankar.dev.purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBkgLOxWLp74TShe@dev-ushankar.dev.purestorage.com>

On Mon, May 05, 2025 at 02:31:40PM -0600, Uday Shankar wrote:
> Hi Jens,
> 
> Can you take a look at Ming's comment on the first patch and merge the
> set if things look good? I can rebase/repost it as needed.

Bleh, sorry, I meant to send this as a reply to v2:

https://lore.kernel.org/linux-block/20250429-ublk_selftests-v2-0-e970b6d9e4f4@purestorage.com/

