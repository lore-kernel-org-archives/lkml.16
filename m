Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF9916132F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 09:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743757555; cv=none; b=fkPLts8VqC7cYfMq/Z9vcBOY1462pNUB2wnr1h7A5zloKdr9pp5q/PXG6UVby1p5rcQGJIgpBjhkZvl8syAQNlZ+el7KYfqfHzOfzH85i2y0IwBVR5rqD0wF5VlmcM/yqLhMAbIKjRzg2+cNC8s0jbHcksc7gU1FcZWXjMBM1ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743757555; c=relaxed/simple;
	bh=uhKMFNAVbmR4Kr/0n24Wq5pDZu2LhHwS5o/4unQpAXU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U//jvQVx1Dvhkbo5utzyLogw5j9FlkBQs29RSXGxrCNe0TEcpUfPQxGpcEkVZEa5xNT13AEdpKqDAhSOtQiRJmi6KOn6+T12Z4D/LTrBiFZOaSBFlfKfpN316Ln61NdrXomjLgjobOU6J771Ieda5m5KziilS09LV5L4EkHg0V0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZesPuEAf; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZesPuEAf"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c554d7dc2aso294889585a.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 02:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743757552; x=1744362352; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhKMFNAVbmR4Kr/0n24Wq5pDZu2LhHwS5o/4unQpAXU=;
        b=ZesPuEAfXGTea6dD51j8Jrh8J00FwlRUNJ384NoDRmwBJOBAfYm3Jg7feT4tqxMglM
         wP+YoSRzXZoQ/ZLrfZSQEFcrQZmkH6GBL4FV3kpkVd2JGUwB7nFMzfi/z8NFWCvxJ4Dp
         oEatzBYvcqeV9nQiIajhPsZg5fAAxKGgFgPotZrX9nIO9hYywS977BU00RXhhZ99x+lf
         EIglP2fwuifxeJ9LIWoC/NbESJ5z6OQOTsUFEaEnP835owQOC0kIlxDoKSBHPaDkXym/
         OMj1a22hg1r5QBe1Anv8o9ZLrNbF4aBfkRAbKrq43igz5FGXFVVbmh9V14qgYYzpEFe2
         jHiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743757552; x=1744362352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uhKMFNAVbmR4Kr/0n24Wq5pDZu2LhHwS5o/4unQpAXU=;
        b=ghPlQEAjm9pHxRzBKWkZJETaO8xWM/esDYoAr4mg8AtOMJB4Q5pDZmy1cU3+lmLFvN
         7Wu2HyYUgA7hFZkn2PUfnixjmgbXeHqhYZiAjW+myObWS2qju/XRauVxUmSVeB9xUFhv
         GbNSrjQxwvAlfWFQkN4DL/wpkfGuAUb+zDeZkxVW57oY1iM3Mcph9G6O/tp/7UeloIYi
         3OaxURw0n3I1OP+zvn0wZa7KRPSMXT5nZ7rfj5kXUJJ1jJTGqupyEcuEVFQXC0Okc8b/
         anMwqB8QyPlhmfntEQGbWr3az2V+kLciNpfNgBnuV1PHc9ZpY3mK9cbei/0eEgN3hduj
         1stg==
X-Forwarded-Encrypted: i=1; AJvYcCVcpMw1ySj15kG5gMnFiRmb5k5nHpT0wKrWXOlkQnZY0Y6jTQzCzDlv6avvQMd4ZFom13QHuWjHOqq+DAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYicEIInHrxBEONdM8SEgCnRf0x/sgx/TWuKI63byE/jW03NkY
	SM/uQEkjlsgU5dpgv1gMYibvAm1Ub9v3sdrBA8fKQpKI5krxIlrVZssic4G0HJS7UnFm6rWlXSJ
	SnSb59pYvCI1+3p8pCIk4L3gIU4A=
X-Gm-Gg: ASbGncsgD77L/k63oM7BLE6tBug1sfiejsxyCk7uQMqbwd1azxZc1YEILifOhR/dIlS
	nkCU5KoY+ta/iQSi5251QIzNgC7ztP1JQ9tJWJofwN7Tb76OWOIESF/vFM3Zj8yH4/HhDqovTQc
	sLtVO/5+RZiJj5LZScI3QDNSzd91e1OVacB03hamvPLnnf0fOTxlzWHGTD
X-Google-Smtp-Source: AGHT+IGeB5gy3Bxye7z2MQOfNjxPTBd6g4r626j11K+xJvAUfHLE5a3OVvVAhRJh35DKi5LecvLM+IdQonxpnOsRMcA=
X-Received: by 2002:a05:620a:1a10:b0:7c5:57cd:f1cb with SMTP id
 af79cd13be357-7c774dd6ed6mr310719385a.37.1743757551749; Fri, 04 Apr 2025
 02:05:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403160807.100057-1-gshahrouzi@gmail.com> <2025040429-avenge-camera-8d88@gregkh>
In-Reply-To: <2025040429-avenge-camera-8d88@gregkh>
From: Gabriel <gshahrouzi@gmail.com>
Date: Fri, 4 Apr 2025 05:05:00 -0400
X-Gm-Features: AQ5f1Jo01_JEw9ySJEDjCel8vQNe5KvQVh0WsMLpEgdBI48FpmeYR0ubmuhUQR0
Message-ID: <CAKUZ0zJzNinEqQLVH8o-QKYoZ99VWum-Qtfr+rGNytK44Zzdyw@mail.gmail.com>
Subject: Re: [PATCH v3] staging: rtl8723bs: Remove trailing whitespace
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, philipp.g.hortmann@gmail.com, 
	eamanu@riseup.net, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 2:28=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Thu, Apr 03, 2025 at 12:08:07PM -0400, Gabriel Shahrouzi wrote:
> > Remove trailing whitespace to comply with kernel coding style.
> >
> > Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
> As far as I can recall, I did not suggest this patch :(
Whoops. I misunderstood. I initially thought "it" meant the suggestion
for the new patch revision. But thinking more about it, that would be
redundant, since that information already exists in the previous
version's thread and could be spammy with many reviewers.

However, providing information on how that idea first came up is
useful, since that origin story doesn't already exist on the thread
(countering the base assumption that you alone came up with it).

Separately, I need to make sure to use the official documentation for
tags instead of relying on Google searches and third-party
documentation.
