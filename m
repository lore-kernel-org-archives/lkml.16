Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0091E2602
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 19:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750102987; cv=none; b=JyRES+/5n5+yqwXqJSNMqQWK5BQHJJX13dk7/hSDufL0zvNzPkRZjL1S7X+l9nn+fWSsFvOd8Jz4nj4zOTNle9EOoCfwVshKWX54S5LqI48C5ch6oKO39BsQttSolA7qRZR5J2J5H5lDeGNF/EB0GslmfPTmq/hk6Tbqeh8KK0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750102987; c=relaxed/simple;
	bh=4GXtdJIt4heRHXVxGyZI7LVV8sINiu3XKNwn1Nmm8ac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BxBw1P+8wTa5iCZWdFXeUBsR6bqceQSkfyoiVhm1gEKN4FKuJePDQlWoYkoWBkfZ1FeLum8bWsdlHHPrQwR7joi2SjdOd13cOKFGFYUAgt+RTjLi7dfgz7yC4VZHqAxzB7TQGv7epPguoPpdWTFExt+FdqeK2A1FSdhyB4ZlVn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cx2HqPE5; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cx2HqPE5"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-73972a54919so4270266b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750102985; x=1750707785; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wt5vEBoX/7CZPzuyH4aIpdA7WQr2k5uAvo+zHY/RWMw=;
        b=cx2HqPE5ITLOKP+itfe2BXrgNdhPZb+jEZjU9WLTxUjfKorOhsZI/s3nZcfRBUGcCs
         0M1rnl3tlnbtaN+cdbPnTTykvmIWwvFFnqoGE+yXkGeeeLmQz6WCqU2ywL4Hb1NcYBZZ
         I+y9YWS4PuB47HnC5QhIQDgVZA5PAVnsseRow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750102985; x=1750707785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wt5vEBoX/7CZPzuyH4aIpdA7WQr2k5uAvo+zHY/RWMw=;
        b=ZzZ2DZkuLSIodcZwPdsCgqyMPiAa+Rv/1F8Zinh/81J3QFw+MwDZENwgOhMa2SwD3k
         zpv6+x6kIrVQBHs8LZeFdybBiBmbm3m1TmaYGddMh3RwjvA3uEr0Q44vn1XajgZwiWDo
         YixK3uXiO1PcevVZ3FY1M9qCJ1i74v8OVAsgw/EKkAa1eFr/F0IDJUyJaP3nxqRpXs74
         9xkBX247iSmBgI7oyyhbam5PCMsInTgYj6Ylk/WGU3KUausC5G3XgOUjiwqZiwwADcHl
         yg8T3RPNC4OUyquodroIK4ObZi37j6WdWYAPPlLjKbQT0dmbnzFcaDUfZLkhlQUfkWUo
         /aiA==
X-Forwarded-Encrypted: i=1; AJvYcCVc4BoZK2/1jqWqEWKasEGVLAvQcXEy2he1oOnRA3gcSAOCuVPtRFG2NQJjIbbxUF1jNxe9ww2z3TdLzXc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgO0DPqEpMMGyP7JGII5Ux2INZFkAugGCRf0Xn4EMieJGuINje
	5hywGODADD0rsZzv2thNDqxrTVD1pfVIlaCBOvwu7gxRhVV5Gmi87SJ65gPY2wNqh4459KajWWH
	DTCA1XqWxRE+nFozWfUxJ5cRmHGD4BquT5DsW0DKl
X-Gm-Gg: ASbGnct5gky48t4sJMb7W0i+vfz2GZ+g2aNA7fngbAxBdi1cTG0vT7hcOn4gWYco8vN
	aHHue5NbQamPbatY54D08NpfYqV/MN5NkKm2SDqrtjGKjFuW5epx98WH6OAjtxe4eRIoHGKpvil
	KzrbUaQ+fXdJ4mxmB3oRD7WpRtDu01XX6yWfmkshHZzw==
X-Google-Smtp-Source: AGHT+IHg3+dqJWa4H+fZqAabDzILCcABfw73ZiZnurFMysI5YMbqJFlOWJudAKNQbZsNaHnRlMJ68o95/n7AayxSldk=
X-Received: by 2002:a05:6a00:3a04:b0:736:d297:164 with SMTP id
 d2e1a72fcca58-7489cf6aad9mr14779236b3a.1.1750102984856; Mon, 16 Jun 2025
 12:43:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616133147.1835939-1-akuchynski@chromium.org>
 <20250616133147.1835939-7-akuchynski@chromium.org> <2025061623-ammonium-outskirts-e89e@gregkh>
In-Reply-To: <2025061623-ammonium-outskirts-e89e@gregkh>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Mon, 16 Jun 2025 21:42:53 +0200
X-Gm-Features: AX0GCFtdGIjZUFsa_hlqAkw8MFj1EgMmaIch8V2HBLolVrJ7BiBJkQmysNKbhAw
Message-ID: <CAMMMRMebxSLorxTRzre6MDEn0bdC3hrNVQzZyf0NH=TNUk+YGw@mail.gmail.com>
Subject: Re: [PATCH 06/10] Revert "usb: typec: displayport: Receive DP Status
 Update NAK request exit dp altmode"
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Jameson Thies <jthies@google.com>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Guenter Roeck <groeck@chromium.org>, Pooja Katiyar <pooja.katiyar@intel.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, RD Babiera <rdbabiera@google.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 4:15=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jun 16, 2025 at 01:31:43PM +0000, Andrei Kuchynski wrote:
> > This reverts commit b4b38ffb38c91afd4dc387608db26f6fc34ed40b.
> >
> > The commit introduced a deadlock with the cros_ec_typec driver.
> > The deadlock occurs due to a recursive lock acquisition of
> > `cros_typec_altmode_work::mutex`.
> > The call chain is as follows:
> > 1. cros_typec_altmode_work() acquires the mutex
> > 2. typec_altmode_vdm() -> dp_altmode_vdm() ->
> > 3. typec_altmode_exit() -> cros_typec_altmode_exit()
> > 4. cros_typec_altmode_exit() attempts to acquire the mutex again
> >
> > This revert is considered safe as no other known driver sends back
> > DP_CMD_STATUS_UPDATE command with the NAK flag.
> >
> > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > ---
> >  drivers/usb/typec/altmodes/displayport.c | 4 ----
> >  1 file changed, 4 deletions(-)
>
> Why isn't this being sent as a separate patch for 6.16-final?  And why
> not put a fixes: line?
>

Hi Greg,

The issue will emerge only after this series is applied, so 6.16
remains secure as this code is not executable.
I will submit it as a separate patch, with the relevant tags included.

Thanks,
Andrei
