Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03B11D54FE;
	Tue, 11 Feb 2025 18:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739297390; cv=none; b=cnWw4j8SgpKGfJX1y7EhZA8miP6S40Sefdrnbvrn+Pj5LlssFqFShwtmHLvZi6c0zMTCSag7xX0iizWL08aRNLbuLwOsYAkK5nihyU+cLpmJTzTrxkWCq1ctYL5PBlMq4mgfLxNNINN0WU94NHS1+hg2m9tyhpUftG3afWF0h+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739297390; c=relaxed/simple;
	bh=ExmzPTj1pzjf8r4g9NpGXJqnaxjrwPjVcOTvwBwtuW8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=TW51TAGoImqa3TVi9p5WhOPTlckhzRulyPzGliW3I6qktRL6wakQMXM0fEFza5pYe4hP46K02hfKYW4+0hZjb93qo+fnZMKgsC4/lyD+1YaGDzRYN3SkTYsbOay55L/EI0ftqtAozWjmU3UCn3Kvxw6BtQFhwFhzNEZDxM+lc5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mJrIf8LP; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mJrIf8LP"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e479e529ebcso4264350276.3;
        Tue, 11 Feb 2025 10:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739297387; x=1739902187; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lP7pCBXVAdfHdq7JWRC4CjyuB8WA8wXJThmwlLAczFI=;
        b=mJrIf8LPD+fBwkEEIRUzt/ie/opDQngky62L2fVrnlmt4IjqIbMEvbUqK+FGNYriN/
         xpJit9P8rAA0uKiGMnvjY0KaOIiewyBlkbtqCmDkbBXgZQXWjiF5Ekj4Bb5VtVeZlgzS
         stCVPkGKWvBENotBaFJZKtaEDDWm1appbxba+tJXgQU7RsYwEm82LBP9Yy3y0GFfdOk4
         ExxHfT+JG1bZJn4+yNsuQHU6yVIzTaMbxexUkJu0wO9b4TJbTxlJPUcShdotqs4yByJc
         nqBR3Al/VO4AePczcBWUrn7F/wjSyll4T51IdBYyPS0zdM/hXiWOpbSaetst6VfThpHw
         Q0UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739297387; x=1739902187;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lP7pCBXVAdfHdq7JWRC4CjyuB8WA8wXJThmwlLAczFI=;
        b=KC5ZXbvkNmNxdPFHKai1YM8f/j33BzA3BBib/l0mxt03pTevpNtpx6xPdbCzkkTYah
         +WgWpDf4WmBVfAhFic8munWjU1S9qDGAxwP7OIp4Gl6ig1aaks9Wva6h9OTnSUc5fXf2
         jajjM7LAF/MMypTEkGdu3eGmPB3eVlrcsD4KnSOno3ZSJB77Z4UdvPdJoAJExNvl/2Cv
         nKVi8tGUqzWnwxiWbXmDZal1k/8Xlu7tD+23Di5CCECf8Vxts9BswzGkyJvBhBLfLUGP
         dwr+it1MtUA+iiHnOCr0OizeVd4C40Q+bMqvH4Qr1T10gUNVM2/IVE+nmWnvq7ktICTF
         ZdKw==
X-Forwarded-Encrypted: i=1; AJvYcCVPNUiFsroURlzus7G1tJ+sUJp9gpifFBNOPDq15oB1XDqv1LMarJXqr6pdd3MAi3loOEuYOke+oBQiCPhFAhQjwONJ1Q==@vger.kernel.org, AJvYcCXeEhhxM72KgMPTk80SGTinXgN4HRJMMoRyfmA62HrlO1cuRr12PXmswTvIIxe5i8ce/eJHVibfJ6WH5R8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrBOCeunkZv5rPLstkDljljl8I+J88Lajtng6XJ/M7jOZocnTv
	c1Guho8T4y1zHbOC2uxs4e/oR4mmaFk7Epm1sWpc6WxhU4754rq4
X-Gm-Gg: ASbGnct/n7nb8Dhpjzs+GwQ/NOtfhd/hhFGwH8AB3gUD+NUot2t/ORxyCr1CzNWSkmQ
	lSicNs9N5OFi0pOB36xfXDXT27uc8YH7P49H84B5lAF+gAqapElEK0SFa5AxzmA9m5+fGFXJ3cu
	U8LDTAmBeG9/WZuJ1K7TVTamjx+tLvRC/ovLPv8scrVeC4w9CsInveuvrSCPqrYFdv2TvQ/nsr1
	fRfVz78kRc+BTYWmSvue1+zAPav1S19R6K3R3t7Mhd04wgZOdSphyXx1rppBEyJF/qm8oVjT2Nc
	WeY+xiEt
X-Google-Smtp-Source: AGHT+IHAZrm0t8YEScmXmbjBL+rsDXloW9wiOe8XlecxEScd4bdHtrt5hYPSbuBnQn5cZhzdJvW/hw==
X-Received: by 2002:a05:6902:723:b0:e5d:92ad:8e75 with SMTP id 3f1490d57ef6-e5d9f0cc9bamr381876276.10.1739297387499;
        Tue, 11 Feb 2025 10:09:47 -0800 (PST)
Received: from localhost ([2800:bf0:61:1288:72d5:e7e1:d832:2e3d])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e5b3a2343c9sm3335231276.34.2025.02.11.10.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 10:09:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Feb 2025 13:09:45 -0500
Message-Id: <D7PTGS79ZMT6.WRYZ7J20YSDU@gmail.com>
Cc: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 <platform-driver-x86@vger.kernel.org>, "Armin Wolf" <W_Armin@gmx.de>,
 "Mario Limonciello" <mario.limonciello@amd.com>, "Hans de Goede"
 <hdegoede@redhat.com>, <Dell.Client.Kernel@dell.com>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 00/14] platform/x86: alienware-wmi driver rework
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250207154610.13675-1-kuurtb@gmail.com>
 <fd4524a6-0b1f-d929-61a5-b1ad188c938a@linux.intel.com>
 <D7OT9WA7NKIG.1HK94X2IR7ZBX@gmail.com>
 <Z6uBtEg7DZtWPn4r@black.fi.intel.com>
In-Reply-To: <Z6uBtEg7DZtWPn4r@black.fi.intel.com>

Hi all,

On Tue Feb 11, 2025 at 11:58 AM -05, Andy Shevchenko wrote:
> On Mon, Feb 10, 2025 at 08:48:05AM -0500, Kurt Borja wrote:
>> On Mon Feb 10, 2025 at 6:53 AM -05, Ilpo J=C3=A4rvinen wrote:
>> > On Fri, 7 Feb 2025, Kurt Borja wrote:
>> >
>> >> One more correction. I apologize for the noise!
>> >
>> > Applied to review-ilpo-next. Thanks.
>>=20
>> Thank you so much for reviewing this, Ilpo :)=20
>
> Please address my concerns in the followup patches.
>
> (Main concern is abuse of objs, others are more like cleanups to improve
>  readability and maintenance)

I agree with most of your coments. Some require additional patches tho,
which is fine but are outside the scope of this series. I still have a
lot of doubts about how to proceed with the Makefile stuff, I don't
understand the root of the problem and a lot of drivers already do this
so I'm a bit confused.

Ilpo, how should we proceed here? I see this series has not hit
linux-next so, is it fine to send a v11 incorporating Andy's comments?
Obviously after understanding the Makefile problems.

Also with all this fixes problems I'm having seconds thoughts about
splitting the file (patch 11). I'd also like to know your opinion on
that, Ilpo.

Thank you again for your review Andy!

--=20
 ~ Kurt
